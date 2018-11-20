Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP1vz-0005pG-IB
 for linux-mtd@lists.infradead.org; Tue, 20 Nov 2018 09:03:07 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, Han Xu <han.xu@nxp.com>,
 Vladimir Zapolskiy <vz@mleia.com>,
 Sylvain Lemieux <slemieux.tyco@gmail.com>, Stefan Agner <stefan@agner.ch>
Subject: [PATCH 10/10] mtd: rawnand: Deprecate the dummy_controller field
Date: Tue, 20 Nov 2018 10:02:39 +0100
Message-Id: <20181120090239.5792-11-boris.brezillon@bootlin.com>
In-Reply-To: <20181120090239.5792-1-boris.brezillon@bootlin.com>
References: <20181120090239.5792-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We try to force NAND controller drivers to properly separate the NAND
controller object from the NAND chip one, so let's deprecate the dummy
controller object embedded in nand_chip to encourage them to create
their own instance.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/cafe_nand.c           | 2 +-
 drivers/mtd/nand/raw/davinci_nand.c        | 2 +-
 drivers/mtd/nand/raw/denali.c              | 2 +-
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 2 +-
 drivers/mtd/nand/raw/hisi504_nand.c        | 2 +-
 drivers/mtd/nand/raw/jz4740_nand.c         | 2 +-
 drivers/mtd/nand/raw/lpc32xx_mlc.c         | 2 +-
 drivers/mtd/nand/raw/lpc32xx_slc.c         | 2 +-
 drivers/mtd/nand/raw/mxc_nand.c            | 2 +-
 drivers/mtd/nand/raw/nand_base.c           | 2 +-
 drivers/mtd/nand/raw/nandsim.c             | 2 +-
 drivers/mtd/nand/raw/sh_flctl.c            | 2 +-
 drivers/mtd/nand/raw/sm_common.c           | 2 +-
 include/linux/mtd/rawnand.h                | 6 +++---
 14 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/raw/cafe_nand.c b/drivers/mtd/nand/raw/cafe_nand.c
index a85f5fa5c66d..b1c0cd6b49da 100644
--- a/drivers/mtd/nand/raw/cafe_nand.c
+++ b/drivers/mtd/nand/raw/cafe_nand.c
@@ -780,7 +780,7 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 	cafe->usedma = 0;
 
 	/* Scan to find existence of the device */
-	cafe->nand.dummy_controller.ops = &cafe_nand_controller_ops;
+	cafe->nand.legacy.dummy_controller.ops = &cafe_nand_controller_ops;
 	err = nand_scan(&cafe->nand, 2);
 	if (err)
 		goto out_irq;
diff --git a/drivers/mtd/nand/raw/davinci_nand.c b/drivers/mtd/nand/raw/davinci_nand.c
index f430aeb917e8..27bafa5e1ca1 100644
--- a/drivers/mtd/nand/raw/davinci_nand.c
+++ b/drivers/mtd/nand/raw/davinci_nand.c
@@ -801,7 +801,7 @@ static int nand_davinci_probe(struct platform_device *pdev)
 	spin_unlock_irq(&davinci_nand_lock);
 
 	/* Scan to find existence of the device(s) */
