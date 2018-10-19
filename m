Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDPXV-0003Sz-Fd
 for linux-mtd@lists.infradead.org; Fri, 19 Oct 2018 07:50:59 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org,
 Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 14/15] mtd: maps: Merge gpio-addr-flash.c into
 physmap-core.c
Date: Fri, 19 Oct 2018 09:49:07 +0200
Message-Id: <20181019074908.13226-15-boris.brezillon@bootlin.com>
In-Reply-To: <20181019074908.13226-1-boris.brezillon@bootlin.com>
References: <20181019074908.13226-1-boris.brezillon@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Controlling some MSB address lines using GPIOs is just a small
deviation from the generic physmap logic, and merging those two drivers
allows us to share most of the probe logic, which is a good thing.

Also, the gpio-addr-flash driver is unused since the removal of
the blackfin arch in v4.17, so we can safely remove the old driver
without risking breaking existing boards.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
Reviewed-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Tested-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
Changes in v2:
- Add Ricardo's R-b/T-b
---
 drivers/mtd/maps/Kconfig           |  19 ++-
 drivers/mtd/maps/Makefile          |   1 -
 drivers/mtd/maps/gpio-addr-flash.c | 281 -------------------------------------
 drivers/mtd/maps/physmap-core.c    | 150 +++++++++++++++++++-
 4 files changed, 157 insertions(+), 294 deletions(-)
 delete mode 100644 drivers/mtd/maps/gpio-addr-flash.c

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index bb0d64e3fcd6..93b7ae32e277 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -94,6 +94,15 @@ config MTD_PHYSMAP_GEMINI
 	  platforms, some detection and setting up parallel mode on the
 	  external interface.
 
+config MTD_PHYSMAP_GPIO_ADDR
+	bool "GPIO-assisted Flash Chip Support"
+	depends on MTD_PHYSMAP
+	depends on GPIOLIB || COMPILE_TEST
+	depends on MTD_COMPLEX_MAPPINGS
+	help
+	  Extend the physmap driver to allow flashes to be partially
+	  physically addressed and assisted by GPIOs.
+
 config MTD_PMC_MSP_EVM
 	tristate "CFI Flash device mapped on PMC-Sierra MSP"
 	depends on PMC_MSP && MTD_CFI
@@ -334,16 +343,6 @@ config MTD_PCMCIA_ANONYMOUS
 
 	  If unsure, say N.
 
-config MTD_GPIO_ADDR
-	tristate "GPIO-assisted Flash Chip Support"
-	depends on GPIOLIB || COMPILE_TEST
-	depends on MTD_COMPLEX_MAPPINGS
-	help
-	  Map driver which allows flashes to be partially physically addressed
-	  and assisted by GPIOs.
-
-	  If compiled as a module, it will be called gpio-addr-flash.
-
 config MTD_UCLINUX
 	bool "Generic uClinux RAM/ROM filesystem support"
 	depends on (MTD_RAM=y || MTD_ROM=y) && (!MMU || COLDFIRE)
diff --git a/drivers/mtd/maps/Makefile b/drivers/mtd/maps/Makefile
index ce737e15b7cf..ed1ef75244db 100644
--- a/drivers/mtd/maps/Makefile
+++ b/drivers/mtd/maps/Makefile
@@ -43,6 +43,5 @@ obj-$(CONFIG_MTD_PLATRAM)	+= plat-ram.o
 obj-$(CONFIG_MTD_INTEL_VR_NOR)	+= intel_vr_nor.o
 obj-$(CONFIG_MTD_RBTX4939)	+= rbtx4939-flash.o
 obj-$(CONFIG_MTD_VMU)		+= vmu-flash.o
-obj-$(CONFIG_MTD_GPIO_ADDR)	+= gpio-addr-flash.o
 obj-$(CONFIG_MTD_LATCH_ADDR)	+= latch-addr-flash.o
 obj-$(CONFIG_MTD_LANTIQ)	+= lantiq-flash.o
