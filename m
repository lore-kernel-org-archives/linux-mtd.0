Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Re9Zs-0005Ho-7F
 for linux-mtd@lists.infradead.org; Fri, 23 Dec 2011 18:10:50 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 10/28] mtd: introduce mtd_read_oob interface
Date: Fri, 23 Dec 2011 20:11:02 +0200
Message-Id: <1324663880-22477-11-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1324663880-22477-1-git-send-email-dedekind1@gmail.com>
References: <1324663880-22477-1-git-send-email-dedekind1@gmail.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Mike Dunn <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/inftlcore.c           |    2 +-
 drivers/mtd/mtdchar.c             |    4 ++--
 drivers/mtd/mtdconcat.c           |    2 +-
 drivers/mtd/mtdpart.c             |    2 +-
 drivers/mtd/mtdswap.c             |    4 ++--
 drivers/mtd/nand/nand_bbt.c       |    6 +++---
 drivers/mtd/nftlcore.c            |    2 +-
 drivers/mtd/sm_ftl.c              |    2 +-
 drivers/mtd/ssfdc.c               |    2 +-
 drivers/mtd/tests/mtd_oobtest.c   |   14 +++++++-------
 drivers/mtd/tests/mtd_readtest.c  |    2 +-
 drivers/staging/spectra/lld_mtd.c |   12 ++++++------
 fs/jffs2/wbuf.c                   |    4 ++--
 include/linux/mtd/mtd.h           |   10 ++++++++--
 14 files changed, 37 insertions(+), 31 deletions(-)

diff --git a/drivers/mtd/inftlcore.c b/drivers/mtd/inftlcore.c
index 0b038be..07646e1 100644
--- a/drivers/mtd/inftlcore.c
+++ b/drivers/mtd/inftlcore.c
@@ -158,7 +158,7 @@ int inftl_read_oob(struct mtd_info *mtd, loff_t offs, size_t len,
 	ops.oobbuf = buf;
 	ops.datbuf = NULL;
 
-	res = mtd->read_oob(mtd, offs & ~(mtd->writesize - 1), &ops);
+	res = mtd_read_oob(mtd, offs & ~(mtd->writesize - 1), &ops);
 	*retlen = ops.oobretlen;
 	return res;
 }
diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index c7f4846..daccfb1 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -227,7 +227,7 @@ static ssize_t mtdchar_read(struct file *file, char __user *buf, size_t count,
 			ops.oobbuf = NULL;
 			ops.len = len;
 
-			ret = mtd->read_oob(mtd, *ppos, &ops);
+			ret = mtd_read_oob(mtd, *ppos, &ops);
 			retlen = ops.retlen;
 			break;
 		}
