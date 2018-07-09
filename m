Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fcdPt-00045K-1t
 for linux-mtd@lists.infradead.org; Mon, 09 Jul 2018 21:09:56 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 "Bean Huo (beanhuo)" <beanhuo@micron.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH 1/2] mtd: rawnand: micron: Define the proper layout for
 8bit/512bytes on-die ECC
Date: Mon,  9 Jul 2018 23:09:36 +0200
Message-Id: <20180709210937.30150-2-boris.brezillon@bootlin.com>
In-Reply-To: <20180709210937.30150-1-boris.brezillon@bootlin.com>
References: <20180709210937.30150-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The MT29F1G08ABAFAWP datasheet says that all ECC bytes are placed at the
end of the OOB area.

Fixes: 386fc2609d15 ("mtd: rawnand: micron: support 8/512 on-die ECC")
Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/nand_micron.c | 59 ++++++++++++++++++++++++++++++++------
 1 file changed, 50 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/raw/nand_micron.c
index 754e9cdd44ac..00a965ad7ab2 100644
--- a/drivers/mtd/nand/raw/nand_micron.c
+++ b/drivers/mtd/nand/raw/nand_micron.c
@@ -103,8 +103,9 @@ static int micron_nand_onfi_init(struct nand_chip *chip)
 	return 0;
 }
 
-static int micron_nand_on_die_ooblayout_ecc(struct mtd_info *mtd, int section,
-					    struct mtd_oob_region *oobregion)
+static int micron_nand_on_die_4_ooblayout_ecc(struct mtd_info *mtd,
+					      int section,
+					      struct mtd_oob_region *oobregion)
 {
 	if (section >= 4)
 		return -ERANGE;
@@ -115,8 +116,9 @@ static int micron_nand_on_die_ooblayout_ecc(struct mtd_info *mtd, int section,
 	return 0;
 }
 
-static int micron_nand_on_die_ooblayout_free(struct mtd_info *mtd, int section,
-					     struct mtd_oob_region *oobregion)
+static int micron_nand_on_die_4_ooblayout_free(struct mtd_info *mtd,
+					       int section,
+					       struct mtd_oob_region *oobregion)
 {
 	if (section >= 4)
 		return -ERANGE;
@@ -127,9 +129,44 @@ static int micron_nand_on_die_ooblayout_free(struct mtd_info *mtd, int section,
 	return 0;
 }
 
-static const struct mtd_ooblayout_ops micron_nand_on_die_ooblayout_ops = {
-	.ecc = micron_nand_on_die_ooblayout_ecc,
-	.free = micron_nand_on_die_ooblayout_free,
+static const struct mtd_ooblayout_ops micron_nand_on_die_4_ooblayout_ops = {
+	.ecc = micron_nand_on_die_4_ooblayout_ecc,
+	.free = micron_nand_on_die_4_ooblayout_free,
+};
+
+static int micron_nand_on_die_8_ooblayout_ecc(struct mtd_info *mtd,
+					      int section,
+					      struct mtd_oob_region *oobregion)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+
+	if (section)
+		return -ERANGE;
+
+	oobregion->offset = mtd->oobsize - chip->ecc.total;
+	oobregion->length = chip->ecc.total;
+
+	return 0;
+}
+
+static int micron_nand_on_die_8_ooblayout_free(struct mtd_info *mtd,
+					       int section,
+					       struct mtd_oob_region *oobregion)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+
+	if (section)
+		return -ERANGE;
+
+	oobregion->offset = 2;
+	oobregion->length = mtd->oobsize - chip->ecc.total - 2;
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops micron_nand_on_die_8_ooblayout_ops = {
+	.ecc = micron_nand_on_die_8_ooblayout_ecc,
+	.free = micron_nand_on_die_8_ooblayout_free,
 };
 
 static int micron_nand_on_die_ecc_setup(struct nand_chip *chip, bool enable)
@@ -425,6 +462,12 @@ static int micron_nand_init(struct nand_chip *chip)
 				ret = -ENOMEM;
 				goto err_free_manuf_data;
 			}
+
+			mtd_set_ooblayout(mtd,
+					  &micron_nand_on_die_4_ooblayout_ops);
+		} else {
+			mtd_set_ooblayout(mtd,
+					  &micron_nand_on_die_8_ooblayout_ops);
 		}
 
 		chip->ecc.bytes = chip->ecc_strength_ds * 2;
@@ -435,8 +478,6 @@ static int micron_nand_init(struct nand_chip *chip)
 		chip->ecc.write_page = micron_nand_write_page_on_die_ecc;
 		chip->ecc.read_page_raw = nand_read_page_raw;
 		chip->ecc.write_page_raw = nand_write_page_raw;
-
-		mtd_set_ooblayout(mtd, &micron_nand_on_die_ooblayout_ops);
 	}
 
 	return 0;
-- 
2.14.1
