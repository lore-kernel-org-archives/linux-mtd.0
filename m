From: Stefan Agner <stefan@agner.ch>
To: shawnguo@kernel.org,
	kernel@pengutronix.de
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@atmel.com, robh+dt@kernel.org, mark.rutland@arm.com,
 han.xu@nxp.com, fabio.estevam@freescale.com, LW@KARO-electronics.de,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Stefan Agner <stefan@agner.ch>
Subject: [PATCH v4 1/2] ARM: dts: imx7: add GPMI NAND
Date: Thu,  1 Jun 2017 19:11:09 -0700
Message-Id: <f883e4738bbe3aca5b7b10ccede1805f053bf265.1496369342.git-series.stefan@agner.ch>
In-Reply-To: <cover.9cbefd91387aefe2522dbb3e6338e4e4efdb5e41.1496369342.git-series.stefan@agner.ch>
References: <cover.9cbefd91387aefe2522dbb3e6338e4e4efdb5e41.1496369342.git-series.stefan@agner.ch>
In-Reply-To: <cover.9cbefd91387aefe2522dbb3e6338e4e4efdb5e41.1496369342.git-series.stefan@agner.ch>
References: <cover.9cbefd91387aefe2522dbb3e6338e4e4efdb5e41.1496369342.git-series.stefan@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add i.MX 7 GPMI NAND module.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 arch/arm/boot/dts/imx7s.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
index c4f12fd..48cfedb 100644
--- a/arch/arm/boot/dts/imx7s.dtsi
+++ b/arch/arm/boot/dts/imx7s.dtsi
@@ -995,5 +995,35 @@
 				status = "disabled";
 			};
 		};
+
+		dma_apbh: dma-apbh@33000000 {
+			compatible = "fsl,imx7d-dma-apbh", "fsl,imx28-dma-apbh";
+			reg = <0x33000000 0x2000>;
+			interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "gpmi0", "gpmi1", "gpmi2", "gpmi3";
+			#dma-cells = <1>;
+			dma-channels = <4>;
+			clocks = <&clks IMX7D_NAND_USDHC_BUS_ROOT_CLK>;
+			clock-names = "dma_apbh_bch", "dma_apbh_io";
+		};
+
+		gpmi: gpmi-nand@33002000{
+			compatible = "fsl,imx7d-gpmi-nand";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0x33002000 0x2000>, <0x33004000 0x4000>;
+			reg-names = "gpmi-nand", "bch";
+			interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "bch";
+			clocks = <&clks IMX7D_NAND_ROOT_CLK>,
+				<&clks IMX7D_NAND_USDHC_BUS_ROOT_CLK>;
+			clock-names = "gpmi_io", "gpmi_bch_apb";
+			dmas = <&dma_apbh 0>;
+			dma-names = "rx-tx";
+			status = "disabled";
+		};
 	};
 };
-- 
git-series 0.9.1
