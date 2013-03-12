From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 03/10] mtd: remove the mbx860 map driver
Date: Tue, 12 Mar 2013 13:14:08 +0200
Message-Id: <1363086855-2847-4-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1363086855-2847-1-git-send-email-dedekind1@gmail.com>
References: <1363086855-2847-1-git-send-email-dedekind1@gmail.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-m68k@lists.linux-m68k.org, linux-pcmcia@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

This driver depends on CONFIG_MBX which is not defined anywhere, which means
this driver is dead.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Cc: linux-pcmcia@lists.infradead.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
---
 drivers/mtd/maps/Kconfig  |    8 ----
 drivers/mtd/maps/Makefile |    1 -
 drivers/mtd/maps/mbx860.c |   98 ---------------------------------------------
 3 files changed, 107 deletions(-)
 delete mode 100644 drivers/mtd/maps/mbx860.c

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index 7071486..300761f 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -294,14 +294,6 @@ config MTD_RPXLITE
 	  to communicate with the chips on the RPXLite board. More at
 	  <http://www.embeddedplanet.com/>.
 
-config MTD_MBX860
-	tristate "System flash on MBX860 board"
-	depends on MTD_CFI && MBX
-	help
-	  This enables access routines for the flash chips on the Motorola
-	  MBX860 board. If you have one of these boards and would like
-	  to use the flash chips on it, say 'Y'.
-
 config MTD_CFI_FLAGADM
 	tristate "CFI Flash device mapping on FlagaDM"
 	depends on 8xx && MTD_CFI
diff --git a/drivers/mtd/maps/Makefile b/drivers/mtd/maps/Makefile
index 819e2ab..b61ea98 100644
--- a/drivers/mtd/maps/Makefile
+++ b/drivers/mtd/maps/Makefile
@@ -17,7 +17,6 @@ obj-$(CONFIG_MTD_ICHXROM)	+= ichxrom.o
 obj-$(CONFIG_MTD_CK804XROM)	+= ck804xrom.o
 obj-$(CONFIG_MTD_TSUNAMI)	+= tsunami_flash.o
 obj-$(CONFIG_MTD_PXA2XX)	+= pxa2xx-flash.o
-obj-$(CONFIG_MTD_MBX860)	+= mbx860.o
 obj-$(CONFIG_MTD_OCTAGON)	+= octagon-5066.o
 obj-$(CONFIG_MTD_PHYSMAP)	+= physmap.o
 obj-$(CONFIG_MTD_PHYSMAP_OF)	+= physmap_of.o
diff --git a/drivers/mtd/maps/mbx860.c b/drivers/mtd/maps/mbx860.c
deleted file mode 100644
index 93fa56c..0000000
--- a/drivers/mtd/maps/mbx860.c
+++ /dev/null
@@ -1,98 +0,0 @@
-/*
- * Handle mapping of the flash on MBX860 boards
- *
- * Author:	Anton Todorov
- * Copyright:	(C) 2001 Emness Technology
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
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
-
-#define WINDOW_ADDR 0xfe000000
-#define WINDOW_SIZE 0x00200000
-
-/* Flash / Partition sizing */
-#define MAX_SIZE_KiB              8192
-#define BOOT_PARTITION_SIZE_KiB    512
-#define KERNEL_PARTITION_SIZE_KiB 5632
-#define APP_PARTITION_SIZE_KiB    2048
-
-#define NUM_PARTITIONS 3
-
-/* partition_info gives details on the logical partitions that the split the
- * single flash device into. If the size if zero we use up to the end of the
- * device. */
-static struct mtd_partition partition_info[]={
-	{ .name = "MBX flash BOOT partition",
-	.offset = 0,
-	.size =   BOOT_PARTITION_SIZE_KiB*1024 },
-	{ .name = "MBX flash DATA partition",
-	.offset = BOOT_PARTITION_SIZE_KiB*1024,
-	.size = (KERNEL_PARTITION_SIZE_KiB)*1024 },
-	{ .name = "MBX flash APPLICATION partition",
-	.offset = (BOOT_PARTITION_SIZE_KiB+KERNEL_PARTITION_SIZE_KiB)*1024 }
-};
-
-
-static struct mtd_info *mymtd;
-
-struct map_info mbx_map = {
-	.name = "MBX flash",
-	.size = WINDOW_SIZE,
-	.phys = WINDOW_ADDR,
-	.bankwidth = 4,
-};
-
-static int __init init_mbx(void)
-{
-	printk(KERN_NOTICE "Motorola MBX flash device: 0x%x at 0x%x\n", WINDOW_SIZE*4, WINDOW_ADDR);
-	mbx_map.virt = ioremap(WINDOW_ADDR, WINDOW_SIZE * 4);
-
-	if (!mbx_map.virt) {
-		printk("Failed to ioremap\n");
-		return -EIO;
-	}
-	simple_map_init(&mbx_map);
-
-	mymtd = do_map_probe("jedec_probe", &mbx_map);
-	if (mymtd) {
-		mymtd->owner = THIS_MODULE;
-		mtd_device_register(mymtd, NULL, 0);
-		mtd_device_register(mymtd, partition_info, NUM_PARTITIONS);
-		return 0;
-	}
-
-	iounmap((void *)mbx_map.virt);
-	return -ENXIO;
-}
-
-static void __exit cleanup_mbx(void)
-{
-	if (mymtd) {
-		mtd_device_unregister(mymtd);
-		map_destroy(mymtd);
-	}
-	if (mbx_map.virt) {
-		iounmap((void *)mbx_map.virt);
-		mbx_map.virt = 0;
-	}
-}
-
-module_init(init_mbx);
-module_exit(cleanup_mbx);
-
-MODULE_AUTHOR("Anton Todorov <a.todorov@emness.com>");
-MODULE_DESCRIPTION("MTD map driver for Motorola MBX860 board");
-MODULE_LICENSE("GPL");
-- 
1.7.10.4
