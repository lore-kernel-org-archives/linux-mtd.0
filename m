Received: from mail-bn1on0081.outbound.protection.outlook.com ([157.56.110.81]
 helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z21T6-00047e-52
 for linux-mtd@lists.infradead.org; Mon, 08 Jun 2015 18:08:16 +0000
From: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>
To: <robh+dt@kernel.org>, <pawel.moll@arm.com>, <mark.rutland@arm.com>,
 <ijc+devicetree@hellion.org.uk>, <galak@codeaurora.org>, <rob@landley.net>,
 <michal.simek@xilinx.com>, <grant.likely@linaro.org>,
 <gregkh@linuxfoundation.org>, <jason@lakedaemon.net>,
 <ezequiel.garcia@free-electrons.com>, <arnd@arndb.de>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <artem.bityutskiy@linux.intel.com>,
 <jussi.kivilinna@iki.fi>, <acourbot@nvidia.com>, <ivan.khoronzhuk@ti.com>,
 <joern@logfs.org>
Subject: [PATCH v7 1/2] Devicetree: Add pl353 smc controller devicetree
 binding information
Date: Mon, 8 Jun 2015 23:37:36 +0530
Message-ID: <1433786857-32575-2-git-send-email-punnaia@xilinx.com>
In-Reply-To: <1433786857-32575-1-git-send-email-punnaia@xilinx.com>
References: <1433786857-32575-1-git-send-email-punnaia@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 kalluripunnaiahchoudary@gmail.com, kpc528@gmail.com, punnaia@xilinx.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add pl353 static memory controller devicetree binding information.

Signed-off-by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
---
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
 .../bindings/memory-controllers/pl353-smc.txt      |   37 ++++++++++++++++++++
 1 files changed, 37 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt

diff --git a/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt b/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
new file mode 100644
index 0000000..4e6b27b
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
@@ -0,0 +1,37 @@
+Device tree bindings for ARM PL353 static memory controller
+
+PL353 static memory controller supports two kinds of memory
+interfaces. i.e NAND and SRAM/NOR interfaces.
+The actual devices are instantiated from the child nodes of pl353 smc node.
+
+Required properties:
+- compatible		: Should be "arm,pl353-smc-r2p1"
+- reg			: Controller registers map and length.
+- clock-names		: List of input clock names - "memclk", "aclk"
+			  (See clock bindings for details).
+- clocks		: Clock specifiers (see clock bindings for details).
+- #address-cells	: Address cells, must be 1.
+- #size-cells		: Size cells. Must be 1.
+
+Child nodes:
+ For NAND the "arm,pl353-nand-r2p1" and for NOR the "cfi-flash" drivers are
+supported as child nodes.
+
+for nand partition information please refer the below file
+Documentation/devicetree/bindings/mtd/partition.txt
+
+Example:
+	pl353smcc_0: pl353smcc@e000e000 {
+			compatible = "arm,pl353-smcc-r2p1"
+			clock-names = "memclk", "aclk";
+			clocks = <&clkc 11>, <&clkc 44>;
+			reg = <0xe000e000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			nand_0: nand@e1000000 {
+				compatible = "arm,pl353-nand-r2p1"
+				reg = <0xe1000000 0x1000000>;
+				(...)
+			};
+	};
-- 
1.7.4
