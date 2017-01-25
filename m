From: Guochun Mao <guochun.mao@mediatek.com>
To: Brian Norris <computersforpeace@gmail.com>, John Crispin <john@phrozen.org>
CC: David Woodhouse <dwmw2@infradead.org>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Russell
 King <linux@armlinux.org.uk>, <linux-mtd@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Guochun
 Mao <guochun.mao@mediatek.com>
Subject: [PATCH v2 2/2] arm: dts: mt2701: add nor flash node
Date: Wed, 25 Jan 2017 11:38:35 +0800
Message-ID: <1485315515-29942-3-git-send-email-guochun.mao@mediatek.com>
In-Reply-To: <1485315515-29942-1-git-send-email-guochun.mao@mediatek.com>
References: <1485315515-29942-1-git-send-email-guochun.mao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add Mediatek nor flash node.

Signed-off-by: Guochun Mao <guochun.mao@mediatek.com>
---
 arch/arm/boot/dts/mt2701-evb.dts |   25 +++++++++++++++++++++++++
 arch/arm/boot/dts/mt2701.dtsi    |   12 ++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/mt2701-evb.dts b/arch/arm/boot/dts/mt2701-evb.dts
index 082ca88..85e5ae8 100644
--- a/arch/arm/boot/dts/mt2701-evb.dts
+++ b/arch/arm/boot/dts/mt2701-evb.dts
@@ -24,6 +24,31 @@
 	};
 };
 
+&nor_flash {
+	pinctrl-names = "default";
+	pinctrl-0 = <&nor_pins_default>;
+	status = "okay";
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+	};
+};
+
+&pio {
+	nor_pins_default: nor {
+		pins1 {
+			pinmux = <MT2701_PIN_240_EXT_XCS__FUNC_EXT_XCS>,
+				 <MT2701_PIN_241_EXT_SCK__FUNC_EXT_SCK>,
+				 <MT2701_PIN_239_EXT_SDIO0__FUNC_EXT_SDIO0>,
+				 <MT2701_PIN_238_EXT_SDIO1__FUNC_EXT_SDIO1>,
+				 <MT2701_PIN_237_EXT_SDIO2__FUNC_EXT_SDIO2>,
+				 <MT2701_PIN_236_EXT_SDIO3__FUNC_EXT_SDIO3>;
+			drive-strength = <MTK_DRIVE_4mA>;
+			bias-pull-up;
+		};
+	};
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/mt2701.dtsi b/arch/arm/boot/dts/mt2701.dtsi
index bdf8954..1eefce4 100644
--- a/arch/arm/boot/dts/mt2701.dtsi
+++ b/arch/arm/boot/dts/mt2701.dtsi
@@ -227,6 +227,18 @@
 		status = "disabled";
 	};
 
+	nor_flash: spi@11014000 {
+		compatible = "mediatek,mt2701-nor",
+			     "mediatek,mt8173-nor";
+		reg = <0 0x11014000 0 0xe0>;
+		clocks = <&pericfg CLK_PERI_FLASH>,
+			 <&topckgen CLK_TOP_FLASH_SEL>;
+		clock-names = "spi", "sf";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+	};
+
 	mmsys: syscon@14000000 {
 		compatible = "mediatek,mt2701-mmsys", "syscon";
 		reg = <0 0x14000000 0 0x1000>;
-- 
1.7.9.5