@@ -471,7 +471,7 @@ static int mtdchar_readoob(struct file *file, struct mtd_info *mtd,
 		return -ENOMEM;
 
 	start &= ~((uint64_t)mtd->writesize - 1);
-	ret = mtd->read_oob(mtd, start, &ops);
+	ret = mtd_read_oob(mtd, start, &ops);
 
 	if (put_user(ops.oobretlen, retp))
 		ret = -EFAULT;
diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index 4521550..cf35642 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -273,7 +273,7 @@ concat_read_oob(struct mtd_info *mtd, loff_t from, struct mtd_oob_ops *ops)
 		if (from + devops.len > subdev->size)
 			devops.len = subdev->size - from;
 
-		err = subdev->read_oob(subdev, from, &devops);
+		err = mtd_read_oob(subdev, from, &devops);
 		ops->retlen += devops.retlen;
 		ops->oobretlen += devops.oobretlen;
 
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 9ed58f7..6fdc74e 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -138,7 +138,7 @@ static int part_read_oob(struct mtd_info *mtd, loff_t from,
 			return -EINVAL;
 	}
 
-	res = part->master->read_oob(part->master, from + part->offset, ops);
+	res = mtd_read_oob(part->master, from + part->offset, ops);
 	if (unlikely(res)) {
 		if (mtd_is_bitflip(res))
 			mtd->ecc_stats.corrected++;
diff --git a/drivers/mtd/mtdswap.c b/drivers/mtd/mtdswap.c
index 6ff823e..0f0ab18 100644
--- a/drivers/mtd/mtdswap.c
+++ b/drivers/mtd/mtdswap.c
@@ -312,7 +312,7 @@ static int mtdswap_handle_write_error(struct mtdswap_dev *d, struct swap_eb *eb)
 static int mtdswap_read_oob(struct mtdswap_dev *d, loff_t from,
 			struct mtd_oob_ops *ops)
 {
-	int ret = d->mtd->read_oob(d->mtd, from, ops);
+	int ret = mtd_read_oob(d->mtd, from, ops);
 
 	if (mtd_is_bitflip(ret))
 		return ret;
@@ -955,7 +955,7 @@ static unsigned int mtdswap_eblk_passes(struct mtdswap_dev *d,
 
 		pos = base;
 		for (i = 0; i < mtd_pages; i++) {
-			ret = mtd->read_oob(mtd, pos, &ops);
+			ret = mtd_read_oob(mtd, pos, &ops);
 			if (ret)
 				goto error;
 
diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 1bcd6bc..fcab50e 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -317,7 +317,7 @@ static int scan_read_raw_oob(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
 		ops.len = min(len, (size_t)mtd->writesize);
 		ops.oobbuf = buf + ops.len;
 
-		res = mtd->read_oob(mtd, offs, &ops);
+		res = mtd_read_oob(mtd, offs, &ops);
 
 		if (res)
 			return res;
@@ -434,7 +434,7 @@ static int scan_block_fast(struct mtd_info *mtd, struct nand_bbt_descr *bd,
 		 * Read the full oob until read_oob is fixed to handle single
 		 * byte reads for 16 bit buswidth.
 		 */
-		ret = mtd->read_oob(mtd, offs, &ops);
+		ret = mtd_read_oob(mtd, offs, &ops);
 		/* Ignore ECC errors when checking for BBM */
 		if (ret && !mtd_is_bitflip_or_eccerr(ret))
 			return ret;
@@ -769,7 +769,7 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 			/* Read oob data */
 			ops.ooblen = (len >> this->page_shift) * mtd->oobsize;
 			ops.oobbuf = &buf[len];
-			res = mtd->read_oob(mtd, to + mtd->writesize, &ops);
+			res = mtd_read_oob(mtd, to + mtd->writesize, &ops);
 			if (res < 0 || ops.oobretlen != ops.ooblen)
 				goto outerr;
 
diff --git a/drivers/mtd/nftlcore.c b/drivers/mtd/nftlcore.c
index 1a9d9c1..7497f5e 100644
--- a/drivers/mtd/nftlcore.c
+++ b/drivers/mtd/nftlcore.c
@@ -153,7 +153,7 @@ int nftl_read_oob(struct mtd_info *mtd, loff_t offs, size_t len,
 	ops.oobbuf = buf;
 	ops.datbuf = NULL;
 
-	res = mtd->read_oob(mtd, offs & ~mask, &ops);
+	res = mtd_read_oob(mtd, offs & ~mask, &ops);
 	*retlen = ops.oobretlen;
 	return res;
 }
diff --git a/drivers/mtd/sm_ftl.c b/drivers/mtd/sm_ftl.c
index 2f1acb1..748aa44 100644
--- a/drivers/mtd/sm_ftl.c
+++ b/drivers/mtd/sm_ftl.c
@@ -278,7 +278,7 @@ again:
 
 	/* Unfortunately, oob read will _always_ succeed,
 		despite card removal..... */
-	ret = mtd->read_oob(mtd, sm_mkoffset(ftl, zone, block, boffset), &ops);
+	ret = mtd_read_oob(mtd, sm_mkoffset(ftl, zone, block, boffset), &ops);
 
 	/* Test for unknown errors */
 	if (ret != 0 && !mtd_is_bitflip_or_eccerr(ret)) {
diff --git a/drivers/mtd/ssfdc.c b/drivers/mtd/ssfdc.c
index 293e22a..0e68813 100644
--- a/drivers/mtd/ssfdc.c
+++ b/drivers/mtd/ssfdc.c
@@ -175,7 +175,7 @@ static int read_raw_oob(struct mtd_info *mtd, loff_t offs, uint8_t *buf)
 	ops.oobbuf = buf;
 	ops.datbuf = NULL;
 
-	ret = mtd->read_oob(mtd, offs, &ops);
+	ret = mtd_read_oob(mtd, offs, &ops);
 	if (ret < 0 || ops.oobretlen != OOB_SIZE)
 		return -1;
 
diff --git a/drivers/mtd/tests/mtd_oobtest.c b/drivers/mtd/tests/mtd_oobtest.c
index 7d52854..962d27a 100644
--- a/drivers/mtd/tests/mtd_oobtest.c
+++ b/drivers/mtd/tests/mtd_oobtest.c
@@ -192,7 +192,7 @@ static int verify_eraseblock(int ebnum)
 		ops.ooboffs   = use_offset;
 		ops.datbuf    = NULL;
 		ops.oobbuf    = readbuf;
-		err = mtd->read_oob(mtd, addr, &ops);
+		err = mtd_read_oob(mtd, addr, &ops);
 		if (err || ops.oobretlen != use_len) {
 			printk(PRINT_PREF "error: readoob failed at %#llx\n",
 			       (long long)addr);
@@ -219,7 +219,7 @@ static int verify_eraseblock(int ebnum)
 			ops.ooboffs   = 0;
 			ops.datbuf    = NULL;
 			ops.oobbuf    = readbuf;
-			err = mtd->read_oob(mtd, addr, &ops);
+			err = mtd_read_oob(mtd, addr, &ops);
 			if (err || ops.oobretlen != mtd->ecclayout->oobavail) {
 				printk(PRINT_PREF "error: readoob failed at "
 				       "%#llx\n", (long long)addr);
@@ -284,7 +284,7 @@ static int verify_eraseblock_in_one_go(int ebnum)
 	ops.ooboffs   = 0;
 	ops.datbuf    = NULL;
 	ops.oobbuf    = readbuf;
-	err = mtd->read_oob(mtd, addr, &ops);
+	err = mtd_read_oob(mtd, addr, &ops);
 	if (err || ops.oobretlen != len) {
 		printk(PRINT_PREF "error: readoob failed at %#llx\n",
 		       (long long)addr);
@@ -544,7 +544,7 @@ static int __init mtd_oobtest_init(void)
 	ops.oobbuf    = readbuf;
 	printk(PRINT_PREF "attempting to start read past end of OOB\n");
 	printk(PRINT_PREF "an error is expected...\n");
-	err = mtd->read_oob(mtd, addr0, &ops);
+	err = mtd_read_oob(mtd, addr0, &ops);
 	if (err) {
 		printk(PRINT_PREF "error occurred as expected\n");
 		err = 0;
@@ -588,7 +588,7 @@ static int __init mtd_oobtest_init(void)
 		ops.oobbuf    = readbuf;
 		printk(PRINT_PREF "attempting to read past end of device\n");
 		printk(PRINT_PREF "an error is expected...\n");
-		err = mtd->read_oob(mtd, mtd->size - mtd->writesize, &ops);
+		err = mtd_read_oob(mtd, mtd->size - mtd->writesize, &ops);
 		if (err) {
 			printk(PRINT_PREF "error occurred as expected\n");
 			err = 0;
@@ -632,7 +632,7 @@ static int __init mtd_oobtest_init(void)
 		ops.oobbuf    = readbuf;
 		printk(PRINT_PREF "attempting to read past end of device\n");
 		printk(PRINT_PREF "an error is expected...\n");
-		err = mtd->read_oob(mtd, mtd->size - mtd->writesize, &ops);
+		err = mtd_read_oob(mtd, mtd->size - mtd->writesize, &ops);
 		if (err) {
 			printk(PRINT_PREF "error occurred as expected\n");
 			err = 0;
@@ -698,7 +698,7 @@ static int __init mtd_oobtest_init(void)
 		ops.ooboffs   = 0;
 		ops.datbuf    = NULL;
 		ops.oobbuf    = readbuf;
-		err = mtd->read_oob(mtd, addr, &ops);
+		err = mtd_read_oob(mtd, addr, &ops);
 		if (err)
 			goto out;
 		if (memcmp(readbuf, writebuf, mtd->ecclayout->oobavail * 2)) {
diff --git a/drivers/mtd/tests/mtd_readtest.c b/drivers/mtd/tests/mtd_readtest.c
index 0c58d29..5eaeada 100644
--- a/drivers/mtd/tests/mtd_readtest.c
+++ b/drivers/mtd/tests/mtd_readtest.c
@@ -74,7 +74,7 @@ static int read_eraseblock_by_page(int ebnum)
 			ops.ooboffs   = 0;
 			ops.datbuf    = NULL;
 			ops.oobbuf    = oobbuf;
-			ret = mtd->read_oob(mtd, addr, &ops);
+			ret = mtd_read_oob(mtd, addr, &ops);
 			if ((ret && !mtd_is_bitflip(ret)) ||
 					ops.oobretlen != mtd->oobsize) {
 				printk(PRINT_PREF "error: read oob failed at "
diff --git a/drivers/staging/spectra/lld_mtd.c b/drivers/staging/spectra/lld_mtd.c
index 2eb0321..ed8e5f0 100644
--- a/drivers/staging/spectra/lld_mtd.c
+++ b/drivers/staging/spectra/lld_mtd.c
@@ -351,9 +351,9 @@ u16 mtd_Read_Page_Main_Spare(u8 *read_data, u32 Block,
 		ops.ooblen = BTSIG_BYTES;
 		ops.ooboffs = 0;
 
-		ret = spectra_mtd->read_oob(spectra_mtd,
-					    (Block * spectra_mtd->erasesize) + (Page * spectra_mtd->writesize),
-					    &ops);
+		ret = mtd_read_oob(spectra_mtd,
+				   (Block * spectra_mtd->erasesize) + (Page * spectra_mtd->writesize),
+				   &ops);
 		if (ret) {
 			printk(KERN_ERR "%s failed %d\n", __func__, ret);
 			return FAIL;
@@ -484,9 +484,9 @@ u16 mtd_Read_Page_Spare(u8 *read_data, u32 Block,
 		ops.ooblen = BTSIG_BYTES;
 		ops.ooboffs = 0;
 
-		ret = spectra_mtd->read_oob(spectra_mtd,
-					    (Block * spectra_mtd->erasesize) + (Page * spectra_mtd->writesize),
-					    &ops);
+		ret = mtd_read_oob(spectra_mtd,
+				   (Block * spectra_mtd->erasesize) + (Page * spectra_mtd->writesize),
+				   &ops);
 		if (ret) {
 			printk(KERN_ERR "%s failed %d\n", __func__, ret);
 			return FAIL;
diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
index 3ea2f8d..efc0cb3 100644
--- a/fs/jffs2/wbuf.c
+++ b/fs/jffs2/wbuf.c
@@ -1032,7 +1032,7 @@ int jffs2_check_oob_empty(struct jffs2_sb_info *c,
 	ops.len = ops.ooboffs = ops.retlen = ops.oobretlen = 0;
 	ops.datbuf = NULL;
 
-	ret = c->mtd->read_oob(c->mtd, jeb->offset, &ops);
+	ret = mtd_read_oob(c->mtd, jeb->offset, &ops);
 	if (ret || ops.oobretlen != ops.ooblen) {
 		printk(KERN_ERR "cannot read OOB for EB at %08x, requested %zd"
 				" bytes, read %zd bytes, error %d\n",
@@ -1075,7 +1075,7 @@ int jffs2_check_nand_cleanmarker(struct jffs2_sb_info *c,
 	ops.len = ops.ooboffs = ops.retlen = ops.oobretlen = 0;
 	ops.datbuf = NULL;
 
-	ret = c->mtd->read_oob(c->mtd, jeb->offset, &ops);
+	ret = mtd_read_oob(c->mtd, jeb->offset, &ops);
 	if (ret || ops.oobretlen != ops.ooblen) {
 		printk(KERN_ERR "cannot read OOB for EB at %08x, requested %zd"
 				" bytes, read %zd bytes, error %d\n",
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 2fb83cd3..0db8d87 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -188,6 +188,8 @@ struct mtd_info {
 		      size_t *retlen, const u_char *buf);
 	int (*panic_write) (struct mtd_info *mtd, loff_t to, size_t len,
 			    size_t *retlen, const u_char *buf);
+	int (*read_oob) (struct mtd_info *mtd, loff_t from,
+			 struct mtd_oob_ops *ops);
 
 	/* Backing device capabilities for this device
 	 * - provides mmap capabilities
@@ -195,8 +197,6 @@ struct mtd_info {
 	struct backing_dev_info *backing_dev_info;
 
 
-	int (*read_oob) (struct mtd_info *mtd, loff_t from,
-			 struct mtd_oob_ops *ops);
 	int (*write_oob) (struct mtd_info *mtd, loff_t to,
 			 struct mtd_oob_ops *ops);
 
@@ -320,6 +320,12 @@ static inline int mtd_panic_write(struct mtd_info *mtd, loff_t to, size_t len,
 	return mtd->panic_write(mtd, to, len, retlen, buf);
 }
 
+static inline int mtd_read_oob(struct mtd_info *mtd, loff_t from,
+			       struct mtd_oob_ops *ops)
+{
+	return mtd->read_oob(mtd, from, ops);
+}
+
 static inline struct mtd_info *dev_to_mtd(struct device *dev)
 {
 	return dev ? dev_get_drvdata(dev) : NULL;
-- 
1.7.7.3
