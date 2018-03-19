Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1exv9F-0004dW-Qy
 for linux-mtd@lists.infradead.org; Mon, 19 Mar 2018 13:48:34 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org, Han Xu <han.xu@nxp.com>,
 Stefan Agner <stefan@agner.ch>, juliensu@mxic.com.tw,
 jocelyncarroue@macronix.com, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v5 02/14] mtd: rawnand: rename SET/GET FEATURES related
 functions
Date: Mon, 19 Mar 2018 14:47:19 +0100
Message-Id: <20180319134731.22605-3-miquel.raynal@bootlin.com>
In-Reply-To: <20180319134731.22605-1-miquel.raynal@bootlin.com>
References: <20180319134731.22605-1-miquel.raynal@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

SET/GET FEATURES are flagged ONFI-compliant because of their name. This
is not accurate as non-ONFI NAND chips support it and use it.

Rename the hooks and helpers to remove the "onfi" prefix.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c |  4 +--
 drivers/mtd/nand/raw/cafe_nand.c                 |  4 +--
 drivers/mtd/nand/raw/docg4.c                     |  4 +--
 drivers/mtd/nand/raw/fsl_elbc_nand.c             |  4 +--
 drivers/mtd/nand/raw/fsl_ifc_nand.c              |  4 +--
 drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c        |  8 ++---
 drivers/mtd/nand/raw/hisi504_nand.c              |  4 +--
 drivers/mtd/nand/raw/mpc5121_nfc.c               |  4 +--
 drivers/mtd/nand/raw/mxc_nand.c                  | 14 ++++----
 drivers/mtd/nand/raw/nand_base.c                 | 42 +++++++++++-------------
 drivers/mtd/nand/raw/nand_micron.c               | 16 ++++-----
 drivers/mtd/nand/raw/qcom_nandc.c                |  4 +--
 drivers/mtd/nand/raw/sh_flctl.c                  |  4 +--
 drivers/staging/mt29f_spinand/mt29f_spinand.c    |  4 +--
 include/linux/mtd/rawnand.h                      | 17 +++++-----
 15 files changed, 66 insertions(+), 71 deletions(-)

diff --git a/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c b/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
index 54bac5b73f0a..60874de430eb 100644
--- a/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
+++ b/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
@@ -392,8 +392,8 @@ int bcm47xxnflash_ops_bcm4706_init(struct bcm47xxnflash *b47n)
 	b47n->nand_chip.read_byte = bcm47xxnflash_ops_bcm4706_read_byte;
 	b47n->nand_chip.read_buf = bcm47xxnflash_ops_bcm4706_read_buf;
 	b47n->nand_chip.write_buf = bcm47xxnflash_ops_bcm4706_write_buf;
-	b47n->nand_chip.onfi_set_features = nand_onfi_get_set_features_notsupp;
-	b47n->nand_chip.onfi_get_features = nand_onfi_get_set_features_notsupp;
+	b47n->nand_chip.set_features = nand_get_set_features_notsupp;
+	b47n->nand_chip.get_features = nand_get_set_features_notsupp;
 
 	nand_chip->chip_delay = 50;
 	b47n->nand_chip.bbt_options = NAND_BBT_USE_FLASH;
diff --git a/drivers/mtd/nand/raw/cafe_nand.c b/drivers/mtd/nand/raw/cafe_nand.c
index 37cfae2761d4..3c1b6a3786b2 100644
--- a/drivers/mtd/nand/raw/cafe_nand.c
+++ b/drivers/mtd/nand/raw/cafe_nand.c
@@ -645,8 +645,8 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 	cafe->nand.read_buf = cafe_read_buf;
 	cafe->nand.write_buf = cafe_write_buf;
 	cafe->nand.select_chip = cafe_select_chip;
-	cafe->nand.onfi_set_features = nand_onfi_get_set_features_notsupp;
-	cafe->nand.onfi_get_features = nand_onfi_get_set_features_notsupp;
+	cafe->nand.set_features = nand_get_set_features_notsupp;
+	cafe->nand.get_features = nand_get_set_features_notsupp;
 
 	cafe->nand.chip_delay = 0;
 
