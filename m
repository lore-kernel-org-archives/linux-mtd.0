Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fs7hp-0003zM-K7
 for linux-mtd@lists.infradead.org; Tue, 21 Aug 2018 14:32:32 +0000
Received: by mail-ed1-x544.google.com with SMTP id o8-v6so10770692edt.13
 for <linux-mtd@lists.infradead.org>; Tue, 21 Aug 2018 07:32:15 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Zhouyang Jia <jiazhouyang09@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH 7/8] mtd: maps: gpio-addr-flash: Add support for device-tree
 devices
Date: Tue, 21 Aug 2018 16:31:51 +0200
Message-Id: <20180821143152.32293-8-ricardo.ribalda@gmail.com>
In-Reply-To: <20180821143152.32293-1-ricardo.ribalda@gmail.com>
References: <20180821143152.32293-1-ricardo.ribalda@gmail.com>
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

Allow creating gpio-addr-flash via device-tree and not just via platform
data.

The gpio probing has been moved to a different function allowing
deferred probing if they are not ready.

Option parsing has been also moved to separated functions.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 drivers/mtd/maps/gpio-addr-flash.c | 187 +++++++++++++++++++++++------
 1 file changed, 148 insertions(+), 39 deletions(-)

diff --git a/drivers/mtd/maps/gpio-addr-flash.c b/drivers/mtd/maps/gpio-addr-flash.c
index 9455a8448064..b44011987137 100644
--- a/drivers/mtd/maps/gpio-addr-flash.c
+++ b/drivers/mtd/maps/gpio-addr-flash.c
@@ -7,6 +7,7 @@
  *
  * Copyright © 2000 Nicolas Pitre <nico@cam.org>
  * Copyright © 2005-2009 Analog Devices Inc.
+ * Copyright © 2018 Ricardo Ribalda <ricardo.ribalda@gmail.com>
  *
  * Enter bugs at http://blackfin.uclinux.org/
  *
@@ -24,6 +25,7 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <linux/of_gpio.h>
 
 #define win_mask(x) ((BIT(x)) - 1)
 
@@ -172,8 +174,122 @@ static void gf_copy_to(struct map_info *map, unsigned long to,
 	}
 }
 
