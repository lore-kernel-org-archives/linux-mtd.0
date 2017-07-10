Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dUW4u-0000NT-GE
 for linux-mtd@lists.infradead.org; Mon, 10 Jul 2017 10:38:10 +0000
From: Miquel Raynal <miquel.raynal@free-electrons.com>
To: 
Cc: Miquel Raynal <miquel.raynal@free-electrons.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org (open list:NAND FLASH SUBSYSTEM),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] mtd: nand: fix lack of oob layout when using no ecc
Date: Mon, 10 Jul 2017 12:37:26 +0200
Message-Id: <20170710103726.31858-1-miquel.raynal@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix nand core lack of OOB layout when:
- the NFC driver does not provide any OOB layout,
- ECC operations are disabled (using NAND_ECC_NONE).
Using this configuration leads to a crash during the probe.

Add layout functions for small and large pages with mainly free bytes
plus reserved space for bad block markers.

Check the configuration and eventually assign this OOB layout in
nand_scan_tail().

Bad block markers position was extracted from the existing OOB layouts
by assigning as free all the bytes marked as ECC.

Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
---
 drivers/mtd/nand/nand_base.c | 75 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 74 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index c5221795a1e8..28ff58e4385f 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -53,7 +53,45 @@ static int nand_get_device(struct mtd_info *mtd, int new_state);
 static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
 			     struct mtd_oob_ops *ops);
 
-/* Define default oob placement schemes for large and small page devices */
+/*
+ * Define default OOB placement schemes for:
+ *   - no ECC or software ECC
+ *   - small or large page devices
+ */
+static int nand_ooblayout_ecc_sp_bbm_only(struct mtd_info *mtd, int section,
+					  struct mtd_oob_region *oobregion)
+{
+	return -ERANGE;
+}
+
+static int nand_ooblayout_free_sp_bbm_only(struct mtd_info *mtd, int section,
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
+const struct mtd_ooblayout_ops nand_ooblayout_sp_bbm_only_ops = {
+	.ecc = nand_ooblayout_ecc_sp_bbm_only,
+	.free = nand_ooblayout_free_sp_bbm_only,
+};
+EXPORT_SYMBOL_GPL(nand_ooblayout_sp_bbm_only_ops);
+
 static int nand_ooblayout_ecc_sp(struct mtd_info *mtd, int section,
 				 struct mtd_oob_region *oobregion)
 {
@@ -109,6 +147,30 @@ const struct mtd_ooblayout_ops nand_ooblayout_sp_ops = {
 };
 EXPORT_SYMBOL_GPL(nand_ooblayout_sp_ops);
 
+static int nand_ooblayout_ecc_lp_bbm_only(struct mtd_info *mtd, int section,
+					  struct mtd_oob_region *oobregion)
+{
+	return -ERANGE;
+}
+
+static int nand_ooblayout_free_lp_bbm_only(struct mtd_info *mtd, int section,
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
+const struct mtd_ooblayout_ops nand_ooblayout_lp_bbm_only_ops = {
+	.ecc = nand_ooblayout_ecc_lp_bbm_only,
+	.free = nand_ooblayout_free_lp_bbm_only,
+};
+EXPORT_SYMBOL_GPL(nand_ooblayout_lp_bbm_only_ops);
+
 static int nand_ooblayout_ecc_lp(struct mtd_info *mtd, int section,
 				 struct mtd_oob_region *oobregion)
 {
@@ -4635,6 +4697,17 @@ int nand_scan_tail(struct mtd_info *mtd)
 	chip->oob_poi = chip->buffers->databuf + mtd->writesize;
 
 	/*
+	 * When using ECC_NONE, ooblayout must only reserve space for bad block
+	 * markers.
+	 */
+	if (!mtd->ooblayout && ecc->mode == NAND_ECC_NONE) {
+		if (mtd->writesize <= 512)
+			mtd_set_ooblayout(mtd, &nand_ooblayout_sp_bbm_only_ops);
+		else
+			mtd_set_ooblayout(mtd, &nand_ooblayout_lp_bbm_only_ops);
+	}
+
+	/*
 	 * If no default placement scheme is given, select an appropriate one.
 	 */
 	if (!mtd->ooblayout &&
-- 
2.11.0
