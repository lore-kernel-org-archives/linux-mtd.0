Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gY53m-0001pn-3N
 for linux-mtd@lists.infradead.org; Sat, 15 Dec 2018 08:12:36 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH 4/5] mtd: rawnand: sunxi: Stop passing mtd_info objects around
Date: Sat, 15 Dec 2018 09:12:13 +0100
Message-Id: <20181215081214.4935-4-boris.brezillon@bootlin.com>
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

Replace them by nand_chip pointers.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 204 ++++++++++++++----------------
 1 file changed, 94 insertions(+), 110 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 05820d9b3bd7..fb02603ab227 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -339,13 +339,11 @@ static int sunxi_nfc_rst(struct sunxi_nfc *nfc)
 	return ret;
 }
 
-static int sunxi_nfc_dma_op_prepare(struct mtd_info *mtd, const void *buf,
+static int sunxi_nfc_dma_op_prepare(struct sunxi_nfc *nfc, const void *buf,
 				    int chunksize, int nchunks,
 				    enum dma_data_direction ddir,
 				    struct scatterlist *sg)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
-	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct dma_async_tx_descriptor *dmad;
 	enum dma_transfer_direction tdir;
 	dma_cookie_t dmat;
@@ -388,13 +386,10 @@ static int sunxi_nfc_dma_op_prepare(struct mtd_info *mtd, const void *buf,
 	return ret;
 }
 
-static void sunxi_nfc_dma_op_cleanup(struct mtd_info *mtd,
+static void sunxi_nfc_dma_op_cleanup(struct sunxi_nfc *nfc,
 				     enum dma_data_direction ddir,
 				     struct scatterlist *sg)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
-	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
-
 	dma_unmap_sg(nfc->dev, sg, 1, ddir);
 	writel(readl(nfc->regs + NFC_REG_CTL) & ~NFC_RAM_METHOD,
 	       nfc->regs + NFC_REG_CTL);
@@ -684,8 +679,10 @@ static u16 sunxi_nfc_randomizer_step(u16 state, int count)
 	return state;
 }
 
-static u16 sunxi_nfc_randomizer_state(struct mtd_info *mtd, int page, bool ecc)
+static u16 sunxi_nfc_randomizer_state(struct nand_chip *nand, int page,
+				      bool ecc)
 {
+	struct mtd_info *mtd = nand_to_mtd(nand);
 	const u16 *seeds = sunxi_nfc_randomizer_page_seeds;
 	int mod = mtd_div_by_ws(mtd->erasesize, mtd);
 
@@ -702,10 +699,9 @@ static u16 sunxi_nfc_randomizer_state(struct mtd_info *mtd, int page, bool ecc)
 	return seeds[page % mod];
 }
 
-static void sunxi_nfc_randomizer_config(struct mtd_info *mtd,
-					int page, bool ecc)
+static void sunxi_nfc_randomizer_config(struct nand_chip *nand, int page,
+					bool ecc)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	u32 ecc_ctl = readl(nfc->regs + NFC_REG_ECC_CTL);
 	u16 state;
@@ -714,14 +710,13 @@ static void sunxi_nfc_randomizer_config(struct mtd_info *mtd,
 		return;
 
 	ecc_ctl = readl(nfc->regs + NFC_REG_ECC_CTL);
-	state = sunxi_nfc_randomizer_state(mtd, page, ecc);
+	state = sunxi_nfc_randomizer_state(nand, page, ecc);
 	ecc_ctl = readl(nfc->regs + NFC_REG_ECC_CTL) & ~NFC_RANDOM_SEED_MSK;
 	writel(ecc_ctl | NFC_RANDOM_SEED(state), nfc->regs + NFC_REG_ECC_CTL);
 }
 
-static void sunxi_nfc_randomizer_enable(struct mtd_info *mtd)
+static void sunxi_nfc_randomizer_enable(struct nand_chip *nand)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 
 	if (!(nand->options & NAND_NEED_SCRAMBLING))
@@ -731,9 +726,8 @@ static void sunxi_nfc_randomizer_enable(struct mtd_info *mtd)
 	       nfc->regs + NFC_REG_ECC_CTL);
 }
 
-static void sunxi_nfc_randomizer_disable(struct mtd_info *mtd)
+static void sunxi_nfc_randomizer_disable(struct nand_chip *nand)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 
 	if (!(nand->options & NAND_NEED_SCRAMBLING))
