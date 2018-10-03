Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7mzS-0003pQ-LW
 for linux-mtd@lists.infradead.org; Wed, 03 Oct 2018 19:39:47 +0000
Received: by mail-ed1-x544.google.com with SMTP id v18-v6so5365370edq.12
 for <linux-mtd@lists.infradead.org>; Wed, 03 Oct 2018 12:39:12 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Zhouyang Jia <jiazhouyang09@gmail.com>, linux-mtd@lists.infradead.org,
 open list <linux-kernel@vger.kernel.org>
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH v5 6/8] mtd: maps: gpio-addr-flash: Convert to gpiod
Date: Wed,  3 Oct 2018 21:38:57 +0200
Message-Id: <20181003193859.23928-6-ricardo.ribalda@gmail.com>
In-Reply-To: <20181003193859.23928-1-ricardo.ribalda@gmail.com>
References: <20181003193859.23928-1-ricardo.ribalda@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Convert from legacy gpio API to gpiod.
Board files will have to use gpiod_lookup_tables.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Suggested-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/maps/gpio-addr-flash.c | 52 +++++++++++-------------------
 1 file changed, 18 insertions(+), 34 deletions(-)

diff --git a/drivers/mtd/maps/gpio-addr-flash.c b/drivers/mtd/maps/gpio-addr-flash.c
index 47b12a6fead4..9e370e3158cd 100644
--- a/drivers/mtd/maps/gpio-addr-flash.c
+++ b/drivers/mtd/maps/gpio-addr-flash.c
@@ -14,6 +14,7 @@
  */
 
 #include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -33,16 +34,14 @@
  * struct async_state - keep GPIO flash state
  *	@mtd:         MTD state for this mapping
  *	@map:         MTD map state for this flash
- *	@gpio_count:  number of GPIOs used to address
- *	@gpio_addrs:  array of GPIOs to twiddle
+ *	@gpios:       Struct containing the array of GPIO descriptors
  *	@gpio_values: cached GPIO values
  *	@win_order:   dedicated memory size (if no GPIOs)
  */
 struct async_state {
 	struct mtd_info *mtd;
 	struct map_info map;
-	size_t gpio_count;
-	unsigned *gpio_addrs;
+	struct gpio_descs *gpios;
 	unsigned int gpio_values;
 	unsigned int win_order;
 };
@@ -66,11 +65,11 @@ static void gf_set_gpios(struct async_state *state, unsigned long ofs)
 	if (ofs == state->gpio_values)
 		return;
 
-	for (i = 0; i < state->gpio_count; i++) {
+	for (i = 0; i < state->gpios->ndescs; i++) {
 		if ((ofs & BIT(i)) == (state->gpio_values & BIT(i)))
 			continue;
 
-		gpio_set_value(state->gpio_addrs[i], !!(ofs & BIT(i)));
+		gpiod_set_value(state->gpios->desc[i], !!(ofs & BIT(i)));
 	}
 
 	state->gpio_values = ofs;
@@ -182,18 +181,19 @@ static const char * const part_probe_types[] = {
  * The platform resource layout expected looks something like:
  * struct mtd_partition partitions[] = { ... };
  * struct physmap_flash_data flash_data = { ... };
- * unsigned flash_gpios[] = { GPIO_XX, GPIO_XX, ... };
+ * static struct gpiod_lookup_table addr_flash_gpios = {
+ *		.dev_id = "gpio-addr-flash.0",
+ *		.table = { .... );
+ * };
+ * gpiod_add_lookup_table(&addr_flash_gpios);
+ *
  * struct resource flash_resource[] = {
  *	{
  *		.name  = "cfi_probe",
  *		.start = 0x20000000,
  *		.end   = 0x201fffff,
  *		.flags = IORESOURCE_MEM,
- *	}, {
- *		.start = (unsigned long)flash_gpios,
- *		.end   = ARRAY_SIZE(flash_gpios),
- *		.flags = IORESOURCE_IRQ,
- *	}
+ *	},
  * };
  * struct platform_device flash_device = {
  *	.name          = "gpio-addr-flash",
@@ -205,29 +205,24 @@ static const char * const part_probe_types[] = {
  */
 static int gpio_flash_probe(struct platform_device *pdev)
 {
-	size_t i;
 	struct physmap_flash_data *pdata;
 	struct resource *memory;
-	struct resource *gpios;
 	struct async_state *state;
 
 	pdata = dev_get_platdata(&pdev->dev);
 	memory = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	gpios = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
 
-	if (!memory || !gpios || !gpios->end)
+	if (!memory)
 		return -EINVAL;
 
 	state = devm_kzalloc(&pdev->dev, sizeof(*state), GFP_KERNEL);
 	if (!state)
 		return -ENOMEM;
 
-	/*
-	 * We cast start/end to known types in the boards file, so cast
-	 * away their pointer types here to the known types (gpios->xxx).
-	 */
-	state->gpio_count     = gpios->end;
-	state->gpio_addrs     = (void *)(unsigned long)gpios->start;
+	state->gpios = devm_gpiod_get_array(&pdev->dev, NULL, GPIOD_OUT_LOW);
+	if (IS_ERR(state->gpios))
+		return PTR_ERR(state->gpios);
+
 	state->win_order      = get_bitmask_order(resource_size(memory)) - 1;
 
 	state->map.name       = DRIVER_NAME;
@@ -236,7 +231,7 @@ static int gpio_flash_probe(struct platform_device *pdev)
 	state->map.write      = gf_write;
 	state->map.copy_to    = gf_copy_to;
 	state->map.bankwidth  = pdata->width;
-	state->map.size       = BIT(state->win_order + state->gpio_count);
+	state->map.size       = BIT(state->win_order + state->gpios->ndescs);
 	state->map.virt	      = devm_ioremap_resource(&pdev->dev, memory);
 	if (IS_ERR(state->map.virt))
 		return PTR_ERR(state->map.virt);
@@ -246,17 +241,6 @@ static int gpio_flash_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, state);
 
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
 	state->mtd = do_map_probe(memory->name, &state->map);
-- 
2.19.0
