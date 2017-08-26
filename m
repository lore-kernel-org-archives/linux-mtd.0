Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dlcss-0000g0-C3
 for linux-mtd@lists.infradead.org; Sat, 26 Aug 2017 15:20:28 +0000
From: Miquel Raynal <miquel.raynal@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-kernel@vger.kernel.org,
 Miquel Raynal <miquel.raynal@free-electrons.com>
Subject: [PATCH v5] mtd: nand: Use standard large page OOB layout when using
 NAND_ECC_NONE
Date: Sat, 26 Aug 2017 17:19:15 +0200
Message-Id: <20170826151915.28400-1-miquel.raynal@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use the core's large page OOB layout functions when not reserving any
space for ECC bytes in the OOB layout. Fix ->nand_ooblayout_ecc_lp()
to return -ERANGE instead of a zero length in this case.

Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
---
 drivers/mtd/nand/nand_base.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index c5221795a1e8..39894c3f0fd5 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -115,7 +115,7 @@ static int nand_ooblayout_ecc_lp(struct mtd_info *mtd, int section,
 	struct nand_chip *chip = mtd_to_nand(mtd);
 	struct nand_ecc_ctrl *ecc = &chip->ecc;
 
-	if (section)
+	if (section || !ecc->total)
 		return -ERANGE;
 
 	oobregion->length = ecc->total;
@@ -4649,6 +4649,19 @@ int nand_scan_tail(struct mtd_info *mtd)
 			mtd_set_ooblayout(mtd, &nand_ooblayout_lp_hamming_ops);
 			break;
 		default:
+			/*
+			 * Expose the whole OOB area to users if ECC_NONE
+			 * is passed. We could do that for all kind of
+			 * ->oobsize, but we must keep the old large/small
+			 * page with ECC layout when ->oobsize <= 128 for
+			 * compatibility reasons.
+			 */
+			if (ecc->mode == NAND_ECC_NONE) {
+				mtd_set_ooblayout(mtd,
+						&nand_ooblayout_lp_ops);
+				break;
+			}
+
 			WARN(1, "No oob scheme defined for oobsize %d\n",
 				mtd->oobsize);
 			ret = -EINVAL;
-- 
2.11.0
