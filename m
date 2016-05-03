Received: from mail-ob0-f193.google.com ([209.85.214.193])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1axeSq-0007kZ-PN
 for linux-mtd@lists.infradead.org; Tue, 03 May 2016 17:50:29 +0000
Received: by mail-ob0-f193.google.com with SMTP id o7so1091201obl.2
 for <linux-mtd@lists.infradead.org>; Tue, 03 May 2016 10:50:09 -0700 (PDT)
From: Franklin S Cooper Jr <fcooper@ti.com>
To: robh+dt@kernel.org, boris.brezillon@free-electrons.com, richard@nod.at,
 dwmw2@infradead.org, computersforpeace@gmail.com, tony@atomide.com,
 rogerq@ti.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Cc: "Cooper Jr., Franklin" <fcooper@ti.com>
Subject: [PATCH 2/2] ARM: OMAP2+: Update GPMC and NAND DT binding documentation
Date: Tue,  3 May 2016 12:50:06 -0500
Message-Id: <1462297806-11555-3-git-send-email-fcooper@ti.com>
In-Reply-To: <1462297806-11555-1-git-send-email-fcooper@ti.com>
References: <1462297806-11555-1-git-send-email-fcooper@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: "Cooper Jr., Franklin" <fcooper@ti.com>

Add additional details to the GPMC NAND documentation to clarify
what is needed to enable NAND DMA prefetch.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt | 7 ++++++-
 Documentation/devicetree/bindings/mtd/gpmc-nand.txt                | 2 +-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt b/Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
index 21055e2..c1359f4 100644
--- a/Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
@@ -46,6 +46,10 @@ Required properties:
 			0 maps to GPMC_WAIT0 pin.
  - gpio-cells:		Must be set to 2
 
+Required properties when using NAND prefetch dma:
+ - dmas			GPMC NAND prefetch dma channel
+ - dma-names		Must be set to "rxtx"
+
 Timing properties for child nodes. All are optional and default to 0.
 
  - gpmc,sync-clk-ps:	Minimum clock period for synchronous mode, in picoseconds
@@ -137,7 +141,8 @@ Example for an AM33xx board:
 		ti,hwmods = "gpmc";
 		reg = <0x50000000 0x2000>;
 		interrupts = <100>;
-
+		dmas = <&edma 52 0>;
+		dma-names = "rxtx";
 		gpmc,num-cs = <8>;
 		gpmc,num-waitpins = <2>;
 		#address-cells = <2>;
diff --git a/Documentation/devicetree/bindings/mtd/gpmc-nand.txt b/Documentation/devicetree/bindings/mtd/gpmc-nand.txt
index 3ee7e20..174f68c 100644
--- a/Documentation/devicetree/bindings/mtd/gpmc-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/gpmc-nand.txt
@@ -39,7 +39,7 @@ Optional properties:
 
 		"prefetch-polled"	Prefetch polled mode (default)
 		"polled"		Polled mode, without prefetch
-		"prefetch-dma"		Prefetch enabled sDMA mode
+		"prefetch-dma"		Prefetch enabled DMA mode
 		"prefetch-irq"		Prefetch enabled irq mode
 
  - elm_id:	<deprecated> use "ti,elm-id" instead
-- 
2.7.0
