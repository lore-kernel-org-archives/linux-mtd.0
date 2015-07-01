Received: from mail-qg0-f53.google.com ([209.85.192.53])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZAOWt-0004A1-1P
 for linux-mtd@lists.infradead.org; Wed, 01 Jul 2015 20:22:47 +0000
Received: by qgeg89 with SMTP id g89so24217072qge.3
 for <linux-mtd@lists.infradead.org>; Wed, 01 Jul 2015 13:22:31 -0700 (PDT)
From: Cory Tusar <cory.tusar@pid1solutions.com>
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com,
 ijc+devicetree@hellion.org.uk, galak@codeaurora.org, shawnguo@kernel.org,
 kernel@pengutronix.de, han.xu@freescale.com, dwmw2@infradead.org,
 computersforpeace@gmail.com
Cc: stefan@agner.ch, linux@arm.linux.org.uk, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, andrew@lunn.ch,
 Cory Tusar <cory.tusar@pid1solutions.com>
Subject: [RFC PATCH 7/7] ARM: dts: vf610-twr: Enable QSPI and map flash
 devices.
Date: Wed,  1 Jul 2015 16:20:10 -0400
Message-Id: <1435782010-9809-9-git-send-email-cory.tusar@pid1solutions.com>
In-Reply-To: <1435782010-9809-1-git-send-email-cory.tusar@pid1solutions.com>
References: <1435782010-9809-1-git-send-email-cory.tusar@pid1solutions.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This commit enables the qspi0 functional block, and maps the two
flash devices connected to QSPI0_A_CS0 and QSPI0_B_CS0 to individual MTD
devices.

Tested using mtd_readtest, mtd_speedtest, and mtd_stresstest on a Rev. H
TWR board.

Signed-off-by: Cory Tusar <cory.tusar@pid1solutions.com>
---
 arch/arm/boot/dts/vf610-twr.dts | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm/boot/dts/vf610-twr.dts b/arch/arm/boot/dts/vf610-twr.dts
index 375ab23..6ae2e7c 100644
--- a/arch/arm/boot/dts/vf610-twr.dts
+++ b/arch/arm/boot/dts/vf610-twr.dts
@@ -246,6 +246,23 @@
 			>;
 		};
 
+		pinctrl_qspi0: qspi0grp {
+			fsl,pins = <
+				VF610_PAD_PTD0__QSPI0_A_QSCK		0x31e2
+				VF610_PAD_PTD1__QSPI0_A_CS0		0x31e2
+				VF610_PAD_PTD2__QSPI0_A_DATA3		0x31e3
+				VF610_PAD_PTD3__QSPI0_A_DATA2		0x31e3
+				VF610_PAD_PTD4__QSPI0_A_DATA1		0x31e3
+				VF610_PAD_PTD5__QSPI0_A_DATA0		0x31e3
+				VF610_PAD_PTD7__QSPI0_B_QSCK		0x31e2
+				VF610_PAD_PTD8__QSPI0_B_CS0		0x31e2
+				VF610_PAD_PTD9__QSPI0_B_DATA3		0x31e3
+				VF610_PAD_PTD10__QSPI0_B_DATA2		0x31e3
+				VF610_PAD_PTD11__QSPI0_B_DATA1		0x31e3
+				VF610_PAD_PTD12__QSPI0_B_DATA0		0x31e3
+			>;
+		};
+
 		pinctrl_sai2: sai2grp {
 			fsl,pins = <
 				VF610_PAD_PTA16__SAI2_TX_BCLK		0x02ed
@@ -280,6 +297,28 @@
 	status = "okay";
 };
 
+&qspi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_qspi0>;
+	status = "okay";
+
+	flash0: s25fl128s@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "spansion,s25fl128s";
+		spi-max-frequency = <66000000>;
+		reg = <0>;
+	};
+
+	flash1: s25fl128s@2 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "spansion,s25fl128s";
+		spi-max-frequency = <66000000>;
+		reg = <2>;
+	};
+};
+
 &sai2 {
 	#sound-dai-cells = <0>;
 	pinctrl-names = "default";
-- 
2.3.6
