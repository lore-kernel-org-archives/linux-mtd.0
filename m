Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RgCFS-0004Rf-MG
 for linux-mtd@lists.infradead.org; Thu, 29 Dec 2011 09:26:08 +0000
From: dedekind1@gmail.com
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 14/27] mtd: introduce mtd_get_user_prot_info interface
Date: Thu, 29 Dec 2011 11:27:18 +0200
Message-Id: <1325150851-2805-15-git-send-email-dedekind1@gmail.com>
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
 include/linux/mtd/mtd.h |   10 +++++++++-
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index d35e12f..80c342c 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -930,7 +930,7 @@ static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
 			break;
 		case MTD_FILE_MODE_OTP_USER:
 			if (mtd->get_user_prot_info)
-				ret = mtd->get_user_prot_info(mtd, buf, 4096);
+				ret = mtd_get_user_prot_info(mtd, buf, 4096);
 			break;
 		default:
 			break;
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 4f2c913..bf1ab56 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -160,7 +160,7 @@ static int part_get_user_prot_info(struct mtd_info *mtd,
 		struct otp_info *buf, size_t len)
 {
 	struct mtd_part *part = PART(mtd);
-	return part->master->get_user_prot_info(part->master, buf, len);
+	return mtd_get_user_prot_info(part->master, buf, len);
 }
 
 static int part_read_fact_prot_reg(struct mtd_info *mtd, loff_t from,
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index d77a7f8..ff0a3a1 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -196,13 +196,14 @@ struct mtd_info {
 				   size_t len);
 	int (*read_fact_prot_reg) (struct mtd_info *mtd, loff_t from,
 				   size_t len, size_t *retlen, u_char *buf);
+	int (*get_user_prot_info) (struct mtd_info *mtd, struct otp_info *buf,
+				   size_t len);
 
 	/* Backing device capabilities for this device
 	 * - provides mmap capabilities
 	 */
 	struct backing_dev_info *backing_dev_info;
 
-	int (*get_user_prot_info) (struct mtd_info *mtd, struct otp_info *buf, size_t len);
 	int (*read_user_prot_reg) (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf);
 	int (*write_user_prot_reg) (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf);
 	int (*lock_user_prot_reg) (struct mtd_info *mtd, loff_t from, size_t len);
@@ -345,6 +346,13 @@ static inline int mtd_read_fact_prot_reg(struct mtd_info *mtd, loff_t from,
 	return mtd->read_fact_prot_reg(mtd, from, len, retlen, buf);
 }
 
+static inline int mtd_get_user_prot_info(struct mtd_info *mtd,
+					 struct otp_info *buf,
+					 size_t len)
+{
+	return mtd->get_user_prot_info(mtd, buf, len);
+}
+
 static inline struct mtd_info *dev_to_mtd(struct device *dev)
 {
 	return dev ? dev_get_drvdata(dev) : NULL;
-- 
1.7.7.4
