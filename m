MIME-Version: 1.0
Date: Wed, 28 Jul 2010 13:59:03 +0800
Message-ID: <AANLkTimV7uMuRuRaxqJG-GpwsTuMisZPsGn1bwV68_wW@mail.gmail.com>
Subject: [PATCH 28/29] pxa3xx_nand: fix power management support
From: Haojian Zhuang <haojian.zhuang@gmail.com>
To: Eric Miao <eric.y.miao@gmail.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	David Woodhouse <david.woodhouse@intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>, linux-mtd@lists.infradead.org,
	Lei Wen <leiwen@marvell.com>
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From 126fa886e4902a655805e8699b8b208fa931c141 Mon Sep 17 00:00:00 2001
From: Lei Wen <leiwen@marvell.com>
Date: Tue, 22 Jun 2010 23:17:36 +0800
Subject: [PATCH 28/29] pxa3xx_nand: fix power management support

Signed-off-by: Lei Wen <leiwen@marvell.com>
Signed-off-by: Haojian Zhuang <haojian.zhuang@marvell.com>
---
 drivers/mtd/nand/pxa3xx_nand.c |   48 +++++++++++++++++++++++++++++++--------
 1 files changed, 38 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 65cf54c..bc2f56d 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1659,26 +1659,54 @@ static int __devinit pxa3xx_nand_probe(struct
platform_device *pdev)
 #ifdef CONFIG_PM
 static int pxa3xx_nand_suspend(struct platform_device *pdev,
pm_message_t state)
 {
-	struct pxa3xx_nand_info *info = platform_get_drvdata(pdev);
-	struct mtd_info *mtd = info->mtd;
+	struct pxa3xx_nand *nand= platform_get_drvdata(pdev);
+	struct pxa3xx_nand_info *info;
+	struct mtd_info *mtd;
+	int ret = 0;
+	uint8_t cs;

-	if (info->state & STATE_CMD_PREPARED) {
-		dev_err(&pdev->dev, "driver busy, state = %d\n", info->state);
+	if (nand->state & STATE_CMD_PREPARED) {
+		dev_err(&pdev->dev, "driver busy, state = %d\n", nand->state);
 		return -EAGAIN;
 	}

-	return 0;
+	for (cs = 0; cs < NUM_CHIP_SELECT; cs ++) {
+		info = nand->info[cs];
+		if (!info)
+			continue;
+		mtd = get_mtd_by_info(info);
+		ret = mtd->suspend(mtd);
+	}
+
+	return ret;
 }

 static int pxa3xx_nand_resume(struct platform_device *pdev)
 {
-	struct pxa3xx_nand_info *info = platform_get_drvdata(pdev);
-	struct mtd_info *mtd = info->mtd;
+	struct pxa3xx_nand *nand= platform_get_drvdata(pdev);
+	struct pxa3xx_nand_info *info;
+	struct mtd_info *mtd;
+	uint8_t cs;

-	nand_writel(info, NDTR0CS0, info->ndtr0cs0);
-	nand_writel(info, NDTR1CS0, info->ndtr1cs0);
-	clk_enable(info->clk);
+	for (cs = 0; cs < NUM_CHIP_SELECT; cs ++) {
+		info = nand->info[cs];
+		if (!info)
+			continue;
+		nand_writel(nand, NDTR0CS0, info->ndtr0cs0);
+		nand_writel(nand, NDTR1CS0, info->ndtr1cs0);
+		nand->chip_select = cs;
+		/* Sometimes nand chip would raise a ready interrupt
+		 * when resume, reset the by start and stop to prevent
+		 * it damage driver's state machine */
+		pxa3xx_nand_start(nand);
+		pxa3xx_nand_stop(nand);
+		mtd = get_mtd_by_info(info);
+		mtd->resume(mtd);
+	}

+	/* set the controller cs to a invalid num to let driver
+	 * reconfigure the timing when it call the cmdfunc */
+	nand->chip_select = 0xff;
 	return 0;
 }
 #else
-- 
1.7.0.4
