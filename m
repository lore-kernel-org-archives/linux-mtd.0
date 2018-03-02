Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1erlce-0004s1-VT
 for linux-mtd@lists.infradead.org; Fri, 02 Mar 2018 14:25:44 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org, Han Xu <han.xu@nxp.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Stefan Agner <stefan@agner.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, juliensu@mxic.com.tw,
 jocelyncarroue@macronix.com, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 07/14] mtd: rawnand: use wrappers to call onfi
 GET/SET_FEATURES
Date: Fri,  2 Mar 2018 15:24:15 +0100
Message-Id: <20180302142422.2543-8-miquel.raynal@bootlin.com>
In-Reply-To: <20180302142422.2543-1-miquel.raynal@bootlin.com>
References: <20180302142422.2543-1-miquel.raynal@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Prepare the fact that some features managed by GET/SET_FEATURES could be
overloaded by vendor code. To handle this logic, use new wrappers
instead of directly call the ->get/set_features() hooks.

Also take into account that not having the proper SET/GET_FEATURES
available is not a reason to return an error. The wrappers that are
created here handle this case by returning a special error code:
-ENOTSUPP. More logic in the calling function of the new helpers
(nand_setup_data_interface()) is added to handle this case).

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c   | 127 ++++++++++++++++++++++++-------------
 drivers/mtd/nand/raw/nand_micron.c |  18 +++---
 include/linux/mtd/rawnand.h        |   3 +
 3 files changed, 96 insertions(+), 52 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 70b59672362c..e5bcfbf7c7f6 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -1160,6 +1160,52 @@ static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
 	return status;
 }
 
+/**
+ * nand_get_features - wrapper to perform a GET_FEATURE
+ * @chip: NAND chip info structure
+ * @addr: feature address
+ * @subfeature_param: the subfeature parameters, a four bytes array
+ *
+ * Returns 0 for success, a negative error otherwise. Returns -ENOTSUPP if the
+ * operation cannot be handled.
+ */
+int nand_get_features(struct nand_chip *chip, int addr,
+		      u8 *subfeature_param)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+
+	if (!chip->onfi_version ||
+	    !(le16_to_cpu(chip->onfi_params.opt_cmd)
+	      & ONFI_OPT_CMD_SET_GET_FEATURES))
+		return -ENOTSUPP;
+
+	return chip->get_features(mtd, chip, addr, subfeature_param);
+}
+EXPORT_SYMBOL_GPL(nand_get_features);
+
+/**
+ * nand_set_features - wrapper to perform a SET_FEATURE
+ * @chip: NAND chip info structure
+ * @addr: feature address
+ * @subfeature_param: the subfeature parameters, a four bytes array
+ *
+ * Returns 0 for success, a negative error otherwise. Returns -ENOTSUPP if the
+ * operation cannot be handled.
+ */
+int nand_set_features(struct nand_chip *chip, int addr,
+		      u8 *subfeature_param)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+
+	if (!chip->onfi_version ||
+	    !(le16_to_cpu(chip->onfi_params.opt_cmd)
+	      & ONFI_OPT_CMD_SET_GET_FEATURES))
+		return -ENOTSUPP;
+
+	return chip->set_features(mtd, chip, addr, subfeature_param);
+}
+EXPORT_SYMBOL_GPL(nand_set_features);
+
 /**
  * nand_reset_data_interface - Reset data interface and timings
  * @chip: The NAND chip
@@ -1215,59 +1261,62 @@ static int nand_reset_data_interface(struct nand_chip *chip, int chipnr)
 static int nand_setup_data_interface(struct nand_chip *chip, int chipnr)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
+	u8 tmode_param[ONFI_SUBFEATURE_PARAM_LEN] = {
+		chip->onfi_timing_mode_default,
+	};
 	int ret;
 
 	if (!chip->setup_data_interface)
 		return 0;
 
+	/* Change the mode on the chip side */
+	chip->select_chip(mtd, chipnr);
+	ret = nand_set_features(chip, ONFI_FEATURE_ADDR_TIMING_MODE,
+				tmode_param);
+	chip->select_chip(mtd, -1);
+
 	/*
-	 * Ensure the timing mode has been changed on the chip side
-	 * before changing timings on the controller side.
+	 * Do not fail because the mode cannot explicitly be set. If the NAND
+	 * chip claims it supports it, let's just apply the timings on the
+	 * controller side.
 	 */
