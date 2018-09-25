Received: from mail-eopbgr730088.outbound.protection.outlook.com
 ([40.107.73.88] helo=NAM05-DM3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g4mLM-0008C3-55
 for linux-mtd@lists.infradead.org; Tue, 25 Sep 2018 12:21:33 +0000
From: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
To: <boris.brezillon@bootlin.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <marek.vasut@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <michals@xilinx.com>, <nagasuresh12@gmail.com>, Naga Sureshkumar Relli
 <naga.sureshkumar.relli@xilinx.com>
Subject: [LINUX PATCH v11 1/3] dt-bindings: mtd: arasan: Add device tree
 binding documentation
Date: Tue, 25 Sep 2018 17:50:29 +0530
Message-ID: <1537878031-22253-2-git-send-email-naga.sureshkumar.relli@xilinx.com>
In-Reply-To: <1537878031-22253-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
References: <1537878031-22253-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
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

This patch adds the dts binding document for arasan nand flash controller

Signed-off-by: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
---
Changes in v11:
 - Updated compatible description as suggested by Boris
 - Removed arasan-has-dma property
Changes in v10:
- None
Changes in v9:
- None
Changes in v8:
- Updated compatible and clock-names as per Boris comments
Changes in v7:
- Corrected the acronyms those should be in caps 
Changes in v6:
- Removed num-cs property
- Separated nandchip from nand controller
Changes in v5:
- None
Changes in v4:
- Added num-cs property
- Added clock support
Changes in v3:
- None
Changes in v2:
- None
---
 .../devicetree/bindings/mtd/arasan_nand.txt        | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/arasan_nand.txt

diff --git a/Documentation/devicetree/bindings/mtd/arasan_nand.txt b/Documentation/devicetree/bindings/mtd/arasan_nand.txt
new file mode 100644
index 0000000..546ed98
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/arasan_nand.txt
@@ -0,0 +1,33 @@
+Arasan NAND Flash Controller with ONFI 3.1 support
+
+Required properties:
+- compatible:		Should be "xlnx,zynqmp-nand", "arasan,nfc-v3p10"
+- reg:			Memory map for module access
+- interrupt-parent:	Interrupt controller the interrupt is routed through
+- interrupts:		Should contain the interrupt for the device
+- clock-name:		List of input clocks - "sys", "flash"
+			(See clock bindings for details)
+- clocks:		Clock phandles (see clock bindings for details)
+
+Required properties for child node:
+- nand-ecc-mode: see nand.txt
+
+For NAND partition information please refer the below file
+Documentation/devicetree/bindings/mtd/partition.txt
+
+Example:
+	nfc: nand@ff100000 {
+		compatible = "xlnx,zynqmp-nand", "arasan,nfc-v3p10"
+		reg = <0x0 0xff100000 0x1000>;
+		clock-name = "sys", "flash"
+		clocks = <&misc_clk &misc_clk>;
+		interrupt-parent = <&gic>;
+		interrupts = <0 14 4>;
+		#address-cells = <1>;
+		#size-cells = <0>
+
+		nand@0 {
+			reg = <0>
+			nand-ecc-mode = "hw";
+		};
+	};
-- 
2.7.4
