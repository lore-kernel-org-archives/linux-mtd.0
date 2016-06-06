From: Aleksei Mamlin <mamlinav@gmail.com>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-sunxi@googlegroups.com, Aleksei Mamlin <mamlinav@gmail.com>
Subject: [PATCH 7/7] ARM: dts: sun7i: Enable NAND on Wexler TAB7200
Date: Mon,  6 Jun 2016 13:24:24 +0300
Message-Id: <1465208664-9366-8-git-send-email-mamlinav@gmail.com>
In-Reply-To: <1465208664-9366-1-git-send-email-mamlinav@gmail.com>
References: <1465208664-9366-1-git-send-email-mamlinav@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Enable the NFC and describe the NAND flash connected to this controller.

Signed-off-by: Aleksei Mamlin <mamlinav@gmail.com>
---
 arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts | 41 ++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts b/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts
index 2f6b21a..42aff91 100644
--- a/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts
+++ b/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts
@@ -159,6 +159,47 @@
 	status = "okay";
 };
 
+&nfc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&nand_pins_a>, <&nand_cs0_pins_a>, <&nand_rb0_pins_a>;
+	status = "okay";
+
+	nand@0 {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		reg = <0>;
+		allwinner,rb = <0>;
+
+		nand-ecc-mode = "hw";
+		nand-on-flash-bbt;
+
+		boot0@0 {
+			label = "boot0";
+			reg = /bits/ 64 <0x0 0x200000>;
+		};
+
+		boot0-rescue@200000 {
+			label = "boot0-rescue";
+			reg = /bits/ 64 <0x200000 0x200000>;
+		};
+
+		uboot@400000 {
+			label = "uboot";
+			reg = /bits/ 64 <0x400000 0x200000>;
+		};
+
+		uboot-rescue@600000 {
+			label = "uboot-rescue";
+			reg = /bits/ 64 <0x600000 0x200000>;
+		};
+
+		main@800000 {
+			label = "main";
+			reg = /bits/ 64 <0x800000 0xff800000>;
+		};
+	};
+};
+
 &ohci0 {
 	status = "okay";
 };
-- 
2.7.3
