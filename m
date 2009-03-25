Received: from mail-out.m-online.net ([212.18.0.10])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LmQ25-0001oF-B1
	for linux-mtd@lists.infradead.org; Wed, 25 Mar 2009 10:08:48 +0000
From: Wolfgang Grandegger <wg@grandegger.com>
To: linux-mtd@lists.infradead.org,
	linuxppc-dev@ozlabs.org
Subject: [PATCH v3 3/4] powerpc: NAND: FSL UPM: document new bindings
Date: Wed, 25 Mar 2009 11:08:20 +0100
Message-Id: <1237975701-23201-4-git-send-email-wg@grandegger.com>
In-Reply-To: <1237975701-23201-3-git-send-email-wg@grandegger.com>
References: <1237975701-23201-1-git-send-email-wg@grandegger.com>
	<1237975701-23201-2-git-send-email-wg@grandegger.com>
	<1237975701-23201-3-git-send-email-wg@grandegger.com>
Cc: Anton Vorontsov <avorontsov@ru.mvista.com>,
	Wolfgang Grandegger <wg@grandegger.com>
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

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
---
 .../powerpc/dts-bindings/fsl/upm-nand.txt          |   39 +++++++++++++++++++-
 1 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/Documentation/powerpc/dts-bindings/fsl/upm-nand.txt b/Documentation/powerpc/dts-bindings/fsl/upm-nand.txt
index 84a04d5..0272e70 100644
--- a/Documentation/powerpc/dts-bindings/fsl/upm-nand.txt
+++ b/Documentation/powerpc/dts-bindings/fsl/upm-nand.txt
@@ -5,9 +5,22 @@ Required properties:
 - reg : should specify localbus chip select and size used for the chip.
 - fsl,upm-addr-offset : UPM pattern offset for the address latch.
 - fsl,upm-cmd-offset : UPM pattern offset for the command latch.
-- gpios : may specify optional GPIO connected to the Ready-Not-Busy pin.
 
-Example:
+Optional properties:
+- fsl,upm-wait-flags : add chip-dependent short delays after running the
+  		       UPM pattern (0x1), after writing a data byte (0x2)
+		       or after writing out a buffer (0x4).
+- gpios : may specify optional GPIOs connected to the Ready-Not-Busy pins
+	  (R/B#). For multi-chip devices, "num-chips" GPIO definitions are
+	  required.
+- chip-delay : chip dependent delay for transfering data from array to
+	       read registers (tR). Required if property "gpios" is not
+	       used (R/B# pins not connected).
+- num-chips : number of chips per device for multi-chip support.
+- chip-offset : address offset between chips for multi-chip support. The
+ 		corresponding address lines are used to select the chip.
+
+Examples:
 
 upm@1,0 {
 	compatible = "fsl,upm-nand";
@@ -26,3 +39,25 @@ upm@1,0 {
 		};
 	};
 };
+
+upm@3,0 {
+	compatible = "fsl,upm-nand";
+	reg = <3 0x0 0x800>;
+	fsl,upm-addr-offset = <0x10>;
+	fsl,upm-cmd-offset = <0x08>;
+	fsl,upm-wait-flags = <0x5>;
+	/* Multi-chip device */
+	num-chips = <2>;
+	chip-offset = <0x200>;
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
-- 
1.6.0.6
