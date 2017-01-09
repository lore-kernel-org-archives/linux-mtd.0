Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cQWoo-0008R4-PE
 for linux-mtd@lists.infradead.org; Mon, 09 Jan 2017 10:04:50 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: Icenowy Zheng <icenowy@aosc.xyz>, Valdis.Kletnieks@vt.edu,
 Aleksei Mamlin <mamlinav@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 02/17] mtd: nand: Store nand ID in struct nand_chip
Date: Mon,  9 Jan 2017 11:04:09 +0100
Message-Id: <1483956264-3335-3-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1483956264-3335-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1483956264-3335-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Store the NAND ID in struct nand_chip to avoid passing id_data and id_len
as function parameters.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Acked-by: Richard Weinberger <richard@nod.at>
Reviewed-by: Marek Vasut <marek.vasut@gmail.com>
---
 drivers/mtd/nand/nand_base.c | 55 ++++++++++++++++++++++++--------------------
 include/linux/mtd/nand.h     | 13 +++++++++++
 2 files changed, 43 insertions(+), 25 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 6950978e77f5..309f2e113d39 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3781,18 +3781,16 @@ static int nand_get_bits_per_cell(u8 cellinfo)
  * chip. The rest of the parameters must be decoded according to generic or
  * manufacturer-specific "extended ID" decoding patterns.
  */
-static void nand_decode_ext_id(struct nand_chip *chip, u8 id_data[8],
-			       int *busw)
+static void nand_decode_ext_id(struct nand_chip *chip, int *busw)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
-	int extid, id_len;
+	int extid, id_len = chip->id.len;
+	u8 *id_data = chip->id.data;
 	/* The 3rd id byte holds MLC / multichip data */
 	chip->bits_per_cell = nand_get_bits_per_cell(id_data[2]);
 	/* The 4th id byte is the important one */
 	extid = id_data[3];
 
-	id_len = nand_id_len(id_data, 8);
-
 	/*
 	 * Field definitions are in the following datasheets:
 	 * Old style (4,5 byte ID): Samsung K9GAG08U0M (p.32)
@@ -3916,9 +3914,10 @@ static void nand_decode_ext_id(struct nand_chip *chip, u8 id_data[8],
  * the chip.
  */
 static void nand_decode_id(struct nand_chip *chip, struct nand_flash_dev *type,
-			   u8 id_data[8], int *busw)
+			   int *busw)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
+	u8 *id_data = chip->id.data;
 	int maf_id = id_data[0];
 
 	mtd->erasesize = type->erasesize;
