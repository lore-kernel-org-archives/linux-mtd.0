Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sqibx-0000vM-R9
 for linux-mtd@lists.infradead.org; Mon, 16 Jul 2012 10:33:07 +0000
Received: by mail-pb0-f49.google.com with SMTP id rq13so11152222pbb.36
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jul 2012 03:33:05 -0700 (PDT)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 4/6] mtd: s3c2410: Do not initialise statics to 0 or NULL
Date: Mon, 16 Jul 2012 16:02:25 +0530
Message-Id: <1342434747-27622-4-git-send-email-sachin.kamat@linaro.org>
In-Reply-To: <1342434747-27622-1-git-send-email-sachin.kamat@linaro.org>
References: <1342434747-27622-1-git-send-email-sachin.kamat@linaro.org>
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
 drivers/mtd/nand/s3c2410.c |   64 ++++++++++++++++++-------------------------
 1 files changed, 27 insertions(+), 37 deletions(-)

diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index 5907d1c..9c7e4bf 100644
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
@@ -821,32 +812,31 @@ static void s3c2410_nand_init_chip(struct s3c2410_nand_info *info,
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
