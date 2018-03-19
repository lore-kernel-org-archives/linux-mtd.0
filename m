Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1exrFV-0006Ae-KK
 for linux-mtd@lists.infradead.org; Mon, 19 Mar 2018 09:38:58 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org, Han Xu <han.xu@nxp.com>,
 Stefan Agner <stefan@agner.ch>, juliensu@mxic.com.tw,
 jocelyncarroue@macronix.com, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v4 08/13] mtd: rawnand: prepare the removal of ONFI/JEDEC
 parameter pages
Date: Mon, 19 Mar 2018 10:38:06 +0100
Message-Id: <20180319093811.18351-9-miquel.raynal@bootlin.com>
In-Reply-To: <20180319093811.18351-1-miquel.raynal@bootlin.com>
References: <20180319093811.18351-1-miquel.raynal@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The NAND chip parameter page is statically allocated within the
nand_chip structure, which reserves a lot of space. Even not ONFI nor
JEDEC chips have it embedded. Also, only a few parameters are actually
read from the parameter page after the detection.

To prepare to the removal of such huge structure, a small NAND parameter
structure is allocated statically and contains only very few members
that are generic to all chips and actually used elsewhere in the code.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c | 34 +++++++++++++++-------------------
 include/linux/mtd/rawnand.h      | 13 +++++++++++++
 2 files changed, 28 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index e5bcfbf7c7f6..c3bc814a9beb 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -1174,9 +1174,7 @@ int nand_get_features(struct nand_chip *chip, int addr,
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
 
-	if (!chip->onfi_version ||
-	    !(le16_to_cpu(chip->onfi_params.opt_cmd)
-	      & ONFI_OPT_CMD_SET_GET_FEATURES))
+	if (!chip->parameters.supports_set_get_features)
 		return -ENOTSUPP;
 
 	return chip->get_features(mtd, chip, addr, subfeature_param);
@@ -1197,9 +1195,7 @@ int nand_set_features(struct nand_chip *chip, int addr,
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
 
-	if (!chip->onfi_version ||
-	    !(le16_to_cpu(chip->onfi_params.opt_cmd)
-	      & ONFI_OPT_CMD_SET_GET_FEATURES))
+	if (!chip->parameters.supports_set_get_features)
 		return -ENOTSUPP;
 
 	return chip->set_features(mtd, chip, addr, subfeature_param);
@@ -5150,8 +5146,10 @@ static int nand_flash_detect_onfi(struct nand_chip *chip)
 
 	sanitize_string(p->manufacturer, sizeof(p->manufacturer));
 	sanitize_string(p->model, sizeof(p->model));
+	strncpy(chip->parameters.model, p->model,
+		sizeof(chip->parameters.model) - 1);
 	if (!mtd->name)
-		mtd->name = p->model;
+		mtd->name = chip->parameters.model;
 
 	mtd->writesize = le32_to_cpu(p->byte_per_page);
 
@@ -5198,6 +5196,10 @@ static int nand_flash_detect_onfi(struct nand_chip *chip)
 		pr_warn("Could not retrieve ONFI ECC requirements\n");
 	}
 
+	/* Save some parameters from the parameter page for future use */
+	if (le16_to_cpu(p->opt_cmd) & ONFI_OPT_CMD_SET_GET_FEATURES)
+		chip->parameters.supports_set_get_features = true;
+
 	return 1;
 }
 
@@ -5250,8 +5252,10 @@ static int nand_flash_detect_jedec(struct nand_chip *chip)
 
 	sanitize_string(p->manufacturer, sizeof(p->manufacturer));
 	sanitize_string(p->model, sizeof(p->model));
+	strncpy(chip->parameters.model, p->model,
+		sizeof(chip->parameters.model) - 1);
 	if (!mtd->name)
-		mtd->name = p->model;
+		mtd->name = chip->parameters.model;
 
 	mtd->writesize = le32_to_cpu(p->byte_per_page);
 
@@ -5652,17 +5656,9 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
 
 	pr_info("device found, Manufacturer ID: 0x%02x, Chip ID: 0x%02x\n",
 		maf_id, dev_id);
-
-	if (chip->onfi_version)
-		pr_info("%s %s\n", nand_manufacturer_name(manufacturer),
-			chip->onfi_params.model);
-	else if (chip->jedec_version)
-		pr_info("%s %s\n", nand_manufacturer_name(manufacturer),
-			chip->jedec_params.model);
-	else
-		pr_info("%s %s\n", nand_manufacturer_name(manufacturer),
-			type->name);
-
+	pr_info("%s %s\n", nand_manufacturer_name(manufacturer),
+		(chip->onfi_version || chip->jedec_version) ?
+		chip->parameters.model : type->name);
 	pr_info("%d MiB, %s, erase size: %d KiB, page size: %d, OOB size: %d\n",
 		(int)(chip->chipsize >> 20), nand_is_slc(chip) ? "SLC" : "MLC",
 		mtd->erasesize >> 10, mtd->writesize, mtd->oobsize);
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 3cc2a3435b20..a24591411d78 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -429,6 +429,16 @@ struct nand_jedec_params {
 	__le16 crc;
 } __packed;
 
+/**
+ * struct nand_parameters - NAND generic parameters from the parameter page
+ * @model: Model name
+ * @supports_set_get_features: The NAND chip supports setting/getting features
+ */
+struct nand_parameters {
+	char model[100];
+	bool supports_set_get_features;
+};
+
 /* The maximum expected count of bytes in the NAND ID sequence */
 #define NAND_MAX_ID_LEN 8
 
@@ -1165,6 +1175,8 @@ int nand_op_parser_exec_op(struct nand_chip *chip,
  *			supported, 0 otherwise.
  * @jedec_params:	[INTERN] holds the JEDEC parameter page when JEDEC is
  *			supported, 0 otherwise.
+ * @parameters:		[INTERN] holds generic parameters under an easily
+ *			readable form.
  * @max_bb_per_die:	[INTERN] the max number of bad blocks each die of a
  *			this nand device will encounter their life times.
  * @blocks_per_die:	[INTERN] The number of PEBs in a die
@@ -1249,6 +1261,7 @@ struct nand_chip {
 		struct nand_onfi_params	onfi_params;
 		struct nand_jedec_params jedec_params;
 	};
+	struct nand_parameters parameters;
 	u16 max_bb_per_die;
 	u32 blocks_per_die;
 
-- 
2.14.1
