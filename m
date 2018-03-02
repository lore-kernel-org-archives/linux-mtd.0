Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1erlcv-0005Px-Ax
 for linux-mtd@lists.infradead.org; Fri, 02 Mar 2018 14:26:01 +0000
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
Subject: [PATCH v3 09/14] mtd: rawnand: prepare the removal of ONFI/JEDEC
 parameter pages
Date: Fri,  2 Mar 2018 15:24:17 +0100
Message-Id: <20180302142422.2543-10-miquel.raynal@bootlin.com>
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

The NAND chip parameter page is statically allocated within the
nand_chip structure, which reserves a lot of space. Even not ONFI nor
JEDEC chips have it embedded. Also, only a few parameters are actually
read from the parameter page after the detection.

To prepare to the removal of such huge structure, a small NAND parameter
structure is allocated statically and contains only very few members
that are generic to all chips and actually used elsewhere in the code.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c | 32 +++++++++++++-------------------
 include/linux/mtd/rawnand.h      |  6 ++++++
 2 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index e5bcfbf7c7f6..30364f60dc4d 100644
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
@@ -5150,8 +5146,9 @@ static int nand_flash_detect_onfi(struct nand_chip *chip)
 
 	sanitize_string(p->manufacturer, sizeof(p->manufacturer));
 	sanitize_string(p->model, sizeof(p->model));
+	memcpy(chip->parameters.model, p->model, sizeof(p->model));
 	if (!mtd->name)
-		mtd->name = p->model;
+		mtd->name = chip->parameters.model;
 
 	mtd->writesize = le32_to_cpu(p->byte_per_page);
 
@@ -5198,6 +5195,10 @@ static int nand_flash_detect_onfi(struct nand_chip *chip)
 		pr_warn("Could not retrieve ONFI ECC requirements\n");
 	}
 
+	/* Save some parameters from the parameter page for future use */
+	if (le16_to_cpu(p->opt_cmd) & ONFI_OPT_CMD_SET_GET_FEATURES)
+		chip->parameters.supports_set_get_features = true;
+
 	return 1;
 }
 
@@ -5250,8 +5251,9 @@ static int nand_flash_detect_jedec(struct nand_chip *chip)
 
 	sanitize_string(p->manufacturer, sizeof(p->manufacturer));
 	sanitize_string(p->model, sizeof(p->model));
+	memcpy(chip->parameters.model, p->model, sizeof(p->model));
 	if (!mtd->name)
-		mtd->name = p->model;
+		mtd->name = chip->parameters.model;
 
 	mtd->writesize = le32_to_cpu(p->byte_per_page);
 
@@ -5652,17 +5654,9 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
 
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
index 3cc2a3435b20..1af0bff58ff4 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -429,6 +429,11 @@ struct nand_jedec_params {
 	__le16 crc;
 } __packed;
 
+struct nand_parameters {
+	char model[100];
+	bool supports_set_get_features;
+};
+
 /* The maximum expected count of bytes in the NAND ID sequence */
 #define NAND_MAX_ID_LEN 8
 
@@ -1249,6 +1254,7 @@ struct nand_chip {
 		struct nand_onfi_params	onfi_params;
 		struct nand_jedec_params jedec_params;
 	};
+	struct nand_parameters parameters;
 	u16 max_bb_per_die;
 	u32 blocks_per_die;
 
-- 
2.14.1
