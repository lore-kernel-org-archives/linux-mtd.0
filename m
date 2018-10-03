Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7mzS-0003tR-NZ
 for linux-mtd@lists.infradead.org; Wed, 03 Oct 2018 19:39:59 +0000
Received: by mail-ed1-x544.google.com with SMTP id q19-v6so6469194edr.1
 for <linux-mtd@lists.infradead.org>; Wed, 03 Oct 2018 12:39:17 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Zhouyang Jia <jiazhouyang09@gmail.com>, linux-mtd@lists.infradead.org,
 open list <linux-kernel@vger.kernel.org>
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH v5 8/8] mtd: maps: gpio-addr-flash: Add support for
 device-tree devices
Date: Wed,  3 Oct 2018 21:38:59 +0200
Message-Id: <20181003193859.23928-8-ricardo.ribalda@gmail.com>
In-Reply-To: <20181003193859.23928-1-ricardo.ribalda@gmail.com>
References: <20181003193859.23928-1-ricardo.ribalda@gmail.com>
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

Option parsing has been moved to separated functions.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 drivers/mtd/maps/gpio-addr-flash.c | 95 +++++++++++++++++++++++++++---
 1 file changed, 87 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/maps/gpio-addr-flash.c b/drivers/mtd/maps/gpio-addr-flash.c
index 9e370e3158cd..1be2df81087a 100644
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
@@ -171,8 +172,67 @@ static void gf_copy_to(struct map_info *map, unsigned long to,
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
 
 /**
  * gpio_flash_probe() - setup a mapping for a GPIO assisted flash
@@ -208,6 +268,7 @@ static int gpio_flash_probe(struct platform_device *pdev)
 	struct physmap_flash_data *pdata;
 	struct resource *memory;
 	struct async_state *state;
+	int ret;
 
 	pdata = dev_get_platdata(&pdev->dev);
 	memory = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -215,9 +276,15 @@ static int gpio_flash_probe(struct platform_device *pdev)
 	if (!memory)
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
 
 	state->gpios = devm_gpiod_get_array(&pdev->dev, NULL, GPIOD_OUT_LOW);
 	if (IS_ERR(state->gpios))
@@ -230,7 +297,12 @@ static int gpio_flash_probe(struct platform_device *pdev)
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
@@ -239,17 +311,15 @@ static int gpio_flash_probe(struct platform_device *pdev)
 	state->map.phys       = NO_XIP;
 	state->map.map_priv_1 = (unsigned long)state;
 
-	platform_set_drvdata(pdev, state);
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
@@ -263,11 +333,20 @@ static int gpio_flash_remove(struct platform_device *pdev)
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
