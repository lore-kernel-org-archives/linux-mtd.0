Received: from mail-yx0-f177.google.com ([209.85.213.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sqj4G-0004j7-Hh
 for linux-mtd@lists.infradead.org; Mon, 16 Jul 2012 11:02:21 +0000
Received: by yenr9 with SMTP id r9so5237298yen.36
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jul 2012 04:02:19 -0700 (PDT)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 4/6][Resend] mtd: s3c2410: Do not initialise statics to 0 or
 NULL
Date: Mon, 16 Jul 2012 16:31:44 +0530
Message-Id: <1342436504-15163-1-git-send-email-sachin.kamat@linaro.org>
Cc: sachin.kamat@linaro.org, dwmw2@infradead.org, David.Woodhouse@intel.com,
 ben-linux@fluff.org, patches@linaro.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fixes the following checkpatch errors:
ERROR: do not initialise statics to 0 or NULL
+static int hardware_ecc = 0;

ERROR: do not initialise statics to 0 or NULL
+static const int clock_stop = 0;

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
Please ignore the previous patch (v1).
This patch takes care of some compilation warnings introduced earlier.
---
 drivers/mtd/nand/s3c2410.c |   66 +++++++++++++++++++------------------------
 1 files changed, 29 insertions(+), 37 deletions(-)

diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index 5907d1c..05fb4f7 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -49,19 +49,6 @@
 #include <plat/regs-nand.h>
 #include <plat/nand.h>
 
-#ifdef CONFIG_MTD_NAND_S3C2410_HWECC
-static int hardware_ecc = 1;
-#else
-static int hardware_ecc = 0;
-#endif
-
-#ifdef CONFIG_MTD_NAND_S3C2410_CLKSTOP
-static const int clock_stop = 1;
-#else
-static const int clock_stop = 0;
-#endif
-
-
 /* new oob placement block for use with hardware ecc generation
  */
 
@@ -170,7 +157,11 @@ static struct s3c2410_platform_nand *to_nand_plat(struct platform_device *dev)
 
 static inline int allow_clk_suspend(struct s3c2410_nand_info *info)
 {
-	return clock_stop;
+#ifdef CONFIG_MTD_NAND_S3C2410_CLKSTOP
+	return 1;
+#else
+	return 0;
+#endif
 }
 
 /**
@@ -452,6 +443,7 @@ static int s3c2412_nand_devready(struct mtd_info *mtd)
 
 /* ECC handling functions */
 
+#ifdef CONFIG_MTD_NAND_S3C2410_HWECC
 static int s3c2410_nand_correct_data(struct mtd_info *mtd, u_char *dat,
 				     u_char *read_ecc, u_char *calc_ecc)
 {
@@ -601,6 +593,7 @@ static int s3c2440_nand_calculate_ecc(struct mtd_info *mtd, const u_char *dat, u
 
 	return 0;
 }
+#endif
 
 /* over-ride the standard functions for a little more speed. We can
  * use read/write block to move the data buffers to/from the controller
@@ -821,32 +814,31 @@ static void s3c2410_nand_init_chip(struct s3c2410_nand_info *info,
 	nmtd->mtd.owner    = THIS_MODULE;
 	nmtd->set	   = set;
 
-	if (hardware_ecc) {
+#ifdef CONFIG_MTD_NAND_S3C2410_HWECC
+	chip->ecc.calculate = s3c2410_nand_calculate_ecc;
+	chip->ecc.correct   = s3c2410_nand_correct_data;
+	chip->ecc.mode	    = NAND_ECC_HW;
+	chip->ecc.strength  = 1;
+
+	switch (info->cpu_type) {
+	case TYPE_S3C2410:
+		chip->ecc.hwctl	    = s3c2410_nand_enable_hwecc;
 		chip->ecc.calculate = s3c2410_nand_calculate_ecc;
-		chip->ecc.correct   = s3c2410_nand_correct_data;
-		chip->ecc.mode	    = NAND_ECC_HW;
-		chip->ecc.strength  = 1;
-
-		switch (info->cpu_type) {
-		case TYPE_S3C2410:
-			chip->ecc.hwctl	    = s3c2410_nand_enable_hwecc;
-			chip->ecc.calculate = s3c2410_nand_calculate_ecc;
-			break;
-
-		case TYPE_S3C2412:
-  			chip->ecc.hwctl     = s3c2412_nand_enable_hwecc;
-  			chip->ecc.calculate = s3c2412_nand_calculate_ecc;
-			break;
-
-		case TYPE_S3C2440:
-  			chip->ecc.hwctl     = s3c2440_nand_enable_hwecc;
-  			chip->ecc.calculate = s3c2440_nand_calculate_ecc;
-			break;
+		break;
 
-		}
-	} else {
-		chip->ecc.mode	    = NAND_ECC_SOFT;
+	case TYPE_S3C2412:
+		chip->ecc.hwctl     = s3c2412_nand_enable_hwecc;
+		chip->ecc.calculate = s3c2412_nand_calculate_ecc;
+		break;
+
+	case TYPE_S3C2440:
+		chip->ecc.hwctl     = s3c2440_nand_enable_hwecc;
+		chip->ecc.calculate = s3c2440_nand_calculate_ecc;
+		break;
 	}
+#else
+	chip->ecc.mode	    = NAND_ECC_SOFT;
+#endif
 
 	if (set->ecc_layout != NULL)
 		chip->ecc.layout = set->ecc_layout;
-- 
1.7.4.1