-static const char * const part_probe_types[] = {
-	"cmdlinepart", "RedBoot", NULL };
+static int gf_bankwidth(struct platform_device *pdev)
+{
+	struct device_node *dn;
+	int ret;
+	u32 bankwidth;
+
+	dn = pdev->dev.of_node;
+	if (!dn) {
+		struct physmap_flash_data *pdata;
+
+		pdata = dev_get_platdata(&pdev->dev);
+		return pdata->width;
+	}
+
+	ret = of_property_read_u32(dn, "bank-width", &bankwidth);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to get bank-width\n");
+		return -EINVAL;
+	}
+
+	return bankwidth;
+}
+
+static const char *gf_probe_type(struct platform_device *pdev)
+{
+	struct device_node *dn;
+	struct resource *memory;
+	const char *of_probe;
+
+	dn = pdev->dev.of_node;
+	if (!dn) {
+		memory = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+		return memory->name;
+	}
+
+	of_probe = of_get_property(dn, "probe-type", NULL);
+	if (of_probe)
+		return of_probe;
+
+	return "cfi_probe";
+}
+
+static void gf_device_parse_register(struct platform_device *pdev,
+				     struct async_state *state)
+{
+	static const char * const part_probe_types[] = {
+		"cmdlinepart", "RedBoot", "ofpart", "ofoldpart", NULL };
+	struct device_node *dn;
+
+	dn = pdev->dev.of_node;
+	if (!dn) {
+		struct physmap_flash_data *pdata;
+
+		pdata = dev_get_platdata(&pdev->dev);
+		mtd_device_parse_register(state->mtd, part_probe_types, NULL,
+					  pdata->parts, pdata->nr_parts);
+		return;
+	}
+
+	mtd_device_parse_register(state->mtd, part_probe_types, NULL, NULL, 0);
+}
+
+static int gpio_flash_probe_gpios(struct platform_device *pdev,
+				  struct async_state *state)
+{
+	struct physmap_flash_data *pdata;
+	struct device_node *dn;
+	struct resource *gpios;
+	int i;
+
+	dn = pdev->dev.of_node;
+	if (!dn) {
+		pdata = dev_get_platdata(&pdev->dev);
+		if (!pdata)
+			return -EINVAL;
+		gpios = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
+		if (IS_ERR(gpios) || !gpios->end)
+			return -EINVAL;
+	}
+
+	if (dn)
+		state->gpio_count = of_gpio_count(dn);
+	else
+		state->gpio_count = gpios->end;
+
+	state->gpio_addrs = devm_kzalloc(&pdev->dev,
+					 sizeof(state->gpio_addrs[0])
+						* state->gpio_count,
+					 GFP_KERNEL);
+	if (!state->gpio_addrs)
+		return -ENOMEM;
+
+	for (i = 0; i < state->gpio_count; i++) {
+		int gpio, ret;
+
+		if (dn)
+			gpio = of_get_gpio(dn, i);
+		else
+			gpio = ((unsigned long *)gpios->start)[i];
+
+		if (gpio < 0)
+			return gpio;
+
+		ret =  devm_gpio_request(&pdev->dev, gpio, DRIVER_NAME);
+		if (ret < 0) {
+			dev_err(&pdev->dev, "failed to request gpio %d\n",
+				gpio);
+			return ret;
+		}
+		state->gpio_addrs[i] = gpio;
+		gpio_direction_output(state->gpio_addrs[i], 0);
+	}
+
+	return 0;
+}
+
 
 /**
  * gpio_flash_probe() - setup a mapping for a GPIO assisted flash
@@ -205,74 +321,58 @@ static const char * const part_probe_types[] = {
  */
 static int gpio_flash_probe(struct platform_device *pdev)
 {
-	size_t i;
-	struct physmap_flash_data *pdata;
 	struct resource *memory;
-	struct resource *gpios;
 	struct async_state *state;
+	int ret;
 
-	pdata = dev_get_platdata(&pdev->dev);
 	memory = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	gpios = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
-
-	if (!memory || !gpios || !gpios->end)
+	if (!memory)
 		return -EINVAL;
 
+	if (!is_power_of_2(resource_size(memory))) {
+		dev_err(&pdev->dev, "Window size must be aligned\n");
+		return -EIO;
+	}
+
 	state = devm_kzalloc(&pdev->dev, sizeof(*state), GFP_KERNEL);
 	if (!state)
 		return -ENOMEM;
+	platform_set_drvdata(pdev, state);
 
-	/*
-	 * We cast start/end to known types in the boards file, so cast
-	 * away their pointer types here to the known types (gpios->xxx).
-	 */
-	state->gpio_count     = gpios->end;
-	state->gpio_addrs     = devm_kzalloc(&pdev->dev,
-					     sizeof(state->gpio_addrs[0]) *
-								gpios->end,
-					     GFP_KERNEL);
-	if (!state->gpio_addrs)
-		return -ENOMEM;
-	state->win_order      = get_bitmask_order(resource_size(memory)) - 1;
+	ret = gpio_flash_probe_gpios(pdev, state);
+	if (ret < 0)
+		return ret;
 
+	state->win_order      = get_bitmask_order(resource_size(memory)) - 1;
 	state->map.name       = DRIVER_NAME;
 	state->map.read       = gf_read;
 	state->map.copy_from  = gf_copy_from;
 	state->map.write      = gf_write;
 	state->map.copy_to    = gf_copy_to;
-	state->map.bankwidth  = pdata->width;
+
+	ret = gf_bankwidth(pdev);
+	if (ret < 0)
+		return ret;
+	state->map.bankwidth = ret;
+
 	state->map.size       = BIT(state->win_order + state->gpio_count);
 	state->map.virt	      = devm_ioremap_resource(&pdev->dev, memory);
 	if (IS_ERR(state->map.virt)) {
 		dev_err(&pdev->dev, "failed to map memory\n");
 		return PTR_ERR(state->map.virt);
 	}
-
 	state->map.phys       = NO_XIP;
 	state->map.map_priv_1 = (unsigned long)state;
 
-	platform_set_drvdata(pdev, state);
-
-	i = 0;
-	do {
-		if (devm_gpio_request(&pdev->dev, state->gpio_addrs[i],
-				      DRIVER_NAME)) {
-			dev_err(&pdev->dev, "failed to request gpio %d\n",
-				state->gpio_addrs[i]);
-			return -EBUSY;
-		}
-		gpio_direction_output(state->gpio_addrs[i], 0);
-	} while (++i < state->gpio_count);
-
 	dev_notice(&pdev->dev, "probing %d-bit flash bus\n",
 		   state->map.bankwidth * 8);
-	state->mtd = do_map_probe(memory->name, &state->map);
+	state->mtd = do_map_probe(gf_probe_type(pdev), &state->map);
 	if (!state->mtd)
 		return -ENXIO;
 	state->mtd->dev.parent = &pdev->dev;
+	mtd_set_of_node(state->mtd, pdev->dev.of_node);
 
-	mtd_device_parse_register(state->mtd, part_probe_types, NULL,
-				  pdata->parts, pdata->nr_parts);
+	gf_device_parse_register(pdev, state);
 
 	return 0;
 }
@@ -286,11 +386,20 @@ static int gpio_flash_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct of_device_id gpio_flash_match[] = {
+	{
+		.compatible	= "cfi-gpio-addr-flash",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, gpio_flash_match);
+
 static struct platform_driver gpio_flash_driver = {
 	.probe		= gpio_flash_probe,
 	.remove		= gpio_flash_remove,
 	.driver		= {
 		.name	= DRIVER_NAME,
+		.of_match_table = gpio_flash_match,
 	},
 };
 
-- 
2.18.0
