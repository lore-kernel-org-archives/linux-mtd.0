From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
To: <nicolas.ferre@atmel.com>, <broonie@kernel.org>,
 <linux-spi@vger.kernel.org>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <zajec5@gmail.com>, <beanhuo@micron.com>,
 <juhosg@openwrt.org>, <marex@denx.de>, <shijie.huang@intel.com>,
 <ben@decadent.org.uk>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <robh+dt@kernel.org>, <pawel.moll@arm.com>,
 <mark.rutland@arm.com>, <ijc+devicetree@hellion.org.uk>,
 <galak@codeaurora.org>, <linux-mtd@lists.infradead.org>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>
Subject: [PATCH 6/7] Documentation: atmel-quadspi: add binding file for Atmel
 QSPI driver
Date: Thu, 16 Jul 2015 17:27:53 +0200
Message-ID: <f4bb1c68fcc19b3642110ab0ef9850d6eeca3112.1437059658.git.cyrille.pitchen@atmel.com>
In-Reply-To: <cover.1437059658.git.cyrille.pitchen@atmel.com>
References: <cover.1437059658.git.cyrille.pitchen@atmel.com>
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

This patch documents the DT bindings for the driver of the Atmel QSPI
controller embedded inside sama5d2x SoCs.

Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
---
 .../devicetree/bindings/mtd/atmel-quadspi.txt      | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/atmel-quadspi.txt

diff --git a/Documentation/devicetree/bindings/mtd/atmel-quadspi.txt b/Documentation/devicetree/bindings/mtd/atmel-quadspi.txt
new file mode 100644
index 000000000000..a0d60ac7ae10
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/atmel-quadspi.txt
@@ -0,0 +1,29 @@
+* Atmel Quad Serial Peripheral Interface (QSPI)
+
+Required properties:
+  - compatible : Should be "atmel,sama5d2-qspi"
+  - reg : the first contains the register location and length,
+          the second contains the memory mapping address and length
+  - interrupts : Should contain the interrupt for the device
+  - clocks : The clock needed by the QSPI controller
+  - #address-cells : should be 1
+  - #size-cells : should be 0
+
+Example:
+
+qspi0: qspi@f0020000 {
+	compatible = "atmel,sama5d2-qspi";
+	reg = <0xf0020000 0x100>,
+	      <0xd0000000 0x08000000>;
+	interrupts = <52 IRQ_TYPE_LEVEL_HIGH 7>;
+	clocks = <&qspi0_clk>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_qspi0_default>;
+	status = "okay";
+
+	m25p80@0 {
+		...
+	};
+};
-- 
1.8.2.2
