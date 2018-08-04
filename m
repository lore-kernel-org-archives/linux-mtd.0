Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fm3eG-000624-2U
 for linux-mtd@lists.infradead.org; Sat, 04 Aug 2018 20:59:42 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Mike Dunn <mikedunn@newsguy.com>,
 Sergey Larin <cerg2010cerg2010@mail.ru>
Subject: [PATCH v2 2/4] ARM: pxa: palmtreo: Drop docg4 specific init
Date: Sat,  4 Aug 2018 22:59:21 +0200
Message-Id: <20180804205923.25298-2-boris.brezillon@bootlin.com>
In-Reply-To: <20180804205923.25298-1-boris.brezillon@bootlin.com>
References: <20180804205923.25298-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The docg4 driver has been removed. Remove the code that was registering
a docg4 device.

Suggested-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
Changes in v2:
- new patch
---
 arch/arm/mach-pxa/palmtreo.c | 31 -------------------------------
 1 file changed, 31 deletions(-)

diff --git a/arch/arm/mach-pxa/palmtreo.c b/arch/arm/mach-pxa/palmtreo.c
index 4cc05ecce618..b66b0b11d717 100644
--- a/arch/arm/mach-pxa/palmtreo.c
+++ b/arch/arm/mach-pxa/palmtreo.c
@@ -403,36 +403,6 @@ static void __init palmtreo_leds_init(void)
 	platform_device_register(&palmtreo_leds);
 }
 
-/******************************************************************************
- * diskonchip docg4 flash
- ******************************************************************************/
-#if defined(CONFIG_MACH_TREO680)
-/* REVISIT: does the centro have this device also? */
-#if IS_ENABLED(CONFIG_MTD_NAND_DOCG4)
-static struct resource docg4_resources[] = {
-	{
-		.start	= 0x00000000,
-		.end	= 0x00001FFF,
-		.flags	= IORESOURCE_MEM,
-	},
-};
-
-static struct platform_device treo680_docg4_flash = {
-	.name   = "docg4",
-	.id     = -1,
-	.resource = docg4_resources,
-	.num_resources = ARRAY_SIZE(docg4_resources),
-};
-
-static void __init treo680_docg4_flash_init(void)
-{
-	platform_device_register(&treo680_docg4_flash);
-}
-#else
-static inline void treo680_docg4_flash_init(void) {}
-#endif
-#endif
-
 /******************************************************************************
  * Machine init
  ******************************************************************************/
@@ -517,7 +487,6 @@ static void __init treo680_init(void)
 	treo680_gpio_init();
 	palm27x_mmc_init(GPIO_NR_TREO_SD_DETECT_N, GPIO_NR_TREO680_SD_READONLY,
 			GPIO_NR_TREO680_SD_POWER, 0);
-	treo680_docg4_flash_init();
 }
 #endif
 
-- 
2.14.1
