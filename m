Received: from mail.ispras.ru ([83.149.199.45])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZJ2f0-0000QT-5j
 for linux-mtd@lists.infradead.org; Sat, 25 Jul 2015 16:50:57 +0000
From: Alexey Khoroshilov <khoroshilov@ispras.ru>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Mike Frysinger <vapier@gentoo.org>
Cc: Alexey Khoroshilov <khoroshilov@ispras.ru>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org
Subject: [PATCH] mtd: gpio-addr-flash: add missing iounmap in probe/remove
Date: Sat, 25 Jul 2015 23:49:23 +0700
Message-Id: <1437842963-8107-1-git-send-email-khoroshilov@ispras.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There is no iounmap(state->map.virt) in gpio_flash_remove() and
in gpio_flash_probe() error handling code.

By the way the patch adds checks for error code of ioremap() and
mtd_device_parse_register().

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Alexey Khoroshilov <khoroshilov@ispras.ru>
---
 drivers/mtd/maps/gpio-addr-flash.c | 35 +++++++++++++++++++++++++++--------
 1 file changed, 27 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/maps/gpio-addr-flash.c b/drivers/mtd/maps/gpio-addr-flash.c
index 2fb346091af2..6b9e47d65f08 100644
--- a/drivers/mtd/maps/gpio-addr-flash.c
+++ b/drivers/mtd/maps/gpio-addr-flash.c
@@ -208,6 +208,7 @@ static int gpio_flash_probe(struct platform_device *pdev)
 	struct resource *memory;
 	struct resource *gpios;
 	struct async_state *state;
+	int ret;
 
 	pdata = dev_get_platdata(&pdev->dev);
 	memory = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -242,6 +243,11 @@ static int gpio_flash_probe(struct platform_device *pdev)
 	state->map.phys       = NO_XIP;
 	state->map.map_priv_1 = (unsigned long)state;
 
+	if (!state->map.virt) {
+		ret = -ENODEV;
+		goto err_ioremap;
+	}
+
 	platform_set_drvdata(pdev, state);
 
 	i = 0;
@@ -251,8 +257,8 @@ static int gpio_flash_probe(struct platform_device *pdev)
 				state->gpio_addrs[i]);
 			while (i--)
 				gpio_free(state->gpio_addrs[i]);
-			kfree(state);
-			return -EBUSY;
+			ret = -EBUSY;
+			goto err_gpio;
 		}
 		gpio_direction_output(state->gpio_addrs[i], 0);
 	} while (++i < state->gpio_count);
@@ -261,28 +267,41 @@ static int gpio_flash_probe(struct platform_device *pdev)
 		state->map.bankwidth * 8);
 	state->mtd = do_map_probe(memory->name, &state->map);
 	if (!state->mtd) {
-		for (i = 0; i < state->gpio_count; ++i)
-			gpio_free(state->gpio_addrs[i]);
-		kfree(state);
-		return -ENXIO;
+		ret = -ENXIO;
+		goto err_mtdmap;
 	}
 
 
-	mtd_device_parse_register(state->mtd, part_probe_types, NULL,
-				  pdata->parts, pdata->nr_parts);
+	ret = mtd_device_parse_register(state->mtd, part_probe_types, NULL,
+					pdata->parts, pdata->nr_parts);
+	if (ret)
+		goto err_mtdreg;
 
 	return 0;
+
+err_mtdreg:
+	map_destroy(state->mtd);
+err_mtdmap:
+	for (i = 0; i < state->gpio_count; ++i)
+		gpio_free(state->gpio_addrs[i]);
+err_gpio:
+	iounmap(state->map.virt);
+err_ioremap:
+	kfree(state);
+	return ret;
 }
 
 static int gpio_flash_remove(struct platform_device *pdev)
 {
 	struct async_state *state = platform_get_drvdata(pdev);
 	size_t i = 0;
+
 	do {
 		gpio_free(state->gpio_addrs[i]);
 	} while (++i < state->gpio_count);
 	mtd_device_unregister(state->mtd);
 	map_destroy(state->mtd);
+	iounmap(state->map.virt);
 	kfree(state);
 	return 0;
 }
-- 
1.9.1
