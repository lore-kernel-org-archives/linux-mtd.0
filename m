Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eEdQS-0002Sh-2e
 for linux-mtd@lists.infradead.org; Tue, 14 Nov 2017 15:47:08 +0000
From: Miquel Raynal <miquel.raynal@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org,
 Quentin Schulz <quentin.schulz@free-electrons.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Miquel Raynal <miquel.raynal@free-electrons.com>
Subject: [PATCH 1/3] mtd: nand: fsmc: use ->exec_op()
Date: Tue, 14 Nov 2017 16:46:20 +0100
Message-Id: <20171114154622.5493-2-miquel.raynal@free-electrons.com>
In-Reply-To: <20171114154622.5493-1-miquel.raynal@free-electrons.com>
References: <20171114154622.5493-1-miquel.raynal@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Remove the decrecated ->cmd_ctrl() implementation to use ->exec_op() in
the fsmc_nand driver.

Implement the ->select_chip() hook to avoid having to support the hack
from the core that send a NAND_CMD_NONE with NAND_NCE to signal a
deassertion of nCE.

Also remove the use of IO_ADDR_[R|W] in this driver and use a pointer to
the control registers to avoid doing several arithmetic operations
(including a multiplication) each time a control register is read or
written.

Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
---
 drivers/mtd/nand/fsmc_nand.c | 234 ++++++++++++++++++++++++-------------------
 1 file changed, 132 insertions(+), 102 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index b44e5c6545e0..76246d904c28 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -103,10 +103,6 @@
 #define ECC3			0x1C
 #define FSMC_NAND_BANK_SZ	0x20
 
