Received: from gateway-1237.mvista.com ([12.44.186.158] helo=orion.mvista.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AEg5d-0003oc-KB
	for <linux-mtd@lists.infradead.org>; Wed, 29 Oct 2003 02:29:41 +0000
Date: Tue, 28 Oct 2003 18:28:28 -0800
From: Jun Sun <jsun@mvista.com>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20031028182828.D30683@mvista.com>
References: <20031022182558.U19834@mvista.com>
	<20031027101741.C1678@mvista.com>
	<1067338214.15551.405.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1067338214.15551.405.camel@hades.cambridge.redhat.com>;
	from dwmw2@infradead.org on Tue, Oct 28, 2003 at 10:50:15AM +0000
Content-Type: multipart/mixed; boundary="s2ZSL+KKDSLx8OML"
cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] extend physmap.c to support run-time adding partitions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--s2ZSL+KKDSLx8OML
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 28, 2003 at 10:50:15AM +0000, David Woodhouse wrote:
> On Mon, 2003-10-27 at 10:17 -0800, Jun Sun wrote:
> > Any objections or comments?  David?
> 
> Sorry for delayed response. I'm not really sure about this. Take a look
> at drivers/mtd/maps/rpxlite.c -- that's what we're able to eliminate,

I think a lot of more can be eliminated, including db1x00-flash.c
which I did take a look.

What concerns me more is that I have at least four more new boards
that cry for this extension.  Without it, I would have to introduce
more junk files into linux-mtd.

We need to have this extension or something like this in place.

> and we could even stick half of _that_ into a library function. 
> 

I don't quite follow here.

> I'm all for cleaning up all the duplication in the map drivers, but I'm
> not sure we need to do it by making users enter correct numbers for
> CONFIG_MTD_PHYSMAP_*...
> 

I didn't like that aspect either.  I thought I should keep the
patch minimum so that it is easier for people to swallow. :)

Actually the new attached version is probably what I like more.
It gets rid of the config options for physmap.

Since physmap_map is external, one can easily setup the mapping
at the run time instead of configuration time.  The new patch
simply adds some syntactic sugar by introducing an inline function
to do this.  

Jun

--s2ZSL+KKDSLx8OML
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=patch2

diff -Nru linux/arch/mips/mips-boards/malta/malta_setup.c.orig linux/arch/mips/mips-boards/malta/malta_setup.c
--- linux/arch/mips/mips-boards/malta/malta_setup.c.orig	Fri Aug  1 10:50:18 2003
+++ linux/arch/mips/mips-boards/malta/malta_setup.c	Tue Oct 28 17:02:01 2003
@@ -24,6 +24,7 @@
 #ifdef CONFIG_BLK_DEV_IDE
 #include <linux/ide.h>
 #endif
+#include <linux/mtd/physmap.h>
 
 #include <asm/cpu.h>
 #include <asm/bootinfo.h>
@@ -166,6 +167,15 @@
         conswitchp = &dummy_con;
 #endif
 #endif
+
+#if defined(CONFIG_MTD)
+	/* we use generic physmap mapping driver */
+	physmap_set_map(0x400000, 4, 0x1e000000);
+
+	physmap_add_partition("YAMON", 0x100000, 0x0, MTD_WRITEABLE);
+	physmap_add_partition("User FS", 0x300000, 0x100000, 0);
+#endif
+
 	mips_reboot_setup();
 
 	board_time_init = mips_time_init;
diff -Nru linux/drivers/mtd/maps/physmap.c.orig linux/drivers/mtd/maps/physmap.c
--- linux/drivers/mtd/maps/physmap.c.orig	Wed Jul 23 15:17:52 2003
+++ linux/drivers/mtd/maps/physmap.c	Tue Oct 28 17:05:12 2003
@@ -2,6 +2,11 @@
  * $Id: physmap.c,v 1.28 2003/05/28 15:53:43 dwmw2 Exp $
  *
  * Normal mappings of chips in physical memory
