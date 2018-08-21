Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fs7hX-0003ka-EU
 for linux-mtd@lists.infradead.org; Tue, 21 Aug 2018 14:32:14 +0000
Received: by mail-ed1-x542.google.com with SMTP id h4-v6so10787564edi.6
 for <linux-mtd@lists.infradead.org>; Tue, 21 Aug 2018 07:32:01 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Zhouyang Jia <jiazhouyang09@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH 3/8] mtd: maps: gpio-addr-flash: Use devm_* functions
Date: Tue, 21 Aug 2018 16:31:47 +0200
Message-Id: <20180821143152.32293-4-ricardo.ribalda@gmail.com>
In-Reply-To: <20180821143152.32293-1-ricardo.ribalda@gmail.com>
References: <20180821143152.32293-1-ricardo.ribalda@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

By using devm functions we can make the code cleaner.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 drivers/mtd/maps/gpio-addr-flash.c | 28 ++++++++++------------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/maps/gpio-addr-flash.c b/drivers/mtd/maps/gpio-addr-flash.c
index 6de16e81994c..54a0d7d2365a 100644
--- a/drivers/mtd/maps/gpio-addr-flash.c
+++ b/drivers/mtd/maps/gpio-addr-flash.c
@@ -213,7 +213,7 @@ static int gpio_flash_probe(struct platform_device *pdev)
 		return -EINVAL;
 
 	arr_size = sizeof(int) * gpios->end;
-	state = kzalloc(sizeof(*state) + arr_size, GFP_KERNEL);
+	state = devm_kzalloc(&pdev->dev, sizeof(*state) + arr_size, GFP_KERNEL);
 	if (!state)
 		return -ENOMEM;
 
@@ -234,9 +234,11 @@ static int gpio_flash_probe(struct platform_device *pdev)
 	state->map.copy_to    = gf_copy_to;
 	state->map.bankwidth  = pdata->width;
 	state->map.size       = state->win_size * (1 << state->gpio_count);
-	state->map.virt       = ioremap_nocache(memory->start, state->win_size);
-	if (!state->map.virt)
-		return -ENOMEM;
+	state->map.virt	      = devm_ioremap_resource(&pdev->dev, memory);
+	if (IS_ERR(state->map.virt)) {
+		dev_err(&pdev->dev, "failed to map memory\n");
+		return PTR_ERR(state->map.virt);
+	}
 
 	state->map.phys       = NO_XIP;
 	state->map.map_priv_1 = (unsigned long)state;
@@ -245,12 +247,10 @@ static int gpio_flash_probe(struct platform_device *pdev)
 
 	i = 0;
 	do {
-		if (gpio_request(state->gpio_addrs[i], DRIVER_NAME)) {
+		if (devm_gpio_request(&pdev->dev, state->gpio_addrs[i],
+				      DRIVER_NAME)) {
 			dev_err(&pdev->dev, "failed to request gpio %d\n",
 				state->gpio_addrs[i]);
-			while (i--)
-				gpio_free(state->gpio_addrs[i]);
-			kfree(state);
 			return -EBUSY;
 		}
 		gpio_direction_output(state->gpio_addrs[i], 0);
@@ -259,12 +259,8 @@ static int gpio_flash_probe(struct platform_device *pdev)
 	dev_notice(&pdev->dev, "probing %d-bit flash bus\n",
 		   state->map.bankwidth * 8);
 	state->mtd = do_map_probe(memory->name, &state->map);
-	if (!state->mtd) {
-		for (i = 0; i < state->gpio_count; ++i)
-			gpio_free(state->gpio_addrs[i]);
-		kfree(state);
+	if (!state->mtd)
 		return -ENXIO;
-	}
 	state->mtd->dev.parent = &pdev->dev;
 
 	mtd_device_parse_register(state->mtd, part_probe_types, NULL,
@@ -276,13 +272,9 @@ static int gpio_flash_probe(struct platform_device *pdev)
 static int gpio_flash_remove(struct platform_device *pdev)
 {
 	struct async_state *state = platform_get_drvdata(pdev);
-	size_t i = 0;
-	do {
-		gpio_free(state->gpio_addrs[i]);
-	} while (++i < state->gpio_count);
+
 	mtd_device_unregister(state->mtd);
 	map_destroy(state->mtd);
-	kfree(state);
 	return 0;
 }
 
-- 
2.18.0