@@ -743,36 +737,35 @@ static void sunxi_nfc_randomizer_disable(struct mtd_info *mtd)
 	       nfc->regs + NFC_REG_ECC_CTL);
 }
 
-static void sunxi_nfc_randomize_bbm(struct mtd_info *mtd, int page, u8 *bbm)
+static void sunxi_nfc_randomize_bbm(struct nand_chip *nand, int page, u8 *bbm)
 {
-	u16 state = sunxi_nfc_randomizer_state(mtd, page, true);
+	u16 state = sunxi_nfc_randomizer_state(nand, page, true);
 
 	bbm[0] ^= state;
 	bbm[1] ^= sunxi_nfc_randomizer_step(state, 8);
 }
 
-static void sunxi_nfc_randomizer_write_buf(struct mtd_info *mtd,
+static void sunxi_nfc_randomizer_write_buf(struct nand_chip *nand,
 					   const uint8_t *buf, int len,
 					   bool ecc, int page)
 {
-	sunxi_nfc_randomizer_config(mtd, page, ecc);
-	sunxi_nfc_randomizer_enable(mtd);
-	sunxi_nfc_write_buf(mtd_to_nand(mtd), buf, len);
-	sunxi_nfc_randomizer_disable(mtd);
+	sunxi_nfc_randomizer_config(nand, page, ecc);
+	sunxi_nfc_randomizer_enable(nand);
+	sunxi_nfc_write_buf(nand, buf, len);
+	sunxi_nfc_randomizer_disable(nand);
 }
 
-static void sunxi_nfc_randomizer_read_buf(struct mtd_info *mtd, uint8_t *buf,
+static void sunxi_nfc_randomizer_read_buf(struct nand_chip *nand, uint8_t *buf,
 					  int len, bool ecc, int page)
 {
-	sunxi_nfc_randomizer_config(mtd, page, ecc);
-	sunxi_nfc_randomizer_enable(mtd);
-	sunxi_nfc_read_buf(mtd_to_nand(mtd), buf, len);
-	sunxi_nfc_randomizer_disable(mtd);
+	sunxi_nfc_randomizer_config(nand, page, ecc);
+	sunxi_nfc_randomizer_enable(nand);
+	sunxi_nfc_read_buf(nand, buf, len);
+	sunxi_nfc_randomizer_disable(nand);
 }
 
-static void sunxi_nfc_hw_ecc_enable(struct mtd_info *mtd)
+static void sunxi_nfc_hw_ecc_enable(struct nand_chip *nand)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct sunxi_nand_hw_ecc *data = nand->ecc.priv;
 	u32 ecc_ctl;
@@ -789,9 +782,8 @@ static void sunxi_nfc_hw_ecc_enable(struct mtd_info *mtd)
 	writel(ecc_ctl, nfc->regs + NFC_REG_ECC_CTL);
 }
 
-static void sunxi_nfc_hw_ecc_disable(struct mtd_info *mtd)
+static void sunxi_nfc_hw_ecc_disable(struct nand_chip *nand)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 
 	writel(readl(nfc->regs + NFC_REG_ECC_CTL) & ~NFC_ECC_EN,
@@ -811,10 +803,9 @@ static inline u32 sunxi_nfc_buf_to_user_data(const u8 *buf)
 	return buf[0] | (buf[1] << 8) | (buf[2] << 16) | (buf[3] << 24);
 }
 
-static void sunxi_nfc_hw_ecc_get_prot_oob_bytes(struct mtd_info *mtd, u8 *oob,
+static void sunxi_nfc_hw_ecc_get_prot_oob_bytes(struct nand_chip *nand, u8 *oob,
 						int step, bool bbm, int page)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 
 	sunxi_nfc_user_data_to_buf(readl(nfc->regs + NFC_REG_USER_DATA(step)),
@@ -822,21 +813,20 @@ static void sunxi_nfc_hw_ecc_get_prot_oob_bytes(struct mtd_info *mtd, u8 *oob,
 
 	/* De-randomize the Bad Block Marker. */
 	if (bbm && (nand->options & NAND_NEED_SCRAMBLING))
-		sunxi_nfc_randomize_bbm(mtd, page, oob);
+		sunxi_nfc_randomize_bbm(nand, page, oob);
 }
 
-static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct mtd_info *mtd,
+static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
 						const u8 *oob, int step,
 						bool bbm, int page)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	u8 user_data[4];
 
 	/* Randomize the Bad Block Marker. */
 	if (bbm && (nand->options & NAND_NEED_SCRAMBLING)) {
 		memcpy(user_data, oob, sizeof(user_data));
-		sunxi_nfc_randomize_bbm(mtd, page, user_data);
+		sunxi_nfc_randomize_bbm(nand, page, user_data);
 		oob = user_data;
 	}
 
@@ -844,9 +834,11 @@ static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct mtd_info *mtd,
 	       nfc->regs + NFC_REG_USER_DATA(step));
 }
 
