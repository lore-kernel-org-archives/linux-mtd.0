Received: from mail-out.m-online.net ([212.18.0.10])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LoENT-000262-39
	for linux-mtd@lists.infradead.org; Mon, 30 Mar 2009 10:06:06 +0000
Message-Id: <20090330100555.282048633@denx.de>
Date: Mon, 30 Mar 2009 12:02:44 +0200
From: Wolfgang Grandegger <wg@grandegger.com>
To: linux-mtd@lists.infradead.org,
 linuxppc-dev@ozlabs.org
Subject: [PATCH v4 3/4] powerpc: NAND: FSL UPM: document new bindings
References: <20090330100241.346785618@denx.de>
Content-Disposition: inline; filename=nand-fsl-upm-bindings-doc.patch
Cc: Anton Vorontsov <avorontsov@ru.mvista.com>,
	Wolfgang Grandegger <wg@grandegger.com>, devicetree-discuss@ozlabs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds documentation for the new NAND FSL UPM bindings for:

 NAND: FSL-UPM: add multi chip support
 NAND: FSL-UPM: Add wait flags to support board/chip specific delays

It also documents the old binding for "chip-delay".

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
---
 Documentation/powerpc/dts-bindings/fsl/upm-nand.txt |   39 ++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

Index: linux-2.6/Documentation/powerpc/dts-bindings/fsl/upm-nand.txt
===================================================================
--- linux-2.6.orig/Documentation/powerpc/dts-bindings/fsl/upm-nand.txt	2009-03-30 12:01:26.799721086 +0200
+++ linux-2.6/Documentation/powerpc/dts-bindings/fsl/upm-nand.txt	2009-03-30 12:01:41.496969771 +0200
@@ -5,9 +5,21 @@
 - reg : should specify localbus chip select and size used for the chip.
 - fsl,upm-addr-offset : UPM pattern offset for the address latch.
 - fsl,upm-cmd-offset : UPM pattern offset for the command latch.
-- gpios : may specify optional GPIO connected to the Ready-Not-Busy pin.
 
-Example:
+Optional properties:
+- fsl,upm-wait-flags : add chip-dependent short delays after running the
+	UPM pattern (0x1), after writing a data byte (0x2) or after
+	writing out a buffer (0x4).
+- fsl,upm-addr-line-cs-offsets : address offsets for multi-chip support.
+	The corresponding address lines are used to select the chip.
+- gpios : may specify optional GPIOs connected to the Ready-Not-Busy pins
+	(R/B#). For multi-chip devices, "n" GPIO definitions are required
+	according to the number of chips.
+- chip-delay : chip dependent delay for transfering data from array to
+	read registers (tR). Required if property "gpios" is not used
+	(R/B# pins not connected).
+
+Examples:
 
 upm@1,0 {
 	compatible = "fsl,upm-nand";
@@ -26,3 +38,26 @@
 		};
 	};
 };
+
+upm@3,0 {
+	#address-cells = <0>;
+	#size-cells = <0>;
+	compatible = "tqc,tqm8548-upm-nand", "fsl,upm-nand";
+	reg = <3 0x0 0x800>;
+	fsl,upm-addr-offset = <0x10>;
+	fsl,upm-cmd-offset = <0x08>;
+	/* Multi-chip NAND device */
+	fsl,upm-addr-line-cs-offsets = <0x0 0x200>;
+	fsl,upm-wait-flags = <0x5>;
+	chip-delay = <25>; // in micro-seconds
+
+	nand@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		partition@0 {
+			    label = "fs";
+			    reg = <0x00000000 0x10000000>;
+		};
+	};
+};
