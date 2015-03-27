Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YbY5e-0002oH-Hx
 for linux-mtd@lists.infradead.org; Fri, 27 Mar 2015 17:30:39 +0000
Received: by pacwz10 with SMTP id wz10so50519831pac.2
 for <linux-mtd@lists.infradead.org>; Fri, 27 Mar 2015 10:30:16 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 1/2] Documentation: devicetree: m25p80: add "nor-jedec"
 binding
Date: Fri, 27 Mar 2015 10:29:49 -0700
Message-Id: <1427477390-24069-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Almost all flash that are "compatible" with m25p80 support the JEDEC
READ ID opcode (0x9F), and in fact, that is often the only thing that is
used to differentiate them. Let's add a compatible string that
represents this lowest common denominator of compatibility.

Device trees can still specify manufacturer/device names in addition,
but (until some reason is found to differentiate between them through
device tree) software will likely want to bind just against the generic
name, and avoid unnecessarily growing its device ID binding tables.

This is related to the work of commit a5b7616c55e1 ("mtd:
m25p80,spi-nor: Fix module aliases for m25p80"), which showed that
maintaining these device tables as stable device-tree/modalias binding
tables is not a worthwhile burden for mostly-comptatible flash.

At the same time, let's update the binding doc to point to the
m25p_ids[] ID list instead of spi_nor_ids[]. The former can be used for
device tree bindings, but the latter cannot. In the future, we should
pare down the m25p_ids[] list to only those IDs which are actually used
in device trees.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Rafał Miłecki <zajec5@gmail.com>
Reviewed-by: Marek Vasut <marex@denx.de>
---
v2: get the opdcode correct (0x9F, not 0x95)
    include the "nor-jedec" language after the more-specific device name
    binding

 Documentation/devicetree/bindings/mtd/m25p80.txt | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/m25p80.txt b/Documentation/devicetree/bindings/mtd/m25p80.txt
index 4611aa83531b..f20b111b502a 100644
--- a/Documentation/devicetree/bindings/mtd/m25p80.txt
+++ b/Documentation/devicetree/bindings/mtd/m25p80.txt
@@ -3,10 +3,13 @@
 Required properties:
 - #address-cells, #size-cells : Must be present if the device has sub-nodes
   representing partitions.
-- compatible : Should be the manufacturer and the name of the chip. Bear in mind
-               the DT binding is not Linux-only, but in case of Linux, see the
-               "spi_nor_ids" table in drivers/mtd/spi-nor/spi-nor.c for the list
-               of supported chips.
+- compatible : May include a device-specific string consisting of the
+               manufacturer and name of the chip. Bear in mind the DT binding
+               is not Linux-only, but in case of Linux, see the "m25p_ids"
+               table in drivers/mtd/devices/m25p80.c for the list of supported
+               chips.
+               Must also include "nor-jedec" for any SPI NOR flash that can be
+               identified by the JEDEC READ ID opcode (0x9F).
 - reg : Chip-Select number
 - spi-max-frequency : Maximum frequency of the SPI bus the chip can operate at
 
@@ -22,7 +25,7 @@ Example:
 	flash: m25p80@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
-		compatible = "spansion,m25p80";
+		compatible = "spansion,m25p80", "nor-jedec";
 		reg = <0>;
 		spi-max-frequency = <40000000>;
 		m25p,fast-read;
-- 
1.9.1
