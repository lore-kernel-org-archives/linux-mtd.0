Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1exv9S-0004i9-Dl
 for linux-mtd@lists.infradead.org; Mon, 19 Mar 2018 13:48:53 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org, Han Xu <han.xu@nxp.com>,
 Stefan Agner <stefan@agner.ch>, juliensu@mxic.com.tw,
 jocelyncarroue@macronix.com, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v5 14/14] mtd: rawnand: get rid of the ONFI parameter page in
 nand_chip
Date: Mon, 19 Mar 2018 14:47:31 +0100
Message-Id: <20180319134731.22605-15-miquel.raynal@bootlin.com>
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

The NAND chip parameter page is statically allocated within the
nand_chip structure, which reserves a lot of space. Even not ONFI nor
JEDEC chips have it embedded. Also, only a few parameters are actually
read from the parameter page after the detection.

Now that there is a small nand_parameters structure that hold all needed
ONFI parameters, remove the ONFI page from the nand_chip structure by
just allocating it during the identification phase and removing it right
after.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c | 34 +++++++++++++++++++++++++---------
 include/linux/mtd/rawnand.h      |  3 ---
 2 files changed, 25 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 331f233a2abc..9e151e4c7570 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5101,7 +5101,7 @@ static int nand_flash_detect_ext_param_page(struct nand_chip *chip,
 static int nand_flash_detect_onfi(struct nand_chip *chip)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
-	struct nand_onfi_params *p = &chip->onfi_params;
+	struct nand_onfi_params *p;
 	char id[4];
 	int i, ret, val;
 
@@ -5110,14 +5110,23 @@ static int nand_flash_detect_onfi(struct nand_chip *chip)
 	if (ret || strncmp(id, "ONFI", 4))
 		return 0;
 
+	/* ONFI chip: allocate a buffer to hold its parameter page */
+	p = kzalloc(sizeof(*p), GFP_KERNEL);
+	if (!p)
+		return -ENOMEM;
+
 	ret = nand_read_param_page_op(chip, 0, NULL, 0);
-	if (ret)
-		return 0;
+	if (ret) {
+		ret = 0;
+		goto free_onfi_param_page;
+	}
 
 	for (i = 0; i < 3; i++) {
 		ret = nand_read_data_op(chip, p, sizeof(*p), true);
-		if (ret)
-			return 0;
+		if (ret) {
+			ret = 0;
+			goto free_onfi_param_page;
+		}
 
 		if (onfi_crc16(ONFI_CRC_BASE, (uint8_t *)p, 254) ==
 				le16_to_cpu(p->crc)) {
@@ -5127,7 +5136,7 @@ static int nand_flash_detect_onfi(struct nand_chip *chip)
 
 	if (i == 3) {
 		pr_err("Could not find valid ONFI parameter page; aborting\n");
-		return 0;
+		goto free_onfi_param_page;
 	}
 
 	/* Check version */
@@ -5145,7 +5154,9 @@ static int nand_flash_detect_onfi(struct nand_chip *chip)
 
 	if (!chip->onfi_version) {
 		pr_info("unsupported ONFI version: %d\n", val);
-		return 0;
+		goto free_onfi_param_page;
+	} else {
+		ret = 1;
 	}
 
 	sanitize_string(p->manufacturer, sizeof(p->manufacturer));
@@ -5219,7 +5230,9 @@ static int nand_flash_detect_onfi(struct nand_chip *chip)
 	memcpy(chip->parameters.onfi.vendor, p->vendor,
 	       sizeof(p->vendor));
 
-	return 1;
+free_onfi_param_page:
+	kfree(p);
+	return ret;
 }
 
 /*
@@ -5615,7 +5628,10 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
 	chip->onfi_version = 0;
 	if (!type->name || !type->pagesize) {
 		/* Check if the chip is ONFI compliant */
-		if (nand_flash_detect_onfi(chip))
+		ret = nand_flash_detect_onfi(chip);
+		if (ret < 0)
+			return ret;
+		if (ret)
 			goto ident_done;
 
 		/* Check if the chip is JEDEC compliant */
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 8ee95d44b2d3..89675cb9c79f 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1202,8 +1202,6 @@ int nand_op_parser_exec_op(struct nand_chip *chip,
  *			non 0 if ONFI supported.
  * @jedec_version:	[INTERN] holds the chip JEDEC version (BCD encoded),
  *			non 0 if JEDEC supported.
- * @onfi_params:	[INTERN] holds the ONFI page parameter when ONFI is
- *			supported, 0 otherwise.
  * @parameters:		[INTERN] holds generic parameters under an easily
  *			readable form.
  * @max_bb_per_die:	[INTERN] the max number of bad blocks each die of a
@@ -1286,7 +1284,6 @@ struct nand_chip {
 	struct nand_id id;
 	int onfi_version;
 	int jedec_version;
-	struct nand_onfi_params	onfi_params;
 	struct nand_parameters parameters;
 	u16 max_bb_per_die;
 	u32 blocks_per_die;
-- 
2.14.1
