Received: from eusmtp01.atmel.com ([212.144.249.243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bCTVg-0005EN-KD
 for linux-mtd@lists.infradead.org; Mon, 13 Jun 2016 15:10:41 +0000
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
To: <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <nicolas.ferre@atmel.com>, <boris.brezillon@free-electrons.com>,
 <marex@denx.de>, <linux-kernel@vger.kernel.org>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>
Subject: [PATCH 1/2] Documentation: atmel-quadspi: add binding file for Atmel
 QSPI driver
Date: Mon, 13 Jun 2016 17:10:25 +0200
Message-ID: <dee7a0e8e6b6fec134a79432a9bcb1553c056ad8.1465830154.git.cyrille.pitchen@atmel.com>
In-Reply-To: <cover.1465830154.git.cyrille.pitchen@atmel.com>
References: <cover.1465830154.git.cyrille.pitchen@atmel.com>
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
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>
---
 .../devicetree/bindings/mtd/atmel-quadspi.txt      | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/atmel-quadspi.txt

diff --git a/Documentation/devicetree/bindings/mtd/atmel-quadspi.txt b/Documentation/devicetree/bindings/mtd/atmel-quadspi.txt
new file mode 100644
index 000000000000..489807005eda
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/atmel-quadspi.txt
@@ -0,0 +1,32 @@
+* Atmel Quad Serial Peripheral Interface (QSPI)
+
+Required properties:
+- compatible:     Should be "atmel,sama5d2-qspi".
+- reg:            Should contain the locations and lengths of the base registers
+                  and the mapped memory.
+- reg-names:      Should contain the resource reg names:
+                  - qspi_base: configuration register address space
+                  - qspi_mmap: memory mapped address space
+- interrupts:     Should contain the interrupt for the device.
+- clocks:         The phandle of the clock needed by the QSPI controller.
+- #address-cells: Should be <1>.
+- #size-cells:    Should be <0>.
+
+Example:
+
+spi@f0020000 {
+	compatible = "atmel,sama5d2-qspi";
+	reg = <0xf0020000 0x100>, <0xd0000000 0x8000000>;
+	reg-names = "qspi_base", "qspi_mmap";
+	interrupts = <52 IRQ_TYPE_LEVEL_HIGH 7>;
+	clocks = <&spi0_clk>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi0_default>;
+	status = "okay";
+
+	m25p80@0 {
+		...
+	};
+};
-- 
1.8.2.2
