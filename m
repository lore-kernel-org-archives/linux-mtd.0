Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1exv9S-0004gJ-Di
 for linux-mtd@lists.infradead.org; Mon, 19 Mar 2018 13:48:50 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org, Han Xu <han.xu@nxp.com>,
 Stefan Agner <stefan@agner.ch>, juliensu@mxic.com.tw,
 jocelyncarroue@macronix.com, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v5 11/14] mtd: rawnand: allow vendors to declare (un)supported
 features
Date: Mon, 19 Mar 2018 14:47:28 +0100
Message-Id: <20180319134731.22605-12-miquel.raynal@bootlin.com>
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

If SET/GET_FEATURES is available (from the parameter page), use a
bitmap to declare what feature is actually supported.

Initialize the bitmap in the core to support timing changes (only
feature used by the core), also add support for Micron specific features
used in Micron initialization code (in the init routine).

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c   | 26 +++++++++++++++++++-------
 drivers/mtd/nand/raw/nand_micron.c |  4 ++++
 include/linux/mtd/rawnand.h        |  8 +++++++-
 3 files changed, 30 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 3402fd5be493..0a30332ffe46 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -1160,9 +1160,16 @@ static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
 	return status;
 }
 
-static bool nand_supports_set_get_features(struct nand_chip *chip)
+static bool nand_supports_get_features(struct nand_chip *chip, int addr)
 {
-	return chip->parameters.supports_set_get_features;
+	return (chip->parameters.supports_set_get_features &&
+		test_bit(addr, chip->parameters.get_feature_list));
+}
+
+static bool nand_supports_set_features(struct nand_chip *chip, int addr)
+{
+	return (chip->parameters.supports_set_get_features &&
+		test_bit(addr, chip->parameters.set_feature_list));
 }
 
 /**
@@ -1179,7 +1186,7 @@ int nand_get_features(struct nand_chip *chip, int addr,
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
 
-	if (!nand_supports_set_get_features(chip))
+	if (!nand_supports_get_features(chip, addr))
 		return -ENOTSUPP;
 
 	return chip->get_features(mtd, chip, addr, subfeature_param);
@@ -1200,7 +1207,7 @@ int nand_set_features(struct nand_chip *chip, int addr,
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
 
-	if (!nand_supports_set_get_features(chip))
+	if (!nand_supports_set_features(chip, addr))
 		return -ENOTSUPP;
 
 	return chip->set_features(mtd, chip, addr, subfeature_param);
@@ -1271,7 +1278,7 @@ static int nand_setup_data_interface(struct nand_chip *chip, int chipnr)
 		return 0;
 
 	/* Change the mode on the chip side (if supported by the NAND chip) */
-	if (nand_supports_set_get_features(chip)) {
+	if (nand_supports_set_features(chip, ONFI_FEATURE_ADDR_TIMING_MODE)) {
 		chip->select_chip(mtd, chipnr);
 		ret = nand_set_features(chip, ONFI_FEATURE_ADDR_TIMING_MODE,
 					tmode_param);
@@ -1286,7 +1293,7 @@ static int nand_setup_data_interface(struct nand_chip *chip, int chipnr)
 		return ret;
 
 	/* Check the mode has been accepted by the chip, if supported */
-	if (!nand_supports_set_get_features(chip))
+	if (!nand_supports_get_features(chip, ONFI_FEATURE_ADDR_TIMING_MODE))
 		return 0;
 
 	memset(tmode_param, 0, ONFI_SUBFEATURE_PARAM_LEN);
@@ -5194,8 +5201,13 @@ static int nand_flash_detect_onfi(struct nand_chip *chip)
 	}
 
 	/* Save some parameters from the parameter page for future use */
-	if (le16_to_cpu(p->opt_cmd) & ONFI_OPT_CMD_SET_GET_FEATURES)
+	if (le16_to_cpu(p->opt_cmd) & ONFI_OPT_CMD_SET_GET_FEATURES) {
 		chip->parameters.supports_set_get_features = true;
+		bitmap_set(chip->parameters.get_feature_list,
+			   ONFI_FEATURE_ADDR_TIMING_MODE, 1);
+		bitmap_set(chip->parameters.set_feature_list,
+			   ONFI_FEATURE_ADDR_TIMING_MODE, 1);
+	}
 	chip->parameters.onfi.tPROG = le16_to_cpu(p->t_prog);
 	chip->parameters.onfi.tBERS = le16_to_cpu(p->t_bers);
 	chip->parameters.onfi.tR = le16_to_cpu(p->t_r);
diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/raw/nand_micron.c
index 740785eb039b..e928d91724f0 100644
--- a/drivers/mtd/nand/raw/nand_micron.c
+++ b/drivers/mtd/nand/raw/nand_micron.c
@@ -64,6 +64,10 @@ static int micron_nand_onfi_init(struct nand_chip *chip)
 		chip->setup_read_retry = micron_nand_setup_read_retry;
 	}
 
+	if (p->supports_set_get_features) {
+		set_bit(ONFI_FEATURE_ADDR_READ_RETRY, p->set_feature_list);
+		set_bit(ONFI_FEATURE_ADDR_READ_RETRY, p->get_feature_list);
+	}
 
 	return 0;
 }
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 07fc3a723a17..fd0299a6e453 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -21,6 +21,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/flashchip.h>
 #include <linux/mtd/bbm.h>
+#include <linux/types.h>
 
 struct mtd_info;
 struct nand_flash_dev;
@@ -235,7 +236,8 @@ struct nand_chip;
 #define ONFI_TIMING_MODE_5		(1 << 5)
 #define ONFI_TIMING_MODE_UNKNOWN	(1 << 6)
 
-/* ONFI feature address */
+/* ONFI feature number/address */
+#define ONFI_FEATURE_NUMBER		256
 #define ONFI_FEATURE_ADDR_TIMING_MODE	0x1
 
 /* Vendor-specific feature address (Micron) */
@@ -453,12 +455,16 @@ struct onfi_params {
  * struct nand_parameters - NAND generic parameters from the parameter page
  * @model: Model name
  * @supports_set_get_features: The NAND chip supports setting/getting features
+ * @set_feature_list: Bitmap of features that can be set
+ * @get_feature_list: Bitmap of features that can be get
  * @onfi: ONFI specific parameters
  */
 struct nand_parameters {
 	/* Generic parameters */
 	char model[100];
 	bool supports_set_get_features;
+	DECLARE_BITMAP(set_feature_list, ONFI_FEATURE_NUMBER);
+	DECLARE_BITMAP(get_feature_list, ONFI_FEATURE_NUMBER);
 
 	/* ONFI parameters */
 	struct onfi_params onfi;
-- 
2.14.1
