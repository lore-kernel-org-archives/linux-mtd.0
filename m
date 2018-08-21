Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fs7hY-0003kP-M2
 for linux-mtd@lists.infradead.org; Tue, 21 Aug 2018 14:32:14 +0000
Received: by mail-ed1-x543.google.com with SMTP id q15-v6so1221752eds.5
 for <linux-mtd@lists.infradead.org>; Tue, 21 Aug 2018 07:31:58 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Zhouyang Jia <jiazhouyang09@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH 1/8] mtd: maps: gpio-addr-flash: Replace custom printk
Date: Tue, 21 Aug 2018 16:31:45 +0200
Message-Id: <20180821143152.32293-2-ricardo.ribalda@gmail.com>
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

Use preferred print methods dev_*

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 drivers/mtd/maps/gpio-addr-flash.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/maps/gpio-addr-flash.c b/drivers/mtd/maps/gpio-addr-flash.c
index 9d9723693217..17be47f72973 100644
--- a/drivers/mtd/maps/gpio-addr-flash.c
+++ b/drivers/mtd/maps/gpio-addr-flash.c
@@ -25,11 +25,7 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 
-#define pr_devinit(fmt, args...) \
-	({ static const char __fmt[] = fmt; printk(__fmt, ## args); })
-
 #define DRIVER_NAME "gpio-addr-flash"
-#define PFX DRIVER_NAME ": "
 
 /**
  * struct async_state - keep GPIO flash state
@@ -250,7 +246,7 @@ static int gpio_flash_probe(struct platform_device *pdev)
 	i = 0;
 	do {
 		if (gpio_request(state->gpio_addrs[i], DRIVER_NAME)) {
-			pr_devinit(KERN_ERR PFX "failed to request gpio %d\n",
+			dev_err(&pdev->dev, "failed to request gpio %d\n",
 				state->gpio_addrs[i]);
 			while (i--)
 				gpio_free(state->gpio_addrs[i]);
@@ -260,8 +256,8 @@ static int gpio_flash_probe(struct platform_device *pdev)
 		gpio_direction_output(state->gpio_addrs[i], 0);
 	} while (++i < state->gpio_count);
 
-	pr_devinit(KERN_NOTICE PFX "probing %d-bit flash bus\n",
-		state->map.bankwidth * 8);
+	dev_notice(&pdev->dev, "probing %d-bit flash bus\n",
+		   state->map.bankwidth * 8);
 	state->mtd = do_map_probe(memory->name, &state->map);
 	if (!state->mtd) {
 		for (i = 0; i < state->gpio_count; ++i)
-- 
2.18.0
