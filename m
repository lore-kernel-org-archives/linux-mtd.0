Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghKsz-0000Ne-Vi
 for linux-mtd@lists.infradead.org; Wed, 09 Jan 2019 20:55:39 +0000
Received: by mail-lf1-x143.google.com with SMTP id e26so6708935lfc.2
 for <linux-mtd@lists.infradead.org>; Wed, 09 Jan 2019 12:55:37 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] mtd: rawnand: fsmc: Keep CE enabled fix mb() drain
Date: Wed,  9 Jan 2019 21:55:30 +0100
Message-Id: <20190109205530.5158-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hammering the chip enable on and off between every command
crashes the Nomadik NHK15 with this message:

Scanning device for bad blocks
Unhandled fault: external abort on non-linefetch (0x008) at 0xcc95e000
pgd = (ptrval)
[cc95e000] *pgd=0b808811, *pte=40000653, *ppte=40000552
Internal error: : 8 [#1] PREEMPT ARM
Modules linked in:
CPU: 0 PID: 1 Comm: swapper Not tainted 4.20.0-rc2+ #72
Hardware name: Nomadik STn8815
PC is at fsmc_exec_op+0x194/0x204
(...)

This patch keeps the CE (chip enable, the only chip select)
signal from the FSMC block enabled from the first command
after probe() or resume() until the driver either suspend()
or remove(). Create a state variable to track this.

Runtime PM can possibly be used on top of this approach if
we want to disable the CE line when no flash read/write is
going on for a prolonged time, but for now it stabilizes
the platform by simply keeping CE asserted as it used to
be.

While we're at it also fix the mb() memory barrier drain
order (patch folded in from Boris Brezillion).

Fixes: 550b9fc4e3af ("mtd: rawnand: fsmc: Stop implementing ->select_chip()")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mtd/nand/raw/fsmc_nand.c | 41 ++++++++++++++++++++++++--------
 1 file changed, 31 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index 325b4414dccc..442fda905489 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -118,6 +118,7 @@ enum access_mode {
  * @dev:		Parent device
  * @mode:		Access mode
  * @clk:		Clock structure for FSMC.
+ * @ce_asserted:	CE (chip enable) is asserted
  *
  * @read_dma_chan:	DMA channel for read access
  * @write_dma_chan:	DMA channel for write access to NAND
@@ -140,6 +141,7 @@ struct fsmc_nand_data {
 	struct device		*dev;
 	enum access_mode	mode;
 	struct clk		*clk;
+	bool			ce_asserted;
 
 	/* DMA related objects */
 	struct dma_chan		*read_dma_chan;
@@ -598,16 +600,27 @@ static void fsmc_ce_ctrl(struct fsmc_nand_data *host, bool assert)
 {
 	u32 pc = readl(host->regs_va + FSMC_PC);
 
-	if (!assert)
+	/* Shortcut */
+	if (host->ce_asserted)
+		return;
+
+	if (!assert) {
+		/*
+		 * Make sure all previous read/write have been done before
+		 * de-asserting the CE line.
+		 */
+		mb();
 		writel_relaxed(pc & ~FSMC_ENABLE, host->regs_va + FSMC_PC);
-	else
+		host->ce_asserted = false;
+	} else {
 		writel_relaxed(pc | FSMC_ENABLE, host->regs_va + FSMC_PC);
-
-	/*
-	 * nCE line changes must be applied before returning from this
-	 * function.
-	 */
-	mb();
+		/*
+		 * nCE line changes must be applied before returning from this
+		 * function.
+		 */
+		mb();
+		host->ce_asserted = true;
+	}
 }
 
 /*
@@ -627,6 +640,12 @@ static int fsmc_exec_op(struct nand_chip *chip, const struct nand_operation *op,
 
 	pr_debug("Executing operation [%d instructions]:\n", op->ninstrs);
 
+	if (op->cs != 0) {
+		pr_err("illegal chip select\n");
+		fsmc_ce_ctrl(host, false);
+		return -EINVAL;
+	}
+
 	fsmc_ce_ctrl(host, true);
 
 	for (op_id = 0; op_id < op->ninstrs; op_id++) {
@@ -686,8 +705,6 @@ static int fsmc_exec_op(struct nand_chip *chip, const struct nand_operation *op,
 		}
 	}
 
-	fsmc_ce_ctrl(host, false);
-
 	return ret;
 }
 
@@ -1153,6 +1170,8 @@ static int fsmc_nand_remove(struct platform_device *pdev)
 {
 	struct fsmc_nand_data *host = platform_get_drvdata(pdev);
 
+	fsmc_ce_ctrl(host, false);
+
 	if (host) {
 		nand_release(&host->nand);
 
@@ -1171,6 +1190,8 @@ static int fsmc_nand_suspend(struct device *dev)
 {
 	struct fsmc_nand_data *host = dev_get_drvdata(dev);
 
+	fsmc_ce_ctrl(host, false);
+
 	if (host)
 		clk_disable_unprepare(host->clk);
 
-- 
2.19.2
