Received: from bes.se.axis.com ([195.60.68.10])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b8NMd-000094-2K
 for linux-mtd@lists.infradead.org; Thu, 02 Jun 2016 07:48:23 +0000
Date: Thu, 2 Jun 2016 09:47:59 +0200
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Benoit Cousson <bcousson@baylibre.com>, Tony Lindgren
 <tony@atomide.com>, David Woodhouse <dwmw2@infradead.org>
CC: Linux mtd <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/4] dts: Add Evatronix NAND flash driver to ARTPEC-6 dtsi
Message-ID: <alpine.DEB.2.02.1606020947300.19416@lnxricardw1.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 8BIT
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Add Evatronix NANDFLASH-CTRL NAND flash controller to ARTPEC-6 SoC.

ONFi mode 2 timing has been set as this is compatible also with non-ONFi
SLC NAND flashes, with higher throughput than the default ONFi mode 0.

Signed-off-by: Ricard Wanderlof <ricardw@axis.com>
---
 arch/arm/boot/dts/artpec6.dtsi |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/artpec6.dtsi b/arch/arm/boot/dts/artpec6.dtsi
index 3043016..17f6924 100644
--- a/arch/arm/boot/dts/artpec6.dtsi
+++ b/arch/arm/boot/dts/artpec6.dtsi
@@ -266,5 +266,24 @@
 			clock-names = "uart_clk", "apb_pclk";
 			status = "disabled";
 		};
+		nand: nand@f801e000 {
+			compatible = "evatronix,nandflash-ctrl";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0xf801e000 0x0200>;
+			interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
+			/* ONFi mode 2 timing */
+			/* Order is TIME_SEQ_0, TIME_SEQ_1, TIMINGS_ASYN,
+			 * TIME_GEN_SEQ_0, _1, _2, _3
+			 */
+			evatronix,timings = <0x080a0a32 0x0007020a 0x00000023
+					     0x00000000 0x00000000 0x00000000
+					     0x00000000>;
+			nand-ecc-mode = "hw";
+			nand-ecc-algo = "bch";
+			nand-on-flash-bbt;
+			nand-ecc-strength = <8>;
+			nand-ecc-step-size = <512>;
+		};
 	};
 };
-- 
1.7.10.4

-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