diff --git a/drivers/mtd/nand/raw/docg4.c b/drivers/mtd/nand/raw/docg4.c
index 72f1327c4430..1314aa99b9ab 100644
--- a/drivers/mtd/nand/raw/docg4.c
+++ b/drivers/mtd/nand/raw/docg4.c
@@ -1269,8 +1269,8 @@ static void __init init_mtd_structs(struct mtd_info *mtd)
 	nand->read_buf = docg4_read_buf;
 	nand->write_buf = docg4_write_buf16;
 	nand->erase = docg4_erase_block;
-	nand->onfi_set_features = nand_onfi_get_set_features_notsupp;
-	nand->onfi_get_features = nand_onfi_get_set_features_notsupp;
+	nand->set_features = nand_get_set_features_notsupp;
+	nand->get_features = nand_get_set_features_notsupp;
 	nand->ecc.read_page = docg4_read_page;
 	nand->ecc.write_page = docg4_write_page;
 	nand->ecc.read_page_raw = docg4_read_page_raw;
diff --git a/drivers/mtd/nand/raw/fsl_elbc_nand.c b/drivers/mtd/nand/raw/fsl_elbc_nand.c
index 84f7d6a94be7..d28df991c73c 100644
--- a/drivers/mtd/nand/raw/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_elbc_nand.c
@@ -775,8 +775,8 @@ static int fsl_elbc_chip_init(struct fsl_elbc_mtd *priv)
 	chip->select_chip = fsl_elbc_select_chip;
 	chip->cmdfunc = fsl_elbc_cmdfunc;
 	chip->waitfunc = fsl_elbc_wait;
-	chip->onfi_set_features = nand_onfi_get_set_features_notsupp;
-	chip->onfi_get_features = nand_onfi_get_set_features_notsupp;
+	chip->set_features = nand_get_set_features_notsupp;
+	chip->get_features = nand_get_set_features_notsupp;
 
 	chip->bbt_td = &bbt_main_descr;
 	chip->bbt_md = &bbt_mirror_descr;
diff --git a/drivers/mtd/nand/raw/fsl_ifc_nand.c b/drivers/mtd/nand/raw/fsl_ifc_nand.c
index 4f0bbc8a803d..7ca678f05ae3 100644
--- a/drivers/mtd/nand/raw/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_ifc_nand.c
@@ -838,8 +838,8 @@ static int fsl_ifc_chip_init(struct fsl_ifc_mtd *priv)
 	chip->select_chip = fsl_ifc_select_chip;
 	chip->cmdfunc = fsl_ifc_cmdfunc;
 	chip->waitfunc = fsl_ifc_wait;
-	chip->onfi_set_features = nand_onfi_get_set_features_notsupp;
-	chip->onfi_get_features = nand_onfi_get_set_features_notsupp;
+	chip->set_features = nand_get_set_features_notsupp;
+	chip->get_features = nand_get_set_features_notsupp;
 
 	chip->bbt_td = &bbt_main_descr;
 	chip->bbt_md = &bbt_mirror_descr;
diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
index 97787246af41..f78d907ca61e 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
@@ -934,15 +934,15 @@ static int enable_edo_mode(struct gpmi_nand_data *this, int mode)
 
 	/* [1] send SET FEATURE command to NAND */
 	feature[0] = mode;
-	ret = nand->onfi_set_features(mtd, nand,
-				ONFI_FEATURE_ADDR_TIMING_MODE, feature);
+	ret = nand->set_features(mtd, nand,
+				 ONFI_FEATURE_ADDR_TIMING_MODE, feature);
 	if (ret)
 		goto err_out;
 
 	/* [2] send GET FEATURE command to double-check the timing mode */
 	memset(feature, 0, ONFI_SUBFEATURE_PARAM_LEN);
-	ret = nand->onfi_get_features(mtd, nand,
-				ONFI_FEATURE_ADDR_TIMING_MODE, feature);
+	ret = nand->get_features(mtd, nand,
+				 ONFI_FEATURE_ADDR_TIMING_MODE, feature);
 	if (ret || feature[0] != mode)
 		goto err_out;
 
