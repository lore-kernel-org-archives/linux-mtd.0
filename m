Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eC5HR-0005Lk-5p
 for linux-mtd@lists.infradead.org; Tue, 07 Nov 2017 14:55:16 +0000
From: Miquel Raynal <miquel.raynal@free-electrons.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 Nadav Haklai <nadavh@marvell.com>,
 Miquel Raynal <miquel.raynal@free-electrons.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Wenyou Yang <wenyou.yang@atmel.com>, Josh Wu <rainyfeeling@outlook.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, Han Xu <han.xu@nxp.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Stefan Agner <stefan@agner.ch>
Subject: [RFC PATCH v2 5/6] dt-bindings: mtd: add Marvell NAND controller
 documentation
Date: Tue,  7 Nov 2017 15:54:18 +0100
Message-Id: <20171107145419.22717-6-miquel.raynal@free-electrons.com>
In-Reply-To: <20171107145419.22717-1-miquel.raynal@free-electrons.com>
References: <20171107145419.22717-1-miquel.raynal@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Document the bindings for the legacy and the new bindings relative to
Marvell NAND controller driver rework.

Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
---
 .../devicetree/bindings/mtd/marvell-nand.txt       | 84 ++++++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/marvell-nand.txt

diff --git a/Documentation/devicetree/bindings/mtd/marvell-nand.txt b/Documentation/devicetree/bindings/mtd/marvell-nand.txt
new file mode 100644
index 000000000000..0b3d5e0bab83
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/marvell-nand.txt
@@ -0,0 +1,84 @@
+Marvell NAND Flash Controller (NFC)
+
+Required properties:
+- compatible: can be one of the following:
+    * "marvell,armada-8k-nand-controller"
+    * "marvell,armada370-nand-controller"
+    * "marvell,pxa3xx-nand-controller"
+    * "marvell,armada-8k-nand" (deprecated)
+    * "marvell,armada370-nand" (deprecated)
+    * "marvell,pxa3xx-nand" (deprecated)
+- reg: NAND flash controller memory area.
+- #address-cells: shall be set to 1. Encode the NAND CS.
+- #size-cells: shall be set to 0.
+- interrupts: shall define the NAND controller interrupt.
+- clocks: shall reference the NAND controller clock.
+- marvell,system-controller: Set to retrieve the syscon node that handles
+  NAND controller related registers (only required with the
+  "marvell,armada-8k-nand[-controller]" compatibles).
+
+Optional properties:
+- label: see partition.txt. New platforms shall omit this property.
+- dmas: shall reference DMA channel associated to the NAND controller.
+- dma-names: shall be "rxtx".
+
+Optional children nodes:
+Children nodes represent the available NAND chips.
+
+Required properties:
+- reg: shall contain the native Chip Select ids (0-3)
+- marvell,rb: shall contain the native Ready/Busy ids (0-1)
+
+Optional properties:
+- marvell,nand-keep-config: orders the driver not to take the timings
+  from the core and leaving them completely untouched. Bootloader
+  timings will then be used.
+- nand-on-flash-bbt: see nand.txt.
+- nand-ecc-mode: see nand.txt. Will use hardware ECC if not specified.
+- nand-ecc-algo: see nand.txt. This property may be added when using
+  hardware ECC for clarification but will be ignored by the driver
+  because ECC mode is chosen depending on the page size and the strength
+  required by the NAND chip. This value may be overwritten with
+  nand-ecc-strength property.
+- nand-ecc-strength: see nand.txt.
+- nand-ecc-step-size: see nand.txt. This has no effect and will be
+  ignored by the driver when using hardware ECC because Marvell's NAND
+  flash controller does use fixed strength (1-bit for Hamming, 16-bit
+  for BCH), so the step size will shrink or grow in order to fit the
+  required strength. Step sizes are not completely random for all and
+  follow certain patterns described in AN-379, "Marvell SoC NFC ECC".
+
+See Documentation/devicetree/bindings/mtd/nand.txt for more details on
+generic bindings.
+
+
+Example:
+nand_controller: nand-controller@d0000 {
+	compatible = "marvell,armada370-nand-controller";
+	reg = <0xd0000 0x54>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
+	clocks = <&coredivclk 0>;
+
+	nand@0 {
+		reg = <0>;
+		marvell,rb = <0>;
+		nand-ecc-mode = "hw";
+		marvell,nand-keep-config;
+		nand-on-flash-bbt;
+		nand-ecc-strength = <4>;
+		nand-ecc-step-size = <512>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "Rootfs";
+				reg = <0x00000000 0x40000000>;
+			};
+		};
+	};
+};
-- 
2.11.0
