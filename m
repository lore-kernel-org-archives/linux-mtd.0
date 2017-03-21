Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cqGej-0000NR-Ry
 for linux-mtd@lists.infradead.org; Tue, 21 Mar 2017 10:04:49 +0000
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: linux-mtd@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>,
 Stefan Roese <sr@denx.de>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH 02/13] mtd: nand: fsmc: rework fsmc_nand_setup() to use
 ->setup_data_interface()
Date: Tue, 21 Mar 2017 11:03:54 +0100
Message-Id: <1490090645-8576-3-git-send-email-thomas.petazzoni@free-electrons.com>
In-Reply-To: <1490090645-8576-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1490090645-8576-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Since a few kernel versions, the NAND subsystem has introduced a
callback called ->setup_data_interface(), which NAND controller drivers
are supposed to use to perform all the NAND data interface.

This commit therefore converts the fsmc_nand driver to use this callback
instead of the home-grown fsmc_nand_setup() function.

For now, the NAND timings are not used, and we simply use the timings
provided from the Device Tree, or otherwise the default timings. Support
for the NAND timings is added in a follow-up patch.

The call to fsmc_nand_setup() in the ->resume() hook is simply replaced
by a call to nand_reset(), which internally will call the
->setup_data_interface() callback.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 drivers/mtd/nand/fsmc_nand.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index 66aece9..4a98433 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -370,9 +370,12 @@ static void fsmc_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
  * This routine initializes timing parameters related to NAND memory access in
  * FSMC registers
  */
-static void fsmc_nand_setup(void __iomem *regs, uint32_t bank,
-			   uint32_t busw, struct fsmc_nand_timings *timings)
+static int fsmc_setup_data_interface(struct mtd_info *mtd,
+				     const struct nand_data_interface *conf,
+				     bool check_only)
 {
+	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct fsmc_nand_data *host = nand_get_controller_data(nand);
 	uint32_t value = FSMC_DEVTYPE_NAND | FSMC_ENABLE | FSMC_WAITON;
 	uint32_t tclr, tar, thiz, thold, twait, tset;
 	struct fsmc_nand_timings *tims;
@@ -384,12 +387,18 @@ static void fsmc_nand_setup(void __iomem *regs, uint32_t bank,
 		.twait	= FSMC_TWAIT_6,
 		.tset	= FSMC_TSET_0,
 	};
+	unsigned int bank = host->bank;
+	void __iomem *regs = host->regs_va;
+	int ret;
 
-	if (timings)
-		tims = timings;
+	if (host->dev_timings)
+		tims = host->dev_timings;
 	else
 		tims = &default_timings;
 
+	if (check_only)
+		return 0;
+
 	tclr = (tims->tclr & FSMC_TCLR_MASK) << FSMC_TCLR_SHIFT;
 	tar = (tims->tar & FSMC_TAR_MASK) << FSMC_TAR_SHIFT;
 	thiz = (tims->thiz & FSMC_THIZ_MASK) << FSMC_THIZ_SHIFT;
@@ -397,7 +406,7 @@ static void fsmc_nand_setup(void __iomem *regs, uint32_t bank,
 	twait = (tims->twait & FSMC_TWAIT_MASK) << FSMC_TWAIT_SHIFT;
 	tset = (tims->tset & FSMC_TSET_MASK) << FSMC_TSET_SHIFT;
 
-	if (busw)
+	if (nand->options & NAND_BUSWIDTH_16)
 		writel_relaxed(value | FSMC_DEVWID_16,
 				FSMC_NAND_REG(regs, bank, PC));
 	else
@@ -410,6 +419,8 @@ static void fsmc_nand_setup(void __iomem *regs, uint32_t bank,
 			FSMC_NAND_REG(regs, bank, COMM));
 	writel_relaxed(thiz | thold | twait | tset,
 			FSMC_NAND_REG(regs, bank, ATTRIB));
+
+	return 0;
 }
 
 /*
@@ -991,6 +1002,7 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	nand->select_chip = fsmc_select_chip;
 	nand->badblockbits = 7;
 	nand_set_flash_node(nand, np);
+	nand->setup_data_interface = fsmc_setup_data_interface;
 
 	switch (host->mode) {
 	case USE_DMA_ACCESS:
@@ -1019,10 +1031,6 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 		break;
 	}
 
-	fsmc_nand_setup(host->regs_va, host->bank,
-			nand->options & NAND_BUSWIDTH_16,
-			host->dev_timings);
-
 	if (AMBA_REV_BITS(host->pid) >= 8) {
 		nand->ecc.read_page = fsmc_read_page_hwecc;
 		nand->ecc.calculate = fsmc_read_hwecc_ecc4;
@@ -1121,6 +1129,7 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, host);
 	dev_info(&pdev->dev, "FSMC NAND driver registration successful\n");
+
 	return 0;
 
 err_probe:
@@ -1172,9 +1181,7 @@ static int fsmc_nand_resume(struct device *dev)
 	struct fsmc_nand_data *host = dev_get_drvdata(dev);
 	if (host) {
 		clk_prepare_enable(host->clk);
-		fsmc_nand_setup(host->regs_va, host->bank,
-				host->nand.options & NAND_BUSWIDTH_16,
-				host->dev_timings);
+		nand_reset(&host->nand, 0);
 	}
 	return 0;
 }
-- 
2.7.4
