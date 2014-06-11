Received: from comal.ext.ti.com ([198.47.26.152])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WueNE-00073U-Md
 for linux-mtd@lists.infradead.org; Wed, 11 Jun 2014 08:59:13 +0000
From: Roger Quadros <rogerq@ti.com>
To: <tony@atomide.com>, <dwmw2@infradead.org>, <computersforpeace@gmail.com>
Subject: [PATCH 33/36] ARM: OMAP2+: board-flash: Use gpmc_generic_init() for
 NOR
Date: Wed, 11 Jun 2014 11:56:38 +0300
Message-ID: <1402477001-31132-34-git-send-email-rogerq@ti.com>
In-Reply-To: <1402477001-31132-1-git-send-email-rogerq@ti.com>
References: <1402477001-31132-1-git-send-email-rogerq@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: devicetree@vger.kernel.org, nsekhar@ti.com, linux-kernel@vger.kernel.org,
 kyungmin.park@samsung.com, linux-mtd@lists.infradead.org, pekon@ti.com,
 ezequiel.garcia@free-electrons.com, javier@dowhile0.org,
 linux-omap@vger.kernel.org, Roger Quadros <rogerq@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Don't access any GPMC registers here. Use gpmc_generic_init()
to pass GPMC Chip Select settings, platform device and platform data
to the GPMC driver.

Signed-off-by: Roger Quadros <rogerq@ti.com>
---
 arch/arm/mach-omap2/board-flash.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/arch/arm/mach-omap2/board-flash.c b/arch/arm/mach-omap2/board-flash.c
index b6885e4..617e441 100644
--- a/arch/arm/mach-omap2/board-flash.c
+++ b/arch/arm/mach-omap2/board-flash.c
@@ -41,7 +41,10 @@ static struct physmap_flash_data board_nor_data = {
 };
 
 static struct resource board_nor_resource = {
+	/* GPMC driver will fixup the resource, see gpmc_probe_legacy () */
 	.flags		= IORESOURCE_MEM,
+	.start		= 0,
+	.end		= FLASH_SIZE_SDPV1 - 1,	/* fixed @runtime for SDPV2 */
 };
 
 static struct platform_device board_nor_device = {
@@ -62,23 +65,14 @@ __init board_nor_init(struct mtd_partition *nor_parts, u8 nr_parts, u8 cs)
 	board_nor_data.parts	= nor_parts;
 	board_nor_data.nr_parts	= nr_parts;
 
-	/* Configure start address and size of NOR device */
-	if (omap_rev() >= OMAP3430_REV_ES1_0) {
-		err = gpmc_cs_request(cs, FLASH_SIZE_SDPV2 - 1,
-				(unsigned long *)&board_nor_resource.start);
-		board_nor_resource.end = board_nor_resource.start
-					+ FLASH_SIZE_SDPV2 - 1;
-	} else {
-		err = gpmc_cs_request(cs, FLASH_SIZE_SDPV1 - 1,
-				(unsigned long *)&board_nor_resource.start);
-		board_nor_resource.end = board_nor_resource.start
-					+ FLASH_SIZE_SDPV1 - 1;
-	}
-	if (err < 0) {
-		pr_err("NOR: Can't request GPMC CS\n");
-		return;
-	}
-	if (platform_device_register(&board_nor_device) < 0)
+	/* Configure size of NOR device */
+	if (omap_rev() >= OMAP3430_REV_ES1_0)
+		board_nor_resource.end = FLASH_SIZE_SDPV2 - 1;
+
+	err = gpmc_generic_init(cs, false,
+				NULL, NULL, NULL,
+				&board_nor_device, sizeof(board_nor_data));
+	if (err)
 		pr_err("Unable to register NOR device\n");
 }
 
-- 
1.8.3.2
