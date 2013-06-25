Received: from mailout1.samsung.com ([203.254.224.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UrI9S-0001Ct-8H
 for linux-mtd@lists.infradead.org; Tue, 25 Jun 2013 01:34:38 +0000
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOX00I0ODN290A0@mailout1.samsung.com> for
 linux-mtd@lists.infradead.org; Tue, 25 Jun 2013 10:34:10 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Artem Bityutskiy' <artem.bityutskiy@linux.intel.com>
Subject: [PATCH V2] mtd: remove unnecessary platform_set_drvdata()
Date: Tue, 25 Jun 2013 10:34:09 +0900
Message-id: <000b01ce7144$16df2280$449d6780$@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: 'Roland Stigge' <stigge@antcom.de>,
 'Marc Kleine-Budde' <mkl@blackshift.org>, 'Mike Dunn' <mikedunn@newsguy.com>,
 'Artem Bityutskiy' <dedekind1@gmail.com>,
 'Viresh Kumar' <viresh.kumar@linaro.org>, Jingoo Han <jg1.han@samsung.com>,
 'Josh Wu' <josh.wu@atmel.com>, linux-mtd@lists.infradead.org, "'Gupta,
 Pekon'" <pekon@ti.com>, 'Shawn Guo' <shawn.guo@linaro.org>,
 'David Woodhouse' <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The driver core clears the driver data to NULL after device_release
or on probe failure, since commit 0998d0631001288a5974afc0b2a5f568bcdecb4d
(device-core: Ensure drvdata = NULL when no driver is bound).
Thus, it is not needed to manually clear the device driver data to NULL.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
Acked-by: Marc Kleine-Budde <mkl@blackshift.org>
Acked-by: Shawn Guo <shawn.guo@linaro.org>
Acked-by: Roland Stigge <stigge@antcom.de>
Acked-by: Josh Wu <josh.wu@atmel.com>
Acked-by: Mike Dunn <mikedunn@newsguy.com>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Acked-by: Pekon Gupta <pekon@ti.com>
Tested-by: Roland Stigge <stigge@antcom.de>
---
 drivers/mtd/devices/elm.c              |    1 -
 drivers/mtd/devices/spear_smi.c        |    5 +----
 drivers/mtd/maps/ixp4xx.c              |    2 --
 drivers/mtd/maps/latch-addr-flash.c    |    1 -
 drivers/mtd/maps/physmap.c             |    1 -
 drivers/mtd/maps/plat-ram.c            |    2 --
 drivers/mtd/maps/pxa2xx-flash.c        |    2 --
 drivers/mtd/maps/rbtx4939-flash.c      |    1 -
 drivers/mtd/maps/sa1100-flash.c        |    1 -
 drivers/mtd/nand/ams-delta.c           |    1 -
 drivers/mtd/nand/atmel_nand.c          |    1 -
 drivers/mtd/nand/bf5xx_nand.c          |    3 ---
 drivers/mtd/nand/docg4.c               |    2 --
 drivers/mtd/nand/fsmc_nand.c           |    2 --
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    2 --
 drivers/mtd/nand/jz4740_nand.c         |    2 --
 drivers/mtd/nand/lpc32xx_mlc.c         |    2 --
 drivers/mtd/nand/lpc32xx_slc.c         |    2 --
 drivers/mtd/nand/mxc_nand.c            |    2 --
 drivers/mtd/nand/nuc900_nand.c         |    2 --
 drivers/mtd/nand/omap2.c               |    1 -
 drivers/mtd/nand/orion_nand.c          |    1 -
 drivers/mtd/nand/plat_nand.c           |    1 -
 drivers/mtd/nand/pxa3xx_nand.c         |    1 -
 drivers/mtd/nand/s3c2410.c             |    2 --
 drivers/mtd/nand/sharpsl.c             |    3 ---
 drivers/mtd/nand/txx9ndfmc.c           |    1 -
 drivers/mtd/onenand/generic.c          |    2 --
 drivers/mtd/onenand/omap2.c            |    1 -
 drivers/mtd/onenand/samsung.c          |    1 -
 30 files changed, 1 insertion(+), 50 deletions(-)

diff --git a/drivers/mtd/devices/elm.c b/drivers/mtd/devices/elm.c
index fc8ad9f..4fab47a 100644
--- a/drivers/mtd/devices/elm.c
+++ b/drivers/mtd/devices/elm.c
@@ -381,7 +381,6 @@ static int elm_remove(struct platform_device *pdev)
 {
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-	platform_set_drvdata(pdev, NULL);
 	return 0;
 }
 
diff --git a/drivers/mtd/devices/spear_smi.c b/drivers/mtd/devices/spear_smi.c
index 0e1c22e..092bb68 100644
--- a/drivers/mtd/devices/spear_smi.c
+++ b/drivers/mtd/devices/spear_smi.c
@@ -995,14 +995,12 @@ static int spear_smi_probe(struct platform_device *pdev)
 		ret = spear_smi_setup_banks(pdev, i, pdata->np[i]);
 		if (ret) {
 			dev_err(&dev->pdev->dev, "bank setup failed\n");
-			goto err_bank_setup;
+			goto err_irq;
 		}
 	}
 
 	return 0;
 
-err_bank_setup:
-	platform_set_drvdata(pdev, NULL);
 err_irq:
 	clk_disable_unprepare(dev->clk);
 err:
@@ -1040,7 +1038,6 @@ static int spear_smi_remove(struct platform_device *pdev)
 	}
 
 	clk_disable_unprepare(dev->clk);
