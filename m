Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QZifW-0004Qx-68
	for linux-mtd@lists.infradead.org; Thu, 23 Jun 2011 12:05:59 +0000
Received: by wwf22 with SMTP id 22so1295670wwf.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Jun 2011 05:05:50 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/5] mtd/maps: drop edb7312 support
Date: Thu, 23 Jun 2011 16:05:27 +0400
Message-Id: <1308830731-5698-2-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1308830731-5698-1-git-send-email-dbaryshkov@gmail.com>
References: <1308830731-5698-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

EDB7312 isn't supported by mainline kernel, this driver wasn't working
before recent fixes, the same functionality can be achieved via physmap,
so drop it now. If the board support will ever be submitted to mainline,
one either can revert this commit, or use physmap mtd map driver.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/maps/Kconfig   |    7 --
 drivers/mtd/maps/Makefile  |    1 -
 drivers/mtd/maps/edb7312.c |  135 --------------------------------------------
 3 files changed, 0 insertions(+), 143 deletions(-)
 delete mode 100644 drivers/mtd/maps/edb7312.c

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index 46eca3b..891a9e6 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -392,13 +392,6 @@ config MTD_AUTCPU12
 	  This enables access to the NV-RAM on autronix autcpu12 board.
 	  If you have such a board, say 'Y'.
 
-config MTD_EDB7312
-	tristate "CFI Flash device mapped on EDB7312"
-	depends on ARCH_EDB7312 && MTD_CFI
-	help
-	  This enables access to the CFI Flash on the Cogent EDB7312 board.
-	  If you have such a board, say 'Y' here.
-
 config MTD_IMPA7
 	tristate "JEDEC Flash device mapped on impA7"
 	depends on ARM && MTD_JEDECPROBE
diff --git a/drivers/mtd/maps/Makefile b/drivers/mtd/maps/Makefile
index d6379fe..45dcb8b 100644
--- a/drivers/mtd/maps/Makefile
+++ b/drivers/mtd/maps/Makefile
@@ -39,7 +39,6 @@ obj-$(CONFIG_MTD_DBOX2)		+= dbox2-flash.o
 obj-$(CONFIG_MTD_SOLUTIONENGINE)+= solutionengine.o
 obj-$(CONFIG_MTD_PCI)		+= pci.o
 obj-$(CONFIG_MTD_AUTCPU12)	+= autcpu12-nvram.o
-obj-$(CONFIG_MTD_EDB7312)	+= edb7312.o
 obj-$(CONFIG_MTD_IMPA7)		+= impa7.o
 obj-$(CONFIG_MTD_FORTUNET)	+= fortunet.o
 obj-$(CONFIG_MTD_UCLINUX)	+= uclinux.o
diff --git a/drivers/mtd/maps/edb7312.c b/drivers/mtd/maps/edb7312.c
deleted file mode 100644
index b07acd6..0000000
--- a/drivers/mtd/maps/edb7312.c
+++ /dev/null
@@ -1,135 +0,0 @@
-/*
- * Handle mapping of the NOR flash on Cogent EDB7312 boards
- *
- * Copyright 2002 SYSGO Real-Time Solutions GmbH
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- */
-
-#include <linux/module.h>
-#include <linux/types.h>
-#include <linux/kernel.h>
-#include <linux/init.h>
-#include <asm/io.h>
-#include <linux/mtd/mtd.h>
-#include <linux/mtd/map.h>
-#include <linux/mtd/partitions.h>
-
-#define WINDOW_ADDR 0x00000000      /* physical properties of flash */
-#define WINDOW_SIZE 0x01000000
-#define BUSWIDTH    2
-#define FLASH_BLOCKSIZE_MAIN	0x20000
-#define FLASH_NUMBLOCKS_MAIN	128
-/* can be "cfi_probe", "jedec_probe", "map_rom", NULL }; */
-#define PROBETYPES { "cfi_probe", NULL }
-
-#define MSG_PREFIX "EDB7312-NOR:"   /* prefix for our printk()'s */
-#define MTDID      "edb7312-nor"    /* for mtdparts= partitioning */
-
-static struct mtd_info *mymtd;
-
-struct map_info edb7312nor_map = {
-	.name = "NOR flash on EDB7312",
-	.size = WINDOW_SIZE,
-	.bankwidth = BUSWIDTH,
-	.phys = WINDOW_ADDR,
-};
-
-/*
- * MTD partitioning stuff
- */
-static struct mtd_partition static_partitions[3] =
-{
-	{
-		.name = "ARMboot",
-		.size = 0x40000,
-		.offset = 0
-	},
-	{
-		.name = "Kernel",
-		.size = 0x200000,
-		.offset = 0x40000
-	},
-	{
-		.name = "RootFS",
-		.size = 0xDC0000,
-		.offset = 0x240000
-	},
-};
-
-static const char *probes[] = { "RedBoot", "cmdlinepart", NULL };
-
-static int                   mtd_parts_nb = 0;
-static struct mtd_partition *mtd_parts    = 0;
-
-static int __init init_edb7312nor(void)
-{
-	static const char *rom_probe_types[] = PROBETYPES;
-	const char **type;
-	const char *part_type = 0;
-
-       	printk(KERN_NOTICE MSG_PREFIX "0x%08x at 0x%08x\n",
-	       WINDOW_SIZE, WINDOW_ADDR);
-	edb7312nor_map.virt = ioremap(WINDOW_ADDR, WINDOW_SIZE);
-
-	if (!edb7312nor_map.virt) {
-		printk(MSG_PREFIX "failed to ioremap\n");
-		return -EIO;
-	}
-
-	simple_map_init(&edb7312nor_map);
-
-	mymtd = 0;
-	type = rom_probe_types;
-	for(; !mymtd && *type; type++) {
-		mymtd = do_map_probe(*type, &edb7312nor_map);
-	}
-	if (mymtd) {
-		mymtd->owner = THIS_MODULE;
-		mymtd->name = MTDID;
-
-		mtd_parts_nb = parse_mtd_partitions(mymtd, probes, &mtd_parts, 0);
-		if (mtd_parts_nb > 0)
-			part_type = "detected";
-
-		if (mtd_parts_nb == 0) {
-			mtd_parts = static_partitions;
-			mtd_parts_nb = ARRAY_SIZE(static_partitions);
-			part_type = "static";
-		}
-
-		if (mtd_parts_nb == 0)
-			printk(KERN_NOTICE MSG_PREFIX "no partition info available\n");
-		else
-			printk(KERN_NOTICE MSG_PREFIX
-			       "using %s partition definition\n", part_type);
-		/* Register the whole device first. */
-		mtd_device_register(mymtd, NULL, 0);
-		mtd_device_register(mymtd, mtd_parts, mtd_parts_nb);
-		return 0;
-	}
-
-	iounmap((void *)edb7312nor_map.virt);
-	return -ENXIO;
-}
-
-static void __exit cleanup_edb7312nor(void)
-{
-	if (mymtd) {
-		mtd_device_unregister(mymtd);
-		map_destroy(mymtd);
-	}
-	if (edb7312nor_map.virt) {
-		iounmap((void *)edb7312nor_map.virt);
-		edb7312nor_map.virt = 0;
-	}
-}
-
-module_init(init_edb7312nor);
-module_exit(cleanup_edb7312nor);
-
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Marius Groeger <mag@sysgo.de>");
-MODULE_DESCRIPTION("Generic configurable MTD map driver");
-- 
1.7.5.3
