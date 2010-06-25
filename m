Received: from mms2.broadcom.com ([216.31.210.18])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OSGap-0002LD-TR
	for linux-mtd@lists.infradead.org; Fri, 25 Jun 2010 21:37:49 +0000
From: "Brian Norris" <norris@broadcom.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2] mtd/nand, BB detect: factory marker in page 1, 2,
	last and byte 1 or 6
Date: Fri, 25 Jun 2010 14:36:31 -0700
Message-ID: <1277501791-3146-1-git-send-email-norris@broadcom.com>
In-Reply-To: <1277325362-13326-1-git-send-email-norris@broadcom.com>
References: <1277325362-13326-1-git-send-email-norris@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <norris@broadcom.com>
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
by nand_bbt.c:nand_default_bbt(). I believe there are only 5 combinations
of page location/byte offset, so I updated the nand_bbt_desc structs
accordingly.

I have tested these changes with several chips, but particularly a Micron
29F8G08MAA chip. We use a memory-based, not flash-based, BBT; hence the
edits only to the "memory_based" side of things. Most edits could be
applicable to both, but I can't verify that. For instance, I do not
understand why the small discrepancies between the "memory_based" and
"flash_based" nand_bbt_descr structs.

Finally, please provide any feedback you can. I'm sure there's something
I have overlooked, but I feel this is a step in the right direction.

Signed-off-by: Brian Norris <norris@broadcom.com>
---
 drivers/mtd/nand/nand_base.c |   23 +++++++++++++++++++----
 drivers/mtd/nand/nand_bbt.c  |   41 ++++++++++++++++++++++++++++++++++-------
 2 files changed, 53 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index e6cf9ae..2d1ee3c 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2920,9 +2920,13 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 		chip->chip_shift = ffs((unsigned)(chip->chipsize >> 32)) + 32 - 1;
 
 	/* Set the bad block position */
-	chip->badblockpos = mtd->writesize > 512 ?
-		NAND_LARGE_BADBLOCK_POS : NAND_SMALL_BADBLOCK_POS;
-	chip->badblockbits = 8;
+	chip->badblockpos = (!(busw & NAND_BUSWIDTH_16) &&
+			(*maf_id == NAND_MFR_STMICRO ||
+			 (*maf_id == NAND_MFR_SAMSUNG &&
+			  mtd->writesize == 512) ||
+			 *maf_id == NAND_MFR_AMD))
+		? NAND_SMALL_BADBLOCK_POS : NAND_LARGE_BADBLOCK_POS;
+
 
 	/* Get chip options, preserve non chip based options */
 	chip->options &= ~NAND_CHIPOPTIONS_MSK;
@@ -2941,12 +2945,23 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 
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
index 71d83be..1719c56 100644
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
@@ -1197,8 +1218,14 @@ int nand_default_bbt(struct mtd_info *mtd)
 		this->bbt_td = NULL;
 		this->bbt_md = NULL;
 		if (!this->badblock_pattern) {
-			this->badblock_pattern = (mtd->writesize > 512) ?
-			    &largepage_memorybased : &smallpage_memorybased;
+			if (this->options & NAND_BBT_SCANLASTPAGE)
+				this->badblock_pattern = &lastpage_memorybased;
+			else if (this->options & NAND_BBT_SCAN2NDPAGE)
+				this->badblock_pattern = this->badblockpos == NAND_SMALL_BADBLOCK_POS ? 
+					&smallpage_scan2nd_memorybased : &largepage_scan2nd_memorybased;
+			else
+				this->badblock_pattern = this->badblockpos == NAND_SMALL_BADBLOCK_POS ? 
+					&smallpage_memorybased : &largepage_memorybased;
 		}
 	}
 	return nand_scan_bbt(mtd, this->badblock_pattern);
-- 
1.7.1
