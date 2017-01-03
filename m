Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cOOj2-0006Ih-KB
 for linux-mtd@lists.infradead.org; Tue, 03 Jan 2017 13:02:03 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Icenowy Zheng <icenowy@aosc.xyz>, Valdis.Kletnieks@vt.edu,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 01/15] mtd: nand: get rid of the mtd parameter in all
 auto-detection functions
Date: Tue,  3 Jan 2017 14:01:21 +0100
Message-Id: <1483448495-31607-2-git-send-email-boris.brezillon@free-electrons.com>
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

Now that struct nand_chip embeds an mtd_info object we can get rid of the
mtd parameter and extract it from the chip parameter with the nand_to_mtd()
helper.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/nand_base.c | 54 ++++++++++++++++++++++++--------------------
 1 file changed, 30 insertions(+), 24 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index ec1c28aaaf23..6950978e77f5 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3427,9 +3427,10 @@ static u16 onfi_crc16(u16 crc, u8 const *p, size_t len)
 }
 
 /* Parse the Extended Parameter Page. */
-static int nand_flash_detect_ext_param_page(struct mtd_info *mtd,
-		struct nand_chip *chip, struct nand_onfi_params *p)
+static int nand_flash_detect_ext_param_page(struct nand_chip *chip,
+					    struct nand_onfi_params *p)
 {
+	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct onfi_ext_param_page *ep;
 	struct onfi_ext_section *s;
 	struct onfi_ext_ecc_info *ecc;
@@ -3524,9 +3525,9 @@ static void nand_onfi_detect_micron(struct nand_chip *chip,
 /*
  * Check if the NAND chip is ONFI compliant, returns 1 if it is, 0 otherwise.
  */
-static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
-					int *busw)
+static int nand_flash_detect_onfi(struct nand_chip *chip, int *busw)
 {
+	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct nand_onfi_params *p = &chip->onfi_params;
 	int i, j;
 	int val;
@@ -3613,7 +3614,7 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
 			chip->cmdfunc = nand_command_lp;
 
 		/* The Extended Parameter Page is supported since ONFI 2.1. */
-		if (nand_flash_detect_ext_param_page(mtd, chip, p))
+		if (nand_flash_detect_ext_param_page(chip, p))
 			pr_warn("Failed to detect ONFI extended param page\n");
 	} else {
 		pr_warn("Could not retrieve ONFI ECC requirements\n");
@@ -3628,9 +3629,9 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
 /*
  * Check if the NAND chip is JEDEC compliant, returns 1 if it is, 0 otherwise.
  */
-static int nand_flash_detect_jedec(struct mtd_info *mtd, struct nand_chip *chip,
-					int *busw)
+static int nand_flash_detect_jedec(struct nand_chip *chip, int *busw)
 {
+	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct nand_jedec_params *p = &chip->jedec_params;
 	struct jedec_ecc_info *ecc;
 	int val;
@@ -3780,9 +3781,10 @@ static int nand_get_bits_per_cell(u8 cellinfo)
  * chip. The rest of the parameters must be decoded according to generic or
  * manufacturer-specific "extended ID" decoding patterns.
  */
-static void nand_decode_ext_id(struct mtd_info *mtd, struct nand_chip *chip,
-				u8 id_data[8], int *busw)
+static void nand_decode_ext_id(struct nand_chip *chip, u8 id_data[8],
+			       int *busw)
 {
+	struct mtd_info *mtd = nand_to_mtd(chip);
 	int extid, id_len;
 	/* The 3rd id byte holds MLC / multichip data */
 	chip->bits_per_cell = nand_get_bits_per_cell(id_data[2]);
@@ -3913,10 +3915,10 @@ static void nand_decode_ext_id(struct mtd_info *mtd, struct nand_chip *chip,
  * decodes a matching ID table entry and assigns the MTD size parameters for
  * the chip.
  */
-static void nand_decode_id(struct mtd_info *mtd, struct nand_chip *chip,
-				struct nand_flash_dev *type, u8 id_data[8],
-				int *busw)
+static void nand_decode_id(struct nand_chip *chip, struct nand_flash_dev *type,
+			   u8 id_data[8], int *busw)
 {
+	struct mtd_info *mtd = nand_to_mtd(chip);
 	int maf_id = id_data[0];
 
 	mtd->erasesize = type->erasesize;
@@ -3946,9 +3948,9 @@ static void nand_decode_id(struct mtd_info *mtd, struct nand_chip *chip,
  * heuristic patterns using various detected parameters (e.g., manufacturer,
  * page size, cell-type information).
  */
-static void nand_decode_bbm_options(struct mtd_info *mtd,
-				    struct nand_chip *chip, u8 id_data[8])
+static void nand_decode_bbm_options(struct nand_chip *chip, u8 id_data[8])
 {
+	struct mtd_info *mtd = nand_to_mtd(chip);
 	int maf_id = id_data[0];
 
 	/* Set the bad block position */
@@ -3983,9 +3985,12 @@ static inline bool is_full_id_nand(struct nand_flash_dev *type)
 	return type->id_len;
 }
 
-static bool find_full_id_nand(struct mtd_info *mtd, struct nand_chip *chip,
-		   struct nand_flash_dev *type, u8 *id_data, int *busw)
+static bool find_full_id_nand(struct nand_chip *chip,
+			      struct nand_flash_dev *type, u8 *id_data,
+			      int *busw)
 {
+	struct mtd_info *mtd = nand_to_mtd(chip);
+
 	if (!strncmp(type->id, id_data, type->id_len)) {
 		mtd->writesize = type->pagesize;
 		mtd->erasesize = type->erasesize;
@@ -4012,10 +4017,11 @@ static bool find_full_id_nand(struct mtd_info *mtd, struct nand_chip *chip,
 /*
  * Get the flash and manufacturer id and lookup if the type is supported.
  */
-static int nand_get_flash_type(struct mtd_info *mtd, struct nand_chip *chip,
+static int nand_get_flash_type(struct nand_chip *chip,
 			       int *maf_id, int *dev_id,
 			       struct nand_flash_dev *type)
 {
+	struct mtd_info *mtd = nand_to_mtd(chip);
 	int busw;
 	int i, maf_idx;
 	u8 id_data[8];
@@ -4060,7 +4066,7 @@ static int nand_get_flash_type(struct mtd_info *mtd, struct nand_chip *chip,
 
 	for (; type->name != NULL; type++) {
 		if (is_full_id_nand(type)) {
-			if (find_full_id_nand(mtd, chip, type, id_data, &busw))
+			if (find_full_id_nand(chip, type, id_data, &busw))
 				goto ident_done;
 		} else if (*dev_id == type->dev_id) {
 			break;
@@ -4070,11 +4076,11 @@ static int nand_get_flash_type(struct mtd_info *mtd, struct nand_chip *chip,
 	chip->onfi_version = 0;
 	if (!type->name || !type->pagesize) {
 		/* Check if the chip is ONFI compliant */
-		if (nand_flash_detect_onfi(mtd, chip, &busw))
+		if (nand_flash_detect_onfi(chip, &busw))
 			goto ident_done;
 
 		/* Check if the chip is JEDEC compliant */
-		if (nand_flash_detect_jedec(mtd, chip, &busw))
+		if (nand_flash_detect_jedec(chip, &busw))
 			goto ident_done;
 	}
 
@@ -4088,9 +4094,9 @@ static int nand_get_flash_type(struct mtd_info *mtd, struct nand_chip *chip,
 
 	if (!type->pagesize) {
 		/* Decode parameters from extended ID */
-		nand_decode_ext_id(mtd, chip, id_data, &busw);
+		nand_decode_ext_id(chip, id_data, &busw);
 	} else {
-		nand_decode_id(mtd, chip, type, id_data, &busw);
+		nand_decode_id(chip, type, id_data, &busw);
 	}
 	/* Get chip options */
 	chip->options |= type->options;
@@ -4127,7 +4133,7 @@ static int nand_get_flash_type(struct mtd_info *mtd, struct nand_chip *chip,
 		return -EINVAL;
 	}
 
-	nand_decode_bbm_options(mtd, chip, id_data);
+	nand_decode_bbm_options(chip, id_data);
 
 	/* Calculate the address shift from the page size */
 	chip->page_shift = ffs(mtd->writesize) - 1;
@@ -4354,7 +4360,7 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 	nand_set_defaults(chip, chip->options & NAND_BUSWIDTH_16);
 
 	/* Read the flash type */
-	ret = nand_get_flash_type(mtd, chip, &nand_maf_id, &nand_dev_id, table);
+	ret = nand_get_flash_type(chip, &nand_maf_id, &nand_dev_id, table);
 	if (ret) {
 		if (!(chip->options & NAND_SCAN_SILENT_NODEV))
 			pr_warn("No NAND device found\n");
-- 
2.7.4
