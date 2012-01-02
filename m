Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rhgqp-0003Sw-PS
 for linux-mtd@lists.infradead.org; Mon, 02 Jan 2012 12:18:52 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 08/17] mtd: do not use mtd->read_*_prot_reg directly
Date: Mon,  2 Jan 2012 14:20:38 +0200
Message-Id: <1325506847-23470-9-git-send-email-dedekind1@gmail.com>
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

Instead, call 'mtd_read_*_prot_info()' and check for -EOPNOTSUPP.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/mtdchar.c   |   18 ++++++++++--------
 include/linux/mtd/mtd.h |    4 ++++
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 49340dc..4e8e5fb 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -366,20 +366,22 @@ static void mtdchar_erase_callback (struct erase_info *instr)
 static int otp_select_filemode(struct mtd_file_info *mfi, int mode)
 {
 	struct mtd_info *mtd = mfi->mtd;
+	size_t retlen;
 	int ret = 0;
 
+	/*
+	 * Make a fake call to mtd_read_fact_prot_reg() to check if OTP
+	 * operations are supported.
+	 */
+	if (mtd_read_fact_prot_reg(mtd, -1, -1, &retlen, NULL) == -EOPNOTSUPP)
+		return -EOPNOTSUPP;
+
 	switch (mode) {
 	case MTD_OTP_FACTORY:
-		if (!mtd->read_fact_prot_reg)
-			ret = -EOPNOTSUPP;
-		else
-			mfi->mode = MTD_FILE_MODE_OTP_FACTORY;
+		mfi->mode = MTD_FILE_MODE_OTP_FACTORY;
 		break;
 	case MTD_OTP_USER:
-		if (!mtd->read_fact_prot_reg)
-			ret = -EOPNOTSUPP;
-		else
-			mfi->mode = MTD_FILE_MODE_OTP_USER;
+		mfi->mode = MTD_FILE_MODE_OTP_USER;
 		break;
 	default:
 		ret = -EINVAL;
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 7122efd..e488cf9 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -352,6 +352,8 @@ static inline int mtd_read_fact_prot_reg(struct mtd_info *mtd, loff_t from,
 					 u_char *buf)
 {
 	*retlen = 0;
+	if (!mtd->read_fact_prot_reg)
+		return -EOPNOTSUPP;
 	return mtd->read_fact_prot_reg(mtd, from, len, retlen, buf);
 }
 
@@ -369,6 +371,8 @@ static inline int mtd_read_user_prot_reg(struct mtd_info *mtd, loff_t from,
 					 u_char *buf)
 {
 	*retlen = 0;
+	if (!mtd->read_user_prot_reg)
+		return -EOPNOTSUPP;
 	return mtd->read_user_prot_reg(mtd, from, len, retlen, buf);
 }
 
-- 
1.7.7.3
