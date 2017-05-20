Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dC6Fb-0000hS-8Z
 for linux-mtd@lists.infradead.org; Sat, 20 May 2017 15:25:13 +0000
Received: by mail-qt0-x242.google.com with SMTP id l39so13177669qtb.1
 for <linux-mtd@lists.infradead.org>; Sat, 20 May 2017 08:24:43 -0700 (PDT)
From: "Mario J. Rugiero" <mrugiero@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: computersforpeace@gmail.com, boris.brezillon@free-electrons.com,
 marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr,
 "Mario J. Rugiero" <mrugiero@gmail.com>
Subject: [PATCH 2/3] mtd: nand: create a wrapper for mtd_device_register for
 NAND specific initialization.
Date: Sat, 20 May 2017 12:24:27 -0300
Message-Id: <20170520152428.9184-3-mrugiero@gmail.com>
In-Reply-To: <20170520152428.9184-2-mrugiero@gmail.com>
References: <20170520152428.9184-1-mrugiero@gmail.com>
 <20170520152428.9184-2-mrugiero@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Drivers are updated to use this wrapper.

Signed-off-by: Mario J. Rugiero <mrugiero@gmail.com>
---
 drivers/mtd/nand/ams-delta.c             |  2 +-
 drivers/mtd/nand/atmel/nand-controller.c |  2 +-
 drivers/mtd/nand/au1550nd.c              |  2 +-
 drivers/mtd/nand/bf5xx_nand.c            |  2 +-
 drivers/mtd/nand/brcmnand/brcmnand.c     |  2 +-
 drivers/mtd/nand/davinci_nand.c          |  2 +-
 drivers/mtd/nand/denali.c                |  2 +-
 drivers/mtd/nand/diskonchip.c            |  4 ++--
 drivers/mtd/nand/fsl_upm.c               |  2 +-
 drivers/mtd/nand/fsmc_nand.c             |  2 +-
 drivers/mtd/nand/gpio.c                  |  2 +-
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c   |  2 +-
 drivers/mtd/nand/hisi504_nand.c          |  2 +-
 drivers/mtd/nand/jz4780_nand.c           |  2 +-
 drivers/mtd/nand/lpc32xx_mlc.c           |  2 +-
 drivers/mtd/nand/lpc32xx_slc.c           |  2 +-
 drivers/mtd/nand/mpc5121_nfc.c           |  2 +-
 drivers/mtd/nand/nand_base.c             | 19 +++++++++++++++++++
 drivers/mtd/nand/nandsim.c               |  2 +-
 drivers/mtd/nand/ndfc.c                  |  2 +-
 drivers/mtd/nand/nuc900_nand.c           |  2 +-
 drivers/mtd/nand/omap2.c                 |  4 ++--
 drivers/mtd/nand/orion_nand.c            |  2 +-
 drivers/mtd/nand/oxnas_nand.c            |  2 +-
 drivers/mtd/nand/pasemi_nand.c           |  2 +-
 drivers/mtd/nand/pxa3xx_nand.c           |  2 +-
 drivers/mtd/nand/qcom_nandc.c            |  2 +-
 drivers/mtd/nand/sh_flctl.c              |  2 +-
 drivers/mtd/nand/sm_common.c             |  2 +-
 drivers/mtd/nand/socrates_nand.c         |  2 +-
 drivers/mtd/nand/sunxi_nand.c            |  2 +-
 drivers/mtd/nand/tango_nand.c            |  2 +-
 drivers/mtd/nand/vf610_nfc.c             |  2 +-
 drivers/mtd/nand/xway_nand.c             |  2 +-
 include/linux/mtd/nand.h                 |  5 +++++
 35 files changed, 59 insertions(+), 35 deletions(-)

