Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dhsvm-00033b-Es
 for linux-mtd@lists.infradead.org; Wed, 16 Aug 2017 07:40:01 +0000
From: Miquel Raynal <miquel.raynal@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-kernel@vger.kernel.org,
 Miquel Raynal <miquel.raynal@free-electrons.com>
Subject: [PATCH v3] MTD: NAND: add OOB layout without ECC bytes
Date: Wed, 16 Aug 2017 09:39:06 +0200
Message-Id: <20170816073906.5819-1-miquel.raynal@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add layout functions for small and large pages with mainly free bytes
plus reserved space for Bad Block Markers. This may be useful for
specific chip that use on-die ECC feature, ie. the TOSHIBA BENAND
(Built-in ECC NAND). The ECC bytes are stored in an isolated area
inaccessible by the driver and thus the OOB layout must only reserve
space for Bad Block Markers.

Bad Block Markers position was extracted from the existing OOB layouts
by assigning as free all the bytes marked as ECC.

The layout functions added by this patch were supposed to be used with
ECC_NONE mode but it would break existing drivers that do not rely on
an implementation of this layout by the core, so set it as a fallthrough
when no other layout matches.

Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
---
 drivers/mtd/nand/nand_base.c | 65 ++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 60 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index c5221795a1e8..7c0ae674e50a 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -53,7 +53,38 @@ static int nand_get_device(struct mtd_info *mtd, int new_state);
 static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
 			     struct mtd_oob_ops *ops);
 
-/* Define default oob placement schemes for large and small page devices */
+/*
+ * Define default OOB placement schemes for:
+ *   - no ECC or software ECC
+ *   - small or large page devices
+ */
+static int nand_ooblayout_free_sp_no_ecc(struct mtd_info *mtd, int section,
+					   struct mtd_oob_region *oobregion)
+{
+	if (section > 1)
+		return -ERANGE;
+
+	if (!section) {
+		if (mtd->oobsize == 16) {
+			oobregion->offset = 0;
+			oobregion->length = 4;
+		} else {
+			oobregion->offset = 0;
+			oobregion->length = 5;
+		}
+	} else {
+		oobregion->offset = 6;
+		oobregion->length = mtd->oobsize - oobregion->offset;
+	}
+
+	return 0;
+}
+
+const struct mtd_ooblayout_ops nand_ooblayout_sp_no_ecc_ops = {
+	.free = nand_ooblayout_free_sp_no_ecc,
+};
+EXPORT_SYMBOL_GPL(nand_ooblayout_sp_no_ecc_ops);
+
 static int nand_ooblayout_ecc_sp(struct mtd_info *mtd, int section,
 				 struct mtd_oob_region *oobregion)
 {
@@ -109,6 +140,23 @@ const struct mtd_ooblayout_ops nand_ooblayout_sp_ops = {
 };
 EXPORT_SYMBOL_GPL(nand_ooblayout_sp_ops);
 
+static int nand_ooblayout_free_lp_no_ecc(struct mtd_info *mtd, int section,
+					   struct mtd_oob_region *oobregion)
+{
+	if (section)
+		return -ERANGE;
+
+	oobregion->offset = 2;
+	oobregion->length = mtd->oobsize - oobregion->offset;
+
+	return 0;
+}
+
+const struct mtd_ooblayout_ops nand_ooblayout_lp_no_ecc_ops = {
+	.free = nand_ooblayout_free_lp_no_ecc,
+};
+EXPORT_SYMBOL_GPL(nand_ooblayout_lp_no_ecc_ops);
+
 static int nand_ooblayout_ecc_lp(struct mtd_info *mtd, int section,
 				 struct mtd_oob_region *oobregion)
 {
@@ -4649,10 +4697,17 @@ int nand_scan_tail(struct mtd_info *mtd)
 			mtd_set_ooblayout(mtd, &nand_ooblayout_lp_hamming_ops);
 			break;
 		default:
-			WARN(1, "No oob scheme defined for oobsize %d\n",
-				mtd->oobsize);
-			ret = -EINVAL;
-			goto err_free;
+			/*
+			 * In the case of on-die ECC (when ECC are stored in an
+			 * isolated area inaccessible by the driver), the OOB
+			 * layout must only reserve space for Bad Block Markers.
+			 */
+			if (mtd->writesize <= 512)
+				mtd_set_ooblayout(mtd,
+						&nand_ooblayout_sp_no_ecc_ops);
+			else
+				mtd_set_ooblayout(mtd,
+						&nand_ooblayout_lp_no_ecc_ops);
 		}
 	}
 
-- 
2.11.0
