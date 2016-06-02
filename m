Received: from bes.se.axis.com ([195.60.68.10])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b8NM4-0008Nl-DI
 for linux-mtd@lists.infradead.org; Thu, 02 Jun 2016 07:47:49 +0000
Date: Thu, 2 Jun 2016 09:47:18 +0200
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Benoit Cousson <bcousson@baylibre.com>, Tony Lindgren
 <tony@atomide.com>, David Woodhouse <dwmw2@infradead.org>
CC: Linux mtd <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/4] of: Add device tree bindings for Evatronix
Message-ID: <alpine.DEB.2.02.1606020946500.19416@lnxricardw1.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 8BIT
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Devicetree bindings for the driver for the Evatronix NANDFLASH-CTRL NAND flash
controller IP.  This controller is used in the Axis ARTPEC-6 SoC.

The driver supports BCH ECC using the controller's hardware, but there is
also an option to use software BCH ECC. However, the ECC layouts are not
compatible so it's not possible to mix them. The main advantage to using
software ECC is that there are more OOB bytes free, as the hardware is
slightly wasteful on OOB space.

BCH ECC from 4 to 32 bits over 256, 512 or 1024 byte ECC blocks is supported.

Only large-page flash chips are supported, using 4 or 5 address cycles.

Signed-off-by: Ricard Wanderlof <ricardw@axis.com>
---
 .../devicetree/bindings/mtd/evatronix-nand.txt     |   44 ++++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 2 files changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/evatronix-nand.txt

diff --git a/Documentation/devicetree/bindings/mtd/evatronix-nand.txt b/Documentation/devicetree/bindings/mtd/evatronix-nand.txt
new file mode 100644
index 0000000..7ceb95a
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/evatronix-nand.txt
@@ -0,0 +1,44 @@
+Evatronix NANDFLASH-CTRL NAND flash controller
+
+Required properties:
+- compatible : "evatronix,nandflash-ctrl"
+- reg : specify bus address and register area size.
+- interrupts : controller interrupt number and irq type.
+- nand-ecc-mode : See nand.txt. Supported values "hw", "soft".
+- nand-ecc-algo : See nand.txt. Supported value "bch".
+- nand-ecc-strength : See nand.txt. Supported values: 4, 8, 16, 24, 32.
+- nand-ecc-step-size : See nand.txt. Supported values: 256, 512, 1024.
+
+Optional properties:
+- nand-on-flash-bbt: See nand.txt.
+- #address-cells, #size-cells: See partition.txt.
+- evatronix,use-bank-select : Use controller bank select function to access
+			      multiple chips, rather than chip enable.
+- evatronix,rb-wired-and: Assume ready/busy signal from all flash chips are
+			  connected using a wired-AND topology rather than
+			  individually.
+- evatronix,timings: Seven 32-bit values for initializing the TIME_SEQ_0,
+		     TIME_SEQ_1, TIMINGS_ASYN, TIME_GEN_SEQ_0, TIME_GEN_SEQ_1,
+		     TIME_GEN_SEQ_2 and TIME_GEN_SEQ_3 registers, respectively.
+
+Example:
+
+nand: nand@f801e000 {
+	compatible = "evatronix,nandflash-ctrl";
+	#address-cells = <1>;
+	#size-cells = <1>;
+	reg = <0xf801e000 0x0200>;
+	interrupts = <0 139 IRQ_TYPE_LEVEL_HIGH>;
+	/* ONFi mode 0 timing, assuming 100 MHz clock. */
+	/* Order is TIME_SEQ_0, TIME_SEQ_1, TIMINGS_ASYN,
+	 * TIME_GEN_SEQ_0, _1, _2, _3 */
+	evatronix,timings = <0x0d151533 0x000b0515 0x00000046
+			     0x00150000 0x00000000 0x00000005 0x00000015>;
+	nand-ecc-mode = "hw";
+	nand-ecc-algo = "bch";
+	nand-on-flash-bbt;
+	nand-ecc-strength = <8>;
+	nand-ecc-step-size = <512>;
+	evatronix,use-bank-select;
+	evatronix,rb-wired-and;
+};
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 86740d4..4018162 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -83,6 +83,7 @@ epson	Seiko Epson Corp.
 est	ESTeem Wireless Modems
 ettus	NI Ettus Research
 eukrea  EukrÃ©a Electromatique
+evatronix	Evatronix SA
 everest	Everest Semiconductor Co. Ltd.
 everspin	Everspin Technologies, Inc.
 excito	Excito
-- 
1.7.10.4

-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
