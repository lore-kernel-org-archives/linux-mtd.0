Received: from mail-pa0-f49.google.com ([209.85.220.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TGM1V-000690-NH
 for linux-mtd@lists.infradead.org; Tue, 25 Sep 2012 03:41:26 +0000
Received: by mail-pa0-f49.google.com with SMTP id bi5so1915646pad.36
 for <linux-mtd@lists.infradead.org>; Mon, 24 Sep 2012 20:41:25 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 3/9] mtd: nand: split BB marker options decoding into its own
 function
Date: Mon, 24 Sep 2012 20:40:49 -0700
Message-Id: <1348544455-17656-4-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1348544455-17656-1-git-send-email-computersforpeace@gmail.com>
References: <1348544455-17656-1-git-send-email-computersforpeace@gmail.com>
Cc: Angus Clark <angus.clark@st.com>, Mike Dunn <mikedunn@newsguy.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Huang Shijie <b32955@freescale.com>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When detecting NAND parameters, the code gets a little ugly so that the
logic is obscured. Try to remedy that by moving code to separate functions
that have well-defined purposes.

This patch splits the bad block marker options detection into its own function,
away from the other parameters (e.g., chip size, page size, etc.).

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_base.c | 66 ++++++++++++++++++++++++++------------------
 1 file changed, 39 insertions(+), 27 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index f725247..c7fc330 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2862,6 +2862,43 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
 }
 
 /*
+ * Set the bad block marker/indicator (BBM/BBI) patterns according to some
+ * heuristic patterns using various detected parameters (e.g., manufacturer,
+ * page size, cell-type information).
+ */
+static void nand_decode_bbm_options(struct mtd_info *mtd,
+				    struct nand_chip *chip, u8 id_data[8])
+{
+	int maf_id = id_data[0];
+
+	/* Set the bad block position */
+	if (mtd->writesize > 512 || (chip->options & NAND_BUSWIDTH_16))
+		chip->badblockpos = NAND_LARGE_BADBLOCK_POS;
+	else
+		chip->badblockpos = NAND_SMALL_BADBLOCK_POS;
+
+	/*
+	 * Bad block marker is stored in the last page of each block on Samsung
+	 * and Hynix MLC devices; stored in first two pages of each block on
+	 * Micron devices with 2KiB pages and on SLC Samsung, Hynix, Toshiba,
+	 * AMD/Spansion, and Macronix.  All others scan only the first page.
+	 */
+	if ((chip->cellinfo & NAND_CI_CELLTYPE_MSK) &&
+			(maf_id == NAND_MFR_SAMSUNG ||
+			 maf_id == NAND_MFR_HYNIX))
+		chip->bbt_options |= NAND_BBT_SCANLASTPAGE;
+	else if ((!(chip->cellinfo & NAND_CI_CELLTYPE_MSK) &&
+				(maf_id == NAND_MFR_SAMSUNG ||
+				 maf_id == NAND_MFR_HYNIX ||
+				 maf_id == NAND_MFR_TOSHIBA ||
+				 maf_id == NAND_MFR_AMD ||
+				 maf_id == NAND_MFR_MACRONIX)) ||
+			(mtd->writesize == 2048 &&
+			 maf_id == NAND_MFR_MICRON))
+		chip->bbt_options |= NAND_BBT_SCAN2NDPAGE;
+}
+
+/*
  * Get the flash and manufacturer id and lookup if the type is supported.
  */
 static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
@@ -3043,6 +3080,8 @@ ident_done:
 		return ERR_PTR(-EINVAL);
 	}
 
+	nand_decode_bbm_options(mtd, chip, id_data);
+
 	/* Calculate the address shift from the page size */
 	chip->page_shift = ffs(mtd->writesize) - 1;
 	/* Convert chipsize to number of pages per chip -1 */
@@ -3059,33 +3098,6 @@ ident_done:
 
 	chip->badblockbits = 8;
 
-	/* Set the bad block position */
-	if (mtd->writesize > 512 || (busw & NAND_BUSWIDTH_16))
-		chip->badblockpos = NAND_LARGE_BADBLOCK_POS;
-	else
-		chip->badblockpos = NAND_SMALL_BADBLOCK_POS;
-
-	/*
-	 * Bad block marker is stored in the last page of each block
-	 * on Samsung and Hynix MLC devices; stored in first two pages
-	 * of each block on Micron devices with 2KiB pages and on
-	 * SLC Samsung, Hynix, Toshiba, AMD/Spansion, and Macronix.
-	 * All others scan only the first page.
-	 */
-	if ((chip->cellinfo & NAND_CI_CELLTYPE_MSK) &&
-			(*maf_id == NAND_MFR_SAMSUNG ||
-			 *maf_id == NAND_MFR_HYNIX))
-		chip->bbt_options |= NAND_BBT_SCANLASTPAGE;
-	else if ((!(chip->cellinfo & NAND_CI_CELLTYPE_MSK) &&
-				(*maf_id == NAND_MFR_SAMSUNG ||
-				 *maf_id == NAND_MFR_HYNIX ||
-				 *maf_id == NAND_MFR_TOSHIBA ||
-				 *maf_id == NAND_MFR_AMD ||
-				 *maf_id == NAND_MFR_MACRONIX)) ||
-			(mtd->writesize == 2048 &&
-			 *maf_id == NAND_MFR_MICRON))
-		chip->bbt_options |= NAND_BBT_SCAN2NDPAGE;
-
 	/* Check for AND chips with 4 page planes */
 	if (chip->options & NAND_4PAGE_ARRAY)
 		chip->erase_cmd = multi_erase_cmd;
-- 
1.7.11.3
