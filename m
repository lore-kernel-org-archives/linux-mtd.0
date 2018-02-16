Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1emgv9-0001Zh-H3
 for linux-mtd@lists.infradead.org; Fri, 16 Feb 2018 14:23:30 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 2/2] mtd: nand: fsmc: use ->exec_op()
Date: Fri, 16 Feb 2018 15:22:48 +0100
Message-Id: <20180216142248.32345-3-miquel.raynal@bootlin.com>
In-Reply-To: <20180216142248.32345-1-miquel.raynal@bootlin.com>
References: <20180216142248.32345-1-miquel.raynal@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Remove the deprecated ->cmd_ctrl() implementation to use ->exec_op() in
the fsmc_nand driver.

Implement the ->select_chip() hook to avoid having to support the hack
from the core that send a NAND_CMD_NONE with NAND_NCE to signal a
deassertion of nCE.

Also get rid of the last references to ->IO_ADDR_[R|W] that are not used
anymore.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/fsmc_nand.c | 150 ++++++++++++++++++++++++++++---------------
 1 file changed, 99 insertions(+), 51 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index 1454d9bf1e49..f54ccc847012 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -253,43 +253,6 @@ static inline struct fsmc_nand_data *mtd_to_fsmc(struct mtd_info *mtd)
 	return container_of(mtd_to_nand(mtd), struct fsmc_nand_data, nand);
 }
 
-/*
- * fsmc_cmd_ctrl - For facilitaing Hardware access
- * This routine allows hardware specific access to control-lines(ALE,CLE)
- */
-static void fsmc_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
-{
-	struct nand_chip *this = mtd_to_nand(mtd);
-	struct fsmc_nand_data *host = mtd_to_fsmc(mtd);
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
-		pc = readl(host->regs_va + PC);
-		if (ctrl & NAND_NCE)
-			pc |= FSMC_ENABLE;
-		else
-			pc &= ~FSMC_ENABLE;
-		writel_relaxed(pc, host->regs_va + PC);
-	}
-
-	mb();
-
-	if (cmd != NAND_CMD_NONE)
-		writeb_relaxed(cmd, this->IO_ADDR_W);
-}
-
 /*
  * fsmc_nand_setup - FSMC (Flexible Static Memory Controller) init routine
  *
@@ -645,6 +608,102 @@ static void fsmc_write_buf_dma(struct mtd_info *mtd, const uint8_t *buf,
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
+	pc = readl(host->regs_va + PC);
+	if (chipnr < 0)
+		writel_relaxed(pc & ~FSMC_ENABLE, host->regs_va + PC);
+	else
+		writel_relaxed(pc | FSMC_ENABLE, host->regs_va + PC);
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
@@ -944,9 +1003,8 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	nand_set_flash_node(nand, pdev->dev.of_node);
 
 	mtd->dev.parent = &pdev->dev;
-	nand->IO_ADDR_R = host->data_va;
-	nand->IO_ADDR_W = host->data_va;
-	nand->cmd_ctrl = fsmc_cmd_ctrl;
+	nand->exec_op = fsmc_exec_op;
+	nand->select_chip = fsmc_select_chip;
 	nand->chip_delay = 30;
 
 	/*
@@ -958,8 +1016,7 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	nand->ecc.size = 512;
 	nand->badblockbits = 7;
 
-	switch (host->mode) {
-	case USE_DMA_ACCESS:
+	if (host->mode == USE_DMA_ACCESS) {
 		dma_cap_zero(mask);
 		dma_cap_set(DMA_MEMCPY, mask);
 		host->read_dma_chan = dma_request_channel(mask, filter, NULL);
@@ -972,15 +1029,6 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
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
2.14.1
