From: Boris BREZILLON <b.brezillon.dev@gmail.com>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
 Rob Herring <robherring2@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Grant Likely <grant.likely@linaro.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Jason Gunthorpe <jgunthorpe@obsidianresearch.com>,
 Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v3 9/9] ARM: sunxi/dt: enable NAND on cubietruck board
Date: Wed, 12 Mar 2014 19:07:44 +0100
Message-Id: <1394647664-8258-10-git-send-email-b.brezillon.dev@gmail.com>
In-Reply-To: <1394647664-8258-1-git-send-email-b.brezillon.dev@gmail.com>
References: <1394647664-8258-1-git-send-email-b.brezillon.dev@gmail.com>
Cc: devicetree@vger.kernel.org, Boris BREZILLON <b.brezillon.dev@gmail.com>,
 linux-doc@vger.kernel.org, dev@linux-sunxi.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Enable the NFC and describe the NAND flash connected to this controller.

Signed-off-by: Boris BREZILLON <b.brezillon.dev@gmail.com>
---
 arch/arm/boot/dts/sun7i-a20-cubietruck.dts |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/sun7i-a20-cubietruck.dts b/arch/arm/boot/dts/sun7i-a20-cubietruck.dts
index f9dcb61..7b48539 100644
--- a/arch/arm/boot/dts/sun7i-a20-cubietruck.dts
+++ b/arch/arm/boot/dts/sun7i-a20-cubietruck.dts
@@ -19,6 +19,23 @@
 	compatible = "cubietech,cubietruck", "allwinner,sun7i-a20";
 
 	soc@01c00000 {
+		nfc: nand@01c03000 {
+			pinctrl-names = "default";
+			pinctrl-0 = <&nand_pins_a &nand_cs0_pins_a &nand_rb0_pins_a>;
+			status = "okay";
+
+			nand@0 {
+				#address-cells = <2>;
+				#size-cells = <2>;
+				reg = <0>;
+				allwinner,rb = <0>;
+				nand-ecc-mode = "hw";
+				onfi,nand-timing-mode = <0x1f>;
+				nand-ecc-strength = <40>;
+				nand-ecc-step-size = <1024>;
+			};
+		};
+
 		pinctrl@01c20800 {
 			led_pins_cubietruck: led_pins@0 {
 				allwinner,pins = "PH7", "PH11", "PH20", "PH21";
-- 
1.7.9.5
