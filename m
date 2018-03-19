Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1exv9F-0004dX-Qw
 for linux-mtd@lists.infradead.org; Mon, 19 Mar 2018 13:48:30 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org, Han Xu <han.xu@nxp.com>,
 Stefan Agner <stefan@agner.ch>, juliensu@mxic.com.tw,
 jocelyncarroue@macronix.com, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v5 03/14] mtd: rawnand: use wrappers to call onfi
 GET/SET_FEATURES
Date: Mon, 19 Mar 2018 14:47:20 +0100
Message-Id: <20180319134731.22605-4-miquel.raynal@bootlin.com>
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

Prepare the fact that some features managed by GET/SET_FEATURES could be
overloaded by vendor code. To handle this logic, use new wrappers
instead of directly call the ->get/set_features() hooks.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c   | 88 +++++++++++++++++++++++++-------------
 drivers/mtd/nand/raw/nand_micron.c | 18 ++++----
 include/linux/mtd/rawnand.h        |  3 ++
 3 files changed, 71 insertions(+), 38 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 802cd9ed44a1..68cea38491e4 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -1160,6 +1160,54 @@ static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
 	return status;
 }
 
+static bool nand_supports_set_get_features(struct nand_chip *chip)
+{
+	return (chip->onfi_version && (le16_to_cpu(chip->onfi_params.opt_cmd)
+				       & ONFI_OPT_CMD_SET_GET_FEATURES));
+}
+
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
+	if (!nand_supports_set_get_features(chip))
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
+	if (!nand_supports_set_get_features(chip))
+		return -ENOTSUPP;
+
+	return chip->set_features(mtd, chip, addr, subfeature_param);
+}
+EXPORT_SYMBOL_GPL(nand_set_features);
+
 /**
  * nand_reset_data_interface - Reset data interface and timings
  * @chip: The NAND chip
@@ -1215,32 +1263,22 @@ static int nand_reset_data_interface(struct nand_chip *chip, int chipnr)
 static int nand_setup_data_interface(struct nand_chip *chip, int chipnr)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
+	u8 tmode_param[ONFI_SUBFEATURE_PARAM_LEN] = {
+		chip->onfi_timing_mode_default,
+	};
 	int ret;
 
 	if (!chip->setup_data_interface)
 		return 0;
 
-	/*
-	 * Ensure the timing mode has been changed on the chip side
-	 * before changing timings on the controller side.
-	 */
-	if (chip->onfi_version &&
-	    (le16_to_cpu(chip->onfi_params.opt_cmd) &
-	     ONFI_OPT_CMD_SET_GET_FEATURES)) {
-		u8 tmode_param[ONFI_SUBFEATURE_PARAM_LEN] = {
-			chip->onfi_timing_mode_default,
-		};
+	/* Change the mode on the chip side */
+	ret = nand_set_features(chip, ONFI_FEATURE_ADDR_TIMING_MODE,
+				tmode_param);
+	if (ret)
+		return ret;
 
-		ret = chip->set_features(mtd, chip,
-					 ONFI_FEATURE_ADDR_TIMING_MODE,
-					 tmode_param);
-		if (ret)
-			goto err;
-	}
-
-	ret = chip->setup_data_interface(mtd, chipnr, &chip->data_interface);
-err:
-	return ret;
+	/* Change the mode on the controller side */
+	return chip->setup_data_interface(mtd, chipnr, &chip->data_interface);
 }
 
 /**
@@ -4779,11 +4817,6 @@ static int nand_default_set_features(struct mtd_info *mtd,
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
 
@@ -4798,11 +4831,6 @@ static int nand_default_get_features(struct mtd_info *mtd,
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