diff --git a/drivers/mtd/nand/ams-delta.c b/drivers/mtd/nand/ams-delta.c
index 5d6c26f3cf7f..fd97d8922eb5 100644
--- a/drivers/mtd/nand/ams-delta.c
+++ b/drivers/mtd/nand/ams-delta.c
@@ -239,7 +239,7 @@ static int ams_delta_init(struct platform_device *pdev)
 		goto out_mtd;
 
 	/* Register the partitions */
-	mtd_device_register(ams_delta_mtd, partition_info,
+	nand_device_register(ams_delta_mtd, partition_info,
 			    ARRAY_SIZE(partition_info));
 
 	goto out;
diff --git a/drivers/mtd/nand/atmel/nand-controller.c b/drivers/mtd/nand/atmel/nand-controller.c
index 3b2446896147..734d1e9f15cd 100644
--- a/drivers/mtd/nand/atmel/nand-controller.c
+++ b/drivers/mtd/nand/atmel/nand-controller.c
@@ -1312,7 +1312,7 @@ static int atmel_nand_register(struct atmel_nand *nand)
 		return ret;
 	}
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(nc->dev, "Failed to register mtd device: %d\n", ret);
 		nand_cleanup(chip);
diff --git a/drivers/mtd/nand/au1550nd.c b/drivers/mtd/nand/au1550nd.c
index 9bf6d9915694..d44168fc4d00 100644
--- a/drivers/mtd/nand/au1550nd.c
+++ b/drivers/mtd/nand/au1550nd.c
@@ -476,7 +476,7 @@ static int au1550nd_probe(struct platform_device *pdev)
 		goto out3;
 	}
 
-	mtd_device_register(mtd, pd->parts, pd->num_parts);
+	nand_device_register(mtd, pd->parts, pd->num_parts);
 
 	platform_set_drvdata(pdev, ctx);
 
diff --git a/drivers/mtd/nand/bf5xx_nand.c b/drivers/mtd/nand/bf5xx_nand.c
index 3962f55bd034..cd1404c48331 100644
--- a/drivers/mtd/nand/bf5xx_nand.c
+++ b/drivers/mtd/nand/bf5xx_nand.c
@@ -677,7 +677,7 @@ static int bf5xx_nand_add_partition(struct bf5xx_nand_info *info)
 	struct mtd_partition *parts = info->platform->partitions;
 	int nr = info->platform->nr_partitions;
 
-	return mtd_device_register(mtd, parts, nr);
+	return nand_device_register(mtd, parts, nr);
 }
 
 static int bf5xx_nand_remove(struct platform_device *pdev)
diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
index 7419c5ce63f8..de4dcb1fc574 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/brcmnand/brcmnand.c
@@ -2294,7 +2294,7 @@ static int brcmnand_init_cs(struct brcmnand_host *host, struct device_node *dn)
 	if (ret)
 		return ret;
 
-	return mtd_device_register(mtd, NULL, 0);
+	return nand_device_register(mtd, NULL, 0);
 }
 
 static void brcmnand_save_restore_cs_config(struct brcmnand_host *host,
diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index 531c51991e57..0cb21afb29a4 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -821,7 +821,7 @@ static int nand_davinci_probe(struct platform_device *pdev)
 		ret = mtd_device_parse_register(mtd, NULL, NULL,
 					pdata->parts, pdata->nr_parts);
 	else
-		ret = mtd_device_register(mtd, NULL, 0);
+		ret = nand_device_register(mtd, NULL, 0);
 	if (ret < 0)
 		goto err;
 
diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 16634df2e39a..76d70e2dbab8 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1630,7 +1630,7 @@ int denali_init(struct denali_nand_info *denali)
 	if (ret)
 		goto failed_req_irq;
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(denali->dev, "Failed to register MTD: %d\n", ret);
 		goto failed_req_irq;
diff --git a/drivers/mtd/nand/diskonchip.c b/drivers/mtd/nand/diskonchip.c
index a023ab9e9cbf..d6356a781107 100644
--- a/drivers/mtd/nand/diskonchip.c
+++ b/drivers/mtd/nand/diskonchip.c
@@ -1298,7 +1298,7 @@ static int __init nftl_scan_bbt(struct mtd_info *mtd)
 	if (ret)
 		return ret;
 
-	return mtd_device_register(mtd, parts, no_autopart ? 0 : numparts);
+	return nand_device_register(mtd, parts, no_autopart ? 0 : numparts);
 }
 
 static int __init inftl_scan_bbt(struct mtd_info *mtd)
