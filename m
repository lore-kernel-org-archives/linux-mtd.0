Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]
 helo=tx2outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V8kwM-0006ya-5p
 for linux-mtd@lists.infradead.org; Mon, 12 Aug 2013 05:45:20 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH 02/10] mtd: add a helper to check the SLC/MLC nand chip
Date: Mon, 12 Aug 2013 13:42:45 +0800
Message-ID: <1376286173-12581-3-git-send-email-b32955@freescale.com>
In-Reply-To: <1376286173-12581-1-git-send-email-b32955@freescale.com>
References: <1376286173-12581-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add a helper to check if a nand chip is SLC or MLC.
This helper makes the code more readable.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/denali.c    |    2 +-
 drivers/mtd/nand/nand_base.c |   14 ++++++--------
 include/linux/mtd/nand.h     |    9 +++++++++
 3 files changed, 16 insertions(+), 9 deletions(-)

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
index ee1aa52..fd5117d 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3105,8 +3105,7 @@ static void nand_decode_ext_id(struct mtd_info *mtd, struct nand_chip *chip,
 	 * ID to decide what to do.
 	 */
 	if (id_len == 6 && id_data[0] == NAND_MFR_SAMSUNG &&
-			(chip->cellinfo & NAND_CI_CELLTYPE_MSK) &&
-			id_data[5] != 0x00) {
+			!nand_is_slc(chip) && id_data[5] != 0x00) {
 		/* Calc pagesize */
 		mtd->writesize = 2048 << (extid & 0x03);
 		extid >>= 2;
@@ -3138,7 +3137,7 @@ static void nand_decode_ext_id(struct mtd_info *mtd, struct nand_chip *chip,
 			(((extid >> 1) & 0x04) | (extid & 0x03));
 		*busw = 0;
 	} else if (id_len == 6 && id_data[0] == NAND_MFR_HYNIX &&
-			(chip->cellinfo & NAND_CI_CELLTYPE_MSK)) {
+			!nand_is_slc(chip)) {
 		unsigned int tmp;
 
 		/* Calc pagesize */
@@ -3201,7 +3200,7 @@ static void nand_decode_ext_id(struct mtd_info *mtd, struct nand_chip *chip,
 		 * - ID byte 5, bit[7]:    1 -> BENAND, 0 -> raw SLC
 		 */
 		if (id_len >= 6 && id_data[0] == NAND_MFR_TOSHIBA &&
-				!(chip->cellinfo & NAND_CI_CELLTYPE_MSK) &&
+				nand_is_slc(chip) &&
 				(id_data[5] & 0x7) == 0x6 /* 24nm */ &&
 				!(id_data[4] & 0x80) /* !BENAND */) {
 			mtd->oobsize = 32 * mtd->writesize >> 9;
@@ -3262,11 +3261,11 @@ static void nand_decode_bbm_options(struct mtd_info *mtd,
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
@@ -3742,8 +3741,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 	chip->ecc.total = chip->ecc.steps * chip->ecc.bytes;
 
 	/* Allow subpage writes up to ecc.steps. Not possible for MLC flash */
-	if (!(chip->options & NAND_NO_SUBPAGE_WRITE) &&
-	    !(chip->cellinfo & NAND_CI_CELLTYPE_MSK)) {
+	if (!(chip->options & NAND_NO_SUBPAGE_WRITE) && nand_is_slc(chip)) {
 		switch (chip->ecc.steps) {
 		case 2:
 			mtd->subpage_sft = 1;
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index bf743ba..3c5aae6 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -798,4 +798,13 @@ static inline int onfi_get_sync_timing_mode(struct nand_chip *chip)
 	return le16_to_cpu(chip->onfi_params.src_sync_timing_mode);
 }
 
+/*
+ * Check if it is a SLC nand.
+ * The !nand_is_slc() can be used to check the MLC/TLC nand chips.
+ * We do not distinguish the MLC and TLC now.
+ */
+static inline bool nand_is_slc(struct nand_chip *chip)
+{
+	return !(chip->cellinfo & NAND_CI_CELLTYPE_MSK);
+}
 #endif /* __LINUX_MTD_NAND_H */
-- 
1.7.1
