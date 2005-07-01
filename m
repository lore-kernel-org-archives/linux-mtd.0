Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DoHCj-0002yV-85
	for linux-mtd@lists.infradead.org; Fri, 01 Jul 2005 04:49:01 -0400
Date: Fri, 1 Jul 2005 10:49:01 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: tpoynor@infradead.org
Message-ID: <20050701084901.GA20056@wohnheim.fh-wedel.de>
References: <E1Do7j2-0004SA-7P@phoenix.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <E1Do7j2-0004SA-7P@phoenix.infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: mtd/drivers/mtd/maps mainstone-flash.c, NONE, 1.1 Kconfig, 1.53,
	1.54 Makefile.common, 1.28, 1.29
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 30 June 2005 23:41:40 +0100, tpoynor@infradead.org wrote:
> 
> --- NEW FILE mainstone-flash.c ---

Since this one is new, would you mind some comments?

> /*
>  * $Id:  $
>  *
>  * Map driver for the Mainstone developer platform.
>  *
>  * Author:	Nicolas Pitre
>  * Copyright:	(C) 2001 MontaVista Software Inc.
>  * 
>  * This program is free software; you can redistribute it and/or modify
>  * it under the terms of the GNU General Public License version 2 as
>  * published by the Free Software Foundation.
>  */
> 
> #include <linux/module.h>
> #include <linux/types.h>
> #include <linux/kernel.h>
> #include <linux/init.h>
> #include <linux/dma-mapping.h>
> #include <linux/mtd/mtd.h>
> #include <linux/mtd/map.h>
> #include <linux/mtd/partitions.h>
> #include <asm/io.h>
> #include <asm/hardware.h>
> #include <asm/arch/pxa-regs.h>
> #include <asm/arch/mainstone.h>
> 
> 
> #define ROM_ADDR	0x00000000
> #define FLASH_ADDR	0x04000000
> 
> #define WINDOW_SIZE 	0x04000000
> 
> static void mainstone_map_inval_cache(struct map_info *map, unsigned long from, ssize_t len)

80 columns?

