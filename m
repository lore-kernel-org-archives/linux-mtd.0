Received: from fg-out-1718.google.com ([72.14.220.153])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LmGOH-0005t0-Cb
	for linux-mtd@lists.infradead.org; Tue, 24 Mar 2009 23:50:48 +0000
Received: by fg-out-1718.google.com with SMTP id l27so604155fgb.3
	for <linux-mtd@lists.infradead.org>;
	Tue, 24 Mar 2009 16:50:39 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD] Drop now unused sharpsl-flash map
Date: Wed, 25 Mar 2009 02:49:03 +0300
Message-Id: <1237938543-20118-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Now as all PXA Zaurii are converted to use the physmap map,
drop the sharpsl-flash map completely.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/maps/Kconfig         |    6 --
 drivers/mtd/maps/Makefile        |    1 -
 drivers/mtd/maps/sharpsl-flash.c |  116 --------------------------------------
 3 files changed, 0 insertions(+), 123 deletions(-)
 delete mode 100644 drivers/mtd/maps/sharpsl-flash.c

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index 043d50f..bdb96c3 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -529,12 +529,6 @@ config MTD_DMV182
         help
           Map driver for Dy-4 SVME/DMV-182 board.
 
-config MTD_SHARP_SL
-	tristate "ROM mapped on Sharp SL Series"
-	depends on ARCH_PXA
-	help
-	  This enables access to the flash chip on the Sharp SL Series of PDAs.
-
 config MTD_INTEL_VR_NOR
 	tristate "NOR flash on Intel Vermilion Range Expansion Bus CS0"
 	depends on PCI
diff --git a/drivers/mtd/maps/Makefile b/drivers/mtd/maps/Makefile
index 6d9ba35..9ae4c8d 100644
--- a/drivers/mtd/maps/Makefile
+++ b/drivers/mtd/maps/Makefile
@@ -56,7 +56,6 @@ obj-$(CONFIG_MTD_IXP4XX)	+= ixp4xx.o
 obj-$(CONFIG_MTD_IXP2000)	+= ixp2000.o
 obj-$(CONFIG_MTD_WRSBC8260)	+= wr_sbc82xx_flash.o
 obj-$(CONFIG_MTD_DMV182)	+= dmv182.o
-obj-$(CONFIG_MTD_SHARP_SL)	+= sharpsl-flash.o
 obj-$(CONFIG_MTD_PLATRAM)	+= plat-ram.o
 obj-$(CONFIG_MTD_OMAP_NOR)	+= omap_nor.o
 obj-$(CONFIG_MTD_INTEL_VR_NOR)	+= intel_vr_nor.o
diff --git a/drivers/mtd/maps/sharpsl-flash.c b/drivers/mtd/maps/sharpsl-flash.c
deleted file mode 100644
index b392f09..0000000
--- a/drivers/mtd/maps/sharpsl-flash.c
+++ /dev/null
@@ -1,116 +0,0 @@
-/*
- * sharpsl-flash.c
- *
- * Copyright (C) 2001 Lineo Japan, Inc.
- * Copyright (C) 2002  SHARP
- *
- * based on rpxlite.c,v 1.15 2001/10/02 15:05:14 dwmw2 Exp
- *          Handle mapping of the flash on the RPX Lite and CLLF boards
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- */
-
-#include <linux/module.h>
-#include <linux/types.h>
-#include <linux/kernel.h>
-#include <linux/mtd/mtd.h>
-#include <linux/mtd/map.h>
-#include <linux/mtd/partitions.h>
-#include <asm/io.h>
-#include <asm/mach-types.h>
-
-#define WINDOW_ADDR 0x00000000
-#define WINDOW_SIZE 0x00800000
-#define BANK_WIDTH 2
-
-static struct mtd_info *mymtd;
-
-struct map_info sharpsl_map = {
-	.name = "sharpsl-flash",
-	.size = WINDOW_SIZE,
-	.bankwidth = BANK_WIDTH,
-	.phys = WINDOW_ADDR
-};
-
-static struct mtd_partition sharpsl_partitions[1] = {
-	{
-		name:		"Boot PROM Filesystem",
-	}
-};
-
-static int __init init_sharpsl(void)
-{
-	struct mtd_partition *parts;
-	int nb_parts = 0;
-	char *part_type = "static";
-
-	printk(KERN_NOTICE "Sharp SL series flash device: %x at %x\n",
-		WINDOW_SIZE, WINDOW_ADDR);
-	sharpsl_map.virt = ioremap(WINDOW_ADDR, WINDOW_SIZE);
-	if (!sharpsl_map.virt) {
-		printk("Failed to ioremap\n");
-		return -EIO;
-	}
-
-	simple_map_init(&sharpsl_map);
-
-	mymtd = do_map_probe("map_rom", &sharpsl_map);
-	if (!mymtd) {
-		iounmap(sharpsl_map.virt);
-		return -ENXIO;
-	}
-
-	mymtd->owner = THIS_MODULE;
-
-	if (machine_is_corgi() || machine_is_shepherd() || machine_is_husky()
-		|| machine_is_poodle()) {
-		sharpsl_partitions[0].size=0x006d0000;
-		sharpsl_partitions[0].offset=0x00120000;
-	} else if (machine_is_tosa()) {
-		sharpsl_partitions[0].size=0x006a0000;
-		sharpsl_partitions[0].offset=0x00160000;
-	} else if (machine_is_spitz() || machine_is_akita() || machine_is_borzoi()) {
-		sharpsl_partitions[0].size=0x006b0000;
-		sharpsl_partitions[0].offset=0x00140000;
-	} else {
-		map_destroy(mymtd);
-		iounmap(sharpsl_map.virt);
-		return -ENODEV;
-	}
-
-	parts = sharpsl_partitions;
-	nb_parts = ARRAY_SIZE(sharpsl_partitions);
-
-	printk(KERN_NOTICE "Using %s partition definition\n", part_type);
-	add_mtd_partitions(mymtd, parts, nb_parts);
-
-	return 0;
-}
-
-static void __exit cleanup_sharpsl(void)
-{
-	if (mymtd) {
-		del_mtd_partitions(mymtd);
-		map_destroy(mymtd);
-	}
-	if (sharpsl_map.virt) {
-		iounmap(sharpsl_map.virt);
-		sharpsl_map.virt = 0;
-	}
-}
-
-module_init(init_sharpsl);
-module_exit(cleanup_sharpsl);
-
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("SHARP (Original: Arnold Christensen <AKC@pel.dk>)");
-MODULE_DESCRIPTION("MTD map driver for SHARP SL series");
-- 
1.6.2