diff --git a/drivers/mtd/nand/raw/hisi504_nand.c b/drivers/mtd/nand/raw/hisi504_nand.c
index cb862793ab6d..27558a67fa41 100644
--- a/drivers/mtd/nand/raw/hisi504_nand.c
+++ b/drivers/mtd/nand/raw/hisi504_nand.c
@@ -762,8 +762,8 @@ static int hisi_nfc_probe(struct platform_device *pdev)
 	chip->write_buf		= hisi_nfc_write_buf;
 	chip->read_buf		= hisi_nfc_read_buf;
 	chip->chip_delay	= HINFC504_CHIP_DELAY;
-	chip->onfi_set_features	= nand_onfi_get_set_features_notsupp;
-	chip->onfi_get_features	= nand_onfi_get_set_features_notsupp;
+	chip->set_features	= nand_get_set_features_notsupp;
+	chip->get_features	= nand_get_set_features_notsupp;
 
 	hisi_nfc_host_init(host);
 
diff --git a/drivers/mtd/nand/raw/mpc5121_nfc.c b/drivers/mtd/nand/raw/mpc5121_nfc.c
index 913b9d1225c6..6d1740d54e0d 100644
--- a/drivers/mtd/nand/raw/mpc5121_nfc.c
+++ b/drivers/mtd/nand/raw/mpc5121_nfc.c
@@ -707,8 +707,8 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 	chip->read_buf = mpc5121_nfc_read_buf;
 	chip->write_buf = mpc5121_nfc_write_buf;
 	chip->select_chip = mpc5121_nfc_select_chip;
-	chip->onfi_set_features	= nand_onfi_get_set_features_notsupp;
-	chip->onfi_get_features	= nand_onfi_get_set_features_notsupp;
+	chip->set_features	= nand_get_set_features_notsupp;
+	chip->get_features	= nand_get_set_features_notsupp;
 	chip->bbt_options = NAND_BBT_USE_FLASH;
 	chip->ecc.mode = NAND_ECC_SOFT;
 	chip->ecc.algo = NAND_ECC_HAMMING;
diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
index 87b5ee66e501..61501654e708 100644
--- a/drivers/mtd/nand/raw/mxc_nand.c
+++ b/drivers/mtd/nand/raw/mxc_nand.c
@@ -1421,9 +1421,8 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
 	}
 }
 
-static int mxc_nand_onfi_set_features(struct mtd_info *mtd,
-				      struct nand_chip *chip, int addr,
-				      u8 *subfeature_param)
+static int mxc_nand_set_features(struct mtd_info *mtd, struct nand_chip *chip,
+				 int addr, u8 *subfeature_param)
 {
 	struct nand_chip *nand_chip = mtd_to_nand(mtd);
 	struct mxc_nand_host *host = nand_get_controller_data(nand_chip);
@@ -1447,9 +1446,8 @@ static int mxc_nand_onfi_set_features(struct mtd_info *mtd,
 	return 0;
 }
 
-static int mxc_nand_onfi_get_features(struct mtd_info *mtd,
-				      struct nand_chip *chip, int addr,
-				      u8 *subfeature_param)
+static int mxc_nand_get_features(struct mtd_info *mtd, struct nand_chip *chip,
+				 int addr, u8 *subfeature_param)
 {
 	struct nand_chip *nand_chip = mtd_to_nand(mtd);
 	struct mxc_nand_host *host = nand_get_controller_data(nand_chip);
@@ -1752,8 +1750,8 @@ static int mxcnd_probe(struct platform_device *pdev)
 	this->read_word = mxc_nand_read_word;
 	this->write_buf = mxc_nand_write_buf;
 	this->read_buf = mxc_nand_read_buf;
-	this->onfi_set_features = mxc_nand_onfi_set_features;
-	this->onfi_get_features = mxc_nand_onfi_get_features;
+	this->set_features = mxc_nand_set_features;
+	this->get_features = mxc_nand_get_features;
 
 	host->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(host->clk))
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index d1d5e2281860..802cd9ed44a1 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -349,7 +349,7 @@ static void nand_write_byte16(struct mtd_info *mtd, uint8_t byte)
 	 *    8-bits of the data bus. During address transfers, the host shall
 	 *    set the upper 8-bits of the data bus to 00h.
 	 *
-	 * One user of the write_byte callback is nand_onfi_set_features. The
+	 * One user of the write_byte callback is nand_set_features. The
 	 * four parameters are specified to be written to I/O[7:0], but this is
 	 * neither an address nor a command transfer. Let's assume a 0 on the
 	 * upper I/O lines is OK.
@@ -1231,9 +1231,9 @@ static int nand_setup_data_interface(struct nand_chip *chip, int chipnr)
 			chip->onfi_timing_mode_default,
 		};
 
