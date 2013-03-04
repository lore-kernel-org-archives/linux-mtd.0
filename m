Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCYMR-0003VP-F9
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2013 16:35:40 +0000
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2] mtdchar: handle chips that have user otp but no factory otp
Date: Mon,  4 Mar 2013 17:35:24 +0100
Message-Id: <1362414924-27506-1-git-send-email-u.kleine-koenig@pengutronix.de>
In-Reply-To: <1361182768-31919-1-git-send-email-u.kleine-koenig@pengutronix.de>
References: <1361182768-31919-1-git-send-email-u.kleine-koenig@pengutronix.de>
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
Forwarded: id:1361182768-31919-1-git-send-email-u.kleine-koenig@pengutronix.de
---

Notes:
    Changes since (implicit) v1, sent with
    Message-Id:1361182768-31919-1-git-send-email-u.kleine-koenig@pengutronix.de:
    
     - drop usage of a function pointer and accept minimal code duplication
       instead;
     - don't modify mfi->mode when returning -EINVAL;

 drivers/mtd/mtdchar.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 82c0616..68959a3 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -370,28 +370,30 @@ static int otp_select_filemode(struct mtd_file_info *mfi, int mode)
 {
 	struct mtd_info *mtd = mfi->mtd;
 	size_t retlen;
-	int ret = 0;
-
-	/*
-	 * Make a fake call to mtd_read_fact_prot_reg() to check if OTP
-	 * operations are supported.
-	 */
-	if (mtd_read_fact_prot_reg(mtd, -1, 0, &retlen, NULL) == -EOPNOTSUPP)
-		return -EOPNOTSUPP;
 
 	switch (mode) {
 	case MTD_OTP_FACTORY:
+		if (mtd_read_fact_prot_reg(mtd, -1, 0, &retlen, NULL) ==
+				-EOPNOTSUPP)
+			return -EOPNOTSUPP;
+
 		mfi->mode = MTD_FILE_MODE_OTP_FACTORY;
 		break;
 	case MTD_OTP_USER:
+		if (mtd_read_user_prot_reg(mtd, -1, 0, &retlen, NULL) ==
+				-EOPNOTSUPP)
+			return -EOPNOTSUPP;
+
 		mfi->mode = MTD_FILE_MODE_OTP_USER;
 		break;
-	default:
-		ret = -EINVAL;
 	case MTD_OTP_OFF:
+		mfi->mode = MTD_FILE_MODE_NORMAL;
 		break;
+	default:
+		return -EINVAL;
 	}
-	return ret;
+
+	return 0;
 }
 #else
 # define otp_select_filemode(f,m)	-EOPNOTSUPP
-- 
1.8.2.rc2
