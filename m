From: Boris BREZILLON <b.brezillon.dev@gmail.com>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
 Rob Herring <robherring2@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Grant Likely <grant.likely@linaro.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Jason Gunthorpe <jgunthorpe@obsidianresearch.com>,
 Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v3 7/9] ARM: dt/sunxi: add NFC node to Allwinner A20 SoC
Date: Wed, 12 Mar 2014 19:07:42 +0100
Message-Id: <1394647664-8258-8-git-send-email-b.brezillon.dev@gmail.com>
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

Add NAND Flash controller node definition to the A20 SoC.

Signed-off-by: Boris BREZILLON <b.brezillon.dev@gmail.com>
---
 arch/arm/boot/dts/sun7i-a20.dtsi |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
index 9ff0948..4c14ed8 100644
--- a/arch/arm/boot/dts/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/sun7i-a20.dtsi
@@ -339,6 +339,17 @@
 		#size-cells = <1>;
 		ranges;
 
+		nfc: nand@01c03000 {
+			compatible = "allwinner,sun4i-nand";
+			reg = <0x01c03000 0x1000>;
+			interrupts = <0 37 4>;
+			clocks = <&ahb_gates 13>, <&nand_clk>;
+			clock-names = "ahb_clk", "sclk";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		emac: ethernet@01c0b000 {
 			compatible = "allwinner,sun4i-a10-emac";
 			reg = <0x01c0b000 0x1000>;
-- 
1.7.9.5