@@ -3948,9 +3947,10 @@ static void nand_decode_id(struct nand_chip *chip, struct nand_flash_dev *type,
  * heuristic patterns using various detected parameters (e.g., manufacturer,
  * page size, cell-type information).
  */
-static void nand_decode_bbm_options(struct nand_chip *chip, u8 id_data[8])
+static void nand_decode_bbm_options(struct nand_chip *chip)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
+	u8 *id_data = chip->id.data;
 	int maf_id = id_data[0];
 
 	/* Set the bad block position */
@@ -3986,10 +3986,10 @@ static inline bool is_full_id_nand(struct nand_flash_dev *type)
 }
 
 static bool find_full_id_nand(struct nand_chip *chip,
-			      struct nand_flash_dev *type, u8 *id_data,
-			      int *busw)
+			      struct nand_flash_dev *type, int *busw)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
+	u8 *id_data = chip->id.data;
 
 	if (!strncmp(type->id, id_data, type->id_len)) {
 		mtd->writesize = type->pagesize;
@@ -4018,13 +4018,13 @@ static bool find_full_id_nand(struct nand_chip *chip,
  * Get the flash and manufacturer id and lookup if the type is supported.
  */
 static int nand_get_flash_type(struct nand_chip *chip,
-			       int *maf_id, int *dev_id,
 			       struct nand_flash_dev *type)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	int busw;
 	int i, maf_idx;
-	u8 id_data[8];
+	u8 *id_data = chip->id.data;
+	u8 maf_id, dev_id;
 
 	/*
 	 * Reset the chip, required by some chips (e.g. Micron MT29FxGxxxxx)
@@ -4039,8 +4039,8 @@ static int nand_get_flash_type(struct nand_chip *chip,
 	chip->cmdfunc(mtd, NAND_CMD_READID, 0x00, -1);
 
 	/* Read manufacturer and device IDs */
-	*maf_id = chip->read_byte(mtd);
-	*dev_id = chip->read_byte(mtd);
+	maf_id = chip->read_byte(mtd);
+	dev_id = chip->read_byte(mtd);
 
 	/*
 	 * Try again to make sure, as some systems the bus-hold or other
@@ -4055,20 +4055,22 @@ static int nand_get_flash_type(struct nand_chip *chip,
 	for (i = 0; i < 8; i++)
 		id_data[i] = chip->read_byte(mtd);
 
-	if (id_data[0] != *maf_id || id_data[1] != *dev_id) {
+	if (id_data[0] != maf_id || id_data[1] != dev_id) {
 		pr_info("second ID read did not match %02x,%02x against %02x,%02x\n",
-			*maf_id, *dev_id, id_data[0], id_data[1]);
+			maf_id, dev_id, id_data[0], id_data[1]);
 		return -ENODEV;
 	}
 
+	chip->id.len = nand_id_len(id_data, 8);
+
 	if (!type)
 		type = nand_flash_ids;
 
 	for (; type->name != NULL; type++) {
 		if (is_full_id_nand(type)) {
-			if (find_full_id_nand(chip, type, id_data, &busw))
+			if (find_full_id_nand(chip, type, &busw))
 				goto ident_done;
-		} else if (*dev_id == type->dev_id) {
+		} else if (dev_id == type->dev_id) {
 			break;
 		}
 	}
@@ -4094,9 +4096,9 @@ static int nand_get_flash_type(struct nand_chip *chip,
 
 	if (!type->pagesize) {
 		/* Decode parameters from extended ID */
-		nand_decode_ext_id(chip, id_data, &busw);
+		nand_decode_ext_id(chip, &busw);
 	} else {
-		nand_decode_id(chip, type, id_data, &busw);
+		nand_decode_id(chip, type, &busw);
 	}
 	/* Get chip options */
 	chip->options |= type->options;
@@ -4105,13 +4107,13 @@ static int nand_get_flash_type(struct nand_chip *chip,
 	 * Check if chip is not a Samsung device. Do not clear the
 	 * options for chips which do not have an extended id.
 	 */
-	if (*maf_id != NAND_MFR_SAMSUNG && !type->pagesize)
+	if (maf_id != NAND_MFR_SAMSUNG && !type->pagesize)
 		chip->options &= ~NAND_SAMSUNG_LP_OPTIONS;
 ident_done:
 
 	/* Try to identify manufacturer */
 	for (maf_idx = 0; nand_manuf_ids[maf_idx].id != 0x0; maf_idx++) {
-		if (nand_manuf_ids[maf_idx].id == *maf_id)
+		if (nand_manuf_ids[maf_idx].id == maf_id)
 			break;
 	}
 
@@ -4125,7 +4127,7 @@ static int nand_get_flash_type(struct nand_chip *chip,
 		 * chip correct!
 		 */
 		pr_info("device found, Manufacturer ID: 0x%02x, Chip ID: 0x%02x\n",
-			*maf_id, *dev_id);
+			maf_id, dev_id);
 		pr_info("%s %s\n", nand_manuf_ids[maf_idx].name, mtd->name);
 		pr_warn("bus width %d instead %d bit\n",
 			   (chip->options & NAND_BUSWIDTH_16) ? 16 : 8,
@@ -4133,7 +4135,7 @@ static int nand_get_flash_type(struct nand_chip *chip,
 		return -EINVAL;
 	}
 
-	nand_decode_bbm_options(chip, id_data);
+	nand_decode_bbm_options(chip);
 
 	/* Calculate the address shift from the page size */
 	chip->page_shift = ffs(mtd->writesize) - 1;
@@ -4157,7 +4159,7 @@ static int nand_get_flash_type(struct nand_chip *chip,
 		chip->cmdfunc = nand_command_lp;
 
 	pr_info("device found, Manufacturer ID: 0x%02x, Chip ID: 0x%02x\n",
-		*maf_id, *dev_id);
+		maf_id, dev_id);
 
 	if (chip->onfi_version)
 		pr_info("%s %s\n", nand_manuf_ids[maf_idx].name,
@@ -4360,7 +4362,7 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 	nand_set_defaults(chip, chip->options & NAND_BUSWIDTH_16);
 
 	/* Read the flash type */
-	ret = nand_get_flash_type(chip, &nand_maf_id, &nand_dev_id, table);
+	ret = nand_get_flash_type(chip, table);
 	if (ret) {
 		if (!(chip->options & NAND_SCAN_SILENT_NODEV))
 			pr_warn("No NAND device found\n");
@@ -4385,6 +4387,9 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 	if (ret)
 		return ret;
 
+	nand_maf_id = chip->id.data[0];
+	nand_dev_id = chip->id.data[1];
+
 	chip->select_chip(mtd, -1);
 
 	/* Check for a chip array */
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index c5f3a012ae62..632975146c30 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -465,6 +465,17 @@ struct nand_jedec_params {
 } __packed;
 
 /**
+ * struct nand_id - NAND id structure
+ * @data: buffer containing the id bytes. Currently 8 bytes large, but can
+ *	  be extended if required.
+ * @len: ID length.
+ */
+struct nand_id {
+	u8 data[8];
+	int len;
+};
+
+/**
  * struct nand_hw_control - Control structure for hardware controller (e.g ECC generator) shared among independent devices
  * @lock:               protection lock
  * @active:		the mtd device which holds the controller currently
@@ -793,6 +804,7 @@ nand_get_sdr_timings(const struct nand_data_interface *conf)
  * @pagebuf_bitflips:	[INTERN] holds the bitflip count for the page which is
  *			currently in data_buf.
  * @subpagesize:	[INTERN] holds the subpagesize
+ * @id:			[INTERN] holds NAND ID
  * @onfi_version:	[INTERN] holds the chip ONFI version (BCD encoded),
  *			non 0 if ONFI supported.
  * @jedec_version:	[INTERN] holds the chip JEDEC version (BCD encoded),
@@ -877,6 +889,7 @@ struct nand_chip {
 	int badblockpos;
 	int badblockbits;
 
+	struct nand_id id;
 	int onfi_version;
 	int jedec_version;
 	union {
-- 
2.7.4
