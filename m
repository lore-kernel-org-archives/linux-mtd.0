Received: from eddie.linux-mips.org ([148.251.95.138] helo=cvs.linux-mips.org)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eDdAC-0004uQ-8g
 for linux-mtd@lists.infradead.org; Sat, 11 Nov 2017 21:18:07 +0000
Received: (from localhost user: 'ladis' uid#1021 fake: STDIN
 (ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
 id S23990633AbdKKVRmCI13o (ORCPT
 <rfc822;linux-mtd@lists.infradead.org>);
 Sat, 11 Nov 2017 22:17:42 +0100
Date: Sat, 11 Nov 2017 22:17:35 +0100
Sender: Ladislav Michl <ladis@linux-mips.org>
From: Ladislav Michl <ladis@linux-mips.org>
To: linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org
Cc: Roger Quadros <rogerq@ti.com>, Tony Lindgren <tony@atomide.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Kyungmin Park <kyungmin.park@samsung.com>
Subject: [PATCH v4 02/16] ARM: dts: OMAP2+: Add compatible property to
 onenand node
Message-ID: <20171111211735.2a3q5lw4itsltjrw@lenoch>
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

OMAP onenand nodes are missing compatible property, add it.

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
---
 Changes:
 -v4: new patch

 arch/arm/boot/dts/omap2420-n8x0-common.dtsi | 1 +
 arch/arm/boot/dts/omap3-n900.dts            | 1 +
 arch/arm/boot/dts/omap3-n950-n9.dtsi        | 1 +
 arch/arm/boot/dts/omap3430-sdp.dts          | 1 +
 4 files changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/omap2420-n8x0-common.dtsi b/arch/arm/boot/dts/omap2420-n8x0-common.dtsi
index 1de80c7886ab..843f6a2f5e29 100644
--- a/arch/arm/boot/dts/omap2420-n8x0-common.dtsi
+++ b/arch/arm/boot/dts/omap2420-n8x0-common.dtsi
@@ -48,6 +48,7 @@
 	onenand@0,0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
+		compatible = "ti,omap2-onenand";
 		reg = <0 0 0x20000>;	/* CS0, offset 0, IO size 128K */
 
 		gpmc,sync-read;
diff --git a/arch/arm/boot/dts/omap3-n900.dts b/arch/arm/boot/dts/omap3-n900.dts
index 4acd32a1c4ef..aa5b1a439564 100644
--- a/arch/arm/boot/dts/omap3-n900.dts
+++ b/arch/arm/boot/dts/omap3-n900.dts
@@ -838,6 +838,7 @@
 	onenand@0,0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
+		compatible = "ti,omap2-onenand";
 		reg = <0 0 0x20000>;	/* CS0, offset 0, IO size 128K */
 
 		gpmc,sync-read;
diff --git a/arch/arm/boot/dts/omap3-n950-n9.dtsi b/arch/arm/boot/dts/omap3-n950-n9.dtsi
index 1b0bd72945f2..cb3c7b2fce52 100644
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
index d50a105c9dc6..ed65795ccc62 100644
--- a/arch/arm/boot/dts/omap3430-sdp.dts
+++ b/arch/arm/boot/dts/omap3430-sdp.dts
@@ -155,6 +155,7 @@
 		linux,mtd-name= "samsung,kfm2g16q2m-deb8";
 		#address-cells = <1>;
 		#size-cells = <1>;
+		compatible = "ti,omap2-onenand";
 		reg = <2 0 0x20000>;	/* CS2, offset 0, IO size 4 */
 
 		gpmc,device-width = <2>;
-- 
2.11.0
