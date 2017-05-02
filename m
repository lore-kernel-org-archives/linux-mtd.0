Received: from mail.base45.de ([2001:67c:2050:310::a:2])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d5Vur-0002OD-4C
 for linux-mtd@lists.infradead.org; Tue, 02 May 2017 11:24:29 +0000
From: Alexander Couzens <lynxis@fe80.eu>
To: linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, Alexander Couzens <lynxis@fe80.eu>,
 Stable <stable@vger.kernel.org>
Subject: [PATCH][v3] mtd: nand: add ooblayout for old hamming layout
Date: Tue,  2 May 2017 12:19:00 +0200
Message-Id: <20170502101900.5066-1-lynxis@fe80.eu>
In-Reply-To: <20170502081323.3138-1-lynxis@fe80.eu>
References: <20170502081323.3138-1-lynxis@fe80.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The old 1-bit hamming layout requires ECC data to be placed at a
fixed offset, and not necessarily at the end of the OOB area.
Add this old layout back in order to fix legacy setups.

Fixes: 41b207a70d3a ("mtd: nand: implement the default mtd_ooblayout_ops")
CC: Stable <stable@vger.kernel.org>
Signed-off-by: Alexander Couzens <lynxis@fe80.eu>
---
 drivers/mtd/nand/nand_base.c | 70 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 69 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index b0524f8accb6..44c0faf84426 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -139,6 +139,74 @@ const struct mtd_ooblayout_ops nand_ooblayout_lp_ops = {
 };
 EXPORT_SYMBOL_GPL(nand_ooblayout_lp_ops);
 
+/*
+ * Support the old "large page" layout used for 1-bit Hamming ECC where ECC
+ * are placed at a fixed offset.
+ */
+static int nand_ooblayout_ecc_lp_hamming(struct mtd_info *mtd, int section,
+					 struct mtd_oob_region *oobregion)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_ecc_ctrl *ecc = &chip->ecc;
+
+	if (section)
+		return -ERANGE;
+
+	switch (mtd->oobsize) {
+	case 64:
+		oobregion->offset = 40;
+		break;
+	case 128:
+		oobregion->offset = 80;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	oobregion->length = ecc->total;
+	if (oobregion->offset + oobregion->length > mtd->oobsize)
+		return -ERANGE;
+
+	return 0;
+}
+
+static int nand_ooblayout_free_lp_hamming(struct mtd_info *mtd, int section,
+					  struct mtd_oob_region *oobregion)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_ecc_ctrl *ecc = &chip->ecc;
+	int ecc_offset = 0;
+
+	if (section < 0 || section > 1)
+		return -ERANGE;
+
+	switch (mtd->oobsize) {
+	case 64:
+		ecc_offset = 40;
+		break;
+	case 128:
+		ecc_offset = 80;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (section == 0) {
+		oobregion->offset = 2;
+		oobregion->length = ecc_offset - 2;
+	} else {
+		oobregion->offset = ecc_offset + ecc->total;
+		oobregion->length = mtd->oobsize - oobregion->offset;
+	}
+
+	return 0;
+}
+
+const struct mtd_ooblayout_ops nand_ooblayout_lp_hamming_ops = {
+	.ecc = nand_ooblayout_ecc_lp_hamming,
+	.free = nand_ooblayout_free_lp_hamming,
+};
+
 static int check_offs_len(struct mtd_info *mtd,
 					loff_t ofs, uint64_t len)
 {
@@ -4653,7 +4721,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 			break;
 		case 64:
 		case 128:
-			mtd_set_ooblayout(mtd, &nand_ooblayout_lp_ops);
+			mtd_set_ooblayout(mtd, &nand_ooblayout_lp_hamming_ops);
 			break;
 		default:
 			WARN(1, "No oob scheme defined for oobsize %d\n",
-- 
2.12.2
