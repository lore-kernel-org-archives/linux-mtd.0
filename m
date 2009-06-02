Received: from aeryn.fluff.org.uk ([87.194.8.8] helo=kira.home.fluff.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MBcwP-0003SU-4g
	for linux-mtd@lists.infradead.org; Tue, 02 Jun 2009 22:58:51 +0000
Date: Tue, 2 Jun 2009 23:58:27 +0100
From: Ben Dooks <ben-linux@fluff.org>
To: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [PATCH] mtd/maps: gpio-addr-flash: new driver for GPIO
	assisted flash addressing
Message-ID: <20090602225827.GC26220@fluff.org.uk>
References: <1243915650-29628-1-git-send-email-vapier@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1243915650-29628-1-git-send-email-vapier@gentoo.org>
Cc: uclinux-dist-devel@blackfin.uclinux.org, Bryan Wu <cooloney@kernel.org>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jun 02, 2009 at 12:07:30AM -0400, Mike Frysinger wrote:
> This driver lets people use GPIO's for additional address lines in case
> their processor does not have enough address lines already.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> Signed-off-by: Bryan Wu <cooloney@kernel.org>
> ---
>  drivers/mtd/maps/Kconfig           |   10 ++
>  drivers/mtd/maps/Makefile          |    1 +
>  drivers/mtd/maps/gpio-addr-flash.c |  220 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 231 insertions(+), 0 deletions(-)
>  create mode 100644 drivers/mtd/maps/gpio-addr-flash.c
> 
> diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
> index 82923bd..05f6c08 100644
> --- a/drivers/mtd/maps/Kconfig
> +++ b/drivers/mtd/maps/Kconfig
> @@ -500,6 +500,16 @@ config MTD_BFIN_ASYNC
>  
>  	  If compiled as a module, it will be called bfin-async-flash.
>  
> +config MTD_GPIO_ADDR
> +	tristate "GPIO-assisted Flash Chip Support"
> +	depends on MTD_COMPLEX_MAPPINGS
> +	select MTD_PARTITIONS
> +	help
> +	  Map driver which allows flashes to be partially physically addressed
> +	  and assisted by GPIOs.
> +
> +	  If compiled as a module, it will be called gpio-addr-flash.
> +
>  config MTD_UCLINUX
>  	tristate "Generic uClinux RAM/ROM filesystem support"
>  	depends on MTD_PARTITIONS && MTD_RAM && !MMU
> diff --git a/drivers/mtd/maps/Makefile b/drivers/mtd/maps/Makefile
> index 2dbc1be..d9cbd8a 100644
> --- a/drivers/mtd/maps/Makefile
> +++ b/drivers/mtd/maps/Makefile
> @@ -62,3 +62,4 @@ obj-$(CONFIG_MTD_INTEL_VR_NOR)	+= intel_vr_nor.o
>  obj-$(CONFIG_MTD_BFIN_ASYNC)	+= bfin-async-flash.o
>  obj-$(CONFIG_MTD_RBTX4939)	+= rbtx4939-flash.o
>  obj-$(CONFIG_MTD_VMU)		+= vmu-flash.o
> +obj-$(CONFIG_MTD_GPIO_ADDR)	+= gpio-addr-flash.o
> diff --git a/drivers/mtd/maps/gpio-addr-flash.c b/drivers/mtd/maps/gpio-addr-flash.c
> new file mode 100644
> index 0000000..524131d
> --- /dev/null
> +++ b/drivers/mtd/maps/gpio-addr-flash.c
> @@ -0,0 +1,220 @@
> +/*
> + * drivers/mtd/maps/gpio-addr-flash.c
> + *
> + * Handle the case where a flash device is mostly addressed using physical
> + * line and supplemented by GPIOs.  This way you can hook up say a 8meg flash
> + * to a 2meg memory range and use the GPIOs to select a particular range.
> + *
> + * Copyright 2000 Nicolas Pitre <nico@cam.org>
> + * Copyright 2005-2008 Analog Devices Inc.
> + *
> + * Enter bugs at http://blackfin.uclinux.org/
> + *
> + * Licensed under the GPL-2 or later.
> + */
> +
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/map.h>
> +#include <linux/mtd/partitions.h>
> +#include <linux/mtd/physmap.h>
> +#include <linux/platform_device.h>
> +#include <linux/types.h>
> +
> +#include <asm/gpio.h>
> +#include <asm/io.h>
> +
> +#define pr_devinit(fmt, args...) ({ static const __devinitconst char __fmt[] = fmt; printk(__fmt, ## args); })

?? why

> +#define DRIVER_NAME "gpio-addr-flash"
> +
> +struct async_state {
> +	struct mtd_info *mtd;
> +	struct map_info map;
> +	size_t gpio_count;
> +	unsigned *gpio_addrs;
> +	int *gpio_values;
> +	unsigned long win_size;
> +};

no kerneldoc for this?

> +
> +static void gf_set_gpios(struct async_state *state, unsigned long ofs)
> +{
> +	size_t i;
> +	int value;
> +	for (i = 0; i < state->gpio_count; ++i) {
> +		value = !!((ofs / state->win_size) & (1 << i));
> +		if (state->gpio_values[i] != value) {
> +			gpio_set_value(state->gpio_addrs[i], value);
> +			state->gpio_values[i] = value;
> +		}
> +	}
> +}
> +
> +static map_word gf_read(struct map_info *map, unsigned long ofs)
> +{
> +	struct async_state *state = (struct async_state *)map->map_priv_1;
> +	u16 word;
> +	map_word test;
> +
> +	gf_set_gpios(state, ofs);
> +
> +	word = readw(map->virt + (ofs % state->win_size));
> +	test.x[0] = word;
> +	return test;
> +}
> +
> +static void gf_copy_from(struct map_info *map, void *to, unsigned long from, ssize_t len)
> +{
> +	struct async_state *state = (struct async_state *)map->map_priv_1;
> +
> +	gf_set_gpios(state, from);
> +
> +	/* BUG if operation crosss the win_size */
> +	BUG_ON(!((from + len) % state->win_size <= (from + len)));
> +
> +	/* operation does not cross the win_size, so one shot it */
> +	memcpy_fromio(to, map->virt + (from % state->win_size), len);
> +}
> +
> +static void gf_write(struct map_info *map, map_word d1, unsigned long ofs)
> +{
> +	struct async_state *state = (struct async_state *)map->map_priv_1;
> +	u16 d;
> +
> +	gf_set_gpios(state, ofs);
> +
> +	d = d1.x[0];
> +	writew(d, map->virt + (ofs % state->win_size));
> +}
> +
> +static void gf_copy_to(struct map_info *map, unsigned long to, const void *from, ssize_t len)
> +{
> +	struct async_state *state = (struct async_state *)map->map_priv_1;
> +
> +	gf_set_gpios(state, to);
> +
> +	/* BUG if operation crosss the win_size */
> +	BUG_ON(!((to + len) % state->win_size <= (to + len)));
> +
> +	/* operation does not cross the win_size, so one shot it */
> +	memcpy_toio(map->virt + (to % state->win_size), from, len);
> +}
> +
> +#ifdef CONFIG_MTD_PARTITIONS
> +static const char *part_probe_types[] = { "cmdlinepart", "RedBoot", NULL };
> +#endif
> +
> +static int __devinit gpio_flash_probe(struct platform_device *pdev)
> +{
> +	int ret;
> +	size_t i;
> +	struct physmap_flash_data *pdata = pdev->dev.platform_data;
> +	struct resource *memory = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	struct resource *gpios = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> +	struct async_state *state;

both memory and gpios wrap, please put the platform_get_resource()
onto their own lines.

	gpios = platform_get_resource(pdev, IORESOURCE_IRQ, 0);

nope, not irqs. maybe someone should propose IORESOURCE_GPIO.

> +	state = kzalloc(sizeof(*state) + (sizeof(int) * gpios->end * 2), GFP_KERNEL);

hmm, why not keep the pointer to the resource you just got instead?

> +	if (!state)
> +		return -ENOMEM;
> +
> +	state->gpio_count     = gpios->end;
> +	state->gpio_addrs     = (void *)(state + 1);
> +	state->gpio_values    = state->gpio_addrs + state->gpio_count;
> +	state->win_size       = memory->end - memory->start + 1;
> +	memcpy(state->gpio_addrs, (void *)gpios->start, sizeof(unsigned) * state->gpio_count);
> +	for (i = 0; i < state->gpio_count; ++i)
> +		state->gpio_values[i] = -1;
> +
> +	state->map.name       = DRIVER_NAME;
> +	state->map.read       = gf_read;
> +	state->map.copy_from  = gf_copy_from;
> +	state->map.write      = gf_write;
> +	state->map.copy_to    = gf_copy_to;
> +	state->map.bankwidth  = pdata->width;
> +	state->map.size       = state->win_size * (1 << state->gpio_count);
> +	state->map.virt       = (void __iomem *)memory->start;
> +	state->map.phys       = NO_XIP;
> +	state->map.map_priv_1 = (unsigned long)state;
> +
> +	platform_set_drvdata(pdev, state);
> +
> +	for (i = 0; i < state->gpio_count; ++i) {
> +		if (gpio_request(state->gpio_addrs[i], DRIVER_NAME)) {
> +			pr_devinit(KERN_ERR DRIVER_NAME ": Failed to request gpio %d\n", state->gpio_addrs[i]);
> +			while (i--)
> +				gpio_free(state->gpio_addrs[i]);
> +			kfree(state);
> +			return -EBUSY;
> +		}
> +		gpio_direction_output(state->gpio_addrs[i], 0);
> +	}
> +
> +	pr_devinit(KERN_NOTICE DRIVER_NAME ": probing %d-bit flash bus\n", state->map.bankwidth * 8);
> +	state->mtd = do_map_probe(memory->name, &state->map);
> +	if (!state->mtd) {
> +		for (i = 0; i < state->gpio_count; ++i)
> +			gpio_free(state->gpio_addrs[i]);
> +		kfree(state);
> +		return -ENXIO;
> +	}
> +
> +#ifdef CONFIG_MTD_PARTITIONS
> +	ret = parse_mtd_partitions(state->mtd, part_probe_types, &pdata->parts, 0);
> +	if (ret > 0) {
> +		pr_devinit(KERN_NOTICE DRIVER_NAME ": Using commandline partition definition\n");
> +		add_mtd_partitions(state->mtd, pdata->parts, ret);
> +		kfree(pdata->parts);
> +
> +	} else if (pdata->nr_parts) {
> +		pr_devinit(KERN_NOTICE DRIVER_NAME ": Using board partition definition\n");
> +		add_mtd_partitions(state->mtd, pdata->parts, pdata->nr_parts);
> +
> +	} else
> +#endif
> +	{
> +		pr_devinit(KERN_NOTICE DRIVER_NAME ": no partition info available, registering whole flash at once\n");
> +		add_mtd_device(state->mtd);
> +	}
> +
> +	return 0;
> +}
> +
> +static int __devexit gpio_flash_remove(struct platform_device *pdev)
> +{
> +	struct async_state *state = platform_get_drvdata(pdev);
> +	size_t i;
> +	for (i = 0; i < state->gpio_count; ++i)
> +		gpio_free(state->gpio_addrs[i]);
> +#ifdef CONFIG_MTD_PARTITIONS
> +	del_mtd_partitions(state->mtd);
> +#endif
> +	map_destroy(state->mtd);
> +	kfree(state);
> +	return 0;
> +}
> +
> +static struct platform_driver gpio_flash_driver = {
> +	.probe		= gpio_flash_probe,
> +	.remove		= __devexit_p(gpio_flash_remove),
> +	.driver		= {
> +		.name	= DRIVER_NAME,
> +	},
> +};
> +
> +static int __init gpio_flash_init(void)
> +{
> +	return platform_driver_register(&gpio_flash_driver);
> +}
> +module_init(gpio_flash_init);
> +
> +static void __exit gpio_flash_exit(void)
> +{
> +	platform_driver_unregister(&gpio_flash_driver);
> +}
> +module_exit(gpio_flash_exit);
> +
> +MODULE_AUTHOR("Mike Frysinger <vapier@gentoo.org>");
> +MODULE_DESCRIPTION("MTD map driver for flashes addressed physically and with gpios");
> +MODULE_LICENSE("GPL");
> -- 
> 1.6.3.1
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
