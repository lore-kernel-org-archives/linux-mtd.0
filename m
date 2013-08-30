From: Huang Shijie <b32955@freescale.com>
To: <broonie@kernel.org>
Subject: [PATCH v3 8/8] ARM: dts: vf610-twr: Add SPI NOR support
Date: Fri, 30 Aug 2013 10:07:29 +0800
Message-ID: <1377828449-18912-9-git-send-email-b32955@freescale.com>
In-Reply-To: <1377828449-18912-1-git-send-email-b32955@freescale.com>
References: <1377828449-18912-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: devicetree@vger.kernel.org, computersforpeace@gmail.com,
 b44548@freescale.com, dedekind1@gmail.com, linux-doc@vger.kernel.org,
 b18965@freescale.com, linux-spi@vger.kernel.org,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, lznuaa@gmail.com, shawn.guo@linaro.org,
 dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

vf610-twr has two s25fl128s SPI NOR flashs connected to QuadSpi0.
Add support for them.

Note: we enable the DDR Quad read for the two NOR flashs which runs
in 66MHz.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 arch/arm/boot/dts/vf610-twr.dts |   36 ++++++++++++++++++++++++++++++++++++
 1 files changed, 36 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/vf610-twr.dts b/arch/arm/boot/dts/vf610-twr.dts
index 1a58678..063e94d 100644
--- a/arch/arm/boot/dts/vf610-twr.dts
+++ b/arch/arm/boot/dts/vf610-twr.dts
@@ -62,3 +62,39 @@
 	pinctrl-0 = <&pinctrl_uart1_1>;
 	status = "okay";
 };
+
+&qspi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_qspi0_1>;
+	num-cs = <2>;
+	fsl,nor-size = <0x1000000>;
+	status = "okay";
+
+	flash0: s25fl128s@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "spansion,s25fl128s";
+		spi-max-frequency = <66000000>;
+		m25p,ddr-quad-read = <1>;
+		reg = <0>;
+
+		partition@0 {
+			label = "s25fl128s-0";
+			reg = <0x0 0x1000000>;
+		};
+	};
+
+	flash1: s25fl128s@1 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "spansion,s25fl128s";
+		spi-max-frequency = <66000000>;
+		m25p,ddr-quad-read = <1>;
+		reg = <1>;
+
+		partition@0x0 {
+			label = "s25fl128s-1";
+			reg = <0x0 0x1000000>;
+		};
+	};
+};
-- 
1.7.1