-static void sunxi_nfc_hw_ecc_update_stats(struct mtd_info *mtd,
+static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
 					  unsigned int *max_bitflips, int ret)
 {
+	struct mtd_info *mtd = nand_to_mtd(nand);
+
 	if (ret < 0) {
 		mtd->ecc_stats.failed++;
 	} else {
@@ -855,10 +847,9 @@ static void sunxi_nfc_hw_ecc_update_stats(struct mtd_info *mtd,
 	}
 }
 
-static int sunxi_nfc_hw_ecc_correct(struct mtd_info *mtd, u8 *data, u8 *oob,
+static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 				    int step, u32 status, bool *erased)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	u32 tmp;
@@ -892,14 +883,13 @@ static int sunxi_nfc_hw_ecc_correct(struct mtd_info *mtd, u8 *data, u8 *oob,
 	return NFC_ECC_ERR_CNT(step, tmp);
 }
 
-static int sunxi_nfc_hw_ecc_read_chunk(struct mtd_info *mtd,
+static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 				       u8 *data, int data_off,
 				       u8 *oob, int oob_off,
 				       int *cur_off,
 				       unsigned int *max_bitflips,
 				       bool bbm, bool oob_required, int page)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int raw_mode = 0;
@@ -909,7 +899,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct mtd_info *mtd,
 	if (*cur_off != data_off)
 		nand_change_read_column_op(nand, data_off, NULL, 0, false);
 
-	sunxi_nfc_randomizer_read_buf(mtd, NULL, ecc->size, false, page);
+	sunxi_nfc_randomizer_read_buf(nand, NULL, ecc->size, false, page);
 
 	if (data_off + ecc->size != oob_off)
 		nand_change_read_column_op(nand, oob_off, NULL, 0, false);
@@ -918,18 +908,18 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct mtd_info *mtd,
 	if (ret)
 		return ret;
 
-	sunxi_nfc_randomizer_enable(mtd);
+	sunxi_nfc_randomizer_enable(nand);
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD | NFC_ECC_OP,
 	       nfc->regs + NFC_REG_CMD);
 
 	ret = sunxi_nfc_wait_events(nfc, NFC_CMD_INT_FLAG, false, 0);
-	sunxi_nfc_randomizer_disable(mtd);
+	sunxi_nfc_randomizer_disable(nand);
 	if (ret)
 		return ret;
 
 	*cur_off = oob_off + ecc->bytes + 4;
 
-	ret = sunxi_nfc_hw_ecc_correct(mtd, data, oob_required ? oob : NULL, 0,
+	ret = sunxi_nfc_hw_ecc_correct(nand, data, oob_required ? oob : NULL, 0,
 				       readl(nfc->regs + NFC_REG_ECC_ST),
 				       &erased);
 	if (erased)
@@ -961,24 +951,24 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct mtd_info *mtd,
 		if (oob_required) {
 			nand_change_read_column_op(nand, oob_off, NULL, 0,
 						   false);
-			sunxi_nfc_randomizer_read_buf(mtd, oob, ecc->bytes + 4,
+			sunxi_nfc_randomizer_read_buf(nand, oob, ecc->bytes + 4,
 						      true, page);
 
-			sunxi_nfc_hw_ecc_get_prot_oob_bytes(mtd, oob, 0,
+			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, 0,
 							    bbm, page);
 		}
 	}
 
-	sunxi_nfc_hw_ecc_update_stats(mtd, max_bitflips, ret);
+	sunxi_nfc_hw_ecc_update_stats(nand, max_bitflips, ret);
 
 	return raw_mode;
 }
 
