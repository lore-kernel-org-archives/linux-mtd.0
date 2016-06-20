Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bEvUV-0003gA-6F
 for linux-mtd@lists.infradead.org; Mon, 20 Jun 2016 09:27:37 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>
Cc: linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Aleksei Mamlin <mamlinav@gmail.com>, valdis.kletnieks@vt.edu
Subject: [PATCH v3 02/16] mtd: nand: get rid of the mtd parameter in all
 auto-detection functions
Date: Mon, 20 Jun 2016 11:26:48 +0200
Message-Id: <1466414822-18948-3-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1466414822-18948-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1466414822-18948-1-git-send-email-boris.brezillon@free-electrons.com>
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
 drivers/mtd/nand/nand_base.c | 56 ++++++++++++++++++++++++--------------------
 1 file changed, 30 insertions(+), 26 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index c2f832360871..a0ce1b5c9df2 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3231,9 +3231,10 @@ static u16 onfi_crc16(u16 crc, u8 const *p, size_t len)
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
@@ -3328,9 +3329,9 @@ static void nand_onfi_detect_micron(struct nand_chip *chip,
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
@@ -3417,7 +3418,7 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
 			chip->cmdfunc = nand_command_lp;
 
 		/* The Extended Parameter Page is supported since ONFI 2.1. */
-		if (nand_flash_detect_ext_param_page(mtd, chip, p))
+		if (nand_flash_detect_ext_param_page(chip, p))
 			pr_warn("Failed to detect ONFI extended param page\n");
 	} else {
 		pr_warn("Could not retrieve ONFI ECC requirements\n");
@@ -3432,9 +3433,9 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
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
@@ -3584,9 +3585,10 @@ static int nand_get_bits_per_cell(u8 cellinfo)
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
@@ -3717,10 +3719,10 @@ static void nand_decode_ext_id(struct mtd_info *mtd, struct nand_chip *chip,
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
@@ -3750,9 +3752,9 @@ static void nand_decode_id(struct mtd_info *mtd, struct nand_chip *chip,
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
@@ -3787,9 +3789,12 @@ static inline bool is_full_id_nand(struct nand_flash_dev *type)
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
@@ -3816,11 +3821,11 @@ static bool find_full_id_nand(struct mtd_info *mtd, struct nand_chip *chip,
 /*
  * Get the flash and manufacturer id and lookup if the type is supported.
  */
-static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
-						  struct nand_chip *chip,
+static struct nand_flash_dev *nand_get_flash_type(struct nand_chip *chip,
 						  int *maf_id, int *dev_id,
 						  struct nand_flash_dev *type)
 {
+	struct mtd_info *mtd = nand_to_mtd(chip);
 	int busw;
 	int i, maf_idx;
 	u8 id_data[8];
@@ -3865,7 +3870,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 
 	for (; type->name != NULL; type++) {
 		if (is_full_id_nand(type)) {
-			if (find_full_id_nand(mtd, chip, type, id_data, &busw))
+			if (find_full_id_nand(chip, type, id_data, &busw))
 				goto ident_done;
 		} else if (*dev_id == type->dev_id) {
 			break;
@@ -3875,11 +3880,11 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
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
 
@@ -3893,9 +3898,9 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 
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
@@ -3932,7 +3937,7 @@ ident_done:
 		return ERR_PTR(-EINVAL);
 	}
 
-	nand_decode_bbm_options(mtd, chip, id_data);
+	nand_decode_bbm_options(chip, id_data);
 
 	/* Calculate the address shift from the page size */
 	chip->page_shift = ffs(mtd->writesize) - 1;
@@ -4148,8 +4153,7 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 	nand_set_defaults(chip, chip->options & NAND_BUSWIDTH_16);
 
 	/* Read the flash type */
-	type = nand_get_flash_type(mtd, chip, &nand_maf_id,
-				   &nand_dev_id, table);
+	type = nand_get_flash_type(chip, &nand_maf_id, &nand_dev_id, table);
 
 	if (IS_ERR(type)) {
 		if (!(chip->options & NAND_SCAN_SILENT_NODEV))
-- 
2.7.4
