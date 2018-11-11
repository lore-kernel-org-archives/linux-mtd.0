Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLkb1-0000QR-JH
 for linux-mtd@lists.infradead.org; Sun, 11 Nov 2018 07:55:56 +0000
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
Subject: [PATCH v3 15/22] mtd: rawnand: fsmc: Stop implementing ->select_chip()
Date: Sun, 11 Nov 2018 08:55:17 +0100
Message-Id: <20181111075524.13123-16-boris.brezillon@bootlin.com>
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

Now that the CS line to assert is directly passed through the
nand_operation struct we can replace the fsmc_select_chip()
implementation by an internal fsmc_ce_ctrl() function which is
directly called from fsmc_exec_op()

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
Changes in v3:
- None

Changes in v2:
- None
---
 drivers/mtd/nand/raw/fsmc_nand.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index 41ba76efd6c8..ea69ac6e6d7a 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -609,22 +609,19 @@ static void fsmc_write_buf_dma(struct mtd_info *mtd, const uint8_t *buf,
 }
 
 /* fsmc_select_chip - assert or deassert nCE */
-static void fsmc_select_chip(struct nand_chip *chip, int chipnr)
+static void fsmc_ce_ctrl(struct fsmc_nand_data *host, bool assert)
 {
-	struct fsmc_nand_data *host = mtd_to_fsmc(nand_to_mtd(chip));
-	u32 pc;
-
-	/* Support only one CS */
-	if (chipnr > 0)
-		return;
+	u32 pc = readl(host->regs_va + FSMC_PC);
 
-	pc = readl(host->regs_va + FSMC_PC);
-	if (chipnr < 0)
+	if (!assert)
 		writel_relaxed(pc & ~FSMC_ENABLE, host->regs_va + FSMC_PC);
 	else
 		writel_relaxed(pc | FSMC_ENABLE, host->regs_va + FSMC_PC);
 
-	/* nCE line must be asserted before starting any operation */
+	/*
+	 * nCE line changes must be applied before returning from this
+	 * function.
+	 */
 	mb();
 }
 
@@ -645,6 +642,9 @@ static int fsmc_exec_op(struct nand_chip *chip, const struct nand_operation *op,
 	int i;
 
 	pr_debug("Executing operation [%d instructions]:\n", op->ninstrs);
+
+	fsmc_ce_ctrl(host, true);
+
 	for (op_id = 0; op_id < op->ninstrs; op_id++) {
 		instr = &op->instrs[op_id];
 
@@ -701,6 +701,8 @@ static int fsmc_exec_op(struct nand_chip *chip, const struct nand_operation *op,
 		}
 	}
 
+	fsmc_ce_ctrl(host, false);
+
 	return ret;
 }
 
@@ -1081,7 +1083,6 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 
 	mtd->dev.parent = &pdev->dev;
 	nand->exec_op = fsmc_exec_op;
-	nand->select_chip = fsmc_select_chip;
 
 	/*
 	 * Setup default ECC mode. nand_dt_init() called from nand_scan_ident()
-- 
2.17.1
