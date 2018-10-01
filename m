Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g6xYU-0007Dw-NM
 for linux-mtd@lists.infradead.org; Mon, 01 Oct 2018 12:44:08 +0000
Received: by mail-ed1-x542.google.com with SMTP id t11-v6so14043965edq.11
 for <linux-mtd@lists.infradead.org>; Mon, 01 Oct 2018 05:44:05 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Zhouyang Jia <jiazhouyang09@gmail.com>, linux-mtd@lists.infradead.org,
 open list <linux-kernel@vger.kernel.org>
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH v4 6/8] mtd: maps: gpio-addr-flash: Convert to gpiod
Date: Mon,  1 Oct 2018 14:43:49 +0200
Message-Id: <20181001124351.31615-6-ricardo.ribalda@gmail.com>
In-Reply-To: <20181001124351.31615-1-ricardo.ribalda@gmail.com>
References: <20181001124351.31615-1-ricardo.ribalda@gmail.com>
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

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Suggested-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/maps/gpio-addr-flash.c | 45 ++++++++++++++++++------------
 1 file changed, 27 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/maps/gpio-addr-flash.c b/drivers/mtd/maps/gpio-addr-flash.c
index 47b12a6fead4..c6fe1de33a82 100644
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
@@ -222,12 +221,17 @@ static int gpio_flash_probe(struct platform_device *pdev)
 	if (!state)
 		return -ENOMEM;
 
-	/*
-	 * We cast start/end to known types in the boards file, so cast
-	 * away their pointer types here to the known types (gpios->xxx).
-	 */
-	state->gpio_count     = gpios->end;
-	state->gpio_addrs     = (void *)(unsigned long)gpios->start;
+	state->gpios = devm_kzalloc(&pdev->dev,
+			sizeof(*state->gpios) +
+			gpios->end * sizeof(state->gpios->desc[0]),
+			GFP_KERNEL);
+	if (!state->gpios)
+		return -ENOMEM;
+	state->gpios->ndescs = gpios->end;
+
+	if (!state->gpios->desc)
+		return -ENOMEM;
+
 	state->win_order      = get_bitmask_order(resource_size(memory)) - 1;
 
 	state->map.name       = DRIVER_NAME;
@@ -236,7 +240,7 @@ static int gpio_flash_probe(struct platform_device *pdev)
 	state->map.write      = gf_write;
 	state->map.copy_to    = gf_copy_to;
 	state->map.bankwidth  = pdata->width;
-	state->map.size       = BIT(state->win_order + state->gpio_count);
+	state->map.size       = BIT(state->win_order + state->gpios->ndescs);
 	state->map.virt	      = devm_ioremap_resource(&pdev->dev, memory);
 	if (IS_ERR(state->map.virt))
 		return PTR_ERR(state->map.virt);
@@ -248,14 +252,19 @@ static int gpio_flash_probe(struct platform_device *pdev)
 
 	i = 0;
 	do {
-		if (devm_gpio_request(&pdev->dev, state->gpio_addrs[i],
-				      DRIVER_NAME)) {
+		unsigned int *gpio_id = (unsigned int *)gpios->start;
+
+		if (devm_gpio_request_one(&pdev->dev, gpio_id[i], GPIOD_OUT_LOW,
+					DRIVER_NAME)) {
 			dev_err(&pdev->dev, "failed to request gpio %d\n",
-				state->gpio_addrs[i]);
+				gpio_id[i]);
 			return -EBUSY;
 		}
-		gpio_direction_output(state->gpio_addrs[i], 0);
-	} while (++i < state->gpio_count);
+
+		state->gpios->desc[i] = gpio_to_desc(gpio_id[i]);
+		if (!state->gpios->desc[i])
+			return -EINVAL;
+	} while (++i < state->gpios->ndescs);
 
 	dev_notice(&pdev->dev, "probing %d-bit flash bus\n",
 		   state->map.bankwidth * 8);
-- 
2.19.0
