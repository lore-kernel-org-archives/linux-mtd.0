Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzcNn-000155-O3
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2015 03:29:08 +0000
Received: by pabfh17 with SMTP id fh17so105187973pab.0
 for <linux-mtd@lists.infradead.org>; Thu, 19 Nov 2015 19:28:46 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH] mtd: partitions: turn PART() macro into inline function
Date: Thu, 19 Nov 2015 19:28:39 -0800
Message-Id: <1447990119-128216-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We can guard against reorganization of struct mtd_part by using
container_of(). We can also make sure we're using the right pointer
types by making this a static inline function instead of a macro.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/mtdpart.c | 63 +++++++++++++++++++++++++++------------------------
 1 file changed, 33 insertions(+), 30 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 5146c4e71a47..f59b23d9cf85 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -48,9 +48,12 @@ struct mtd_part {
 
 /*
  * Given a pointer to the MTD object in the mtd_part structure, we can retrieve
- * the pointer to that structure with this macro.
+ * the pointer to that structure.
  */
-#define PART(x)  ((struct mtd_part *)(x))
+static inline struct mtd_part *mtd_to_part(const struct mtd_info *mtd)
+{
+	return container_of(mtd, struct mtd_part, mtd);
+}
 
 
 /*
@@ -61,7 +64,7 @@ struct mtd_part {
 static int part_read(struct mtd_info *mtd, loff_t from, size_t len,
 		size_t *retlen, u_char *buf)
 {
-	struct mtd_part *part = PART(mtd);
+	struct mtd_part *part = mtd_to_part(mtd);
 	struct mtd_ecc_stats stats;
 	int res;
 
@@ -80,7 +83,7 @@ static int part_read(struct mtd_info *mtd, loff_t from, size_t len,
 static int part_point(struct mtd_info *mtd, loff_t from, size_t len,
 		size_t *retlen, void **virt, resource_size_t *phys)
 {
-	struct mtd_part *part = PART(mtd);
+	struct mtd_part *part = mtd_to_part(mtd);
 
 	return part->master->_point(part->master, from + part->offset, len,
 				    retlen, virt, phys);
@@ -88,7 +91,7 @@ static int part_point(struct mtd_info *mtd, loff_t from, size_t len,
 
 static int part_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
 {
-	struct mtd_part *part = PART(mtd);
+	struct mtd_part *part = mtd_to_part(mtd);
 
 	return part->master->_unpoint(part->master, from + part->offset, len);
 }
@@ -98,7 +101,7 @@ static unsigned long part_get_unmapped_area(struct mtd_info *mtd,
 					    unsigned long offset,
 					    unsigned long flags)
 {
-	struct mtd_part *part = PART(mtd);
+	struct mtd_part *part = mtd_to_part(mtd);
 
 	offset += part->offset;
 	return part->master->_get_unmapped_area(part->master, len, offset,
@@ -108,7 +111,7 @@ static unsigned long part_get_unmapped_area(struct mtd_info *mtd,
 static int part_read_oob(struct mtd_info *mtd, loff_t from,
 		struct mtd_oob_ops *ops)
 {
-	struct mtd_part *part = PART(mtd);
+	struct mtd_part *part = mtd_to_part(mtd);
 	int res;
 
 	if (from >= mtd->size)
@@ -146,7 +149,7 @@ static int part_read_oob(struct mtd_info *mtd, loff_t from,
 static int part_read_user_prot_reg(struct mtd_info *mtd, loff_t from,
 		size_t len, size_t *retlen, u_char *buf)
 {
-	struct mtd_part *part = PART(mtd);
+	struct mtd_part *part = mtd_to_part(mtd);
 	return part->master->_read_user_prot_reg(part->master, from, len,
 						 retlen, buf);
 }
@@ -154,7 +157,7 @@ static int part_read_user_prot_reg(struct mtd_info *mtd, loff_t from,
 static int part_get_user_prot_info(struct mtd_info *mtd, size_t len,
 				   size_t *retlen, struct otp_info *buf)
 {
-	struct mtd_part *part = PART(mtd);
+	struct mtd_part *part = mtd_to_part(mtd);
 	return part->master->_get_user_prot_info(part->master, len, retlen,
 						 buf);
 }
@@ -162,7 +165,7 @@ static int part_get_user_prot_info(struct mtd_info *mtd, size_t len,
 static int part_read_fact_prot_reg(struct mtd_info *mtd, loff_t from,
 		size_t len, size_t *retlen, u_char *buf)
 {
-	struct mtd_part *part = PART(mtd);
+	struct mtd_part *part = mtd_to_part(mtd);
 	return part->master->_read_fact_prot_reg(part->master, from, len,
 						 retlen, buf);
 }
@@ -170,7 +173,7 @@ static int part_read_fact_prot_reg(struct mtd_info *mtd, loff_t from,
 static int part_get_fact_prot_info(struct mtd_info *mtd, size_t len,
 				   size_t *retlen, struct otp_info *buf)
 {
-	struct mtd_part *part = PART(mtd);
+	struct mtd_part *part = mtd_to_part(mtd);
 	return part->master->_get_fact_prot_info(part->master, len, retlen,
 						 buf);
 }
@@ -178,7 +181,7 @@ static int part_get_fact_prot_info(struct mtd_info *mtd, size_t len,
 static int part_write(struct mtd_info *mtd, loff_t to, size_t len,
 		size_t *retlen, const u_char *buf)
 {
-	struct mtd_part *part = PART(mtd);
+	struct mtd_part *part = mtd_to_part(mtd);
 	return part->master->_write(part->master, to + part->offset, len,
 				    retlen, buf);
 }
@@ -186,7 +189,7 @@ static int part_write(struct mtd_info *mtd, loff_t to, size_t len,
 static int part_panic_write(struct mtd_info *mtd, loff_t to, size_t len,
 		size_t *retlen, const u_char *buf)
 {
-	struct mtd_part *part = PART(mtd);
+	struct mtd_part *part = mtd_to_part(mtd);
 	return part->master->_panic_write(part->master, to + part->offset, len,
 					  retlen, buf);
 }
@@ -194,7 +197,7 @@ static int part_panic_write(struct mtd_info *mtd, loff_t to, size_t len,
 static int part_write_oob(struct mtd_info *mtd, loff_t to,
 		struct mtd_oob_ops *ops)
 {
-	struct mtd_part *part = PART(mtd);
+	struct mtd_part *part = mtd_to_part(mtd);
 
 	if (to >= mtd->size)
 		return -EINVAL;
@@ -206,7 +209,7 @@ static int part_write_oob(struct mtd_info *mtd, loff_t to,
 static int part_write_user_prot_reg(struct mtd_info *mtd, loff_t from,
 		size_t len, size_t *retlen, u_char *buf)
 {
-	struct mtd_part *part = PART(mtd);
+	struct mtd_part *part = mtd_to_part(mtd);
 	return part->master->_write_user_prot_reg(part->master, from, len,
 						  retlen, buf);
 }
@@ -214,21 +217,21 @@ static int part_write_user_prot_reg(struct mtd_info *mtd, loff_t from,
 static int part_lock_user_prot_reg(struct mtd_info *mtd, loff_t from,
 		size_t len)
 {
-	struct mtd_part *part = PART(mtd);
+	struct mtd_part *part = mtd_to_part(mtd);
 	return part->master->_lock_user_prot_reg(part->master, from, len);
 }
 
 static int part_writev(struct mtd_info *mtd, const struct kvec *vecs,
 		unsigned long count, loff_t to, size_t *retlen)
 {
-	struct mtd_part *part = PART(mtd);
+	struct mtd_part *part = mtd_to_part(mtd);
 	return part->master->_writev(part->master, vecs, count,
 				     to + part->offset, retlen);
 }
 
 static int part_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
-	struct mtd_part *part = PART(mtd);
+	struct mtd_part *part = mtd_to_part(mtd);
 	int ret;
 
 	instr->addr += part->offset;
@@ -244,7 +247,7 @@ static int part_erase(struct mtd_info *mtd, struct erase_info *instr)
 void mtd_erase_callback(struct erase_info *instr)
 {
 	if (instr->mtd->_erase == part_erase) {
-		struct mtd_part *part = PART(instr->mtd);
+		struct mtd_part *part = mtd_to_part(instr->mtd);
 
 		if (instr->fail_addr != MTD_FAIL_ADDR_UNKNOWN)
 			instr->fail_addr -= part->offset;
@@ -257,57 +260,57 @@ EXPORT_SYMBOL_GPL(mtd_erase_callback);
 
 static int part_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 {
-	struct mtd_part *part = PART(mtd);
+	struct mtd_part *part = mtd_to_part(mtd);
 	return part->master->_lock(part->master, ofs + part->offset, len);
 }
 
 static int part_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 {
-	struct mtd_part *part = PART(mtd);
+	struct mtd_part *part = mtd_to_part(mtd);
 	return part->master->_unlock(part->master, ofs + part->offset, len);
 }
 
 static int part_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 {
-	struct mtd_part *part = PART(mtd);
+	struct mtd_part *part = mtd_to_part(mtd);
 	return part->master->_is_locked(part->master, ofs + part->offset, len);
 }
 
 static void part_sync(struct mtd_info *mtd)
 {
-	struct mtd_part *part = PART(mtd);
+	struct mtd_part *part = mtd_to_part(mtd);
 	part->master->_sync(part->master);
 }
 
 static int part_suspend(struct mtd_info *mtd)
 {
-	struct mtd_part *part = PART(mtd);
+	struct mtd_part *part = mtd_to_part(mtd);
 	return part->master->_suspend(part->master);
 }
 
 static void part_resume(struct mtd_info *mtd)
 {
-	struct mtd_part *part = PART(mtd);
+	struct mtd_part *part = mtd_to_part(mtd);
 	part->master->_resume(part->master);
 }
 
 static int part_block_isreserved(struct mtd_info *mtd, loff_t ofs)
 {
-	struct mtd_part *part = PART(mtd);
+	struct mtd_part *part = mtd_to_part(mtd);
 	ofs += part->offset;
 	return part->master->_block_isreserved(part->master, ofs);
 }
 
 static int part_block_isbad(struct mtd_info *mtd, loff_t ofs)
 {
-	struct mtd_part *part = PART(mtd);
+	struct mtd_part *part = mtd_to_part(mtd);
 	ofs += part->offset;
 	return part->master->_block_isbad(part->master, ofs);
 }
 
 static int part_block_markbad(struct mtd_info *mtd, loff_t ofs)
 {
-	struct mtd_part *part = PART(mtd);
+	struct mtd_part *part = mtd_to_part(mtd);
 	int res;
 
 	ofs += part->offset;
@@ -558,7 +561,7 @@ static ssize_t mtd_partition_offset_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
 	struct mtd_info *mtd = dev_get_drvdata(dev);
-	struct mtd_part *part = PART(mtd);
+	struct mtd_part *part = mtd_to_part(mtd);
 	return snprintf(buf, PAGE_SIZE, "%lld\n", part->offset);
 }
 
@@ -817,6 +820,6 @@ uint64_t mtd_get_device_size(const struct mtd_info *mtd)
 	if (!mtd_is_partition(mtd))
 		return mtd->size;
 
-	return PART(mtd)->master->size;
+	return mtd_to_part(mtd)->master->size;
 }
 EXPORT_SYMBOL_GPL(mtd_get_device_size);
-- 
2.6.0.rc2.230.g3dd15c0
