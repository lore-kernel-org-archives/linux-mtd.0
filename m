Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RgCFN-0004RG-6f
 for linux-mtd@lists.infradead.org; Thu, 29 Dec 2011 09:26:04 +0000
From: dedekind1@gmail.com
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 12/27] mtd: introduce mtd_get_fact_prot_info interface
Date: Thu, 29 Dec 2011 11:27:16 +0200
Message-Id: <1325150851-2805-13-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1325150851-2805-1-git-send-email-dedekind1@gmail.com>
References: <1325150851-2805-1-git-send-email-dedekind1@gmail.com>
Cc: Mike Dunn <mikedunn@newsguy.com>
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
 drivers/mtd/mtdchar.c   |    2 +-
 drivers/mtd/mtdpart.c   |    2 +-
 include/linux/mtd/mtd.h |   19 +++++++++++++------
 3 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 39d4424..34deb3b 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -925,7 +925,7 @@ static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
 		switch (mfi->mode) {
 		case MTD_FILE_MODE_OTP_FACTORY:
 			if (mtd->get_fact_prot_info)
-				ret = mtd->get_fact_prot_info(mtd, buf, 4096);
+				ret = mtd_get_fact_prot_info(mtd, buf, 4096);
 			break;
 		case MTD_FILE_MODE_OTP_USER:
 			if (mtd->get_user_prot_info)
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 8a46cd2..6bed8bb 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -175,7 +175,7 @@ static int part_get_fact_prot_info(struct mtd_info *mtd, struct otp_info *buf,
 		size_t len)
 {
 	struct mtd_part *part = PART(mtd);
-	return part->master->get_fact_prot_info(part->master, buf, len);
+	return mtd_get_fact_prot_info(part->master, buf, len);
 }
 
 static int part_write(struct mtd_info *mtd, loff_t to, size_t len,
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index abbc96a..9a7a7f2 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -192,18 +192,14 @@ struct mtd_info {
 			 struct mtd_oob_ops *ops);
 	int (*write_oob) (struct mtd_info *mtd, loff_t to,
 			  struct mtd_oob_ops *ops);
+	int (*get_fact_prot_info) (struct mtd_info *mtd, struct otp_info *buf,
+				   size_t len);
 
 	/* Backing device capabilities for this device
 	 * - provides mmap capabilities
 	 */
 	struct backing_dev_info *backing_dev_info;
 
-	/*
-	 * Methods to access the protection register area, present in some
-	 * flash devices. The user data is one time programmable but the
-	 * factory data is read only.
-	 */
-	int (*get_fact_prot_info) (struct mtd_info *mtd, struct otp_info *buf, size_t len);
 	int (*read_fact_prot_reg) (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf);
 	int (*get_user_prot_info) (struct mtd_info *mtd, struct otp_info *buf, size_t len);
 	int (*read_user_prot_reg) (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf);
@@ -330,6 +326,17 @@ static inline int mtd_write_oob(struct mtd_info *mtd, loff_t to,
 	return mtd->write_oob(mtd, to, ops);
 }
 
+/*
+ * Method to access the protection register area, present in some flash
+ * devices. The user data is one time programmable but the factory data is read
+ * only.
+ */
+static inline int mtd_get_fact_prot_info(struct mtd_info *mtd,
+					 struct otp_info *buf, size_t len)
+{
+	return mtd->get_fact_prot_info(mtd, buf, len);
+}
+
 static inline struct mtd_info *dev_to_mtd(struct device *dev)
 {
 	return dev ? dev_get_drvdata(dev) : NULL;
-- 
1.7.7.4
