Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MqJmb-0003RK-2j
	for linux-mtd@lists.infradead.org; Wed, 23 Sep 2009 04:48:53 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH v3] mtd/maps: gpio-addr-flash: new driver for GPIO assisted
	flash addressing
Date: Wed, 23 Sep 2009 00:48:41 -0400
Message-Id: <1253681321-24600-1-git-send-email-vapier@gentoo.org>
In-Reply-To: <1244033509-31586-1-git-send-email-vapier@gentoo.org>
References: <1244033509-31586-1-git-send-email-vapier@gentoo.org>
Cc: uclinux-dist-devel@blackfin.uclinux.org, Bryan Wu <cooloney@kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This driver lets people use GPIO's for additional address lines in case
their processor does not have enough address lines already.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
Signed-off-by: Bryan Wu <cooloney@kernel.org>
---
v3
	- rebase onto latest mainline
	- add missing GPIO dependency pointed out by David
	- switch to linux/*.h includes rather than asm/*.h includes

 drivers/mtd/maps/Kconfig           |   11 ++
 drivers/mtd/maps/Makefile          |    3 +-
 drivers/mtd/maps/gpio-addr-flash.c |  310 ++++++++++++++++++++++++++++++++++++
 3 files changed, 322 insertions(+), 2 deletions(-)
 create mode 100644 drivers/mtd/maps/gpio-addr-flash.c

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index 0f314eb..0fc67a2 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -484,6 +484,17 @@ config MTD_BFIN_ASYNC
 
 	  If compiled as a module, it will be called bfin-async-flash.
 
+config MTD_GPIO_ADDR
+	tristate "GPIO-assisted Flash Chip Support"
+	depends on GENERIC_GPIO || GPIOLIB
+	depends on MTD_COMPLEX_MAPPINGS
+	select MTD_PARTITIONS
+	help
+	  Map driver which allows flashes to be partially physically addressed
+	  and assisted by GPIOs.
+
+	  If compiled as a module, it will be called gpio-addr-flash.
+
 config MTD_UCLINUX
 	bool "Generic uClinux RAM/ROM filesystem support"
 	depends on MTD_PARTITIONS && MTD_RAM=y && !MMU
diff --git a/drivers/mtd/maps/Makefile b/drivers/mtd/maps/Makefile
index 5beb066..1d5cf86 100644
--- a/drivers/mtd/maps/Makefile
+++ b/drivers/mtd/maps/Makefile
@@ -58,5 +58,4 @@ obj-$(CONFIG_MTD_PLATRAM)	+= plat-ram.o
 obj-$(CONFIG_MTD_OMAP_NOR)	+= omap_nor.o
 obj-$(CONFIG_MTD_INTEL_VR_NOR)	+= intel_vr_nor.o
 obj-$(CONFIG_MTD_BFIN_ASYNC)	+= bfin-async-flash.o
-obj-$(CONFIG_MTD_RBTX4939)	+= rbtx4939-flash.o
-obj-$(CONFIG_MTD_VMU)		+= vmu-flash.o
+obj-$(CONFIG_MTD_GPIO_ADDR)	+= gpio-addr-flash.o
diff --git a/drivers/mtd/maps/gpio-addr-flash.c b/drivers/mtd/maps/gpio-addr-flash.c
new file mode 100644
index 0000000..844a7a5
--- /dev/null
+++ b/drivers/mtd/maps/gpio-addr-flash.c
@@ -0,0 +1,310 @@
+/*
+ * drivers/mtd/maps/gpio-addr-flash.c
+ *
+ * Handle the case where a flash device is mostly addressed using physical
+ * line and supplemented by GPIOs.  This way you can hook up say a 8meg flash
+ * to a 2meg memory range and use the GPIOs to select a particular range.
+ *
+ * Copyright 2000 Nicolas Pitre <nico@cam.org>
+ * Copyright 2005-2009 Analog Devices Inc.
+ *
+ * Enter bugs at http://blackfin.uclinux.org/
+ *
+ * Licensed under the GPL-2 or later.
+ */
+
+#include <linux/gpio.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/map.h>
+#include <linux/mtd/partitions.h>
+#include <linux/mtd/physmap.h>
+#include <linux/platform_device.h>
+#include <linux/types.h>
+
+#define pr_devinit(fmt, args...) ({ static const __devinitconst char __fmt[] = fmt; printk(__fmt, ## args); })
+
+#define DRIVER_NAME "gpio-addr-flash"
+#define PFX DRIVER_NAME ": "
+
+/**
+ * struct async_state - keep GPIO flash state
+ *	@mtd:         MTD state for this mapping
+ *	@map:         MTD map state for this flash
+ *	@gpio_count:  number of GPIOs used to address
+ *	@gpio_addrs:  array of GPIOs to twiddle
+ *	@gpio_values: cached GPIO values
+ *	@win_size:    dedicated memory size (if no GPIOs)
+ */
+struct async_state {
+	struct mtd_info *mtd;
+	struct map_info map;
+	size_t gpio_count;
+	unsigned *gpio_addrs;
+	int *gpio_values;
+	unsigned long win_size;
+};
+#define gf_map_info_to_state(mi) ((struct async_state *)(mi)->map_priv_1)
+
+/**
+ * gf_set_gpios() - set GPIO address lines to access specified flash offset
+ *	@state: GPIO flash state
+ *	@ofs:   desired offset to access
+ *
+ * Rather than call the GPIO framework every time, cache the last-programmed
+ * value.  This speeds up sequential accesses (which are by far the most common
+ * type).  We rely on the GPIO framework to treat non-zero value as high so
+ * that we don't have to normalize the bits.
+ */
+static void gf_set_gpios(struct async_state *state, unsigned long ofs)
+{
+	size_t i = 0;
+	int value;
+	ofs /= state->win_size;
+	do {
+		value = ofs & (1 << i);
+		if (state->gpio_values[i] != value) {
+			gpio_set_value(state->gpio_addrs[i], value);
+			state->gpio_values[i] = value;
+		}
+	} while (++i < state->gpio_count);
+}
+
+/**
+ * gf_read() - read a word at the specified offset
+ *	@map: MTD map state
+ *	@ofs: desired offset to read
+ */
+static map_word gf_read(struct map_info *map, unsigned long ofs)
+{
+	struct async_state *state = gf_map_info_to_state(map);
+	u16 word;
+	map_word test;
+
+	gf_set_gpios(state, ofs);
+
+	word = readw(map->virt + (ofs % state->win_size));
+	test.x[0] = word;
+	return test;
+}
+
+/**
+ * gf_copy_from() - copy a chunk of data from the flash
+ *	@map:  MTD map state
+ *	@to:   memory to copy to
+ *	@from: flash offset to copy from
+ *	@len:  how much to copy
+ *
+ * We rely on the MTD layer to chunk up copies such that a single request here
+ * will not cross a window size.  This allows us to only wiggle the GPIOs once
+ * before falling back to a normal memcpy.  Reading the higher layer code shows
+ * that this is indeed the case, but add a BUG_ON() to future proof.
+ */
+static void gf_copy_from(struct map_info *map, void *to, unsigned long from, ssize_t len)
+{
+	struct async_state *state = gf_map_info_to_state(map);
+
+	gf_set_gpios(state, from);
+
+	/* BUG if operation crosses the win_size */
+	BUG_ON(!((from + len) % state->win_size <= (from + len)));
+
+	/* operation does not cross the win_size, so one shot it */
+	memcpy_fromio(to, map->virt + (from % state->win_size), len);
+}
+
+/**
+ * gf_write() - write a word at the specified offset
+ *	@map: MTD map state
+ *	@ofs: desired offset to write
+ */
+static void gf_write(struct map_info *map, map_word d1, unsigned long ofs)
+{
+	struct async_state *state = gf_map_info_to_state(map);
+	u16 d;
+
+	gf_set_gpios(state, ofs);
+
+	d = d1.x[0];
+	writew(d, map->virt + (ofs % state->win_size));
+}
+
+/**
+ * gf_copy_to() - copy a chunk of data to the flash
+ *	@map:  MTD map state
+ *	@to:   flash offset to copy to
+ *	@from: memory to copy from
+ *	@len:  how much to copy
+ *
+ * See gf_copy_from() caveat.
+ */
+static void gf_copy_to(struct map_info *map, unsigned long to, const void *from, ssize_t len)
+{
+	struct async_state *state = gf_map_info_to_state(map);
+
+	gf_set_gpios(state, to);
+
+	/* BUG if operation crosses the win_size */
+	BUG_ON(!((to + len) % state->win_size <= (to + len)));
+
+	/* operation does not cross the win_size, so one shot it */
+	memcpy_toio(map->virt + (to % state->win_size), from, len);
+}
+
+#ifdef CONFIG_MTD_PARTITIONS
+static const char *part_probe_types[] = { "cmdlinepart", "RedBoot", NULL };
+#endif
+
+/**
+ * gpio_flash_probe() - setup a mapping for a GPIO assisted flash
+ *	@pdev: platform device
+ *
+ * The platform resource layout expected looks something like:
+ * struct mtd_partition partitions[] = { ... };
+ * struct physmap_flash_data flash_data = { ... };
+ * unsigned flash_gpios[] = { GPIO_XX, GPIO_XX, ... };
+ * struct resource flash_resource[] = {
+ *	{
+ *		.name  = "cfi_probe",
+ *		.start = 0x20000000,
+ *		.end   = 0x201fffff,
+ *		.flags = IORESOURCE_MEM,
+ *	}, {
+ *		.start = (unsigned long)flash_gpios,
+ *		.end   = ARRAY_SIZE(flash_gpios),
+ *		.flags = IORESOURCE_IRQ,
+ *	}
+ * };
+ * struct platform_device flash_device = {
+ *	.name          = "gpio-addr-flash",
+ *	.dev           = { .platform_data = &flash_data, },
+ *	.num_resources = ARRAY_SIZE(flash_resource),
+ *	.resource      = flash_resource,
+ *	...
+ * };
+ */
+static int __devinit gpio_flash_probe(struct platform_device *pdev)
+{
+	int ret;
+	size_t i, arr_size;
+	struct physmap_flash_data *pdata;
+	struct resource *memory;
+	struct resource *gpios;
+	struct async_state *state;
+
+	pdata = pdev->dev.platform_data;
+	memory = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	gpios = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
+
+	if (!memory || !gpios || !gpios->end)
+		return -EINVAL;
+
+	arr_size = sizeof(int) * gpios->end;
+	state = kzalloc(sizeof(*state) + arr_size, GFP_KERNEL);
+	if (!state)
+		return -ENOMEM;
+
+	state->gpio_count     = gpios->end;
+	state->gpio_addrs     = (void *)gpios->start;
+	state->gpio_values    = (void *)(state + 1);
+	state->win_size       = memory->end - memory->start + 1;
+	memset(state->gpio_values, 0xff, arr_size);
+
+	state->map.name       = DRIVER_NAME;
+	state->map.read       = gf_read;
+	state->map.copy_from  = gf_copy_from;
+	state->map.write      = gf_write;
+	state->map.copy_to    = gf_copy_to;
+	state->map.bankwidth  = pdata->width;
+	state->map.size       = state->win_size * (1 << state->gpio_count);
+	state->map.virt       = (void __iomem *)memory->start;
+	state->map.phys       = NO_XIP;
+	state->map.map_priv_1 = (unsigned long)state;
+
+	platform_set_drvdata(pdev, state);
+
+	i = 0;
+	do {
+		if (gpio_request(state->gpio_addrs[i], DRIVER_NAME)) {
+			pr_devinit(KERN_ERR PFX "failed to request gpio %d\n",
+				state->gpio_addrs[i]);
+			while (i--)
+				gpio_free(state->gpio_addrs[i]);
+			kfree(state);
+			return -EBUSY;
+		}
+		gpio_direction_output(state->gpio_addrs[i], 0);
+	} while (++i < state->gpio_count);
+
+	pr_devinit(KERN_NOTICE PFX "probing %d-bit flash bus\n",
+		state->map.bankwidth * 8);
+	state->mtd = do_map_probe(memory->name, &state->map);
+	if (!state->mtd) {
+		for (i = 0; i < state->gpio_count; ++i)
+			gpio_free(state->gpio_addrs[i]);
+		kfree(state);
+		return -ENXIO;
+	}
+
+#ifdef CONFIG_MTD_PARTITIONS
+	ret = parse_mtd_partitions(state->mtd, part_probe_types, &pdata->parts, 0);
+	if (ret > 0) {
+		pr_devinit(KERN_NOTICE PFX "Using commandline partition definition\n");
+		add_mtd_partitions(state->mtd, pdata->parts, ret);
+		kfree(pdata->parts);
+
+	} else if (pdata->nr_parts) {
+		pr_devinit(KERN_NOTICE PFX "Using board partition definition\n");
+		add_mtd_partitions(state->mtd, pdata->parts, pdata->nr_parts);
+
+	} else
+#endif
+	{
+		pr_devinit(KERN_NOTICE PFX "no partition info available, registering whole flash at once\n");
+		add_mtd_device(state->mtd);
+	}
+
+	return 0;
+}
+
+static int __devexit gpio_flash_remove(struct platform_device *pdev)
+{
+	struct async_state *state = platform_get_drvdata(pdev);
+	size_t i = 0;
+	do {
+		gpio_free(state->gpio_addrs[i]);
+	} while (++i < state->gpio_count);
+#ifdef CONFIG_MTD_PARTITIONS
+	del_mtd_partitions(state->mtd);
+#endif
+	map_destroy(state->mtd);
+	kfree(state);
+	return 0;
+}
+
+static struct platform_driver gpio_flash_driver = {
+	.probe		= gpio_flash_probe,
+	.remove		= __devexit_p(gpio_flash_remove),
+	.driver		= {
+		.name	= DRIVER_NAME,
+	},
+};
+
+static int __init gpio_flash_init(void)
+{
+	return platform_driver_register(&gpio_flash_driver);
+}
+module_init(gpio_flash_init);
+
+static void __exit gpio_flash_exit(void)
+{
+	platform_driver_unregister(&gpio_flash_driver);
+}
+module_exit(gpio_flash_exit);
+
+MODULE_AUTHOR("Mike Frysinger <vapier@gentoo.org>");
+MODULE_DESCRIPTION("MTD map driver for flashes addressed physically and with gpios");
+MODULE_LICENSE("GPL");
-- 
1.6.5.rc1
