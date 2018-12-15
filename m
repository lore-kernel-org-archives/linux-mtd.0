Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gY5Fw-0006sw-OD
 for linux-mtd@lists.infradead.org; Sat, 15 Dec 2018 08:25:28 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH v2 6/7] mtd: rawnand: sunxi: Migrate to ->exec_op()
Date: Sat, 15 Dec 2018 09:24:36 +0100
Message-Id: <20181215082437.9175-7-boris.brezillon@bootlin.com>
In-Reply-To: <20181215082437.9175-1-boris.brezillon@bootlin.com>
References: <20181215082437.9175-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

And get rif of all legacy hooks and unused fields.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 294 ++++++++++++++++++------------
 1 file changed, 174 insertions(+), 120 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 9b09c7083d76..d6b07067ed26 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -183,7 +183,6 @@ struct sunxi_nand_hw_ecc {
  * @mtd:		base MTD structure
  * @clk_rate:		clk_rate required for this NAND chip
  * @timing_cfg		TIMING_CFG register value for this NAND chip
- * @selected:		current active CS
  * @nsels:		number of CS lines required by the NAND chip
  * @sels:		array of CS lines descriptions
  */
@@ -193,11 +192,6 @@ struct sunxi_nand_chip {
 	unsigned long clk_rate;
 	u32 timing_cfg;
 	u32 timing_ctl;
-	int selected;
-	int addr_cycles;
-	u32 addr[2];
-	int cmd_cycles;
-	u8 cmd[2];
 	int nsels;
 	struct sunxi_nand_chip_sel sels[0];
 };
@@ -386,26 +380,7 @@ static void sunxi_nfc_dma_op_cleanup(struct sunxi_nfc *nfc,
 	       nfc->regs + NFC_REG_CTL);
 }
 
-static int sunxi_nfc_dev_ready(struct nand_chip *nand)
-{
-	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	struct sunxi_nfc *nfc = to_sunxi_nfc(sunxi_nand->nand.controller);
-	u32 mask;
-
-	if (sunxi_nand->selected < 0)
-		return 0;
-
-	if (sunxi_nand->sels[sunxi_nand->selected].rb < 0) {
-		dev_err(nfc->dev, "cannot check R/B NAND status!\n");
-		return 0;
-	}
-
-	mask = NFC_RB_STATE(sunxi_nand->sels[sunxi_nand->selected].rb);
-
-	return !!(readl(nfc->regs + NFC_REG_ST) & mask);
-}
-
-static void sunxi_nfc_select_chip(struct nand_chip *nand, int chip)
+static void sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
 {
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
@@ -413,40 +388,27 @@ static void sunxi_nfc_select_chip(struct nand_chip *nand, int chip)
 	struct sunxi_nand_chip_sel *sel;
 	u32 ctl;
 
-	if (chip > 0 && chip >= sunxi_nand->nsels)
-		return;
-
-	if (chip == sunxi_nand->selected)
+	if (cs > 0 && cs >= sunxi_nand->nsels)
 		return;
 
 	ctl = readl(nfc->regs + NFC_REG_CTL) &
 	      ~(NFC_PAGE_SHIFT_MSK | NFC_CE_SEL_MSK | NFC_RB_SEL_MSK | NFC_EN);
 
-	if (chip >= 0) {
-		sel = &sunxi_nand->sels[chip];
+	sel = &sunxi_nand->sels[cs];
+	ctl |= NFC_CE_SEL(sel->cs) | NFC_EN | NFC_PAGE_SHIFT(nand->page_shift);
+	if (sel->rb >= 0)
+		ctl |= NFC_RB_SEL(sel->rb);
 
-		ctl |= NFC_CE_SEL(sel->cs) | NFC_EN |
-		       NFC_PAGE_SHIFT(nand->page_shift);
-		if (sel->rb < 0) {
-			nand->legacy.dev_ready = NULL;
-		} else {
-			nand->legacy.dev_ready = sunxi_nfc_dev_ready;
-			ctl |= NFC_RB_SEL(sel->rb);
-		}
+	writel(mtd->writesize, nfc->regs + NFC_REG_SPARE_AREA);
 
-		writel(mtd->writesize, nfc->regs + NFC_REG_SPARE_AREA);
-
-		if (nfc->clk_rate != sunxi_nand->clk_rate) {
-			clk_set_rate(nfc->mod_clk, sunxi_nand->clk_rate);
-			nfc->clk_rate = sunxi_nand->clk_rate;
-		}
+	if (nfc->clk_rate != sunxi_nand->clk_rate) {
+		clk_set_rate(nfc->mod_clk, sunxi_nand->clk_rate);
+		nfc->clk_rate = sunxi_nand->clk_rate;
 	}
 
 	writel(sunxi_nand->timing_ctl, nfc->regs + NFC_REG_TIMING_CTL);
 	writel(sunxi_nand->timing_cfg, nfc->regs + NFC_REG_TIMING_CFG);
 	writel(ctl, nfc->regs + NFC_REG_CTL);
-
-	sunxi_nand->selected = chip;
 }
 
 static void sunxi_nfc_read_buf(struct nand_chip *nand, uint8_t *buf, int len)
@@ -523,71 +485,6 @@ static void sunxi_nfc_write_buf(struct nand_chip *nand, const uint8_t *buf,
 	}
 }
 
