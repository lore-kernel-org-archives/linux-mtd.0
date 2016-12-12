Received: from 3.mo5.mail-out.ovh.net ([46.105.40.108])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cGSk3-0002Dd-Tk
 for linux-mtd@lists.infradead.org; Mon, 12 Dec 2016 15:42:17 +0000
Received: from player760.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 24C135527E
 for <linux-mtd@lists.infradead.org>; Mon, 12 Dec 2016 16:41:53 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v4 3/4] mtd: spi-nor: bindings for the Aspeed memory
 controllers
Date: Mon, 12 Dec 2016 16:40:51 +0100
Message-Id: <1481557252-13656-4-git-send-email-clg@kaod.org>
In-Reply-To: <1481557252-13656-1-git-send-email-clg@kaod.org>
References: <1481557252-13656-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 .../devicetree/bindings/mtd/aspeed-smc.txt         | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/aspeed-smc.txt

diff --git a/Documentation/devicetree/bindings/mtd/aspeed-smc.txt b/Documentation/devicetree/bindings/mtd/aspeed-smc.txt
new file mode 100644
index 000000000000..49f6528ef547
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/aspeed-smc.txt
@@ -0,0 +1,51 @@
+* Aspeed Firmware Memory controller
+* Aspeed SPI Flash Memory Controller
+
+The Firmware Memory Controller in the Aspeed AST2500 SoC supports
+three chip selects, two of which are always of SPI type and the third
+can be SPI or NOR type flash. These bindings only describe SPI.
+
+The two SPI flash memory controllers in the AST2500 each support two
+chip selects.
+
+Required properties:
+  - compatible : Should be one of
+	"aspeed,ast2400-fmc" for the AST2400 Firmware Memory Controller
+	"aspeed,ast2400-spi" for the AST2400 SPI Flash memory Controller
+	"aspeed,ast2500-fmc" for the AST2500 Firmware Memory Controller
+	"aspeed,ast2500-spi" for the AST2500 SPI flash memory controllers
+
+  - reg : the first contains the control register location and length,
+          the second contains the memory window mapping address and length
+  - #address-cells : must be 1 corresponding to chip select child binding
+  - #size-cells : must be 0 corresponding to chip select child binding
+
+Optional properties:
+  - interrupts : Should contain the interrupt for the dma device if an
+    FMC
+
+The child nodes are the SPI flash modules which must have a compatible
+property as specified in bindings/mtd/jedec,spi-nor.txt
+
+Optionally, the child node can contain properties for SPI mode (may be
+ignored):
+  - spi-max-frequency - max frequency of spi bus
+
+
+Example:
+fmc: fmc@1e620000 {
+	compatible = "aspeed,ast2500-fmc";
+	reg = < 0x1e620000 0x94
+		0x20000000 0x02000000 >;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	interrupts = <19>;
+	flash@0 {
+		reg = < 0 >;
+		compatible = "jedec,spi-nor";
+		/* spi-max-frequency = <>; */
+		/* m25p,fast-read; */
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+};
-- 
2.7.4
