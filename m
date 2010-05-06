MIME-Version: 1.0
Date: Thu, 6 May 2010 05:03:43 -0400
Message-ID: <s2g771cded01005060203k72de1893v7ad0edf334a202db@mail.gmail.com>
Subject: [PATCH 04/20] pxa3xx_nand: make scan procedure more clear
From: Haojian Zhuang <haojian.zhuang@gmail.com>
To: Eric Miao <eric.y.miao@gmail.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	David Woodhouse <david.woodhouse@intel.com>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From 78db579669aa28a7f8e8bdc5515e63acc2454639 Mon Sep 17 00:00:00 2001
From: Lei Wen <leiwen@marvell.com>
Date: Mon, 22 Mar 2010 10:35:49 +0800
Subject: [PATCH] pxa3xx_nand: make scan procedure more clear

Signed-off-by: Lei Wen <leiwen@marvell.com>
Signed-off-by: Haojian Zhuang <haojian.zhuang@marvell.com>
---
 drivers/mtd/nand/pxa3xx_nand.c |   66 +++++++++++++++++++++++----------------
 1 files changed, 39 insertions(+), 27 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 2dfe6d9..0ef9bf9 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -160,6 +160,7 @@ struct pxa3xx_nand_info {
 	unsigned int 		buf_start;
 	unsigned int		buf_count;

+	struct mtd_info         *mtd;
 	/* DMA information */
 	int			drcmr_dat;
 	int			drcmr_cmd;
@@ -1096,21 +1097,13 @@ static void pxa3xx_nand_init_mtd(struct mtd_info *mtd,
 	this->chip_delay = 25;
 }

-static int __devinit pxa3xx_nand_probe(struct platform_device *pdev)
+static int alloc_nand_resource(struct platform_device *pdev)
 {
-	struct pxa3xx_nand_platform_data *pdata;
+	struct pxa3xx_nand_platform_data *pdata = pdev->dev.platform_data;
 	struct pxa3xx_nand_info *info;
-	struct nand_chip *this;
 	struct mtd_info *mtd;
 	struct resource *r;
-	int ret = 0, irq;
-
-	pdata = pdev->dev.platform_data;
-
-	if (!pdata) {
-		dev_err(&pdev->dev, "no platform data defined\n");
-		return -ENODEV;
-	}
+	int ret, irq;

 	mtd = kzalloc(sizeof(struct mtd_info) + sizeof(struct pxa3xx_nand_info),
 			GFP_KERNEL);
@@ -1122,8 +1115,8 @@ static int __devinit pxa3xx_nand_probe(struct
platform_device *pdev)
 	info = (struct pxa3xx_nand_info *)(&mtd[1]);
 	info->pdev = pdev;

-	this = &info->nand_chip;
 	mtd->priv = info;
+	info->mtd = mtd;
 	mtd->owner = THIS_MODULE;

 	info->clk = clk_get(&pdev->dev, NULL);
@@ -1201,16 +1194,9 @@ static int __devinit pxa3xx_nand_probe(struct
platform_device *pdev)
 	}

 	pxa3xx_nand_init_mtd(mtd, info);
+	platform_set_drvdata(pdev, info);

-	platform_set_drvdata(pdev, mtd);
-
-	if (nand_scan(mtd, 1)) {
-		dev_err(&pdev->dev, "failed to scan nand\n");
-		ret = -ENXIO;
-		goto fail_free_irq;
-	}
-
-	return add_mtd_partitions(mtd, pdata->parts, pdata->nr_parts);
+	return 0;

 fail_free_irq:
 	free_irq(irq, info);
@@ -1235,8 +1221,8 @@ fail_free_mtd:

 static int pxa3xx_nand_remove(struct platform_device *pdev)
 {
-	struct mtd_info *mtd = platform_get_drvdata(pdev);
-	struct pxa3xx_nand_info *info = mtd->priv;
+	struct pxa3xx_nand_info *info = platform_get_drvdata(pdev);
+	struct mtd_info *mtd = info->mtd;
 	struct resource *r;
 	int irq;

@@ -1265,11 +1251,37 @@ static int pxa3xx_nand_remove(struct
platform_device *pdev)
 	return 0;
 }

+static int __devinit pxa3xx_nand_probe(struct platform_device *pdev)
+{
+	struct pxa3xx_nand_platform_data *pdata;
+	struct pxa3xx_nand_info *info;
+	int ret;
+
+	pdata = pdev->dev.platform_data;
+	if (!pdata) {
+		dev_err(&pdev->dev, "no platform data defined\n");
+		return -ENODEV;
+	}
+
+	ret = alloc_nand_resource(pdev);
+	if (ret)
+		return ret;
+
+	info = platform_get_drvdata(pdev);
+	if (nand_scan(info->mtd, 1)) {
+		dev_err(&pdev->dev, "failed to scan nand\n");
+		pxa3xx_nand_remove(pdev);
+		return -ENODEV;
+	}
+
+	return add_mtd_partitions(info->mtd, pdata->parts, pdata->nr_parts);
+}
+
 #ifdef CONFIG_PM
 static int pxa3xx_nand_suspend(struct platform_device *pdev,
pm_message_t state)
 {
-	struct mtd_info *mtd = (struct mtd_info *)platform_get_drvdata(pdev);
-	struct pxa3xx_nand_info *info = mtd->priv;
+	struct pxa3xx_nand_info *info = platform_get_drvdata(pdev);
+	struct mtd_info *mtd = info->mtd;

 	if (info->state != STATE_READY) {
 		dev_err(&pdev->dev, "driver busy, state = %d\n", info->state);
@@ -1281,8 +1293,8 @@ static int pxa3xx_nand_suspend(struct
platform_device *pdev, pm_message_t state)

 static int pxa3xx_nand_resume(struct platform_device *pdev)
 {
-	struct mtd_info *mtd = (struct mtd_info *)platform_get_drvdata(pdev);
-	struct pxa3xx_nand_info *info = mtd->priv;
+	struct pxa3xx_nand_info *info = platform_get_drvdata(pdev);
+	struct mtd_info *mtd = info->mtd;

 	nand_writel(info, NDTR0CS0, info->ndtr0cs0);
 	nand_writel(info, NDTR1CS0, info->ndtr1cs0);
-- 
1.5.6.5
