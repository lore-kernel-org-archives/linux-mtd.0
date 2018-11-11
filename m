Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLkbB-0000UG-Rf
 for linux-mtd@lists.infradead.org; Sun, 11 Nov 2018 07:56:03 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Han Xu <han.xu@nxp.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Xiaolei Li <xiaolei.li@mediatek.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Marc Gonzalez <marc.w.gonzalez@free.fr>, Stefan Agner <stefan@agner.ch>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH v3 16/22] mtd: rawnand: marvell: Stop implementing
 ->select_chip()
Date: Sun, 11 Nov 2018 08:55:18 +0100
Message-Id: <20181111075524.13123-17-boris.brezillon@bootlin.com>
In-Reply-To: <20181111075524.13123-1-boris.brezillon@bootlin.com>
References: <20181111075524.13123-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Now that the CS to be selected is kept in chip->cur_cs and passed
in nand_operation->cs, we can get rid of the ->select_chip()
implementation and replace it by an internal function which is called
from the chip->exec_op() and chip->ecc.read/write_xxx() hooks.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
Changes in v3:
- None

Changes in v2:
- None
---
 drivers/mtd/nand/raw/marvell_nand.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 650f2b490a05..ba7a45fb1905 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -704,7 +704,8 @@ static int marvell_nfc_wait_op(struct nand_chip *chip, unsigned int timeout_ms)
 	return 0;
 }
 
-static void marvell_nfc_select_chip(struct nand_chip *chip, int die_nr)
+static void marvell_nfc_select_target(struct nand_chip *chip,
+				      unsigned int die_nr)
 {
 	struct marvell_nand_chip *marvell_nand = to_marvell_nand(chip);
 	struct marvell_nfc *nfc = to_marvell_nfc(chip->controller);
@@ -713,12 +714,6 @@ static void marvell_nfc_select_chip(struct nand_chip *chip, int die_nr)
 	if (chip == nfc->selected_chip && die_nr == marvell_nand->selected_die)
 		return;
 
-	if (die_nr < 0 || die_nr >= marvell_nand->nsels) {
-		nfc->selected_chip = NULL;
-		marvell_nand->selected_die = -1;
-		return;
-	}
-
 	writel_relaxed(marvell_nand->ndtr0, nfc->regs + NDTR0);
 	writel_relaxed(marvell_nand->ndtr1, nfc->regs + NDTR1);
 
@@ -1024,13 +1019,13 @@ static int marvell_nfc_hw_ecc_hmg_do_read_page(struct nand_chip *chip,
 	}
 
 	ret = marvell_nfc_wait_cmdd(chip);
-
 	return ret;
 }
 
 static int marvell_nfc_hw_ecc_hmg_read_page_raw(struct nand_chip *chip, u8 *buf,
 						int oob_required, int page)
 {
+	marvell_nfc_select_target(chip, chip->cur_cs);
 	return marvell_nfc_hw_ecc_hmg_do_read_page(chip, buf, chip->oob_poi,
 						   true, page);
 }
@@ -1043,6 +1038,7 @@ static int marvell_nfc_hw_ecc_hmg_read_page(struct nand_chip *chip, u8 *buf,
 	int max_bitflips = 0, ret;
 	u8 *raw_buf;
 
+	marvell_nfc_select_target(chip, chip->cur_cs);
 	marvell_nfc_enable_hw_ecc(chip);
 	marvell_nfc_hw_ecc_hmg_do_read_page(chip, buf, chip->oob_poi, false,
 					    page);
@@ -1079,6 +1075,7 @@ static int marvell_nfc_hw_ecc_hmg_read_oob_raw(struct nand_chip *chip, int page)
 	/* Invalidate page cache */
 	chip->pagebuf = -1;
 
+	marvell_nfc_select_target(chip, chip->cur_cs);
 	return marvell_nfc_hw_ecc_hmg_do_read_page(chip, chip->data_buf,
 						   chip->oob_poi, true, page);
 }
