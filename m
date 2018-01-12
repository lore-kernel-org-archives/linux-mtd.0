Received: from eddie.linux-mips.org ([148.251.95.138] helo=cvs.linux-mips.org)
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eZz8j-0003Da-Bi
 for linux-mtd@lists.infradead.org; Fri, 12 Jan 2018 13:13:00 +0000
Received: (from localhost user: 'ladis' uid#1021 fake: STDIN
 (ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
 id S23994659AbeALNM4x5kPd (ORCPT
 <rfc822;linux-mtd@lists.infradead.org>);
 Fri, 12 Jan 2018 14:12:56 +0100
Date: Fri, 12 Jan 2018 14:12:56 +0100
Sender: Ladislav Michl <ladis@linux-mips.org>
From: Ladislav Michl <ladis@linux-mips.org>
To: linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Roger Quadros <rogerq@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Tony Lindgren <tony@atomide.com>
Subject: [PATCH v6 02/14] ARM: dts: OMAP2+: Add compatible property to
 onenand node
Message-ID: <20180112131256.GC13810@lenoch>
References: <20180112131105.GA13810@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180112131105.GA13810@lenoch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

OMAP onenand nodes are missing compatible property, add it.

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
Reviewed-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Acked-by: Roger Quadros <rogerq@ti.com>
Acked-by: Tony Lindgren <tony@atomide.com>
Tested-by: Tony Lindgren <tony@atomide.com>
Tested-by: Aaro Koskinen <aaro.koskinen@iki.fi>
---

Changes in v6: None
Changes in v5: None
Changes in v4:
- new patch

Changes in v3: None
Changes in v2: None

 arch/arm/boot/dts/omap2420-n8x0-common.dtsi | 1 +
 arch/arm/boot/dts/omap3-n900.dts            | 1 +
 arch/arm/boot/dts/omap3-n950-n9.dtsi        | 1 +
 arch/arm/boot/dts/omap3430-sdp.dts          | 1 +
 4 files changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/omap2420-n8x0-common.dtsi b/arch/arm/boot/dts/omap2420-n8x0-common.dtsi
index 1df3ace3af92..63b0b4921e4e 100644
--- a/arch/arm/boot/dts/omap2420-n8x0-common.dtsi
+++ b/arch/arm/boot/dts/omap2420-n8x0-common.dtsi
@@ -52,6 +52,7 @@
 	onenand@0,0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
+		compatible = "ti,omap2-onenand";
 		reg = <0 0 0x20000>;	/* CS0, offset 0, IO size 128K */
 
 		gpmc,sync-read;
diff --git a/arch/arm/boot/dts/omap3-n900.dts b/arch/arm/boot/dts/omap3-n900.dts
index f5700ff231db..a1e6307ae21e 100644
--- a/arch/arm/boot/dts/omap3-n900.dts
+++ b/arch/arm/boot/dts/omap3-n900.dts
@@ -840,6 +840,7 @@
 	onenand@0,0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
+		compatible = "ti,omap2-onenand";
 		reg = <0 0 0x20000>;	/* CS0, offset 0, IO size 128K */
 
 		gpmc,sync-read;
diff --git a/arch/arm/boot/dts/omap3-n950-n9.dtsi b/arch/arm/boot/dts/omap3-n950-n9.dtsi
index 12fbb3da5fce..0d9b85317529 100644
--- a/arch/arm/boot/dts/omap3-n950-n9.dtsi
+++ b/arch/arm/boot/dts/omap3-n950-n9.dtsi
@@ -367,6 +367,7 @@
 	onenand@0,0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
+		compatible = "ti,omap2-onenand";
 		reg = <0 0 0x20000>;	/* CS0, offset 0, IO size 128K */
 
 		gpmc,sync-read;
diff --git a/arch/arm/boot/dts/omap3430-sdp.dts b/arch/arm/boot/dts/omap3430-sdp.dts
index 908951eb5943..d652708f6bef 100644
--- a/arch/arm/boot/dts/omap3430-sdp.dts
+++ b/arch/arm/boot/dts/omap3430-sdp.dts
@@ -154,6 +154,7 @@
 		linux,mtd-name= "samsung,kfm2g16q2m-deb8";
 		#address-cells = <1>;
 		#size-cells = <1>;
+		compatible = "ti,omap2-onenand";
 		reg = <2 0 0x20000>;	/* CS2, offset 0, IO size 4 */
 
 		gpmc,device-width = <2>;
-- 
2.15.1
