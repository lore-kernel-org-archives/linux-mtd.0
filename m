Received: from mail-io0-x22e.google.com ([2607:f8b0:4001:c06::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1abA8w-0003Iv-1f
 for linux-mtd@lists.infradead.org; Wed, 02 Mar 2016 17:00:59 +0000
Received: by mail-io0-x22e.google.com with SMTP id n190so62966923iof.0
 for <linux-mtd@lists.infradead.org>; Wed, 02 Mar 2016 09:00:37 -0800 (PST)
From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To: jorge.ramirez-ortiz@linaro.org, dwmw2@infradead.org,
 computersforpeace@gmail.com, matthias.bgg@gmail.com, robh@kernel.org
Cc: daniel.thompson@linaro.org, xiaolei.li@mediatek.com,
 linux-mtd@lists.infradead.org, boris.brezillon@free-electrons.com
Subject: [PATCH 3/3] mtd: mediatek: device tree enable NAND in MTK's 2701 evb
Date: Wed,  2 Mar 2016 12:00:13 -0500
Message-Id: <1456938013-8819-4-git-send-email-jorge.ramirez-ortiz@linaro.org>
In-Reply-To: <1456938013-8819-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
References: <1456938013-8819-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

MTK's SoC 2701 implements a Smart Device Gen1 type of NAND controller.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
---
 arch/arm/boot/dts/mt2701-evb.dts |  4 ++++
 arch/arm/boot/dts/mt2701.dtsi    | 12 ++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/mt2701-evb.dts b/arch/arm/boot/dts/mt2701-evb.dts
index 082ca88..296e148 100644
--- a/arch/arm/boot/dts/mt2701-evb.dts
+++ b/arch/arm/boot/dts/mt2701-evb.dts
@@ -27,3 +27,7 @@
 &uart0 {
 	status = "okay";
 };
+
+&nand {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/mt2701.dtsi b/arch/arm/boot/dts/mt2701.dtsi
index 3766904..6191c75 100644
--- a/arch/arm/boot/dts/mt2701.dtsi
+++ b/arch/arm/boot/dts/mt2701.dtsi
@@ -143,4 +143,16 @@
 		clocks = <&uart_clk>;
 		status = "disabled";
 	};
+
+	nand: nfi@1100d000 {
+		compatible = "mediatek,mt2701-nfc";
+		reg = <0 0x1100d000 0 0x1000>, <0 0x1100e000 0 0x1000>;
+		interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_LOW>,
+			<GIC_SPI 55 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&pericfg CLK_PERI_NFI>, <&pericfg CLK_PERI_NFI_ECC>,
+			<&pericfg CLK_PERI_NFI_PAD>;
+		clock-names = "nfi_clk", "nfiecc_clk", "pad_clk";
+		nand-on-flash-bbt;
+		status = "disabled";
+	};
 };
-- 
2.1.4
