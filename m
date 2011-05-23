Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QORNg-0002TB-BM
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:24:57 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so5098469wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:24:56 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 27/62] mtd/rbtx4939-flash: convert to mtd_device_register()
Date: Mon, 23 May 2011 10:23:08 +0100
Message-Id: <1306142623-24952-28-git-send-email-jamie@jamieiles.com>
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
 drivers/mtd/maps/rbtx4939-flash.c |   24 +++++-------------------
 1 files changed, 5 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/maps/rbtx4939-flash.c b/drivers/mtd/maps/rbtx4939-flash.c
index 83ed645..761fb45 100644
--- a/drivers/mtd/maps/rbtx4939-flash.c
+++ b/drivers/mtd/maps/rbtx4939-flash.c
@@ -25,10 +25,8 @@
 struct rbtx4939_flash_info {
 	struct mtd_info *mtd;
 	struct map_info map;
-#ifdef CONFIG_MTD_PARTITIONS
 	int nr_parts;
 	struct mtd_partition *parts;
-#endif
 };
 
 static int rbtx4939_flash_remove(struct platform_device *dev)
@@ -41,28 +39,18 @@ static int rbtx4939_flash_remove(struct platform_device *dev)
 	platform_set_drvdata(dev, NULL);
 
 	if (info->mtd) {
-#ifdef CONFIG_MTD_PARTITIONS
 		struct rbtx4939_flash_data *pdata = dev->dev.platform_data;
 
-		if (info->nr_parts) {
-			del_mtd_partitions(info->mtd);
+		if (info->nr_parts)
 			kfree(info->parts);
-		} else if (pdata->nr_parts)
-			del_mtd_partitions(info->mtd);
-		else
-			del_mtd_device(info->mtd);
-#else
-		del_mtd_device(info->mtd);
-#endif
+		mtd_device_unregister(info->mtd);
 		map_destroy(info->mtd);
 	}
 	return 0;
 }
 
 static const char *rom_probe_types[] = { "cfi_probe", "jedec_probe", NULL };
-#ifdef CONFIG_MTD_PARTITIONS
 static const char *part_probe_types[] = { "cmdlinepart", NULL };
-#endif
 
 static int rbtx4939_flash_probe(struct platform_device *dev)
 {
@@ -120,23 +108,21 @@ static int rbtx4939_flash_probe(struct platform_device *dev)
 	if (err)
 		goto err_out;
 
-#ifdef CONFIG_MTD_PARTITIONS
 	err = parse_mtd_partitions(info->mtd, part_probe_types,
 				&info->parts, 0);
 	if (err > 0) {
-		add_mtd_partitions(info->mtd, info->parts, err);
+		mtd_device_register(info->mtd, info->parts, err);
 		info->nr_parts = err;
 		return 0;
 	}
 
 	if (pdata->nr_parts) {
 		pr_notice("Using rbtx4939 partition information\n");
-		add_mtd_partitions(info->mtd, pdata->parts, pdata->nr_parts);
+		mtd_device_register(info->mtd, pdata->parts, pdata->nr_parts);
 		return 0;
 	}
-#endif
 
-	add_mtd_device(info->mtd);
+	mtd_device_register(info->mtd, NULL, 0);
 	return 0;
 
 err_out:
-- 
1.7.4.4
