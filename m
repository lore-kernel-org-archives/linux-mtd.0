From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: Viresh Kumar <vireshk@kernel.org>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH v2 1/3] mtd: nand: fsmc: reduce number of arguments of
 fsmc_nand_setup()
Date: Sat, 29 Apr 2017 10:52:34 +0200
Message-Id: <1493455956-18362-2-git-send-email-thomas.petazzoni@free-electrons.com>
In-Reply-To: <1493455956-18362-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1493455956-18362-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In preparation for the introduction of support for using SDR timings
exposed by the NAND flash instead of hard-coded timings, this commit
reworks the fsmc_nand_setup() function to take a "struct fsmc_nand_data"
as argument, which already contains the I/O registers base address, bank
and bus width information.

The timings is also currently contained in the "struct fsmc_nand_data",
but we still pass it as a separate argument because the support for
using SDR timings will pass a different value.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 drivers/mtd/nand/fsmc_nand.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index cea50d2..43108dd 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -302,11 +302,13 @@ static void fsmc_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
  * This routine initializes timing parameters related to NAND memory access in
  * FSMC registers
  */
-static void fsmc_nand_setup(void __iomem *regs, uint32_t bank,
-			   uint32_t busw, struct fsmc_nand_timings *timings)
+static void fsmc_nand_setup(struct fsmc_nand_data *host,
+			    struct fsmc_nand_timings *timings)
 {
 	uint32_t value = FSMC_DEVTYPE_NAND | FSMC_ENABLE | FSMC_WAITON;
 	uint32_t tclr, tar, thiz, thold, twait, tset;
+	unsigned int bank = host->bank;
+	void __iomem *regs = host->regs_va;
 	struct fsmc_nand_timings *tims;
 	struct fsmc_nand_timings default_timings = {
 		.tclr	= FSMC_TCLR_1,
@@ -318,7 +320,7 @@ static void fsmc_nand_setup(void __iomem *regs, uint32_t bank,
 	};
 
 	if (timings)
-		tims = timings;
+		tims = host->dev_timings;
 	else
 		tims = &default_timings;
 
@@ -329,7 +331,7 @@ static void fsmc_nand_setup(void __iomem *regs, uint32_t bank,
 	twait = (tims->twait & FSMC_TWAIT_MASK) << FSMC_TWAIT_SHIFT;
 	tset = (tims->tset & FSMC_TSET_MASK) << FSMC_TSET_SHIFT;
 
-	if (busw)
+	if (host->nand.options & NAND_BUSWIDTH_16)
 		writel_relaxed(value | FSMC_DEVWID_16,
 				FSMC_NAND_REG(regs, bank, PC));
 	else
@@ -933,9 +935,7 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 		break;
 	}
 
-	fsmc_nand_setup(host->regs_va, host->bank,
-			nand->options & NAND_BUSWIDTH_16,
-			host->dev_timings);
+	fsmc_nand_setup(host, host->dev_timings);
 
 	if (AMBA_REV_BITS(host->pid) >= 8) {
 		nand->ecc.read_page = fsmc_read_page_hwecc;
@@ -1073,9 +1073,7 @@ static int fsmc_nand_resume(struct device *dev)
 	struct fsmc_nand_data *host = dev_get_drvdata(dev);
 	if (host) {
 		clk_prepare_enable(host->clk);
-		fsmc_nand_setup(host->regs_va, host->bank,
-				host->nand.options & NAND_BUSWIDTH_16,
-				host->dev_timings);
+		fsmc_nand_setup(host, host->dev_timings);
 	}
 	return 0;
 }
-- 
2.7.4
