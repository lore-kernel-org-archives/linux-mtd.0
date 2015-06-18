From: Stefan Agner <stefan@agner.ch>
To: dwmw2@infradead.org,
	computersforpeace@gmail.com
Subject: [PATCH v6 6/6] ARM: dts: vf-colibri: enable NAND flash controller
Date: Fri, 19 Jun 2015 00:58:39 +0200
Message-Id: <1434668319-6651-7-git-send-email-stefan@agner.ch>
In-Reply-To: <1434668319-6651-1-git-send-email-stefan@agner.ch>
References: <1434668319-6651-1-git-send-email-stefan@agner.ch>
Cc: mark.rutland@arm.com, boris.brezillon@free-electrons.com,
 aaron@tastycactus.com, marb@ixxat.de, pawel.moll@arm.com,
 ijc+devicetree@hellion.org.uk, bpringlemeir@gmail.com,
 linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>,
 sebastian@breakpoint.cc, robh+dt@kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 galak@codeaurora.org, shawn.guo@linaro.org, devicetree@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Enable NAND access by adding pinmux and NAND flash controller node
to device tree. The NAND chips currently used on the Colibri VF61
requires 8-bit ECC per 512 byte page, hence specify 32-bit ECC
strength per 2k page size.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 arch/arm/boot/dts/vf-colibri.dtsi | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/vf-colibri.dtsi b/arch/arm/boot/dts/vf-colibri.dtsi
index fbef082..c009346 100644
--- a/arch/arm/boot/dts/vf-colibri.dtsi
+++ b/arch/arm/boot/dts/vf-colibri.dtsi
@@ -52,6 +52,19 @@
 	pinctrl-0 = <&pinctrl_i2c0>;
 };
 
+&nfc {
+	assigned-clocks = <&clks VF610_CLK_NFC>;
+	assigned-clock-rates = <33000000>;
+	nand-bus-width = <8>;
+	nand-ecc-mode = "hw";
+	nand-ecc-step-size = <2048>;
+	nand-ecc-strength = <32>;
+	nand-on-flash-bbt;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_nfc_1>;
+	status = "okay";
+};
+
 &pwm0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pwm0>;
@@ -156,6 +169,25 @@
 			>;
 		};
 
+		pinctrl_nfc_1: nfcgrp_1 {
+			fsl,pins = <
+				VF610_PAD_PTD23__NF_IO7		0x28df
+				VF610_PAD_PTD22__NF_IO6		0x28df
+				VF610_PAD_PTD21__NF_IO5		0x28df
+				VF610_PAD_PTD20__NF_IO4		0x28df
+				VF610_PAD_PTD19__NF_IO3		0x28df
+				VF610_PAD_PTD18__NF_IO2		0x28df
+				VF610_PAD_PTD17__NF_IO1		0x28df
+				VF610_PAD_PTD16__NF_IO0		0x28df
+				VF610_PAD_PTB24__NF_WE_B	0x28c2
+				VF610_PAD_PTB25__NF_CE0_B	0x28c2
+				VF610_PAD_PTB27__NF_RE_B	0x28c2
+				VF610_PAD_PTC26__NF_RB_B	0x283d
+				VF610_PAD_PTC27__NF_ALE		0x28c2
+				VF610_PAD_PTC28__NF_CLE		0x28c2
+			>;
+		};
+
 		pinctrl_pwm0: pwm0grp {
 			fsl,pins = <
 				VF610_PAD_PTB0__FTM0_CH0		0x1182
-- 
2.4.2
