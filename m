Received: from mail-bn1bon0094.outbound.protection.outlook.com
 ([157.56.111.94] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XhjkE-0002YS-7P
 for linux-mtd@lists.infradead.org; Fri, 24 Oct 2014 18:37:50 +0000
From: Graham Moore <grmoore@opensource.altera.com>
To: <linux-mtd@lists.infradead.org>
Subject: [RFC 1/2] This is the documentation of the device tree bindings for
 the Cadence QSPI Flash Controller driver.
Date: Fri, 24 Oct 2014 13:34:20 -0500
Message-ID: <1414175661-9249-2-git-send-email-grmoore@opensource.altera.com>
In-Reply-To: <1414175661-9249-1-git-send-email-grmoore@opensource.altera.com>
References: <1414175661-9249-1-git-send-email-grmoore@opensource.altera.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Alan Tull <atull@opensource.altera.com>,
 Yves Vandervennet <yvanderv@opensource.altera.com>,
 linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@opensource.altera.com>,
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
 .../devicetree/bindings/mtd/cadence_quadspi.txt    |   30 ++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/cadence_quadspi.txt

diff --git a/Documentation/devicetree/bindings/mtd/cadence_quadspi.txt b/Documentation/devicetree/bindings/mtd/cadence_quadspi.txt
new file mode 100644
index 0000000..0064fc3
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/cadence_quadspi.txt
@@ -0,0 +1,30 @@
+* Cadence Quad SPI controller
+
+Required properties:
+- compatible : Should be "cdns,qspi-nor".
+- reg : Contains two entries, each of which is a tuple consisting of a
+	physical address and length.  The first entry is the address and
+	length of the controller register set.  The second entry is the
+	address and length of the QSPI Controller data area.
+- interrupts : Unit interrupt specifier for the controller interrupt.
+- ext-decoder : Value of 0 means no external chipselect decoder is
+	connected, 1 means there is an external chipselect decoder connected.
+- num-chipselect : Number of chip select lines.
+- fifo-depth : Size of the data FIFO in words.
+- bus-num : Number of the SPI bus to which the controller is connected.
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
+		num-chipselect = <4>;
+		fifo-depth = <128>;
+		bus-num = <2>;
+	}
-- 
1.7.9.5
