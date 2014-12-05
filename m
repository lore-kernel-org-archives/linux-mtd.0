Received: from mail-bl2on0087.outbound.protection.outlook.com ([65.55.169.87]
 helo=na01-bl2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XwyiJ-0002G7-FD
 for linux-mtd@lists.infradead.org; Fri, 05 Dec 2014 19:38:52 +0000
From: Graham Moore <grmoore@opensource.altera.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/2] mtd: spi-nor: Bindings for Cadence Quad SPI Flash
 Controller driver.
Date: Fri, 5 Dec 2014 13:35:32 -0600
Message-ID: <1417808133-20719-2-git-send-email-grmoore@opensource.altera.com>
In-Reply-To: <1417808133-20719-1-git-send-email-grmoore@opensource.altera.com>
References: <1417808133-20719-1-git-send-email-grmoore@opensource.altera.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Alan Tull <atull@opensource.altera.com>,
 Yves Vandervennet <yvanderv@opensource.altera.com>,
 linux-kernel@vger.kernel.org, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Dinh Nguyen <dinguyen@opensource.altera.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Graham Moore <grmoore@opensource.altera.com>
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
 .../devicetree/bindings/mtd/cadence_quadspi.txt    |   50 ++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/cadence_quadspi.txt

diff --git a/Documentation/devicetree/bindings/mtd/cadence_quadspi.txt b/Documentation/devicetree/bindings/mtd/cadence_quadspi.txt
new file mode 100644
index 0000000..3a8ea1c
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
+- ext-decoder : Value of 0 means no external chipselect decoder is
+	connected, 1 means there is an external chipselect decoder connected.
+- fifo-depth : Size of the data FIFO in words.
+- bus-num : Number of the SPI bus to which the controller is connected.
+
+Optional subnodes:
+Subnodes of the Cadence Quad SPI controller are spi slave nodes with additional
+custom properties:
+- cdns,page-size : Size, in bytes, of the device's write page
+- cdns,block-size : Size of the device's erase block
+- cdns,read-delay : Selay for read capture logic, in clock cycles
+- cdns,tshsl-ns : Delay in master reference clocks for the length that the master mode chip select outputs are de-asserted between transactions.
+- cdns,tsd2d-ns : Delay in master reference clocks between one chip select being de-activated and the activation of another.
+- cdns,tchsh-ns : Delay in master reference clocks between last bit of current transaction and deasserting the device chip select (qspi_n_ss_out).
+- cdns,tslch-ns : Delay in master reference clocks between setting qspi_n_ss_out low and first bit transfer.
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
+		ext-decoder = <0>;
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