-static uint8_t sunxi_nfc_read_byte(struct nand_chip *nand)
-{
-	uint8_t ret = 0;
-
-	sunxi_nfc_read_buf(nand, &ret, 1);
-
-	return ret;
-}
-
-static void sunxi_nfc_cmd_ctrl(struct nand_chip *nand, int dat,
-			       unsigned int ctrl)
-{
-	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	struct sunxi_nfc *nfc = to_sunxi_nfc(sunxi_nand->nand.controller);
-	int ret;
-
-	if (dat == NAND_CMD_NONE && (ctrl & NAND_NCE) &&
-	    !(ctrl & (NAND_CLE | NAND_ALE))) {
-		u32 cmd = 0;
-
-		if (!sunxi_nand->addr_cycles && !sunxi_nand->cmd_cycles)
-			return;
-
-		if (sunxi_nand->cmd_cycles--)
-			cmd |= NFC_SEND_CMD1 | sunxi_nand->cmd[0];
-
-		if (sunxi_nand->cmd_cycles--) {
-			cmd |= NFC_SEND_CMD2;
-			writel(sunxi_nand->cmd[1],
-			       nfc->regs + NFC_REG_RCMD_SET);
-		}
-
-		sunxi_nand->cmd_cycles = 0;
-
-		if (sunxi_nand->addr_cycles) {
-			cmd |= NFC_SEND_ADR |
-			       NFC_ADR_NUM(sunxi_nand->addr_cycles);
-			writel(sunxi_nand->addr[0],
-			       nfc->regs + NFC_REG_ADDR_LOW);
-		}
-
-		if (sunxi_nand->addr_cycles > 4)
-			writel(sunxi_nand->addr[1],
-			       nfc->regs + NFC_REG_ADDR_HIGH);
-
-		ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
-		if (ret)
-			return;
-
-		writel(cmd, nfc->regs + NFC_REG_CMD);
-		sunxi_nand->addr[0] = 0;
-		sunxi_nand->addr[1] = 0;
-		sunxi_nand->addr_cycles = 0;
-		sunxi_nfc_wait_events(nfc, NFC_CMD_INT_FLAG, true, 0);
-	}
-
-	if (ctrl & NAND_CLE) {
-		sunxi_nand->cmd[sunxi_nand->cmd_cycles++] = dat;
-	} else if (ctrl & NAND_ALE) {
-		sunxi_nand->addr[sunxi_nand->addr_cycles / 4] |=
-				dat << ((sunxi_nand->addr_cycles % 4) * 8);
-		sunxi_nand->addr_cycles++;
-	}
-}
-
 /* These seed values have been extracted from Allwinner's BSP */
 static const u16 sunxi_nfc_randomizer_page_seeds[] = {
 	0x2b75, 0x0bd0, 0x5ca3, 0x62d1, 0x1c93, 0x07e9, 0x2162, 0x3a72,
@@ -1174,6 +1071,8 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 	int ret, i, cur_off = 0;
 	bool raw_mode = false;
 
+	sunxi_nfc_select_chip(nand, nand->cur_cs);
+
 	nand_read_page_op(nand, page, 0, NULL, 0);
 
 	sunxi_nfc_hw_ecc_enable(nand);
@@ -1208,6 +1107,8 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 {
 	int ret;
 
+	sunxi_nfc_select_chip(nand, nand->cur_cs);
+
 	nand_read_page_op(nand, page, 0, NULL, 0);
 
 	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, oob_required, page,
@@ -1228,6 +1129,8 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 	int ret, i, cur_off = 0;
 	unsigned int max_bitflips = 0;
 
+	sunxi_nfc_select_chip(nand, nand->cur_cs);
+
 	nand_read_page_op(nand, page, 0, NULL, 0);
 
 	sunxi_nfc_hw_ecc_enable(nand);
@@ -1260,6 +1163,8 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 	int nchunks = DIV_ROUND_UP(data_offs + readlen, nand->ecc.size);
 	int ret;
 
+	sunxi_nfc_select_chip(nand, nand->cur_cs);
+
 	nand_read_page_op(nand, page, 0, NULL, 0);
 
 	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, false, page, nchunks);
@@ -1279,6 +1184,8 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret, i, cur_off = 0;
 
+	sunxi_nfc_select_chip(nand, nand->cur_cs);
+
 	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 
 	sunxi_nfc_hw_ecc_enable(nand);
@@ -1314,6 +1221,8 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret, i, cur_off = 0;
 
+	sunxi_nfc_select_chip(nand, nand->cur_cs);
+
 	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 
 	sunxi_nfc_hw_ecc_enable(nand);
@@ -1347,6 +1256,8 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 	struct scatterlist sg;
 	int ret, i;
 
+	sunxi_nfc_select_chip(nand, nand->cur_cs);
+
 	ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
 	if (ret)
 		return ret;
@@ -1820,9 +1731,159 @@ static int sunxi_nand_attach_chip(struct nand_chip *nand)
 	return 0;
 }
 
