Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g6xYi-0007Es-Mf
 for linux-mtd@lists.infradead.org; Mon, 01 Oct 2018 12:44:44 +0000
Received: by mail-ed1-x542.google.com with SMTP id g26-v6so14079526edp.0
 for <linux-mtd@lists.infradead.org>; Mon, 01 Oct 2018 05:44:10 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Zhouyang Jia <jiazhouyang09@gmail.com>, linux-mtd@lists.infradead.org,
 open list <linux-kernel@vger.kernel.org>
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH v4 8/8] mtd: maps: gpio-addr-flash: Add support for
 device-tree devices
Date: Mon,  1 Oct 2018 14:43:51 +0200
Message-Id: <20181001124351.31615-8-ricardo.ribalda@gmail.com>
In-Reply-To: <20181001124351.31615-1-ricardo.ribalda@gmail.com>
References: <20181001124351.31615-1-ricardo.ribalda@gmail.com>
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
 drivers/mtd/maps/gpio-addr-flash.c | 184 ++++++++++++++++++++++-------
 1 file changed, 144 insertions(+), 40 deletions(-)

diff --git a/drivers/mtd/maps/gpio-addr-flash.c b/drivers/mtd/maps/gpio-addr-flash.c
index c6fe1de33a82..afa9dce14f68 100644
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
@@ -171,8 +172,120 @@ static void gf_copy_to(struct map_info *map, unsigned long to,
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
+	struct resource *gpios = NULL;
+	int i;
+
+	dn = pdev->dev.of_node;
+	if (dn) {
+		state->gpios = devm_gpiod_get_array(&pdev->dev, NULL,
+						    GPIOD_OUT_LOW);
+		if (IS_ERR(state->gpios)) {
+			dev_err(&pdev->dev, "Error getting gpio array %ld\n",
+				   PTR_ERR(state->gpios));
+			return PTR_ERR(state->gpios);
+		}
+		return 0;
+	}
+
+	pdata = dev_get_platdata(&pdev->dev);
+	if (!pdata)
+		return -EINVAL;
+	gpios = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
+	if (IS_ERR(gpios) || !gpios->end)
+		return -EINVAL;
+
+	state->gpios = devm_kzalloc(&pdev->dev,
+				    sizeof(*state->gpios) +
+				    gpios->end * sizeof(state->gpios->desc[0]),
+				    GFP_KERNEL);
+	if (!state->gpios)
+		return -ENOMEM;
+
+	for (i = 0; i < gpios->end ; i++) {
+		unsigned int *gpio_id = (unsigned int *)gpios->start;
+
+		if (devm_gpio_request_one(&pdev->dev, gpio_id[i], GPIOD_OUT_LOW,
+					DRIVER_NAME)) {
+			dev_err(&pdev->dev, "failed to request gpio %d\n",
+				gpio_id[i]);
+			return -EBUSY;
+		}
+
+		state->gpios->desc[i] = gpio_to_desc(gpio_id[i]);
+		if (!state->gpios->desc[i])
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
 
 /**
  * gpio_flash_probe() - setup a mapping for a GPIO assisted flash
@@ -204,42 +317,42 @@ static const char * const part_probe_types[] = {
  */
 static int gpio_flash_probe(struct platform_device *pdev)
 {
-	size_t i;
 	struct physmap_flash_data *pdata;
 	struct resource *memory;
-	struct resource *gpios;
 	struct async_state *state;
+	int ret;
 
 	pdata = dev_get_platdata(&pdev->dev);
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
 
-	state->gpios = devm_kzalloc(&pdev->dev,
-			sizeof(*state->gpios) +
-			gpios->end * sizeof(state->gpios->desc[0]),
-			GFP_KERNEL);
-	if (!state->gpios)
-		return -ENOMEM;
-	state->gpios->ndescs = gpios->end;
-
-	if (!state->gpios->desc)
-		return -ENOMEM;
+	ret = gpio_flash_probe_gpios(pdev, state);
+	if (ret < 0)
+		return ret;
 
 	state->win_order      = get_bitmask_order(resource_size(memory)) - 1;
-
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
 	state->map.size       = BIT(state->win_order + state->gpios->ndescs);
 	state->map.virt	      = devm_ioremap_resource(&pdev->dev, memory);
 	if (IS_ERR(state->map.virt))
@@ -248,33 +361,15 @@ static int gpio_flash_probe(struct platform_device *pdev)
 	state->map.phys       = NO_XIP;
 	state->map.map_priv_1 = (unsigned long)state;
 
-	platform_set_drvdata(pdev, state);
-
-	i = 0;
-	do {
-		unsigned int *gpio_id = (unsigned int *)gpios->start;
-
-		if (devm_gpio_request_one(&pdev->dev, gpio_id[i], GPIOD_OUT_LOW,
-					DRIVER_NAME)) {
-			dev_err(&pdev->dev, "failed to request gpio %d\n",
-				gpio_id[i]);
-			return -EBUSY;
-		}
-
-		state->gpios->desc[i] = gpio_to_desc(gpio_id[i]);
-		if (!state->gpios->desc[i])
-			return -EINVAL;
-	} while (++i < state->gpios->ndescs);
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
@@ -288,11 +383,20 @@ static int gpio_flash_remove(struct platform_device *pdev)
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
2.19.0
