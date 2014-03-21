Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQy5q-0002Im-O4
 for linux-mtd@lists.infradead.org; Fri, 21 Mar 2014 11:58:42 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 3/4] mtd: Introduce mtd_block_isreserved()
Date: Fri, 21 Mar 2014 08:57:43 -0300
Message-Id: <1395403064-28113-4-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1395403064-28113-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1395403064-28113-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In addition to mtd_block_isbad(), which checks if a block is bad or reserved,
it's needed to check if a block is reserved only (but not bad). This commit
adds an MTD interface for it, in a similar fashion to mtd_block_isbad().

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/mtdcore.c        | 10 ++++++++++
 drivers/mtd/mtdpart.c        |  9 +++++++++
 drivers/mtd/nand/nand_base.c |  1 +
 drivers/mtd/nand/nand_bbt.c  | 14 ++++++++++++++
 include/linux/mtd/mtd.h      |  2 ++
 include/linux/mtd/nand.h     |  1 +
 6 files changed, 37 insertions(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index c5e9943..d65c5dc 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1012,6 +1012,16 @@ int mtd_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 }
 EXPORT_SYMBOL_GPL(mtd_is_locked);
 
+int mtd_block_isreserved(struct mtd_info *mtd, loff_t ofs)
+{
+	if (!mtd->_block_isreserved)
+		return 0;
+	if (ofs < 0 || ofs > mtd->size)
+		return -EINVAL;
+	return mtd->_block_isreserved(mtd, ofs);
+}
+EXPORT_SYMBOL_GPL(mtd_block_isreserved);
+
 int mtd_block_isbad(struct mtd_info *mtd, loff_t ofs)
 {
 	if (!mtd->_block_isbad)
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 1ca9aec..921e8c6 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -290,6 +290,13 @@ static void part_resume(struct mtd_info *mtd)
 	part->master->_resume(part->master);
 }
 
+static int part_block_isreserved(struct mtd_info *mtd, loff_t ofs)
+{
+	struct mtd_part *part = PART(mtd);
+	ofs += part->offset;
+	return part->master->_block_isreserved(part->master, ofs);
+}
+
 static int part_block_isbad(struct mtd_info *mtd, loff_t ofs)
 {
 	struct mtd_part *part = PART(mtd);
@@ -422,6 +429,8 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
 		slave->mtd._unlock = part_unlock;
 	if (master->_is_locked)
 		slave->mtd._is_locked = part_is_locked;
+	if (master->_block_isreserved)
+		slave->mtd._block_isreserved = part_block_isreserved;
 	if (master->_block_isbad)
 		slave->mtd._block_isbad = part_block_isbad;
 	if (master->_block_markbad)
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 5826da3..58f5884 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -4044,6 +4044,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 	mtd->_unlock = NULL;
 	mtd->_suspend = nand_suspend;
 	mtd->_resume = nand_resume;
+	mtd->_block_isreserved = nand_isreserved_bbt;
 	mtd->_block_isbad = nand_block_isbad;
 	mtd->_block_markbad = nand_block_markbad;
 	mtd->writebufsize = mtd->writesize;
diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index ea9a266..fd21169 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -1312,6 +1312,20 @@ int nand_default_bbt(struct mtd_info *mtd)
 }
 
 /**
+ * nand_isreserved_bbt - [NAND Interface] Check if a block is reserved
+ * @mtd: MTD device structure
+ * @offs: offset in the device
+ */
+int nand_isreserved_bbt(struct mtd_info *mtd, loff_t offs)
+{
+	struct nand_chip *this = mtd->priv;
+	int block;
+
+	block = (int)(offs >> this->bbt_erase_shift);
+	return bbt_get_entry(this, block) == BBT_BLOCK_RESERVED;
+}
+
+/**
  * nand_isbad_bbt - [NAND Interface] Check if a block is bad
  * @mtd: MTD device structure
  * @offs: offset in the device
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index a1b0b4c..031ff3a 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -222,6 +222,7 @@ struct mtd_info {
 	int (*_lock) (struct mtd_info *mtd, loff_t ofs, uint64_t len);
 	int (*_unlock) (struct mtd_info *mtd, loff_t ofs, uint64_t len);
 	int (*_is_locked) (struct mtd_info *mtd, loff_t ofs, uint64_t len);
+	int (*_block_isreserved) (struct mtd_info *mtd, loff_t ofs);
 	int (*_block_isbad) (struct mtd_info *mtd, loff_t ofs);
 	int (*_block_markbad) (struct mtd_info *mtd, loff_t ofs);
 	int (*_suspend) (struct mtd_info *mtd);
@@ -302,6 +303,7 @@ static inline void mtd_sync(struct mtd_info *mtd)
 int mtd_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
 int mtd_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
 int mtd_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len);
+int mtd_block_isreserved(struct mtd_info *mtd, loff_t ofs);
 int mtd_block_isbad(struct mtd_info *mtd, loff_t ofs);
 int mtd_block_markbad(struct mtd_info *mtd, loff_t ofs);
 
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 0747fef..3b78c6b 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -806,6 +806,7 @@ extern struct nand_manufacturers nand_manuf_ids[];
 extern int nand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd);
 extern int nand_default_bbt(struct mtd_info *mtd);
 extern int nand_markbad_bbt(struct mtd_info *mtd, loff_t offs);
+extern int nand_isreserved_bbt(struct mtd_info *mtd, loff_t offs);
 extern int nand_isbad_bbt(struct mtd_info *mtd, loff_t offs, int allowbbt);
 extern int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 			   int allowbbt);
-- 
1.9.0
