Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fgAmT-00068r-TT
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
Subject: [PATCH 1/3] mtd: rawnand: marvell: rework BCH engine failure path
Date: Thu, 19 Jul 2018 17:23:35 +0200
Message-Id: <20180719152337.6372-2-miquel.raynal@bootlin.com>
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

We are about to support a new layout that triggers a faulty mechanism in
BCH engine that creates bitflips in erased pages.

Before adding the quirk that will workaround this issue, this patch just
reworks a bit the section that handles ECC failures in BCH read path.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/marvell_nand.c | 75 +++++++++++++++++++++++--------------
 1 file changed, 46 insertions(+), 29 deletions(-)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 80a074cccb82..954b5755ba59 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -1234,11 +1234,11 @@ static int marvell_nfc_hw_ecc_bch_read_page(struct mtd_info *mtd,
 					    int page)
 {
 	const struct marvell_hw_ecc_layout *lt = to_marvell_nand(chip)->layout;
-	int data_len = lt->data_bytes, spare_len = lt->spare_bytes, ecc_len;
-	u8 *data = buf, *spare = chip->oob_poi, *ecc;
+	int data_len = lt->data_bytes, spare_len = lt->spare_bytes;
+	u8 *data = buf, *spare = chip->oob_poi;
 	int max_bitflips = 0;
 	u32 failure_mask = 0;
-	int chunk, ecc_offset_in_page, ret;
+	int chunk, ret;
 
 	/*
 	 * With BCH, OOB is not fully used (and thus not read entirely), not
@@ -1279,46 +1279,63 @@ static int marvell_nfc_hw_ecc_bch_read_page(struct mtd_info *mtd,
 	 * the controller in normal mode and must be re-read in raw mode. To
 	 * avoid dropping the performances, we prefer not to include them. The
 	 * user should re-read the page in raw mode if ECC bytes are required.
+	 */
+
+	/*
+	 * In case there is any subpage read error reported by ->correct(), we
+	 * usually re-read only ECC bytes in raw mode and check if the whole
+	 * page is empty. In this case, it is normal that the ECC check failed
+	 * and we just ignore the error.
 	 *
 	 * However, for any subpage read error reported by ->correct(), the ECC
 	 * bytes must be read in raw mode and the full subpage must be checked
 	 * to see if it is entirely empty of if there was an actual error.
 	 */
 	for (chunk = 0; chunk < lt->nchunks; chunk++) {
+		int data_off_in_page, spare_off_in_page, ecc_off_in_page;
+		int data_off, spare_off, ecc_off;
+		int data_len, spare_len, ecc_len;
+
 		/* No failure reported for this chunk, move to the next one */
 		if (!(failure_mask & BIT(chunk)))
 			continue;
 
-		/* Derive ECC bytes positions (in page/buffer) and length */
-		ecc = chip->oob_poi +
-			(lt->full_chunk_cnt * lt->spare_bytes) +
-			lt->last_spare_bytes +
-			(chunk * ALIGN(lt->ecc_bytes, 32));
-		ecc_offset_in_page =
-			(chunk * (lt->data_bytes + lt->spare_bytes +
-				  lt->ecc_bytes)) +
-			(chunk < lt->full_chunk_cnt ?
-			 lt->data_bytes + lt->spare_bytes :
-			 lt->last_data_bytes + lt->last_spare_bytes);
-		ecc_len = chunk < lt->full_chunk_cnt ?
-			lt->ecc_bytes : lt->last_ecc_bytes;
+		/*
+		 * Only re-read the ECC bytes, unless we are using the 2k/8b
+		 * layout which is buggy in the sense that the ECC engine will
+		 * try to correct data bytes anyway, creating bitflips. In this
+		 * case, re-read the entire page.
+		 */
+		data_off_in_page = chunk * (lt->data_bytes + lt->spare_bytes +
+					    lt->ecc_bytes);
+		spare_off_in_page = data_off_in_page +
+			(chunk < lt->full_chunk_cnt ? lt->data_bytes :
+						      lt->last_data_bytes);
+		ecc_off_in_page = spare_off_in_page +
+			(chunk < lt->full_chunk_cnt ? lt->spare_bytes :
+						      lt->last_spare_bytes);
 
-		/* Do the actual raw read of the ECC bytes */
-		nand_change_read_column_op(chip, ecc_offset_in_page,
-					   ecc, ecc_len, false);
+		data_off = chunk * lt->data_bytes;
+		spare_off = chunk * lt->spare_bytes;
+		ecc_off = (lt->full_chunk_cnt * lt->spare_bytes) +
+			  lt->last_spare_bytes +
+			  (chunk * (lt->ecc_bytes + 2));
 
-		/* Derive data/spare bytes positions (in buffer) and length */
-		data = buf + (chunk * lt->data_bytes);
-		data_len = chunk < lt->full_chunk_cnt ?
-			lt->data_bytes : lt->last_data_bytes;
-		spare = chip->oob_poi + (chunk * (lt->spare_bytes +
-						  lt->ecc_bytes));
-		spare_len = chunk < lt->full_chunk_cnt ?
-			lt->spare_bytes : lt->last_spare_bytes;
+		data_len = chunk < lt->full_chunk_cnt ? lt->data_bytes :
+							lt->last_data_bytes;
+		spare_len = chunk < lt->full_chunk_cnt ? lt->spare_bytes :
+							 lt->last_spare_bytes;
+		ecc_len = chunk < lt->full_chunk_cnt ? lt->ecc_bytes :
+						       lt->last_ecc_bytes;
+
+		nand_change_read_column_op(chip, ecc_off_in_page,
+					   chip->oob_poi + ecc_off, ecc_len,
+					   false);
 
 		/* Check the entire chunk (data + spare + ecc) for emptyness */
-		marvell_nfc_check_empty_chunk(chip, data, data_len, spare,
-					      spare_len, ecc, ecc_len,
+		marvell_nfc_check_empty_chunk(chip, buf + data_off, data_len,
+					      chip->oob_poi + spare_off, spare_len,
+					      chip->oob_poi + ecc_off, ecc_len,
 					      &max_bitflips);
 	}
 
-- 
2.14.1
