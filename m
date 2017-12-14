Received: from mail-bl2nam02on0625.outbound.protection.outlook.com
 ([2a01:111:f400:fe46::625]
 helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ePTqJ-00040N-Qh
 for linux-mtd@lists.infradead.org; Thu, 14 Dec 2017 13:46:46 +0000
From: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
To: <boris.brezillon@free-electrons.com>, <richard@nod.at>,
 <computersforpeace@gmail.com>, <marek.vasut@gmail.com>,
 <cyrille.pitchen@wedev4u.fr>
CC: <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <michals@xilinx.com>, <punnaia@xilinx.com>,
 <nagasuresh12@gmail.com>, Naga Sureshkumar Relli <nagasure@xilinx.com>
Subject: [PATCH v9 1/2] mtd: arasan: Add device tree binding documentation
Date: Thu, 14 Dec 2017 19:14:44 +0530
Message-ID: <20171214134445.4985-2-nagasure@xilinx.com>
In-Reply-To: <20171214134445.4985-1-nagasure@xilinx.com>
References: <20171214134445.4985-1-nagasure@xilinx.com>
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

Signed-off-by: Naga Sureshkumar Relli <nagasure@xilinx.com>
Signed-off-by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
---
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
index 000000000000..1a870153a909
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/arasan_nand.txt
@@ -0,0 +1,38 @@
+Arasan NAND Flash Controller with ONFI 3.1 support
+
+Required properties:
+- compatible: Should be "xlnx,zynqmp-nand" or "arasan,nfc-v3p10"
+- reg: Memory map for module access
+- interrupt-parent: Interrupt controller the interrupt is routed through
+- interrupts: Should contain the interrupt for the device
+- clock-name: List of input clocks - "sys", "flash"
+	      (See clock bindings for details)
+- clocks: Clock phandles (see clock bindings for details)
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
2.13.0
