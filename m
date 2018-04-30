Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fD47z-0003Ib-Kf
 for linux-mtd@lists.infradead.org; Mon, 30 Apr 2018 08:25:46 +0000
Received: by mail-wm0-x242.google.com with SMTP id f8so2317009wmc.4
 for <linux-mtd@lists.infradead.org>; Mon, 30 Apr 2018 01:25:34 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 12/12] ARM: davinci: aemif: stop using pdev->id as nand
 chipselect
Date: Mon, 30 Apr 2018 10:24:53 +0200
Message-Id: <20180430082453.8091-13-brgl@bgdev.pl>
In-Reply-To: <20180430082453.8091-1-brgl@bgdev.pl>
References: <20180430082453.8091-1-brgl@bgdev.pl>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

All platforms now use the core_chipsel field in platform_data. Stop
using pdev->id in the aemif code.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 arch/arm/mach-davinci/aemif.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-davinci/aemif.c b/arch/arm/mach-davinci/aemif.c
index ff8b7e76b6e9..e4ab3f3a2a1f 100644
--- a/arch/arm/mach-davinci/aemif.c
+++ b/arch/arm/mach-davinci/aemif.c
@@ -189,7 +189,7 @@ int davinci_aemif_setup(struct platform_device *pdev)
 	 * Setup Async configuration register in case we did not boot
 	 * from NAND and so bootloader did not bother to set it up.
 	 */
-	val = davinci_aemif_readl(base, A1CR_OFFSET + pdev->id * 4);
+	val = davinci_aemif_readl(base, A1CR_OFFSET + pdata->core_chipsel * 4);
 	/*
 	 * Extended Wait is not valid and Select Strobe mode is not
 	 * used
@@ -198,13 +198,13 @@ int davinci_aemif_setup(struct platform_device *pdev)
 	if (pdata->options & NAND_BUSWIDTH_16)
 		val |= 0x1;
 
-	davinci_aemif_writel(base, A1CR_OFFSET + pdev->id * 4, val);
+	davinci_aemif_writel(base, A1CR_OFFSET + pdata->core_chipsel * 4, val);
 
 	clkrate = clk_get_rate(clk);
 
 	if (pdata->timing)
-		ret = davinci_aemif_setup_timing(pdata->timing, base, pdev->id,
-						 clkrate);
+		ret = davinci_aemif_setup_timing(pdata->timing, base,
+						 pdata->core_chipsel, clkrate);
 
 	if (ret < 0)
 		dev_dbg(&pdev->dev, "NAND timing values setup fail\n");
-- 
2.17.0
