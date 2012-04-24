Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SMlGR-00058U-Ex
 for linux-mtd@lists.infradead.org; Tue, 24 Apr 2012 19:19:04 +0000
From: Mike Dunn <mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 6/7] mtd: nand: sanity checks of ecc strength in
 nand_scan_tail()
Date: Tue, 24 Apr 2012 12:18:24 -0700
Message-Id: <1335295105-7981-7-git-send-email-mikedunn@newsguy.com>
In-Reply-To: <1335295105-7981-1-git-send-email-mikedunn@newsguy.com>
References: <1335295105-7981-1-git-send-email-mikedunn@newsguy.com>
Cc: Mike Dunn <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds sanity checks that ensure that drivers for controllers with
hardware ECC set the 'strength' element in struct nand_ecc_ctrl.  Also stylistic
changes to the line that calculates strength for software ECC.  Both suggested
during discussion [1].

[1] http://lists.infradead.org/pipermail/linux-mtd/2012-March/040467.html

Signed-off-by: Mike Dunn <mikedunn@newsguy.com>
---
 drivers/mtd/nand/nand_base.c |   28 ++++++++++++++++++++++------
 1 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 3137abd..275c43f 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3302,10 +3302,21 @@ int nand_scan_tail(struct mtd_info *mtd)
 				   "hardware ECC not possible\n");
 			BUG();
 		}
+
+		if (!chip->ecc.strength) {
+			pr_warn("Driver must set ecc.strength when using hardware ECC\n");
+			BUG();
+		}
+
 		if (!chip->ecc.read_page)
 			chip->ecc.read_page = nand_read_page_hwecc_oob_first;
 
 	case NAND_ECC_HW:
+		if (!chip->ecc.strength) {
+			pr_warn("Driver must set ecc.strength when using hardware ECC\n");
+			BUG();
+		}
+
 		/* Use standard hwecc read page function? */
 		if (!chip->ecc.read_page)
 			chip->ecc.read_page = nand_read_page_hwecc;
@@ -3345,12 +3356,17 @@ int nand_scan_tail(struct mtd_info *mtd)
 		if (!chip->ecc.write_oob)
 			chip->ecc.write_oob = nand_write_oob_syndrome;
 
-		if (mtd->writesize >= chip->ecc.size)
-			break;
-		pr_warn("%d byte HW ECC not possible on "
-			   "%d byte page size, fallback to SW ECC\n",
-			   chip->ecc.size, mtd->writesize);
+		if (mtd->writesize >= chip->ecc.size) {
+			if (!chip->ecc.strength) {
+				pr_warn("Driver must set ecc.strength when using hardware ECC\n");
+				BUG();
+			}
+			break;	/* all's well */
+		}
+		pr_warn("%d byte HW ECC not possible on %d byte page size, fallback to SW ECC\n",
+			chip->ecc.size, mtd->writesize);
 		chip->ecc.mode = NAND_ECC_SOFT;
+		/* fall through */
 
 	case NAND_ECC_SOFT:
 		chip->ecc.calculate = nand_calculate_ecc;
@@ -3401,7 +3417,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 			BUG();
 		}
 		chip->ecc.strength =
-			chip->ecc.bytes*8 / fls(8*chip->ecc.size);
+			chip->ecc.bytes * 8 / fls(8 * chip->ecc.size);
 		break;
 
 	case NAND_ECC_NONE:
-- 
1.7.3.4