diff --git a/drivers/mtd/maps/gpio-addr-flash.c b/drivers/mtd/maps/gpio-addr-flash.c
deleted file mode 100644
index a20e85aa770e..000000000000
--- a/drivers/mtd/maps/gpio-addr-flash.c
+++ /dev/null
@@ -1,281 +0,0 @@
-/*
- * drivers/mtd/maps/gpio-addr-flash.c
- *
- * Handle the case where a flash device is mostly addressed using physical
- * line and supplemented by GPIOs.  This way you can hook up say a 8MiB flash
- * to a 2MiB memory range and use the GPIOs to select a particular range.
- *
- * Copyright © 2000 Nicolas Pitre <nico@cam.org>
- * Copyright © 2005-2009 Analog Devices Inc.
- *
- * Enter bugs at http://blackfin.uclinux.org/
- *
- * Licensed under the GPL-2 or later.
- */
-
-#include <linux/gpio.h>
-#include <linux/gpio/consumer.h>
-#include <linux/io.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/mtd/mtd.h>
-#include <linux/mtd/map.h>
-#include <linux/mtd/partitions.h>
-#include <linux/mtd/physmap.h>
-#include <linux/platform_device.h>
-#include <linux/slab.h>
-#include <linux/types.h>
-
-#define win_mask(x) ((BIT(x)) - 1)
-
-#define DRIVER_NAME "gpio-addr-flash"
-
-/**
- * struct async_state - keep GPIO flash state
- *	@mtd:         MTD state for this mapping
- *	@map:         MTD map state for this flash
- *	@gpios:       Struct containing the array of GPIO descriptors
- *	@gpio_values: cached GPIO values
- *	@win_order:   dedicated memory size (if no GPIOs)
- */
-struct async_state {
-	struct mtd_info *mtd;
-	struct map_info map;
-	struct gpio_descs *gpios;
-	unsigned int gpio_values;
-	unsigned int win_order;
-};
-#define gf_map_info_to_state(mi) ((struct async_state *)(mi)->map_priv_1)
-
-/**
- * gf_set_gpios() - set GPIO address lines to access specified flash offset
- *	@state: GPIO flash state
- *	@ofs:   desired offset to access
- *
- * Rather than call the GPIO framework every time, cache the last-programmed
- * value.  This speeds up sequential accesses (which are by far the most common
- * type).
- */
-static void gf_set_gpios(struct async_state *state, unsigned long ofs)
-{
-	int i;
-
-	ofs >>= state->win_order;
-
-	if (ofs == state->gpio_values)
-		return;
-
-	for (i = 0; i < state->gpios->ndescs; i++) {
-		if ((ofs & BIT(i)) == (state->gpio_values & BIT(i)))
-			continue;
-
-		gpiod_set_value(state->gpios->desc[i], !!(ofs & BIT(i)));
-	}
-
-	state->gpio_values = ofs;
-}
-
-/**
- * gf_read() - read a word at the specified offset
- *	@map: MTD map state
- *	@ofs: desired offset to read
- */
-static map_word gf_read(struct map_info *map, unsigned long ofs)
-{
-	struct async_state *state = gf_map_info_to_state(map);
-	uint16_t word;
-	map_word test;
-
-	gf_set_gpios(state, ofs);
-
-	word = readw(map->virt + (ofs & win_mask(state->win_order)));
-	test.x[0] = word;
-	return test;
-}
-
-/**
- * gf_copy_from() - copy a chunk of data from the flash
- *	@map:  MTD map state
- *	@to:   memory to copy to
- *	@from: flash offset to copy from
- *	@len:  how much to copy
- *
- * The "from" region may straddle more than one window, so toggle the GPIOs for
- * each window region before reading its data.
- */
-static void gf_copy_from(struct map_info *map, void *to, unsigned long from, ssize_t len)
-{
-	struct async_state *state = gf_map_info_to_state(map);
-
-	int this_len;
-
-	while (len) {
-		this_len = from & win_mask(state->win_order);
-		this_len = BIT(state->win_order) - this_len;
-		this_len = min_t(int, len, this_len);
-
-		gf_set_gpios(state, from);
-		memcpy_fromio(to,
-			      map->virt + (from & win_mask(state->win_order)),
-			      this_len);
-		len -= this_len;
-		from += this_len;
-		to += this_len;
-	}
-}
-
-/**
- * gf_write() - write a word at the specified offset
- *	@map: MTD map state
- *	@ofs: desired offset to write
- */
-static void gf_write(struct map_info *map, map_word d1, unsigned long ofs)
-{
-	struct async_state *state = gf_map_info_to_state(map);
-	uint16_t d;
-
-	gf_set_gpios(state, ofs);
-
-	d = d1.x[0];
-	writew(d, map->virt + (ofs & win_mask(state->win_order)));
-}
-
-/**
- * gf_copy_to() - copy a chunk of data to the flash
- *	@map:  MTD map state
- *	@to:   flash offset to copy to
- *	@from: memory to copy from
- *	@len:  how much to copy
- *
- * See gf_copy_from() caveat.
- */
-static void gf_copy_to(struct map_info *map, unsigned long to,
-		       const void *from, ssize_t len)
-{
-	struct async_state *state = gf_map_info_to_state(map);
-
-	int this_len;
-
-	while (len) {
-		this_len = to & win_mask(state->win_order);
-		this_len = BIT(state->win_order) - this_len;
-		this_len = min_t(int, len, this_len);
-
-		gf_set_gpios(state, to);
-		memcpy_toio(map->virt + (to & win_mask(state->win_order)),
-			    from, len);
-
-		len -= this_len;
-		to += this_len;
-		from += this_len;
-	}
-}
-
-static const char * const part_probe_types[] = {
-	"cmdlinepart", "RedBoot", NULL };
-
-/**
- * gpio_flash_probe() - setup a mapping for a GPIO assisted flash
- *	@pdev: platform device
- *
- * The platform resource layout expected looks something like:
- * struct mtd_partition partitions[] = { ... };
- * struct physmap_flash_data flash_data = { ... };
- * static struct gpiod_lookup_table addr_flash_gpios = {
- *		.dev_id = "gpio-addr-flash.0",
- *		.table = {
- *		GPIO_LOOKUP_IDX("gpio.0", 15, "addr", 0, GPIO_ACTIVE_HIGH),
- *		GPIO_LOOKUP_IDX("gpio.0", 16, "addr", 1, GPIO_ACTIVE_HIGH),
- *		);
- * };
- * gpiod_add_lookup_table(&addr_flash_gpios);
- *
- * struct resource flash_resource[] = {
- *	{
- *		.name  = "cfi_probe",
- *		.start = 0x20000000,
- *		.end   = 0x201fffff,
- *		.flags = IORESOURCE_MEM,
- *	},
- * };
- * struct platform_device flash_device = {
- *	.name          = "gpio-addr-flash",
- *	.dev           = { .platform_data = &flash_data, },
- *	.num_resources = ARRAY_SIZE(flash_resource),
- *	.resource      = flash_resource,
- *	...
- * };
- */
-static int gpio_flash_probe(struct platform_device *pdev)
-{
-	struct physmap_flash_data *pdata;
-	struct resource *memory;
-	struct async_state *state;
-
-	pdata = dev_get_platdata(&pdev->dev);
-	memory = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-
-	if (!memory)
-		return -EINVAL;
-
-	state = devm_kzalloc(&pdev->dev, sizeof(*state), GFP_KERNEL);
-	if (!state)
-		return -ENOMEM;
-
-	state->gpios = devm_gpiod_get_array(&pdev->dev, "addr", GPIOD_OUT_LOW);
-	if (IS_ERR(state->gpios))
-		return PTR_ERR(state->gpios);
-
-	state->win_order      = get_bitmask_order(resource_size(memory)) - 1;
-
-	state->map.name       = DRIVER_NAME;
-	state->map.read       = gf_read;
-	state->map.copy_from  = gf_copy_from;
-	state->map.write      = gf_write;
-	state->map.copy_to    = gf_copy_to;
-	state->map.bankwidth  = pdata->width;
-	state->map.size       = BIT(state->win_order + state->gpios->ndescs);
-	state->map.virt	      = devm_ioremap_resource(&pdev->dev, memory);
-	if (IS_ERR(state->map.virt))
-		return PTR_ERR(state->map.virt);
-
-	state->map.phys       = NO_XIP;
-	state->map.map_priv_1 = (unsigned long)state;
-
-	platform_set_drvdata(pdev, state);
-
-	dev_notice(&pdev->dev, "probing %d-bit flash bus\n",
-		   state->map.bankwidth * 8);
-	state->mtd = do_map_probe(memory->name, &state->map);
-	if (!state->mtd)
-		return -ENXIO;
-	state->mtd->dev.parent = &pdev->dev;
-
-	mtd_device_parse_register(state->mtd, part_probe_types, NULL,
-				  pdata->parts, pdata->nr_parts);
-
-	return 0;
-}
-
-static int gpio_flash_remove(struct platform_device *pdev)
-{
-	struct async_state *state = platform_get_drvdata(pdev);
-
-	mtd_device_unregister(state->mtd);
-	map_destroy(state->mtd);
-	return 0;
-}
-
-static struct platform_driver gpio_flash_driver = {
-	.probe		= gpio_flash_probe,
-	.remove		= gpio_flash_remove,
-	.driver		= {
-		.name	= DRIVER_NAME,
-	},
-};
-
-module_platform_driver(gpio_flash_driver);
-
-MODULE_AUTHOR("Mike Frysinger <vapier@gentoo.org>");
-MODULE_DESCRIPTION("MTD map driver for flashes addressed physically and with gpios");
-MODULE_LICENSE("GPL");
diff --git a/drivers/mtd/maps/physmap-core.c b/drivers/mtd/maps/physmap-core.c
index 8a8af37576ff..11e6239aadc7 100644
--- a/drivers/mtd/maps/physmap-core.c
+++ b/drivers/mtd/maps/physmap-core.c
@@ -13,6 +13,14 @@
  *
  *    Revised to handle newer style flash binding by:
  *    Copyright (C) 2007 David Gibson, IBM Corporation.
