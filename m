Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Re9a2-0005Ho-EU
 for linux-mtd@lists.infradead.org; Fri, 23 Dec 2011 18:10:56 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 16/28] mtd: introduce mtd_write_user_prot_reg interface
Date: Fri, 23 Dec 2011 20:11:08 +0200
Message-Id: <1324663880-22477-17-git-send-email-dedekind1@gmail.com>
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
index 4941e58..a29d6421 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -314,7 +314,8 @@ static ssize_t mtdchar_write(struct file *file, const char __user *buf, size_t c
 				ret = -EOPNOTSUPP;
 				break;
 			}
-			ret = mtd->write_user_prot_reg(mtd, *ppos, len, &retlen, kbuf);
+			ret = mtd_write_user_prot_reg(mtd, *ppos, len,
+						      &retlen, kbuf);
 			break;
 
 		case MTD_FILE_MODE_RAW:
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index f018373..1e7b8d1 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -222,8 +222,7 @@ static int part_write_user_prot_reg(struct mtd_info *mtd, loff_t from,
 		size_t len, size_t *retlen, u_char *buf)
 {
 	struct mtd_part *part = PART(mtd);
-	return part->master->write_user_prot_reg(part->master, from,
-					len, retlen, buf);
+	return mtd_write_user_prot_reg(part->master, from, len, retlen, buf);
 }
 
 static int part_lock_user_prot_reg(struct mtd_info *mtd, loff_t from,
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 855fb7f..5549607 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -200,13 +200,14 @@ struct mtd_info {
 				   size_t len);
 	int (*read_user_prot_reg) (struct mtd_info *mtd, loff_t from,
 				   size_t len, size_t *retlen, u_char *buf);
+	int (*write_user_prot_reg) (struct mtd_info *mtd, loff_t to, size_t len,
+				    size_t *retlen, u_char *buf);
 
 	/* Backing device capabilities for this device
 	 * - provides mmap capabilities
 	 */
 	struct backing_dev_info *backing_dev_info;
 
-	int (*write_user_prot_reg) (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf);
 	int (*lock_user_prot_reg) (struct mtd_info *mtd, loff_t from, size_t len);
 
 	/* kvec-based read/write methods.
@@ -361,6 +362,13 @@ static inline int mtd_read_user_prot_reg(struct mtd_info *mtd, loff_t from,
 	return mtd->read_user_prot_reg(mtd, from, len, retlen, buf);
 }
 
+static inline int mtd_write_user_prot_reg(struct mtd_info *mtd, loff_t to,
+					  size_t len, size_t *retlen,
+					  u_char *buf)
+{
+	return mtd->write_user_prot_reg(mtd, to, len, retlen, buf);
+}
+
 static inline struct mtd_info *dev_to_mtd(struct device *dev)
 {
 	return dev ? dev_get_drvdata(dev) : NULL;
-- 
1.7.7.3
