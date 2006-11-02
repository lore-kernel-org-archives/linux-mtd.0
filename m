Received: from [63.81.120.155] (helo=imap.sh.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Gfhd5-0006Dw-Rc
	for linux-mtd@lists.infradead.org; Thu, 02 Nov 2006 13:49:37 -0500
Message-ID: <454A3DAA.5030901@ru.mvista.com>
Date: Thu, 02 Nov 2006 21:49:14 +0300
From: Sergei Shtylyov <sshtylyov@ru.mvista.com>
MIME-Version: 1.0
To: Vitaly Wool <vwool@ru.mvista.com>
Subject: Re: [PATCH/RFC] physmap for OF devices
References: <20061102140847.8417cdc3.vwool@ru.mvista.com>
In-Reply-To: <20061102140847.8417cdc3.vwool@ru.mvista.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Vitaly Wool wrote:
> Hi folks,
> 
> inlined below is the patch that adds support for OF physmap descriptions. It was inspired by Sergey Shtylyov's patch to powerpc tree which can be found at 
> http://patchwork.ozlabs.org/linuxppc/patch?id=6526 and uses the same description but implements a bit different concept. I. e. it doesn't try to pretend a platform device and use existing physmap driver but adds corresponding configurable physmap driver instead.
> 
>  drivers/mtd/maps/Kconfig      |    9 +
>  drivers/mtd/maps/Makefile     |    1
>  drivers/mtd/maps/physmap_of.c |  244 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 254 insertions(+)
> 
> Signed-off-by: Vitaly Wool <vwool@ru.mvista.com>
> 
> Index: linux-2.6.18/drivers/mtd/maps/physmap_of.c
> ===================================================================
> --- /dev/null
> +++ linux-2.6.18/drivers/mtd/maps/physmap_of.c
> @@ -0,0 +1,244 @@
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

    Well, these also could be passed in the node property.

> +#ifdef CONFIG_MTD_PARTITIONS
> +static const char *part_probe_types[] = { "cmdlinepart", "RedBoot", NULL };

    Not really sure if RedBoot is relevant in this case.

> +#endif
> +
> +#ifdef CONFIG_MTD_PARTITIONS
> +static int parse_flash_partitions(struct device_node *node,
> +		struct mtd_partition **parts)
> +{
> +	int i, plen, nr_parts = 0;
> +	const  u32  *part;
> +	const  char *name;
> +
> +	part = get_property(node, "partitions", &plen);
> +	if (part == NULL)
> +		goto err;
> +
> +	nr_parts = plen / (2 * sizeof(u32));
> +	*parts = kzalloc(nr_parts * sizeof(struct mtd_partition), GFP_KERNEL);
> +	if (*parts == NULL) {
> +		printk(KERN_ERR "Can't allocate the flash partition data!\n");
> +		nr_parts = 0;
> +		goto err;
> +	}
> +
> +	name = get_property(node, "partition-names", &plen);
> +
> +	for (i = 0; i < nr_parts; i++) {
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
> +	return nr_parts;
> +}
> +#endif

    Well, it's not quite correct to confine the partition parsing to only 
physmap driver, since it didn't pertain to only direct-mapped MTD by design. 
However, I've run into some troubles trying to fit that into the standard MTD 
paritition parser framework. May still be worth putting it into a separate 
module, though...

[...]

> +static int __devinit of_physmap_probe(struct of_device *dev, const struct of_device_id *match)
> +{
> +	struct device_node *dp = dev->node;
> +	struct resource res;
> +	struct physmap_flash_info *info;
> +	const char **probe_type;
> +	const u32 *width;
> +	int err;
> +
> +
> +	if (of_address_to_resource(dp, 0, &res)) {
> +		dev_err(&dev->dev, "Can't get the flash mapping!\n");
> +		err = -EINVAL;
> +		goto err_out;
> +	}
> +
> +       	dev_dbg(&dev->dev, "physmap flash device: %.8llx at %.8llx\n",
> +	    (unsigned long long)res.end - res.start + 1,
> +	    (unsigned long long)res.start);
> +
> +	info = kzalloc(sizeof(struct physmap_flash_info), GFP_KERNEL);
> +	if (info == NULL) {
> +		err = -ENOMEM;
> +		goto err_out;
> +	}
> +	memset(info, 0, sizeof(*info));
> +
> +	dev_set_drvdata(&dev->dev, up);
> +
> +	info->res = request_mem_region(res.start, res.end - res.start + 1,
> +			dev->dev.bus_id);

    Could also have just called request_resource(), incluing res into struct 
physmap_flash_info, I think...

> +	if (info->res == NULL) {
> +		dev_err(&dev->dev, "Could not reserve memory region\n");
> +		err = -ENOMEM;
> +		goto err_out;
> +	}
> +
> +	width = get_property(dp, "bank-width", NULL);
> +	if (width == NULL) {
> +		dev_err(&dev->dev, "Can't get the flash bank width!\n");
> +		err = -EINVAL;
> +		goto err_out;
> +	}
> +
> +	info->map.name = dev->dev.bus_id;
> +	info->map.phys = res.start;
> +	info->map.size = res.end - res.start + 1;
> +	info->map.bankwidth = *width;
> +
> +	info->map.virt = ioremap(info->map.phys, info->map.size);
> +	if (info->map.virt == NULL) {
> +		dev_err(&dev->dev, "Failed to ioremap flash region\n");
> +		err = EIO;
> +		goto err_out;
> +	}
> +
> +	simple_map_init(&info->map);
> +
> +	probe_type = rom_probe_types;
> +	for (; info->mtd == NULL && *probe_type != NULL; probe_type++)
> +		info->mtd = do_map_probe(*probe_type, &info->map);
> +	if (info->mtd == NULL) {
> +		dev_err(&dev->dev, "map_probe failed\n");
> +		err = -ENXIO;
> +		goto err_out;
> +	}
> +	info->mtd->owner = THIS_MODULE;
> +
> +#ifdef CONFIG_MTD_PARTITIONS
> +	err = parse_mtd_partitions(info->mtd, part_probe_types, &info->parts, 0);
> +	if (err > 0) {
> +		add_mtd_partitions(info->mtd, info->parts, err);
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
> +
> +
> +}
> +
> +static struct of_device_id of_physmap_match[] = {
> +	{
> +		.name = "flash",

    There's really no need to enforce the fixed name, when there's 
"device_type" property defined. Instead it should be:

		.device_name = "rom"

> +		.compatible = "physmap"

    Well, "direct-mapped" might have been a better choice...

> +	},
> +	{ },
> +};
> +
> +MODULE_DEVICE_TABLE(of, of_physmap_match);

    Erm, why this is needed?

WBR, Sergei
