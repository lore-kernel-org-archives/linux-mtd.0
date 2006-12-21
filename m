Received: from [63.81.120.155] (helo=imap.sh.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1GxR6m-00065R-8W
	for linux-mtd@lists.infradead.org; Thu, 21 Dec 2006 11:49:31 -0500
Message-ID: <458ABB09.3080007@ru.mvista.com>
Date: Thu, 21 Dec 2006 19:49:13 +0300
From: Sergei Shtylyov <sshtylyov@ru.mvista.com>
MIME-Version: 1.0
To: Vitaly Wool <vwool@ru.mvista.com>
Subject: Re: [PATCH] of_device-based physmap driver
References: <457698CD.9070702@ru.mvista.com>
In-Reply-To: <457698CD.9070702@ru.mvista.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

Vitaly Wool wrote:

    I have some doubts concerning the code both this and the original physmap 
driver...

> Index: powerpc/drivers/mtd/maps/physmap_of.c
> ===================================================================
> --- /dev/null	1970-01-01 00:00:00.000000000 +0000
> +++ powerpc/drivers/mtd/maps/physmap_of.c	2006-12-05 16:00:57.000000000 +0300
> @@ -0,0 +1,255 @@
> +/*
> + * Normal mappings of chips in physical memory for OF devices
> + *
> + * Copyright (C) 2006 MontaVista Software Inc.
> + * Author: Vitaly Wool <vwool@ru.mvista.com>
> + *
> + * This program is free software; you can redistribute  it and/or modify it
> + * under  the terms of  the GNU General  Public License as published by the
> + * Free Software Foundation;  either version 2 of the  License, or (at your
> + * option) any later version.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/types.h>
> +#include <linux/kernel.h>
> +#include <linux/init.h>
> +#include <linux/slab.h>
> +#include <linux/device.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/map.h>
> +#include <linux/mtd/partitions.h>
> +#include <linux/mtd/physmap.h>
> +#include <asm/io.h>
> +#include <asm/prom.h>
> +#include <asm/of_device.h>
> +#include <asm/of_platform.h>
> +
> +struct physmap_flash_info {
> +	struct mtd_info		*mtd;
> +	struct map_info		map;
> +	struct resource		*res;
> +#ifdef CONFIG_MTD_PARTITIONS
> +	int			nr_parts;
> +	struct mtd_partition	*parts;
> +#endif
> +};
> +
> +static const char *rom_probe_types[] = { "cfi_probe", "jedec_probe", "map_rom", NULL };
> +#ifdef CONFIG_MTD_PARTITIONS
> +static const char *part_probe_types[] = { "cmdlinepart", "RedBoot", NULL };
> +#endif
> +
> +#ifdef CONFIG_MTD_PARTITIONS
> +static int parse_flash_partitions(struct device_node *node,
> +		struct mtd_partition **parts)
> +{
> +	int i, plen, retval = -ENOMEM;
> +	const  u32  *part;
> +	const  char *name;
> +
> +	part = get_property(node, "partitions", &plen);
> +	if (part == NULL)
> +		goto err;
> +
> +	retval = plen / (2 * sizeof(u32));
> +	*parts = kzalloc(retval * sizeof(struct mtd_partition), GFP_KERNEL);
> +	if (*parts == NULL) {
> +		printk(KERN_ERR "Can't allocate the flash partition data!\n");
> +		goto err;
> +	}
> +
> +	name = get_property(node, "partition-names", &plen);
> +
> +	for (i = 0; i < retval; i++) {
> +		(*parts)[i].offset = *part++;
> +		(*parts)[i].size   = *part & ~1;
> +		if (*part++ & 1) /* bit 0 set signifies read only partition */
> +			(*parts)[i].mask_flags = MTD_WRITEABLE;
> +
> +		if (name != NULL && plen > 0) {
> +			int len = strlen(name) + 1;
> +
> +			(*parts)[i].name = (char *)name;
> +			plen -= len;
> +			name += len;
> +		} else
> +			(*parts)[i].name = "unnamed";
> +	}
> +err:
> +	return retval;
> +}
> +#endif

    Well, the above should be in a separate module...

> +static int of_physmap_remove(struct of_device *dev)
> +{
> +	struct physmap_flash_info *info;
> +
> +	info = dev_get_drvdata(&dev->dev);
> +	if (info == NULL)
> +		return 0;
> +	dev_set_drvdata(&dev->dev, NULL);
> +
> +	if (info->mtd != NULL) {
> +#ifdef CONFIG_MTD_PARTITIONS
> +		if (info->nr_parts) {
> +			del_mtd_partitions(info->mtd);
> +			kfree(info->parts);
> +		} else {
> +			del_mtd_device(info->mtd);

    Looks like this is also called if the partition info was supplied by an 
external parser (e.g. command line). The original physmap driver seems to 
behave the same way -- there's a check for info->nr_parts there as well but 
this field *never* gets set there...

> +		}
> +#else
> +		del_mtd_device(info->mtd);
> +#endif
> +		map_destroy(info->mtd);
> +	}

> +static int __devinit of_physmap_probe(struct of_device *dev, const struct of_device_id *match)
> +{

[...]

> +
> +#ifdef CONFIG_MTD_PARTITIONS
> +	err = parse_mtd_partitions(info->mtd, part_probe_types, &info->parts, 0);
> +	if (err > 0) {
> +		add_mtd_partitions(info->mtd, info->parts, err);

    The info->nr_parts not set here, hence del_mtd_partitions() not called.
The original physmap driver behaves the same way, I wonder if this was 
intentional...

> +	} else if ((err = parse_flash_partitions(dp, &info->parts)) > 0) {
> +		dev_info(&dev->dev, "Using OF partition information\n");
> +		add_mtd_partitions(info->mtd, info->parts, err);
> +		info->nr_parts = err;
> +	} else
> +#endif
> +
> +	add_mtd_device(info->mtd);
> +	return 0;
> +
> +err_out:
> +	of_physmap_remove(dev);
> +	return err;
> +
> +	return 0;
> +}

WBR, Sergei