+static int sunxi_nfc_exec_subop(struct nand_chip *nand,
+				const struct nand_subop *subop)
+{
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	u32 cmd = 0, extcmd = 0, cnt = 0, addrs[2] = { };
+	unsigned int i, j, remaining, start;
+	void *inbuf = NULL;
+	int ret;
+
+	for (i = 0; i < subop->ninstrs; i++) {
+		const struct nand_op_instr *instr = &subop->instrs[i];
+
+		switch (instr->type) {
+		case NAND_OP_CMD_INSTR:
+			if (cmd & NFC_SEND_CMD1) {
+				if (WARN_ON(cmd & NFC_SEND_CMD2))
+					return -EINVAL;
+
+				cmd |= NFC_SEND_CMD2;
+				extcmd |= instr->ctx.cmd.opcode;
+			} else {
+				cmd |= NFC_SEND_CMD1 |
+				       NFC_CMD(instr->ctx.cmd.opcode);
+			}
+			break;
+
+		case NAND_OP_ADDR_INSTR:
+			remaining = nand_subop_get_num_addr_cyc(subop, i);
+			start = nand_subop_get_addr_start_off(subop, i);
+			for (j = 0; j < 8 && j + start < remaining; j++) {
+				u32 addr = instr->ctx.addr.addrs[j + start];
+
+				addrs[j / 4] |= addr << (j % 4) * 8;
+			}
+
+			if (j)
+				cmd |= NFC_SEND_ADR | NFC_ADR_NUM(j);
+
+			break;
+
+		case NAND_OP_DATA_IN_INSTR:
+		case NAND_OP_DATA_OUT_INSTR:
+			start = nand_subop_get_data_start_off(subop, i);
+			remaining = nand_subop_get_data_len(subop, i);
+			cnt = min_t(u32, remaining, NFC_SRAM_SIZE);
+			cmd |= NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD;
+
+			if (instr->type == NAND_OP_DATA_OUT_INSTR) {
+				cmd |= NFC_ACCESS_DIR;
+				memcpy_toio(nfc->regs + NFC_RAM0_BASE,
+					    instr->ctx.data.buf.out + start,
+					    cnt);
+			} else {
+				inbuf = instr->ctx.data.buf.in + start;
+			}
+
+			break;
+
+		case NAND_OP_WAITRDY_INSTR:
+			cmd |= NFC_WAIT_FLAG;
+			break;
+		}
+	}
+
+	ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
+	if (ret)
+		return ret;
+
+	if (cmd & NFC_SEND_ADR) {
+		writel(addrs[0], nfc->regs + NFC_REG_ADDR_LOW);
+		writel(addrs[1], nfc->regs + NFC_REG_ADDR_HIGH);
+	}
+
+	if (cmd & NFC_SEND_CMD2)
+		writel(extcmd,
+		       nfc->regs +
+		       (cmd & NFC_ACCESS_DIR ?
+			NFC_REG_WCMD_SET : NFC_REG_RCMD_SET));
+
+	if (cmd & NFC_DATA_TRANS)
+		writel(cnt, nfc->regs + NFC_REG_CNT);
+
+	writel(cmd, nfc->regs + NFC_REG_CMD);
+
+	ret = sunxi_nfc_wait_events(nfc, NFC_CMD_INT_FLAG,
+				    !(cmd & NFC_WAIT_FLAG) && cnt < 64,
+				    0);
+	if (ret)
+		return ret;
+
+	if (inbuf)
+		memcpy_fromio(inbuf, nfc->regs + NFC_RAM0_BASE, cnt);
+
+	return 0;
+}
+
+static int sunxi_nfc_soft_waitrdy(struct nand_chip *nand,
+				  const struct nand_subop *subop)
+{
+	return nand_soft_waitrdy(nand,
+				 subop->instrs[0].ctx.waitrdy.timeout_ms);
+}
+
+static const struct nand_op_parser sunxi_nfc_op_parser = NAND_OP_PARSER(
+	NAND_OP_PARSER_PATTERN(sunxi_nfc_exec_subop,
+			       NAND_OP_PARSER_PAT_CMD_ELEM(true),
+			       NAND_OP_PARSER_PAT_ADDR_ELEM(true, 8),
+			       NAND_OP_PARSER_PAT_CMD_ELEM(true),
+			       NAND_OP_PARSER_PAT_WAITRDY_ELEM(true),
+			       NAND_OP_PARSER_PAT_DATA_IN_ELEM(true, 1024)),
+	NAND_OP_PARSER_PATTERN(sunxi_nfc_exec_subop,
+			       NAND_OP_PARSER_PAT_CMD_ELEM(true),
+			       NAND_OP_PARSER_PAT_ADDR_ELEM(true, 8),
+			       NAND_OP_PARSER_PAT_DATA_OUT_ELEM(true, 1024),
+			       NAND_OP_PARSER_PAT_CMD_ELEM(true),
+			       NAND_OP_PARSER_PAT_WAITRDY_ELEM(true)),
+);
+
+static const struct nand_op_parser sunxi_nfc_norb_op_parser = NAND_OP_PARSER(
+	NAND_OP_PARSER_PATTERN(sunxi_nfc_exec_subop,
+			       NAND_OP_PARSER_PAT_CMD_ELEM(true),
+			       NAND_OP_PARSER_PAT_ADDR_ELEM(true, 8),
+			       NAND_OP_PARSER_PAT_CMD_ELEM(true),
+			       NAND_OP_PARSER_PAT_DATA_IN_ELEM(true, 1024)),
+	NAND_OP_PARSER_PATTERN(sunxi_nfc_exec_subop,
+			       NAND_OP_PARSER_PAT_CMD_ELEM(true),
+			       NAND_OP_PARSER_PAT_ADDR_ELEM(true, 8),
+			       NAND_OP_PARSER_PAT_DATA_OUT_ELEM(true, 1024),
+			       NAND_OP_PARSER_PAT_CMD_ELEM(true)),
+	NAND_OP_PARSER_PATTERN(sunxi_nfc_soft_waitrdy,
+			       NAND_OP_PARSER_PAT_WAITRDY_ELEM(false)),
+);
+
+static int sunxi_nfc_exec_op(struct nand_chip *nand,
+			     const struct nand_operation *op, bool check_only)
+{
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	const struct nand_op_parser *parser;
+
+	sunxi_nfc_select_chip(nand, op->cs);
+
+	if (sunxi_nand->sels[op->cs].rb >= 0)
+		parser = &sunxi_nfc_op_parser;
+	else
+		parser = &sunxi_nfc_norb_op_parser;
+
+	return nand_op_parser_exec_op(nand, parser, op, check_only);
+}
+
 static const struct nand_controller_ops sunxi_nand_controller_ops = {
 	.attach_chip = sunxi_nand_attach_chip,
 	.setup_data_interface = sunxi_nfc_setup_data_interface,
+	.exec_op = sunxi_nfc_exec_op,
 };
 
 static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
@@ -1853,7 +1914,6 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 	}
 
 	sunxi_nand->nsels = nsels;
-	sunxi_nand->selected = -1;
 
 	for (i = 0; i < nsels; i++) {
 		ret = of_property_read_u32_index(np, "reg", i, &tmp);
@@ -1886,7 +1946,6 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 
 	nand = &sunxi_nand->nand;
 	/* Default tR value specified in the ONFI spec (chapter 4.15.1) */
-	nand->legacy.chip_delay = 200;
 	nand->controller = &nfc->controller;
 	nand->controller->ops = &sunxi_nand_controller_ops;
 
@@ -1896,11 +1955,6 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 	 */
 	nand->ecc.mode = NAND_ECC_HW;
 	nand_set_flash_node(nand, np);
-	nand->legacy.select_chip = sunxi_nfc_select_chip;
-	nand->legacy.cmd_ctrl = sunxi_nfc_cmd_ctrl;
-	nand->legacy.read_buf = sunxi_nfc_read_buf;
-	nand->legacy.write_buf = sunxi_nfc_write_buf;
-	nand->legacy.read_byte = sunxi_nfc_read_byte;
 
 	mtd = nand_to_mtd(nand);
 	mtd->dev.parent = dev;
-- 
2.17.1
