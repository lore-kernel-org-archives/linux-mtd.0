Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZQ5fg-0003Un-Vr
 for linux-mtd@lists.infradead.org; Fri, 14 Aug 2015 03:28:46 +0000
From: Marek Vasut <marex@denx.de>
To: linux-mtd@lists.infradead.org
Cc: Graham Moore <grmoore@opensource.altera.com>, Marek Vasut <marex@denx.de>,
 Alan Tull <atull@opensource.altera.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Dinh Nguyen <dinguyen@opensource.altera.com>,
 Vikas MANOCHA <vikas.manocha@st.com>,
 Yves Vandervennet <yvanderv@opensource.altera.com>,
 devicetree@vger.kernel.org
Subject: [PATCH V7 1/2] mtd: spi-nor: Bindings for Cadence Quad SPI Flash
 Controller driver.
Date: Fri, 14 Aug 2015 05:28:11 +0200
Message-Id: <1439522892-7524-1-git-send-email-marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Graham Moore <grmoore@opensource.altera.com>

Add binding document for the Cadence QSPI controller.

Signed-off-by: Graham Moore <grmoore@opensource.altera.com>
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alan Tull <atull@opensource.altera.com>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Dinh Nguyen <dinguyen@opensource.altera.com>
Cc: Graham Moore <grmoore@opensource.altera.com>
Cc: Vikas MANOCHA <vikas.manocha@st.com>
Cc: Yves Vandervennet <yvanderv@opensource.altera.com>
Cc: devicetree@vger.kernel.org
---
 .../devicetree/bindings/mtd/cadence_quadspi.txt    | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/cadence_quadspi.txt

V2: Add cdns prefix to driver-specific bindings.
V3: Use existing property "is-decoded-cs" instead of creating a
    duplicate, "ext-decoder". Timing parameters are in nanoseconds,
    not master reference clocks. Remove bus-num completely.
V4: Add new properties fifo-width and trigger-address
V7: - Prefix all of the Cadence-specific properties with cdns prefix,
      those are in particular "cdns,is-decoded-cs", "cdns,fifo-depth",
      "cdns,fifo-width", "cdns,trigger-address".
    - Drop bogus properties which were not used and were incorrect.

diff --git a/Documentation/devicetree/bindings/mtd/cadence_quadspi.txt b/Documentation/devicetree/bindings/mtd/cadence_quadspi.txt
new file mode 100644
index 0000000..ebaf1fd
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
+- cdns,fifo-depth : Size of the data FIFO in words.
+- cdns,fifo-width: Bus width of the data FIFO in bytes.
+- cdns,trigger-address : 32-bit indirect AHB trigger address.
+
+Optional properties:
+- cdns,is-decoded-cs : Flag to indicate whether decoder is used or not.
+
+Optional subnodes:
+Subnodes of the Cadence Quad SPI controller are spi slave nodes with additional
+custom properties:
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
+		      <0xffa00000 0x1000>;
+		interrupts = <0 151 4>;
+		clocks = <&qspi_clk>;
+		cdns,is-decoded-cs;
+		cdns,fifo-depth = <128>;
+		cdns,fifo-width = <4>;
+		cdns,trigger-address = <0x00000000>;
+
+		flash0: n25q00@0 {
+			...
+			cdns,read-delay = <4>;
+			cdns,tshsl-ns = <50>;
+			cdns,tsd2d-ns = <50>;
+			cdns,tchsh-ns = <4>;
+			cdns,tslch-ns = <4>;
+		};
+	};
-- 
2.1.4
