Received: from mail-bl2on0116.outbound.protection.outlook.com ([65.55.169.116]
 helo=na01-bl2-obe.outbound.protection.outlook.com)
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZCOTq-0002FN-4F
 for linux-mtd@lists.infradead.org; Tue, 07 Jul 2015 08:43:55 +0000
From: Haikun Wang <haikun.wang@freescale.com>
To: <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>,
 <computersforpeace@gmail.com>, <han.xu@freescale.com>
CC: Haikun Wang <haikun.wang@freescale.com>
Subject: [PATCH 6/8 v2] mtd: spi-nor: fsl-quadspi: Add QSPI dts node for
 LS1021A
Date: Tue, 7 Jul 2015 16:38:18 +0800
Message-ID: <1436258300-21261-6-git-send-email-haikun.wang@freescale.com>
In-Reply-To: <1436258300-21261-1-git-send-email-haikun.wang@freescale.com>
References: <1436258300-21261-1-git-send-email-haikun.wang@freescale.com>
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

Add QSPI dts node for LS1021AQDS and LS1021ATWR boards.

Signed-off-by: Haikun Wang <haikun.wang@freescale.com>
---
Changes in v2:
- Rebase

 arch/arm/boot/dts/ls1021a-qds.dts | 16 ++++++++++++++++
 arch/arm/boot/dts/ls1021a-twr.dts | 13 +++++++++++++
 arch/arm/boot/dts/ls1021a.dtsi    | 15 +++++++++++++++
 3 files changed, 44 insertions(+)

diff --git a/arch/arm/boot/dts/ls1021a-qds.dts b/arch/arm/boot/dts/ls1021a-qds.dts
index 9c5e16b..15bf07f 100644
--- a/arch/arm/boot/dts/ls1021a-qds.dts
+++ b/arch/arm/boot/dts/ls1021a-qds.dts
@@ -238,3 +238,19 @@
 &uart1 {
 	status = "okay";
 };
+
+&qspi {
+	num-cs = <2>;
+	bus-num = <0>;
+	fsl,spi-num-chipselects = <2>;
+	fsl,spi-flash-chipselects = <0>;
+	status = "okay";
+
+	qflash0: s25fl128s@0 {
+		compatible = "spansion,s25fl128s";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		spi-max-frequency = <20000000>;
+		reg = <0>;
+	};
+};
diff --git a/arch/arm/boot/dts/ls1021a-twr.dts b/arch/arm/boot/dts/ls1021a-twr.dts
index a2c591e..b72f6ee 100644
--- a/arch/arm/boot/dts/ls1021a-twr.dts
+++ b/arch/arm/boot/dts/ls1021a-twr.dts
@@ -125,3 +125,16 @@
 &uart1 {
 	status = "okay";
 };
+
+&qspi {
+	num-cs = <2>;
+	status = "okay";
+
+	qflash0: n25q128a13@0 {
+		compatible = "micron,n25q128a13";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		spi-max-frequency = <20000000>;
+		reg = <0>;
+	};
+};
diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.dtsi
index c70bb27..09f1a33 100644
--- a/arch/arm/boot/dts/ls1021a.dtsi
+++ b/arch/arm/boot/dts/ls1021a.dtsi
@@ -127,6 +127,21 @@
 			big-endian;
 		};
 
+		qspi: quadspi@1550000 {
+			compatible = "fsl,ls1-qspi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0 0x1550000 0x0 0x10000>,
+				<0x0 0x40000000 0x0 0x4000000>;
+			reg-names = "QuadSPI", "QuadSPI-memory";
+			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "qspi_en", "qspi";
+			clocks = <&platform_clk 1>, <&platform_clk 1>;
+			big-endian;
+			amba-base = <0x40000000>;
+			status = "disabled";
+		};
+
 		esdhc: esdhc@1560000 {
 			compatible = "fsl,esdhc";
 			reg = <0x0 0x1560000 0x0 0x10000>;
-- 
2.1.0.27.g96db324
