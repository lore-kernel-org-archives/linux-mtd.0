Received: from mail-bl2on0070.outbound.protection.outlook.com ([65.55.169.70]
 helo=na01-bl2-obe.outbound.protection.outlook.com)
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZIgfv-0003uc-AL
 for linux-mtd@lists.infradead.org; Fri, 24 Jul 2015 17:22:24 +0000
From: Graham Moore <grmoore@opensource.altera.com>
To: Marek Vasut <marex@denx.de>
CC: <linux-mtd@lists.infradead.org>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, <linux-kernel@vger.kernel.org>,
 Alan Tull <atull@opensource.altera.com>, Dinh Nguyen
 <dinguyen@opensource.altera.com>, Yves Vandervennet
 <yvanderv@opensource.altera.com>, Graham Moore
 <grmoore@opensource.altera.com>
Subject: [PATCH V5 1/2] mtd: spi-nor: Bindings for Cadence Quad SPI Flash
 Controller driver.
Date: Fri, 24 Jul 2015 12:17:38 -0500
Message-ID: <1437758259-28299-1-git-send-email-grmoore@opensource.altera.com>
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

Signed-off-by: Graham Moore <grmoore@opensource.altera.com>
---
V2: Add cdns prefix to driver-specific bindings.
V3: Use existing property "is-decoded-cs" instead of creating a duplicate,
"ext-decoder".  Timing parameters are in nanoseconds, not master reference
clocks.  Remove bus-num completely.
---
 .../devicetree/bindings/mtd/cadence_quadspi.txt    |   50 ++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/cadence_quadspi.txt

diff --git a/Documentation/devicetree/bindings/mtd/cadence_quadspi.txt b/Documentation/devicetree/bindings/mtd/cadence_quadspi.txt
new file mode 100644
index 0000000..1cf0d7e
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/cadence_quadspi.txt
@@ -0,0 +1,50 @@
+* Cadence Quad SPI controller
+
+Required properties:
+- compatible : Should be "cdns,qspi-nor".
+- reg : Contains two entries, each of which is a tuple consisting of a
+	physical address and length.  The first entry is the address and
+	length of the controller register set.  The second entry is the
+	address and length of the QSPI Controller data area.
+- interrupts : Unit interrupt specifier for the controller interrupt.
+- clocks : phandle to the Quad SPI clock.
+- fifo-depth : Size of the data FIFO in words.
+
+Optional properties:
+- is-decoded-cs : Flag to indicate whether decoder is used or not.
+
+Optional subnodes:
+Subnodes of the Cadence Quad SPI controller are spi slave nodes with additional
+custom properties:
+- cdns,page-size : Size, in bytes, of the device's write page
+- cdns,block-size : Size of the device's erase block
+- cdns,read-delay : Delay for read capture logic, in clock cycles
+- cdns,tshsl-ns : Delay in nanoseconds for the length that the master mode chip select outputs are de-asserted between transactions.
+- cdns,tsd2d-ns : Delay in nanoseconds between one chip select being de-activated and the activation of another.
+- cdns,tchsh-ns : Delay in nanoseconds between last bit of current transaction and deasserting the device chip select (qspi_n_ss_out).
+- cdns,tslch-ns : Delay in nanoseconds between setting qspi_n_ss_out low and first bit transfer.
+
+Example:
+
+	qspi: spi@ff705000 {
+		compatible = "cdns,qspi-nor";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0xff705000 0x1000>,
+			<0xffa00000 0x1000>;
+		interrupts = <0 151 4>;
+		clocks = <&qspi_clk>;
+		is-decoded-cs = <1>;
+		fifo-depth = <128>;
+
+		flash0: n25q00@0 {
+			...
+			cdns,page-size = <256>;
+			cdns,block-size = <16>;
+			cdns,read-delay = <4>;
+			cdns,tshsl-ns = <50>;
+			cdns,tsd2d-ns = <50>;
+			cdns,tchsh-ns = <4>;
+			cdns,tslch-ns = <4>;
+		}
+	}
-- 
1.7.9.5
