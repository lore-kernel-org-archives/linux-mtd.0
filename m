Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VlDCN-0002mW-Gm
 for linux-mtd@lists.infradead.org; Tue, 26 Nov 2013 07:36:45 +0000
From: Sourav Poddar <sourav.poddar@ti.com>
To: <computersforpeace@gmail.com>, <broonie@kernel.org>,
 <linux-mtd@lists.infradead.org>, <linux-spi@vger.kernel.org>
Subject: [PATCH 15/17] arm: dts: dra7: Add qspi device.
Date: Tue, 26 Nov 2013 13:05:11 +0530
Message-ID: <1385451313-1875-16-git-send-email-sourav.poddar@ti.com>
In-Reply-To: <1385451313-1875-1-git-send-email-sourav.poddar@ti.com>
References: <1385451313-1875-1-git-send-email-sourav.poddar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: devicetree@vger.kernel.org, Sourav Poddar <sourav.poddar@ti.com>,
 linux-omap@vger.kernel.org, bcousson@baylibre.com, balbi@ti.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

These add device tree entry for qspi controller driver on dra7.

Signed-off-by: Sourav Poddar <sourav.poddar@ti.com>
---
 arch/arm/boot/dts/dra7-evm.dts |   32 ++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/dra7.dtsi    |   13 +++++++++++++
 2 files changed, 45 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/dra7-evm.dts b/arch/arm/boot/dts/dra7-evm.dts
index 5babba0..2c8753a 100644
--- a/arch/arm/boot/dts/dra7-evm.dts
+++ b/arch/arm/boot/dts/dra7-evm.dts
@@ -93,6 +93,21 @@
 			0x24c (PIN_INPUT_SLEW | MUX_MODE0) /* uart3_txd */
 		>;
 	};
+
+	qspi1_pins: pinmux_qspi1_pins {
+		pinctrl-single,pins = <
+			0x4c 0x40001  /* gpmc_a3.qspi1_cs2 */
+			0x50 0x40001  /* gpmc_a4.qspi1_cs3 */
+			0x74 0x40001  /* gpmc_a13.qspi1_rtclk */
+			0x78 0x40001  /* gpmc_a14.qspi1_d3 */
+			0x7c 0x40001  /* gpmc_a15.qspi1_d2 */
+			0x80 0x40001  /* gpmc_a16.qspi1_d1 */
+			0x84 0x40001  /* gpmc_a17.qspi1_d0 */
+			0x88 0x40001  /* qpmc_a18.qspi1_sclk */
+			0xb8 0x60001  /* gpmc_cs2.qspi1_cs0 */
+			0xbc 0x60001  /* gpmc_cs3.qspi1_cs1 */
+		>;
+	};
 };
 
 &i2c1 {
@@ -273,3 +288,20 @@
 &cpu0 {
 	cpu0-supply = <&smps123_reg>;
 };
+
+&qspi {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&qspi1_pins>;
+
+	spi-max-frequency = <48000000>;
+	m25p80@0 {
+		compatible = "s25fl256s1";
+		spi-max-frequency = <48000000>;
+		reg = <0>;
+		spi-tx-bus-width = <1>;
+		spi-rx-bus-width = <4>;
+		spi-cpol;
+		spi-cpha;
+	};
+};
diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
index 67275c8..b06d899 100644
--- a/arch/arm/boot/dts/dra7.dtsi
+++ b/arch/arm/boot/dts/dra7.dtsi
@@ -582,6 +582,19 @@
 			dma-names = "tx0", "rx0";
 			status = "disabled";
 		};
+
+		qspi: qspi@4b300000 {
+			compatible = "ti,dra7xxx-qspi";
+			reg = <0x4b300000 0x100>, <0x4a002558 0x4>,
+					<0x5c000000 0x3ffffff>;
+			reg-names = "qspi_base", "qspi_ctrlmod", "qspi_mmap";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			ti,hwmods = "qspi";
+			num-cs = <4>;
+			interrupts = <0 124 0x4>;
+			status = "disabled";
+		};
 	};
 
 	clocks {
-- 
1.7.1
