Received: from mail-qg0-x22a.google.com ([2607:f8b0:400d:c04::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1am6dn-0000IB-T1
 for linux-mtd@lists.infradead.org; Fri, 01 Apr 2016 21:30:05 +0000
Received: by mail-qg0-x22a.google.com with SMTP id j35so107214869qge.0
 for <linux-mtd@lists.infradead.org>; Fri, 01 Apr 2016 14:29:43 -0700 (PDT)
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH 2/2] mtd: nand: Remove BUG() abuse in nand_scan_tail
Date: Fri,  1 Apr 2016 18:29:24 -0300
Message-Id: <1459546164-6269-3-git-send-email-ezequiel@vanguardiasur.com.ar>
In-Reply-To: <1459546164-6269-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1459546164-6269-1-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There's no reason to BUG() when parameters are being
validated. Drivers can get things wrong, and it's much nicer
to just throw a noisy warn and fail gracefully, than calling
BUG() and throwing the whole system down the drain.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 drivers/mtd/nand/nand_base.c | 52 ++++++++++++++++++++++++++++----------------
 1 file changed, 33 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index befa04ef4a04..0fe644ebe264 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -4119,10 +4119,12 @@ int nand_scan_tail(struct mtd_info *mtd)
 	struct nand_chip *chip = mtd_to_nand(mtd);
 	struct nand_ecc_ctrl *ecc = &chip->ecc;
 	struct nand_buffers *nbuf;
+	int ret;
 
 	/* New bad blocks should be marked in OOB, flash-based BBT, or both */
-	BUG_ON((chip->bbt_options & NAND_BBT_NO_OOB_BBM) &&
-			!(chip->bbt_options & NAND_BBT_USE_FLASH));
+	if (WARN_ON((chip->bbt_options & NAND_BBT_NO_OOB_BBM) &&
+		   !(chip->bbt_options & NAND_BBT_USE_FLASH)))
+		return -EINVAL;
 
 	if (!(chip->options & NAND_OWN_BUFFERS)) {
 		nbuf = kzalloc(sizeof(*nbuf) + mtd->writesize
@@ -4160,9 +4162,10 @@ int nand_scan_tail(struct mtd_info *mtd)
 			ecc->layout = &nand_oob_128;
 			break;
 		default:
-			pr_warn("No oob scheme defined for oobsize %d\n",
-				   mtd->oobsize);
-			BUG();
+			WARN(1, "No oob scheme defined for oobsize %d\n",
+				mtd->oobsize);
+			ret = -EINVAL;
+			goto err_free;
 		}
 	}
 
@@ -4178,8 +4181,9 @@ int nand_scan_tail(struct mtd_info *mtd)
 	case NAND_ECC_HW_OOB_FIRST:
 		/* Similar to NAND_ECC_HW, but a separate read_page handle */
 		if (!ecc->calculate || !ecc->correct || !ecc->hwctl) {
-			pr_warn("No ECC functions supplied; hardware ECC not possible\n");
-			BUG();
+			WARN(1, "No ECC functions supplied; hardware ECC not possible\n");
+			ret = -EINVAL;
+			goto err_free;
 		}
 		if (!ecc->read_page)
 			ecc->read_page = nand_read_page_hwecc_oob_first;
@@ -4209,8 +4213,9 @@ int nand_scan_tail(struct mtd_info *mtd)
 		     ecc->read_page == nand_read_page_hwecc ||
 		     !ecc->write_page ||
 		     ecc->write_page == nand_write_page_hwecc)) {
-			pr_warn("No ECC functions supplied; hardware ECC not possible\n");
-			BUG();
+			WARN(1, "No ECC functions supplied; hardware ECC not possible\n");
+			ret = -EINVAL;
+			goto err_free;
 		}
 		/* Use standard syndrome read/write page function? */
 		if (!ecc->read_page)
@@ -4228,8 +4233,9 @@ int nand_scan_tail(struct mtd_info *mtd)
 
 		if (mtd->writesize >= ecc->size) {
 			if (!ecc->strength) {
-				pr_warn("Driver must set ecc.strength when using hardware ECC\n");
-				BUG();
+				WARN(1, "Driver must set ecc.strength when using hardware ECC\n");
+				ret = -EINVAL;
+				goto err_free;
 			}
 			break;
 		}
@@ -4255,8 +4261,9 @@ int nand_scan_tail(struct mtd_info *mtd)
 
 	case NAND_ECC_SOFT_BCH:
 		if (!mtd_nand_has_bch()) {
-			pr_warn("CONFIG_MTD_NAND_ECC_BCH not enabled\n");
-			BUG();
+			WARN(1, "CONFIG_MTD_NAND_ECC_BCH not enabled\n");
+			ret = -EINVAL;
+			goto err_free;
 		}
 		ecc->calculate = nand_bch_calculate_ecc;
 		ecc->correct = nand_bch_correct_data;
@@ -4281,8 +4288,9 @@ int nand_scan_tail(struct mtd_info *mtd)
 		ecc->bytes = 0;
 		ecc->priv = nand_bch_init(mtd);
 		if (!ecc->priv) {
-			pr_warn("BCH ECC initialization failed!\n");
-			BUG();
+			WARN(1, "BCH ECC initialization failed!\n");
+			ret = -EINVAL;
+			goto err_free;
 		}
 		break;
 
@@ -4300,8 +4308,9 @@ int nand_scan_tail(struct mtd_info *mtd)
 		break;
 
 	default:
-		pr_warn("Invalid NAND_ECC_MODE %d\n", ecc->mode);
-		BUG();
+		WARN(1, "Invalid NAND_ECC_MODE %d\n", ecc->mode);
+		ret = -EINVAL;
+		goto err_free;
 	}
 
 	/* For many systems, the standard OOB write also works for raw */
@@ -4331,8 +4340,9 @@ int nand_scan_tail(struct mtd_info *mtd)
 	 */
 	ecc->steps = mtd->writesize / ecc->size;
 	if (ecc->steps * ecc->size != mtd->writesize) {
-		pr_warn("Invalid ECC parameters\n");
-		BUG();
+		WARN(1, "Invalid ECC parameters\n");
+		ret = -EINVAL;
+		goto err_free;
 	}
 	ecc->total = ecc->steps * ecc->bytes;
 
@@ -4410,6 +4420,10 @@ int nand_scan_tail(struct mtd_info *mtd)
 
 	/* Build bad block table */
 	return chip->scan_bbt(mtd);
+err_free:
+	if (!(chip->options & NAND_OWN_BUFFERS))
+		kfree(chip->buffers);
+	return ret;
 }
 EXPORT_SYMBOL(nand_scan_tail);
 
-- 
2.7.0
