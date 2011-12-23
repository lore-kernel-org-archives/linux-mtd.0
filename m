Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Re9Zy-0005Ho-Mp
 for linux-mtd@lists.infradead.org; Fri, 23 Dec 2011 18:10:53 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 13/28] mtd: introduce mtd_read_fact_prot_reg interface
Date: Fri, 23 Dec 2011 20:11:05 +0200
Message-Id: <1324663880-22477-14-git-send-email-dedekind1@gmail.com>
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
 drivers/mtd/mtdchar.c   |    3 ++-
 drivers/mtd/mtdpart.c   |    3 +--
 include/linux/mtd/mtd.h |   10 +++++++++-
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 34deb3b..d35e12f 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -213,7 +213,8 @@ static ssize_t mtdchar_read(struct file *file, char __user *buf, size_t count,
 
 		switch (mfi->mode) {
 		case MTD_FILE_MODE_OTP_FACTORY:
-			ret = mtd->read_fact_prot_reg(mtd, *ppos, len, &retlen, kbuf);
+			ret = mtd_read_fact_prot_reg(mtd, *ppos, len,
+						     &retlen, kbuf);
 			break;
 		case MTD_FILE_MODE_OTP_USER:
 			ret = mtd->read_user_prot_reg(mtd, *ppos, len, &retlen, kbuf);
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 6bed8bb..4f2c913 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -167,8 +167,7 @@ static int part_read_fact_prot_reg(struct mtd_info *mtd, loff_t from,
 		size_t len, size_t *retlen, u_char *buf)
 {
 	struct mtd_part *part = PART(mtd);
-	return part->master->read_fact_prot_reg(part->master, from,
-					len, retlen, buf);
+	return mtd_read_fact_prot_reg(part->master, from, len, retlen, buf);
 }
 
 static int part_get_fact_prot_info(struct mtd_info *mtd, struct otp_info *buf,
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 9a7a7f2..d77a7f8 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -194,13 +194,14 @@ struct mtd_info {
 			  struct mtd_oob_ops *ops);
 	int (*get_fact_prot_info) (struct mtd_info *mtd, struct otp_info *buf,
 				   size_t len);
+	int (*read_fact_prot_reg) (struct mtd_info *mtd, loff_t from,
+				   size_t len, size_t *retlen, u_char *buf);
 
 	/* Backing device capabilities for this device
 	 * - provides mmap capabilities
 	 */
 	struct backing_dev_info *backing_dev_info;
 
-	int (*read_fact_prot_reg) (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf);
 	int (*get_user_prot_info) (struct mtd_info *mtd, struct otp_info *buf, size_t len);
 	int (*read_user_prot_reg) (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf);
 	int (*write_user_prot_reg) (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf);
@@ -337,6 +338,13 @@ static inline int mtd_get_fact_prot_info(struct mtd_info *mtd,
 	return mtd->get_fact_prot_info(mtd, buf, len);
 }
 
+static inline int mtd_read_fact_prot_reg(struct mtd_info *mtd, loff_t from,
+					 size_t len, size_t *retlen,
+					 u_char *buf)
+{
+	return mtd->read_fact_prot_reg(mtd, from, len, retlen, buf);
+}
+
 static inline struct mtd_info *dev_to_mtd(struct device *dev)
 {
 	return dev ? dev_get_drvdata(dev) : NULL;
-- 
1.7.7.3
