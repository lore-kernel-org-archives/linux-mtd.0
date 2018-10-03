Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7mzJ-0003hR-Ox
 for linux-mtd@lists.infradead.org; Wed, 03 Oct 2018 19:39:46 +0000
Received: by mail-ed1-x541.google.com with SMTP id y19-v6so6457171edd.2
 for <linux-mtd@lists.infradead.org>; Wed, 03 Oct 2018 12:39:08 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Zhouyang Jia <jiazhouyang09@gmail.com>, linux-mtd@lists.infradead.org,
 open list <linux-kernel@vger.kernel.org>
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH v5 4/8] mtd: maps: gpio-addr-flash: Use order insted of size
Date: Wed,  3 Oct 2018 21:38:55 +0200
Message-Id: <20181003193859.23928-4-ricardo.ribalda@gmail.com>
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

By using the order of the window instead of the size, we can replace a
lot of expensive division and modulus on the code with simple bit
operations.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 drivers/mtd/maps/gpio-addr-flash.c | 39 ++++++++++++++++--------------
 1 file changed, 21 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/maps/gpio-addr-flash.c b/drivers/mtd/maps/gpio-addr-flash.c
index 84404dcc7824..89cc8cce161b 100644
--- a/drivers/mtd/maps/gpio-addr-flash.c
+++ b/drivers/mtd/maps/gpio-addr-flash.c
@@ -25,6 +25,8 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 
+#define win_mask(x) ((BIT(x)) - 1)
+
 #define DRIVER_NAME "gpio-addr-flash"
 
 /**
@@ -34,7 +36,7 @@
  *	@gpio_count:  number of GPIOs used to address
  *	@gpio_addrs:  array of GPIOs to twiddle
  *	@gpio_values: cached GPIO values
- *	@win_size:    dedicated memory size (if no GPIOs)
+ *	@win_order:   dedicated memory size (if no GPIOs)
  */
 struct async_state {
 	struct mtd_info *mtd;
@@ -42,7 +44,7 @@ struct async_state {
 	size_t gpio_count;
 	unsigned *gpio_addrs;
 	int *gpio_values;
-	unsigned long win_size;
+	unsigned int win_order;
 };
 #define gf_map_info_to_state(mi) ((struct async_state *)(mi)->map_priv_1)
 
@@ -60,7 +62,8 @@ static void gf_set_gpios(struct async_state *state, unsigned long ofs)
 {
 	size_t i = 0;
 	int value;
-	ofs /= state->win_size;
+
+	ofs >>= state->win_order;
 	do {
 		value = ofs & (1 << i);
 		if (state->gpio_values[i] != value) {
@@ -83,7 +86,7 @@ static map_word gf_read(struct map_info *map, unsigned long ofs)
 
 	gf_set_gpios(state, ofs);
 
-	word = readw(map->virt + (ofs % state->win_size));
+	word = readw(map->virt + (ofs & win_mask(state->win_order)));
 	test.x[0] = word;
 	return test;
 }
@@ -105,14 +108,14 @@ static void gf_copy_from(struct map_info *map, void *to, unsigned long from, ssi
 	int this_len;
 
 	while (len) {
-		if ((from % state->win_size) + len > state->win_size)
-			this_len = state->win_size - (from % state->win_size);
-		else
-			this_len = len;
+		this_len = from & win_mask(state->win_order);
+		this_len = BIT(state->win_order) - this_len;
+		this_len = min_t(int, len, this_len);
 
 		gf_set_gpios(state, from);
-		memcpy_fromio(to, map->virt + (from % state->win_size),
-			 this_len);
+		memcpy_fromio(to,
+			      map->virt + (from & win_mask(state->win_order)),
+			      this_len);
 		len -= this_len;
 		from += this_len;
 		to += this_len;
@@ -132,7 +135,7 @@ static void gf_write(struct map_info *map, map_word d1, unsigned long ofs)
 	gf_set_gpios(state, ofs);
 
 	d = d1.x[0];
-	writew(d, map->virt + (ofs % state->win_size));
+	writew(d, map->virt + (ofs & win_mask(state->win_order)));
 }
 
 /**
@@ -152,13 +155,13 @@ static void gf_copy_to(struct map_info *map, unsigned long to,
 	int this_len;
 
 	while (len) {
-		if ((to % state->win_size) + len > state->win_size)
-			this_len = state->win_size - (to % state->win_size);
-		else
-			this_len = len;
+		this_len = to & win_mask(state->win_order);
+		this_len = BIT(state->win_order) - this_len;
+		this_len = min_t(int, len, this_len);
 
 		gf_set_gpios(state, to);
-		memcpy_toio(map->virt + (to % state->win_size), from, len);
+		memcpy_toio(map->virt + (to & win_mask(state->win_order)),
+			    from, len);
 
 		len -= this_len;
 		to += this_len;
@@ -224,7 +227,7 @@ static int gpio_flash_probe(struct platform_device *pdev)
 	state->gpio_count     = gpios->end;
 	state->gpio_addrs     = (void *)(unsigned long)gpios->start;
 	state->gpio_values    = (void *)(state + 1);
-	state->win_size       = resource_size(memory);
+	state->win_order      = get_bitmask_order(resource_size(memory)) - 1;
 	memset(state->gpio_values, 0xff, arr_size);
 
 	state->map.name       = DRIVER_NAME;
@@ -233,7 +236,7 @@ static int gpio_flash_probe(struct platform_device *pdev)
 	state->map.write      = gf_write;
 	state->map.copy_to    = gf_copy_to;
 	state->map.bankwidth  = pdata->width;
-	state->map.size       = state->win_size * (1 << state->gpio_count);
+	state->map.size       = BIT(state->win_order + state->gpio_count);
 	state->map.virt	      = devm_ioremap_resource(&pdev->dev, memory);
 	if (IS_ERR(state->map.virt))
 		return PTR_ERR(state->map.virt);
-- 
2.19.0
