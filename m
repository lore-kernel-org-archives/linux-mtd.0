Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rv9L3-0003ot-3W
 for linux-mtd@lists.infradead.org; Wed, 08 Feb 2012 15:21:44 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 9/9] mtd: check for zero length in OTP functions
Date: Wed,  8 Feb 2012 17:21:25 +0200
Message-Id: <1328714485-19536-10-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1328714485-19536-1-git-send-email-dedekind1@gmail.com>
References: <1328714485-19536-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

This patch changes all the OTP functions like 'mtd_get_fact_prot_info()' and
makes them return zero immediately if the input 'len' parameter is 0. This is
not really needed currently, but most of the other functions do this, and it is
just consistent to do the same in the OTP functions.

This patch also moves the OTP functions from the header file to mtdcore.c
because they become a bit too big for being inlined.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/mtdcore.c   |   73 +++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/mtd.h |   70 +++++++--------------------------------------
 2 files changed, 84 insertions(+), 59 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 6acc4fb..b274fdf 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -802,6 +802,79 @@ int mtd_panic_write(struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen,
 }
 EXPORT_SYMBOL_GPL(mtd_panic_write);
 
+/*
+ * Method to access the protection register area, present in some flash
+ * devices. The user data is one time programmable but the factory data is read
+ * only.
+ */
+int mtd_get_fact_prot_info(struct mtd_info *mtd, struct otp_info *buf,
+			   size_t len)
+{
+	if (!mtd->_get_fact_prot_info)
+		return -EOPNOTSUPP;
+	if (!len)
+		return 0;
+	return mtd->_get_fact_prot_info(mtd, buf, len);
+}
+EXPORT_SYMBOL_GPL(mtd_get_fact_prot_info);
+
+int mtd_read_fact_prot_reg(struct mtd_info *mtd, loff_t from, size_t len,
+			   size_t *retlen, u_char *buf)
+{
+	*retlen = 0;
+	if (!mtd->_read_fact_prot_reg)
+		return -EOPNOTSUPP;
+	if (!len)
+		return 0;
+	return mtd->_read_fact_prot_reg(mtd, from, len, retlen, buf);
+}
+EXPORT_SYMBOL_GPL(mtd_read_fact_prot_reg);
+
+int mtd_get_user_prot_info(struct mtd_info *mtd, struct otp_info *buf,
+			   size_t len)
+{
+	if (!mtd->_get_user_prot_info)
+		return -EOPNOTSUPP;
+	if (!len)
+		return 0;
+	return mtd->_get_user_prot_info(mtd, buf, len);
+}
+EXPORT_SYMBOL_GPL(mtd_get_user_prot_info);
+
+int mtd_read_user_prot_reg(struct mtd_info *mtd, loff_t from, size_t len,
+			   size_t *retlen, u_char *buf)
+{
+	*retlen = 0;
+	if (!mtd->_read_user_prot_reg)
+		return -EOPNOTSUPP;
+	if (!len)
+		return 0;
+	return mtd->_read_user_prot_reg(mtd, from, len, retlen, buf);
+}
+EXPORT_SYMBOL_GPL(mtd_read_user_prot_reg);
+
+int mtd_write_user_prot_reg(struct mtd_info *mtd, loff_t to, size_t len,
+			    size_t *retlen, u_char *buf)
+{
+	*retlen = 0;
+	if (!mtd->_write_user_prot_reg)
+		return -EOPNOTSUPP;
+	if (!len)
+		return 0;
+	return mtd->_write_user_prot_reg(mtd, to, len, retlen, buf);
+}
+EXPORT_SYMBOL_GPL(mtd_write_user_prot_reg);
+
+int mtd_lock_user_prot_reg(struct mtd_info *mtd, loff_t from, size_t len)
+{
+	if (!mtd->_lock_user_prot_reg)
+		return -EOPNOTSUPP;
+	if (!len)
+		return 0;
+	return mtd->_lock_user_prot_reg(mtd, from, len);
+}
+EXPORT_SYMBOL_GPL(mtd_lock_user_prot_reg);
+
 /* Chip-supported device locking */
 int mtd_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 {
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index fa20a8f..726c2d1 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -273,65 +273,17 @@ static inline int mtd_write_oob(struct mtd_info *mtd, loff_t to,
 	return mtd->_write_oob(mtd, to, ops);
 }
 
-/*
- * Method to access the protection register area, present in some flash
- * devices. The user data is one time programmable but the factory data is read
- * only.
- */
-static inline int mtd_get_fact_prot_info(struct mtd_info *mtd,
-					 struct otp_info *buf, size_t len)
-{
-	if (!mtd->_get_fact_prot_info)
-		return -EOPNOTSUPP;
-	return mtd->_get_fact_prot_info(mtd, buf, len);
-}
-
-static inline int mtd_read_fact_prot_reg(struct mtd_info *mtd, loff_t from,
-					 size_t len, size_t *retlen,
-					 u_char *buf)
-{
-	*retlen = 0;
-	if (!mtd->_read_fact_prot_reg)
-		return -EOPNOTSUPP;
-	return mtd->_read_fact_prot_reg(mtd, from, len, retlen, buf);
-}
-
-static inline int mtd_get_user_prot_info(struct mtd_info *mtd,
-					 struct otp_info *buf,
-					 size_t len)
-{
-	if (!mtd->_get_user_prot_info)
-		return -EOPNOTSUPP;
-	return mtd->_get_user_prot_info(mtd, buf, len);
-}
-
-static inline int mtd_read_user_prot_reg(struct mtd_info *mtd, loff_t from,
-					 size_t len, size_t *retlen,
-					 u_char *buf)
-{
-	*retlen = 0;
-	if (!mtd->_read_user_prot_reg)
-		return -EOPNOTSUPP;
-	return mtd->_read_user_prot_reg(mtd, from, len, retlen, buf);
-}
-
-static inline int mtd_write_user_prot_reg(struct mtd_info *mtd, loff_t to,
-					  size_t len, size_t *retlen,
-					  u_char *buf)
-{
-	*retlen = 0;
-	if (!mtd->_write_user_prot_reg)
-		return -EOPNOTSUPP;
-	return mtd->_write_user_prot_reg(mtd, to, len, retlen, buf);
-}
-
-static inline int mtd_lock_user_prot_reg(struct mtd_info *mtd, loff_t from,
-					 size_t len)
-{
-	if (!mtd->_lock_user_prot_reg)
-		return -EOPNOTSUPP;
-	return mtd->_lock_user_prot_reg(mtd, from, len);
-}
+int mtd_get_fact_prot_info(struct mtd_info *mtd, struct otp_info *buf,
+			   size_t len);
+int mtd_read_fact_prot_reg(struct mtd_info *mtd, loff_t from, size_t len,
+			   size_t *retlen, u_char *buf);
+int mtd_get_user_prot_info(struct mtd_info *mtd, struct otp_info *buf,
+			   size_t len);
+int mtd_read_user_prot_reg(struct mtd_info *mtd, loff_t from, size_t len,
+			   size_t *retlen, u_char *buf);
+int mtd_write_user_prot_reg(struct mtd_info *mtd, loff_t to, size_t len,
+			    size_t *retlen, u_char *buf);
+int mtd_lock_user_prot_reg(struct mtd_info *mtd, loff_t from, size_t len);
 
 int mtd_writev(struct mtd_info *mtd, const struct kvec *vecs,
 	       unsigned long count, loff_t to, size_t *retlen);
-- 
1.7.9
