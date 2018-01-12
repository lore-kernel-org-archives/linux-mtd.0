Received: from eddie.linux-mips.org ([148.251.95.138] helo=cvs.linux-mips.org)
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eZz7k-0003Da-RW
 for linux-mtd@lists.infradead.org; Fri, 12 Jan 2018 13:11:58 +0000
Received: (from localhost user: 'ladis' uid#1021 fake: STDIN
 (ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
 id S23994661AbeALNL4X0lld (ORCPT
 <rfc822;linux-mtd@lists.infradead.org>);
 Fri, 12 Jan 2018 14:11:56 +0100
Date: Fri, 12 Jan 2018 14:11:53 +0100
Sender: Ladislav Michl <ladis@linux-mips.org>
From: Ladislav Michl <ladis@linux-mips.org>
To: linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Roger Quadros <rogerq@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Tony Lindgren <tony@atomide.com>
Subject: [PATCH v6 01/14] dt-bindings: mtd: gpmc-onenand: Update properties
 description
Message-ID: <20180112131153.GB13810@lenoch>
References: <20180112131105.GA13810@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180112131105.GA13810@lenoch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Compatible property is required for OMAP2+ mtd driver. Also
add INT pin gpio description and delete unused dma-channel
property.

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
Reviewed-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Acked-by: Roger Quadros <rogerq@ti.com>
---

Changes in v6: None
Changes in v5:
- renamed R/B pin to INT pin

Changes in v4:
- new patch

Changes in v3: None
Changes in v2: None

 Documentation/devicetree/bindings/mtd/gpmc-onenand.txt | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/gpmc-onenand.txt b/Documentation/devicetree/bindings/mtd/gpmc-onenand.txt
index b6e8bfd024f4..e9f01a963a0a 100644
--- a/Documentation/devicetree/bindings/mtd/gpmc-onenand.txt
+++ b/Documentation/devicetree/bindings/mtd/gpmc-onenand.txt
@@ -9,13 +9,14 @@ Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
 
 Required properties:
 
+ - compatible:		"ti,omap2-onenand"
  - reg:			The CS line the peripheral is connected to
- - gpmc,device-width	Width of the ONENAND device connected to the GPMC
+ - gpmc,device-width:	Width of the ONENAND device connected to the GPMC
 			in bytes. Must be 1 or 2.
 
 Optional properties:
 
- - dma-channel:		DMA Channel index
+ - int-gpios:		GPIO specifier for the INT pin.
 
 For inline partition table parsing (optional):
 
@@ -35,6 +36,7 @@ Example for an OMAP3430 board:
 		#size-cells = <1>;
 
 		onenand@0 {
+			compatible = "ti,omap2-onenand";
 			reg = <0 0 0>; /* CS0, offset 0 */
 			gpmc,device-width = <2>;
 
-- 
2.15.1