> {
> 	consistent_sync((char *)map->cached + from, len, DMA_FROM_DEVICE);
> }
> 
> static struct map_info mainstone_maps[2] = { {
> 	.size =		WINDOW_SIZE,
> 	.phys =		PXA_CS0_PHYS,
> 	.inval_cache = 	mainstone_map_inval_cache,
> }, {
> 	.size =		WINDOW_SIZE,
> 	.phys =		PXA_CS1_PHYS,
> 	.inval_cache = 	mainstone_map_inval_cache,
> } };
> 
> static struct mtd_partition mainstone_partitions[] = {
> 	{
> 		.name =		"Bootloader",
> 		.size =		0x00040000,
> 		.offset =	0,
> 		.mask_flags =	MTD_WRITEABLE  /* force read-only */
> 	},{
> 		.name =		"Kernel",
> 		.size =		0x00400000,
> 		.offset =	0x00040000,
> 	},{
> 		.name =		"Filesystem",
> 		.size =		MTDPART_SIZ_FULL,
> 		.offset =	0x00440000
> 	}
> };
> 
> static struct mtd_info *mymtds[2];
> static struct mtd_partition *parsed_parts[2];
> static int nr_parsed_parts[2];
> 
> static const char *probes[] = { "RedBoot", "cmdlinepart", NULL };
> 
> static int __init init_mainstone(void)
> {
> 	int SW7 = 0;  /* FIXME: get from SCR (Mst doc section 3.2.1.1) */
> 	int ret = 0, i;
> 
> 	mainstone_maps[0].bankwidth = (BOOT_DEF & 1) ? 2 : 4;
> 	mainstone_maps[1].bankwidth = 4;
> 
> 	/* Compensate for SW7 which swaps the flash banks */
> 	mainstone_maps[SW7].name = "processor flash";
> 	mainstone_maps[SW7 ^ 1].name = "main board flash";
> 
> 	printk(KERN_NOTICE "Mainstone configured to boot from %s\n",
> 	       mainstone_maps[0].name);
> 
> 	for (i = 0; i < 2; i++) {

Bunch of line below exceed 80 columns again...

> 		mainstone_maps[i].virt = ioremap(mainstone_maps[i].phys, WINDOW_SIZE);
> 		if (!mainstone_maps[i].virt) {
> 			printk(KERN_WARNING "Failed to ioremap %s\n", mainstone_maps[i].name);
> 			if (!ret)
> 				ret = -ENOMEM;
> 			continue;
> 		}
> 		mainstone_maps[i].cached = ioremap_cached(mainstone_maps[i].phys, WINDOW_SIZE);
> 		if (!mainstone_maps[i].cached)
> 			printk(KERN_WARNING "Failed to ioremap cached %s\n", mainstone_maps[i].name);

Shouldn't we error out instead of printing a message and continuing
on?

> 		simple_map_init(&mainstone_maps[i]);
> 
> 		printk(KERN_NOTICE "Probing %s at physical address 0x%08lx (%d-bit bankwidth)\n",
> 		       mainstone_maps[i].name, mainstone_maps[i].phys, 
> 		       mainstone_maps[i].bankwidth * 8);
> 
> 		mymtds[i] = do_map_probe("cfi_probe", &mainstone_maps[i]);
> 		
> 		if (!mymtds[i]) {
> 			iounmap((void *)mainstone_maps[i].virt);
> 			if (mainstone_maps[i].cached)
> 				iounmap(mainstone_maps[i].cached);

This is broken.  After above code, mainstone_maps[i].virt can be NULL.
So either you need a NULL check for both or for none.

> 			if (!ret)
> 				ret = -EIO;
> 			continue;
> 		}
> 		mymtds[i]->owner = THIS_MODULE;
> 
> 		ret = parse_mtd_partitions(mymtds[i], probes,
> 					   &parsed_parts[i], 0);
> 
> 		if (ret > 0)
> 			nr_parsed_parts[i] = ret;
> 	}
> 
> 	if (!mymtds[0] && !mymtds[1])
> 		return ret;
> 	
> 	for (i = 0; i < 2; i++) {

80 columns again...

> 		if (!mymtds[i]) {
> 			printk(KERN_WARNING "%s is absent. Skipping\n", mainstone_maps[i].name);
> 		} else if (nr_parsed_parts[i]) {
> 			add_mtd_partitions(mymtds[i], parsed_parts[i], nr_parsed_parts[i]);
> 		} else if (!i) {
> 			printk("Using static partitions on %s\n", mainstone_maps[i].name);
> 			add_mtd_partitions(mymtds[i], mainstone_partitions, ARRAY_SIZE(mainstone_partitions));
> 		} else {
> 			printk("Registering %s as whole device\n", mainstone_maps[i].name);
> 			add_mtd_device(mymtds[i]);
> 		}
> 	}
> 	return 0;
> }
> 
> static void __exit cleanup_mainstone(void)
> {
> 	int i;
> 	for (i = 0; i < 2; i++) {
> 		if (!mymtds[i])
> 			continue;
> 
> 		if (nr_parsed_parts[i] || !i)
> 			del_mtd_partitions(mymtds[i]);
> 		else
> 			del_mtd_device(mymtds[i]);			

Trailing whitespacs.

> 
> 		map_destroy(mymtds[i]);
> 		iounmap((void *)mainstone_maps[i].virt);
> 		if (mainstone_maps[i].cached)
> 			iounmap(mainstone_maps[i].cached);
> 
> 		if (parsed_parts[i])
> 			kfree(parsed_parts[i]);

kfree() can be called unconditionally.

> 	}
> }
> 
> module_init(init_mainstone);
> module_exit(cleanup_mainstone);
> 
> MODULE_LICENSE("GPL");
> MODULE_AUTHOR("Nicolas Pitre <nico@cam.org>");
> MODULE_DESCRIPTION("MTD map driver for Intel Mainstone");
> 
> Index: Kconfig
> ===================================================================
> RCS file: /home/cvs/mtd/drivers/mtd/maps/Kconfig,v
> retrieving revision 1.53
> retrieving revision 1.54
> diff -u -r1.53 -r1.54
> --- Kconfig	29 Jun 2005 09:29:43 -0000	1.53
> +++ Kconfig	30 Jun 2005 22:41:36 -0000	1.54
> @@ -215,6 +215,14 @@
>  	  This provides a driver for the on-board flash of the Intel
>  	  'Lubbock' XScale evaluation board.
>  
> +config MTD_MAINSTONE
> +	tristate "CFI Flash device mapped on Intel Mainstone XScale eval board"
> +	depends on MACH_MAINSTONE && MTD_CFI_INTELEXT
> +	select MTD_PARTITIONS
> +	help
> +	  This provides a driver for the on-board flash of the Intel
> +	  'Mainstone PXA27x evaluation board.
> +
>  config MTD_OCTAGON
>  	tristate "JEDEC Flash device mapped on Octagon 5066 SBC"
>  	depends on X86 && MTD_JEDEC && MTD_COMPLEX_MAPPINGS
> 
> Index: Makefile.common
> ===================================================================
> RCS file: /home/cvs/mtd/drivers/mtd/maps/Makefile.common,v
> retrieving revision 1.28
> retrieving revision 1.29
> diff -u -r1.28 -r1.29
> --- Makefile.common	17 Mar 2005 14:16:13 -0000	1.28
> +++ Makefile.common	30 Jun 2005 22:41:36 -0000	1.29
> @@ -22,6 +22,7 @@
>  obj-$(CONFIG_MTD_ICHXROM)	+= ichxrom.o
>  obj-$(CONFIG_MTD_TSUNAMI)	+= tsunami_flash.o
>  obj-$(CONFIG_MTD_LUBBOCK)	+= lubbock-flash.o
> +obj-$(CONFIG_MTD_MAINSTONE)	+= mainstone-flash.o
>  obj-$(CONFIG_MTD_MBX860)	+= mbx860.o
>  obj-$(CONFIG_MTD_CEIVA)		+= ceiva.o
>  obj-$(CONFIG_MTD_OCTAGON)	+= octagon-5066.o
> 
> 
> __________________________________________________________
> Linux-MTD CVS commit list
> http://lists.infradead.org/mailman/listinfo/linux-mtd-cvs/

Jörn

-- 
Premature optimization is the root of all evil.
-- Donald Knuth
