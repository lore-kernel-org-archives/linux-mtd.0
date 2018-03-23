Received: from mail-dm3nam03on0052.outbound.protection.outlook.com
 ([104.47.41.52] helo=NAM03-DM3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ezLjN-0006Ws-DA
 for linux-mtd@lists.infradead.org; Fri, 23 Mar 2018 12:23:46 +0000
From: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
To: <cyrille.pitchen@wedev4u.fr>, <marek.vasut@gmail.com>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <boris.brezillon@free-electrons.com>
CC: <linux-mtd@lists.infradead.org>, Naga Sureshkumar Relli
 <nagasure@xilinx.com>
Subject: [RFC PATCH 5/5] devicetree: Add devicetree bindings documentation for
Date: Fri, 23 Mar 2018 17:52:02 +0530
Message-ID: <1521807722-21626-6-git-send-email-nagasure@xilinx.com>
In-Reply-To: <1521807722-21626-1-git-send-email-nagasure@xilinx.com>
References: <1521807722-21626-1-git-send-email-nagasure@xilinx.com>
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

Add bindings documentation for Zynq QSPI driver.

Signed-off-by: Naga Sureshkumar Relli <nagasure@xilinx.com>
---
 .../devicetree/bindings/spi/spi-zynq-qspi.txt      | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/spi-zynq-qspi.txt

diff --git a/Documentation/devicetree/bindings/spi/spi-zynq-qspi.txt b/Documentation/devicetree/bindings/spi/spi-zynq-qspi.txt
new file mode 100644
index 0000000..fe3b8e9
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/spi-zynq-qspi.txt
@@ -0,0 +1,28 @@
+Xilinx Zynq QSPI controller Device Tree Bindings
+-------------------------------------------------
+
+Required properties:
+- compatible		: Should be "xlnx,zynq-qspi-1.0".
+- reg			: Physical base address and size of QSPI registers map.
+- interrupts		: Property with a value describing the interrupt
+			  number.
+- interrupt-parent	: Must be core interrupt controller
+- clock-names		: List of input clock names - "ref_clk", "pclk"
+			  (See clock bindings for details).
+- clocks		: Clock phandles (see clock bindings for details).
+
+Optional properties:
+- num-cs		: Number of chip selects used.
+- is-dual		: QSPI operating in Dual parallel.
+- is-satcked		: QSPI operating in Stacked mode.
+
+Example:
+	qspi@e000d000 {
+		compatible = "xlnx,zynq-qspi-1.0";
+		clock-names = "ref_clk", "pclk";
+		clocks = <&clkc 10>, <&clkc 43>;
+		interrupt-parent = <&intc>;
+		interrupts = <0 19 4>;
+		num-cs = <1>;
+		reg = <0xe000d000 0x1000>;
+	} ;
-- 
2.7.4
