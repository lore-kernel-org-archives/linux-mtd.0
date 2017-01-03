Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cOOj2-0006Io-KE
 for linux-mtd@lists.infradead.org; Tue, 03 Jan 2017 13:02:04 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Icenowy Zheng <icenowy@aosc.xyz>, Valdis.Kletnieks@vt.edu,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 03/15] mtd: nand: get rid of busw parameter
Date: Tue,  3 Jan 2017 14:01:23 +0100
Message-Id: <1483448495-31607-4-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1483448495-31607-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1483448495-31607-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Auto-detection functions are passed a busw parameter to retrieve the actual
NAND bus width and eventually set the correct value in chip->options.
Rework the nand_get_flash_type() function to get rid of this extra
parameter and let detection code directly set the NAND_BUSWIDTH_16 flag in
chip->options if needed.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/nand_base.c | 68 ++++++++++++++++++++++++--------------------
 1 file changed, 37 insertions(+), 31 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 309f2e113d39..3a31b705af6f 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3348,8 +3348,10 @@ static void nand_shutdown(struct mtd_info *mtd)
 }
 
 /* Set default functions */
-static void nand_set_defaults(struct nand_chip *chip, int busw)
+static void nand_set_defaults(struct nand_chip *chip)
 {
+	unsigned int busw = chip->options & NAND_BUSWIDTH_16;
+
 	/* check for proper chip_delay setup, set 20us if not */
 	if (!chip->chip_delay)
 		chip->chip_delay = 20;
@@ -3525,7 +3527,7 @@ static void nand_onfi_detect_micron(struct nand_chip *chip,
 /*
  * Check if the NAND chip is ONFI compliant, returns 1 if it is, 0 otherwise.
  */
-static int nand_flash_detect_onfi(struct nand_chip *chip, int *busw)
+static int nand_flash_detect_onfi(struct nand_chip *chip)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct nand_onfi_params *p = &chip->onfi_params;
@@ -3594,9 +3596,7 @@ static int nand_flash_detect_onfi(struct nand_chip *chip, int *busw)
 	chip->bits_per_cell = p->bits_per_cell;
 
 	if (onfi_feature(chip) & ONFI_FEATURE_16_BIT_BUS)
-		*busw = NAND_BUSWIDTH_16;
-	else
-		*busw = 0;
+		chip->options |= NAND_BUSWIDTH_16;
 
 	if (p->ecc_bits != 0xff) {
 		chip->ecc_strength_ds = p->ecc_bits;
@@ -3629,7 +3629,7 @@ static int nand_flash_detect_onfi(struct nand_chip *chip, int *busw)
 /*
  * Check if the NAND chip is JEDEC compliant, returns 1 if it is, 0 otherwise.
  */
-static int nand_flash_detect_jedec(struct nand_chip *chip, int *busw)
+static int nand_flash_detect_jedec(struct nand_chip *chip)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct nand_jedec_params *p = &chip->jedec_params;
@@ -3690,9 +3690,7 @@ static int nand_flash_detect_jedec(struct nand_chip *chip, int *busw)
 	chip->bits_per_cell = p->bits_per_cell;
 
 	if (jedec_feature(chip) & JEDEC_FEATURE_16_BIT_BUS)
-		*busw = NAND_BUSWIDTH_16;
-	else
-		*busw = 0;
+		chip->options |= NAND_BUSWIDTH_16;
 
 	/* ECC info */
 	ecc = &p->ecc_info[0];
@@ -3781,7 +3779,7 @@ static int nand_get_bits_per_cell(u8 cellinfo)
  * chip. The rest of the parameters must be decoded according to generic or
  * manufacturer-specific "extended ID" decoding patterns.
  */
-static void nand_decode_ext_id(struct nand_chip *chip, int *busw)
+static void nand_decode_ext_id(struct nand_chip *chip)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	int extid, id_len = chip->id.len;
@@ -3834,7 +3832,6 @@ static void nand_decode_ext_id(struct nand_chip *chip, int *busw)
 		/* Calc blocksize */
 		mtd->erasesize = (128 * 1024) <<
 			(((extid >> 1) & 0x04) | (extid & 0x03));
-		*busw = 0;
 	} else if (id_len == 6 && id_data[0] == NAND_MFR_HYNIX &&
 			!nand_is_slc(chip)) {
 		unsigned int tmp;
@@ -3875,7 +3872,6 @@ static void nand_decode_ext_id(struct nand_chip *chip, int *busw)
 			mtd->erasesize = 768 * 1024;
 		else
 			mtd->erasesize = (64 * 1024) << tmp;
-		*busw = 0;
 	} else {
 		/* Calc pagesize */
 		mtd->writesize = 1024 << (extid & 0x03);
@@ -3888,7 +3884,8 @@ static void nand_decode_ext_id(struct nand_chip *chip, int *busw)
 		mtd->erasesize = (64 * 1024) << (extid & 0x03);
 		extid >>= 2;
 		/* Get buswidth information */
-		*busw = (extid & 0x01) ? NAND_BUSWIDTH_16 : 0;
+		if (extid & 0x1)
+			chip->options |= NAND_BUSWIDTH_16;
 
 		/*
 		 * Toshiba 24nm raw SLC (i.e., not BENAND) have 32B OOB per
@@ -3913,8 +3910,7 @@ static void nand_decode_ext_id(struct nand_chip *chip, int *busw)
  * decodes a matching ID table entry and assigns the MTD size parameters for
  * the chip.
  */
-static void nand_decode_id(struct nand_chip *chip, struct nand_flash_dev *type,
-			   int *busw)
+static void nand_decode_id(struct nand_chip *chip, struct nand_flash_dev *type)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	u8 *id_data = chip->id.data;
@@ -3923,7 +3919,6 @@ static void nand_decode_id(struct nand_chip *chip, struct nand_flash_dev *type,
 	mtd->erasesize = type->erasesize;
 	mtd->writesize = type->pagesize;
 	mtd->oobsize = mtd->writesize / 32;
-	*busw = type->options & NAND_BUSWIDTH_16;
 
 	/* All legacy ID NAND are small-page, SLC */
 	chip->bits_per_cell = 1;
@@ -3986,7 +3981,7 @@ static inline bool is_full_id_nand(struct nand_flash_dev *type)
 }
 
 static bool find_full_id_nand(struct nand_chip *chip,
-			      struct nand_flash_dev *type, int *busw)
+			      struct nand_flash_dev *type)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	u8 *id_data = chip->id.data;
@@ -4004,8 +3999,6 @@ static bool find_full_id_nand(struct nand_chip *chip,
 		chip->onfi_timing_mode_default =
 					type->onfi_timing_mode_default;
 
-		*busw = type->options & NAND_BUSWIDTH_16;
-
 		if (!mtd->name)
 			mtd->name = type->name;
 
@@ -4066,9 +4059,24 @@ static int nand_get_flash_type(struct nand_chip *chip,
 	if (!type)
 		type = nand_flash_ids;
 
+	/*
+	 * Save the NAND_BUSWIDTH_16 flag before letting auto-detection logic
+	 * override it.
+	 * This is required to make sure initial NAND bus width set by the
+	 * NAND controller driver is coherent with the real NAND bus width
+	 * (extracted by auto-detection code).
+	 */
+	busw = chip->options & NAND_BUSWIDTH_16;
+
+	/*
+	 * The flag is only set (never cleared), reset it to its default value
+	 * before starting auto-detection.
+	 */
+	chip->options &= ~NAND_BUSWIDTH_16;
+
 	for (; type->name != NULL; type++) {
 		if (is_full_id_nand(type)) {
-			if (find_full_id_nand(chip, type, &busw))
+			if (find_full_id_nand(chip, type))
 				goto ident_done;
 		} else if (dev_id == type->dev_id) {
 			break;
@@ -4078,11 +4086,11 @@ static int nand_get_flash_type(struct nand_chip *chip,
 	chip->onfi_version = 0;
 	if (!type->name || !type->pagesize) {
 		/* Check if the chip is ONFI compliant */
-		if (nand_flash_detect_onfi(chip, &busw))
+		if (nand_flash_detect_onfi(chip))
 			goto ident_done;
 
 		/* Check if the chip is JEDEC compliant */
-		if (nand_flash_detect_jedec(chip, &busw))
+		if (nand_flash_detect_jedec(chip))
 			goto ident_done;
 	}
 
@@ -4096,9 +4104,9 @@ static int nand_get_flash_type(struct nand_chip *chip,
 
 	if (!type->pagesize) {
 		/* Decode parameters from extended ID */
-		nand_decode_ext_id(chip, &busw);
+		nand_decode_ext_id(chip);
 	} else {
-		nand_decode_id(chip, type, &busw);
+		nand_decode_id(chip, type);
 	}
 	/* Get chip options */
 	chip->options |= type->options;
@@ -4118,9 +4126,8 @@ static int nand_get_flash_type(struct nand_chip *chip,
 	}
 
 	if (chip->options & NAND_BUSWIDTH_AUTO) {
-		WARN_ON(chip->options & NAND_BUSWIDTH_16);
-		chip->options |= busw;
-		nand_set_defaults(chip, busw);
+		WARN_ON(busw & NAND_BUSWIDTH_16);
+		nand_set_defaults(chip);
 	} else if (busw != (chip->options & NAND_BUSWIDTH_16)) {
 		/*
 		 * Check, if buswidth is correct. Hardware drivers should set
@@ -4129,9 +4136,8 @@ static int nand_get_flash_type(struct nand_chip *chip,
 		pr_info("device found, Manufacturer ID: 0x%02x, Chip ID: 0x%02x\n",
 			maf_id, dev_id);
 		pr_info("%s %s\n", nand_manuf_ids[maf_idx].name, mtd->name);
-		pr_warn("bus width %d instead %d bit\n",
-			   (chip->options & NAND_BUSWIDTH_16) ? 16 : 8,
-			   busw ? 16 : 8);
+		pr_warn("bus width %d instead of %d bits\n", busw ? 16 : 8,
+			(chip->options & NAND_BUSWIDTH_16) ? 16 : 8);
 		return -EINVAL;
 	}
 
@@ -4359,7 +4365,7 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 		return -EINVAL;
 	}
 	/* Set the default functions */
-	nand_set_defaults(chip, chip->options & NAND_BUSWIDTH_16);
+	nand_set_defaults(chip);
 
 	/* Read the flash type */
 	ret = nand_get_flash_type(chip, table);
-- 
2.7.4