@@ -1142,6 +1139,7 @@ static int marvell_nfc_hw_ecc_hmg_write_page_raw(struct nand_chip *chip,
 						 const u8 *buf,
 						 int oob_required, int page)
 {
+	marvell_nfc_select_target(chip, chip->cur_cs);
 	return marvell_nfc_hw_ecc_hmg_do_write_page(chip, buf, chip->oob_poi,
 						    true, page);
 }
@@ -1152,6 +1150,7 @@ static int marvell_nfc_hw_ecc_hmg_write_page(struct nand_chip *chip,
 {
 	int ret;
 
+	marvell_nfc_select_target(chip, chip->cur_cs);
 	marvell_nfc_enable_hw_ecc(chip);
 	ret = marvell_nfc_hw_ecc_hmg_do_write_page(chip, buf, chip->oob_poi,
 						   false, page);
@@ -1175,6 +1174,7 @@ static int marvell_nfc_hw_ecc_hmg_write_oob_raw(struct nand_chip *chip,
 
 	memset(chip->data_buf, 0xFF, mtd->writesize);
 
+	marvell_nfc_select_target(chip, chip->cur_cs);
 	return marvell_nfc_hw_ecc_hmg_do_write_page(chip, chip->data_buf,
 						    chip->oob_poi, true, page);
 }
@@ -1194,6 +1194,8 @@ static int marvell_nfc_hw_ecc_bch_read_page_raw(struct nand_chip *chip, u8 *buf,
 	int ecc_len = lt->ecc_bytes;
 	int chunk;
 
+	marvell_nfc_select_target(chip, chip->cur_cs);
+
 	if (oob_required)
 		memset(chip->oob_poi, 0xFF, mtd->oobsize);
 
@@ -1304,6 +1306,8 @@ static int marvell_nfc_hw_ecc_bch_read_page(struct nand_chip *chip,
 	u32 failure_mask = 0;
 	int chunk, ret;
 
+	marvell_nfc_select_target(chip, chip->cur_cs);
+
 	/*
 	 * With BCH, OOB is not fully used (and thus not read entirely), not
 	 * expected bytes could show up at the end of the OOB buffer if not
@@ -1448,6 +1452,8 @@ static int marvell_nfc_hw_ecc_bch_write_page_raw(struct nand_chip *chip,
 		lt->last_spare_bytes;
 	int chunk;
 
+	marvell_nfc_select_target(chip, chip->cur_cs);
+
 	nand_prog_page_begin_op(chip, page, 0, NULL, 0);
 
 	for (chunk = 0; chunk < lt->nchunks; chunk++) {
@@ -1559,6 +1565,8 @@ static int marvell_nfc_hw_ecc_bch_write_page(struct nand_chip *chip,
 	int spare_len = lt->spare_bytes;
 	int chunk, ret;
 
+	marvell_nfc_select_target(chip, chip->cur_cs);
+
 	/* Spare data will be written anyway, so clear it to avoid garbage */
 	if (!oob_required)
 		memset(chip->oob_poi, 0xFF, mtd->oobsize);
@@ -2097,6 +2105,8 @@ static int marvell_nfc_exec_op(struct nand_chip *chip,
 {
 	struct marvell_nfc *nfc = to_marvell_nfc(chip->controller);
 
+	marvell_nfc_select_target(chip, op->cs);
+
 	if (nfc->caps->is_nfcv2)
 		return nand_op_parser_exec_op(chip, &marvell_nfcv2_op_parser,
 					      op, check_only);
@@ -2618,7 +2628,6 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 	nand_set_flash_node(chip, np);
 
 	chip->exec_op = marvell_nfc_exec_op;
-	chip->select_chip = marvell_nfc_select_chip;
 	if (!of_property_read_bool(np, "marvell,nand-keep-config"))
 		chip->setup_data_interface = marvell_nfc_setup_data_interface;
 
-- 
2.17.1