-#define FSMC_NAND_REG(base, bank, reg)		(base + FSMC_NOR_REG_SIZE + \
-						(FSMC_NAND_BANK_SZ * (bank)) + \
-						reg)
-
 #define FSMC_BUSY_WAIT_TIMEOUT	(1 * HZ)
 
 struct fsmc_nand_timings {
@@ -144,6 +140,7 @@ enum access_mode {
  * @cmd_va:		NAND port for Command.
  * @addr_va:		NAND port for Address.
  * @regs_va:		FSMC regs base address.
+ * @regs:		Registers base address for a given bank.
  */
 struct fsmc_nand_data {
 	u32			pid;
@@ -166,6 +163,7 @@ struct fsmc_nand_data {
 	void __iomem		*cmd_va;
 	void __iomem		*addr_va;
 	void __iomem		*regs_va;
+	void __iomem		*regs;
 };
 
 static int fsmc_ecc1_ooblayout_ecc(struct mtd_info *mtd, int section,
@@ -258,45 +256,6 @@ static inline struct fsmc_nand_data *mtd_to_fsmc(struct mtd_info *mtd)
 }
 
 /*
- * fsmc_cmd_ctrl - For facilitaing Hardware access
- * This routine allows hardware specific access to control-lines(ALE,CLE)
- */
-static void fsmc_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
-{
-	struct nand_chip *this = mtd_to_nand(mtd);
-	struct fsmc_nand_data *host = mtd_to_fsmc(mtd);
-	void __iomem *regs = host->regs_va;
-	unsigned int bank = host->bank;
-
-	if (ctrl & NAND_CTRL_CHANGE) {
-		u32 pc;
-
-		if (ctrl & NAND_CLE) {
-			this->IO_ADDR_R = host->cmd_va;
-			this->IO_ADDR_W = host->cmd_va;
-		} else if (ctrl & NAND_ALE) {
-			this->IO_ADDR_R = host->addr_va;
-			this->IO_ADDR_W = host->addr_va;
-		} else {
-			this->IO_ADDR_R = host->data_va;
-			this->IO_ADDR_W = host->data_va;
-		}
-
-		pc = readl(FSMC_NAND_REG(regs, bank, PC));
-		if (ctrl & NAND_NCE)
-			pc |= FSMC_ENABLE;
-		else
-			pc &= ~FSMC_ENABLE;
-		writel_relaxed(pc, FSMC_NAND_REG(regs, bank, PC));
-	}
-
-	mb();
-
-	if (cmd != NAND_CMD_NONE)
-		writeb_relaxed(cmd, this->IO_ADDR_W);
-}
-
-/*
  * fsmc_nand_setup - FSMC (Flexible Static Memory Controller) init routine
  *
  * This routine initializes timing parameters related to NAND memory access in
@@ -307,8 +266,6 @@ static void fsmc_nand_setup(struct fsmc_nand_data *host,
 {
 	uint32_t value = FSMC_DEVTYPE_NAND | FSMC_ENABLE | FSMC_WAITON;
 	uint32_t tclr, tar, thiz, thold, twait, tset;
-	unsigned int bank = host->bank;
-	void __iomem *regs = host->regs_va;
 
 	tclr = (tims->tclr & FSMC_TCLR_MASK) << FSMC_TCLR_SHIFT;
 	tar = (tims->tar & FSMC_TAR_MASK) << FSMC_TAR_SHIFT;
@@ -318,18 +275,13 @@ static void fsmc_nand_setup(struct fsmc_nand_data *host,
 	tset = (tims->tset & FSMC_TSET_MASK) << FSMC_TSET_SHIFT;
 
 	if (host->nand.options & NAND_BUSWIDTH_16)
-		writel_relaxed(value | FSMC_DEVWID_16,
-				FSMC_NAND_REG(regs, bank, PC));
+		writel_relaxed(value | FSMC_DEVWID_16, host->regs + PC);
 	else
-		writel_relaxed(value | FSMC_DEVWID_8,
-				FSMC_NAND_REG(regs, bank, PC));
-
-	writel_relaxed(readl(FSMC_NAND_REG(regs, bank, PC)) | tclr | tar,
-			FSMC_NAND_REG(regs, bank, PC));
-	writel_relaxed(thiz | thold | twait | tset,
-			FSMC_NAND_REG(regs, bank, COMM));
-	writel_relaxed(thiz | thold | twait | tset,
-			FSMC_NAND_REG(regs, bank, ATTRIB));
+		writel_relaxed(value | FSMC_DEVWID_8, host->regs + PC);
+
+	writel_relaxed(readl(host->regs + PC) | tclr | tar, host->regs + PC);
+	writel_relaxed(thiz | thold | twait | tset, host->regs + COMM);
+	writel_relaxed(thiz | thold | twait | tset, host->regs + ATTRIB);
 }
 
 static int fsmc_calc_timings(struct fsmc_nand_data *host,
@@ -419,15 +371,11 @@ static int fsmc_setup_data_interface(struct mtd_info *mtd, int csline,
 static void fsmc_enable_hwecc(struct mtd_info *mtd, int mode)
 {
 	struct fsmc_nand_data *host = mtd_to_fsmc(mtd);
-	void __iomem *regs = host->regs_va;
-	uint32_t bank = host->bank;
-
-	writel_relaxed(readl(FSMC_NAND_REG(regs, bank, PC)) & ~FSMC_ECCPLEN_256,
-			FSMC_NAND_REG(regs, bank, PC));
-	writel_relaxed(readl(FSMC_NAND_REG(regs, bank, PC)) & ~FSMC_ECCEN,
-			FSMC_NAND_REG(regs, bank, PC));
-	writel_relaxed(readl(FSMC_NAND_REG(regs, bank, PC)) | FSMC_ECCEN,
-			FSMC_NAND_REG(regs, bank, PC));
+
+	writel_relaxed(readl(host->regs + PC) & ~FSMC_ECCPLEN_256,
+		       host->regs + PC);
+	writel_relaxed(readl(host->regs + PC) & ~FSMC_ECCEN, host->regs + PC);
+	writel_relaxed(readl(host->regs + PC) | FSMC_ECCEN, host->regs + PC);
 }
 
 /*
@@ -439,13 +387,11 @@ static int fsmc_read_hwecc_ecc4(struct mtd_info *mtd, const uint8_t *data,
 				uint8_t *ecc)
 {
 	struct fsmc_nand_data *host = mtd_to_fsmc(mtd);
-	void __iomem *regs = host->regs_va;
-	uint32_t bank = host->bank;
 	uint32_t ecc_tmp;
 	unsigned long deadline = jiffies + FSMC_BUSY_WAIT_TIMEOUT;
 
 	do {
-		if (readl_relaxed(FSMC_NAND_REG(regs, bank, STS)) & FSMC_CODE_RDY)
+		if (readl_relaxed(host->regs + STS) & FSMC_CODE_RDY)
 			break;
 		else
 			cond_resched();
@@ -456,25 +402,25 @@ static int fsmc_read_hwecc_ecc4(struct mtd_info *mtd, const uint8_t *data,
 		return -ETIMEDOUT;
 	}
 
-	ecc_tmp = readl_relaxed(FSMC_NAND_REG(regs, bank, ECC1));
+	ecc_tmp = readl_relaxed(host->regs + ECC1);
 	ecc[0] = (uint8_t) (ecc_tmp >> 0);
 	ecc[1] = (uint8_t) (ecc_tmp >> 8);
 	ecc[2] = (uint8_t) (ecc_tmp >> 16);
 	ecc[3] = (uint8_t) (ecc_tmp >> 24);
 
-	ecc_tmp = readl_relaxed(FSMC_NAND_REG(regs, bank, ECC2));
+	ecc_tmp = readl_relaxed(host->regs + ECC2);
 	ecc[4] = (uint8_t) (ecc_tmp >> 0);
 	ecc[5] = (uint8_t) (ecc_tmp >> 8);
 	ecc[6] = (uint8_t) (ecc_tmp >> 16);
 	ecc[7] = (uint8_t) (ecc_tmp >> 24);
 
-	ecc_tmp = readl_relaxed(FSMC_NAND_REG(regs, bank, ECC3));
+	ecc_tmp = readl_relaxed(host->regs + ECC3);
 	ecc[8] = (uint8_t) (ecc_tmp >> 0);
 	ecc[9] = (uint8_t) (ecc_tmp >> 8);
 	ecc[10] = (uint8_t) (ecc_tmp >> 16);
 	ecc[11] = (uint8_t) (ecc_tmp >> 24);
 
-	ecc_tmp = readl_relaxed(FSMC_NAND_REG(regs, bank, STS));
+	ecc_tmp = readl_relaxed(host->regs + STS);
 	ecc[12] = (uint8_t) (ecc_tmp >> 16);
 
 	return 0;
@@ -489,11 +435,9 @@ static int fsmc_read_hwecc_ecc1(struct mtd_info *mtd, const uint8_t *data,
 				uint8_t *ecc)
 {
 	struct fsmc_nand_data *host = mtd_to_fsmc(mtd);
-	void __iomem *regs = host->regs_va;
-	uint32_t bank = host->bank;
 	uint32_t ecc_tmp;
 
-	ecc_tmp = readl_relaxed(FSMC_NAND_REG(regs, bank, ECC1));
+	ecc_tmp = readl_relaxed(host->regs + ECC1);
 	ecc[0] = (uint8_t) (ecc_tmp >> 0);
 	ecc[1] = (uint8_t) (ecc_tmp >> 8);
 	ecc[2] = (uint8_t) (ecc_tmp >> 16);
@@ -598,18 +542,18 @@ static int dma_xfer(struct fsmc_nand_data *host, void *buffer, int len,
  */
 static void fsmc_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
 {
+	struct fsmc_nand_data *host  = mtd_to_fsmc(mtd);
 	int i;
-	struct nand_chip *chip = mtd_to_nand(mtd);
 
 	if (IS_ALIGNED((uint32_t)buf, sizeof(uint32_t)) &&
 			IS_ALIGNED(len, sizeof(uint32_t))) {
 		uint32_t *p = (uint32_t *)buf;
 		len = len >> 2;
 		for (i = 0; i < len; i++)
-			writel_relaxed(p[i], chip->IO_ADDR_W);
+			writel_relaxed(p[i], host->data_va);
 	} else {
 		for (i = 0; i < len; i++)
-			writeb_relaxed(buf[i], chip->IO_ADDR_W);
+			writeb_relaxed(buf[i], host->data_va);
 	}
 }
 
@@ -621,18 +565,18 @@ static void fsmc_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
  */
 static void fsmc_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 {
+	struct fsmc_nand_data *host  = mtd_to_fsmc(mtd);
 	int i;
-	struct nand_chip *chip = mtd_to_nand(mtd);
 
 	if (IS_ALIGNED((uint32_t)buf, sizeof(uint32_t)) &&
 			IS_ALIGNED(len, sizeof(uint32_t))) {
 		uint32_t *p = (uint32_t *)buf;
 		len = len >> 2;
 		for (i = 0; i < len; i++)
-			p[i] = readl_relaxed(chip->IO_ADDR_R);
+			p[i] = readl_relaxed(host->data_va);
 	} else {
 		for (i = 0; i < len; i++)
-			buf[i] = readb_relaxed(chip->IO_ADDR_R);
+			buf[i] = readb_relaxed(host->data_va);
 	}
 }
 
@@ -663,6 +607,102 @@ static void fsmc_write_buf_dma(struct mtd_info *mtd, const uint8_t *buf,
 	dma_xfer(host, (void *)buf, len, DMA_TO_DEVICE);
 }
 
+/* fsmc_select_chip - assert or deassert nCE */
+static void fsmc_select_chip(struct mtd_info *mtd, int chipnr)
+{
+	struct fsmc_nand_data *host = mtd_to_fsmc(mtd);
+	u32 pc;
+
+	/* Support only one CS */
+	if (chipnr > 0)
+		return;
+
+	pc = readl(host->regs + PC);
+	if (chipnr < 0)
+		writel_relaxed(pc & ~FSMC_ENABLE, host->regs + PC);
+	else
+		writel_relaxed(pc | FSMC_ENABLE, host->regs + PC);
+
+	/* nCE line must be asserted before starting any operation */
+	mb();
+}
+
+/*
+ * fsmc_exec_op - hook called by the core to execute NAND operations
+ *
+ * This controller is simple enough and thus does not need to use the parser
+ * provided by the core, instead, handle every situation here.
+ */
+static int fsmc_exec_op(struct nand_chip *chip, const struct nand_operation *op,
+			bool check_only)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct fsmc_nand_data *host = mtd_to_fsmc(mtd);
+	const struct nand_op_instr *instr = NULL;
+	int ret = 0;
+	unsigned int op_id;
+	int i;
+
+	pr_debug("Executing operation [%d instructions]:\n", op->ninstrs);
+	for (op_id = 0; op_id < op->ninstrs; op_id++) {
+		instr = &op->instrs[op_id];
+
+		switch (instr->type) {
+		case NAND_OP_CMD_INSTR:
+			pr_debug("  ->CMD      [0x%02x]\n",
+				 instr->ctx.cmd.opcode);
+
+			writeb_relaxed(instr->ctx.cmd.opcode, host->cmd_va);
+			break;
+
+		case NAND_OP_ADDR_INSTR:
+			pr_debug("  ->ADDR     [%d cyc]",
+				 instr->ctx.addr.naddrs);
+
+			for (i = 0; i < instr->ctx.addr.naddrs; i++)
+				writeb_relaxed(instr->ctx.addr.addrs[i],
+					       host->addr_va);
+			break;
+
+		case NAND_OP_DATA_IN_INSTR:
+			pr_debug("  ->DATA_IN  [%d B%s]\n", instr->ctx.data.len,
+				 instr->ctx.data.force_8bit ?
+				 ", force 8-bit" : "");
+
+			if (host->mode == USE_DMA_ACCESS)
+				fsmc_read_buf_dma(mtd, instr->ctx.data.buf.in,
+						  instr->ctx.data.len);
+			else
+				fsmc_read_buf(mtd, instr->ctx.data.buf.in,
+					      instr->ctx.data.len);
+			break;
+
+		case NAND_OP_DATA_OUT_INSTR:
+			pr_debug("  ->DATA_OUT [%d B%s]\n", instr->ctx.data.len,
+				 instr->ctx.data.force_8bit ?
+				 ", force 8-bit" : "");
+
+			if (host->mode == USE_DMA_ACCESS)
+				fsmc_write_buf_dma(mtd, instr->ctx.data.buf.out,
+						   instr->ctx.data.len);
+			else
+				fsmc_write_buf(mtd, instr->ctx.data.buf.out,
+					       instr->ctx.data.len);
+			break;
+
+		case NAND_OP_WAITRDY_INSTR:
+			pr_debug("  ->WAITRDY  [max %d ms]\n",
+				 instr->ctx.waitrdy.timeout_ms);
+
+			ret = nand_soft_waitrdy(chip,
+						instr->ctx.waitrdy.timeout_ms);
+			break;
+		}
+	}
+
+	return ret;
+}
+
 /*
  * fsmc_read_page_hwecc
  * @mtd:	mtd info structure
@@ -754,13 +794,11 @@ static int fsmc_bch8_correct_data(struct mtd_info *mtd, uint8_t *dat,
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
 	struct fsmc_nand_data *host = mtd_to_fsmc(mtd);
-	void __iomem *regs = host->regs_va;
-	unsigned int bank = host->bank;
 	uint32_t err_idx[8];
 	uint32_t num_err, i;
 	uint32_t ecc1, ecc2, ecc3, ecc4;
 
-	num_err = (readl_relaxed(FSMC_NAND_REG(regs, bank, STS)) >> 10) & 0xF;
+	num_err = (readl_relaxed(host->regs + STS) >> 10) & 0xF;
 
 	/* no bit flipping */
 	if (likely(num_err == 0))
@@ -803,10 +841,10 @@ static int fsmc_bch8_correct_data(struct mtd_info *mtd, uint8_t *dat,
 	 * uint64_t array and error offset indexes are populated in err_idx
 	 * array
 	 */
-	ecc1 = readl_relaxed(FSMC_NAND_REG(regs, bank, ECC1));
-	ecc2 = readl_relaxed(FSMC_NAND_REG(regs, bank, ECC2));
-	ecc3 = readl_relaxed(FSMC_NAND_REG(regs, bank, ECC3));
-	ecc4 = readl_relaxed(FSMC_NAND_REG(regs, bank, STS));
+	ecc1 = readl_relaxed(host->regs + ECC1);
+	ecc2 = readl_relaxed(host->regs + ECC2);
+	ecc3 = readl_relaxed(host->regs + ECC3);
+	ecc4 = readl_relaxed(host->regs + STS);
 
 	err_idx[0] = (ecc1 >> 0) & 0x1FFF;
 	err_idx[1] = (ecc1 >> 13) & 0x1FFF;
@@ -933,6 +971,9 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 		return PTR_ERR(host->clk);
 	}
 
+	host->regs = host->regs_va + FSMC_NOR_REG_SIZE +
+		     (host->bank * FSMC_NAND_BANK_SZ);
+
 	ret = clk_prepare_enable(host->clk);
 	if (ret)
 		return ret;
@@ -960,9 +1001,8 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	nand_set_flash_node(nand, pdev->dev.of_node);
 
 	mtd->dev.parent = &pdev->dev;
-	nand->IO_ADDR_R = host->data_va;
-	nand->IO_ADDR_W = host->data_va;
-	nand->cmd_ctrl = fsmc_cmd_ctrl;
+	nand->exec_op = fsmc_exec_op;
+	nand->select_chip = fsmc_select_chip;
 	nand->chip_delay = 30;
 
 	/*
@@ -974,8 +1014,7 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	nand->ecc.size = 512;
 	nand->badblockbits = 7;
 
-	switch (host->mode) {
-	case USE_DMA_ACCESS:
+	if (host->mode == USE_DMA_ACCESS) {
 		dma_cap_zero(mask);
 		dma_cap_set(DMA_MEMCPY, mask);
 		host->read_dma_chan = dma_request_channel(mask, filter, NULL);
@@ -988,15 +1027,6 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev, "Unable to get write dma channel\n");
 			goto err_req_write_chnl;
 		}
-		nand->read_buf = fsmc_read_buf_dma;
-		nand->write_buf = fsmc_write_buf_dma;
-		break;
-
-	default:
-	case USE_WORD_ACCESS:
-		nand->read_buf = fsmc_read_buf;
-		nand->write_buf = fsmc_write_buf;
-		break;
 	}
 
 	if (host->dev_timings)
-- 
2.11.0
