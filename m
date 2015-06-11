Received: from mail-wi0-f178.google.com ([209.85.212.178])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z33vQ-00023a-11
 for linux-mtd@lists.infradead.org; Thu, 11 Jun 2015 14:57:49 +0000
Received: by wibdq8 with SMTP id dq8so11735110wib.1
 for <linux-mtd@lists.infradead.org>; Thu, 11 Jun 2015 07:57:25 -0700 (PDT)
MIME-Version: 1.0
From: Roy Spliet <r.spliet@ultimaker.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Linux MTD <linux-mtd@lists.infradead.org>,
 Linux ARM kernel <linux-arm-kernel@lists.infradead.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH v4 2/2] mtd: nand: sunxi: Set serial access mode correctly
Date: Thu, 11 Jun 2015 16:57:17 +0200
Message-Id: <1434034637-9804-2-git-send-email-r.spliet@ultimaker.com>
In-Reply-To: <1434034637-9804-1-git-send-email-r.spliet@ultimaker.com>
References: <1434034637-9804-1-git-send-email-r.spliet@ultimaker.com>
Content-Type: text/plain; charset=US-ASCII
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Roy Spliet <r.spliet@ultimaker.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Replaces the hard coded "always use EDO" policy with that prescribed
by the ONFI 3.1 specification that EDO mode should always be used if tRC
is below 30ns.

Signed-off-by: Roy Spliet <r.spliet@ultimaker.com>

V4:
- Simplify by pre-calculating the entire timing CTL register value
---
 drivers/mtd/nand/sunxi_nand.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/sunxi_nand.c
index 79de4ef..26df48f 100644
--- a/drivers/mtd/nand/sunxi_nand.c
+++ b/drivers/mtd/nand/sunxi_nand.c
@@ -99,6 +99,9 @@
 				 NFC_CMD_INT_ENABLE | \
 				 NFC_DMA_INT_ENABLE)
 
+/* define bit use in NFC_TIMING_CTL */
+#define NFC_TIMING_CTL_EDO	BIT(8)
+
 /* define NFC_TIMING_CFG register layout */
 #define NFC_TIMING_CFG(tWB, tADL, tWHR, tRHW, tCAD)		\
 	((tWB) & 0x3) | (((tADL) & 0x3) << 2) |			\
@@ -226,6 +229,7 @@ struct sunxi_nand_chip {
 	struct mtd_info mtd;
 	unsigned long clk_rate;
 	u32 timing_cfg;
+	u32 timing_ctl;
 	int selected;
 	int nsels;
 	struct sunxi_nand_chip_sel sels[0];
@@ -412,6 +416,7 @@ static void sunxi_nfc_select_chip(struct mtd_info *mtd, int chip)
 		}
 	}
 
+	writel(sunxi_nand->timing_ctl, nfc->regs + NFC_REG_TIMING_CTL);
 	writel(sunxi_nand->timing_cfg, nfc->regs + NFC_REG_TIMING_CFG);
 	writel(ctl, nfc->regs + NFC_REG_CTL);
 
@@ -941,6 +946,13 @@ static int sunxi_nand_chip_set_timings(struct sunxi_nand_chip *chip,
 	/* TODO: A83 has some more bits for CDQSS, CS, CLHZ, CCS, WC */
 	chip->timing_cfg = NFC_TIMING_CFG(tWB, tADL, tWHR, tRHW, tCAD);
 
+	/*
+	 * ONFI specification 3.1, paragraph 4.15.2 dictates that EDO data
+	 * output cycle timings shall be used if the host drives tRC less than
+	 * 30 ns.
+	 */
+	chip->timing_ctl = (timings->tRC_min < 30000) ? NFC_TIMING_CTL_EDO : 0;
+
 	/* Convert min_clk_period from picoseconds to nanoseconds */
 	min_clk_period = DIV_ROUND_UP(min_clk_period, 1000);
 
@@ -1442,11 +1454,6 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, nfc);
 
-	/*
-	 * TODO: replace this magic value with EDO flag
-	 */
-	writel(0x100, nfc->regs + NFC_REG_TIMING_CTL);
-
 	ret = sunxi_nand_chips_init(dev, nfc);
 	if (ret) {
 		dev_err(dev, "failed to init nand chips\n");
-- 
2.4.2


-- 


IMAGINE IT >> MAKE IT

Meet us online at Twitter <http://twitter.com/ultimaker>, Facebook 
<http://facebook.com/ultimaker>, Google+ <http://google.com/+Ultimaker>

www.ultimaker.com
