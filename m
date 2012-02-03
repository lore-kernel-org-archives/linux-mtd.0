Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RtMW6-0000P4-FW
 for linux-mtd@lists.infradead.org; Fri, 03 Feb 2012 17:01:46 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 4/4] mtd: remove R/O checking duplication
Date: Fri,  3 Feb 2012 19:01:31 +0200
Message-Id: <1328288491-8744-4-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1328288491-8744-1-git-send-email-dedekind1@gmail.com>
References: <1328288491-8744-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Many drivers check whether the partition is R/O and return -EROFS if yes.
Let's stop having duplicated checks and move them to the API functions
instead.

And again a bit of noise - deleted few too sparse newlines, sorry.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/chips/map_ram.c |    4 ----
 drivers/mtd/chips/map_rom.c |    3 +--
 drivers/mtd/devices/phram.c |    1 -
 drivers/mtd/mtdconcat.c     |   27 +++------------------------
 drivers/mtd/mtdcore.c       |   10 +++++++++-
 drivers/mtd/mtdpart.c       |   14 +-------------
 drivers/mtd/ubi/gluebi.c    |    8 --------
 include/linux/mtd/mtd.h     |    2 ++
 8 files changed, 16 insertions(+), 53 deletions(-)

diff --git a/drivers/mtd/chips/map_ram.c b/drivers/mtd/chips/map_ram.c
index 2253070..991c2a1 100644
--- a/drivers/mtd/chips/map_ram.c
+++ b/drivers/mtd/chips/map_ram.c
@@ -122,14 +122,10 @@ static int mapram_erase (struct mtd_info *mtd, struct erase_info *instr)
 	unsigned long i;
 
 	allff = map_word_ff(map);
-
 	for (i=0; i<instr->len; i += map_bankwidth(map))
 		map_write(map, allff, instr->addr + i);
-
 	instr->state = MTD_ERASE_DONE;
-
 	mtd_erase_callback(instr);
-
 	return 0;
 }
 
diff --git a/drivers/mtd/chips/map_rom.c b/drivers/mtd/chips/map_rom.c
index facb560..47a43cf 100644
--- a/drivers/mtd/chips/map_rom.c
+++ b/drivers/mtd/chips/map_rom.c
@@ -85,8 +85,7 @@ static void maprom_nop(struct mtd_info *mtd)
 
 static int maprom_write (struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen, const u_char *buf)
 {
-	printk(KERN_NOTICE "maprom_write called\n");
-	return -EIO;
+	return -EROFS;
 }
 
 static int maprom_erase (struct mtd_info *mtd, struct erase_info *info)
diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index 36add7c..d0e8dc6 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -33,7 +33,6 @@ struct phram_mtd_list {
 
 static LIST_HEAD(phram_list);
 
-
 static int phram_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
 	u_char *start = mtd->priv;
diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index 1f20718..dd24232 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -126,9 +126,6 @@ concat_write(struct mtd_info *mtd, loff_t to, size_t len,
 	int err = -EINVAL;
 	int i;
 
-	if (!(mtd->flags & MTD_WRITEABLE))
-		return -EROFS;
-
 	*retlen = 0;
 
 	for (i = 0; i < concat->num_subdev; i++) {
@@ -145,11 +142,7 @@ concat_write(struct mtd_info *mtd, loff_t to, size_t len,
 		else
 			size = len;
 
-		if (!(subdev->flags & MTD_WRITEABLE))
-			err = -EROFS;
-		else
-			err = mtd_write(subdev, to, size, &retsize, buf);
-
+		err = mtd_write(subdev, to, size, &retsize, buf);
 		if (err)
 			break;
 
@@ -176,9 +169,6 @@ concat_writev(struct mtd_info *mtd, const struct kvec *vecs,
 	int i;
 	int err = -EINVAL;
 
-	if (!(mtd->flags & MTD_WRITEABLE))
-		return -EROFS;
-
 	*retlen = 0;
 
 	/* Calculate total length of data */
@@ -220,12 +210,8 @@ concat_writev(struct mtd_info *mtd, const struct kvec *vecs,
 		old_iov_len = vecs_copy[entry_high].iov_len;
 		vecs_copy[entry_high].iov_len = size;
 
-		if (!(subdev->flags & MTD_WRITEABLE))
-			err = -EROFS;
-		else
-			err = mtd_writev(subdev, &vecs_copy[entry_low],
-					 entry_high - entry_low + 1, to,
-					 &retsize);
+		err = mtd_writev(subdev, &vecs_copy[entry_low],
+				 entry_high - entry_low + 1, to, &retsize);
 
 		vecs_copy[entry_high].iov_len = old_iov_len - size;
 		vecs_copy[entry_high].iov_base += size;
@@ -399,9 +385,6 @@ static int concat_erase(struct mtd_info *mtd, struct erase_info *instr)
 	uint64_t length, offset = 0;
 	struct erase_info *erase;
 
-	if (!(mtd->flags & MTD_WRITEABLE))
-		return -EROFS;
-
 	/*
 	 * Check for proper erase block alignment of the to-be-erased area.
 	 * It is easier to do this based on the super device's erase
@@ -489,10 +472,6 @@ static int concat_erase(struct mtd_info *mtd, struct erase_info *instr)
 		else
 			erase->len = length;
 
-		if (!(subdev->flags & MTD_WRITEABLE)) {
-			err = -EROFS;
-			break;
-		}
 		length -= erase->len;
 		if ((err = concat_dev_erase(subdev, erase))) {
 			/* sanity check: should never happen since
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 13bd4fa..78e1df6 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -693,6 +693,8 @@ int mtd_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
 	if (instr->addr > mtd->size || instr->len > mtd->size - instr->addr)
 		return -EINVAL;
+	if (!(mtd->flags & MTD_WRITEABLE))
+		return -EROFS;
 	return mtd->_erase(mtd, instr);
 }
 EXPORT_SYMBOL_GPL(mtd_erase);
@@ -754,7 +756,7 @@ int mtd_write(struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen,
 	      const u_char *buf)
 {
 	*retlen = 0;
-	if (!mtd->_write)
+	if (!mtd->_write || !(mtd->flags & MTD_WRITEABLE))
 		return -EROFS;
 	if (to < 0 || to > mtd->size || len > mtd->size - to)
 		return -EINVAL;
@@ -777,6 +779,8 @@ int mtd_panic_write(struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen,
 		return -EOPNOTSUPP;
 	if (to < 0 || to > mtd->size || len > mtd->size - to)
 		return -EINVAL;
+	if (!(mtd->flags & MTD_WRITEABLE))
+		return -EROFS;
 	return mtd->_panic_write(mtd, to, len, retlen, buf);
 }
 EXPORT_SYMBOL_GPL(mtd_panic_write);
@@ -828,6 +832,8 @@ int mtd_block_markbad(struct mtd_info *mtd, loff_t ofs)
 		return -EOPNOTSUPP;
 	if (ofs < 0 || ofs > mtd->size)
 		return -EINVAL;
+	if (!(mtd->flags & MTD_WRITEABLE))
+		return -EROFS;
 	return mtd->_block_markbad(mtd, ofs);
 }
 EXPORT_SYMBOL_GPL(mtd_block_markbad);
@@ -879,6 +885,8 @@ int mtd_writev(struct mtd_info *mtd, const struct kvec *vecs,
 	       unsigned long count, loff_t to, size_t *retlen)
 {
 	*retlen = 0;
+	if (!(mtd->flags & MTD_WRITEABLE))
+		return -EROFS;
 	if (!mtd->_writev)
 		return default_mtd_writev(mtd, vecs, count, to, retlen);
 	return mtd->_writev(mtd, vecs, count, to, retlen);
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index fbe2c8a..33d32c6 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -172,8 +172,6 @@ static int part_write(struct mtd_info *mtd, loff_t to, size_t len,
 		size_t *retlen, const u_char *buf)
 {
 	struct mtd_part *part = PART(mtd);
-	if (!(mtd->flags & MTD_WRITEABLE))
-		return -EROFS;
 	return mtd_write(part->master, to + part->offset, len, retlen, buf);
 }
 
@@ -181,8 +179,6 @@ static int part_panic_write(struct mtd_info *mtd, loff_t to, size_t len,
 		size_t *retlen, const u_char *buf)
 {
 	struct mtd_part *part = PART(mtd);
-	if (!(mtd->flags & MTD_WRITEABLE))
-		return -EROFS;
 	return mtd_panic_write(part->master, to + part->offset, len, retlen,
 			       buf);
 }
@@ -192,9 +188,6 @@ static int part_write_oob(struct mtd_info *mtd, loff_t to,
 {
 	struct mtd_part *part = PART(mtd);
 
-	if (!(mtd->flags & MTD_WRITEABLE))
-		return -EROFS;
-
 	if (to >= mtd->size)
 		return -EINVAL;
 	if (ops->datbuf && to + ops->len > mtd->size)
@@ -220,8 +213,6 @@ static int part_writev(struct mtd_info *mtd, const struct kvec *vecs,
 		unsigned long count, loff_t to, size_t *retlen)
 {
 	struct mtd_part *part = PART(mtd);
-	if (!(mtd->flags & MTD_WRITEABLE))
-		return -EROFS;
 	return mtd_writev(part->master, vecs, count, to + part->offset,
 			  retlen);
 }
@@ -230,8 +221,7 @@ static int part_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
 	struct mtd_part *part = PART(mtd);
 	int ret;
-	if (!(mtd->flags & MTD_WRITEABLE))
-		return -EROFS;
+
 	instr->addr += part->offset;
 	ret = mtd_erase(part->master, instr);
 	if (ret) {
@@ -304,8 +294,6 @@ static int part_block_markbad(struct mtd_info *mtd, loff_t ofs)
 	struct mtd_part *part = PART(mtd);
 	int res;
 
-	if (!(mtd->flags & MTD_WRITEABLE))
-		return -EROFS;
 	ofs += part->offset;
 	res = mtd_block_markbad(part->master, ofs);
 	if (!res)
diff --git a/drivers/mtd/ubi/gluebi.c b/drivers/mtd/ubi/gluebi.c
index b875c2c..90b9882 100644
--- a/drivers/mtd/ubi/gluebi.c
+++ b/drivers/mtd/ubi/gluebi.c
@@ -215,10 +215,6 @@ static int gluebi_write(struct mtd_info *mtd, loff_t to, size_t len,
 	struct gluebi_device *gluebi;
 
 	gluebi = container_of(mtd, struct gluebi_device, mtd);
-
-	if (!(mtd->flags & MTD_WRITEABLE))
-		return -EROFS;
-
 	lnum = div_u64_rem(to, mtd->erasesize, &offs);
 
 	if (len % mtd->writesize || offs % mtd->writesize)
@@ -263,12 +259,8 @@ static int gluebi_erase(struct mtd_info *mtd, struct erase_info *instr)
 
 	lnum = mtd_div_by_eb(instr->addr, mtd);
 	count = mtd_div_by_eb(instr->len, mtd);
-
 	gluebi = container_of(mtd, struct gluebi_device, mtd);
 
-	if (!(mtd->flags & MTD_WRITEABLE))
-		return -EROFS;
-
 	for (i = 0; i < count - 1; i++) {
 		err = ubi_leb_unmap(gluebi->desc, lnum + i);
 		if (err)
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 317a80c..fa20a8f 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -268,6 +268,8 @@ static inline int mtd_write_oob(struct mtd_info *mtd, loff_t to,
 	ops->retlen = ops->oobretlen = 0;
 	if (!mtd->_write_oob)
 		return -EOPNOTSUPP;
+	if (!(mtd->flags & MTD_WRITEABLE))
+		return -EROFS;
 	return mtd->_write_oob(mtd, to, ops);
 }
 
-- 
1.7.9
