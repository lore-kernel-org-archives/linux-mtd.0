Received: from gateway-1237.mvista.com ([12.44.186.158] helo=orion.mvista.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AHBnv-0000UT-UK
	for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2003 00:45:48 +0000
Date: Tue, 4 Nov 2003 16:44:31 -0800
From: Jun Sun <jsun@mvista.com>
To: linux-mtd@lists.infradead.org, dwmw2@infradead.org
Message-ID: <20031104164431.K16745@mvista.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Type: multipart/mixed; boundary="M/SuVGWktc5uNpra"
Subject: [PATCH] extend physmap.c to support run-time configure and
	partitioning (take 3)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--M/SuVGWktc5uNpra
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


David,

Since you did not give any preference on how board should
pass partition info to physmap, I just picked a reasonable
one.

Is this patch now good enough to apply?  Thanks.

Jun


--M/SuVGWktc5uNpra
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=patch3

diff -Nru linux/arch/mips/mips-boards/malta/malta_setup.c.orig linux/arch/mips/mips-boards/malta/malta_setup.c
--- linux/arch/mips/mips-boards/malta/malta_setup.c.orig	Fri Aug  1 10:50:18 2003
+++ linux/arch/mips/mips-boards/malta/malta_setup.c	Tue Nov  4 16:31:36 2003
@@ -24,6 +24,7 @@
 #ifdef CONFIG_BLK_DEV_IDE
 #include <linux/ide.h>
 #endif
+#include <linux/mtd/physmap.h>
 
 #include <asm/cpu.h>
 #include <asm/bootinfo.h>
@@ -75,6 +76,28 @@
 
 #define STANDARD_IO_RESOURCES (sizeof(standard_io_resources)/sizeof(struct resource))
 
+#if defined(CONFIG_MTD)
+static struct mtd_partition malta_mtd_parts[] __initdata = {
+	{
+		.name = "YAMON",
+		.offset = 0x0,
+		.size = 0x100000,
+		.mask_flags=MTD_WRITEABLE
+	},
+	{
+		.name = "User FS",
+		.offset = 0x100000,
+		.size = 0x2e0000
+	},
+	{
+		.name = "board config",
+		.offset = 0x3e0000,
+		.size = 0x020000,
+		.mask_flags=MTD_WRITEABLE
+	}
+};
+#endif
+
 const char *get_system_type(void)
 {
 	return "MIPS Malta";
@@ -166,6 +189,13 @@
         conswitchp = &dummy_con;
 #endif
 #endif
+
+#if defined(CONFIG_MTD)
+	/* we use generic physmap mapping driver and we use partitions */
+	physmap_configure(0x1e000000, 0x400000, 4, NULL);
+	physmap_set_partitions(malta_mtd_parts, 3);
+#endif
+
 	mips_reboot_setup();
 
 	board_time_init = mips_time_init;
diff -Nru linux/drivers/mtd/maps/physmap.c.orig linux/drivers/mtd/maps/physmap.c
--- linux/drivers/mtd/maps/physmap.c.orig	Wed Jul 23 15:17:52 2003
+++ linux/drivers/mtd/maps/physmap.c	Tue Nov  4 16:11:06 2003
@@ -2,6 +2,11 @@
  * $Id: physmap.c,v 1.28 2003/05/28 15:53:43 dwmw2 Exp $
  *
  * Normal mappings of chips in physical memory
+ *
+ * Copyright (C) 2003 MontaVista Software Inc.
+ * Author: Jun Sun, jsun@mvista.com or jsun@junsun.net
+ *
+ * 031022 - [jsun] add run-time configure and partition setup
  */
 
 #include <linux/module.h>
@@ -15,53 +20,24 @@
 #include <linux/config.h>
 #include <linux/mtd/partitions.h>
 
-#define WINDOW_ADDR CONFIG_MTD_PHYSMAP_START
-#define WINDOW_SIZE CONFIG_MTD_PHYSMAP_LEN
-#define BUSWIDTH CONFIG_MTD_PHYSMAP_BUSWIDTH
-
 static struct mtd_info *mymtd;
 
-
-struct map_info physmap_map = {
-	.name = "Physically mapped flash",
-	.size = WINDOW_SIZE,
-	.buswidth = BUSWIDTH,
-	.phys = WINDOW_ADDR,
-};
+struct map_info physmap_map = {.name = "phys_mapped_flash"};
 
 #ifdef CONFIG_MTD_PARTITIONS
 static struct mtd_partition *mtd_parts;
 static int                   mtd_parts_nb;
 
-static struct mtd_partition physmap_partitions[] = {
-#if 0
-/* Put your own partition definitions here */
-	{
-		.name =		"bootROM",
-		.size =		0x80000,
-		.offset =	0,
-		.mask_flags =	MTD_WRITEABLE,  /* force read-only */
-	}, {
-		.name =		"zImage",
-		.size =		0x100000,
-		.offset =	MTDPART_OFS_APPEND,
-		.mask_flags =	MTD_WRITEABLE,  /* force read-only */
-	}, {
-		.name =		"ramdisk.gz",
-		.size =		0x300000,
-		.offset =	MTDPART_OFS_APPEND,
-		.mask_flags =	MTD_WRITEABLE,  /* force read-only */
-	}, {
-		.name =		"User FS",
-		.size =		MTDPART_SIZ_FULL,
-		.offset =	MTDPART_OFS_APPEND,
-	}
-#endif
-};
+static int num_physmap_partitions;
+static struct mtd_partition *physmap_partitions;
 
-#define NUM_PARTITIONS	(sizeof(physmap_partitions)/sizeof(struct mtd_partition))
-const char *part_probes[] = {"cmdlinepart", "RedBoot", NULL};
+char *part_probes[] __initdata = {"cmdlinepart", "RedBoot", NULL};
 
+void physmap_set_partitions(struct mtd_partition *parts, int num_parts)
+{
+	physmap_partitions=parts;
+	num_physmap_partitions=num_parts;
+}
 #endif /* CONFIG_MTD_PARTITIONS */
 
 int __init init_physmap(void)
@@ -69,8 +45,8 @@
 	static const char *rom_probe_types[] = { "cfi_probe", "jedec_probe", "map_rom", 0 };
 	const char **type;
 
-       	printk(KERN_NOTICE "physmap flash device: %x at %x\n", WINDOW_SIZE, WINDOW_ADDR);
-	physmap_map.virt = (unsigned long)ioremap(WINDOW_ADDR, WINDOW_SIZE);
+       	printk(KERN_NOTICE "physmap flash device: %lx at %lx\n", physmap_map.size, physmap_map.phys);
+	physmap_map.virt = (unsigned long)ioremap(physmap_map.phys, physmap_map.size);
 
 	if (!physmap_map.virt) {
 		printk("Failed to ioremap\n");
@@ -97,11 +73,11 @@
 			return 0;
 		}
 
-		if (NUM_PARTITIONS != 0) 
+		if (num_physmap_partitions != 0) 
 		{
 			printk(KERN_NOTICE 
 			       "Using physmap partition definition\n");
-			add_mtd_partitions (mymtd, physmap_partitions, NUM_PARTITIONS);
+			add_mtd_partitions (mymtd, physmap_partitions, num_physmap_partitions);
 			return 0;
 		}
 
@@ -121,7 +97,7 @@
 	if (mtd_parts_nb) {
 		del_mtd_partitions(mymtd);
 		kfree(mtd_parts);
-	} else if (NUM_PARTITIONS) {
+	} else if (num_physmap_partitions) {
 		del_mtd_partitions(mymtd);
 	} else {
 		del_mtd_device(mymtd);
diff -Nru linux/drivers/mtd/maps/Config.in.orig linux/drivers/mtd/maps/Config.in
--- linux/drivers/mtd/maps/Config.in.orig	Tue Oct 21 18:07:35 2003
+++ linux/drivers/mtd/maps/Config.in	Tue Oct 28 16:59:07 2003
@@ -8,12 +8,7 @@
 
 bool '  Support for non-linear mappings of flash chips' CONFIG_MTD_COMPLEX_MAPPINGS
 
-dep_tristate '  CFI Flash device in physical memory map' CONFIG_MTD_PHYSMAP $CONFIG_MTD_GEN_PROBE
-if [ "$CONFIG_MTD_PHYSMAP" = "y" -o "$CONFIG_MTD_PHYSMAP" = "m" ]; then
-   hex '    Physical start address of flash mapping' CONFIG_MTD_PHYSMAP_START 0x8000000
-   hex '    Physical length of flash mapping' CONFIG_MTD_PHYSMAP_LEN 0x4000000
-   int '    Bus width in octets' CONFIG_MTD_PHYSMAP_BUSWIDTH 2
-fi
+bool '  CFI Flash device in physical memory map' CONFIG_MTD_PHYSMAP $CONFIG_MTD_GEN_PROBE
 
 if [ "$CONFIG_SPARC" = "y" -o "$CONFIG_SPARC64" = "y" ]; then
    dep_tristate '  Sun Microsystems userflash support' CONFIG_MTD_SUN_UFLASH $CONFIG_MTD_CFI
diff -Nru linux/drivers/mtd/maps/Makefile.orig linux/drivers/mtd/maps/Makefile
diff -Nru linux/include/linux/mtd/physmap.h.orig linux/include/linux/mtd/physmap.h
--- linux/include/linux/mtd/physmap.h.orig	Wed Oct 22 17:05:22 2003
+++ linux/include/linux/mtd/physmap.h	Tue Nov  4 16:09:48 2003
@@ -0,0 +1,59 @@
+/*
+ * For boards with physically mapped flash and using 
+ * drivers/mtd/maps/physmap.c mapping driver.
+ *
+ * Copyright (C) 2003 MontaVista Software Inc.
+ * Author: Jun Sun, jsun@mvista.com or jsun@junsun.net
+ *
+ * This program is free software; you can redistribute  it and/or modify it
+ * under  the terms of  the GNU General  Public License as published by the
+ * Free Software Foundation;  either version 2 of the  License, or (at your
+ * option) any later version.
+ *
+ */
+
+#ifndef __LINUX_MTD_PHYSMAP__
+
+#include <linux/config.h>
+
+#if defined(CONFIG_MTD_PHYSMAP) 
+
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/map.h>
+#include <linux/mtd/partitions.h>
+
+/*
+ * The map_info for physmap.  Board can override size, buswidth, phys,
+ * (*set_vpp)(), etc in their initial setup routine.
+ */
+extern struct map_info physmap_map;
+
+/*
+ * Board needs to specify the exact mapping during their setup time.
+ */
+static inline void physmap_configure(unsigned long addr, unsigned long size, int buswidth, void (*set_vpp)(struct map_info *, int) )
+{
+	physmap_map.phys = addr;
+	physmap_map.size = size;
+	physmap_map.buswidth = buswidth;
+	physmap_map.set_vpp = set_vpp;
+}
+
+#if defined(CONFIG_MTD_PARTITIONS)
+
+/*
+ * Machines that wish to do flash partition may want to call this function in 
+ * their setup routine.  
+ *
+ *	physmap_set_partitions(mypartitions, num_parts);
+ *
+ * Note that one can always override this hard-coded partition with 
+ * command line partition (you need to enable CONFIG_MTD_CMDLINE_PARTS).
+ */
+void physmap_set_partitions(struct mtd_partition *parts, int num_parts);
+
+#endif /* defined(CONFIG_MTD_PARTITIONS) */
+#endif /* defined(CONFIG_MTD) */
+
+#endif /* __LINUX_MTD_PHYSMAP__ */
+

--M/SuVGWktc5uNpra--
