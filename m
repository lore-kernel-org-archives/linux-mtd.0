Received: from gateway-1237.mvista.com ([12.44.186.158] helo=orion.mvista.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AEBx6-00079D-AR
	for <linux-mtd@lists.infradead.org>; Mon, 27 Oct 2003 18:18:52 +0000
Date: Mon, 27 Oct 2003 10:17:41 -0800
From: Jun Sun <jsun@mvista.com>
To: linux-mtd@lists.infradead.org
Message-ID: <20031027101741.C1678@mvista.com>
References: <20031022182558.U19834@mvista.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20031022182558.U19834@mvista.com>;
	from jsun@mvista.com on Wed, Oct 22, 2003 at 06:25:58PM -0700
Content-Type: text/plain; charset=us-ascii
Subject: Re: [PATCH] extend physmap.c to support run-time adding partitions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 22, 2003 at 06:25:58PM -0700, Jun Sun wrote:
> 
> While looking at drvers/mtd/maps directories, it becomes
> obvious to me that many files are derived from physmap.c,
> in order to add partition support or add their own
> set_vpp() pointer, etc..
> 
> Such a need can be easily satisfied by extending physmap.c
> a little.
> 
> In this patch, I like to introduce phsmap_add_partition()
> function, which allows boards to add flash partitions
> at run-time.  (Note that you can still override this
> hardcoded partition by using kernel command line)
> 
> In the patch I also showed how a board can make use of this
> extension.  Hopefully we can get rid of lots of files under 
> the maps directory. :)
> 
> Boards which need to set set_vpp pointer can do so easily
> too.
> 
> Any comments?
>

Any objections or comments?  David?

Jun
 

