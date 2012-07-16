Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sqic1-0000wS-6E
 for linux-mtd@lists.infradead.org; Mon, 16 Jul 2012 10:33:10 +0000
Received: by mail-pb0-f49.google.com with SMTP id rq13so11152299pbb.36
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jul 2012 03:33:08 -0700 (PDT)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 5/6] mtd: s3c2410: Fix checkpatch warnings and errors related
 to whitespaces
Date: Mon, 16 Jul 2012 16:02:26 +0530
Message-Id: <1342434747-27622-5-git-send-email-sachin.kamat@linaro.org>
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

Fixes checkpatch warnings and errors related to whitespaces.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/mtd/nand/s3c2410.c |   19 ++++++++++---------
 1 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index 9c7e4bf..3e891e8 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -55,7 +55,7 @@
 static struct nand_ecclayout nand_hw_eccoob = {
 	.eccbytes = 3,
 	.eccpos = {0, 1, 2},
-	.oobfree = {{8, 8}}
+	.oobfree = {{8, 8} }
 };
 
 /* controller and mtd information */
@@ -218,7 +218,7 @@ static int s3c_nand_calc_rate(int wanted, unsigned long clk, int max)
 	return result;
 }
 
-#define to_ns(ticks,clk) (((ticks) * NS_IN_KHZ) / (unsigned int)(clk))
+#define to_ns(ticks, clk) (((ticks) * NS_IN_KHZ) / (unsigned int)(clk))
 
 /* controller setup */
 
@@ -261,7 +261,8 @@ static int s3c2410_nand_setrate(struct s3c2410_nand_info *info)
 	}
 
 	dev_info(info->device, "Tacls=%d, %dns Twrph0=%d %dns, Twrph1=%d %dns\n",
-	       tacls, to_ns(tacls, clkrate), twrph0, to_ns(twrph0, clkrate), twrph1, to_ns(twrph1, clkrate));
+		tacls, to_ns(tacls, clkrate), twrph0, to_ns(twrph0, clkrate),
+						twrph1, to_ns(twrph1, clkrate));
 
 	switch (info->cpu_type) {
 	case TYPE_S3C2410:
@@ -318,13 +319,13 @@ static int s3c2410_nand_inithw(struct s3c2410_nand_info *info)
 	if (ret < 0)
 		return ret;
 
- 	switch (info->cpu_type) {
- 	case TYPE_S3C2410:
+	switch (info->cpu_type) {
+	case TYPE_S3C2410:
 	default:
 		break;
 
- 	case TYPE_S3C2440:
- 	case TYPE_S3C2412:
+	case TYPE_S3C2440:
+	case TYPE_S3C2412:
 		/* enable the controller and de-assert nFCE */
 
 		writel(S3C2440_NFCONT_ENABLE, info->regs + S3C2440_NFCONT);
@@ -803,7 +804,7 @@ static void s3c2410_nand_init_chip(struct s3c2410_nand_info *info,
 			dev_info(info->device, "System booted from NAND\n");
 
 		break;
-  	}
+	}
 
 	chip->IO_ADDR_R = chip->IO_ADDR_W;
 
@@ -913,7 +914,7 @@ static void s3c2410_nand_update_chip(struct s3c2410_nand_info *info,
 static int s3c24xx_nand_probe(struct platform_device *pdev)
 {
 	struct s3c2410_platform_nand *plat = to_nand_plat(pdev);
-	enum s3c_cpu_type cpu_type; 
+	enum s3c_cpu_type cpu_type;
 	struct s3c2410_nand_info *info;
 	struct s3c2410_nand_mtd *nmtd;
 	struct s3c2410_nand_set *sets;
-- 
1.7.4.1
