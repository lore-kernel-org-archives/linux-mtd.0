From: malat@debian.org (Mathieu Malaterre)
Date: Wed, 16 Jan 2019 20:50:04 +0100
Subject: [PATCH 2/2] mtd: Annotate implicit fall through in nand_scan_tail
In-Reply-To: <20190116195004.2499-1-malat@debian.org>
References: <20190116195004.2499-1-malat@debian.org>
Message-ID: <20190116195004.2499-2-malat@debian.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

There is a plan to build the kernel with -Wimplicit-fallthrough and
these places in the code produced warnings (W=1).

This commit removes the following warnings:

  drivers/mtd/nand/raw/nand_base.c:5556:6: warning: this statement may fall through [-Wimplicit-fallthrough=]
  drivers/mtd/nand/raw/nand_base.c:5575:6: warning: this statement may fall through [-Wimplicit-fallthrough=]
  drivers/mtd/nand/raw/nand_base.c:5613:13: warning: this statement may fall through [-Wimplicit-fallthrough=]

Signed-off-by: Mathieu Malaterre <malat@debian.org>
---
 drivers/mtd/nand/raw/nand_base.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index cca4b24d2ffa..da344c276088 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5555,6 +5555,7 @@ static int nand_scan_tail(struct nand_chip *chip)
 		}
 		if (!ecc->read_page)
 			ecc->read_page = nand_read_page_hwecc_oob_first;
+		/* fall through */
 
 	case NAND_ECC_HW:
 		/* Use standard hwecc read page function? */
@@ -5574,6 +5575,7 @@ static int nand_scan_tail(struct nand_chip *chip)
 			ecc->read_subpage = nand_read_subpage;
 		if (!ecc->write_subpage && ecc->hwctl && ecc->calculate)
 			ecc->write_subpage = nand_write_subpage_hwecc;
+		/* fall through */
 
 	case NAND_ECC_HW_SYNDROME:
 		if ((!ecc->calculate || !ecc->correct || !ecc->hwctl) &&
@@ -5611,6 +5613,7 @@ static int nand_scan_tail(struct nand_chip *chip)
 			ecc->size, mtd->writesize);
 		ecc->mode = NAND_ECC_SOFT;
 		ecc->algo = NAND_ECC_HAMMING;
+		/* fall through */
 
 	case NAND_ECC_SOFT:
 		ret = nand_set_ecc_soft_ops(chip);
-- 
2.19.2
