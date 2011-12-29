Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RgIAk-0007xI-QS
 for linux-mtd@lists.infradead.org; Thu, 29 Dec 2011 15:45:40 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mtd: always initialize retlen to zero
Date: Thu, 29 Dec 2011 17:47:32 +0200
Message-Id: <1325173653-6788-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Make sure that the retlen is set to 0 in case of error. This harmonizes
drivers - some set it to 0 in some error cases and do not write anything
in other error cases. Now we can do this consistently for all drivers.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 include/linux/mtd/mtd.h |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 8ae37e9..a09077a 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -258,6 +258,7 @@ static inline int mtd_erase(struct mtd_info *mtd, struct erase_info *instr)
 static inline int mtd_point(struct mtd_info *mtd, loff_t from, size_t len,
 			    size_t *retlen, void **virt, resource_size_t *phys)
 {
+	*retlen = 0;
 	return mtd->point(mtd, from, len, retlen, virt, phys);
 }
 
@@ -289,6 +290,7 @@ static inline int mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
 static inline int mtd_write(struct mtd_info *mtd, loff_t to, size_t len,
 			    size_t *retlen, const u_char *buf)
 {
+	*retlen = 0;
 	return mtd->write(mtd, to, len, retlen, buf);
 }
 
@@ -302,18 +304,21 @@ static inline int mtd_write(struct mtd_info *mtd, loff_t to, size_t len,
 static inline int mtd_panic_write(struct mtd_info *mtd, loff_t to, size_t len,
 				  size_t *retlen, const u_char *buf)
 {
+	*retlen = 0;
 	return mtd->panic_write(mtd, to, len, retlen, buf);
 }
 
 static inline int mtd_read_oob(struct mtd_info *mtd, loff_t from,
 			       struct mtd_oob_ops *ops)
 {
+	ops->retlen = ops->oobretlen = 0;
 	return mtd->read_oob(mtd, from, ops);
 }
 
 static inline int mtd_write_oob(struct mtd_info *mtd, loff_t to,
 				struct mtd_oob_ops *ops)
 {
+	ops->retlen = ops->oobretlen = 0;
 	return mtd->write_oob(mtd, to, ops);
 }
 
@@ -332,6 +337,7 @@ static inline int mtd_read_fact_prot_reg(struct mtd_info *mtd, loff_t from,
 					 size_t len, size_t *retlen,
 					 u_char *buf)
 {
+	*retlen = 0;
 	return mtd->read_fact_prot_reg(mtd, from, len, retlen, buf);
 }
 
@@ -346,6 +352,7 @@ static inline int mtd_read_user_prot_reg(struct mtd_info *mtd, loff_t from,
 					 size_t len, size_t *retlen,
 					 u_char *buf)
 {
+	*retlen = 0;
 	return mtd->read_user_prot_reg(mtd, from, len, retlen, buf);
 }
 
@@ -353,6 +360,7 @@ static inline int mtd_write_user_prot_reg(struct mtd_info *mtd, loff_t to,
 					  size_t len, size_t *retlen,
 					  u_char *buf)
 {
+	*retlen = 0;
 	return mtd->write_user_prot_reg(mtd, to, len, retlen, buf);
 }
 
@@ -369,6 +377,7 @@ static inline int mtd_lock_user_prot_reg(struct mtd_info *mtd, loff_t from,
 static inline int mtd_writev(struct mtd_info *mtd, const struct kvec *vecs,
 			     unsigned long count, loff_t to, size_t *retlen)
 {
+	*retlen = 0;
 	return mtd->writev(mtd, vecs, count, to, retlen);
 }
 
-- 
1.7.7.3
