Received: from eddie.linux-mips.org ([148.251.95.138] helo=cvs.linux-mips.org)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eF0iG-0000xG-MO
 for linux-mtd@lists.infradead.org; Wed, 15 Nov 2017 16:39:03 +0000
Received: (from localhost user: 'ladis' uid#1021 fake: STDIN
 (ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
 id S23992186AbdKOQi4OaS-T (ORCPT
 <rfc822;linux-mtd@lists.infradead.org>);
 Wed, 15 Nov 2017 17:38:56 +0100
Date: Wed, 15 Nov 2017 17:38:52 +0100
Sender: Ladislav Michl <ladis@linux-mips.org>
From: Ladislav Michl <ladis@linux-mips.org>
To: linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org
Cc: Roger Quadros <rogerq@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Tony Lindgren <tony@atomide.com>
Subject: [PATCH v5 16/16] ARM: dts: Nokia: Use OneNAND INT pin
Message-ID: <20171115163851.wymhwtst6zbl2ra2@lenoch>
References: <20171115162306.2o2w2yrf7wucroxd@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171115162306.2o2w2yrf7wucroxd@lenoch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Enable use of INT pin to wait for command completion. This is just
experimental placeholder patch as it lacks pinmux settings.

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
---

Changes in v5:
- pin name is INT

Changes in v4:
- new patch

Changes in v3: None
Changes in v2: None

 arch/arm/boot/dts/omap2420-n8x0-common.dtsi | 4 +---
 arch/arm/boot/dts/omap3-n900.dts            | 2 +-
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/omap2420-n8x0-common.dtsi b/arch/arm/boot/dts/omap2420-n8x0-common.dtsi
index 843f6a2f5e29..7b1983214417 100644
--- a/arch/arm/boot/dts/omap2420-n8x0-common.dtsi
+++ b/arch/arm/boot/dts/omap2420-n8x0-common.dtsi
@@ -42,14 +42,12 @@
 
 &gpmc {
 	ranges = <0 0 0x04000000 0x1000000>;	/* CS0: 16MB for OneNAND */
-
-	/* gpio-irq for dma: 26 */
-
 	onenand@0,0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		compatible = "ti,omap2-onenand";
 		reg = <0 0 0x20000>;	/* CS0, offset 0, IO size 128K */
+		int-gpios = <&gpio1 26 GPIO_ACTIVE_HIGH>; /* gpio_26 for INT */
 
 		gpmc,sync-read;
 		gpmc,burst-length = <16>;
diff --git a/arch/arm/boot/dts/omap3-n900.dts b/arch/arm/boot/dts/omap3-n900.dts
index aa5b1a439564..4fff3c466e81 100644
--- a/arch/arm/boot/dts/omap3-n900.dts
+++ b/arch/arm/boot/dts/omap3-n900.dts
@@ -834,12 +834,12 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&gpmc_pins>;
 
-	/* sys_ndmareq1 could be used by the driver, not as gpio65 though */
 	onenand@0,0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		compatible = "ti,omap2-onenand";
 		reg = <0 0 0x20000>;	/* CS0, offset 0, IO size 128K */
+		int-gpios = <&gpio3 1 GPIO_ACTIVE_HIGH>; /* gpio_65 for INT */
 
 		gpmc,sync-read;
 		gpmc,sync-write;
-- 
2.11.0
