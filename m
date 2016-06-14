From: Aleksei Mamlin <mamlinav@gmail.com>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-sunxi@googlegroups.com, Aleksei Mamlin <mamlinav@gmail.com>
Subject: [PATCH v2 4/4] ARM: dts: sun7i: Add NFC node to Allwinner A20 SoC
Date: Tue, 14 Jun 2016 14:17:38 +0300
Message-Id: <1465903058-9211-5-git-send-email-mamlinav@gmail.com>
In-Reply-To: <1465903058-9211-1-git-send-email-mamlinav@gmail.com>
References: <1465208664-9366-1-git-send-email-mamlinav@gmail.com>
 <1465903058-9211-1-git-send-email-mamlinav@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Boris Brezillon <boris.brezillon@free-electrons.com>

Add NAND Flash controller node definition to the A20 SoC.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Signed-off-by: Aleksei Mamlin <mamlinav@gmail.com>
---
 arch/arm/boot/dts/sun7i-a20.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
index ad984f8..7d7560f 100644
--- a/arch/arm/boot/dts/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/sun7i-a20.dtsi
@@ -798,6 +798,19 @@
 			#dma-cells = <2>;
 		};
 
+		nfc: nand@01c03000 {
+			compatible = "allwinner,sun4i-a10-nand";
+			reg = <0x01c03000 0x1000>;
+			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;;
+			clocks = <&ahb_gates 13>, <&nand_clk>;
+			clock-names = "ahb", "mod";
+			dmas = <&dma SUN4I_DMA_DEDICATED 3>;
+			dma-names = "rxtx";
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
 		spi0: spi@01c05000 {
 			compatible = "allwinner,sun4i-a10-spi";
 			reg = <0x01c05000 0x1000>;
-- 
2.7.3