-static void sunxi_nfc_hw_ecc_read_extra_oob(struct mtd_info *mtd,
+static void sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
 					    u8 *oob, int *cur_off,
 					    bool randomize, int page)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int offset = ((ecc->bytes + 4) * ecc->steps);
 	int len = mtd->oobsize - offset;
@@ -993,20 +983,20 @@ static void sunxi_nfc_hw_ecc_read_extra_oob(struct mtd_info *mtd,
 	if (!randomize)
 		sunxi_nfc_read_buf(nand, oob + offset, len);
 	else
-		sunxi_nfc_randomizer_read_buf(mtd, oob + offset, len,
+		sunxi_nfc_randomizer_read_buf(nand, oob + offset, len,
 					      false, page);
 
 	if (cur_off)
 		*cur_off = mtd->oobsize + mtd->writesize;
 }
 
-static int sunxi_nfc_hw_ecc_read_chunks_dma(struct mtd_info *mtd, uint8_t *buf,
+static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf,
 					    int oob_required, int page,
 					    int nchunks)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
 	bool randomized = nand->options & NAND_NEED_SCRAMBLING;
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	unsigned int max_bitflips = 0;
 	int ret, i, raw_mode = 0;
@@ -1017,14 +1007,14 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct mtd_info *mtd, uint8_t *buf,
 	if (ret)
 		return ret;
 
-	ret = sunxi_nfc_dma_op_prepare(mtd, buf, ecc->size, nchunks,
+	ret = sunxi_nfc_dma_op_prepare(nfc, buf, ecc->size, nchunks,
 				       DMA_FROM_DEVICE, &sg);
 	if (ret)
 		return ret;
 
-	sunxi_nfc_hw_ecc_enable(mtd);
-	sunxi_nfc_randomizer_config(mtd, page, false);
-	sunxi_nfc_randomizer_enable(mtd);
+	sunxi_nfc_hw_ecc_enable(nand);
+	sunxi_nfc_randomizer_config(nand, page, false);
+	sunxi_nfc_randomizer_enable(nand);
 
 	writel((NAND_CMD_RNDOUTSTART << 16) | (NAND_CMD_RNDOUT << 8) |
 	       NAND_CMD_READSTART, nfc->regs + NFC_REG_RCMD_SET);
@@ -1038,10 +1028,10 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct mtd_info *mtd, uint8_t *buf,
 	if (ret)
 		dmaengine_terminate_all(nfc->dmac);
 
-	sunxi_nfc_randomizer_disable(mtd);
-	sunxi_nfc_hw_ecc_disable(mtd);
+	sunxi_nfc_randomizer_disable(nand);
+	sunxi_nfc_hw_ecc_disable(nand);
 
-	sunxi_nfc_dma_op_cleanup(mtd, DMA_FROM_DEVICE, &sg);
+	sunxi_nfc_dma_op_cleanup(nfc, DMA_FROM_DEVICE, &sg);
 
 	if (ret)
 		return ret;
@@ -1055,7 +1045,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct mtd_info *mtd, uint8_t *buf,
 		u8 *oob = nand->oob_poi + oob_off;
 		bool erased;
 
-		ret = sunxi_nfc_hw_ecc_correct(mtd, randomized ? data : NULL,
+		ret = sunxi_nfc_hw_ecc_correct(nand, randomized ? data : NULL,
 					       oob_required ? oob : NULL,
 					       i, status, &erased);
 
@@ -1069,14 +1059,14 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct mtd_info *mtd, uint8_t *buf,
 						   mtd->writesize + oob_off,
 						   oob, ecc->bytes + 4, false);
 
-			sunxi_nfc_hw_ecc_get_prot_oob_bytes(mtd, oob, i,
+			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, i,
 							    !i, page);
 		}
 
 		if (erased)
 			raw_mode = 1;
 
-		sunxi_nfc_hw_ecc_update_stats(mtd, &max_bitflips, ret);
+		sunxi_nfc_hw_ecc_update_stats(nand, &max_bitflips, ret);
 	}
 
 	if (status & NFC_ECC_ERR_MSK) {
@@ -1111,25 +1101,24 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct mtd_info *mtd, uint8_t *buf,
 			if (ret >= 0)
 				raw_mode = 1;
 
-			sunxi_nfc_hw_ecc_update_stats(mtd, &max_bitflips, ret);
+			sunxi_nfc_hw_ecc_update_stats(nand, &max_bitflips, ret);
 		}
 	}
 
 	if (oob_required)
