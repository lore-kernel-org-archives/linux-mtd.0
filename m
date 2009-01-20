Received: from 89.6b.364a.static.theplanet.com ([74.54.107.137]
	helo=cathcart.site5.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LPB7T-0002Fu-Nw
	for linux-mtd@lists.infradead.org; Tue, 20 Jan 2009 07:34:00 +0000
From: Mike Rapoport <mike@compulab.co.il>
To: eric.miao@marvell.com
Subject: [PATCH] MTD: NAND: pxa3xx_nand: allow building as module
Date: Tue, 20 Jan 2009 09:33:47 +0200
Message-Id: <1232436828-15176-3-git-send-email-mike@compulab.co.il>
In-Reply-To: <1232436828-15176-2-git-send-email-mike@compulab.co.il>
References: <f17812d70901191916u3891547ds393942a4e444a351@mail.gmail.com>
	<1232436828-15176-1-git-send-email-mike@compulab.co.il>
	<1232436828-15176-2-git-send-email-mike@compulab.co.il>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.arm.linux.org.uk,
	ben-linux@fluff.org, Mike Rapoport <mike@compulab.co.il>
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