+ *
+ * Copyright (C) 2003 MontaVista Software Inc.
+ * Author: Jun Sun, jsun@mvista.com or jsun@junsun.net
+ *
+ * 031022 - [jsun] add physmap_add_partition()
  */
 
 #include <linux/module.h>
@@ -15,53 +20,39 @@
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
+#define NUM_PARTITIONS	4	/* random num which should be good enough */
+static struct mtd_partition physmap_partitions[NUM_PARTITIONS] __initdata = {};
+
+char *part_probes[] __initdata = {"cmdlinepart", "RedBoot", NULL};
+
+/*
+ * See include/linux/mtd/physmap.h file.
+ */
+static int part_index __initdata = 0;
+int __init physmap_add_partition(char *name, u32 size, u32 offset, u32 flags)
+{
+	if (part_index >= NUM_PARTITIONS) {
+		printk(KERN_ERR "physmap_add_partition() exceeds max partition table size (%d)\n", NUM_PARTITIONS);
+		return -1;
 	}
-#endif
-};
 
-#define NUM_PARTITIONS	(sizeof(physmap_partitions)/sizeof(struct mtd_partition))
-const char *part_probes[] = {"cmdlinepart", "RedBoot", NULL};
+	physmap_partitions[part_index].name = name;
+	physmap_partitions[part_index].size = size;
+	physmap_partitions[part_index].offset = offset;
+	physmap_partitions[part_index].mask_flags = flags;
+
+	part_index++;
 
+	return 0;
+}
 #endif /* CONFIG_MTD_PARTITIONS */
 
 int __init init_physmap(void)
@@ -69,8 +60,8 @@
 	static const char *rom_probe_types[] = { "cfi_probe", "jedec_probe", "map_rom", 0 };
 	const char **type;
 
-       	printk(KERN_NOTICE "physmap flash device: %x at %x\n", WINDOW_SIZE, WINDOW_ADDR);
-	physmap_map.virt = (unsigned long)ioremap(WINDOW_ADDR, WINDOW_SIZE);
+       	printk(KERN_NOTICE "physmap flash device: %lx at %lx\n", physmap_map.size, physmap_map.phys);
+	physmap_map.virt = (unsigned long)ioremap(physmap_map.phys, physmap_map.size);
 
 	if (!physmap_map.virt) {
 		printk("Failed to ioremap\n");
@@ -97,11 +88,11 @@
 			return 0;
 		}
 
-		if (NUM_PARTITIONS != 0) 
+		if (part_index != 0) 
 		{
 			printk(KERN_NOTICE 
 			       "Using physmap partition definition\n");
-			add_mtd_partitions (mymtd, physmap_partitions, NUM_PARTITIONS);
+			add_mtd_partitions (mymtd, physmap_partitions, part_index);
 			return 0;
 		}
 
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
+++ linux/include/linux/mtd/physmap.h	Tue Oct 28 17:11:29 2003
@@ -0,0 +1,58 @@
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
+static inline void physmap_set_map(unsigned long size, int buswidth, unsigned long phys_addr)
+{
+	physmap_map.size = size;
+	physmap_map.buswidth = buswidth;
+	physmap_map.phys = phys_addr;
+}
+
+#if defined(CONFIG_MTD_PARTITIONS)
+
+/*
+ * Machines that wish to do flash partition may want to call this function in 
+ * their setup routine.  Examples:
+ *
+ *	physmap_add_partition("bootROM", 0x100000, 0, MTD_WRITEABLE);	// RO
+ *	physmap_add_partition("User FS", 0x300000, 0x100000, 0); 	// RW
+ *
+ * Note that one can always override this hard-coded partition with 
+ * command line partition (you need to enable CONFIG_MTD_CMDLINE_PARTS).
+ */
+int physmap_add_partition(char *name, u32 size, u32 offset, u32 mask_flags);
+
+#endif /* defined(CONFIG_MTD_PARTITIONS) */
+#endif /* defined(CONFIG_MTD) */
+
+#endif /* __LINUX_MTD_PHYSMAP__ */
+

--s2ZSL+KKDSLx8OML--
