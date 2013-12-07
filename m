Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VpJB0-00080i-6Y
 for linux-mtd@lists.infradead.org; Sat, 07 Dec 2013 14:48:15 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: nand: gpio: Remove unneeded CONFIG_OF
Date: Sat,  7 Dec 2013 11:48:06 -0300
Message-Id: <1386427686-30190-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Alexander Shiyan <shc_work@mail.ru>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Since the of_mtd header provides dummy stubs for !CONFIG_OF, it's safe
to remove the #ifdef CONFIG_OF. Build tested only.

Cc: Alexander Shiyan <shc_work@mail.ru>
Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/gpio.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/gpio.c
index e826f89..8010975 100644
--- a/drivers/mtd/nand/gpio.c
+++ b/drivers/mtd/nand/gpio.c
@@ -94,7 +94,6 @@ static int gpio_nand_devready(struct mtd_info *mtd)
 	return gpio_get_value(gpiomtd->plat.gpio_rdy);
 }
 
-#ifdef CONFIG_OF
 static const struct of_device_id gpio_nand_id_table[] = {
 	{ .compatible = "gpio-control-nand" },
 	{}
@@ -145,19 +144,6 @@ static struct resource *gpio_nand_get_io_sync_of(struct platform_device *pdev)
 
 	return r;
 }
-#else /* CONFIG_OF */
-static inline int gpio_nand_get_config_of(const struct device *dev,
-					  struct gpio_nand_platdata *plat)
-{
-	return -ENOSYS;
-}
-
-static inline struct resource *
-gpio_nand_get_io_sync_of(struct platform_device *pdev)
-{
-	return NULL;
-}
-#endif /* CONFIG_OF */
 
 static inline int gpio_nand_get_config(const struct device *dev,
 				       struct gpio_nand_platdata *plat)
-- 
1.8.1.5
