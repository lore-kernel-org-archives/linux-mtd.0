Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QORNS-0002U4-Dx
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:24:43 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so4359577wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:24:42 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 21/62] mtd/gpio-addr-flash: convert to mtd_device_register()
Date: Mon, 23 May 2011 10:23:02 +0100
Message-Id: <1306142623-24952-22-git-send-email-jamie@jamieiles.com>
In-Reply-To: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
References: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
Cc: Jamie Iles <jamie@jamieiles.com>, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Convert to mtd_device_register() and remove the CONFIG_MTD_PARTITIONS
preprocessor conditionals as partitioning is always available.

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 drivers/mtd/maps/Kconfig           |    1 -
 drivers/mtd/maps/gpio-addr-flash.c |   27 ++++++++++-----------------
 2 files changed, 10 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index fd6e8cd..049a549 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -471,7 +471,6 @@ config MTD_GPIO_ADDR
 	tristate "GPIO-assisted Flash Chip Support"
 	depends on GENERIC_GPIO || GPIOLIB
 	depends on MTD_COMPLEX_MAPPINGS
-	select MTD_PARTITIONS
 	help
 	  Map driver which allows flashes to be partially physically addressed
 	  and assisted by GPIOs.
diff --git a/drivers/mtd/maps/gpio-addr-flash.c b/drivers/mtd/maps/gpio-addr-flash.c
index af5707a..7568c5f 100644
--- a/drivers/mtd/maps/gpio-addr-flash.c
+++ b/drivers/mtd/maps/gpio-addr-flash.c
@@ -155,9 +155,7 @@ static void gf_copy_to(struct map_info *map, unsigned long to, const void *from,
 	memcpy_toio(map->virt + (to % state->win_size), from, len);
 }
 
-#ifdef CONFIG_MTD_PARTITIONS
 static const char *part_probe_types[] = { "cmdlinepart", "RedBoot", NULL };
-#endif
 
 /**
  * gpio_flash_probe() - setup a mapping for a GPIO assisted flash
@@ -189,7 +187,7 @@ static const char *part_probe_types[] = { "cmdlinepart", "RedBoot", NULL };
  */
 static int __devinit gpio_flash_probe(struct platform_device *pdev)
 {
-	int ret;
+	int nr_parts;
 	size_t i, arr_size;
 	struct physmap_flash_data *pdata;
 	struct resource *memory;
@@ -254,24 +252,21 @@ static int __devinit gpio_flash_probe(struct platform_device *pdev)
 		return -ENXIO;
 	}
 
-#ifdef CONFIG_MTD_PARTITIONS
-	ret = parse_mtd_partitions(state->mtd, part_probe_types, &pdata->parts, 0);
-	if (ret > 0) {
+	nr_parts = parse_mtd_partitions(state->mtd, part_probe_types,
+					&pdata->parts, 0);
+	if (nr_parts > 0) {
 		pr_devinit(KERN_NOTICE PFX "Using commandline partition definition\n");
-		add_mtd_partitions(state->mtd, pdata->parts, ret);
 		kfree(pdata->parts);
-
 	} else if (pdata->nr_parts) {
 		pr_devinit(KERN_NOTICE PFX "Using board partition definition\n");
-		add_mtd_partitions(state->mtd, pdata->parts, pdata->nr_parts);
-
-	} else
-#endif
-	{
+		nr_parts = pdata->nr_parts;
+	} else {
 		pr_devinit(KERN_NOTICE PFX "no partition info available, registering whole flash at once\n");
-		add_mtd_device(state->mtd);
+		nr_parts = 0;
 	}
 
+	mtd_device_register(state->mtd, pdata->parts, nr_parts);
+
 	return 0;
 }
 
@@ -282,9 +277,7 @@ static int __devexit gpio_flash_remove(struct platform_device *pdev)
 	do {
 		gpio_free(state->gpio_addrs[i]);
 	} while (++i < state->gpio_count);
-#ifdef CONFIG_MTD_PARTITIONS
-	del_mtd_partitions(state->mtd);
-#endif
+	mtd_device_unregister(state->mtd);
 	map_destroy(state->mtd);
 	kfree(state);
 	return 0;
-- 
1.7.4.4
