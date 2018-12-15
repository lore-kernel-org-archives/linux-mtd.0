Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gY53m-0001pm-1Q
 for linux-mtd@lists.infradead.org; Sat, 15 Dec 2018 08:12:32 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH 3/5] mtd: rawnand: sunxi: Name nand_chip objects consistently
Date: Sat, 15 Dec 2018 09:12:12 +0100
Message-Id: <20181215081214.4935-3-boris.brezillon@bootlin.com>
In-Reply-To: <20181215081214.4935-1-boris.brezillon@bootlin.com>
References: <20181215081214.4935-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

nand_chip objects are sometimes called chip and sometimes nand. Rename
all of them into nand to make things consistent.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 103 +++++++++++++++---------------
 1 file changed, 51 insertions(+), 52 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 1453392a53e7..05820d9b3bd7 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1185,16 +1185,16 @@ static void sunxi_nfc_hw_ecc_write_extra_oob(struct mtd_info *mtd,
 		*cur_off = mtd->oobsize + mtd->writesize;
 }
 
-static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *chip, uint8_t *buf,
+static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 				      int oob_required, int page)
 {
-	struct mtd_info *mtd = nand_to_mtd(chip);
-	struct nand_ecc_ctrl *ecc = &chip->ecc;
+	struct mtd_info *mtd = nand_to_mtd(nand);
+	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	unsigned int max_bitflips = 0;
 	int ret, i, cur_off = 0;
 	bool raw_mode = false;
 
-	nand_read_page_op(chip, page, 0, NULL, 0);
+	nand_read_page_op(nand, page, 0, NULL, 0);
 
 	sunxi_nfc_hw_ecc_enable(mtd);
 
@@ -1202,7 +1202,7 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *chip, uint8_t *buf,
 		int data_off = i * ecc->size;
 		int oob_off = i * (ecc->bytes + 4);
 		u8 *data = buf + data_off;
-		u8 *oob = chip->oob_poi + oob_off;
+		u8 *oob = nand->oob_poi + oob_off;
 
 		ret = sunxi_nfc_hw_ecc_read_chunk(mtd, data, data_off, oob,
 						  oob_off + mtd->writesize,
@@ -1215,7 +1215,7 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *chip, uint8_t *buf,
 	}
 
 	if (oob_required)
-		sunxi_nfc_hw_ecc_read_extra_oob(mtd, chip->oob_poi, &cur_off,
+		sunxi_nfc_hw_ecc_read_extra_oob(mtd, nand->oob_poi, &cur_off,
 						!raw_mode, page);
 
 	sunxi_nfc_hw_ecc_disable(mtd);
@@ -1223,33 +1223,33 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *chip, uint8_t *buf,
 	return max_bitflips;
 }
 
-static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *chip, u8 *buf,
+static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 					  int oob_required, int page)
 {
-	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct mtd_info *mtd = nand_to_mtd(nand);
 	int ret;
 
-	nand_read_page_op(chip, page, 0, NULL, 0);
+	nand_read_page_op(nand, page, 0, NULL, 0);
 
 	ret = sunxi_nfc_hw_ecc_read_chunks_dma(mtd, buf, oob_required, page,
-					       chip->ecc.steps);
+					       nand->ecc.steps);
 	if (ret >= 0)
 		return ret;
 
 	/* Fallback to PIO mode */
-	return sunxi_nfc_hw_ecc_read_page(chip, buf, oob_required, page);
+	return sunxi_nfc_hw_ecc_read_page(nand, buf, oob_required, page);
 }
 
