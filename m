Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QORN0-0002TQ-OD
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:24:16 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so5098499wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:24:14 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 09/62] mtd/pxa: convert to mtd_device_register()
Date: Mon, 23 May 2011 10:22:50 +0100
Message-Id: <1306142623-24952-10-git-send-email-jamie@jamieiles.com>
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

Cc: Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 arch/arm/mach-pxa/Kconfig       |    1 -
 drivers/mtd/maps/Kconfig        |    1 -
 drivers/mtd/maps/pxa2xx-flash.c |   18 ++++--------------
 drivers/mtd/nand/pxa3xx_nand.c  |   13 +++----------
 4 files changed, 7 insertions(+), 26 deletions(-)

diff --git a/arch/arm/mach-pxa/Kconfig b/arch/arm/mach-pxa/Kconfig
index 2fc9f94..cd19309 100644
--- a/arch/arm/mach-pxa/Kconfig
+++ b/arch/arm/mach-pxa/Kconfig
@@ -153,7 +153,6 @@ config MACH_XCEP
 	bool "Iskratel Electronics XCEP"
 	select PXA25x
 	select MTD
-	select MTD_PARTITIONS
 	select MTD_PHYSMAP
 	select MTD_CFI_INTELEXT
 	select MTD_CFI
diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index 5069111..d028cd4 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -161,7 +161,6 @@ config MTD_SBC_GXX
 config MTD_PXA2XX
 	tristate "CFI Flash device mapped on Intel XScale PXA2xx based boards"
 	depends on (PXA25x || PXA27x) && MTD_CFI_INTELEXT
-	select MTD_PARTITIONS
 	help
 	  This provides a driver for the NOR flash attached to a PXA2xx chip.
 
diff --git a/drivers/mtd/maps/pxa2xx-flash.c b/drivers/mtd/maps/pxa2xx-flash.c
index d8ae634..f59d62f 100644
--- a/drivers/mtd/maps/pxa2xx-flash.c
+++ b/drivers/mtd/maps/pxa2xx-flash.c
@@ -104,23 +104,18 @@ static int __devinit pxa2xx_flash_probe(struct platform_device *pdev)
 	}
 	info->mtd->owner = THIS_MODULE;
 
-#ifdef CONFIG_MTD_PARTITIONS
 	ret = parse_mtd_partitions(info->mtd, probes, &parts, 0);
 
 	if (ret > 0) {
 		info->nr_parts = ret;
 		info->parts = parts;
 	}
-#endif
 
-	if (info->nr_parts) {
-		add_mtd_partitions(info->mtd, info->parts,
-				   info->nr_parts);
-	} else {
+	if (!info->nr_parts)
 		printk("Registering %s as whole device\n",
 		       info->map.name);
-		add_mtd_device(info->mtd);
-	}
+
+	mtd_device_register(info->mtd, info->parts, info->nr_parts);
 
 	platform_set_drvdata(pdev, info);
 	return 0;
@@ -132,12 +127,7 @@ static int __devexit pxa2xx_flash_remove(struct platform_device *dev)
 
 	platform_set_drvdata(dev, NULL);
 
-#ifdef CONFIG_MTD_PARTITIONS
-	if (info->nr_parts)
-		del_mtd_partitions(info->mtd);
-	else
-#endif
-		del_mtd_device(info->mtd);
+	mtd_device_unregister(info->mtd);
 
 	map_destroy(info->mtd);
 	iounmap(info->map.virt);
diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index ff07012..1fb3b3a 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1119,10 +1119,7 @@ static int pxa3xx_nand_remove(struct platform_device *pdev)
 	clk_put(info->clk);
 
 	if (mtd) {
-		del_mtd_device(mtd);
-#ifdef CONFIG_MTD_PARTITIONS
-		del_mtd_partitions(mtd);
-#endif
+		mtd_device_unregister(mtd);
 		kfree(mtd);
 	}
 	return 0;
@@ -1149,7 +1146,6 @@ static int pxa3xx_nand_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-#ifdef CONFIG_MTD_PARTITIONS
 	if (mtd_has_cmdlinepart()) {
 		const char *probes[] = { "cmdlinepart", NULL };
 		struct mtd_partition *parts;
@@ -1158,13 +1154,10 @@ static int pxa3xx_nand_probe(struct platform_device *pdev)
 		nr_parts = parse_mtd_partitions(info->mtd, probes, &parts, 0);
 
 		if (nr_parts)
-			return add_mtd_partitions(info->mtd, parts, nr_parts);
+			return mtd_device_register(info->mtd, parts, nr_parts);
 	}
 
-	return add_mtd_partitions(info->mtd, pdata->parts, pdata->nr_parts);
-#else
-	return 0;
-#endif
+	return mtd_device_register(info->mtd, pdata->parts, pdata->nr_parts);
 }
 
 #ifdef CONFIG_PM
-- 
1.7.4.4
