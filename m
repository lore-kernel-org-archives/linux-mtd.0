Received: from co9ehsobe002.messaging.microsoft.com ([207.46.163.25]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VBFJN-0004fP-Jd
 for linux-mtd@lists.infradead.org; Mon, 19 Aug 2013 02:35:38 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v2 1/9] mtd: nand: rename the cellinfo to bits_per_cell
Date: Mon, 19 Aug 2013 10:31:10 +0800
Message-ID: <1376879478-22128-2-git-send-email-b32955@freescale.com>
In-Reply-To: <1376879478-22128-1-git-send-email-b32955@freescale.com>
References: <1376879478-22128-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: dedekind1@gmail.com, akinobu.mita@gmail.com, matthieu.castet@parrot.com,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Huang Shijie <shijie8@gmail.com>

The @cellinfo fields contains unused information, such as write caching,
internal chip numbering, etc. But we only use it to check the SLC or MLC.

This patch tries to make it more clear and simple, renames the @cellinfo
to @bits_per_cell.

In order to avoiding the bisect issue, this patch also does the following
changes:
  (0) add a macro NAND_CI_CELLTYPE_SHIFT to avoid the hardcode.

  (1) add a helper to check the SLC : nand_is_slc()

  (2) add a helper to parse out the cell type : nand_get_bits_per_cell()

  (3) parse out the cell type for legacy nand chips and extended-ID
      chips, and the full-id nand chips.

Signed-off-by: Huang Shijie <shijie8@gmail.com>
Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/denali.c    |    2 +-
 drivers/mtd/nand/nand_base.c |   28 ++++++++++++++++++----------
 include/linux/mtd/nand.h     |   14 ++++++++++++--
 3 files changed, 31 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 2ed2bb3..645721e 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1520,7 +1520,7 @@ int denali_init(struct denali_nand_info *denali)
 	 * so just let controller do 15bit ECC for MLC and 8bit ECC for
 	 * SLC if possible.
 	 * */