-	platform_set_drvdata(pdev, NULL);
 
 	return 0;
 }
diff --git a/drivers/mtd/maps/ixp4xx.c b/drivers/mtd/maps/ixp4xx.c
index 52b3410..09c542b 100644
--- a/drivers/mtd/maps/ixp4xx.c
+++ b/drivers/mtd/maps/ixp4xx.c
@@ -155,8 +155,6 @@ static int ixp4xx_flash_remove(struct platform_device *dev)
 	struct flash_platform_data *plat = dev->dev.platform_data;
 	struct ixp4xx_flash_info *info = platform_get_drvdata(dev);
 
-	platform_set_drvdata(dev, NULL);
-
 	if(!info)
 		return 0;
 
diff --git a/drivers/mtd/maps/latch-addr-flash.c b/drivers/mtd/maps/latch-addr-flash.c
index ab0fead..675ccb8 100644
--- a/drivers/mtd/maps/latch-addr-flash.c
+++ b/drivers/mtd/maps/latch-addr-flash.c
@@ -102,7 +102,6 @@ static int latch_addr_flash_remove(struct platform_device *dev)
 	info = platform_get_drvdata(dev);
 	if (info == NULL)
 		return 0;
-	platform_set_drvdata(dev, NULL);
 
 	latch_addr_data = dev->dev.platform_data;
 
diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index e7a592c..9eb7ead9 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -40,7 +40,6 @@ static int physmap_flash_remove(struct platform_device *dev)
 	info = platform_get_drvdata(dev);
 	if (info == NULL)
 		return 0;
-	platform_set_drvdata(dev, NULL);
 
 	physmap_data = dev->dev.platform_data;
 