@@ -1352,7 +1352,7 @@ static int __init inftl_scan_bbt(struct mtd_info *mtd)
 	   autopartitioning, but I want to give it more thought. */
 	if (!numparts)
 		return -EIO;
-	return mtd_device_register(mtd, parts, no_autopart ? 0 : numparts);
+	return nand_device_register(mtd, parts, no_autopart ? 0 : numparts);
 }
 
 static inline int __init doc2000_init(struct mtd_info *mtd)
diff --git a/drivers/mtd/nand/fsl_upm.c b/drivers/mtd/nand/fsl_upm.c
index d85fa2555b68..5c85139e6488 100644
--- a/drivers/mtd/nand/fsl_upm.c
+++ b/drivers/mtd/nand/fsl_upm.c
@@ -195,7 +195,7 @@ static int fun_chip_init(struct fsl_upm_nand *fun,
 	if (ret)
 		goto err;
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_device_register(mtd, NULL, 0);
 err:
 	of_node_put(flash_np);
 	if (ret)
diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index cea50d2f218c..c2970f9b729c 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -1019,7 +1019,7 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 		goto err_probe;
 
 	mtd->name = "nand";
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_device_register(mtd, NULL, 0);
 	if (ret)
 		goto err_probe;
 
diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/gpio.c
index 85294f150f4f..4cdbb875ae53 100644
--- a/drivers/mtd/nand/gpio.c
+++ b/drivers/mtd/nand/gpio.c
@@ -299,7 +299,7 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	if (gpiomtd->plat.adjust_parts)
 		gpiomtd->plat.adjust_parts(&gpiomtd->plat, mtd->size);
 
-	ret = mtd_device_register(mtd, gpiomtd->plat.parts,
+	ret = nand_device_register(mtd, gpiomtd->plat.parts,
 				  gpiomtd->plat.num_parts);
 	if (!ret)
 		return 0;
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index d52139635b67..dbb963423c6e 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -2053,7 +2053,7 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 	if (ret)
 		goto err_out;
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_device_register(mtd, NULL, 0);
 	if (ret)
 		goto err_out;
 	return 0;
diff --git a/drivers/mtd/nand/hisi504_nand.c b/drivers/mtd/nand/hisi504_nand.c
index e40364eeb556..af15b84ee349 100644
--- a/drivers/mtd/nand/hisi504_nand.c
+++ b/drivers/mtd/nand/hisi504_nand.c
@@ -812,7 +812,7 @@ static int hisi_nfc_probe(struct platform_device *pdev)
 		goto err_res;
 	}
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "Err MTD partition=%d\n", ret);
 		goto err_mtd;