-	if (denali->nand.cellinfo & NAND_CI_CELLTYPE_MSK &&
+	if (!nand_is_slc(&denali->nand) &&
 			(denali->mtd.oobsize > (denali->bbtskipbytes +
 			ECC_15BITS * (denali->mtd.writesize /
 			ECC_SECTOR_SIZE)))) {
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 7ed4841..567cbcd 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3077,6 +3077,15 @@ static int nand_id_len(u8 *id_data, int arrlen)
 	return arrlen;
 }
 
+static int nand_get_bits_per_cell(u8 data)
+{
+	int bits;
+
+	bits = data & NAND_CI_CELLTYPE_MSK;
+	bits >>= NAND_CI_CELLTYPE_SHIFT;
+	return bits + 1;
+}
+
 /*
  * Many new NAND share similar device ID codes, which represent the size of the
  * chip. The rest of the parameters must be decoded according to generic or
@@ -3087,7 +3096,7 @@ static void nand_decode_ext_id(struct mtd_info *mtd, struct nand_chip *chip,
 {
 	int extid, id_len;
 	/* The 3rd id byte holds MLC / multichip data */
-	chip->cellinfo = id_data[2];
+	chip->bits_per_cell = nand_get_bits_per_cell(id_data[2]);
 	/* The 4th id byte is the important one */
 	extid = id_data[3];
 
@@ -3103,8 +3112,7 @@ static void nand_decode_ext_id(struct mtd_info *mtd, struct nand_chip *chip,
 	 * ID to decide what to do.
 	 */
 	if (id_len == 6 && id_data[0] == NAND_MFR_SAMSUNG &&
-			(chip->cellinfo & NAND_CI_CELLTYPE_MSK) &&
-			id_data[5] != 0x00) {
+			!nand_is_slc(chip) && id_data[5] != 0x00) {
 		/* Calc pagesize */
 		mtd->writesize = 2048 << (extid & 0x03);
 		extid >>= 2;
@@ -3136,7 +3144,7 @@ static void nand_decode_ext_id(struct mtd_info *mtd, struct nand_chip *chip,
 			(((extid >> 1) & 0x04) | (extid & 0x03));
 		*busw = 0;
 	} else if (id_len == 6 && id_data[0] == NAND_MFR_HYNIX &&
-			(chip->cellinfo & NAND_CI_CELLTYPE_MSK)) {
+			!nand_is_slc(chip)) {
 		unsigned int tmp;
 
 		/* Calc pagesize */
@@ -3199,7 +3207,7 @@ static void nand_decode_ext_id(struct mtd_info *mtd, struct nand_chip *chip,
 		 * - ID byte 5, bit[7]:    1 -> BENAND, 0 -> raw SLC
 		 */
 		if (id_len >= 6 && id_data[0] == NAND_MFR_TOSHIBA &&
-				!(chip->cellinfo & NAND_CI_CELLTYPE_MSK) &&
+				nand_is_slc(chip) &&
 				(id_data[5] & 0x7) == 0x6 /* 24nm */ &&
 				!(id_data[4] & 0x80) /* !BENAND */) {
 			mtd->oobsize = 32 * mtd->writesize >> 9;
@@ -3224,6 +3232,7 @@ static void nand_decode_id(struct mtd_info *mtd, struct nand_chip *chip,
 	mtd->oobsize = mtd->writesize / 32;
 	*busw = type->options & NAND_BUSWIDTH_16;
 
+	chip->bits_per_cell = nand_get_bits_per_cell(id_data[2]);
 	/*
 	 * Check for Spansion/AMD ID + repeating 5th, 6th byte since
 	 * some Spansion chips have erasesize that conflicts with size
@@ -3260,11 +3269,11 @@ static void nand_decode_bbm_options(struct mtd_info *mtd,
 	 * Micron devices with 2KiB pages and on SLC Samsung, Hynix, Toshiba,
 	 * AMD/Spansion, and Macronix.  All others scan only the first page.
 	 */
-	if ((chip->cellinfo & NAND_CI_CELLTYPE_MSK) &&
+	if (!nand_is_slc(chip) &&
 			(maf_id == NAND_MFR_SAMSUNG ||
 			 maf_id == NAND_MFR_HYNIX))
 		chip->bbt_options |= NAND_BBT_SCANLASTPAGE;
-	else if ((!(chip->cellinfo & NAND_CI_CELLTYPE_MSK) &&
+	else if ((nand_is_slc(chip) &&
 				(maf_id == NAND_MFR_SAMSUNG ||
 				 maf_id == NAND_MFR_HYNIX ||
 				 maf_id == NAND_MFR_TOSHIBA ||
@@ -3288,7 +3297,7 @@ static bool find_full_id_nand(struct mtd_info *mtd, struct nand_chip *chip,
 		mtd->erasesize = type->erasesize;
 		mtd->oobsize = type->oobsize;
 
-		chip->cellinfo = id_data[2];
+		chip->bits_per_cell = nand_get_bits_per_cell(id_data[2]);
 		chip->chipsize = (uint64_t)type->chipsize << 20;
 		chip->options |= type->options;
 		chip->ecc_strength_ds = NAND_ECC_STRENGTH(type);
@@ -3740,8 +3749,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 	chip->ecc.total = chip->ecc.steps * chip->ecc.bytes;
 
 	/* Allow subpage writes up to ecc.steps. Not possible for MLC flash */
-	if (!(chip->options & NAND_NO_SUBPAGE_WRITE) &&
-	    !(chip->cellinfo & NAND_CI_CELLTYPE_MSK)) {
+	if (!(chip->options & NAND_NO_SUBPAGE_WRITE) && nand_is_slc(chip)) {
 		switch (chip->ecc.steps) {
 		case 2:
 			mtd->subpage_sft = 1;
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index ac8e89d..6e9106b 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -198,6 +198,7 @@ typedef enum {
 /* Cell info constants */
 #define NAND_CI_CHIPNR_MSK	0x03
 #define NAND_CI_CELLTYPE_MSK	0x0C
+#define NAND_CI_CELLTYPE_SHIFT	2
 
 /* Keep gcc happy */
 struct nand_chip;
@@ -477,7 +478,7 @@ struct nand_buffers {
  * @badblockbits:	[INTERN] minimum number of set bits in a good block's
  *			bad block marker position; i.e., BBM == 11110111b is
  *			not bad when badblockbits == 7
- * @cellinfo:		[INTERN] MLC/multichip data from chip ident
+ * @bits_per_cell:	[INTERN] the bits of per cell. i.e., 1 means SLC.
  * @ecc_strength_ds:	[INTERN] ECC correctability from the datasheet.
  *			Minimum amount of bit errors per @ecc_step_ds guaranteed
  *			to be correctable. If unknown, set to zero.
@@ -559,7 +560,7 @@ struct nand_chip {
 	int pagebuf;
 	unsigned int pagebuf_bitflips;
 	int subpagesize;
-	uint8_t cellinfo;
+	uint8_t bits_per_cell;
 	uint16_t ecc_strength_ds;
 	uint16_t ecc_step_ds;
 	int badblockpos;
@@ -797,4 +798,13 @@ static inline int onfi_get_sync_timing_mode(struct nand_chip *chip)
 	return le16_to_cpu(chip->onfi_params.src_sync_timing_mode);
 }
 
+/*
+ * Check if it is a SLC nand.
+ * The !nand_is_slc() can be used to check the MLC/TLC nand chips.
+ * We do not distinguish the MLC and TLC now.
+ */
+static inline bool nand_is_slc(struct nand_chip *chip)
+{
+	return chip->bits_per_cell == 1;
+}
 #endif /* __LINUX_MTD_NAND_H */
-- 
1.7.1
