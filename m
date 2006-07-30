Received: from alephnull.demon.nl ([83.160.184.112] helo=xi.wantstofly.org)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G77wy-0001sW-0u
	for linux-mtd@lists.infradead.org; Sun, 30 Jul 2006 05:51:13 -0400
Date: Sun, 30 Jul 2006 11:50:54 +0200
From: Lennert Buytenhek <buytenh@wantstofly.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] remove iq80310 map driver
Message-ID: <20060730095054.GA3075@xi.wantstofly.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: nico@cam.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The iq80310 mtd map driver depends on ARCH_IQ80310, which isn't
defined anywhere in the tree (as we don't have 80310 support), and
furthermore, everything the driver does can be done with physmap
instead.

Signed-off-by: Lennert Buytenhek <buytenh@wantstofly.org>

Index: linux-2.6.18-rc2/drivers/mtd/maps/Kconfig
===================================================================
--- linux-2.6.18-rc2.orig/drivers/mtd/maps/Kconfig
+++ linux-2.6.18-rc2/drivers/mtd/maps/Kconfig
@@ -447,14 +447,6 @@ config MTD_DC21285
 	  21285 bridge used with Intel's StrongARM processors. More info at
 	  <http://www.intel.com/design/bridge/docs/21285_documentation.htm>.
 
-config MTD_IQ80310
-	tristate "CFI Flash device mapped on the XScale IQ80310 board"
-	depends on MTD_CFI && ARCH_IQ80310
-	help
-	  This enables access routines for the flash chips on the Intel XScale
-	  IQ80310 evaluation board. If you have one of these boards and would
-	  like to use the flash chips on it, say 'Y'.
-
 config MTD_IXP4XX
 	tristate "CFI Flash device mapped on Intel IXP4xx based systems"
 	depends on MTD_CFI && MTD_COMPLEX_MAPPINGS && ARCH_IXP4XX
Index: linux-2.6.18-rc2/drivers/mtd/maps/Makefile
===================================================================
--- linux-2.6.18-rc2.orig/drivers/mtd/maps/Makefile
+++ linux-2.6.18-rc2/drivers/mtd/maps/Makefile
@@ -15,7 +15,6 @@ obj-$(CONFIG_MTD_CFI_FLAGADM)	+= cfi_fla
 obj-$(CONFIG_MTD_CSTM_MIPS_IXX)	+= cstm_mips_ixx.o
 obj-$(CONFIG_MTD_DC21285)	+= dc21285.o
 obj-$(CONFIG_MTD_DILNETPC)	+= dilnetpc.o
-obj-$(CONFIG_MTD_IQ80310)	+= iq80310.o
 obj-$(CONFIG_MTD_L440GX)	+= l440gx.o
 obj-$(CONFIG_MTD_AMD76XROM)	+= amd76xrom.o
 obj-$(CONFIG_MTD_ICHXROM)	+= ichxrom.o
Index: linux-2.6.18-rc2/drivers/mtd/maps/iq80310.c
===================================================================
--- linux-2.6.18-rc2.orig/drivers/mtd/maps/iq80310.c
+++ /dev/null
@@ -1,118 +0,0 @@
-/*
- * $Id: iq80310.c,v 1.21 2005/11/07 11:14:27 gleixner Exp $
- *
- * Mapping for the Intel XScale IQ80310 evaluation board
- *
- * Author:	Nicolas Pitre
- * Copyright:	(C) 2001 MontaVista Software Inc.
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
-#include <linux/slab.h>
-#include <asm/io.h>
-#include <linux/mtd/mtd.h>
-#include <linux/mtd/map.h>
-#include <linux/mtd/partitions.h>
-
-
-#define WINDOW_ADDR 	0
-#define WINDOW_SIZE 	8*1024*1024
-#define BUSWIDTH 	1
-
-static struct mtd_info *mymtd;
-
-static struct map_info iq80310_map = {
-	.name = "IQ80310 flash",
-	.size = WINDOW_SIZE,
-	.bankwidth = BUSWIDTH,
-	.phys = WINDOW_ADDR
-};
-
-static struct mtd_partition iq80310_partitions[4] = {
-	{
-		.name =		"Firmware",
-		.size =		0x00080000,
-		.offset =	0,
-		.mask_flags =	MTD_WRITEABLE  /* force read-only */
-	},{
-		.name =		"Kernel",
-		.size =		0x000a0000,
-		.offset =	0x00080000,
-	},{
-		.name =		"Filesystem",
-		.size =		0x00600000,
-		.offset =	0x00120000
-	},{
-		.name =		"RedBoot",
-		.size =		0x000e0000,
-		.offset =	0x00720000,
-		.mask_flags =	MTD_WRITEABLE
-	}
-};
-
-static struct mtd_info *mymtd;
-static struct mtd_partition *parsed_parts;
-static const char *probes[] = { "RedBoot", "cmdlinepart", NULL };
-
-static int __init init_iq80310(void)
-{
-	struct mtd_partition *parts;
-	int nb_parts = 0;
-	int parsed_nr_parts = 0;
-	int ret;
-
-	iq80310_map.virt = ioremap(WINDOW_ADDR, WINDOW_SIZE);
-	if (!iq80310_map.virt) {
-		printk("Failed to ioremap\n");
-		return -EIO;
-	}
-	simple_map_init(&iq80310_map);
-
-	mymtd = do_map_probe("cfi_probe", &iq80310_map);
-	if (!mymtd) {
-		iounmap((void *)iq80310_map.virt);
-		return -ENXIO;
-	}
-	mymtd->owner = THIS_MODULE;
-
-	ret = parse_mtd_partitions(mymtd, probes, &parsed_parts, 0);
-
-	if (ret > 0)
-		parsed_nr_parts = ret;
-
-	if (parsed_nr_parts > 0) {
-		parts = parsed_parts;
-		nb_parts = parsed_nr_parts;
-	} else {
-		parts = iq80310_partitions;
-		nb_parts = ARRAY_SIZE(iq80310_partitions);
-	}
-	add_mtd_partitions(mymtd, parts, nb_parts);
-	return 0;
-}
-
-static void __exit cleanup_iq80310(void)
-{
-	if (mymtd) {
-		del_mtd_partitions(mymtd);
-		map_destroy(mymtd);
-		kfree(parsed_parts);
-	}
-	if (iq80310_map.virt)
-		iounmap((void *)iq80310_map.virt);
-}
-
-module_init(init_iq80310);
-module_exit(cleanup_iq80310);
-
-
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Nicolas Pitre <nico@cam.org>");
-MODULE_DESCRIPTION("MTD map driver for Intel XScale IQ80310 evaluation board");