-	if (chip->onfi_version &&
-	    (le16_to_cpu(chip->onfi_params.opt_cmd) &
-	     ONFI_OPT_CMD_SET_GET_FEATURES)) {
-		u8 tmode_param[ONFI_SUBFEATURE_PARAM_LEN] = {
-			chip->onfi_timing_mode_default,
-		};
-
-		chip->select_chip(mtd, chipnr);
-		ret = chip->set_features(mtd, chip,
-					 ONFI_FEATURE_ADDR_TIMING_MODE,
-					 tmode_param);
-		chip->select_chip(mtd, -1);
-		if (ret)
-			return ret;
-	}
+	if (ret && ret != -ENOTSUPP)
+		return ret;
 
+	/* Change the mode on the controller side */
 	ret = chip->setup_data_interface(mtd, chipnr, &chip->data_interface);
 	if (ret)
 		return ret;
 
-	if (chip->onfi_version &&
-	    (le16_to_cpu(chip->onfi_params.opt_cmd) &
-	     ONFI_OPT_CMD_SET_GET_FEATURES)) {
-		u8 tmode_param[ONFI_SUBFEATURE_PARAM_LEN] = {};
+	/* Check the mode has been accepted by the chip */
+	memset(tmode_param, 0, ONFI_SUBFEATURE_PARAM_LEN);
+	chip->select_chip(mtd, chipnr);
+	ret = nand_get_features(chip, ONFI_FEATURE_ADDR_TIMING_MODE,
+				tmode_param);
+	chip->select_chip(mtd, -1);
+	if (ret && ret != -ENOTSUPP)
+		goto err_reset_chip;
 
-		chip->select_chip(mtd, chipnr);
-		ret = chip->get_features(mtd, chip,
-					 ONFI_FEATURE_ADDR_TIMING_MODE,
-					 tmode_param);
-		chip->select_chip(mtd, -1);
-		if (ret)
-			goto err_reset_chip;
+	/*
+	 * Do not fail because the mode could not be checked. However, skip the
+	 * comparison block that would probably raise an error.
+	 */
+	if (ret == -ENOTSUPP)
+		return 0;
 
-		if (tmode_param[0] != chip->onfi_timing_mode_default) {
-			pr_warn("timings mode %d not acknowledged by the NAND chip\n",
-				chip->onfi_timing_mode_default);
-			goto err_reset_chip;
-		}
+	if (tmode_param[0] != chip->onfi_timing_mode_default) {
+		pr_warn("timing mode %d not acknowledged by the NAND chip\n",
+			chip->onfi_timing_mode_default);
+		goto err_reset_chip;
 	}
 
 	return 0;
 
 err_reset_chip:
-	/* Fallback to timing mode 0 */
+	/*
+	 * Fallback to mode 0 if the chip explicitly did not ack the chosen
+	 * timing mode.
+	 */
 	nand_reset_data_interface(chip, chipnr);
 	chip->select_chip(mtd, chipnr);
 	nand_reset_op(chip);
@@ -4820,11 +4869,6 @@ static int nand_default_set_features(struct mtd_info *mtd,
 				     struct nand_chip *chip, int addr,
 				     uint8_t *subfeature_param)
 {
-	if (!chip->onfi_version ||
-	    !(le16_to_cpu(chip->onfi_params.opt_cmd)
-	      & ONFI_OPT_CMD_SET_GET_FEATURES))
-		return -EINVAL;
-
 	return nand_set_features_op(chip, addr, subfeature_param);
 }
 
@@ -4839,11 +4883,6 @@ static int nand_default_get_features(struct mtd_info *mtd,
 				     struct nand_chip *chip, int addr,
 				     uint8_t *subfeature_param)
 {
-	if (!chip->onfi_version ||
-	    !(le16_to_cpu(chip->onfi_params.opt_cmd)
-	      & ONFI_OPT_CMD_SET_GET_FEATURES))
-		return -EINVAL;
-
 	return nand_get_features_op(chip, addr, subfeature_param);
 }
 
diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/raw/nand_micron.c
index ab3e3a1a5212..b825656f6284 100644
--- a/drivers/mtd/nand/raw/nand_micron.c
+++ b/drivers/mtd/nand/raw/nand_micron.c
@@ -48,8 +48,7 @@ static int micron_nand_setup_read_retry(struct mtd_info *mtd, int retry_mode)
 	struct nand_chip *chip = mtd_to_nand(mtd);
 	u8 feature[ONFI_SUBFEATURE_PARAM_LEN] = {retry_mode};
 
-	return chip->set_features(mtd, chip, ONFI_FEATURE_ADDR_READ_RETRY,
-				  feature);
+	return nand_set_features(chip, ONFI_FEATURE_ADDR_READ_RETRY, feature);
 }
 
 /*
@@ -108,8 +107,7 @@ static int micron_nand_on_die_ecc_setup(struct nand_chip *chip, bool enable)
 	if (enable)
 		feature[0] |= ONFI_FEATURE_ON_DIE_ECC_EN;
 
-	return chip->set_features(nand_to_mtd(chip), chip,
-				  ONFI_FEATURE_ON_DIE_ECC, feature);
+	return nand_set_features(chip, ONFI_FEATURE_ON_DIE_ECC, feature);
 }
 
 static int
@@ -219,8 +217,10 @@ static int micron_supports_on_die_ecc(struct nand_chip *chip)
 	if (ret)
 		return MICRON_ON_DIE_UNSUPPORTED;
 
-	chip->get_features(nand_to_mtd(chip), chip,
-			   ONFI_FEATURE_ON_DIE_ECC, feature);
+	ret = nand_get_features(chip, ONFI_FEATURE_ON_DIE_ECC, feature);
+	if (ret < 0)
+		return ret;
+
 	if ((feature[0] & ONFI_FEATURE_ON_DIE_ECC_EN) == 0)
 		return MICRON_ON_DIE_UNSUPPORTED;
 
@@ -228,8 +228,10 @@ static int micron_supports_on_die_ecc(struct nand_chip *chip)
 	if (ret)
 		return MICRON_ON_DIE_UNSUPPORTED;
 
-	chip->get_features(nand_to_mtd(chip), chip,
-			   ONFI_FEATURE_ON_DIE_ECC, feature);
+	ret = nand_get_features(chip, ONFI_FEATURE_ON_DIE_ECC, feature);
+	if (ret < 0)
+		return ret;
+
 	if (feature[0] & ONFI_FEATURE_ON_DIE_ECC_EN)
 		return MICRON_ON_DIE_MANDATORY;
 
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index fb2e288ef8b1..3cc2a3435b20 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1629,6 +1629,9 @@ int nand_read_oob_std(struct mtd_info *mtd, struct nand_chip *chip, int page);
 int nand_read_oob_syndrome(struct mtd_info *mtd, struct nand_chip *chip,
 			   int page);
 
+/* Wrapper to use in order for controllers/vendors to GET/SET FEATURES */
+int nand_get_features(struct nand_chip *chip, int addr, u8 *subfeature_param);
+int nand_set_features(struct nand_chip *chip, int addr, u8 *subfeature_param);
 /* Stub used by drivers that do not support GET/SET FEATURES operations */
 int nand_get_set_features_notsupp(struct mtd_info *mtd, struct nand_chip *chip,
 				  int addr, u8 *subfeature_param);
-- 
2.14.1