+ *
+ * GPIO address extension:
+ *    Handle the case where a flash device is mostly addressed using physical
+ *    line and supplemented by GPIOs.  This way you can hook up say a 8MiB flash
+ *    to a 2MiB memory range and use the GPIOs to select a particular range.
+ *
+ *    Copyright © 2000 Nicolas Pitre <nico@cam.org>
+ *    Copyright © 2005-2009 Analog Devices Inc.
  */
 
 #include <linux/module.h>
@@ -30,6 +38,7 @@
 #include <linux/mtd/cfi_endian.h>
 #include <linux/io.h>
 #include <linux/of_device.h>
+#include <linux/gpio/consumer.h>
 
 #include "physmap-gemini.h"
 #include "physmap-versatile.h"
@@ -45,6 +54,9 @@ struct physmap_flash_info {
 	const char * const	*part_types;
 	unsigned int		nparts;
 	const struct mtd_partition *parts;
+	struct gpio_descs	*gpios;
+	unsigned int		gpio_values;
+	unsigned int		win_order;
 };
 
 static int physmap_flash_remove(struct platform_device *dev)
@@ -104,6 +116,119 @@ static void physmap_set_vpp(struct map_info *map, int state)
 	spin_unlock_irqrestore(&info->vpp_lock, flags);
 }
 
