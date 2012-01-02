Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rhgqo-0003RB-DL
 for linux-mtd@lists.infradead.org; Mon, 02 Jan 2012 12:18:51 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 07/17] mtd: do not use mtd->get_*_prot_info directly
Date: Mon,  2 Jan 2012 14:20:37 +0200
Message-Id: <1325506847-23470-8-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1325506847-23470-1-git-send-email-dedekind1@gmail.com>
References: <1325506847-23470-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Instead, call 'mtd_get_*_prot_info()' and check for '-EOPNOTSUPP'. While
on it, fix the return code from '-EOPNOTSUPP' to '-EINVAL' for the case
when the mode parameter is invalid.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/mtdchar.c   |    8 +++-----
 include/linux/mtd/mtd.h |    4 ++++
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 287ff0d..49340dc 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -919,17 +919,15 @@ static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
 		struct otp_info *buf = kmalloc(4096, GFP_KERNEL);
 		if (!buf)
 			return -ENOMEM;
-		ret = -EOPNOTSUPP;
 		switch (mfi->mode) {
 		case MTD_FILE_MODE_OTP_FACTORY:
-			if (mtd->get_fact_prot_info)
-				ret = mtd_get_fact_prot_info(mtd, buf, 4096);
+			ret = mtd_get_fact_prot_info(mtd, buf, 4096);
 			break;
 		case MTD_FILE_MODE_OTP_USER:
-			if (mtd->get_user_prot_info)
-				ret = mtd_get_user_prot_info(mtd, buf, 4096);
+			ret = mtd_get_user_prot_info(mtd, buf, 4096);
 			break;
 		default:
+			ret = -EINVAL;
 			break;
 		}
 		if (ret >= 0) {
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 721a63f..7122efd 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -342,6 +342,8 @@ static inline int mtd_write_oob(struct mtd_info *mtd, loff_t to,
 static inline int mtd_get_fact_prot_info(struct mtd_info *mtd,
 					 struct otp_info *buf, size_t len)
 {
+	if (!mtd->get_fact_prot_info)
+		return -EOPNOTSUPP;
 	return mtd->get_fact_prot_info(mtd, buf, len);
 }
 
@@ -357,6 +359,8 @@ static inline int mtd_get_user_prot_info(struct mtd_info *mtd,
 					 struct otp_info *buf,
 					 size_t len)
 {
+	if (!mtd->get_user_prot_info)
+		return -EOPNOTSUPP;
 	return mtd->get_user_prot_info(mtd, buf, len);
 }
 
-- 
1.7.7.3
