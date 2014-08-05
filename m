Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XEaGM-0000RP-S5
 for linux-mtd@lists.infradead.org; Tue, 05 Aug 2014 08:38:35 +0000
From: Gerhard Sittig <gsi@denx.de>
To: devicetree@vger.kernel.org, Jamie Iles <jamie@jamieiles.com>,
 linux-mtd@lists.infradead.org, Mike Rapoport <mike@compulab.co.il>,
 Alexander Shiyan <shc_work@mail.ru>
Subject: [PATCH v1 1/2] devicetree: bindings: improve description for GPIO
 assisted NAND flash
Date: Tue,  5 Aug 2014 10:37:25 +0200
Message-Id: <1407227846-3257-1-git-send-email-gsi@denx.de>
Cc: Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>, Gerhard Sittig <gsi@denx.de>,
 Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Expand the description of the 'gpios' property in the GPIO assisted
NAND flash binding, to explicitly list the required GPIO pin references
and their order.

Update the example section to individually bracket the GPIO references,
and capitalize the signal names for improved readability.

Signed-off-by: Gerhard Sittig <gsi@denx.de>
---
 .../devicetree/bindings/mtd/gpio-control-nand.txt        |   14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
index 36ef07d3c90f..af8915b41ccf 100644
--- a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
@@ -11,8 +11,8 @@ Required properties:
   are made in native endianness.
 - #address-cells, #size-cells : Must be present if the device has sub-nodes
   representing partitions.
-- gpios : specifies the gpio pins to control the NAND device.  nwp is an
-  optional gpio and may be set to 0 if not present.
+- gpios : Specifies the GPIO pins to control the NAND device.  The order of
+  GPIO references is:  RDY, nCE, ALE, CLE, and an optional nWP.
 
 Optional properties:
 - bank-width : Width (in bytes) of the device.  If not present, the width
@@ -35,11 +35,11 @@ gpio-nand@1,0 {
 	reg = <1 0x0000 0x2>;
 	#address-cells = <1>;
 	#size-cells = <1>;
-	gpios = <&banka 1 0	/* rdy */
-		 &banka 2 0 	/* nce */
-		 &banka 3 0 	/* ale */
-		 &banka 4 0 	/* cle */
-		 0		/* nwp */>;
+	gpios = <&banka 1 0>,	/* RDY */
+		<&banka 2 0>, 	/* nCE */
+		<&banka 3 0>, 	/* ALE */
+		<&banka 4 0>, 	/* CLE */
+		<0>;		/* nWP */
 
 	partition@0 {
 	...
-- 
1.7.10.4
