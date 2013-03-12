Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UFN8H-0001Gk-Ta
 for linux-mtd@lists.infradead.org; Tue, 12 Mar 2013 11:12:39 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: =?utf-8?q?=5BPATCH=2001/10=5D=20mtd=3A=20remove=20the=20dbox2-flash=20map=20driver?=
Date: Tue, 12 Mar 2013 13:14:06 +0200
Message-Id: <1363086855-2847-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1363086855-2847-1-git-send-email-dedekind1@gmail.com>
References: <1363086855-2847-1-git-send-email-dedekind1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

This driver depends on the CONFIG_DBOX2 symbol which does not exist in
the kernel, which means the driver is dead.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/maps/Kconfig       |    8 ---
 drivers/mtd/maps/Makefile      |    1 -
 drivers/mtd/maps/dbox2-flash.c |  123 ----------------------------------------
 3 files changed, 132 deletions(-)
 delete mode 100644 drivers/mtd/maps/dbox2-flash.c

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index 3ed17c4..74fe0c2 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -302,14 +302,6 @@ config MTD_MBX860
 	  MBX860 board. If you have one of these boards and would like
 	  to use the flash chips on it, say 'Y'.
 
-config MTD_DBOX2
-	tristate "CFI Flash device mapped on D-Box2"
-	depends on DBOX2 && MTD_CFI_INTELSTD && MTD_CFI_INTELEXT && MTD_CFI_AMDSTD
-	help
-	  This enables access routines for the flash chips on the Nokia/Sagem
-	  D-Box 2 board. If you have one of these boards and would like to use
-	  the flash chips on it, say 'Y'.
-
 config MTD_CFI_FLAGADM
 	tristate "CFI Flash device mapping on FlagaDM"
 	depends on 8xx && MTD_CFI
diff --git a/drivers/mtd/maps/Makefile b/drivers/mtd/maps/Makefile
index 4ded287..93f4db2 100644
--- a/drivers/mtd/maps/Makefile
+++ b/drivers/mtd/maps/Makefile
@@ -34,7 +34,6 @@ obj-$(CONFIG_MTD_TS5500)	+= ts5500_flash.o
 obj-$(CONFIG_MTD_SUN_UFLASH)	+= sun_uflash.o
 obj-$(CONFIG_MTD_VMAX)		+= vmax301.o
 obj-$(CONFIG_MTD_SCx200_DOCFLASH)+= scx200_docflash.o
-obj-$(CONFIG_MTD_DBOX2)		+= dbox2-flash.o
 obj-$(CONFIG_MTD_SOLUTIONENGINE)+= solutionengine.o
 obj-$(CONFIG_MTD_PCI)		+= pci.o
 obj-$(CONFIG_MTD_AUTCPU12)	+= autcpu12-nvram.o
diff --git a/drivers/mtd/maps/dbox2-flash.c b/drivers/mtd/maps/dbox2-flash.c
deleted file mode 100644
index 85bdece..0000000
--- a/drivers/mtd/maps/dbox2-flash.c
+++ /dev/null
@@ -1,123 +0,0 @@
-/*
- * D-Box 2 flash driver
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
-#include <linux/errno.h>
-
-/* partition_info gives details on the logical partitions that the split the
- * single flash device into. If the size if zero we use up to the end of the
- * device. */
-static struct mtd_partition partition_info[]= {
-	{
-	.name		= "BR bootloader",
-	.size		= 128 * 1024,
-	.offset		= 0,
-	.mask_flags	= MTD_WRITEABLE
-	},
-	{
-	.name		= "FLFS (U-Boot)",
-	.size		= 128 * 1024,
-	.offset		= MTDPART_OFS_APPEND,
-	.mask_flags	= 0
-	},
-	{
-	.name		= "Root (SquashFS)",
-	.size		= 7040 * 1024,
-	.offset		= MTDPART_OFS_APPEND,
-	.mask_flags	= 0
-	},
-	{
-	.name		= "var (JFFS2)",
-	.size		= 896 * 1024,
-	.offset		= MTDPART_OFS_APPEND,
-	.mask_flags	= 0
-	},
-	{
-	.name		= "Flash without bootloader",
-	.size		= MTDPART_SIZ_FULL,
-	.offset		= 128 * 1024,
-	.mask_flags	= 0
-	},
-	{
-	.name		= "Complete Flash",
-	.size		= MTDPART_SIZ_FULL,
-	.offset		= 0,
-	.mask_flags	= MTD_WRITEABLE
-	}
-};
-
-#define NUM_PARTITIONS ARRAY_SIZE(partition_info)
-
-#define WINDOW_ADDR 0x10000000
-#define WINDOW_SIZE 0x800000
-
-static struct mtd_info *mymtd;
-
-
-struct map_info dbox2_flash_map = {
-	.name		= "D-Box 2 flash memory",
-	.size		= WINDOW_SIZE,
-	.bankwidth	= 4,
-	.phys		= WINDOW_ADDR,
-};
-
-static int __init init_dbox2_flash(void)
-{
-       	printk(KERN_NOTICE "D-Box 2 flash driver (size->0x%X mem->0x%X)\n", WINDOW_SIZE, WINDOW_ADDR);
-	dbox2_flash_map.virt = ioremap(WINDOW_ADDR, WINDOW_SIZE);
-
-	if (!dbox2_flash_map.virt) {
-		printk("Failed to ioremap\n");
-		return -EIO;
-	}
-	simple_map_init(&dbox2_flash_map);
-
-	// Probe for dual Intel 28F320 or dual AMD
-	mymtd = do_map_probe("cfi_probe", &dbox2_flash_map);
-	if (!mymtd) {
-	    // Probe for single Intel 28F640
-	    dbox2_flash_map.bankwidth = 2;
-
-	    mymtd = do_map_probe("cfi_probe", &dbox2_flash_map);
-	}
-
-	if (mymtd) {
-		mymtd->owner = THIS_MODULE;
-
-                /* Create MTD devices for each partition. */
-		mtd_device_register(mymtd, partition_info, NUM_PARTITIONS);
-
-		return 0;
-	}
-
-	iounmap((void *)dbox2_flash_map.virt);
-	return -ENXIO;
-}
-
-static void __exit cleanup_dbox2_flash(void)
-{
-	if (mymtd) {
-		mtd_device_unregister(mymtd);
-		map_destroy(mymtd);
-	}
-	if (dbox2_flash_map.virt) {
-		iounmap((void *)dbox2_flash_map.virt);
-		dbox2_flash_map.virt = 0;
-	}
-}
-
-module_init(init_dbox2_flash);
-module_exit(cleanup_dbox2_flash);
-
-
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Kári Davíðsson <kd@flaga.is>, Bastian Blank <waldi@tuxbox.org>, Alexander Wild <wild@te-elektronik.com>");
-MODULE_DESCRIPTION("MTD map driver for D-Box 2 board");
-- 
1.7.10.4
