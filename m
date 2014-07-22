Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9PTq-0006cm-4p
 for linux-mtd@lists.infradead.org; Tue, 22 Jul 2014 02:07:02 +0000
Received: by mail-pa0-f45.google.com with SMTP id eu11so10950202pac.18
 for <linux-mtd@lists.infradead.org>; Mon, 21 Jul 2014 19:06:39 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: correct upper bounds check for mtd_*() APIs
Date: Mon, 21 Jul 2014 19:06:27 -0700
Message-Id: <1405994787-19254-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When checking the upper boundary (i.e., whether an address is higher
than the maximum size of the MTD), we should be doing an inclusive check
(greater or equal). For instance, an address of 16MB (0x1000000) on a
16MB device is invalid.

The strengthening of this bounds check is redundant for those which
already have a address+length check and ensure that the length is
non-zero, but let's just fix them all, for completeness.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/mtdcore.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index fe073b92c310..4c611871d7e6 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -775,7 +775,7 @@ EXPORT_SYMBOL_GPL(__put_mtd_device);
  */
 int mtd_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
-	if (instr->addr > mtd->size || instr->len > mtd->size - instr->addr)
+	if (instr->addr >= mtd->size || instr->len > mtd->size - instr->addr)
 		return -EINVAL;
 	if (!(mtd->flags & MTD_WRITEABLE))
 		return -EROFS;
@@ -801,7 +801,7 @@ int mtd_point(struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen,
 		*phys = 0;
 	if (!mtd->_point)
 		return -EOPNOTSUPP;
-	if (from < 0 || from > mtd->size || len > mtd->size - from)
+	if (from < 0 || from >= mtd->size || len > mtd->size - from)
 		return -EINVAL;
 	if (!len)
 		return 0;
@@ -814,7 +814,7 @@ int mtd_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
 {
 	if (!mtd->_point)
 		return -EOPNOTSUPP;
-	if (from < 0 || from > mtd->size || len > mtd->size - from)
+	if (from < 0 || from >= mtd->size || len > mtd->size - from)
 		return -EINVAL;
 	if (!len)
 		return 0;
@@ -832,7 +832,7 @@ unsigned long mtd_get_unmapped_area(struct mtd_info *mtd, unsigned long len,
 {
 	if (!mtd->_get_unmapped_area)
 		return -EOPNOTSUPP;
-	if (offset > mtd->size || len > mtd->size - offset)
+	if (offset >= mtd->size || len > mtd->size - offset)
 		return -EINVAL;
 	return mtd->_get_unmapped_area(mtd, len, offset, flags);
 }
@@ -843,7 +843,7 @@ int mtd_read(struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen,
 {
 	int ret_code;
 	*retlen = 0;
-	if (from < 0 || from > mtd->size || len > mtd->size - from)
+	if (from < 0 || from >= mtd->size || len > mtd->size - from)
 		return -EINVAL;
 	if (!len)
 		return 0;
@@ -866,7 +866,7 @@ int mtd_write(struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen,
 	      const u_char *buf)
 {
 	*retlen = 0;
-	if (to < 0 || to > mtd->size || len > mtd->size - to)
+	if (to < 0 || to >= mtd->size || len > mtd->size - to)
 		return -EINVAL;
 	if (!mtd->_write || !(mtd->flags & MTD_WRITEABLE))
 		return -EROFS;
@@ -889,7 +889,7 @@ int mtd_panic_write(struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen,
 	*retlen = 0;
 	if (!mtd->_panic_write)
 		return -EOPNOTSUPP;
-	if (to < 0 || to > mtd->size || len > mtd->size - to)
+	if (to < 0 || to >= mtd->size || len > mtd->size - to)
 		return -EINVAL;
 	if (!(mtd->flags & MTD_WRITEABLE))
 		return -EROFS;
@@ -1008,7 +1008,7 @@ int mtd_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 {
 	if (!mtd->_lock)
 		return -EOPNOTSUPP;
-	if (ofs < 0 || ofs > mtd->size || len > mtd->size - ofs)
+	if (ofs < 0 || ofs >= mtd->size || len > mtd->size - ofs)
 		return -EINVAL;
 	if (!len)
 		return 0;
@@ -1020,7 +1020,7 @@ int mtd_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 {
 	if (!mtd->_unlock)
 		return -EOPNOTSUPP;
-	if (ofs < 0 || ofs > mtd->size || len > mtd->size - ofs)
+	if (ofs < 0 || ofs >= mtd->size || len > mtd->size - ofs)
 		return -EINVAL;
 	if (!len)
 		return 0;
@@ -1032,7 +1032,7 @@ int mtd_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 {
 	if (!mtd->_is_locked)
 		return -EOPNOTSUPP;
-	if (ofs < 0 || ofs > mtd->size || len > mtd->size - ofs)
+	if (ofs < 0 || ofs >= mtd->size || len > mtd->size - ofs)
 		return -EINVAL;
 	if (!len)
 		return 0;
@@ -1042,7 +1042,7 @@ EXPORT_SYMBOL_GPL(mtd_is_locked);
 
 int mtd_block_isreserved(struct mtd_info *mtd, loff_t ofs)
 {
-	if (ofs < 0 || ofs > mtd->size)
+	if (ofs < 0 || ofs >= mtd->size)
 		return -EINVAL;
 	if (!mtd->_block_isreserved)
 		return 0;
@@ -1052,7 +1052,7 @@ EXPORT_SYMBOL_GPL(mtd_block_isreserved);
 
 int mtd_block_isbad(struct mtd_info *mtd, loff_t ofs)
 {
-	if (ofs < 0 || ofs > mtd->size)
+	if (ofs < 0 || ofs >= mtd->size)
 		return -EINVAL;
 	if (!mtd->_block_isbad)
 		return 0;
@@ -1064,7 +1064,7 @@ int mtd_block_markbad(struct mtd_info *mtd, loff_t ofs)
 {
 	if (!mtd->_block_markbad)
 		return -EOPNOTSUPP;
-	if (ofs < 0 || ofs > mtd->size)
+	if (ofs < 0 || ofs >= mtd->size)
 		return -EINVAL;
 	if (!(mtd->flags & MTD_WRITEABLE))
 		return -EROFS;
-- 
1.9.1
