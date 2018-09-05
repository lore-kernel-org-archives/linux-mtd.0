Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fxYvl-0006bh-2W
 for linux-mtd@lists.infradead.org; Wed, 05 Sep 2018 14:37:17 +0000
Received: by mail-ed1-x544.google.com with SMTP id s10-v6so6250837edb.11
 for <linux-mtd@lists.infradead.org>; Wed, 05 Sep 2018 07:37:04 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Zhouyang Jia <jiazhouyang09@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org (open list)
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH v2 6/8] mtd: maps: gpio-addr-flash: Split allocation in two
Date: Wed,  5 Sep 2018 16:36:41 +0200
Message-Id: <20180905143643.9871-7-ricardo.ribalda@gmail.com>
In-Reply-To: <20180905143643.9871-1-ricardo.ribalda@gmail.com>
References: <20180905143643.9871-1-ricardo.ribalda@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Instead of making one allocation and then calculating the addresses of
those two pointers in that area make two allocations. This simplifies
the code.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 drivers/mtd/maps/gpio-addr-flash.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/maps/gpio-addr-flash.c b/drivers/mtd/maps/gpio-addr-flash.c
index 8f5e3dce9be3..9455a8448064 100644
--- a/drivers/mtd/maps/gpio-addr-flash.c
+++ b/drivers/mtd/maps/gpio-addr-flash.c
@@ -205,7 +205,7 @@ static const char * const part_probe_types[] = {
  */
 static int gpio_flash_probe(struct platform_device *pdev)
 {
-	size_t i, arr_size;
+	size_t i;
 	struct physmap_flash_data *pdata;
 	struct resource *memory;
 	struct resource *gpios;
@@ -218,8 +218,7 @@ static int gpio_flash_probe(struct platform_device *pdev)
 	if (!memory || !gpios || !gpios->end)
 		return -EINVAL;
 
-	arr_size = sizeof(state->gpio_addrs[0]) * gpios->end;
-	state = devm_kzalloc(&pdev->dev, sizeof(*state) + arr_size, GFP_KERNEL);
+	state = devm_kzalloc(&pdev->dev, sizeof(*state), GFP_KERNEL);
 	if (!state)
 		return -ENOMEM;
 
@@ -228,7 +227,12 @@ static int gpio_flash_probe(struct platform_device *pdev)
 	 * away their pointer types here to the known types (gpios->xxx).
 	 */
 	state->gpio_count     = gpios->end;
-	state->gpio_addrs     = (void *)(unsigned long)gpios->start;
+	state->gpio_addrs     = devm_kzalloc(&pdev->dev,
+					     sizeof(state->gpio_addrs[0]) *
+								gpios->end,
+					     GFP_KERNEL);
+	if (!state->gpio_addrs)
+		return -ENOMEM;
 	state->win_order      = get_bitmask_order(resource_size(memory)) - 1;
 
 	state->map.name       = DRIVER_NAME;
-- 
2.18.0
