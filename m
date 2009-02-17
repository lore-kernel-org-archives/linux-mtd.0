Received: from cathcart.site5.com ([74.54.107.137])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LZOXT-0005OF-5I
	for linux-mtd@lists.infradead.org; Tue, 17 Feb 2009 11:55:11 +0000
From: Mike Rapoport <mike@compulab.co.il>
To: dwmw2@infradead.org
Subject: [PATCH] MTD: NAND: pxa3xx_nand: allow building as module
Date: Tue, 17 Feb 2009 13:54:46 +0200
Message-Id: <71cb1989e5853492778ff61d76b2a55197f6ac69.1234871317.git.mike@compulab.co.il>
In-Reply-To: <cover.1234871317.git.mike@compulab.co.il>
References: <cover.1234871317.git.mike@compulab.co.il>
Cc: eric.miao@marvell.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Signed-off-by: Mike Rapoport <mike@compulab.co.il>
---
 drivers/mtd/nand/Kconfig       |    2 +-
 drivers/mtd/nand/pxa3xx_nand.c |   10 ++++++++++
 2 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 8b12e6e..d3966d0 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -334,7 +334,7 @@ config MTD_NAND_ATMEL_ECC_NONE
 endchoice
 
 config MTD_NAND_PXA3xx
-	bool "Support for NAND flash devices on PXA3xx"
+	tristate "Support for NAND flash devices on PXA3xx"
 	depends on MTD_NAND && PXA3xx
 	help
 	  This enables the driver for the NAND flash device found on
diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index ffa960b..ead4a7a 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1079,6 +1079,7 @@ static int pxa3xx_nand_probe(struct platform_device *pdev)
 
 	this = &info->nand_chip;
 	mtd->priv = info;
+	mtd->owner = THIS_MODULE;
 
 	info->clk = clk_get(&pdev->dev, NULL);
 	if (IS_ERR(info->clk)) {
@@ -1187,6 +1188,7 @@ static int pxa3xx_nand_remove(struct platform_device *pdev)
 {
 	struct mtd_info *mtd = platform_get_drvdata(pdev);
 	struct pxa3xx_nand_info *info = mtd->priv;
+	struct resource *r;
 
 	platform_set_drvdata(pdev, NULL);
 
@@ -1199,6 +1201,14 @@ static int pxa3xx_nand_remove(struct platform_device *pdev)
 				info->data_buff, info->data_buff_phys);
 	} else
 		kfree(info->data_buff);
+
+	iounmap(info->mmio_base);
+	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	release_mem_region(r->start, resource_size(r));
+
+	clk_disable(info->clk);
+	clk_put(info->clk);
+
 	kfree(mtd);
 	return 0;
 }
-- 
1.5.6.4
