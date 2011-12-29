Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RgCFT-0004RA-FE
 for linux-mtd@lists.infradead.org; Thu, 29 Dec 2011 09:26:08 +0000
From: dedekind1@gmail.com
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 15/27] mtd: introduce mtd_read_user_prot_reg interface
Date: Thu, 29 Dec 2011 11:27:19 +0200
Message-Id: <1325150851-2805-16-git-send-email-dedekind1@gmail.com>
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
 drivers/mtd/mtdchar.c   |    3 ++-
 drivers/mtd/mtdpart.c   |    3 +--
 include/linux/mtd/mtd.h |   10 +++++++++-
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 80c342c..4941e58 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -217,7 +217,8 @@ static ssize_t mtdchar_read(struct file *file, char __user *buf, size_t count,
 						     &retlen, kbuf);
 			break;
 		case MTD_FILE_MODE_OTP_USER:
-			ret = mtd->read_user_prot_reg(mtd, *ppos, len, &retlen, kbuf);
+			ret = mtd_read_user_prot_reg(mtd, *ppos, len,
+						     &retlen, kbuf);
 			break;
 		case MTD_FILE_MODE_RAW:
 		{
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index bf1ab56..f018373 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -152,8 +152,7 @@ static int part_read_user_prot_reg(struct mtd_info *mtd, loff_t from,
 		size_t len, size_t *retlen, u_char *buf)
 {
 	struct mtd_part *part = PART(mtd);
-	return part->master->read_user_prot_reg(part->master, from,
-					len, retlen, buf);
+	return mtd_read_user_prot_reg(part->master, from, len, retlen, buf);
 }
 
 static int part_get_user_prot_info(struct mtd_info *mtd,
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index ff0a3a1..855fb7f 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -198,13 +198,14 @@ struct mtd_info {
 				   size_t len, size_t *retlen, u_char *buf);
 	int (*get_user_prot_info) (struct mtd_info *mtd, struct otp_info *buf,
 				   size_t len);
+	int (*read_user_prot_reg) (struct mtd_info *mtd, loff_t from,
+				   size_t len, size_t *retlen, u_char *buf);
 
 	/* Backing device capabilities for this device
 	 * - provides mmap capabilities
 	 */
 	struct backing_dev_info *backing_dev_info;
 
-	int (*read_user_prot_reg) (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf);
 	int (*write_user_prot_reg) (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf);
 	int (*lock_user_prot_reg) (struct mtd_info *mtd, loff_t from, size_t len);
 
@@ -353,6 +354,13 @@ static inline int mtd_get_user_prot_info(struct mtd_info *mtd,
 	return mtd->get_user_prot_info(mtd, buf, len);
 }
 
+static inline int mtd_read_user_prot_reg(struct mtd_info *mtd, loff_t from,
+					 size_t len, size_t *retlen,
+					 u_char *buf)
+{
+	return mtd->read_user_prot_reg(mtd, from, len, retlen, buf);
+}
+
 static inline struct mtd_info *dev_to_mtd(struct device *dev)
 {
 	return dev ? dev_get_drvdata(dev) : NULL;
-- 
1.7.7.4
