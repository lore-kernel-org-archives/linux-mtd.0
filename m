Received: from mail-by2on0059.outbound.protection.outlook.com ([207.46.100.59]
 helo=na01-by2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZK8tw-0004J8-Ma
 for linux-mtd@lists.infradead.org; Tue, 28 Jul 2015 17:42:53 +0000
From: Graham Moore <grmoore@opensource.altera.com>
To: <linux-mtd@lists.infradead.org>
CC: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Vikas MANOCHA <vikas.manocha@st.com>, "Marek
 Vasut" <marex@denx.de>, <linux-kernel@vger.kernel.org>, Alan Tull
 <atull@opensource.altera.com>, Dinh Nguyen <dinguyen@opensource.altera.com>,
 Yves Vandervennet <yvanderv@opensource.altera.com>, Graham Moore
 <grmoore@opensource.altera.com>
Subject: [PATCH V6 1/2] mtd: spi-nor: Bindings for Cadence Quad SPI Flash
 Controller driver.
Date: Tue, 28 Jul 2015 12:38:02 -0500
Message-ID: <1438105083-19738-1-git-send-email-grmoore@opensource.altera.com>
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
V4: Add new properties fifo-width and trigger-address
---
 .../devicetree/bindings/mtd/cadence_quadspi.txt    |   54 ++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/cadence_quadspi.txt

diff --git a/Documentation/devicetree/bindings/mtd/cadence_quadspi.txt b/Documentation/devicetree/bindings/mtd/cadence_quadspi.txt
new file mode 100644
index 0000000..d7e6fdd
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/cadence_quadspi.txt
@@ -0,0 +1,54 @@
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
+- fifo-width: Bus width of the data FIFO in bytes.
+- trigger-address : 32-bit indirect AHB trigger address.
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
+		fifo-width = <4>;
+		trigger-address = <0x00000000>;
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
