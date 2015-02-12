From: Antoine Tenart <antoine.tenart@free-electrons.com>
To: sebastian.hesselbarth@gmail.com, ezequiel.garcia@free-electrons.com,
 dwmw2@infradead.org, computersforpeace@gmail.com
Subject: [PATCH v2 09/10] ARM: berlin: add BG2Q node for the nand
Date: Thu, 12 Feb 2015 15:53:35 +0100
Message-Id: <1423752816-26219-10-git-send-email-antoine.tenart@free-electrons.com>
In-Reply-To: <1423752816-26219-1-git-send-email-antoine.tenart@free-electrons.com>
References: <1423752816-26219-1-git-send-email-antoine.tenart@free-electrons.com>
Cc: thomas.petazzoni@free-electrons.com, boris.brezillon@free-electrons.com,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 linux-kernel@vger.kernel.org, zmxu@marvell.com, linux-mtd@lists.infradead.org,
 jszhang@marvell.com, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add a node describing the nand controller of the Marvell Berlin BG2Q
SoC. It uses the pxa3xx nand driver, with a dedicated compatible.

Also add the corresponding pinmuxing configuration.

Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
---
 arch/arm/boot/dts/berlin2q.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/berlin2q.dtsi b/arch/arm/boot/dts/berlin2q.dtsi
index e2f61f27944e..9f5d48b68e16 100644
--- a/arch/arm/boot/dts/berlin2q.dtsi
+++ b/arch/arm/boot/dts/berlin2q.dtsi
@@ -429,6 +429,19 @@
 			status = "disabled";
 		};
 
+		nand0: nand@f00000 {
+			compatible = "marvell,berlin2-nand";
+			reg = <0xf00000 0x10000>;
+			interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&chip CLKID_NFC>,
+				 <&chip CLKID_NFC_ECC>;
+			clock-names = "nfc", "ecc";
+
+			#address-cells = <1>;
+
+			status = "disabled";
+		};
+
 		apb@fc0000 {
 			compatible = "simple-bus";
 			#address-cells = <1>;
-- 
2.3.0
