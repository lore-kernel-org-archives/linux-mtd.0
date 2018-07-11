Received: from mail-eopbgr720051.outbound.protection.outlook.com
 ([40.107.72.51] helo=NAM05-CO1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fd9gs-00012w-Mt
 for linux-mtd@lists.infradead.org; Wed, 11 Jul 2018 07:37:38 +0000
From: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
To: <boris.brezillon@bootlin.com>, <richard@nod.at>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <marek.vasut@gmail.com>,
 <f.fainelli@gmail.com>, <mmayer@broadcom.com>, <rogerq@ti.com>,
 <ladis@linux-mips.org>, <ada@thorsis.co>, <honghui.zhang@mediatek.com>,
 <miquel.raynal@bootlin.com>, <linus.walleij@linaro.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <nagasureshkumarrelli@gmail.com>, <michals@xilinx.com>, Naga Sureshkumar
 Relli <naga.sureshkumar.relli@xilinx.com>
Subject: [LINUX PATCH v11 1/3] dt-bindings: memory: Add pl353 smc controller
 devicetree binding information
Date: Wed, 11 Jul 2018 13:06:50 +0530
Message-ID: <1531294612-29526-2-git-send-email-naga.sureshkumar.relli@xilinx.com>
In-Reply-To: <1531294612-29526-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
References: <1531294612-29526-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
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
Changes in v11:
 - Changed the subject to dt-bindings
 - Restuctured dt binings to represent peripherals based on ranges property
   as suggested by Boris.
   Now the new bindings uses cs as first address cell value similar to atmel
   EBI/SMC.
 - Added "arm,primecell" as compatible to the existing compatible property
   as per Linus Walleji
 - Changed "aper_clk" to "apb_pclk" as per ARM AMBA peripheral documentation
   as per Linus Walleji.
Changes in v10:
 - Corrected the typos like "should be" to "Must be" and nand to NAND etc..
 - Removed padding to describe size-cells and address-cells
 - Removed timing parameters from DT, and added ->setup_data_interface() hook
   to the driver to read the SDR timings
 - Modified label name from "pl353smcc_0: pl353smcc@e000e000" to
   "smcc: memory-controller@e000e000" as suggested by Miquel
Changes in v9:
 - Addressed below comments given by Randy Dunlap and Miquel Raynal
 - Typos
 - Added extra documentation that explains the HW ECC limitation with SMC
   (Comments given to v8: https://lkml.org/lkml/2018/3/22/23)
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
 .../bindings/memory-controllers/pl353-smc.txt      | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt

diff --git a/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt b/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
new file mode 100644
index 0000000..d56615f
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
@@ -0,0 +1,47 @@
+Device tree bindings for ARM PL353 static memory controller
+
+PL353 static memory controller supports two kinds of memory
+interfaces.i.e NAND and SRAM/NOR interfaces.
+The actual devices are instantiated from the child nodes of pl353 smc node.
+
+Required properties:
+- compatible		: Should be "arm,pl353-smc-r2p1", "arm,primecell".
+- reg			: Controller registers map and length.
+- clock-names		: List of input clock names - "memclk", "apb_pclk"
+			  (See clock bindings for details).
+- clocks		: Clock phandles (see clock bindings for details).
+- address-cells		: Must be 2.
+- size-cells		: Must be 1.
+
+Child nodes:
+ For NAND the "arm,pl353-nand-r2p1" and for NOR the "cfi-flash" drivers are
+supported as child nodes.
+
+for NAND partition information please refer the below file
+Documentation/devicetree/bindings/mtd/partition.txt
+
+Example:
+	smcc: memory-controller@e000e000
+			compatible = "arm,pl353-smc-r2p1", "arm,primecell";
+			clock-names = "memclk", "apb_pclk";
+			clocks = <&clkc 11>, <&clkc 44>;
+			reg = <0xe000e000 0x1000>;
+			#address-cells = <2>;
+			#size-cells = <1>;
+			ranges = <0x0 0x0 0xe1000000 0x1000000 //Nand CS Region
+				  0x1 0x0 0xe2000000 0x2000000 //SRAM/NOR CS Region
+				  0x2 0x0 0xe4000000 0x2000000>; //SRAM/NOR CS Region
+			nand_0: flash@e1000000 {
+				compatible = "arm,pl353-nand-r2p1"
+				reg = <0 0 0x1000000>;
+				(...)
+			};
+			nor0: flash@e2000000 {
+				compatible = "cfi-flash";
+				reg = <1 0 0x2000000>;
+			};
+			nor1: flash@e4000000 {
+				compatible = "cfi-flash";
+				reg = <2 0 0x2000000>;
+			};
+	};
-- 
2.7.4