diff --git a/drivers/mtd/maps/plat-ram.c b/drivers/mtd/maps/plat-ram.c
index 71fdda2..b0b85eb 100644
--- a/drivers/mtd/maps/plat-ram.c
+++ b/drivers/mtd/maps/plat-ram.c
@@ -84,8 +84,6 @@ static int platram_remove(struct platform_device *pdev)
 {
 	struct platram_info *info = to_platram_info(pdev);
 
-	platform_set_drvdata(pdev, NULL);
-
 	dev_dbg(&pdev->dev, "removing device\n");
 
 	if (info == NULL)
diff --git a/drivers/mtd/maps/pxa2xx-flash.c b/drivers/mtd/maps/pxa2xx-flash.c
index acb1dbc..22c55cb 100644
--- a/drivers/mtd/maps/pxa2xx-flash.c
+++ b/drivers/mtd/maps/pxa2xx-flash.c
@@ -107,8 +107,6 @@ static int pxa2xx_flash_remove(struct platform_device *dev)
 {
 	struct pxa2xx_flash_info *info = platform_get_drvdata(dev);
 
-	platform_set_drvdata(dev, NULL);
-
 	mtd_device_unregister(info->mtd);
 
 	map_destroy(info->mtd);
diff --git a/drivers/mtd/maps/rbtx4939-flash.c b/drivers/mtd/maps/rbtx4939-flash.c
index ac02fbf..ab4ec55 100644
--- a/drivers/mtd/maps/rbtx4939-flash.c
+++ b/drivers/mtd/maps/rbtx4939-flash.c
@@ -34,7 +34,6 @@ static int rbtx4939_flash_remove(struct platform_device *dev)
 	info = platform_get_drvdata(dev);
 	if (!info)
 		return 0;
-	platform_set_drvdata(dev, NULL);
 
 	if (info->mtd) {
 		struct rbtx4939_flash_data *pdata = dev->dev.platform_data;
diff --git a/drivers/mtd/maps/sa1100-flash.c b/drivers/mtd/maps/sa1100-flash.c
index 29e3dca..9e70f8e 100644
--- a/drivers/mtd/maps/sa1100-flash.c
+++ b/drivers/mtd/maps/sa1100-flash.c
@@ -279,7 +279,6 @@ static int __exit sa1100_mtd_remove(struct platform_device *pdev)
 	struct sa_info *info = platform_get_drvdata(pdev);
 	struct flash_platform_data *plat = pdev->dev.platform_data;
 
-	platform_set_drvdata(pdev, NULL);
 	sa1100_destroy(info, plat);
 
 	return 0;
diff --git a/drivers/mtd/nand/ams-delta.c b/drivers/mtd/nand/ams-delta.c
index f1d71cd..8611eb4 100644
--- a/drivers/mtd/nand/ams-delta.c
+++ b/drivers/mtd/nand/ams-delta.c
@@ -258,7 +258,6 @@ static int ams_delta_init(struct platform_device *pdev)
  out_mtd:
 	gpio_free_array(_mandatory_gpio, ARRAY_SIZE(_mandatory_gpio));
 out_gpio:
-	platform_set_drvdata(pdev, NULL);
 	gpio_free(AMS_DELTA_GPIO_PIN_NAND_RB);
 	iounmap(io_base);
 out_free:
diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 2d23d29..36c52f5 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -1665,7 +1665,6 @@ err_hw_ecc:
 err_scan_ident:
 err_no_card:
 	atmel_nand_disable(host);
-	platform_set_drvdata(pdev, NULL);
 	if (host->dma_chan)
 		dma_release_channel(host->dma_chan);
 err_ecc_ioremap:
diff --git a/drivers/mtd/nand/bf5xx_nand.c b/drivers/mtd/nand/bf5xx_nand.c
index 776df36..809a63c 100644
--- a/drivers/mtd/nand/bf5xx_nand.c
+++ b/drivers/mtd/nand/bf5xx_nand.c
@@ -671,8 +671,6 @@ static int bf5xx_nand_remove(struct platform_device *pdev)
 {
 	struct bf5xx_nand_info *info = to_nand_info(pdev);
 
-	platform_set_drvdata(pdev, NULL);
-
 	/* first thing we need to do is release all our mtds
 	 * and their partitions, then go through freeing the
 	 * resources used
@@ -832,7 +830,6 @@ static int bf5xx_nand_probe(struct platform_device *pdev)
 out_err_nand_scan:
 	bf5xx_nand_dma_remove(info);
 out_err_hw_init:
-	platform_set_drvdata(pdev, NULL);
 	kfree(info);
 out_err_kzalloc:
 	peripheral_free_list(bfin_nfc_pin_req);
diff --git a/drivers/mtd/nand/docg4.c b/drivers/mtd/nand/docg4.c
index fa25e7a..dc86d4a 100644
--- a/drivers/mtd/nand/docg4.c
+++ b/drivers/mtd/nand/docg4.c
@@ -1368,7 +1368,6 @@ static int __init probe_docg4(struct platform_device *pdev)
 		struct nand_chip *nand = mtd->priv;
 		struct docg4_priv *doc = nand->priv;
 		nand_release(mtd); /* deletes partitions and mtd devices */
-		platform_set_drvdata(pdev, NULL);
 		free_bch(doc->bch);
 		kfree(mtd);
 	}
@@ -1380,7 +1379,6 @@ static int __exit cleanup_docg4(struct platform_device *pdev)
 {
 	struct docg4_priv *doc = platform_get_drvdata(pdev);
 	nand_release(doc->mtd);
-	platform_set_drvdata(pdev, NULL);
 	free_bch(doc->bch);
 	kfree(doc->mtd);
 	iounmap(doc->virtadr);
diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index 0378386..2a3b1b9 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -1192,8 +1192,6 @@ static int fsmc_nand_remove(struct platform_device *pdev)
 {
 	struct fsmc_nand_data *host = platform_get_drvdata(pdev);
 
-	platform_set_drvdata(pdev, NULL);
-
 	if (host) {
 		nand_release(&host->mtd);
 
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 25ecfa1..7869210 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -1633,7 +1633,6 @@ static int gpmi_nand_probe(struct platform_device *pdev)
 exit_nfc_init:
 	release_resources(this);
 exit_acquire_resources:
-	platform_set_drvdata(pdev, NULL);
 	dev_err(this->dev, "driver registration failed: %d\n", ret);
 	kfree(this);
 
@@ -1646,7 +1645,6 @@ static int gpmi_nand_remove(struct platform_device *pdev)
 
 	gpmi_nfc_exit(this);
 	release_resources(this);
-	platform_set_drvdata(pdev, NULL);
 	kfree(this);
 	return 0;
 }
diff --git a/drivers/mtd/nand/jz4740_nand.c b/drivers/mtd/nand/jz4740_nand.c
index b76460e..698a4d1 100644
--- a/drivers/mtd/nand/jz4740_nand.c
+++ b/drivers/mtd/nand/jz4740_nand.c
@@ -538,7 +538,6 @@ err_unclaim_banks:
 err_gpio_busy:
 	if (pdata && gpio_is_valid(pdata->busy_gpio))
 		gpio_free(pdata->busy_gpio);
-	platform_set_drvdata(pdev, NULL);
 err_iounmap_mmio:
 	jz_nand_iounmap_resource(nand->mem, nand->base);
 err_free:
@@ -570,7 +569,6 @@ static int jz_nand_remove(struct platform_device *pdev)
 
 	jz_nand_iounmap_resource(nand->mem, nand->base);
 
-	platform_set_drvdata(pdev, NULL);
 	kfree(nand);
 
 	return 0;
diff --git a/drivers/mtd/nand/lpc32xx_mlc.c b/drivers/mtd/nand/lpc32xx_mlc.c
index fd1df5e..74a469b 100644
--- a/drivers/mtd/nand/lpc32xx_mlc.c
+++ b/drivers/mtd/nand/lpc32xx_mlc.c
@@ -828,7 +828,6 @@ err_exit3:
 err_exit2:
 	clk_disable(host->clk);
 	clk_put(host->clk);
-	platform_set_drvdata(pdev, NULL);
 err_exit1:
 	lpc32xx_wp_enable(host);
 	gpio_free(host->ncfg->wp_gpio);
@@ -851,7 +850,6 @@ static int lpc32xx_nand_remove(struct platform_device *pdev)
 
 	clk_disable(host->clk);
 	clk_put(host->clk);
-	platform_set_drvdata(pdev, NULL);
 
 	lpc32xx_wp_enable(host);
 	gpio_free(host->ncfg->wp_gpio);
diff --git a/drivers/mtd/nand/lpc32xx_slc.c b/drivers/mtd/nand/lpc32xx_slc.c
index be94ed5..a66f33f 100644
--- a/drivers/mtd/nand/lpc32xx_slc.c
+++ b/drivers/mtd/nand/lpc32xx_slc.c
@@ -936,7 +936,6 @@ err_exit3:
 err_exit2:
 	clk_disable(host->clk);
 	clk_put(host->clk);
-	platform_set_drvdata(pdev, NULL);
 err_exit1:
 	lpc32xx_wp_enable(host);
 	gpio_free(host->ncfg->wp_gpio);
@@ -963,7 +962,6 @@ static int lpc32xx_nand_remove(struct platform_device *pdev)
 
 	clk_disable(host->clk);
 	clk_put(host->clk);
-	platform_set_drvdata(pdev, NULL);
 	lpc32xx_wp_enable(host);
 	gpio_free(host->ncfg->wp_gpio);
 
diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 07e5784..18855ad 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -1578,8 +1578,6 @@ static int mxcnd_remove(struct platform_device *pdev)
 {
 	struct mxc_nand_host *host = platform_get_drvdata(pdev);
 
-	platform_set_drvdata(pdev, NULL);
-
 	nand_release(&host->mtd);
 
 	return 0;
diff --git a/drivers/mtd/nand/nuc900_nand.c b/drivers/mtd/nand/nuc900_nand.c
index cd6be2e..5211515 100644
--- a/drivers/mtd/nand/nuc900_nand.c
+++ b/drivers/mtd/nand/nuc900_nand.c
@@ -324,8 +324,6 @@ static int nuc900_nand_remove(struct platform_device *pdev)
 
 	kfree(nuc900_nand);
 
-	platform_set_drvdata(pdev, NULL);
-
 	return 0;
 }
 
diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 81b80af..daa3dfc 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -2087,7 +2087,6 @@ static int omap_nand_remove(struct platform_device *pdev)
 							mtd);
 	omap3_free_bch(&info->mtd);
 
-	platform_set_drvdata(pdev, NULL);
 	if (info->dma)
 		dma_release_channel(info->dma);
 
diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
index 8fbd002..46f308d 100644
--- a/drivers/mtd/nand/orion_nand.c
+++ b/drivers/mtd/nand/orion_nand.c
@@ -186,7 +186,6 @@ no_dev:
 		clk_disable_unprepare(clk);
 		clk_put(clk);
 	}
-	platform_set_drvdata(pdev, NULL);
 	iounmap(io_base);
 no_res:
 	kfree(nc);
diff --git a/drivers/mtd/nand/plat_nand.c b/drivers/mtd/nand/plat_nand.c
index c004566..d42700a 100644
--- a/drivers/mtd/nand/plat_nand.c
+++ b/drivers/mtd/nand/plat_nand.c
@@ -122,7 +122,6 @@ static int plat_nand_probe(struct platform_device *pdev)
 out:
 	if (pdata->ctrl.remove)
 		pdata->ctrl.remove(pdev);
-	platform_set_drvdata(pdev, NULL);
 	iounmap(data->io_base);
 out_release_io:
 	release_mem_region(res->start, resource_size(res));
diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 14d3db5..cd67f2a 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1165,7 +1165,6 @@ static int pxa3xx_nand_remove(struct platform_device *pdev)
 		return 0;
 
 	pdata = pdev->dev.platform_data;
-	platform_set_drvdata(pdev, NULL);
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq >= 0)
diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index d65afd2..191823e 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -697,8 +697,6 @@ static int s3c24xx_nand_remove(struct platform_device *pdev)
 {
 	struct s3c2410_nand_info *info = to_nand_info(pdev);
 
-	platform_set_drvdata(pdev, NULL);
-
 	if (info == NULL)
 		return 0;
 
diff --git a/drivers/mtd/nand/sharpsl.c b/drivers/mtd/nand/sharpsl.c
index 127bc42..1d41578 100644
--- a/drivers/mtd/nand/sharpsl.c
+++ b/drivers/mtd/nand/sharpsl.c
@@ -194,7 +194,6 @@ err_add:
 	nand_release(&sharpsl->mtd);
 
 err_scan:
-	platform_set_drvdata(pdev, NULL);
 	iounmap(sharpsl->io);
 err_ioremap:
 err_get_res:
@@ -212,8 +211,6 @@ static int sharpsl_nand_remove(struct platform_device *pdev)
 	/* Release resources, unregister device */
 	nand_release(&sharpsl->mtd);
 
-	platform_set_drvdata(pdev, NULL);
-
 	iounmap(sharpsl->io);
 
 	/* Free the MTD device structure */
diff --git a/drivers/mtd/nand/txx9ndfmc.c b/drivers/mtd/nand/txx9ndfmc.c
index 7ed654c..0488dd5 100644
--- a/drivers/mtd/nand/txx9ndfmc.c
+++ b/drivers/mtd/nand/txx9ndfmc.c
@@ -387,7 +387,6 @@ static int __exit txx9ndfmc_remove(struct platform_device *dev)
 	struct txx9ndfmc_drvdata *drvdata = platform_get_drvdata(dev);
 	int i;
 
-	platform_set_drvdata(dev, NULL);
 	if (!drvdata)
 		return 0;
 	for (i = 0; i < MAX_TXX9NDFMC_DEV; i++) {
diff --git a/drivers/mtd/onenand/generic.c b/drivers/mtd/onenand/generic.c
index 9f11562..42520a3 100644
--- a/drivers/mtd/onenand/generic.c
+++ b/drivers/mtd/onenand/generic.c
@@ -94,8 +94,6 @@ static int generic_onenand_remove(struct platform_device *pdev)
 	struct resource *res = pdev->resource;
 	unsigned long size = resource_size(res);
 
-	platform_set_drvdata(pdev, NULL);
-
 	if (info) {
 		onenand_release(&info->mtd);
 		release_mem_region(res->start, size);
diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
index d98b198..cd43cea 100644
--- a/drivers/mtd/onenand/omap2.c
+++ b/drivers/mtd/onenand/omap2.c
@@ -810,7 +810,6 @@ static int omap2_onenand_remove(struct platform_device *pdev)
 	if (c->dma_channel != -1)
 		omap_free_dma(c->dma_channel);
 	omap2_onenand_shutdown(pdev);
-	platform_set_drvdata(pdev, NULL);
 	if (c->gpio_irq) {
 		free_irq(gpio_to_irq(c->gpio_irq), c);
 		gpio_free(c->gpio_irq);
diff --git a/drivers/mtd/onenand/samsung.c b/drivers/mtd/onenand/samsung.c
index 2cf7408..cebc48d 100644
--- a/drivers/mtd/onenand/samsung.c
+++ b/drivers/mtd/onenand/samsung.c
@@ -1073,7 +1073,6 @@ static int s3c_onenand_remove(struct platform_device *pdev)
 	release_mem_region(onenand->base_res->start,
 			   resource_size(onenand->base_res));
 
-	platform_set_drvdata(pdev, NULL);
 	kfree(onenand->oob_buf);
 	kfree(onenand->page_buf);
 	kfree(onenand);
-- 
1.7.10.4
