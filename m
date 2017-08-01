From: Vignesh R <vigneshr@ti.com>
To: Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Rob Herring <robh+dt@kernel.org>, Santosh
 Shilimkar <ssantosh@kernel.org>
CC: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>,
 <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 Vignesh R <vigneshr@ti.com>
Subject: [PATCH 5/7] ARM: dts: keystone-k2g-evm: Add QSPI node
Date: Tue, 1 Aug 2017 10:24:32 +0530
Message-ID: <20170801045434.8733-6-vigneshr@ti.com>
In-Reply-To: <20170801045434.8733-1-vigneshr@ti.com>
References: <20170801045434.8733-1-vigneshr@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

66AK2G EVM has a s25fl512s flash connected to QSPI CS0. Add pinmux for
QSPI and DT entries for the same.

Signed-off-by: Vignesh R <vigneshr@ti.com>
---
 arch/arm/boot/dts/keystone-k2g-evm.dts | 69 ++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm/boot/dts/keystone-k2g-evm.dts b/arch/arm/boot/dts/keystone-k2g-evm.dts
index 61883cb969d2..55d632977e8f 100644
--- a/arch/arm/boot/dts/keystone-k2g-evm.dts
+++ b/arch/arm/boot/dts/keystone-k2g-evm.dts
@@ -34,6 +34,18 @@
 			K2G_CORE_IOPAD(0x11d0) (BUFFER_CLASS_B | PIN_PULLDOWN | MUX_MODE0)	/* uart0_txd.uart0_txd */
 		>;
 	};
+
+	qspi_pins: pinmux_qspi_pins {
+		pinctrl-single,pins = <
+			K2G_CORE_IOPAD(0x1204) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* qspi_clk.qspi_clk */
+			K2G_CORE_IOPAD(0x1208) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* qspi_rclk.qspi_rclk */
+			K2G_CORE_IOPAD(0x120c) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* qspi_d0.qspi_d0 */
+			K2G_CORE_IOPAD(0x1210) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* qspi_d1.qspi_d1 */
+			K2G_CORE_IOPAD(0x1214) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* qspi_d2.qspi_d2 */
+			K2G_CORE_IOPAD(0x1218) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* qspi_d3.qspi_d3 */
+			K2G_CORE_IOPAD(0x121c) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* qspi_csn0.qspi_csn0 */
+		>;
+	};
 };
 
 &uart0 {
@@ -41,3 +53,60 @@
 	pinctrl-0 = <&uart0_pins>;
 	status = "okay";
 };
+
+&qspi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&qspi_pins>;
+	cdns,rclk-en;
+	status = "okay";
+
+	flash0: m25p80@0 {
+		compatible = "s25fl512s", "jedec,spi-nor";
+		reg = <0>;
+		spi-tx-bus-width = <1>;
+		spi-rx-bus-width = <4>;
+		spi-max-frequency = <96000000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		cdns,read-delay = <5>;
+		cdns,tshsl-ns = <500>;
+		cdns,tsd2d-ns = <500>;
+		cdns,tchsh-ns = <119>;
+		cdns,tslch-ns = <119>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "QSPI.u-boot";
+				reg = <0x00000000 0x00100000>;
+			};
+			partition@100000 {
+				label = "QSPI.u-boot-env";
+				reg = <0x00100000 0x00040000>;
+			};
+			partition@140000 {
+				label = "QSPI.skern";
+				reg = <0x00140000 0x0040000>;
+			};
+			partition@180000 {
+				label = "QSPI.sci-firmware";
+				reg = <0x00180000 0x0040000>;
+			};
+			partition@1c0000 {
+				label = "QSPI.kernel";
+				reg = <0x001c0000 0x0800000>;
+			};
+			partition@9c0000 {
+				label = "QSPI.u-boot-spl-os";
+				reg = <0x009c0000 0x0040000>;
+			};
+			partition@a00000 {
+				label = "QSPI.file-system";
+				reg = <0x00a00000 0x3600000>;
+			};
+		};
+	};
+};
-- 
2.13.3