-		sunxi_nfc_hw_ecc_read_extra_oob(mtd, nand->oob_poi,
+		sunxi_nfc_hw_ecc_read_extra_oob(nand, nand->oob_poi,
 						NULL, !raw_mode,
 						page);
 
 	return max_bitflips;
 }
 
-static int sunxi_nfc_hw_ecc_write_chunk(struct mtd_info *mtd,
+static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 					const u8 *data, int data_off,
 					const u8 *oob, int oob_off,
 					int *cur_off, bool bbm,
 					int page)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret;
@@ -1137,7 +1126,7 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct mtd_info *mtd,
 	if (data_off != *cur_off)
 		nand_change_write_column_op(nand, data_off, NULL, 0, false);
 
-	sunxi_nfc_randomizer_write_buf(mtd, data, ecc->size, false, page);
+	sunxi_nfc_randomizer_write_buf(nand, data, ecc->size, false, page);
 
 	if (data_off + ecc->size != oob_off)
 		nand_change_write_column_op(nand, oob_off, NULL, 0, false);
@@ -1146,15 +1135,15 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct mtd_info *mtd,
 	if (ret)
 		return ret;
 
-	sunxi_nfc_randomizer_enable(mtd);
-	sunxi_nfc_hw_ecc_set_prot_oob_bytes(mtd, oob, 0, bbm, page);
+	sunxi_nfc_randomizer_enable(nand);
+	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, 0, bbm, page);
 
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD |
 	       NFC_ACCESS_DIR | NFC_ECC_OP,
 	       nfc->regs + NFC_REG_CMD);
 
 	ret = sunxi_nfc_wait_events(nfc, NFC_CMD_INT_FLAG, false, 0);
-	sunxi_nfc_randomizer_disable(mtd);
+	sunxi_nfc_randomizer_disable(nand);
 	if (ret)
 		return ret;
 
@@ -1163,11 +1152,11 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct mtd_info *mtd,
 	return 0;
 }
 
