Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTwT3-0001Ql-De
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 13:37:14 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so4898925wyb.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Jun 2011 06:37:13 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 17/44] mtd: pxa2xx-flash.c: use mtd_device_parse_register
Date: Tue,  7 Jun 2011 17:36:16 +0400
Message-Id: <1307453803-31950-18-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307453803-31950-1-git-send-email-dbaryshkov@gmail.com>
References: <1307453803-31950-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Replace custom invocations of parse_mtd_partitions and mtd_device_register
with common mtd_device_parse_register call. This would bring: standard
handling of all errors, fallback to default partitions, etc.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/maps/pxa2xx-flash.c |   20 +-------------------
 1 files changed, 1 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/maps/pxa2xx-flash.c b/drivers/mtd/maps/pxa2xx-flash.c
index f59d62f..8fb8198 100644
--- a/drivers/mtd/maps/pxa2xx-flash.c
+++ b/drivers/mtd/maps/pxa2xx-flash.c
@@ -41,8 +41,6 @@ static void pxa2xx_map_inval_cache(struct map_info *map, unsigned long from,
 }
 
 struct pxa2xx_flash_info {
-	struct mtd_partition	*parts;
-	int			nr_parts;
 	struct mtd_info		*mtd;
 	struct map_info		map;
 };
@@ -55,9 +53,7 @@ static int __devinit pxa2xx_flash_probe(struct platform_device *pdev)
 {
 	struct flash_platform_data *flash = pdev->dev.platform_data;
 	struct pxa2xx_flash_info *info;
-	struct mtd_partition *parts;
 	struct resource *res;
-	int ret = 0;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res)
@@ -71,8 +67,6 @@ static int __devinit pxa2xx_flash_probe(struct platform_device *pdev)
 	info->map.bankwidth = flash->width;
 	info->map.phys = res->start;
 	info->map.size = res->end - res->start + 1;
-	info->parts = flash->parts;
-	info->nr_parts = flash->nr_parts;
 
 	info->map.virt = ioremap(info->map.phys, info->map.size);
 	if (!info->map.virt) {
@@ -104,18 +98,7 @@ static int __devinit pxa2xx_flash_probe(struct platform_device *pdev)
 	}
 	info->mtd->owner = THIS_MODULE;
 
-	ret = parse_mtd_partitions(info->mtd, probes, &parts, 0);
-
-	if (ret > 0) {
-		info->nr_parts = ret;
-		info->parts = parts;
-	}
-
-	if (!info->nr_parts)
-		printk("Registering %s as whole device\n",
-		       info->map.name);
-
-	mtd_device_register(info->mtd, info->parts, info->nr_parts);
+	mtd_device_parse_register(info->mtd, probes, 0, NULL, 0);
 
 	platform_set_drvdata(pdev, info);
 	return 0;
@@ -133,7 +116,6 @@ static int __devexit pxa2xx_flash_remove(struct platform_device *dev)
 	iounmap(info->map.virt);
 	if (info->map.cached)
 		iounmap(info->map.cached);
-	kfree(info->parts);
 	kfree(info);
 	return 0;
 }
-- 
1.7.4.4
