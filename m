Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U7Nou-0004tU-5V
 for linux-mtd@lists.infradead.org; Mon, 18 Feb 2013 10:19:36 +0000
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtdchar: handle chips that have user otp but no factory otp
Date: Mon, 18 Feb 2013 11:19:28 +0100
Message-Id: <1361182768-31919-1-git-send-email-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: kernel@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Before this patch mtd_read_fact_prot_reg was used to check availability
for both MTD_OTP_FACTORY and MTD_OTP_USER access. This made accessing
user otp for chips that don't have a factory otp area impossible. So use
the right wrapper depending on the intended area to be accessed.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

I'm currently working on accessing the user otp area of MT29F2G nand
flash that doesn't have a factory otp. Reading and writing are not ready
yet, but this change is an obvious prerequisite.

Best regards
Uwe

 drivers/mtd/mtdchar.c |   30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index a6e7451..1f4034a 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -371,26 +371,34 @@ static int otp_select_filemode(struct mtd_file_info *mfi, int mode)
 	struct mtd_info *mtd = mfi->mtd;
 	size_t retlen;
 	int ret = 0;
-
-	/*
-	 * Make a fake call to mtd_read_fact_prot_reg() to check if OTP
-	 * operations are supported.
-	 */
-	if (mtd_read_fact_prot_reg(mtd, -1, 0, &retlen, NULL) == -EOPNOTSUPP)
-		return -EOPNOTSUPP;
+	int (*func)(struct mtd_info *, loff_t, size_t, size_t *, u_char *) =
+		NULL;
+	enum mtd_file_modes outmode = MTD_FILE_MODE_NORMAL;
 
 	switch (mode) {
 	case MTD_OTP_FACTORY:
-		mfi->mode = MTD_FILE_MODE_OTP_FACTORY;
+		outmode = MTD_FILE_MODE_OTP_FACTORY;
+		func = mtd_read_fact_prot_reg;
 		break;
 	case MTD_OTP_USER:
-		mfi->mode = MTD_FILE_MODE_OTP_USER;
+		outmode = MTD_FILE_MODE_OTP_USER;
+		func = mtd_read_user_prot_reg;
 		break;
-	default:
-		ret = -EINVAL;
 	case MTD_OTP_OFF:
 		break;
+	default:
+		ret = -EINVAL;
 	}
+
+	/*
+	 * Make a fake call to mtd_read_fact_prot_reg() or
+	 * mtd_read_user_prot_reg() to check if OTP operations are supported.
+	 */
+	if (func && func(mtd, -1, 0, &retlen, NULL) == -EOPNOTSUPP)
+		return -EOPNOTSUPP;
+
+	mfi->mode = outmode;
+
 	return ret;
 }
 #else
-- 
1.7.10.4
