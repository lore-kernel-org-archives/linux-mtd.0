Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cqGej-0000NU-TM
 for linux-mtd@lists.infradead.org; Tue, 21 Mar 2017 10:04:50 +0000
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: linux-mtd@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>,
 Stefan Roese <sr@denx.de>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH 03/13] mtd: nand: fsmc: add support to use NAND timings
Date: Tue, 21 Mar 2017 11:03:55 +0100
Message-Id: <1490090645-8576-4-git-send-email-thomas.petazzoni@free-electrons.com>
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

Until now, the fsmc_nand driver was either using controller timings
specified in the Device Tree (through FSMC specific DT properties) or
alternatively default/fallback timings.

This commit implements support to use the timings advertised by the NAND
chip itself, and passed by the NAND core to the ->setup_data_interface()
callback.

Many thanks to Boris Brezillon for coming up with the logic to convert
the NAND chip timings into the timings expected by the FSMC controller.

Also, since the timings are now not only coming from the DT, the message
warning that default timings will be used is removed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 drivers/mtd/nand/fsmc_nand.c | 78 ++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 72 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index 4a98433..d2e85c6 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -364,6 +364,62 @@ static void fsmc_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
 		writeb_relaxed(cmd, this->IO_ADDR_W);
 }
 
+static int fsmc_calc_timings(struct fsmc_nand_data *host,
+			     const struct nand_sdr_timings *sdrt,
+			     struct fsmc_nand_timings *tims)
+{
+	unsigned long hclk = clk_get_rate(host->clk);
+	unsigned long hclkn = NSEC_PER_SEC / hclk;
+	uint32_t thiz, thold, twait, tset;
+
+	if (sdrt->tRC_min < 30000)
+		return -EOPNOTSUPP;
+
+	tims->tar = DIV_ROUND_UP(sdrt->tAR_min / 1000, hclkn) - 1;
+	if (tims->tar > FSMC_TAR_MASK)
+		tims->tar = FSMC_TAR_MASK;
+	tims->tclr = DIV_ROUND_UP(sdrt->tCLR_min / 1000, hclkn) - 1;
+	if (tims->tclr > FSMC_TCLR_MASK)
+		tims->tclr = FSMC_TCLR_MASK;
+
+	thiz = sdrt->tCS_min - sdrt->tWP_min;
+	tims->thiz = DIV_ROUND_UP(thiz / 1000, hclkn);
+
+	thold = sdrt->tDH_min;
+	if (thold < sdrt->tCH_min)
+		thold = sdrt->tCH_min;
+	if (thold < sdrt->tCLH_min)
+		thold = sdrt->tCLH_min;
+	if (thold < sdrt->tWH_min)
+		thold = sdrt->tWH_min;
+	if (thold < sdrt->tALH_min)
+		thold = sdrt->tALH_min;
+	if (thold < sdrt->tREH_min)
+		thold = sdrt->tREH_min;
+	tims->thold = DIV_ROUND_UP(thold / 1000, hclkn);
+	if (tims->thold == 0)
+		tims->thold = 1;
+	else if (tims->thold > FSMC_THOLD_MASK)
+		tims->thold = FSMC_THOLD_MASK;
+
+	twait = max(sdrt->tRP_min, sdrt->tWP_min);
+	tims->twait = DIV_ROUND_UP(twait / 1000, hclkn) - 1;
+	if (tims->twait == 0)
+		tims->twait = 1;
+	else if (tims->twait > FSMC_TWAIT_MASK)
+		tims->twait = FSMC_TWAIT_MASK;
+
+	tset = max(sdrt->tCS_min - sdrt->tWP_min,
+		   sdrt->tCEA_max - sdrt->tREA_max);
+	tims->tset = DIV_ROUND_UP(tset / 1000, hclkn) - 1;
+	if (tims->tset == 0)
+		tims->tset = 1;
+	else if (tims->tset > FSMC_TSET_MASK)
+		tims->tset = FSMC_TSET_MASK;
+
+	return 0;
+}
+
 /*
  * fsmc_nand_setup - FSMC (Flexible Static Memory Controller) init routine
  *
@@ -387,14 +443,26 @@ static int fsmc_setup_data_interface(struct mtd_info *mtd,
 		.twait	= FSMC_TWAIT_6,
 		.tset	= FSMC_TSET_0,
 	};
+	struct fsmc_nand_timings nand_timings;
 	unsigned int bank = host->bank;
 	void __iomem *regs = host->regs_va;
 	int ret;
 
-	if (host->dev_timings)
+	if (host->dev_timings) {
 		tims = host->dev_timings;
-	else
-		tims = &default_timings;
+	} else {
+		const struct nand_sdr_timings *sdrt;
+
+		sdrt = nand_get_sdr_timings(conf);
+		if (IS_ERR(sdrt)) {
+			tims = &default_timings;
+		} else {
+			ret = fsmc_calc_timings(host, sdrt, &nand_timings);
+			if (ret)
+				return ret;
+			tims = &nand_timings;
+		}
+	}
 
 	if (check_only)
 		return 0;
@@ -874,10 +942,8 @@ static int fsmc_nand_probe_config_dt(struct platform_device *pdev,
 		return -ENOMEM;
 	ret = of_property_read_u8_array(np, "timings", (u8 *)pdata->nand_timings,
 						sizeof(*pdata->nand_timings));
-	if (ret) {
-		dev_info(&pdev->dev, "No timings in dts specified, using default timings!\n");
+	if (ret)
 		pdata->nand_timings = NULL;
-	}
 
 	/* Set default NAND bank to 0 */
 	pdata->bank = 0;
-- 
2.7.4