> diff -Nru linux/arch/mips/mips-boards/malta/malta_setup.c.orig linux/arch/mips/mips-boards/malta/malta_setup.c
> --- linux/arch/mips/mips-boards/malta/malta_setup.c.orig	Fri Aug  1 10:50:18 2003
> +++ linux/arch/mips/mips-boards/malta/malta_setup.c	Wed Oct 22 17:26:24 2003
> @@ -24,6 +24,7 @@
>  #ifdef CONFIG_BLK_DEV_IDE
>  #include <linux/ide.h>
>  #endif
> +#include <linux/mtd/physmap.h>
>  
>  #include <asm/cpu.h>
>  #include <asm/bootinfo.h>
> @@ -166,6 +167,12 @@
>          conswitchp = &dummy_con;
>  #endif
>  #endif
> +
> +#if defined(CONFIG_MTD_PHYSMAP) && defined(CONFIG_MTD_PARTITIONS)
> +	physmap_add_partition("YAMON", 0x100000, 0x0, MTD_WRITEABLE);
> +	physmap_add_partition("User FS", 0x300000, 0x100000, 0);
> +#endif
> +
>  	mips_reboot_setup();
>  
>  	board_time_init = mips_time_init;
> diff -Nru linux/drivers/mtd/maps/physmap.c.orig linux/drivers/mtd/maps/physmap.c
> --- linux/drivers/mtd/maps/physmap.c.orig	Wed Jul 23 15:17:52 2003
> +++ linux/drivers/mtd/maps/physmap.c	Wed Oct 22 17:42:50 2003
> @@ -2,6 +2,11 @@
>   * $Id: physmap.c,v 1.28 2003/05/28 15:53:43 dwmw2 Exp $
>   *
>   * Normal mappings of chips in physical memory
> + *
> + * Copyright (C) 2003 MontaVista Software Inc.
> + * Author: Jun Sun, jsun@mvista.com or jsun@junsun.net
> + *
> + * 031022 - [jsun] add physmap_add_partition()
>   */
>  
>  #include <linux/module.h>
> @@ -23,7 +28,7 @@
>  
>  
>  struct map_info physmap_map = {
> -	.name = "Physically mapped flash",
> +	.name = "phys_mapped_flash",
>  	.size = WINDOW_SIZE,
>  	.buswidth = BUSWIDTH,
>  	.phys = WINDOW_ADDR,
> @@ -33,35 +38,31 @@
>  static struct mtd_partition *mtd_parts;
>  static int                   mtd_parts_nb;
>  
> -static struct mtd_partition physmap_partitions[] = {
> -#if 0
> -/* Put your own partition definitions here */
> -	{
> -		.name =		"bootROM",
> -		.size =		0x80000,
> -		.offset =	0,
> -		.mask_flags =	MTD_WRITEABLE,  /* force read-only */
> -	}, {
> -		.name =		"zImage",
> -		.size =		0x100000,
> -		.offset =	MTDPART_OFS_APPEND,
> -		.mask_flags =	MTD_WRITEABLE,  /* force read-only */
> -	}, {
> -		.name =		"ramdisk.gz",
> -		.size =		0x300000,
> -		.offset =	MTDPART_OFS_APPEND,
> -		.mask_flags =	MTD_WRITEABLE,  /* force read-only */
> -	}, {
> -		.name =		"User FS",
> -		.size =		MTDPART_SIZ_FULL,
> -		.offset =	MTDPART_OFS_APPEND,
> +#define NUM_PARTITIONS	4	/* random num which should be good enough */
> +static struct mtd_partition physmap_partitions[NUM_PARTITIONS] __initdata = {};
> +
> +char *part_probes[] __initdata = {"cmdlinepart", "RedBoot", NULL};
> +
> +/*
> + * See include/linux/mtd/physmap.h file.
> + */
> +static int part_index __initdata = 0;
> +int __init physmap_add_partition(char *name, u32 size, u32 offset, u32 flags)
> +{
> +	if (part_index >= NUM_PARTITIONS) {
> +		printk(KERN_ERR "physmap_add_partition() exceeds max partition table size (%d)\n", NUM_PARTITIONS);
> +		return -1;
>  	}
> -#endif
> -};
>  
> -#define NUM_PARTITIONS	(sizeof(physmap_partitions)/sizeof(struct mtd_partition))
> -const char *part_probes[] = {"cmdlinepart", "RedBoot", NULL};
> +	physmap_partitions[part_index].name = name;
> +	physmap_partitions[part_index].size = size;
> +	physmap_partitions[part_index].offset = offset;
> +	physmap_partitions[part_index].mask_flags = flags;
> +
> +	part_index++;
>  
> +	return 0;
> +}
>  #endif /* CONFIG_MTD_PARTITIONS */
>  
>  int __init init_physmap(void)
> @@ -97,11 +98,11 @@
>  			return 0;
>  		}
>  
> -		if (NUM_PARTITIONS != 0) 
> +		if (part_index != 0) 
>  		{
>  			printk(KERN_NOTICE 
>  			       "Using physmap partition definition\n");
> -			add_mtd_partitions (mymtd, physmap_partitions, NUM_PARTITIONS);
> +			add_mtd_partitions (mymtd, physmap_partitions, part_index);
>  			return 0;
>  		}
>  
> diff -Nru linux/include/linux/mtd/physmap.h.orig linux/include/linux/mtd/physmap.h
> --- linux/include/linux/mtd/physmap.h.orig	Wed Oct 22 17:05:22 2003
> +++ linux/include/linux/mtd/physmap.h	Wed Oct 22 18:20:34 2003
> @@ -0,0 +1,48 @@
> +/*
> + * For boards with physically mapped flash and using 
> + * drivers/mtd/maps/physmap.c mapping driver.
> + *
> + * Copyright (C) 2003 MontaVista Software Inc.
> + * Author: Jun Sun, jsun@mvista.com or jsun@junsun.net
> + *
> + * This program is free software; you can redistribute  it and/or modify it
> + * under  the terms of  the GNU General  Public License as published by the
> + * Free Software Foundation;  either version 2 of the  License, or (at your
> + * option) any later version.
> + *
> + */
> +
> +#ifndef __LINUX_MTD_PHYSMAP__
> +
> +#include <linux/config.h>
> +
> +#if defined(CONFIG_MTD_PHYSMAP) 
> +
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/map.h>
> +
> +/*
> + * The map_info for physmap.  Board can override size, buswidth, phys,
> + * (*set_vpp)(), etc in their initial setup routine.
> + */
> +extern struct map_info physmap_map;
> +
> +#if defined(CONFIG_MTD_PARTITIONS)
> +
> +/*
> + * Machines that wish to do flash partition may want to call this function in 
> + * their setup routine.  Examples:
> + *
> + *	physmap_add_partition("bootROM", 0x100000, 0, MTD_WRITEABLE);
> + *	physmap_add_partition("User FS", 0x300000, 0x100000, 0)
> + *
> + * Note that one can always override this hard-coded partition with 
> + * command line partition (you need to enable CONFIG_MTD_CMDLINE_PARTS).
> + */
> +int physmap_add_partition(char *name, u32 size, u32 offset, u32 mask_flags);
> +
> +#endif /* defined(CONFIG_MTD_PARTITIONS) */
> +#endif /* defined(CONFIG_MTD) */
> +
> +#endif /* __LINUX_MTD_PHYSMAP__ */
> +