-static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *chip,
+static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 					 u32 data_offs, u32 readlen,
 					 u8 *bufpoi, int page)
 {
-	struct mtd_info *mtd = nand_to_mtd(chip);
-	struct nand_ecc_ctrl *ecc = &chip->ecc;
+	struct mtd_info *mtd = nand_to_mtd(nand);
+	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret, i, cur_off = 0;
 	unsigned int max_bitflips = 0;
 
-	nand_read_page_op(chip, page, 0, NULL, 0);
+	nand_read_page_op(nand, page, 0, NULL, 0);
 
 	sunxi_nfc_hw_ecc_enable(mtd);
 
@@ -1258,7 +1258,7 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *chip,
 		int data_off = i * ecc->size;
 		int oob_off = i * (ecc->bytes + 4);
 		u8 *data = bufpoi + data_off;
-		u8 *oob = chip->oob_poi + oob_off;
+		u8 *oob = nand->oob_poi + oob_off;
 
 		ret = sunxi_nfc_hw_ecc_read_chunk(mtd, data, data_off,
 						  oob,
@@ -1274,34 +1274,34 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *chip,
 	return max_bitflips;
 }
 
-static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *chip,
+static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 					     u32 data_offs, u32 readlen,
 					     u8 *buf, int page)
 {
-	struct mtd_info *mtd = nand_to_mtd(chip);
-	int nchunks = DIV_ROUND_UP(data_offs + readlen, chip->ecc.size);
+	struct mtd_info *mtd = nand_to_mtd(nand);
+	int nchunks = DIV_ROUND_UP(data_offs + readlen, nand->ecc.size);
 	int ret;
 
-	nand_read_page_op(chip, page, 0, NULL, 0);
+	nand_read_page_op(nand, page, 0, NULL, 0);
 
 	ret = sunxi_nfc_hw_ecc_read_chunks_dma(mtd, buf, false, page, nchunks);
 	if (ret >= 0)
 		return ret;
 
 	/* Fallback to PIO mode */
-	return sunxi_nfc_hw_ecc_read_subpage(chip, data_offs, readlen,
+	return sunxi_nfc_hw_ecc_read_subpage(nand, data_offs, readlen,
 					     buf, page);
 }
 
-static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *chip,
+static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 				       const uint8_t *buf, int oob_required,
 				       int page)
 {
-	struct mtd_info *mtd = nand_to_mtd(chip);
-	struct nand_ecc_ctrl *ecc = &chip->ecc;
+	struct mtd_info *mtd = nand_to_mtd(nand);
+	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret, i, cur_off = 0;
 
-	nand_prog_page_begin_op(chip, page, 0, NULL, 0);
+	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 
 	sunxi_nfc_hw_ecc_enable(mtd);
 
@@ -1309,7 +1309,7 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *chip,
 		int data_off = i * ecc->size;
 		int oob_off = i * (ecc->bytes + 4);
 		const u8 *data = buf + data_off;
-		const u8 *oob = chip->oob_poi + oob_off;
+		const u8 *oob = nand->oob_poi + oob_off;
 
 		ret = sunxi_nfc_hw_ecc_write_chunk(mtd, data, data_off, oob,
 						   oob_off + mtd->writesize,
@@ -1318,25 +1318,25 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *chip,
 			return ret;
 	}
 
-	if (oob_required || (chip->options & NAND_NEED_SCRAMBLING))
-		sunxi_nfc_hw_ecc_write_extra_oob(mtd, chip->oob_poi,
+	if (oob_required || (nand->options & NAND_NEED_SCRAMBLING))
+		sunxi_nfc_hw_ecc_write_extra_oob(mtd, nand->oob_poi,
 						 &cur_off, page);
 
 	sunxi_nfc_hw_ecc_disable(mtd);
 
-	return nand_prog_page_end_op(chip);
+	return nand_prog_page_end_op(nand);
 }
 
-static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *chip,
+static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 					  u32 data_offs, u32 data_len,
 					  const u8 *buf, int oob_required,
 					  int page)
 {
-	struct mtd_info *mtd = nand_to_mtd(chip);
-	struct nand_ecc_ctrl *ecc = &chip->ecc;
+	struct mtd_info *mtd = nand_to_mtd(nand);
+	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret, i, cur_off = 0;
 
-	nand_prog_page_begin_op(chip, page, 0, NULL, 0);
+	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 
 	sunxi_nfc_hw_ecc_enable(mtd);
 
@@ -1345,7 +1345,7 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *chip,
 		int data_off = i * ecc->size;
 		int oob_off = i * (ecc->bytes + 4);
 		const u8 *data = buf + data_off;
-		const u8 *oob = chip->oob_poi + oob_off;
+		const u8 *oob = nand->oob_poi + oob_off;
 
 		ret = sunxi_nfc_hw_ecc_write_chunk(mtd, data, data_off, oob,
 						   oob_off + mtd->writesize,
@@ -1356,16 +1356,15 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *chip,
 
 	sunxi_nfc_hw_ecc_disable(mtd);
 
-	return nand_prog_page_end_op(chip);
+	return nand_prog_page_end_op(nand);
 }
 
-static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *chip,
+static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 					   const u8 *buf,
 					   int oob_required,
 					   int page)
 {
-	struct mtd_info *mtd = nand_to_mtd(chip);
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	struct scatterlist sg;
@@ -1386,7 +1385,7 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *chip,
 		sunxi_nfc_hw_ecc_set_prot_oob_bytes(mtd, oob, i, !i, page);
 	}
 
-	nand_prog_page_begin_op(chip, page, 0, NULL, 0);
+	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 
 	sunxi_nfc_hw_ecc_enable(mtd);
 	sunxi_nfc_randomizer_config(mtd, page, false);
@@ -1413,38 +1412,38 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *chip,
 	if (ret)
 		return ret;
 
-	if (oob_required || (chip->options & NAND_NEED_SCRAMBLING))
+	if (oob_required || (nand->options & NAND_NEED_SCRAMBLING))
 		/* TODO: use DMA to transfer extra OOB bytes ? */
-		sunxi_nfc_hw_ecc_write_extra_oob(mtd, chip->oob_poi,
+		sunxi_nfc_hw_ecc_write_extra_oob(mtd, nand->oob_poi,
 						 NULL, page);
 
-	return nand_prog_page_end_op(chip);
+	return nand_prog_page_end_op(nand);
 
 pio_fallback:
-	return sunxi_nfc_hw_ecc_write_page(chip, buf, oob_required, page);
+	return sunxi_nfc_hw_ecc_write_page(nand, buf, oob_required, page);
 }
 
-static int sunxi_nfc_hw_ecc_read_oob(struct nand_chip *chip, int page)
+static int sunxi_nfc_hw_ecc_read_oob(struct nand_chip *nand, int page)
 {
-	chip->pagebuf = -1;
+	nand->pagebuf = -1;
 
-	return chip->ecc.read_page(chip, chip->data_buf, 1, page);
+	return nand->ecc.read_page(nand, nand->data_buf, 1, page);
 }
 
-static int sunxi_nfc_hw_ecc_write_oob(struct nand_chip *chip, int page)
+static int sunxi_nfc_hw_ecc_write_oob(struct nand_chip *nand, int page)
 {
-	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct mtd_info *mtd = nand_to_mtd(nand);
 	int ret;
 
-	chip->pagebuf = -1;
+	nand->pagebuf = -1;
 
-	memset(chip->data_buf, 0xff, mtd->writesize);
-	ret = chip->ecc.write_page(chip, chip->data_buf, 1, page);
+	memset(nand->data_buf, 0xff, mtd->writesize);
+	ret = nand->ecc.write_page(nand, nand->data_buf, 1, page);
 	if (ret)
 		return ret;
 
 	/* Send command to program the OOB data */
-	return nand_prog_page_end_op(chip);
+	return nand_prog_page_end_op(nand);
 }
 
 static const s32 tWB_lut[] = {6, 12, 16, 20};
-- 
2.17.1
