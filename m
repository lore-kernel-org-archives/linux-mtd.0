Received: from mail-ob0-f194.google.com ([209.85.214.194])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZloZA-0002s8-K1
 for linux-mtd@lists.infradead.org; Tue, 13 Oct 2015 01:39:50 +0000
Received: by obbbh8 with SMTP id bh8so231659obb.0
 for <linux-mtd@lists.infradead.org>; Mon, 12 Oct 2015 18:39:27 -0700 (PDT)
From: Franklin S Cooper Jr <fcooper@ti.com>
To: linux-kernel@vger.kernel.org, rogerq@ti.com, devicetree@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org, nsekhar@ti.com,
 computersforpeace@gmail.com, dwmw2@infradead.org, tony@atomide.com
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH 5/5] ARM: OMAP2+: Update gpmc and nand DT binding documentation
Date: Mon, 12 Oct 2015 20:38:58 -0500
Message-Id: <1444700338-27582-6-git-send-email-fcooper@ti.com>
In-Reply-To: <1444700338-27582-1-git-send-email-fcooper@ti.com>
References: <1444700338-27582-1-git-send-email-fcooper@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add additional details to the gpmc and nand documentation to clarify
what is needed to enable nand dma prefetch.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt | 7 ++++++-
 Documentation/devicetree/bindings/mtd/gpmc-nand.txt                | 2 ++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt b/Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
index 704be93..b1e2802 100644
--- a/Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
@@ -33,6 +33,10 @@ Required properties:
 			As this will change in the future, filling correct
 			values here is a requirement.
 
+GPMC DMA information. Required only when GPMC nand prefetch is enabled.
+ - dmas			GPMC nand prefetch dma channel
+ - dma-names		DMA channel name use as a reference within the Nand driver
+
 Timing properties for child nodes. All are optional and default to 0.
 
  - gpmc,sync-clk-ps:	Minimum clock period for synchronous mode, in picoseconds
@@ -119,7 +123,8 @@ Example for an AM33xx board:
 		ti,hwmods = "gpmc";
 		reg = <0x50000000 0x2000>;
 		interrupts = <100>;
-
+		dmas = <&edma 52>;
+		dma-names = "rxtx";
 		gpmc,num-cs = <8>;
 		gpmc,num-waitpins = <2>;
 		#address-cells = <2>;
diff --git a/Documentation/devicetree/bindings/mtd/gpmc-nand.txt b/Documentation/devicetree/bindings/mtd/gpmc-nand.txt
index 253e6de..4b0c240 100644
--- a/Documentation/devicetree/bindings/mtd/gpmc-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/gpmc-nand.txt
@@ -61,6 +61,8 @@ Example for an AM33xx board:
 		ti,hwmods = "gpmc";
 		reg = <0x50000000 0x36c>;
 		interrupts = <100>;
+		dmas = <&edma 52>;
+		dma-names = "rxtx";
 		gpmc,num-cs = <8>;
 		gpmc,num-waitpins = <2>;
 		#address-cells = <2>;
-- 
2.6.1
