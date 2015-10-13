Received: from mail-ob0-f169.google.com ([209.85.214.169])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZloZ7-0006Ev-4S
 for linux-mtd@lists.infradead.org; Tue, 13 Oct 2015 01:39:45 +0000
Received: by obbda8 with SMTP id da8so2595087obb.1
 for <linux-mtd@lists.infradead.org>; Mon, 12 Oct 2015 18:39:26 -0700 (PDT)
From: Franklin S Cooper Jr <fcooper@ti.com>
To: linux-kernel@vger.kernel.org, rogerq@ti.com, devicetree@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org, nsekhar@ti.com,
 computersforpeace@gmail.com, dwmw2@infradead.org, tony@atomide.com
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH 4/5] ARM: dts: am437x/am33xx/omap3/dm816x: Add gpmc dma channel
Date: Mon, 12 Oct 2015 20:38:57 -0500
Message-Id: <1444700338-27582-5-git-send-email-fcooper@ti.com>
In-Reply-To: <1444700338-27582-1-git-send-email-fcooper@ti.com>
References: <1444700338-27582-1-git-send-email-fcooper@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add dma channel information to the gpmc. Although not enabled by
default this will allow prefetch-dma to be used.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 arch/arm/boot/dts/am33xx.dtsi | 2 ++
 arch/arm/boot/dts/am4372.dtsi | 2 ++
 arch/arm/boot/dts/dm816x.dtsi | 2 ++
 arch/arm/boot/dts/omap3.dtsi  | 2 ++
 4 files changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
index e065f21..f2d8eed 100644
--- a/arch/arm/boot/dts/am33xx.dtsi
+++ b/arch/arm/boot/dts/am33xx.dtsi
@@ -819,6 +819,8 @@
 			ti,no-idle-on-init;
 			reg = <0x50000000 0x2000>;
 			interrupts = <100>;
+			dmas = <&edma 52>;
+			dma-names = "rxtx";
 			gpmc,num-cs = <7>;
 			gpmc,num-waitpins = <2>;
 			#address-cells = <2>;
diff --git a/arch/arm/boot/dts/am4372.dtsi b/arch/arm/boot/dts/am4372.dtsi
index ec8b7a3..c02061b 100644
--- a/arch/arm/boot/dts/am4372.dtsi
+++ b/arch/arm/boot/dts/am4372.dtsi
@@ -841,6 +841,8 @@
 		gpmc: gpmc@50000000 {
 			compatible = "ti,am3352-gpmc";
 			ti,hwmods = "gpmc";
+			dmas = <&edma 52>;
+			dma-names = "rxtx";
 			clocks = <&l3s_gclk>;
 			clock-names = "fck";
 			reg = <0x50000000 0x2000>;
diff --git a/arch/arm/boot/dts/dm816x.dtsi b/arch/arm/boot/dts/dm816x.dtsi
index 68fb444..d2e5d31 100644
--- a/arch/arm/boot/dts/dm816x.dtsi
+++ b/arch/arm/boot/dts/dm816x.dtsi
@@ -180,6 +180,8 @@
 			#address-cells = <2>;
 			#size-cells = <1>;
 			interrupts = <100>;
+			dmas = <&edma 52>;
+			dma-names = "rxtx";
 			gpmc,num-cs = <6>;
 			gpmc,num-waitpins = <2>;
 			gpio-controller;
diff --git a/arch/arm/boot/dts/omap3.dtsi b/arch/arm/boot/dts/omap3.dtsi
index 7f212b6..9dbbcf6 100644
--- a/arch/arm/boot/dts/omap3.dtsi
+++ b/arch/arm/boot/dts/omap3.dtsi
@@ -717,6 +717,8 @@
 			ti,hwmods = "gpmc";
 			reg = <0x6e000000 0x02d0>;
 			interrupts = <20>;
+			dmas = <&sdma 4>;
+			dma-names = "rxtx";
 			gpmc,num-cs = <8>;
 			gpmc,num-waitpins = <4>;
 			#address-cells = <2>;
-- 
2.6.1
