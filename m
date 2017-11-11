Received: from eddie.linux-mips.org ([148.251.95.138] helo=cvs.linux-mips.org)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eDdLm-0003LA-O3
 for linux-mtd@lists.infradead.org; Sat, 11 Nov 2017 21:30:04 +0000
Received: (from localhost user: 'ladis' uid#1021 fake: STDIN
 (ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
 id S23990633AbdKKV3kzij9y (ORCPT
 <rfc822;linux-mtd@lists.infradead.org>);
 Sat, 11 Nov 2017 22:29:40 +0100
Date: Sat, 11 Nov 2017 22:29:39 +0100
Sender: Ladislav Michl <ladis@linux-mips.org>
From: Ladislav Michl <ladis@linux-mips.org>
To: linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org
Cc: Roger Quadros <rogerq@ti.com>, Tony Lindgren <tony@atomide.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Kyungmin Park <kyungmin.park@samsung.com>
Subject: [PATCH v4 16/16] ARM: dts: Nokia: Use R/B pin
Message-ID: <20171111212939.jcf26v3w26bd7sn7@lenoch>
References: <20171111211206.465pgorrjp3eyix6@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171111211206.465pgorrjp3eyix6@lenoch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Enable use of R/B pin. This is just experimental placeholder patch
as it lacks pinmux settings.

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
---
 Changes:
 -v4: new patch

 arch/arm/boot/dts/omap2420-n8x0-common.dtsi | 4 +---
 arch/arm/boot/dts/omap3-n900.dts            | 1 +
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/omap2420-n8x0-common.dtsi b/arch/arm/boot/dts/omap2420-n8x0-common.dtsi
index 843f6a2f5e29..cfe5d02ea0ed 100644
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
+		rb-gpios = <&gpio0 26 GPIO_ACTIVE_HIGH>;
 
 		gpmc,sync-read;
 		gpmc,burst-length = <16>;
diff --git a/arch/arm/boot/dts/omap3-n900.dts b/arch/arm/boot/dts/omap3-n900.dts
index aa5b1a439564..718116d9f4ac 100644
--- a/arch/arm/boot/dts/omap3-n900.dts
+++ b/arch/arm/boot/dts/omap3-n900.dts
@@ -840,6 +840,7 @@
 		#size-cells = <1>;
 		compatible = "ti,omap2-onenand";
 		reg = <0 0 0x20000>;	/* CS0, offset 0, IO size 128K */
+		rb-gpios = <&gpio3 1 GPIO_ACTIVE_HIGH>;
 
 		gpmc,sync-read;
 		gpmc,sync-write;
-- 
2.11.0
