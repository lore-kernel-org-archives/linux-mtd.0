Received: from mail-db8lp0188.outbound.messaging.microsoft.com
 ([213.199.154.188] helo=db8outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VX3gy-00023n-58
 for linux-mtd@lists.infradead.org; Fri, 18 Oct 2013 06:37:49 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH] mtd: nand: use a local variable to simplify the nand_scan_tail
Date: Fri, 18 Oct 2013 14:20:53 +0800
Message-ID: <1382077253-21709-1-git-send-email-b32955@freescale.com>
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

There are too many "chip->ecc" in the nand_scan_tail() which makes the eyes
sore.

This patch uses a local variable "ecc" to replace the "chip->ecc" to
make the code more graceful.

Do the code change with "s/chip->ecc\./ecc->/g" in the nand_scan_tail,
and also change some lines by hand.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/nand_base.c |  213 ++++++++++++++++++++---------------------
 1 files changed, 104 insertions(+), 109 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 8488844..b60c204 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3547,6 +3547,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 {
 	int i;
 	struct nand_chip *chip = mtd->priv;
+	struct nand_ecc_ctrl *ecc = &chip->ecc;
 
 	/* New bad blocks should be marked in OOB, flash-based BBT, or both */
 	BUG_ON((chip->bbt_options & NAND_BBT_NO_OOB_BBM) &&
@@ -3563,19 +3564,19 @@ int nand_scan_tail(struct mtd_info *mtd)
 	/*
 	 * If no default placement scheme is given, select an appropriate one.
 	 */
-	if (!chip->ecc.layout && (chip->ecc.mode != NAND_ECC_SOFT_BCH)) {
+	if (!ecc->layout && (ecc->mode != NAND_ECC_SOFT_BCH)) {
 		switch (mtd->oobsize) {
 		case 8:
-			chip->ecc.layout = &nand_oob_8;
+			ecc->layout = &nand_oob_8;
 			break;
 		case 16:
-			chip->ecc.layout = &nand_oob_16;
+			ecc->layout = &nand_oob_16;
 			break;
 		case 64:
-			chip->ecc.layout = &nand_oob_64;
+			ecc->layout = &nand_oob_64;
 			break;
 		case 128:
-			chip->ecc.layout = &nand_oob_128;
+			ecc->layout = &nand_oob_128;
 			break;
 		default:
 			pr_warn("No oob scheme defined for oobsize %d\n",
@@ -3592,64 +3593,62 @@ int nand_scan_tail(struct mtd_info *mtd)
 	 * selected and we have 256 byte pagesize fallback to software ECC
 	 */
 
-	switch (chip->ecc.mode) {
+	switch (ecc->mode) {
 	case NAND_ECC_HW_OOB_FIRST:
 		/* Similar to NAND_ECC_HW, but a separate read_page handle */
-		if (!chip->ecc.calculate || !chip->ecc.correct ||
-		     !chip->ecc.hwctl) {
+		if (!ecc->calculate || !ecc->correct || !ecc->hwctl) {
 			pr_warn("No ECC functions supplied; "
 				   "hardware ECC not possible\n");
 			BUG();
 		}
-		if (!chip->ecc.read_page)
-			chip->ecc.read_page = nand_read_page_hwecc_oob_first;
+		if (!ecc->read_page)
+			ecc->read_page = nand_read_page_hwecc_oob_first;
 
 	case NAND_ECC_HW:
 		/* Use standard hwecc read page function? */
-		if (!chip->ecc.read_page)
-			chip->ecc.read_page = nand_read_page_hwecc;
-		if (!chip->ecc.write_page)
-			chip->ecc.write_page = nand_write_page_hwecc;
-		if (!chip->ecc.read_page_raw)
-			chip->ecc.read_page_raw = nand_read_page_raw;
-		if (!chip->ecc.write_page_raw)
-			chip->ecc.write_page_raw = nand_write_page_raw;
-		if (!chip->ecc.read_oob)
-			chip->ecc.read_oob = nand_read_oob_std;
-		if (!chip->ecc.write_oob)
-			chip->ecc.write_oob = nand_write_oob_std;
-		if (!chip->ecc.read_subpage)
-			chip->ecc.read_subpage = nand_read_subpage;
-		if (!chip->ecc.write_subpage)
-			chip->ecc.write_subpage = nand_write_subpage_hwecc;
+		if (!ecc->read_page)
+			ecc->read_page = nand_read_page_hwecc;
+		if (!ecc->write_page)
+			ecc->write_page = nand_write_page_hwecc;
+		if (!ecc->read_page_raw)
+			ecc->read_page_raw = nand_read_page_raw;
+		if (!ecc->write_page_raw)
+			ecc->write_page_raw = nand_write_page_raw;
+		if (!ecc->read_oob)
+			ecc->read_oob = nand_read_oob_std;
+		if (!ecc->write_oob)
+			ecc->write_oob = nand_write_oob_std;
+		if (!ecc->read_subpage)
+			ecc->read_subpage = nand_read_subpage;
+		if (!ecc->write_subpage)
+			ecc->write_subpage = nand_write_subpage_hwecc;
 
 	case NAND_ECC_HW_SYNDROME:
-		if ((!chip->ecc.calculate || !chip->ecc.correct ||
-		     !chip->ecc.hwctl) &&
-		    (!chip->ecc.read_page ||
-		     chip->ecc.read_page == nand_read_page_hwecc ||
-		     !chip->ecc.write_page ||
-		     chip->ecc.write_page == nand_write_page_hwecc)) {
+		if ((!ecc->calculate || !ecc->correct || !ecc->hwctl) &&
+		    (!ecc->read_page ||
+		     ecc->read_page == nand_read_page_hwecc ||
+		     !ecc->write_page ||
+		     ecc->write_page == nand_write_page_hwecc)) {
 			pr_warn("No ECC functions supplied; "
 				   "hardware ECC not possible\n");
 			BUG();
 		}
 		/* Use standard syndrome read/write page function? */
-		if (!chip->ecc.read_page)
-			chip->ecc.read_page = nand_read_page_syndrome;
-		if (!chip->ecc.write_page)
-			chip->ecc.write_page = nand_write_page_syndrome;
-		if (!chip->ecc.read_page_raw)
-			chip->ecc.read_page_raw = nand_read_page_raw_syndrome;
-		if (!chip->ecc.write_page_raw)
-			chip->ecc.write_page_raw = nand_write_page_raw_syndrome;
-		if (!chip->ecc.read_oob)
-			chip->ecc.read_oob = nand_read_oob_syndrome;
-		if (!chip->ecc.write_oob)
-			chip->ecc.write_oob = nand_write_oob_syndrome;
-
-		if (mtd->writesize >= chip->ecc.size) {
-			if (!chip->ecc.strength) {
+		if (!ecc->read_page)
+			ecc->read_page = nand_read_page_syndrome;
+		if (!ecc->write_page)
+			ecc->write_page = nand_write_page_syndrome;
+		if (!ecc->read_page_raw)
+			ecc->read_page_raw = nand_read_page_raw_syndrome;
+		if (!ecc->write_page_raw)
+			ecc->write_page_raw = nand_write_page_raw_syndrome;
+		if (!ecc->read_oob)
+			ecc->read_oob = nand_read_oob_syndrome;
+		if (!ecc->write_oob)
+			ecc->write_oob = nand_write_oob_syndrome;
+
+		if (mtd->writesize >= ecc->size) {
+			if (!ecc->strength) {
 				pr_warn("Driver must set ecc.strength when using hardware ECC\n");
 				BUG();
 			}
@@ -3657,23 +3656,23 @@ int nand_scan_tail(struct mtd_info *mtd)
 		}
 		pr_warn("%d byte HW ECC not possible on "
 			   "%d byte page size, fallback to SW ECC\n",
-			   chip->ecc.size, mtd->writesize);
-		chip->ecc.mode = NAND_ECC_SOFT;
+			   ecc->size, mtd->writesize);
+		ecc->mode = NAND_ECC_SOFT;
 
 	case NAND_ECC_SOFT:
-		chip->ecc.calculate = nand_calculate_ecc;
-		chip->ecc.correct = nand_correct_data;
-		chip->ecc.read_page = nand_read_page_swecc;
-		chip->ecc.read_subpage = nand_read_subpage;
-		chip->ecc.write_page = nand_write_page_swecc;
-		chip->ecc.read_page_raw = nand_read_page_raw;
-		chip->ecc.write_page_raw = nand_write_page_raw;
-		chip->ecc.read_oob = nand_read_oob_std;
-		chip->ecc.write_oob = nand_write_oob_std;
-		if (!chip->ecc.size)
-			chip->ecc.size = 256;
-		chip->ecc.bytes = 3;
-		chip->ecc.strength = 1;
+		ecc->calculate = nand_calculate_ecc;
+		ecc->correct = nand_correct_data;
+		ecc->read_page = nand_read_page_swecc;
+		ecc->read_subpage = nand_read_subpage;
+		ecc->write_page = nand_write_page_swecc;
+		ecc->read_page_raw = nand_read_page_raw;
+		ecc->write_page_raw = nand_write_page_raw;
+		ecc->read_oob = nand_read_oob_std;
+		ecc->write_oob = nand_write_oob_std;
+		if (!ecc->size)
+			ecc->size = 256;
+		ecc->bytes = 3;
+		ecc->strength = 1;
 		break;
 
 	case NAND_ECC_SOFT_BCH:
@@ -3681,87 +3680,83 @@ int nand_scan_tail(struct mtd_info *mtd)
 			pr_warn("CONFIG_MTD_ECC_BCH not enabled\n");
 			BUG();
 		}
-		chip->ecc.calculate = nand_bch_calculate_ecc;
-		chip->ecc.correct = nand_bch_correct_data;
-		chip->ecc.read_page = nand_read_page_swecc;
-		chip->ecc.read_subpage = nand_read_subpage;
-		chip->ecc.write_page = nand_write_page_swecc;
-		chip->ecc.read_page_raw = nand_read_page_raw;
-		chip->ecc.write_page_raw = nand_write_page_raw;
-		chip->ecc.read_oob = nand_read_oob_std;
-		chip->ecc.write_oob = nand_write_oob_std;
+		ecc->calculate = nand_bch_calculate_ecc;
+		ecc->correct = nand_bch_correct_data;
+		ecc->read_page = nand_read_page_swecc;
+		ecc->read_subpage = nand_read_subpage;
+		ecc->write_page = nand_write_page_swecc;
+		ecc->read_page_raw = nand_read_page_raw;
+		ecc->write_page_raw = nand_write_page_raw;
+		ecc->read_oob = nand_read_oob_std;
+		ecc->write_oob = nand_write_oob_std;
 		/*
 		 * Board driver should supply ecc.size and ecc.bytes values to
 		 * select how many bits are correctable; see nand_bch_init()
 		 * for details. Otherwise, default to 4 bits for large page
 		 * devices.
 		 */
-		if (!chip->ecc.size && (mtd->oobsize >= 64)) {
-			chip->ecc.size = 512;
-			chip->ecc.bytes = 7;
+		if (!ecc->size && (mtd->oobsize >= 64)) {
+			ecc->size = 512;
+			ecc->bytes = 7;
 		}
-		chip->ecc.priv = nand_bch_init(mtd,
-					       chip->ecc.size,
-					       chip->ecc.bytes,
-					       &chip->ecc.layout);
-		if (!chip->ecc.priv) {
+		ecc->priv = nand_bch_init(mtd, ecc->size, ecc->bytes,
+					       &ecc->layout);
+		if (!ecc->priv) {
 			pr_warn("BCH ECC initialization failed!\n");
 			BUG();
 		}
-		chip->ecc.strength =
-			chip->ecc.bytes * 8 / fls(8 * chip->ecc.size);
+		ecc->strength = ecc->bytes * 8 / fls(8 * ecc->size);
 		break;
 
 	case NAND_ECC_NONE:
 		pr_warn("NAND_ECC_NONE selected by board driver. "
 			   "This is not recommended!\n");
-		chip->ecc.read_page = nand_read_page_raw;
-		chip->ecc.write_page = nand_write_page_raw;
-		chip->ecc.read_oob = nand_read_oob_std;
-		chip->ecc.read_page_raw = nand_read_page_raw;
-		chip->ecc.write_page_raw = nand_write_page_raw;
-		chip->ecc.write_oob = nand_write_oob_std;
-		chip->ecc.size = mtd->writesize;
-		chip->ecc.bytes = 0;
-		chip->ecc.strength = 0;
+		ecc->read_page = nand_read_page_raw;
+		ecc->write_page = nand_write_page_raw;
+		ecc->read_oob = nand_read_oob_std;
+		ecc->read_page_raw = nand_read_page_raw;
+		ecc->write_page_raw = nand_write_page_raw;
+		ecc->write_oob = nand_write_oob_std;
+		ecc->size = mtd->writesize;
+		ecc->bytes = 0;
+		ecc->strength = 0;
 		break;
 
 	default:
-		pr_warn("Invalid NAND_ECC_MODE %d\n", chip->ecc.mode);
+		pr_warn("Invalid NAND_ECC_MODE %d\n", ecc->mode);
 		BUG();
 	}
 
 	/* For many systems, the standard OOB write also works for raw */
-	if (!chip->ecc.read_oob_raw)
-		chip->ecc.read_oob_raw = chip->ecc.read_oob;
-	if (!chip->ecc.write_oob_raw)
-		chip->ecc.write_oob_raw = chip->ecc.write_oob;
+	if (!ecc->read_oob_raw)
+		ecc->read_oob_raw = ecc->read_oob;
+	if (!ecc->write_oob_raw)
+		ecc->write_oob_raw = ecc->write_oob;
 
 	/*
 	 * The number of bytes available for a client to place data into
 	 * the out of band area.
 	 */
-	chip->ecc.layout->oobavail = 0;
-	for (i = 0; chip->ecc.layout->oobfree[i].length
-			&& i < ARRAY_SIZE(chip->ecc.layout->oobfree); i++)
-		chip->ecc.layout->oobavail +=
-			chip->ecc.layout->oobfree[i].length;
-	mtd->oobavail = chip->ecc.layout->oobavail;
+	ecc->layout->oobavail = 0;
+	for (i = 0; ecc->layout->oobfree[i].length
+			&& i < ARRAY_SIZE(ecc->layout->oobfree); i++)
+		ecc->layout->oobavail += ecc->layout->oobfree[i].length;
+	mtd->oobavail = ecc->layout->oobavail;
 
 	/*
 	 * Set the number of read / write steps for one page depending on ECC
 	 * mode.
 	 */
-	chip->ecc.steps = mtd->writesize / chip->ecc.size;
-	if (chip->ecc.steps * chip->ecc.size != mtd->writesize) {
+	ecc->steps = mtd->writesize / ecc->size;
+	if (ecc->steps * ecc->size != mtd->writesize) {
 		pr_warn("Invalid ECC parameters\n");
 		BUG();
 	}
-	chip->ecc.total = chip->ecc.steps * chip->ecc.bytes;
+	ecc->total = ecc->steps * ecc->bytes;
 
 	/* Allow subpage writes up to ecc.steps. Not possible for MLC flash */
 	if (!(chip->options & NAND_NO_SUBPAGE_WRITE) && nand_is_slc(chip)) {
-		switch (chip->ecc.steps) {
+		switch (ecc->steps) {
 		case 2:
 			mtd->subpage_sft = 1;
 			break;
@@ -3781,7 +3776,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 	chip->pagebuf = -1;
 
 	/* Large page NAND with SOFT_ECC should support subpage reads */
-	if ((chip->ecc.mode == NAND_ECC_SOFT) && (chip->page_shift > 9))
+	if ((ecc->mode == NAND_ECC_SOFT) && (chip->page_shift > 9))
 		chip->options |= NAND_SUBPAGE_READ;
 
 	/* Fill in remaining MTD driver data */
@@ -3806,9 +3801,9 @@ int nand_scan_tail(struct mtd_info *mtd)
 	mtd->writebufsize = mtd->writesize;
 
 	/* propagate ecc info to mtd_info */
-	mtd->ecclayout = chip->ecc.layout;
-	mtd->ecc_strength = chip->ecc.strength;
-	mtd->ecc_step_size = chip->ecc.size;
+	mtd->ecclayout = ecc->layout;
+	mtd->ecc_strength = ecc->strength;
+	mtd->ecc_step_size = ecc->size;
 	/*
 	 * Initialize bitflip_threshold to its default prior scan_bbt() call.
 	 * scan_bbt() might invoke mtd_read(), thus bitflip_threshold must be
-- 
1.7.2.rc3
