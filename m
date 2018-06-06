Received: from mail-by2nam01on0047.outbound.protection.outlook.com
 ([104.47.34.47] helo=NAM01-BY2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fQTE9-0002vY-Rb
 for linux-mtd@lists.infradead.org; Wed, 06 Jun 2018 07:51:31 +0000
From: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
To: <boris.brezillon@bootlin.com>, <richard@nod.at>, <wmw2@infradead.org>,
 <computersforpeace@gmail.com>, <marek.vasut@gmail.com>,
 <f.fainelli@gmail.com>, <mmayer@broadcom.com>, <rogerq@ti.com>,
 <ladis@linux-mips.org>, <ada@thorsis.com>, <honghui.zhang@mediatek.com>,
 <miquel.raynal@bootlin.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <nagasureshkumarrelli@gmail.com>, Naga Sureshkumar Relli
 <naga.sureshkumar.relli@xilinx.com>
Subject: [LINUX PATCH v9 1/4] Devicetree: Add pl353 smc controller devicetree
 binding information
Date: Wed, 6 Jun 2018 13:19:39 +0530
Message-ID: <1528271382-21690-2-git-send-email-naga.sureshkumar.relli@xilinx.com>
In-Reply-To: <1528271382-21690-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
References: <1528271382-21690-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
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

Add pl353 static memory controller devicetree binding information.

Signed-off-by: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
---
Changes in v9:
 - Addressed commens given by Randy Dunlap and Miquel Raynal
Changes in v8:
 - None
Changes in v7:
- Corrected clocks description
- prefixed '#' for address and size cells 
Changes in v6:
 - None
Changes in v5:
 - Removed timing properties
Changes in v4:
 - none
Changes in v3:
 - none
Changes in v2:
 - modified timing binding info as per onfi timing parameters
 - add suffix nano second as timing unit
 - modified the clock names as per the IP spec
---
 .../bindings/memory-controllers/pl353-smc.txt      | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt

diff --git a/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt b/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
new file mode 100644
index 0000000..551e66b
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
@@ -0,0 +1,53 @@
+Device tree bindings for ARM PL353 static memory controller
+
+PL353 static memory controller supports two kinds of memory
+interfaces.i.e NAND and SRAM/NOR interfaces.
+The actual devices are instantiated from the child nodes of pl353 smc node.
+
+Required properties:
+- compatible		: Should be "arm,pl353-smc-r2p1"
+- reg			: Controller registers map and length.
+- clock-names		: List of input clock names - "ref_clk", "aper_clk"
+			  (See clock bindings for details).
+- clocks		: Clock phandles (see clock bindings for details).
+- address-cells		: Address cells, must be 1.
+- size-cells		: Size cells. Must be 1.
+
+Child nodes:
+ For NAND the "arm,pl353-nand-r2p1" and for NOR the "cfi-flash" drivers are
+supported as child nodes.
+
+Mandatory timing properties for child nodes:
+- arm,nand-cycle-t0	: Read cycle time(t_rc).
+- arm,nand-cycle-t1	: Write cycle time(t_wc).
+- arm,nand-cycle-t2	: re_n assertion delay(t_rea).
+- arm,nand-cycle-t3	: we_n de-assertion delay(t_wp).
+- arm,nand-cycle-t4	: Status read time(t_clr)
+- arm,nand-cycle-t5	: ID read time(t_ar)
+- arm,nand-cycle-t6	: busy to re_n(t_rr)
+
+for nand partition information please refer the below file
+Documentation/devicetree/bindings/mtd/partition.txt
+
+Example:
+	pl353smcc_0: pl353smcc@e000e000 {
+			compatible = "arm,pl353-smc-r2p1"
+			clock-names = "memclk", "aclk";
+			clocks = <&clkc 11>, <&clkc 44>;
+			reg = <0xe000e000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			nand_0: nand@e1000000 {
+				compatible = "arm,pl353-nand-r2p1"
+				reg = <0xe1000000 0x1000000>;
+				arm,nand-cycle-t0 = <0x4>;
+				arm,nand-cycle-t1 = <0x4>;
+				arm,nand-cycle-t2 = <0x1>;
+				arm,nand-cycle-t3 = <0x2>;
+				arm,nand-cycle-t4 = <0x2>;
+				arm,nand-cycle-t5 = <0x2>;
+				arm,nand-cycle-t6 = <0x4>;
+				(...)
+			};
+	};
-- 
2.7.4