-	info->chip.dummy_controller.ops = &davinci_nand_controller_ops;
+	info->chip.legacy.dummy_controller.ops = &davinci_nand_controller_ops;
 	ret = nand_scan(&info->chip, pdata->mask_chipsel ? 2 : 1);
 	if (ret < 0) {
 		dev_dbg(&pdev->dev, "no NAND chip(s) found\n");
diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
index bad3b8ad5e0a..74181095dc30 100644
--- a/drivers/mtd/nand/raw/denali.c
+++ b/drivers/mtd/nand/raw/denali.c
@@ -1375,7 +1375,7 @@ int denali_init(struct denali_nand_info *denali)
 	if (denali->clk_rate && denali->clk_x_rate)
 		chip->options |= NAND_KEEP_TIMINGS;
 
-	chip->dummy_controller.ops = &denali_controller_ops;
+	chip->legacy.dummy_controller.ops = &denali_controller_ops;
 	ret = nand_scan(chip, denali->max_banks);
 	if (ret)
 		goto disable_irq;
diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 25f9fe79796a..ed405c9434fe 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -1931,7 +1931,7 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 	if (ret)
 		goto err_out;
 
-	chip->dummy_controller.ops = &gpmi_nand_controller_ops;
+	chip->legacy.dummy_controller.ops = &gpmi_nand_controller_ops;
 	ret = nand_scan(chip, GPMI_IS_MX6(this) ? 2 : 1);
 	if (ret)
 		goto err_out;
diff --git a/drivers/mtd/nand/raw/hisi504_nand.c b/drivers/mtd/nand/raw/hisi504_nand.c
index e41c13499fd5..f3f9aa160cff 100644
--- a/drivers/mtd/nand/raw/hisi504_nand.c
+++ b/drivers/mtd/nand/raw/hisi504_nand.c
@@ -799,7 +799,7 @@ static int hisi_nfc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	chip->dummy_controller.ops = &hisi_nfc_controller_ops;
+	chip->legacy.dummy_controller.ops = &hisi_nfc_controller_ops;
 	ret = nand_scan(chip, max_chips);
 	if (ret)
 		return ret;
diff --git a/drivers/mtd/nand/raw/jz4740_nand.c b/drivers/mtd/nand/raw/jz4740_nand.c
index 0bcfdd3d66a8..f92ae5aa2a54 100644
--- a/drivers/mtd/nand/raw/jz4740_nand.c
+++ b/drivers/mtd/nand/raw/jz4740_nand.c
@@ -428,7 +428,7 @@ static int jz_nand_probe(struct platform_device *pdev)
 	chip->legacy.chip_delay = 50;
 	chip->legacy.cmd_ctrl = jz_nand_cmd_ctrl;
 	chip->legacy.select_chip = jz_nand_select_chip;
-	chip->dummy_controller.ops = &jz_nand_controller_ops;
+	chip->legacy.dummy_controller.ops = &jz_nand_controller_ops;
 
 	if (nand->busy_gpio)
 		chip->legacy.dev_ready = jz_nand_dev_ready;
diff --git a/drivers/mtd/nand/raw/lpc32xx_mlc.c b/drivers/mtd/nand/raw/lpc32xx_mlc.c
index abbb655fe154..086964f8d424 100644
--- a/drivers/mtd/nand/raw/lpc32xx_mlc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_mlc.c
@@ -799,7 +799,7 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	 * Scan to find existence of the device and get the type of NAND device:
 	 * SMALL block or LARGE block.
 	 */
-	nand_chip->dummy_controller.ops = &lpc32xx_nand_controller_ops;
+	nand_chip->legacy.dummy_controller.ops = &lpc32xx_nand_controller_ops;
 	res = nand_scan(nand_chip, 1);
 	if (res)
 		goto free_irq;
diff --git a/drivers/mtd/nand/raw/lpc32xx_slc.c b/drivers/mtd/nand/raw/lpc32xx_slc.c
index f2f2cdbb9d04..a2c5fdc875bd 100644
--- a/drivers/mtd/nand/raw/lpc32xx_slc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_slc.c
@@ -924,7 +924,7 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	}
 
 	/* Find NAND device */
-	chip->dummy_controller.ops = &lpc32xx_nand_controller_ops;
+	chip->legacy.dummy_controller.ops = &lpc32xx_nand_controller_ops;
 	res = nand_scan(chip, 1);
 	if (res)
 		goto release_dma;
diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
index 9b75d894cb74..59554c187e01 100644
--- a/drivers/mtd/nand/raw/mxc_nand.c
+++ b/drivers/mtd/nand/raw/mxc_nand.c
@@ -1891,7 +1891,7 @@ static int mxcnd_probe(struct platform_device *pdev)
 	}
 
 	/* Scan the NAND device */
