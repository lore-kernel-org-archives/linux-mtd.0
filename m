Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gK2yW-0007hd-Fk
 for linux-mtd@lists.infradead.org; Tue, 06 Nov 2018 15:09:06 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Han Xu <han.xu@nxp.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Xiaolei Li <xiaolei.li@mediatek.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Marc Gonzalez <marc.w.gonzalez@free.fr>, Stefan Agner <stefan@agner.ch>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH v2 20/22] mtd: rawnand: Deprecate the ->select_chip() hook
Date: Tue,  6 Nov 2018 16:08:08 +0100
Message-Id: <20181106150810.9569-21-boris.brezillon@bootlin.com>
In-Reply-To: <20181106150810.9569-1-boris.brezillon@bootlin.com>
References: <20181106150810.9569-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Now that the CS line to be selected is passed to ->exec_op() and
stored in chip->cur_cs and after patching all drivers implementing
->exec_op() to stop implementing this method, we can deprecate it by
moving it to the nand_legacy structure.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
Changes in v2:
- None
---
 drivers/mtd/nand/raw/atmel/nand-controller.c     | 4 ++--
 drivers/mtd/nand/raw/au1550nd.c                  | 2 +-
 drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c | 2 +-
 drivers/mtd/nand/raw/cafe_nand.c                 | 2 +-
 drivers/mtd/nand/raw/davinci_nand.c              | 2 +-
 drivers/mtd/nand/raw/denali.c                    | 2 +-
 drivers/mtd/nand/raw/diskonchip.c                | 4 ++--
 drivers/mtd/nand/raw/fsl_elbc_nand.c             | 2 +-
 drivers/mtd/nand/raw/fsl_ifc_nand.c              | 2 +-
 drivers/mtd/nand/raw/fsl_upm.c                   | 2 +-
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c       | 2 +-
 drivers/mtd/nand/raw/hisi504_nand.c              | 2 +-
 drivers/mtd/nand/raw/jz4740_nand.c               | 2 +-
 drivers/mtd/nand/raw/jz4780_nand.c               | 2 +-
 drivers/mtd/nand/raw/mpc5121_nfc.c               | 4 ++--
 drivers/mtd/nand/raw/mtk_nand.c                  | 2 +-
 drivers/mtd/nand/raw/mxc_nand.c                  | 2 +-
 drivers/mtd/nand/raw/nand_base.c                 | 8 ++++----
 drivers/mtd/nand/raw/nand_legacy.c               | 9 +++++----
 drivers/mtd/nand/raw/ndfc.c                      | 2 +-
 drivers/mtd/nand/raw/plat_nand.c                 | 2 +-
 drivers/mtd/nand/raw/qcom_nandc.c                | 2 +-
 drivers/mtd/nand/raw/s3c2410.c                   | 2 +-
 drivers/mtd/nand/raw/sh_flctl.c                  | 2 +-
 drivers/mtd/nand/raw/sunxi_nand.c                | 2 +-
 drivers/mtd/nand/raw/tango_nand.c                | 2 +-
 drivers/mtd/nand/raw/xway_nand.c                 | 2 +-
 include/linux/mtd/rawnand.h                      | 4 ++--
 28 files changed, 39 insertions(+), 38 deletions(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index fb33f6be7c4f..d5c58eb040d8 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -1477,7 +1477,7 @@ static void atmel_nand_init(struct atmel_nand_controller *nc,
 	chip->legacy.write_byte = atmel_nand_write_byte;
 	chip->legacy.read_buf = atmel_nand_read_buf;
 	chip->legacy.write_buf = atmel_nand_write_buf;
-	chip->select_chip = atmel_nand_select_chip;
+	chip->legacy.select_chip = atmel_nand_select_chip;
 
 	if (nc->mck && nc->caps->ops->setup_data_interface)
 		chip->setup_data_interface = atmel_nand_setup_data_interface;
@@ -1525,7 +1525,7 @@ static void atmel_hsmc_nand_init(struct atmel_nand_controller *nc,
 
 	/* Overload some methods for the HSMC controller. */
 	chip->legacy.cmd_ctrl = atmel_hsmc_nand_cmd_ctrl;
-	chip->select_chip = atmel_hsmc_nand_select_chip;
+	chip->legacy.select_chip = atmel_hsmc_nand_select_chip;
 }
 
 static int atmel_nand_controller_remove_nand(struct atmel_nand *nand)
diff --git a/drivers/mtd/nand/raw/au1550nd.c b/drivers/mtd/nand/raw/au1550nd.c
index 9731c1c487f6..a963002663ed 100644
--- a/drivers/mtd/nand/raw/au1550nd.c
+++ b/drivers/mtd/nand/raw/au1550nd.c
@@ -430,7 +430,7 @@ static int au1550nd_probe(struct platform_device *pdev)
 	ctx->cs = cs;
 
 	this->legacy.dev_ready = au1550_device_ready;
-	this->select_chip = au1550_select_chip;
+	this->legacy.select_chip = au1550_select_chip;
 	this->legacy.cmdfunc = au1550_command;
 
 	/* 30 us command delay time */
diff --git a/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c b/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
index 9095a79ebc7d..a37cbfe56567 100644
--- a/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
+++ b/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
@@ -383,7 +383,7 @@ int bcm47xxnflash_ops_bcm4706_init(struct bcm47xxnflash *b47n)
 	u8 tbits, col_bits, col_size, row_bits, row_bsize;
 	u32 val;
 
-	b47n->nand_chip.select_chip = bcm47xxnflash_ops_bcm4706_select_chip;
+	nand_chip->legacy.select_chip = bcm47xxnflash_ops_bcm4706_select_chip;
 	nand_chip->legacy.cmd_ctrl = bcm47xxnflash_ops_bcm4706_cmd_ctrl;
 	nand_chip->legacy.dev_ready = bcm47xxnflash_ops_bcm4706_dev_ready;
 	b47n->nand_chip.legacy.cmdfunc = bcm47xxnflash_ops_bcm4706_cmdfunc;
diff --git a/drivers/mtd/nand/raw/cafe_nand.c b/drivers/mtd/nand/raw/cafe_nand.c
index c1a745940d12..a85f5fa5c66d 100644
--- a/drivers/mtd/nand/raw/cafe_nand.c
+++ b/drivers/mtd/nand/raw/cafe_nand.c
@@ -708,7 +708,7 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 	cafe->nand.legacy.read_byte = cafe_read_byte;
 	cafe->nand.legacy.read_buf = cafe_read_buf;
 	cafe->nand.legacy.write_buf = cafe_write_buf;
-	cafe->nand.select_chip = cafe_select_chip;
+	cafe->nand.legacy.select_chip = cafe_select_chip;
 	cafe->nand.legacy.set_features = nand_get_set_features_notsupp;
 	cafe->nand.legacy.get_features = nand_get_set_features_notsupp;
 
diff --git a/drivers/mtd/nand/raw/davinci_nand.c b/drivers/mtd/nand/raw/davinci_nand.c
index 80f228d23cd2..f430aeb917e8 100644
--- a/drivers/mtd/nand/raw/davinci_nand.c
+++ b/drivers/mtd/nand/raw/davinci_nand.c
@@ -762,7 +762,7 @@ static int nand_davinci_probe(struct platform_device *pdev)
 	info->chip.legacy.IO_ADDR_R	= vaddr;
 	info->chip.legacy.IO_ADDR_W	= vaddr;
 	info->chip.legacy.chip_delay	= 0;
-	info->chip.select_chip	= nand_davinci_select_chip;
+	info->chip.legacy.select_chip	= nand_davinci_select_chip;
 
 	/* options such as NAND_BBT_USE_FLASH */
 	info->chip.bbt_options	= pdata->bbt_options;
diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
index 830ea247277b..64895ca68c8d 100644
--- a/drivers/mtd/nand/raw/denali.c
+++ b/drivers/mtd/nand/raw/denali.c
@@ -1355,7 +1355,7 @@ int denali_init(struct denali_nand_info *denali)
 	if (!mtd->name)
 		mtd->name = "denali-nand";
 
-	chip->select_chip = denali_select_chip;
+	chip->legacy.select_chip = denali_select_chip;
 	chip->legacy.read_byte = denali_read_byte;
 	chip->legacy.write_byte = denali_write_byte;
 	chip->legacy.cmd_ctrl = denali_cmd_ctrl;
diff --git a/drivers/mtd/nand/raw/diskonchip.c b/drivers/mtd/nand/raw/diskonchip.c
index 3a4c373affab..53f57e0f007e 100644
--- a/drivers/mtd/nand/raw/diskonchip.c
+++ b/drivers/mtd/nand/raw/diskonchip.c
@@ -1390,7 +1390,7 @@ static inline int __init doc2001plus_init(struct mtd_info *mtd)
 	this->legacy.read_buf = doc2001plus_readbuf;
 	doc->late_init = inftl_scan_bbt;
 	this->legacy.cmd_ctrl = NULL;
-	this->select_chip = doc2001plus_select_chip;
+	this->legacy.select_chip = doc2001plus_select_chip;
 	this->legacy.cmdfunc = doc2001plus_command;
 	this->ecc.hwctl = doc2001plus_enable_hwecc;
 
@@ -1568,7 +1568,7 @@ static int __init doc_probe(unsigned long physadr)
 	mtd_set_ooblayout(mtd, &doc200x_ooblayout_ops);
 
 	nand_set_controller_data(nand, doc);
-	nand->select_chip	= doc200x_select_chip;
+	nand->legacy.select_chip	= doc200x_select_chip;
 	nand->legacy.cmd_ctrl		= doc200x_hwcontrol;
 	nand->legacy.dev_ready	= doc200x_dev_ready;
 	nand->legacy.waitfunc	= doc200x_wait;
diff --git a/drivers/mtd/nand/raw/fsl_elbc_nand.c b/drivers/mtd/nand/raw/fsl_elbc_nand.c
index d6ed697fcfe6..70f0d2b450ea 100644
--- a/drivers/mtd/nand/raw/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_elbc_nand.c
@@ -779,7 +779,7 @@ static int fsl_elbc_chip_init(struct fsl_elbc_mtd *priv)
 	chip->legacy.read_byte = fsl_elbc_read_byte;
 	chip->legacy.write_buf = fsl_elbc_write_buf;
 	chip->legacy.read_buf = fsl_elbc_read_buf;
-	chip->select_chip = fsl_elbc_select_chip;
+	chip->legacy.select_chip = fsl_elbc_select_chip;
 	chip->legacy.cmdfunc = fsl_elbc_cmdfunc;
 	chip->legacy.waitfunc = fsl_elbc_wait;
 	chip->legacy.set_features = nand_get_set_features_notsupp;
diff --git a/drivers/mtd/nand/raw/fsl_ifc_nand.c b/drivers/mtd/nand/raw/fsl_ifc_nand.c
index 6f4afc44381a..e65d274399f9 100644
--- a/drivers/mtd/nand/raw/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_ifc_nand.c
@@ -864,7 +864,7 @@ static int fsl_ifc_chip_init(struct fsl_ifc_mtd *priv)
 
 	chip->legacy.write_buf = fsl_ifc_write_buf;
 	chip->legacy.read_buf = fsl_ifc_read_buf;
-	chip->select_chip = fsl_ifc_select_chip;
+	chip->legacy.select_chip = fsl_ifc_select_chip;
 	chip->legacy.cmdfunc = fsl_ifc_cmdfunc;
 	chip->legacy.waitfunc = fsl_ifc_wait;
 	chip->legacy.set_features = nand_get_set_features_notsupp;
diff --git a/drivers/mtd/nand/raw/fsl_upm.c b/drivers/mtd/nand/raw/fsl_upm.c
index 673c5a0c9345..5ccc28ec0985 100644
--- a/drivers/mtd/nand/raw/fsl_upm.c
+++ b/drivers/mtd/nand/raw/fsl_upm.c
@@ -170,7 +170,7 @@ static int fun_chip_init(struct fsl_upm_nand *fun,
 	fun->chip.ecc.mode = NAND_ECC_SOFT;
 	fun->chip.ecc.algo = NAND_ECC_HAMMING;
 	if (fun->mchip_count > 1)
-		fun->chip.select_chip = fun_select_chip;
+		fun->chip.legacy.select_chip = fun_select_chip;
 
 	if (fun->rnb_gpio[0] >= 0)
 		fun->chip.legacy.dev_ready = fun_chip_ready;
diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 302ddd3d4a5f..c461d5efabc0 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -1907,7 +1907,7 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 	/* init the nand_chip{}, we don't support a 16-bit NAND Flash bus. */
 	nand_set_controller_data(chip, this);
 	nand_set_flash_node(chip, this->pdev->dev.of_node);
-	chip->select_chip	= gpmi_select_chip;
+	chip->legacy.select_chip	= gpmi_select_chip;
 	chip->setup_data_interface = gpmi_setup_data_interface;
 	chip->legacy.cmd_ctrl	= gpmi_cmd_ctrl;
 	chip->legacy.dev_ready	= gpmi_dev_ready;
diff --git a/drivers/mtd/nand/raw/hisi504_nand.c b/drivers/mtd/nand/raw/hisi504_nand.c
index f043938ee36b..e41c13499fd5 100644
--- a/drivers/mtd/nand/raw/hisi504_nand.c
+++ b/drivers/mtd/nand/raw/hisi504_nand.c
@@ -783,7 +783,7 @@ static int hisi_nfc_probe(struct platform_device *pdev)
 	nand_set_controller_data(chip, host);
 	nand_set_flash_node(chip, np);
 	chip->legacy.cmdfunc	= hisi_nfc_cmdfunc;
-	chip->select_chip	= hisi_nfc_select_chip;
+	chip->legacy.select_chip	= hisi_nfc_select_chip;
 	chip->legacy.read_byte	= hisi_nfc_read_byte;
 	chip->legacy.write_buf	= hisi_nfc_write_buf;
 	chip->legacy.read_buf	= hisi_nfc_read_buf;
diff --git a/drivers/mtd/nand/raw/jz4740_nand.c b/drivers/mtd/nand/raw/jz4740_nand.c
index d271004f16b0..0bcfdd3d66a8 100644
--- a/drivers/mtd/nand/raw/jz4740_nand.c
+++ b/drivers/mtd/nand/raw/jz4740_nand.c
@@ -427,7 +427,7 @@ static int jz_nand_probe(struct platform_device *pdev)
 
 	chip->legacy.chip_delay = 50;
 	chip->legacy.cmd_ctrl = jz_nand_cmd_ctrl;
-	chip->select_chip = jz_nand_select_chip;
+	chip->legacy.select_chip = jz_nand_select_chip;
 	chip->dummy_controller.ops = &jz_nand_controller_ops;
 
 	if (nand->busy_gpio)
diff --git a/drivers/mtd/nand/raw/jz4780_nand.c b/drivers/mtd/nand/raw/jz4780_nand.c
index cdf22100ab77..22e58975f0d5 100644
--- a/drivers/mtd/nand/raw/jz4780_nand.c
+++ b/drivers/mtd/nand/raw/jz4780_nand.c
@@ -279,7 +279,7 @@ static int jz4780_nand_init_chip(struct platform_device *pdev,
 	chip->legacy.IO_ADDR_W = cs->base + OFFSET_DATA;
 	chip->legacy.chip_delay = RB_DELAY_US;
 	chip->options = NAND_NO_SUBPAGE_WRITE;
-	chip->select_chip = jz4780_nand_select_chip;
+	chip->legacy.select_chip = jz4780_nand_select_chip;
 	chip->legacy.cmd_ctrl = jz4780_nand_cmd_ctrl;
 	chip->ecc.mode = NAND_ECC_HW;
 	chip->controller = &nfc->controller;
diff --git a/drivers/mtd/nand/raw/mpc5121_nfc.c b/drivers/mtd/nand/raw/mpc5121_nfc.c
index 86a0aabe08df..062cd1eb2861 100644
--- a/drivers/mtd/nand/raw/mpc5121_nfc.c
+++ b/drivers/mtd/nand/raw/mpc5121_nfc.c
@@ -697,7 +697,7 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 	chip->legacy.read_byte = mpc5121_nfc_read_byte;
 	chip->legacy.read_buf = mpc5121_nfc_read_buf;
 	chip->legacy.write_buf = mpc5121_nfc_write_buf;
-	chip->select_chip = mpc5121_nfc_select_chip;
+	chip->legacy.select_chip = mpc5121_nfc_select_chip;
 	chip->legacy.set_features = nand_get_set_features_notsupp;
 	chip->legacy.get_features = nand_get_set_features_notsupp;
 	chip->bbt_options = NAND_BBT_USE_FLASH;
@@ -712,7 +712,7 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 			return retval;
 		}
 
-		chip->select_chip = ads5121_select_chip;
+		chip->legacy.select_chip = ads5121_select_chip;
 	}
 
 	/* Enable NFC clock */
diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
index 2bb0df1b7244..ce124f8c02cd 100644
--- a/drivers/mtd/nand/raw/mtk_nand.c
+++ b/drivers/mtd/nand/raw/mtk_nand.c
@@ -1333,7 +1333,7 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 
 	nand->options |= NAND_USE_BOUNCE_BUFFER | NAND_SUBPAGE_READ;
 	nand->legacy.dev_ready = mtk_nfc_dev_ready;
-	nand->select_chip = mtk_nfc_select_chip;
+	nand->legacy.select_chip = mtk_nfc_select_chip;
 	nand->legacy.write_byte = mtk_nfc_write_byte;
 	nand->legacy.write_buf = mtk_nfc_write_buf;
 	nand->legacy.read_byte = mtk_nfc_read_byte;
diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
index 88bd3f6a499c..c00b1d408a04 100644
--- a/drivers/mtd/nand/raw/mxc_nand.c
+++ b/drivers/mtd/nand/raw/mxc_nand.c
@@ -1828,7 +1828,7 @@ static int mxcnd_probe(struct platform_device *pdev)
 	this->ecc.bytes = host->devtype_data->eccbytes;
 	host->eccsize = host->devtype_data->eccsize;
 
-	this->select_chip = host->devtype_data->select_chip;
+	this->legacy.select_chip = host->devtype_data->select_chip;
 	this->ecc.size = 512;
 	mtd_set_ooblayout(mtd, host->devtype_data->ooblayout);
 
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index dae4848a8e3d..ee30394df0ff 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -248,8 +248,8 @@ void nand_select_target(struct nand_chip *chip, unsigned int cs)
 
 	chip->cur_cs = cs;
 
-	if (chip->select_chip)
-		chip->select_chip(chip, cs);
+	if (chip->legacy.select_chip)
+		chip->legacy.select_chip(chip, cs);
 }
 EXPORT_SYMBOL_GPL(nand_select_target);
 
@@ -262,8 +262,8 @@ EXPORT_SYMBOL_GPL(nand_select_target);
  */
 void nand_deselect_target(struct nand_chip *chip)
 {
-	if (chip->select_chip)
-		chip->select_chip(chip, -1);
+	if (chip->legacy.select_chip)
+		chip->legacy.select_chip(chip, -1);
 
 	chip->cur_cs = -1;
 }
diff --git a/drivers/mtd/nand/raw/nand_legacy.c b/drivers/mtd/nand/raw/nand_legacy.c
index f76b9356ba9c..4596a538b967 100644
--- a/drivers/mtd/nand/raw/nand_legacy.c
+++ b/drivers/mtd/nand/raw/nand_legacy.c
@@ -592,8 +592,8 @@ void nand_legacy_set_defaults(struct nand_chip *chip)
 	if (chip->legacy.waitfunc == NULL)
 		chip->legacy.waitfunc = nand_wait;
 
-	if (!chip->select_chip)
-		chip->select_chip = nand_select_chip;
+	if (!chip->legacy.select_chip)
+		chip->legacy.select_chip = nand_select_chip;
 
 	/* If called twice, pointers that depend on busw may need to be reset */
 	if (!chip->legacy.read_byte || chip->legacy.read_byte == nand_read_byte)
@@ -626,9 +626,10 @@ int nand_legacy_check_hooks(struct nand_chip *chip)
 
 	/*
 	 * Default functions assigned for ->legacy.cmdfunc() and
-	 * ->select_chip() both expect ->legacy.cmd_ctrl() to be populated.
+	 * ->legacy.select_chip() both expect ->legacy.cmd_ctrl() to be
+	 *  populated.
 	 */
-	if ((!chip->legacy.cmdfunc || !chip->select_chip) &&
+	if ((!chip->legacy.cmdfunc || !chip->legacy.select_chip) &&
 	    !chip->legacy.cmd_ctrl) {
 		pr_err("->legacy.cmd_ctrl() should be provided\n");
 		return -EINVAL;
diff --git a/drivers/mtd/nand/raw/ndfc.c b/drivers/mtd/nand/raw/ndfc.c
index d49a7a17146c..9857e0e5acd4 100644
--- a/drivers/mtd/nand/raw/ndfc.c
+++ b/drivers/mtd/nand/raw/ndfc.c
@@ -146,7 +146,7 @@ static int ndfc_chip_init(struct ndfc_controller *ndfc,
 	chip->legacy.IO_ADDR_W = ndfc->ndfcbase + NDFC_DATA;
 	chip->legacy.cmd_ctrl = ndfc_hwcontrol;
 	chip->legacy.dev_ready = ndfc_ready;
-	chip->select_chip = ndfc_select_chip;
+	chip->legacy.select_chip = ndfc_select_chip;
 	chip->legacy.chip_delay = 50;
 	chip->controller = &ndfc->ndfc_control;
 	chip->legacy.read_buf = ndfc_read_buf;
diff --git a/drivers/mtd/nand/raw/plat_nand.c b/drivers/mtd/nand/raw/plat_nand.c
index 86c536ddaf24..a994b76daa50 100644
--- a/drivers/mtd/nand/raw/plat_nand.c
+++ b/drivers/mtd/nand/raw/plat_nand.c
@@ -63,7 +63,7 @@ static int plat_nand_probe(struct platform_device *pdev)
 	data->chip.legacy.IO_ADDR_W = data->io_base;
 	data->chip.legacy.cmd_ctrl = pdata->ctrl.cmd_ctrl;
 	data->chip.legacy.dev_ready = pdata->ctrl.dev_ready;
-	data->chip.select_chip = pdata->ctrl.select_chip;
+	data->chip.legacy.select_chip = pdata->ctrl.select_chip;
 	data->chip.legacy.write_buf = pdata->ctrl.write_buf;
 	data->chip.legacy.read_buf = pdata->ctrl.read_buf;
 	data->chip.legacy.chip_delay = pdata->chip.chip_delay;
diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index ef75dfa62a4f..6b76fb5c0aed 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2804,7 +2804,7 @@ static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 	mtd->dev.parent = dev;
 
 	chip->legacy.cmdfunc	= qcom_nandc_command;
-	chip->select_chip	= qcom_nandc_select_chip;
+	chip->legacy.select_chip	= qcom_nandc_select_chip;
 	chip->legacy.read_byte	= qcom_nandc_read_byte;
 	chip->legacy.read_buf	= qcom_nandc_read_buf;
 	chip->legacy.write_buf	= qcom_nandc_write_buf;
diff --git a/drivers/mtd/nand/raw/s3c2410.c b/drivers/mtd/nand/raw/s3c2410.c
index d2e42e9d0e8c..a8905463701a 100644
--- a/drivers/mtd/nand/raw/s3c2410.c
+++ b/drivers/mtd/nand/raw/s3c2410.c
@@ -866,7 +866,7 @@ static void s3c2410_nand_init_chip(struct s3c2410_nand_info *info,
 
 	chip->legacy.write_buf    = s3c2410_nand_write_buf;
 	chip->legacy.read_buf     = s3c2410_nand_read_buf;
-	chip->select_chip  = s3c2410_nand_select_chip;
+	chip->legacy.select_chip  = s3c2410_nand_select_chip;
 	chip->legacy.chip_delay   = 50;
 	nand_set_controller_data(chip, nmtd);
 	chip->options	   = set->options;
diff --git a/drivers/mtd/nand/raw/sh_flctl.c b/drivers/mtd/nand/raw/sh_flctl.c
index 4d20d033de7b..8c538e6c4926 100644
--- a/drivers/mtd/nand/raw/sh_flctl.c
+++ b/drivers/mtd/nand/raw/sh_flctl.c
@@ -1183,7 +1183,7 @@ static int flctl_probe(struct platform_device *pdev)
 	nand->legacy.read_byte = flctl_read_byte;
 	nand->legacy.write_buf = flctl_write_buf;
 	nand->legacy.read_buf = flctl_read_buf;
-	nand->select_chip = flctl_select_chip;
+	nand->legacy.select_chip = flctl_select_chip;
 	nand->legacy.cmdfunc = flctl_cmdfunc;
 	nand->legacy.set_features = nand_get_set_features_notsupp;
 	nand->legacy.get_features = nand_get_set_features_notsupp;
diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 51b1a548064b..e489a6ff57d7 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1922,7 +1922,7 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 	 */
 	nand->ecc.mode = NAND_ECC_HW;
 	nand_set_flash_node(nand, np);
-	nand->select_chip = sunxi_nfc_select_chip;
+	nand->legacy.select_chip = sunxi_nfc_select_chip;
 	nand->legacy.cmd_ctrl = sunxi_nfc_cmd_ctrl;
 	nand->legacy.read_buf = sunxi_nfc_read_buf;
 	nand->legacy.write_buf = sunxi_nfc_write_buf;
diff --git a/drivers/mtd/nand/raw/tango_nand.c b/drivers/mtd/nand/raw/tango_nand.c
index 8818f893f300..ebca4579c033 100644
--- a/drivers/mtd/nand/raw/tango_nand.c
+++ b/drivers/mtd/nand/raw/tango_nand.c
@@ -567,7 +567,7 @@ static int chip_init(struct device *dev, struct device_node *np)
 	chip->legacy.read_byte = tango_read_byte;
 	chip->legacy.write_buf = tango_write_buf;
 	chip->legacy.read_buf = tango_read_buf;
-	chip->select_chip = tango_select_chip;
+	chip->legacy.select_chip = tango_select_chip;
 	chip->legacy.cmd_ctrl = tango_cmd_ctrl;
 	chip->legacy.dev_ready = tango_dev_ready;
 	chip->setup_data_interface = tango_set_timings;
diff --git a/drivers/mtd/nand/raw/xway_nand.c b/drivers/mtd/nand/raw/xway_nand.c
index a234a5cb4868..4cb78106af14 100644
--- a/drivers/mtd/nand/raw/xway_nand.c
+++ b/drivers/mtd/nand/raw/xway_nand.c
@@ -176,7 +176,7 @@ static int xway_nand_probe(struct platform_device *pdev)
 
 	data->chip.legacy.cmd_ctrl = xway_cmd_ctrl;
 	data->chip.legacy.dev_ready = xway_dev_ready;
-	data->chip.select_chip = xway_select_chip;
+	data->chip.legacy.select_chip = xway_select_chip;
 	data->chip.legacy.write_buf = xway_write_buf;
 	data->chip.legacy.read_buf = xway_read_buf;
 	data->chip.legacy.read_byte = xway_read_byte;
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index aa1512df38a9..40b74fb1792d 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -902,6 +902,7 @@ int nand_op_parser_exec_op(struct nand_chip *chip,
  * struct nand_legacy - NAND chip legacy fields/hooks
  * @IO_ADDR_R: address to read the 8 I/O lines of the flash device
  * @IO_ADDR_W: address to write the 8 I/O lines of the flash device
+ * @select_chip: select/deselect a specific target/die
  * @read_byte: read one byte from the chip
  * @write_byte: write a single byte to the chip on the low 8 I/O lines
  * @write_buf: write data from the buffer to the chip
@@ -927,6 +928,7 @@ int nand_op_parser_exec_op(struct nand_chip *chip,
 struct nand_legacy {
 	void __iomem *IO_ADDR_R;
 	void __iomem *IO_ADDR_W;
+	void (*select_chip)(struct nand_chip *chip, int cs);
 	u8 (*read_byte)(struct nand_chip *chip);
 	void (*write_byte)(struct nand_chip *chip, u8 byte);
 	void (*write_buf)(struct nand_chip *chip, const u8 *buf, int len);
@@ -954,7 +956,6 @@ struct nand_legacy {
  *			you're modifying an existing driver that is using those
  *			fields/hooks, you should consider reworking the driver
  *			avoid using them.
- * @select_chip:	[REPLACEABLE] select chip nr
  * @exec_op:		controller specific method to execute NAND operations.
  *			This method replaces ->cmdfunc(),
  *			->legacy.{read,write}_{buf,byte,word}(),
@@ -1040,7 +1041,6 @@ struct nand_chip {
 
 	struct nand_legacy legacy;
 
-	void (*select_chip)(struct nand_chip *chip, int cs);
 	int (*exec_op)(struct nand_chip *chip,
 		       const struct nand_operation *op,
 		       bool check_only);
-- 
2.17.1