diff --git a/drivers/mtd/nand/jz4780_nand.c b/drivers/mtd/nand/jz4780_nand.c
index a39bb70175ee..5ebe726eb9b9 100644
--- a/drivers/mtd/nand/jz4780_nand.c
+++ b/drivers/mtd/nand/jz4780_nand.c
@@ -291,7 +291,7 @@ static int jz4780_nand_init_chip(struct platform_device *pdev,
 	if (ret)
 		return ret;
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_device_register(mtd, NULL, 0);
 	if (ret) {
 		nand_release(mtd);
 		return ret;
diff --git a/drivers/mtd/nand/lpc32xx_mlc.c b/drivers/mtd/nand/lpc32xx_mlc.c
index 846a66c1b133..2f22184fcc44 100644
--- a/drivers/mtd/nand/lpc32xx_mlc.c
+++ b/drivers/mtd/nand/lpc32xx_mlc.c
@@ -798,7 +798,7 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 
 	mtd->name = DRV_NAME;
 
-	res = mtd_device_register(mtd, host->ncfg->parts,
+	res = nand_device_register(mtd, host->ncfg->parts,
 				  host->ncfg->num_parts);
 	if (!res)
 		return res;
diff --git a/drivers/mtd/nand/lpc32xx_slc.c b/drivers/mtd/nand/lpc32xx_slc.c
index a0669a33f8fe..d7a4b9d437d8 100644
--- a/drivers/mtd/nand/lpc32xx_slc.c
+++ b/drivers/mtd/nand/lpc32xx_slc.c
@@ -928,7 +928,7 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 		goto err_exit3;
 
 	mtd->name = "nxp_lpc3220_slc";
-	res = mtd_device_register(mtd, host->ncfg->parts,
+	res = nand_device_register(mtd, host->ncfg->parts,
 				  host->ncfg->num_parts);
 	if (!res)
 		return res;
diff --git a/drivers/mtd/nand/mpc5121_nfc.c b/drivers/mtd/nand/mpc5121_nfc.c
index 6d6eaed2d20c..62eda8644ca5 100644
--- a/drivers/mtd/nand/mpc5121_nfc.c
+++ b/drivers/mtd/nand/mpc5121_nfc.c
@@ -810,7 +810,7 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 	dev_set_drvdata(dev, mtd);
 
 	/* Register device in MTD */
-	retval = mtd_device_register(mtd, NULL, 0);
+	retval = nand_device_register(mtd, NULL, 0);
 	if (retval) {
 		dev_err(dev, "Error adding MTD device!\n");
 		goto error;
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index d474378ed810..52a257e12026 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -4918,6 +4918,25 @@ void nand_cleanup(struct nand_chip *chip)
 EXPORT_SYMBOL_GPL(nand_cleanup);
 
 /**
+ * nand_device_register - [NAND Interface] Register the MTD device and
+ *                        allocate resources for the NAND device
+ * @mtd: MTD device structure
+ * @defparts: default device partitions array, from C-based board files
+ * @defnr_parts: number of elements in defparts
+ *
+ * @return
+ */
+int nand_device_register(struct mtd_info *mtd,
+			 const struct mtd_partition *defparts,
+			 int defnr_parts)
+{
+	int ret = nand_device_register(mtd, defparts, defnr_parts);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(nand_device_register);
+
+/**
  * nand_release - [NAND Interface] Unregister the MTD device and free resources
  *		  held by the NAND device
  * @mtd: MTD device structure
diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 03a0d057bf2f..037afc62f856 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -2365,7 +2365,7 @@ static int __init ns_init_module(void)
 		goto err_exit;
 
 	/* Register NAND partitions */
-	retval = mtd_device_register(nsmtd, &nand->partitions[0],
+	retval = nand_device_register(nsmtd, &nand->partitions[0],
 				     nand->nbparts);
 	if (retval != 0)
 		goto err_exit;
diff --git a/drivers/mtd/nand/ndfc.c b/drivers/mtd/nand/ndfc.c
index 28e6118362f7..8d1207f3e0cd 100644
--- a/drivers/mtd/nand/ndfc.c
+++ b/drivers/mtd/nand/ndfc.c
@@ -185,7 +185,7 @@ static int ndfc_chip_init(struct ndfc_controller *ndfc,
 	if (ret)
 		goto err;
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_device_register(mtd, NULL, 0);
 
 err:
 	of_node_put(flash_np);
diff --git a/drivers/mtd/nand/nuc900_nand.c b/drivers/mtd/nand/nuc900_nand.c
index 8f64011d32ef..54b962c472bb 100644
--- a/drivers/mtd/nand/nuc900_nand.c
+++ b/drivers/mtd/nand/nuc900_nand.c
@@ -273,7 +273,7 @@ static int nuc900_nand_probe(struct platform_device *pdev)
 	if (nand_scan(mtd, 1))
 		return -ENXIO;
 
-	mtd_device_register(mtd, partitions, ARRAY_SIZE(partitions));
+	nand_device_register(mtd, partitions, ARRAY_SIZE(partitions));
 
 	platform_set_drvdata(pdev, nuc900_nand);
 
diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 084934a9f19c..31e2d9aa497e 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -2168,9 +2168,9 @@ static int omap_nand_probe(struct platform_device *pdev)
 		goto return_error;
 
 	if (dev->of_node)
-		mtd_device_register(mtd, NULL, 0);
+		nand_device_register(mtd, NULL, 0);
 	else
-		mtd_device_register(mtd, pdata->parts, pdata->nr_parts);
+		nand_device_register(mtd, pdata->parts, pdata->nr_parts);
 
 	platform_set_drvdata(pdev, mtd);
 
diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
index f8e463a97b9e..34b26169734f 100644
--- a/drivers/mtd/nand/orion_nand.c
+++ b/drivers/mtd/nand/orion_nand.c
@@ -173,7 +173,7 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 		goto no_dev;
 
 	mtd->name = "orion_nand";
-	ret = mtd_device_register(mtd, board->parts, board->nr_parts);
+	ret = nand_device_register(mtd, board->parts, board->nr_parts);
 	if (ret) {
 		nand_release(mtd);
 		goto no_dev;
diff --git a/drivers/mtd/nand/oxnas_nand.c b/drivers/mtd/nand/oxnas_nand.c
index 1b207aac840c..cbc52b68775a 100644
--- a/drivers/mtd/nand/oxnas_nand.c
+++ b/drivers/mtd/nand/oxnas_nand.c
@@ -141,7 +141,7 @@ static int oxnas_nand_probe(struct platform_device *pdev)
 		if (err)
 			return err;
 
-		err = mtd_device_register(mtd, NULL, 0);
+		err = nand_device_register(mtd, NULL, 0);
 		if (err) {
 			nand_release(mtd);
 			return err;
diff --git a/drivers/mtd/nand/pasemi_nand.c b/drivers/mtd/nand/pasemi_nand.c
index 074b8b01289e..6ac3b7693205 100644
--- a/drivers/mtd/nand/pasemi_nand.c
+++ b/drivers/mtd/nand/pasemi_nand.c
@@ -160,7 +160,7 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	if (err)
 		goto out_lpc;
 
-	if (mtd_device_register(pasemi_nand_mtd, NULL, 0)) {
+	if (nand_device_register(pasemi_nand_mtd, NULL, 0)) {
 		dev_err(dev, "Unable to register MTD device\n");
 		err = -ENODEV;
 		goto out_lpc;
diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 649ba8200832..86ca08b51b1c 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1988,7 +1988,7 @@ static int pxa3xx_nand_probe(struct platform_device *pdev)
 			continue;
 		}
 
-		ret = mtd_device_register(mtd, pdata->parts[cs],
+		ret = nand_device_register(mtd, pdata->parts[cs],
 					  pdata->nr_parts[cs]);
 		if (!ret)
 			probe_success = 1;
diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
index 57d483ac5765..9e4038735e88 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -2039,7 +2039,7 @@ static int qcom_nand_host_init(struct qcom_nand_controller *nandc,
 	if (ret)
 		return ret;
 
-	return mtd_device_register(mtd, NULL, 0);
+	return nand_device_register(mtd, NULL, 0);
 }
 
 /* parse custom DT properties here */
diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
index 442ce619b3b6..6c4b7e4397e7 100644
--- a/drivers/mtd/nand/sh_flctl.c
+++ b/drivers/mtd/nand/sh_flctl.c
@@ -1214,7 +1214,7 @@ static int flctl_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_chip;
 
-	ret = mtd_device_register(flctl_mtd, pdata->parts, pdata->nr_parts);
+	ret = nand_device_register(flctl_mtd, pdata->parts, pdata->nr_parts);
 
 	return 0;
 
diff --git a/drivers/mtd/nand/sm_common.c b/drivers/mtd/nand/sm_common.c
index 5939dff253c2..396a3916d300 100644
--- a/drivers/mtd/nand/sm_common.c
+++ b/drivers/mtd/nand/sm_common.c
@@ -193,7 +193,7 @@ int sm_register_device(struct mtd_info *mtd, int smartmedia)
 	if (ret)
 		return ret;
 
-	return mtd_device_register(mtd, NULL, 0);
+	return nand_device_register(mtd, NULL, 0);
 }
 EXPORT_SYMBOL_GPL(sm_register_device);
 
diff --git a/drivers/mtd/nand/socrates_nand.c b/drivers/mtd/nand/socrates_nand.c
index 72369bd079af..5d9b40bd71b6 100644
--- a/drivers/mtd/nand/socrates_nand.c
+++ b/drivers/mtd/nand/socrates_nand.c
@@ -191,7 +191,7 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 	if (res)
 		goto out;
 
-	res = mtd_device_register(mtd, NULL, 0);
+	res = nand_device_register(mtd, NULL, 0);
 	if (!res)
 		return res;
 
diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/sunxi_nand.c
index 118a26fff368..8c470743c5d9 100644
--- a/drivers/mtd/nand/sunxi_nand.c
+++ b/drivers/mtd/nand/sunxi_nand.c
@@ -2115,7 +2115,7 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 		return ret;
 	}
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "failed to register mtd device: %d\n", ret);
 		nand_release(mtd);
diff --git a/drivers/mtd/nand/tango_nand.c b/drivers/mtd/nand/tango_nand.c
index 05b6e1065203..96c80525d40b 100644
--- a/drivers/mtd/nand/tango_nand.c
+++ b/drivers/mtd/nand/tango_nand.c
@@ -583,7 +583,7 @@ static int chip_init(struct device *dev, struct device_node *np)
 	tchip->pkt_n_cfg = PKT_CFG(ecc->size, ecc->strength);
 	tchip->bb_cfg = BB_CFG(mtd->writesize, BBM_SIZE);
 
-	err = mtd_device_register(mtd, NULL, 0);
+	err = nand_device_register(mtd, NULL, 0);
 	if (err)
 		return err;
 
diff --git a/drivers/mtd/nand/vf610_nfc.c b/drivers/mtd/nand/vf610_nfc.c
index 3ea4bb19e12d..f9ec94536390 100644
--- a/drivers/mtd/nand/vf610_nfc.c
+++ b/drivers/mtd/nand/vf610_nfc.c
@@ -781,7 +781,7 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, mtd);
 
 	/* Register device in MTD */
-	return mtd_device_register(mtd, NULL, 0);
+	return nand_device_register(mtd, NULL, 0);
 
 error:
 	of_node_put(nand_get_flash_node(chip));
diff --git a/drivers/mtd/nand/xway_nand.c b/drivers/mtd/nand/xway_nand.c
index ddee4005248c..abe59140b7b6 100644
--- a/drivers/mtd/nand/xway_nand.c
+++ b/drivers/mtd/nand/xway_nand.c
@@ -209,7 +209,7 @@ static int xway_nand_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	err = mtd_device_register(mtd, NULL, 0);
+	err = nand_device_register(mtd, NULL, 0);
 	if (err)
 		nand_release(mtd);
 
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 8f67b1581683..77fc60923fdd 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -38,6 +38,11 @@ int nand_scan_ident(struct mtd_info *mtd, int max_chips,
 			   struct nand_flash_dev *table);
 int nand_scan_tail(struct mtd_info *mtd);
 
+/* Register the MTD device and allocate resources for the NAND device */
+int nand_device_register(struct mtd_info *mtd,
+			 const struct mtd_partition *defparts,
+			 int defnr_parts);
+
 /* Unregister the MTD device and free resources held by the NAND device */
 void nand_release(struct mtd_info *mtd);
 
-- 
2.13.0
