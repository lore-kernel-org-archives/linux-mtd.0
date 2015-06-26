Received: from mail-yk0-f171.google.com ([209.85.160.171])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z8PV7-0004RF-CM
 for linux-mtd@lists.infradead.org; Fri, 26 Jun 2015 09:00:47 +0000
Received: by ykdy1 with SMTP id y1so53469498ykd.2
 for <linux-mtd@lists.infradead.org>; Fri, 26 Jun 2015 02:00:23 -0700 (PDT)
MIME-Version: 1.0
From: Roy Spliet <r.spliet@ultimaker.com>
To: Brian Norris <computersforpeace@gmail.com>,
 Linux MTD <linux-mtd@lists.infradead.org>,
 Linux ARM kernel <linux-arm-kernel@lists.infradead.org>,
 Linux sunxi <linux-sunxi@googlegroups.com>
Subject: [PATCH v5 2/2] mtd: nand: sunxi: Set serial access mode correctly
Date: Fri, 26 Jun 2015 11:00:11 +0200
Message-Id: <1435309211-15236-2-git-send-email-r.spliet@ultimaker.com>
In-Reply-To: <1435309211-15236-1-git-send-email-r.spliet@ultimaker.com>
References: <1435309211-15236-1-git-send-email-r.spliet@ultimaker.com>
Content-Type: text/plain; charset=US-ASCII
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
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
Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

---
V4:
- Simplify by pre-calculating the entire timing CTL register value
---
 drivers/mtd/nand/sunxi_nand.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/sunxi_nand.c
index 663e331..f97a58d 100644
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
 	(((tWB) & 0x3) | (((tADL) & 0x3) << 2) |		\
@@ -225,6 +228,7 @@ struct sunxi_nand_chip {
 	struct mtd_info mtd;
 	unsigned long clk_rate;
 	u32 timing_cfg;
+	u32 timing_ctl;
 	int selected;
 	int nsels;
 	struct sunxi_nand_chip_sel sels[0];
@@ -411,6 +415,7 @@ static void sunxi_nfc_select_chip(struct mtd_info *mtd, int chip)
 		}
 	}
 
+	writel(sunxi_nand->timing_ctl, nfc->regs + NFC_REG_TIMING_CTL);
 	writel(sunxi_nand->timing_cfg, nfc->regs + NFC_REG_TIMING_CFG);
 	writel(ctl, nfc->regs + NFC_REG_CTL);
 
@@ -940,6 +945,13 @@ static int sunxi_nand_chip_set_timings(struct sunxi_nand_chip *chip,
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
 
@@ -1441,11 +1453,6 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 
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
2.4.3


-- 


IMAGINE IT >> MAKE IT

Meet us online at Twitter <http://twitter.com/ultimaker>, Facebook 
<http://facebook.com/ultimaker>, Google+ <http://google.com/+Ultimaker>

www.ultimaker.com
