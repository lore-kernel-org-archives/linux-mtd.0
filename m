Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fgAmT-00068s-TR
 for linux-mtd@lists.infradead.org; Thu, 19 Jul 2018 15:23:53 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Antoine Tenart <antoine.tenart@bootlin.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Nadav Haklai <nadavh@marvell.com>, Ofer Heifetz <oferh@marvell.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 2/3] mtd: rawnand: marvell: support 8b/512B strength for 2kiB
 pages layout
Date: Thu, 19 Jul 2018 17:23:36 +0200
Message-Id: <20180719152337.6372-3-miquel.raynal@bootlin.com>
In-Reply-To: <20180719152337.6372-1-miquel.raynal@bootlin.com>
References: <20180719152337.6372-1-miquel.raynal@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add support for the layout used by 2kiB page NAND chips requesting at
least 8-bit of correction per 512 bytes. This layout requires a bit of
handling as:
1/ It can only fit if the NAND chip has at least 128 OOB bytes.
2/ The Bad Block Markers are located in the middle of the data bytes
   and shall not be used.
3/ It has been experimentally observed that, for certain layouts, the ECC
   engine tries to correct data while it should not because the errors
   are uncorrectable. While this is harmless for truly bad pages, it
   creates bitflips in empty pages. To avoid such scenario that
   augments artificially the number of bitflips we re-read in raw mode
   the entire page instead of just the ECC bytes. This is done only
   for this layout to avoid an unneeded penalty with other setups.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/marvell_nand.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 954b5755ba59..83bb4ef9baa6 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -217,6 +217,7 @@ static const struct marvell_hw_ecc_layout marvell_nfc_layouts[] = {
 	MARVELL_LAYOUT(  512,   512,  1,  1,  1,  512,  8,  8,  0,  0,  0),
 	MARVELL_LAYOUT( 2048,   512,  1,  1,  1, 2048, 40, 24,  0,  0,  0),
 	MARVELL_LAYOUT( 2048,   512,  4,  1,  1, 2048, 32, 30,  0,  0,  0),
+	MARVELL_LAYOUT( 2048,   512,  8,  2,  1, 1024,  0, 30,1024,32, 30),
 	MARVELL_LAYOUT( 4096,   512,  4,  2,  2, 2048, 32, 30,  0,  0,  0),
 	MARVELL_LAYOUT( 4096,   512,  8,  5,  4, 1024,  0, 30,  0, 64, 30),
 };
@@ -1287,9 +1288,11 @@ static int marvell_nfc_hw_ecc_bch_read_page(struct mtd_info *mtd,
 	 * page is empty. In this case, it is normal that the ECC check failed
 	 * and we just ignore the error.
 	 *
-	 * However, for any subpage read error reported by ->correct(), the ECC
-	 * bytes must be read in raw mode and the full subpage must be checked
-	 * to see if it is entirely empty of if there was an actual error.
+	 * However, it has been empirically observed that for some layouts (e.g
+	 * 2k page, 8b strength per 512B chunk), the controller tries to correct
+	 * bits and may create itself bitflips in the erased area. To overcome
+	 * this strange behavior, the whole page is re-read in raw mode, not
+	 * only the ECC bytes.
 	 */
 	for (chunk = 0; chunk < lt->nchunks; chunk++) {
 		int data_off_in_page, spare_off_in_page, ecc_off_in_page;
@@ -1328,6 +1331,15 @@ static int marvell_nfc_hw_ecc_bch_read_page(struct mtd_info *mtd,
 		ecc_len = chunk < lt->full_chunk_cnt ? lt->ecc_bytes :
 						       lt->last_ecc_bytes;
 
+		if (lt->writesize == 2048 && lt->strength == 8) {
+			nand_change_read_column_op(chip, data_off_in_page,
+						   buf + data_off, data_len,
+						   false);
+			nand_change_read_column_op(chip, spare_off_in_page,
+						   chip->oob_poi + spare_off, spare_len,
+						   false);
+		}
+
 		nand_change_read_column_op(chip, ecc_off_in_page,
 					   chip->oob_poi + ecc_off, ecc_len,
 					   false);
@@ -2112,6 +2124,16 @@ static int marvell_nand_hw_ecc_ctrl_init(struct mtd_info *mtd,
 		return -ENOTSUPP;
 	}
 
+	/* Special care for the layout 2k/8-bit/512B  */
+	if (l->writesize == 2048 && l->strength == 8) {
+		if (mtd->oobsize < 128) {
+			dev_err(nfc->dev, "Requested layout needs at least 128 OOB bytes\n");
+			return -ENOTSUPP;
+		} else {
+			chip->bbt_options |= NAND_BBT_NO_OOB_BBM;
+		}
+	}
+
 	mtd_set_ooblayout(mtd, &marvell_nand_ooblayout_ops);
 	ecc->steps = l->nchunks;
 	ecc->size = l->data_bytes;
-- 
2.14.1
