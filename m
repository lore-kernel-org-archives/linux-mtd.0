Received: from mms1.broadcom.com ([216.31.210.17])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OYnlw-0005qL-U2
	for linux-mtd@lists.infradead.org; Tue, 13 Jul 2010 22:16:18 +0000
From: "Brian Norris" <norris@broadcom.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 1/2] mtd/nand, BB detect: factory marker in page 1,
	2, last and byte 1 or 6
Date: Tue, 13 Jul 2010 15:13:00 -0700
Message-ID: <1279059181-29300-2-git-send-email-norris@broadcom.com>
In-Reply-To: <1279059181-29300-1-git-send-email-norris@broadcom.com>
References: <1279059181-29300-1-git-send-email-norris@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Maxim Levitsky <maximlevitsky@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <David.Woodhouse@intel.com>,
	Brian Norris <norris@broadcom.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some level of support for various scanning locations was already built in,
but this required clean-up. First, BB marker location cannot be determined
_only_ by the page size. Instead, I implemented some heuristic detection
based on data sheets from various manufacturers (all found in
nand_base.c:nand_get_flash_type()).

Second, once these options were identified, they were not handled properly
by nand_bbt.c:nand_default_bbt(). I updated the static nand_bbt_desc structs
to reflect the need for more combinations of detection. The memory allocation
here probably needs to be done dynamically in the very near future (see next
patches).

Signed-off-by: Brian Norris <norris@broadcom.com>
---
 drivers/mtd/nand/nand_base.c |   24 ++++++++++++++++++---
 drivers/mtd/nand/nand_bbt.c  |   45 +++++++++++++++++++++++++++++++++++------
 2 files changed, 58 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index e6cf9ae..bd69790 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2920,9 +2920,14 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 		chip->chip_shift = ffs((unsigned)(chip->chipsize >> 32)) + 32 - 1;
 
 	/* Set the bad block position */
-	chip->badblockpos = mtd->writesize > 512 ?
-		NAND_LARGE_BADBLOCK_POS : NAND_SMALL_BADBLOCK_POS;
-	chip->badblockbits = 8;
+	if (!(busw & NAND_BUSWIDTH_16) && (*maf_id == NAND_MFR_STMICRO ||
+				(*maf_id == NAND_MFR_SAMSUNG &&
+				 mtd->writesize == 512) ||
+				*maf_id == NAND_MFR_AMD))
+		chip->badblockpos = NAND_SMALL_BADBLOCK_POS;
+	else
+		chip->badblockpos = NAND_LARGE_BADBLOCK_POS;
+
 
 	/* Get chip options, preserve non chip based options */
 	chip->options &= ~NAND_CHIPOPTIONS_MSK;
@@ -2941,12 +2946,23 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 
 	/*
 	 * Bad block marker is stored in the last page of each block
-	 * on Samsung and Hynix MLC devices
+	 * on Samsung and Hynix MLC devices; stored in first two pages
+	 * of each block on Micron devices with 2KiB pages and on
+	 * SLC Samsung, Hynix, and AMD/Spansion. All others scan only
+	 * the first page.
 	 */
 	if ((chip->cellinfo & NAND_CI_CELLTYPE_MSK) &&
 			(*maf_id == NAND_MFR_SAMSUNG ||
 			 *maf_id == NAND_MFR_HYNIX))
 		chip->options |= NAND_BBT_SCANLASTPAGE;
+	else if ((!(chip->cellinfo & NAND_CI_CELLTYPE_MSK) &&
+				(*maf_id == NAND_MFR_SAMSUNG ||
+				 *maf_id == NAND_MFR_HYNIX ||
+				 *maf_id == NAND_MFR_AMD)) ||
+			(mtd->writesize == 2048 &&
+			 *maf_id == NAND_MFR_MICRON))
+		chip->options |= NAND_BBT_SCAN2NDPAGE;
+
 
 	/* Check for AND chips with 4 page planes */
 	if (chip->options & NAND_4PAGE_ARRAY)
diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 71d83be..ec1700e 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -1093,29 +1093,50 @@ int nand_update_bbt(struct mtd_info *mtd, loff_t offs)
 static uint8_t scan_ff_pattern[] = { 0xff, 0xff };
 
 static struct nand_bbt_descr smallpage_memorybased = {
-	.options = NAND_BBT_SCAN2NDPAGE,
-	.offs = 5,
+	.options = 0,
+	.offs = NAND_SMALL_BADBLOCK_POS,
 	.len = 1,
 	.pattern = scan_ff_pattern
 };
 
+static struct nand_bbt_descr smallpage_scan2nd_memorybased = {
+	.options = NAND_BBT_SCAN2NDPAGE,
+	.offs = NAND_SMALL_BADBLOCK_POS,
+	.len = 2,
+	.pattern = scan_ff_pattern
+};
+
 static struct nand_bbt_descr largepage_memorybased = {
 	.options = 0,
-	.offs = 0,
+	.offs = NAND_LARGE_BADBLOCK_POS,
+	.len = 1,
+	.pattern = scan_ff_pattern
+};
+
+static struct nand_bbt_descr largepage_scan2nd_memorybased = {
+	.options = NAND_BBT_SCAN2NDPAGE,
+	.offs = NAND_LARGE_BADBLOCK_POS,
 	.len = 2,
 	.pattern = scan_ff_pattern
 };
 
+static struct nand_bbt_descr lastpage_memorybased = {
+	.options = NAND_BBT_SCANLASTPAGE,
+	.offs = 0,
+	.len = 1,
+	.pattern = scan_ff_pattern
+};
+
 static struct nand_bbt_descr smallpage_flashbased = {
 	.options = NAND_BBT_SCAN2NDPAGE,
-	.offs = 5,
+	.offs = NAND_SMALL_BADBLOCK_POS,
 	.len = 1,
 	.pattern = scan_ff_pattern
 };
 
 static struct nand_bbt_descr largepage_flashbased = {
 	.options = NAND_BBT_SCAN2NDPAGE,
-	.offs = 0,
+	.offs = NAND_LARGE_BADBLOCK_POS,
 	.len = 2,
 	.pattern = scan_ff_pattern
 };
@@ -1197,8 +1218,18 @@ int nand_default_bbt(struct mtd_info *mtd)
 		this->bbt_td = NULL;
 		this->bbt_md = NULL;
 		if (!this->badblock_pattern) {
-			this->badblock_pattern = (mtd->writesize > 512) ?
-			    &largepage_memorybased : &smallpage_memorybased;
+			if (this->options & NAND_BBT_SCANLASTPAGE)
+				this->badblock_pattern = &lastpage_memorybased;
+			else if (this->options & NAND_BBT_SCAN2NDPAGE)
+				this->badblock_pattern = this->badblockpos ==
+					NAND_SMALL_BADBLOCK_POS ?
+					&smallpage_scan2nd_memorybased :
+					&largepage_scan2nd_memorybased;
+			else
+				this->badblock_pattern = this->badblockpos ==
+					NAND_SMALL_BADBLOCK_POS ?
+					&smallpage_memorybased :
+					&largepage_memorybased;
 		}
 	}
 	return nand_scan_bbt(mtd, this->badblock_pattern);
-- 
1.7.0.4