-	this->dummy_controller.ops = &mxcnd_controller_ops;
+	this->legacy.dummy_controller.ops = &mxcnd_controller_ops;
 	err = nand_scan(this, is_imx25_nfc(host) ? 4 : 1);
 	if (err)
 		goto escan;
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index a036333629dc..6c8ab83f8cd3 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -4422,7 +4422,7 @@ static void nand_set_defaults(struct nand_chip *chip)
 	nand_legacy_set_defaults(chip);
 
 	if (!chip->controller) {
-		chip->controller = &chip->dummy_controller;
+		chip->controller = &chip->legacy.dummy_controller;
 		nand_controller_init(chip->controller);
 	}
 
diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index c452819f6123..2b3047d53558 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
@@ -2304,7 +2304,7 @@ static int __init ns_init_module(void)
 	if ((retval = parse_gravepages()) != 0)
 		goto error;
 
-	chip->dummy_controller.ops = &ns_controller_ops;
+	chip->legacy.dummy_controller.ops = &ns_controller_ops;
 	retval = nand_scan(chip, 1);
 	if (retval) {
 		NS_ERR("Could not scan NAND Simulator device\n");
diff --git a/drivers/mtd/nand/raw/sh_flctl.c b/drivers/mtd/nand/raw/sh_flctl.c
index 8c538e6c4926..393eb03ad349 100644
--- a/drivers/mtd/nand/raw/sh_flctl.c
+++ b/drivers/mtd/nand/raw/sh_flctl.c
@@ -1196,7 +1196,7 @@ static int flctl_probe(struct platform_device *pdev)
 
 	flctl_setup_dma(flctl);
 
-	nand->dummy_controller.ops = &flctl_nand_controller_ops;
+	nand->legacy.dummy_controller.ops = &flctl_nand_controller_ops;
 	ret = nand_scan(nand, 1);
 	if (ret)
 		goto err_chip;
diff --git a/drivers/mtd/nand/raw/sm_common.c b/drivers/mtd/nand/raw/sm_common.c
index 6f063ef57640..409d036858dc 100644
--- a/drivers/mtd/nand/raw/sm_common.c
+++ b/drivers/mtd/nand/raw/sm_common.c
@@ -194,7 +194,7 @@ int sm_register_device(struct mtd_info *mtd, int smartmedia)
 	chip->options |= NAND_SKIP_BBTSCAN;
 
 	/* Scan for card properties */
-	chip->dummy_controller.ops = &sm_controller_ops;
+	chip->legacy.dummy_controller.ops = &sm_controller_ops;
 	flash_ids = smartmedia ? nand_smartmedia_flash_ids : nand_xd_flash_ids;
 	ret = nand_scan_with_ids(chip, 1, flash_ids);
 	if (ret)
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index f50f40643895..33e240acdc6d 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -941,6 +941,8 @@ static inline void nand_controller_init(struct nand_controller *nfc)
  * @get_features: get the NAND chip features
  * @chip_delay: chip dependent delay for transferring data from array to read
  *		regs (tR).
+ * @dummy_controller: dummy controller implementation for drivers that can
+ *		      only control a single chip
  *
  * If you look at this structure you're already wrong. These fields/hooks are
  * all deprecated.
@@ -966,6 +968,7 @@ struct nand_legacy {
 	int (*get_features)(struct nand_chip *chip, int feature_addr,
 			    u8 *subfeature_para);
 	int chip_delay;
+	struct nand_controller dummy_controller;
 };
 
 /**
@@ -980,8 +983,6 @@ struct nand_legacy {
  *			setting the read-retry mode. Mostly needed for MLC NAND.
  * @ecc:		[BOARDSPECIFIC] ECC control structure
  * @buf_align:		minimum buffer alignment required by a platform
- * @dummy_controller:	dummy controller implementation for drivers that can
- *			only control a single chip
  * @state:		[INTERN] the current state of the NAND device
  * @oob_poi:		"poison value buffer," used for laying out OOB data
  *			before writing
@@ -1094,7 +1095,6 @@ struct nand_chip {
 
 	struct nand_ecc_ctrl ecc;
 	unsigned long buf_align;
-	struct nand_controller dummy_controller;
 
 	uint8_t *bbt;
 	struct nand_bbt_descr *bbt_td;
-- 
2.17.1
