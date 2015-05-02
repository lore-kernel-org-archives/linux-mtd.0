Received: from mail-ie0-f170.google.com ([209.85.223.170])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YoZ41-0002xR-DJ
 for linux-mtd@lists.infradead.org; Sat, 02 May 2015 15:10:45 +0000
Received: by iejt8 with SMTP id t8so105928334iej.2
 for <linux-mtd@lists.infradead.org>; Sat, 02 May 2015 08:10:19 -0700 (PDT)
From: Nicholas Krause <xerofoify@gmail.com>
To: dwmw2@infradead.org
Subject: [PATCH] mtd:Remove unnessary BUG function calls in nand_scan_tail
Date: Sat,  2 May 2015 11:10:13 -0400
Message-Id: <1430579413-4820-1-git-send-email-xerofoify@gmail.com>
Cc: boris.brezillon@free-electrons.com, baruch@tkos.co.il, kdasu.kdev@gmail.com,
 zajec5@gmail.com, bpqw@micron.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, ezequiel.garcia@free-electrons.com,
 asierra@xes-inc.com, computersforpeace@gmail.com, rogerq@ti.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This removes all unnessary calls to BUG() below pr_warn print messages
as these printed messages are verbose enough for debugging if these
scenarios are hit in the function,nand_scan_tail.

Signed-off-by: Nicholas Krause <xerofoify@gmail.com>
---
 drivers/mtd/nand/nand_base.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index c2e1232..6a5bc99 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3949,7 +3949,6 @@ int nand_scan_tail(struct mtd_info *mtd)
 		default:
 			pr_warn("No oob scheme defined for oobsize %d\n",
 				   mtd->oobsize);
-			BUG();
 		}
 	}
 
@@ -3966,7 +3965,6 @@ int nand_scan_tail(struct mtd_info *mtd)
 		/* Similar to NAND_ECC_HW, but a separate read_page handle */
 		if (!ecc->calculate || !ecc->correct || !ecc->hwctl) {
 			pr_warn("No ECC functions supplied; hardware ECC not possible\n");
-			BUG();
 		}
 		if (!ecc->read_page)
 			ecc->read_page = nand_read_page_hwecc_oob_first;
@@ -3997,7 +3995,6 @@ int nand_scan_tail(struct mtd_info *mtd)
 		     !ecc->write_page ||
 		     ecc->write_page == nand_write_page_hwecc)) {
 			pr_warn("No ECC functions supplied; hardware ECC not possible\n");
-			BUG();
 		}
 		/* Use standard syndrome read/write page function? */
 		if (!ecc->read_page)
@@ -4016,7 +4013,6 @@ int nand_scan_tail(struct mtd_info *mtd)
 		if (mtd->writesize >= ecc->size) {
 			if (!ecc->strength) {
 				pr_warn("Driver must set ecc.strength when using hardware ECC\n");
-				BUG();
 			}
 			break;
 		}
@@ -4043,7 +4039,6 @@ int nand_scan_tail(struct mtd_info *mtd)
 	case NAND_ECC_SOFT_BCH:
 		if (!mtd_nand_has_bch()) {
 			pr_warn("CONFIG_MTD_NAND_ECC_BCH not enabled\n");
-			BUG();
 		}
 		ecc->calculate = nand_bch_calculate_ecc;
 		ecc->correct = nand_bch_correct_data;
@@ -4071,7 +4066,6 @@ int nand_scan_tail(struct mtd_info *mtd)
 					       &ecc->layout);
 		if (!ecc->priv) {
 			pr_warn("BCH ECC initialization failed!\n");
-			BUG();
 		}
 		break;
 
@@ -4090,7 +4084,6 @@ int nand_scan_tail(struct mtd_info *mtd)
 
 	default:
 		pr_warn("Invalid NAND_ECC_MODE %d\n", ecc->mode);
-		BUG();
 	}
 
 	/* For many systems, the standard OOB write also works for raw */
@@ -4121,7 +4114,6 @@ int nand_scan_tail(struct mtd_info *mtd)
 	ecc->steps = mtd->writesize / ecc->size;
 	if (ecc->steps * ecc->size != mtd->writesize) {
 		pr_warn("Invalid ECC parameters\n");
-		BUG();
 	}
 	ecc->total = ecc->steps * ecc->bytes;
 
-- 
2.1.4