-static void sunxi_nfc_hw_ecc_write_extra_oob(struct mtd_info *mtd,
+static void sunxi_nfc_hw_ecc_write_extra_oob(struct nand_chip *nand,
 					     u8 *oob, int *cur_off,
 					     int page)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int offset = ((ecc->bytes + 4) * ecc->steps);
 	int len = mtd->oobsize - offset;
@@ -1179,7 +1168,7 @@ static void sunxi_nfc_hw_ecc_write_extra_oob(struct mtd_info *mtd,
 		nand_change_write_column_op(nand, offset + mtd->writesize,
 					    NULL, 0, false);
 
-	sunxi_nfc_randomizer_write_buf(mtd, oob + offset, len, false, page);
+	sunxi_nfc_randomizer_write_buf(nand, oob + offset, len, false, page);
 
 	if (cur_off)
 		*cur_off = mtd->oobsize + mtd->writesize;
@@ -1196,7 +1185,7 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 
 	nand_read_page_op(nand, page, 0, NULL, 0);
 
-	sunxi_nfc_hw_ecc_enable(mtd);
+	sunxi_nfc_hw_ecc_enable(nand);
 
 	for (i = 0; i < ecc->steps; i++) {
 		int data_off = i * ecc->size;
@@ -1204,7 +1193,7 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 		u8 *data = buf + data_off;
 		u8 *oob = nand->oob_poi + oob_off;
 
-		ret = sunxi_nfc_hw_ecc_read_chunk(mtd, data, data_off, oob,
+		ret = sunxi_nfc_hw_ecc_read_chunk(nand, data, data_off, oob,
 						  oob_off + mtd->writesize,
 						  &cur_off, &max_bitflips,
 						  !i, oob_required, page);
@@ -1215,10 +1204,10 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 	}
 
 	if (oob_required)
-		sunxi_nfc_hw_ecc_read_extra_oob(mtd, nand->oob_poi, &cur_off,
+		sunxi_nfc_hw_ecc_read_extra_oob(nand, nand->oob_poi, &cur_off,
 						!raw_mode, page);
 
-	sunxi_nfc_hw_ecc_disable(mtd);
+	sunxi_nfc_hw_ecc_disable(nand);
 
 	return max_bitflips;
 }
@@ -1226,12 +1215,11 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 					  int oob_required, int page)
 {
-	struct mtd_info *mtd = nand_to_mtd(nand);
 	int ret;
 
 	nand_read_page_op(nand, page, 0, NULL, 0);
 
-	ret = sunxi_nfc_hw_ecc_read_chunks_dma(mtd, buf, oob_required, page,
+	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, oob_required, page,
 					       nand->ecc.steps);
 	if (ret >= 0)
 		return ret;
@@ -1251,7 +1239,7 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 
 	nand_read_page_op(nand, page, 0, NULL, 0);
 
-	sunxi_nfc_hw_ecc_enable(mtd);
+	sunxi_nfc_hw_ecc_enable(nand);
 
 	for (i = data_offs / ecc->size;
 	     i < DIV_ROUND_UP(data_offs + readlen, ecc->size); i++) {
@@ -1260,7 +1248,7 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 		u8 *data = bufpoi + data_off;
 		u8 *oob = nand->oob_poi + oob_off;
 
-		ret = sunxi_nfc_hw_ecc_read_chunk(mtd, data, data_off,
+		ret = sunxi_nfc_hw_ecc_read_chunk(nand, data, data_off,
 						  oob,
 						  oob_off + mtd->writesize,
 						  &cur_off, &max_bitflips, !i,
@@ -1269,7 +1257,7 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 			return ret;
 	}
 
-	sunxi_nfc_hw_ecc_disable(mtd);
+	sunxi_nfc_hw_ecc_disable(nand);
 
 	return max_bitflips;
 }
@@ -1278,13 +1266,12 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 					     u32 data_offs, u32 readlen,
 					     u8 *buf, int page)
 {
-	struct mtd_info *mtd = nand_to_mtd(nand);
 	int nchunks = DIV_ROUND_UP(data_offs + readlen, nand->ecc.size);
 	int ret;
 
 	nand_read_page_op(nand, page, 0, NULL, 0);
 
-	ret = sunxi_nfc_hw_ecc_read_chunks_dma(mtd, buf, false, page, nchunks);
+	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, false, page, nchunks);
 	if (ret >= 0)
 		return ret;
 
@@ -1303,7 +1290,7 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 
 	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 
-	sunxi_nfc_hw_ecc_enable(mtd);
+	sunxi_nfc_hw_ecc_enable(nand);
 
 	for (i = 0; i < ecc->steps; i++) {
 		int data_off = i * ecc->size;
@@ -1311,7 +1298,7 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 		const u8 *data = buf + data_off;
 		const u8 *oob = nand->oob_poi + oob_off;
 
-		ret = sunxi_nfc_hw_ecc_write_chunk(mtd, data, data_off, oob,
+		ret = sunxi_nfc_hw_ecc_write_chunk(nand, data, data_off, oob,
 						   oob_off + mtd->writesize,
 						   &cur_off, !i, page);
 		if (ret)
@@ -1319,10 +1306,10 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	}
 
 	if (oob_required || (nand->options & NAND_NEED_SCRAMBLING))
-		sunxi_nfc_hw_ecc_write_extra_oob(mtd, nand->oob_poi,
+		sunxi_nfc_hw_ecc_write_extra_oob(nand, nand->oob_poi,
 						 &cur_off, page);
 
-	sunxi_nfc_hw_ecc_disable(mtd);
+	sunxi_nfc_hw_ecc_disable(nand);
 
 	return nand_prog_page_end_op(nand);
 }
@@ -1338,7 +1325,7 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 
 	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 
-	sunxi_nfc_hw_ecc_enable(mtd);
+	sunxi_nfc_hw_ecc_enable(nand);
 
 	for (i = data_offs / ecc->size;
 	     i < DIV_ROUND_UP(data_offs + data_len, ecc->size); i++) {
@@ -1347,14 +1334,14 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 		const u8 *data = buf + data_off;
 		const u8 *oob = nand->oob_poi + oob_off;
 
-		ret = sunxi_nfc_hw_ecc_write_chunk(mtd, data, data_off, oob,
+		ret = sunxi_nfc_hw_ecc_write_chunk(nand, data, data_off, oob,
 						   oob_off + mtd->writesize,
 						   &cur_off, !i, page);
 		if (ret)
 			return ret;
 	}
 
-	sunxi_nfc_hw_ecc_disable(mtd);
+	sunxi_nfc_hw_ecc_disable(nand);
 
 	return nand_prog_page_end_op(nand);
 }
@@ -1364,7 +1351,6 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 					   int oob_required,
 					   int page)
 {
-	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	struct scatterlist sg;
@@ -1374,7 +1360,7 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 	if (ret)
 		return ret;
 
-	ret = sunxi_nfc_dma_op_prepare(mtd, buf, ecc->size, ecc->steps,
+	ret = sunxi_nfc_dma_op_prepare(nfc, buf, ecc->size, ecc->steps,
 				       DMA_TO_DEVICE, &sg);
 	if (ret)
 		goto pio_fallback;
@@ -1382,14 +1368,14 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 	for (i = 0; i < ecc->steps; i++) {
 		const u8 *oob = nand->oob_poi + (i * (ecc->bytes + 4));
 
-		sunxi_nfc_hw_ecc_set_prot_oob_bytes(mtd, oob, i, !i, page);
+		sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, i, !i, page);
 	}
 
 	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 
-	sunxi_nfc_hw_ecc_enable(mtd);
-	sunxi_nfc_randomizer_config(mtd, page, false);
-	sunxi_nfc_randomizer_enable(mtd);
+	sunxi_nfc_hw_ecc_enable(nand);
+	sunxi_nfc_randomizer_config(nand, page, false);
+	sunxi_nfc_randomizer_enable(nand);
 
 	writel((NAND_CMD_RNDIN << 8) | NAND_CMD_PAGEPROG,
 	       nfc->regs + NFC_REG_RCMD_SET);
@@ -1404,17 +1390,17 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 	if (ret)
 		dmaengine_terminate_all(nfc->dmac);
 
-	sunxi_nfc_randomizer_disable(mtd);
-	sunxi_nfc_hw_ecc_disable(mtd);
+	sunxi_nfc_randomizer_disable(nand);
+	sunxi_nfc_hw_ecc_disable(nand);
 
-	sunxi_nfc_dma_op_cleanup(mtd, DMA_TO_DEVICE, &sg);
+	sunxi_nfc_dma_op_cleanup(nfc, DMA_TO_DEVICE, &sg);
 
 	if (ret)
 		return ret;
 
 	if (oob_required || (nand->options & NAND_NEED_SCRAMBLING))
 		/* TODO: use DMA to transfer extra OOB bytes ? */
-		sunxi_nfc_hw_ecc_write_extra_oob(mtd, nand->oob_poi,
+		sunxi_nfc_hw_ecc_write_extra_oob(nand, nand->oob_poi,
 						 NULL, page);
 
 	return nand_prog_page_end_op(nand);
@@ -1677,14 +1663,13 @@ static void sunxi_nand_hw_ecc_ctrl_cleanup(struct nand_ecc_ctrl *ecc)
 	kfree(ecc->priv);
 }
 
-static int sunxi_nand_hw_ecc_ctrl_init(struct mtd_info *mtd,
+static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 				       struct nand_ecc_ctrl *ecc,
 				       struct device_node *np)
 {
 	static const u8 strengths[] = { 16, 24, 28, 32, 40, 48, 56, 60, 64 };
-	struct nand_chip *nand = mtd_to_nand(mtd);
-	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	struct sunxi_nfc *nfc = to_sunxi_nfc(sunxi_nand->nand.controller);
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct sunxi_nand_hw_ecc *data;
 	int nsectors;
 	int ret;
@@ -1808,7 +1793,6 @@ static void sunxi_nand_ecc_cleanup(struct nand_ecc_ctrl *ecc)
 
 static int sunxi_nand_attach_chip(struct nand_chip *nand)
 {
-	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	struct device_node *np = nand_get_flash_node(nand);
 	int ret;
@@ -1831,7 +1815,7 @@ static int sunxi_nand_attach_chip(struct nand_chip *nand)
 
 	switch (ecc->mode) {
 	case NAND_ECC_HW:
-		ret = sunxi_nand_hw_ecc_ctrl_init(mtd, ecc, np);
+		ret = sunxi_nand_hw_ecc_ctrl_init(nand, ecc, np);
 		if (ret)
 			return ret;
 		break;
-- 
2.17.1