+#if IS_ENABLED(CONFIG_MTD_PHYSMAP_GPIO_ADDR)
+static void physmap_set_addr_gpios(struct physmap_flash_info *info,
+				   unsigned long ofs)
+{
+	unsigned int i;
+
+	ofs >>= info->win_order;
+	if (info->gpio_values == ofs)
+		return;
+
+	for (i = 0; i < info->gpios->ndescs; i++) {
+		if ((BIT(i) & ofs) == (BIT(i) & info->gpio_values))
+			continue;
+
+		gpiod_set_value(info->gpios->desc[i], !!(BIT(i) & ofs));
+	}
+}
+
+#define win_mask(order)		(BIT(order) - 1)
+
+static map_word physmap_addr_gpios_read(struct map_info *map,
+					unsigned long ofs)
+{
+	struct platform_device *pdev;
+	struct physmap_flash_info *info;
+	map_word mw;
+	u16 word;
+
+	pdev = (struct platform_device *)map->map_priv_1;
+	info = platform_get_drvdata(pdev);
+	physmap_set_addr_gpios(info, ofs);
+
+	word = readw(map->virt + (ofs & win_mask(info->win_order)));
+	mw.x[0] = word;
+	return mw;
+}
+
+static void physmap_addr_gpios_copy_from(struct map_info *map, void *buf,
+					 unsigned long ofs, ssize_t len)
+{
+	struct platform_device *pdev;
+	struct physmap_flash_info *info;
+
+	pdev = (struct platform_device *)map->map_priv_1;
+	info = platform_get_drvdata(pdev);
+
+	while (len) {
+		unsigned int winofs = ofs & win_mask(info->win_order);
+		unsigned int chunklen = min_t(unsigned int, len,
+					      BIT(info->win_order) - winofs);
+
+		physmap_set_addr_gpios(info, ofs);
+		memcpy_fromio(buf, map->virt + winofs, chunklen);
+		len -= chunklen;
+		buf += chunklen;
+		ofs += chunklen;
+	}
+}
+
+static void physmap_addr_gpios_write(struct map_info *map, map_word mw,
+				     unsigned long ofs)
+{
+	struct platform_device *pdev;
+	struct physmap_flash_info *info;
+	u16 word;
+
+	pdev = (struct platform_device *)map->map_priv_1;
+	info = platform_get_drvdata(pdev);
+	physmap_set_addr_gpios(info, ofs);
+
+	word = mw.x[0];
+	writew(word, map->virt + (ofs & win_mask(info->win_order)));
+}
+
+static void physmap_addr_gpios_copy_to(struct map_info *map, unsigned long ofs,
+				       const void *buf, ssize_t len)
+{
+	struct platform_device *pdev;
+	struct physmap_flash_info *info;
+
+	pdev = (struct platform_device *)map->map_priv_1;
+	info = platform_get_drvdata(pdev);
+
+	while (len) {
+		unsigned int winofs = ofs & win_mask(info->win_order);
+		unsigned int chunklen = min_t(unsigned int, len,
+					      BIT(info->win_order) - winofs);
+
+		physmap_set_addr_gpios(info, ofs);
+		memcpy_toio(map->virt + winofs, buf, chunklen);
+		len -= chunklen;
+		buf += chunklen;
+		ofs += chunklen;
+	}
+}
+
+static int physmap_addr_gpios_map_init(struct map_info *map)
+{
+	map->phys = NO_XIP;
+	map->read = physmap_addr_gpios_read;
+	map->copy_from = physmap_addr_gpios_copy_from;
+	map->write = physmap_addr_gpios_write;
+	map->copy_to = physmap_addr_gpios_copy_to;
+
+	return 0;
+}
+#else
+static int physmap_addr_gpios_map_init(struct map_info *map)
+{
+	return -ENOTSUPP;
+}
+#endif
+
 #if IS_ENABLED(CONFIG_MTD_PHYSMAP_OF)
 static const struct of_device_id of_flash_match[] = {
 	{
@@ -343,6 +468,16 @@ static int physmap_flash_probe(struct platform_device *dev)
 
 	platform_set_drvdata(dev, info);
 
+	info->gpios = devm_gpiod_get_array_optional(&dev->dev, "addr",
+						    GPIOD_OUT_LOW);
+	if (IS_ERR(info->gpios))
+		return PTR_ERR(info->gpios);
+
+	if (info->gpios && info->nmaps > 1) {
+		dev_err(&dev->dev, "addr-gpios only supported for nmaps == 1\n");
+		return -EINVAL;
+	}
+
 	if (dev->dev.of_node)
 		err = physmap_flash_of_init(dev);
 	else
@@ -369,10 +504,20 @@ static int physmap_flash_probe(struct platform_device *dev)
 		if (!info->maps[i].phys)
 			info->maps[i].phys = res->start;
 
-		info->maps[i].size = resource_size(res);
+		info->win_order = get_bitmask_order(resource_size(res)) - 1;
+		info->maps[i].size = BIT(info->win_order +
+					 (info->gpios ?
+					  info->gpios->ndescs : 0));
+
 		info->maps[i].map_priv_1 = (unsigned long)dev;
 
-		simple_map_init(&info->maps[i]);
+		if (info->gpios) {
+			err = physmap_addr_gpios_map_init(&info->maps[i]);
+			if (err)
+				goto err_out;
+		} else {
+			simple_map_init(&info->maps[i]);
+		}
 
 		probe_type = rom_probe_types;
 		if (!info->probe_type) {
@@ -497,6 +642,7 @@ module_exit(physmap_exit);
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("David Woodhouse <dwmw2@infradead.org>");
 MODULE_AUTHOR("Vitaly Wool <vwool@ru.mvista.com>");
+MODULE_AUTHOR("Mike Frysinger <vapier@gentoo.org>");
 MODULE_DESCRIPTION("Generic configurable MTD map driver");
 
 /* legacy platform drivers can't hotplug or coldplg */
-- 
2.14.1
