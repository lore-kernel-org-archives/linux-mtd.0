Received: from mail-eopbgr680088.outbound.protection.outlook.com
 ([40.107.68.88] helo=NAM04-BN3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fqefZ-00023F-7E
 for linux-mtd@lists.infradead.org; Fri, 17 Aug 2018 13:20:02 +0000
From: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
To: <boris.brezillon@bootlin.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <marek.vasut@gmail.com>, <kyungmin.park@samsung.com>,
 <absahu@codeaurora.org>, <peterpandong@micron.com>,
 <frieder.schrempf@exceet.de>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <michals@xilinx.com>, <nagasureshkumarrelli@gmail.com>, Naga Sureshkumar
 Relli <naga.sureshkumar.relli@xilinx.com>
Subject: [LINUX PATCH v10 1/2] dt-bindings: mtd: arasan: Add device tree
 binding documentation
Date: Fri, 17 Aug 2018 18:49:23 +0530
Message-ID: <1534511964-20342-2-git-send-email-naga.sureshkumar.relli@xilinx.com>
In-Reply-To: <1534511964-20342-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
References: <1534511964-20342-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
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

This patch adds the dts binding document for arasan nand flash
controller.

Signed-off-by: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
---
Changes in v10:
- None
Changes in v9:
- None
Changes in v8:
- Updated compatible and clock-names as per Boris comments
Changes in v7:
- Corrected the acronyms those should be in caps 
changes in v6:
- Removed num-cs property
- Separated nandchip from nand controller
changes in v5:
- None
Changes in v4:
- Added num-cs property
- Added clock support
Changes in v3:
- None
Changes in v2:
- None
---
 .../devicetree/bindings/mtd/arasan_nand.txt        | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/arasan_nand.txt

diff --git a/Documentation/devicetree/bindings/mtd/arasan_nand.txt b/Documentation/devicetree/bindings/mtd/arasan_nand.txt
new file mode 100644
index 0000000..234d7ca
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/arasan_nand.txt
@@ -0,0 +1,38 @@
+Arasan NAND Flash Controller with ONFI 3.1 support
+
+Required properties:
+- compatible:		Should be "xlnx,zynqmp-nand" or "arasan,nfc-v3p10"
+- reg:			Memory map for module access
+- interrupt-parent:	Interrupt controller the interrupt is routed through
+- interrupts:		Should contain the interrupt for the device
+- clock-name:		List of input clocks - "sys", "flash"
+			(See clock bindings for details)
+- clocks:		Clock phandles (see clock bindings for details)
+
+Optional properties:
+- arasan,has-mdma: Enables DMA support
+
+For NAND partition information please refer the below file
+Documentation/devicetree/bindings/mtd/partition.txt
+
+Example:
+	nand0: nand@ff100000 {
+		compatible = "xlnx,zynqmp-nand", "arasan,nfc-v3p10"
+		reg = <0x0 0xff100000 0x1000>;
+		clock-name = "sys", "flash"
+		clocks = <&misc_clk &misc_clk>;
+		interrupt-parent = <&gic>;
+		interrupts = <0 14 4>;
+		arasan,has-mdma;
+		#address-cells = <1>;
+		#size-cells = <0>
+
+		nand@0 {
+			reg = <0>
+			partition@0 {
+				label = "filesystem";
+				reg = <0x0 0x0 0x1000000>;
+			};
+			(...)
+		};
+	};
-- 
2.7.4