-		ret = chip->onfi_set_features(mtd, chip,
-				ONFI_FEATURE_ADDR_TIMING_MODE,
-				tmode_param);
+		ret = chip->set_features(mtd, chip,
+					 ONFI_FEATURE_ADDR_TIMING_MODE,
+					 tmode_param);
 		if (ret)
 			goto err;
 	}
@@ -4769,15 +4769,15 @@ static int nand_max_bad_blocks(struct mtd_info *mtd, loff_t ofs, size_t len)
 }
 
 /**
- * nand_default_onfi_set_features- [REPLACEABLE] set features for ONFI nand
+ * nand_default_set_features- [REPLACEABLE] set NAND chip features
  * @mtd: MTD device structure
  * @chip: nand chip info structure
  * @addr: feature address.
  * @subfeature_param: the subfeature parameters, a four bytes array.
  */
-static int nand_default_onfi_set_features(struct mtd_info *mtd,
-					  struct nand_chip *chip, int addr,
-					  uint8_t *subfeature_param)
+static int nand_default_set_features(struct mtd_info *mtd,
+				     struct nand_chip *chip, int addr,
+				     uint8_t *subfeature_param)
 {
 	if (!chip->onfi_version ||
 	    !(le16_to_cpu(chip->onfi_params.opt_cmd)
@@ -4788,15 +4788,15 @@ static int nand_default_onfi_set_features(struct mtd_info *mtd,
 }
 
 /**
- * nand_default_onfi_get_features- [REPLACEABLE] get features for ONFI nand
+ * nand_default_get_features- [REPLACEABLE] get NAND chip features
  * @mtd: MTD device structure
  * @chip: nand chip info structure
  * @addr: feature address.
  * @subfeature_param: the subfeature parameters, a four bytes array.
  */
-static int nand_default_onfi_get_features(struct mtd_info *mtd,
-					  struct nand_chip *chip, int addr,
-					  uint8_t *subfeature_param)
+static int nand_default_get_features(struct mtd_info *mtd,
+				     struct nand_chip *chip, int addr,
+				     uint8_t *subfeature_param)
 {
 	if (!chip->onfi_version ||
 	    !(le16_to_cpu(chip->onfi_params.opt_cmd)
@@ -4807,8 +4807,7 @@ static int nand_default_onfi_get_features(struct mtd_info *mtd,
 }
 
 /**
- * nand_onfi_get_set_features_notsupp - set/get features stub returning
- *					-ENOTSUPP
+ * nand_get_set_features_notsupp - set/get features stub returning -ENOTSUPP
  * @mtd: MTD device structure
  * @chip: nand chip info structure
  * @addr: feature address.
@@ -4817,13 +4816,12 @@ static int nand_default_onfi_get_features(struct mtd_info *mtd,
  * Should be used by NAND controller drivers that do not support the SET/GET
  * FEATURES operations.
  */
-int nand_onfi_get_set_features_notsupp(struct mtd_info *mtd,
-				       struct nand_chip *chip, int addr,
-				       u8 *subfeature_param)
+int nand_get_set_features_notsupp(struct mtd_info *mtd, struct nand_chip *chip,
+				  int addr, u8 *subfeature_param)
 {
 	return -ENOTSUPP;
 }
-EXPORT_SYMBOL(nand_onfi_get_set_features_notsupp);
+EXPORT_SYMBOL(nand_get_set_features_notsupp);
 
 /**
  * nand_suspend - [MTD Interface] Suspend the NAND flash
@@ -4880,10 +4878,10 @@ static void nand_set_defaults(struct nand_chip *chip)
 		chip->select_chip = nand_select_chip;
 
 	/* set for ONFI nand */
-	if (!chip->onfi_set_features)
-		chip->onfi_set_features = nand_default_onfi_set_features;
-	if (!chip->onfi_get_features)
-		chip->onfi_get_features = nand_default_onfi_get_features;
+	if (!chip->set_features)
+		chip->set_features = nand_default_set_features;
+	if (!chip->get_features)
+		chip->get_features = nand_default_get_features;
 
 	/* If called twice, pointers that depend on busw may need to be reset */
 	if (!chip->read_byte || chip->read_byte == nand_read_byte)
diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/raw/nand_micron.c
index 02e109ae73f1..ab3e3a1a5212 100644
--- a/drivers/mtd/nand/raw/nand_micron.c
+++ b/drivers/mtd/nand/raw/nand_micron.c
@@ -48,8 +48,8 @@ static int micron_nand_setup_read_retry(struct mtd_info *mtd, int retry_mode)
 	struct nand_chip *chip = mtd_to_nand(mtd);
 	u8 feature[ONFI_SUBFEATURE_PARAM_LEN] = {retry_mode};
 
-	return chip->onfi_set_features(mtd, chip, ONFI_FEATURE_ADDR_READ_RETRY,
-				       feature);
+	return chip->set_features(mtd, chip, ONFI_FEATURE_ADDR_READ_RETRY,
+				  feature);
 }
 
 /*
@@ -108,8 +108,8 @@ static int micron_nand_on_die_ecc_setup(struct nand_chip *chip, bool enable)
 	if (enable)
 		feature[0] |= ONFI_FEATURE_ON_DIE_ECC_EN;
 
-	return chip->onfi_set_features(nand_to_mtd(chip), chip,
-				       ONFI_FEATURE_ON_DIE_ECC, feature);
+	return chip->set_features(nand_to_mtd(chip), chip,
+				  ONFI_FEATURE_ON_DIE_ECC, feature);
 }
 
 static int
@@ -219,8 +219,8 @@ static int micron_supports_on_die_ecc(struct nand_chip *chip)
 	if (ret)
 		return MICRON_ON_DIE_UNSUPPORTED;
 
-	chip->onfi_get_features(nand_to_mtd(chip), chip,
-				ONFI_FEATURE_ON_DIE_ECC, feature);
+	chip->get_features(nand_to_mtd(chip), chip,
+			   ONFI_FEATURE_ON_DIE_ECC, feature);
 	if ((feature[0] & ONFI_FEATURE_ON_DIE_ECC_EN) == 0)
 		return MICRON_ON_DIE_UNSUPPORTED;
 
@@ -228,8 +228,8 @@ static int micron_supports_on_die_ecc(struct nand_chip *chip)
 	if (ret)
 		return MICRON_ON_DIE_UNSUPPORTED;
 
-	chip->onfi_get_features(nand_to_mtd(chip), chip,
-				ONFI_FEATURE_ON_DIE_ECC, feature);
+	chip->get_features(nand_to_mtd(chip), chip,
+			   ONFI_FEATURE_ON_DIE_ECC, feature);
 	if (feature[0] & ONFI_FEATURE_ON_DIE_ECC_EN)
 		return MICRON_ON_DIE_MANDATORY;
 
diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 563b759ffca6..b554fb6e609c 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2651,8 +2651,8 @@ static int qcom_nand_host_init(struct qcom_nand_controller *nandc,
 	chip->read_byte		= qcom_nandc_read_byte;
 	chip->read_buf		= qcom_nandc_read_buf;
 	chip->write_buf		= qcom_nandc_write_buf;
-	chip->onfi_set_features	= nand_onfi_get_set_features_notsupp;
-	chip->onfi_get_features	= nand_onfi_get_set_features_notsupp;
+	chip->set_features	= nand_get_set_features_notsupp;
+	chip->get_features	= nand_get_set_features_notsupp;
 
 	/*
 	 * the bad block marker is readable only when we read the last codeword
diff --git a/drivers/mtd/nand/raw/sh_flctl.c b/drivers/mtd/nand/raw/sh_flctl.c
index a60d43adff3c..7a740d583866 100644
--- a/drivers/mtd/nand/raw/sh_flctl.c
+++ b/drivers/mtd/nand/raw/sh_flctl.c
@@ -1180,8 +1180,8 @@ static int flctl_probe(struct platform_device *pdev)
 	nand->read_buf = flctl_read_buf;
 	nand->select_chip = flctl_select_chip;
 	nand->cmdfunc = flctl_cmdfunc;
-	nand->onfi_set_features = nand_onfi_get_set_features_notsupp;
-	nand->onfi_get_features = nand_onfi_get_set_features_notsupp;
+	nand->set_features = nand_get_set_features_notsupp;
+	nand->get_features = nand_get_set_features_notsupp;
 
 	if (pdata->flcmncr_val & SEL_16BIT)
 		nand->options |= NAND_BUSWIDTH_16;
diff --git a/drivers/staging/mt29f_spinand/mt29f_spinand.c b/drivers/staging/mt29f_spinand/mt29f_spinand.c
index 264ad362d858..6819dd2c1117 100644
--- a/drivers/staging/mt29f_spinand/mt29f_spinand.c
+++ b/drivers/staging/mt29f_spinand/mt29f_spinand.c
@@ -918,8 +918,8 @@ static int spinand_probe(struct spi_device *spi_nand)
 	chip->waitfunc	= spinand_wait;
 	chip->options	|= NAND_CACHEPRG;
 	chip->select_chip = spinand_select_chip;
-	chip->onfi_set_features = nand_onfi_get_set_features_notsupp;
-	chip->onfi_get_features = nand_onfi_get_set_features_notsupp;
+	chip->set_features = nand_get_set_features_notsupp;
+	chip->get_features = nand_get_set_features_notsupp;
 
 	mtd = nand_to_mtd(chip);
 
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 56c5570aadbe..fb2e288ef8b1 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1170,8 +1170,8 @@ int nand_op_parser_exec_op(struct nand_chip *chip,
  * @blocks_per_die:	[INTERN] The number of PEBs in a die
  * @data_interface:	[INTERN] NAND interface timing information
  * @read_retries:	[INTERN] the number of read retry modes supported
- * @onfi_set_features:	[REPLACEABLE] set the features for ONFI nand
- * @onfi_get_features:	[REPLACEABLE] get the features for ONFI nand
+ * @set_features:	[REPLACEABLE] set the NAND chip features
+ * @get_features:	[REPLACEABLE] get the NAND chip features
  * @setup_data_interface: [OPTIONAL] setup the data interface and timing. If
  *			  chipnr is set to %NAND_DATA_IFACE_CHECK_ONLY this
  *			  means the configuration should not be applied but
@@ -1212,10 +1212,10 @@ struct nand_chip {
 		       bool check_only);
 	int (*erase)(struct mtd_info *mtd, int page);
 	int (*scan_bbt)(struct mtd_info *mtd);
-	int (*onfi_set_features)(struct mtd_info *mtd, struct nand_chip *chip,
-			int feature_addr, uint8_t *subfeature_para);
-	int (*onfi_get_features)(struct mtd_info *mtd, struct nand_chip *chip,
-			int feature_addr, uint8_t *subfeature_para);
+	int (*set_features)(struct mtd_info *mtd, struct nand_chip *chip,
+			    int feature_addr, uint8_t *subfeature_para);
+	int (*get_features)(struct mtd_info *mtd, struct nand_chip *chip,
+			    int feature_addr, uint8_t *subfeature_para);
 	int (*setup_read_retry)(struct mtd_info *mtd, int retry_mode);
 	int (*setup_data_interface)(struct mtd_info *mtd, int chipnr,
 				    const struct nand_data_interface *conf);
@@ -1630,9 +1630,8 @@ int nand_read_oob_syndrome(struct mtd_info *mtd, struct nand_chip *chip,
 			   int page);
 
 /* Stub used by drivers that do not support GET/SET FEATURES operations */
-int nand_onfi_get_set_features_notsupp(struct mtd_info *mtd,
-				       struct nand_chip *chip, int addr,
-				       u8 *subfeature_param);
+int nand_get_set_features_notsupp(struct mtd_info *mtd, struct nand_chip *chip,
+				  int addr, u8 *subfeature_param);
 
 /* Default read_page_raw implementation */
 int nand_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
-- 
2.14.1
