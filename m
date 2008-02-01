Received: from moutng.kundenserver.de ([212.227.126.171])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JKwwV-0005fj-Uw
	for linux-mtd@lists.infradead.org; Fri, 01 Feb 2008 14:32:42 +0000
From: Stefan Roese <sr@denx.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: physmap.c: Add support for multiple resources
Date: Fri,  1 Feb 2008 15:26:54 +0100
Message-Id: <1201876014-18627-1-git-send-email-sr@denx.de>
Cc: avorontsov@ru.mvista.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch extends the physmap mapping driver to support multiple
resources for non-identical NOR chips that will be concatenated together
when selected.

This is needed for example for Intel 48F4400 512MBit chips, since they
consist of 2 single different NOR chips with different geometries. The
first (lower) one has botton boot sectors and the 2nd (upper) has top
boot sectors. This currently isn't handled correctly by calling the
physmap driver once with only one resource covering both chips in one
memory region. The same geometrie is used for both chips.

With this patch the following resource structure can be used to
describe the 48F4400 chip correctly:

static struct resource board_nor_resource[] = {
	[0] = {
		.start = 0xf8000000,
		.end = 0xfbffffff,
		.flags = IORESOURCE_MEM,
	},
	[1] = {
		.start = 0xfc000000,
		.end = 0xffffffff,
		.flags = IORESOURCE_MEM,
	}
};

Signed-off-by: Stefan Roese <sr@denx.de>
---
 drivers/mtd/maps/physmap.c |  162 ++++++++++++++++++++++++++++----------------
 1 files changed, 104 insertions(+), 58 deletions(-)

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index 28c5ffd..5a83ae7 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -20,11 +20,15 @@
 #include <linux/mtd/map.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/physmap.h>
+#include <linux/mtd/concat.h>
 #include <asm/io.h>
 
+#define MAX_RESOURCES		4
+
 struct physmap_flash_info {
-	struct mtd_info		*mtd;
-	struct map_info		map;
+	struct mtd_info		*mtd[MAX_RESOURCES];
+	struct mtd_info		*cmtd;
+	struct map_info		map[MAX_RESOURCES];
 	struct resource		*res;
 #ifdef CONFIG_MTD_PARTITIONS
 	int			nr_parts;
@@ -32,11 +36,11 @@ struct physmap_flash_info {
 #endif
 };
 
-
 static int physmap_flash_remove(struct platform_device *dev)
 {
 	struct physmap_flash_info *info;
 	struct physmap_flash_data *physmap_data;
+	int i;
 
 	info = platform_get_drvdata(dev);
 	if (info == NULL)
@@ -45,24 +49,33 @@ static int physmap_flash_remove(struct platform_device *dev)
 
 	physmap_data = dev->dev.platform_data;
 
-	if (info->mtd != NULL) {
+#ifdef CONFIG_MTD_CONCAT
+	if (info->cmtd != info->mtd[0]) {
+		del_mtd_device(info->cmtd);
+		mtd_concat_destroy(info->cmtd);
+	}
+#endif
+
+	for (i = 0; i < MAX_RESOURCES; i++) {
+		if (info->mtd[i] != NULL) {
 #ifdef CONFIG_MTD_PARTITIONS
-		if (info->nr_parts) {
-			del_mtd_partitions(info->mtd);
-			kfree(info->parts);
-		} else if (physmap_data->nr_parts) {
-			del_mtd_partitions(info->mtd);
-		} else {
-			del_mtd_device(info->mtd);
-		}
+			if (info->nr_parts) {
+				del_mtd_partitions(info->mtd[i]);
+				kfree(info->parts);
+			} else if (physmap_data->nr_parts) {
+				del_mtd_partitions(info->mtd[i]);
+			} else {
+				del_mtd_device(info->mtd[i]);
+			}
 #else
-		del_mtd_device(info->mtd);
+			del_mtd_device(info->mtd[i]);
 #endif
-		map_destroy(info->mtd);
-	}
+			map_destroy(info->mtd[i]);
+		}
 
-	if (info->map.virt != NULL)
-		iounmap(info->map.virt);
+		if (info->map[i].virt != NULL)
+			iounmap(info->map[i].virt);
+	}
 
 	if (info->res != NULL) {
 		release_resource(info->res);
@@ -82,16 +95,14 @@ static int physmap_flash_probe(struct platform_device *dev)
 	struct physmap_flash_data *physmap_data;
 	struct physmap_flash_info *info;
 	const char **probe_type;
-	int err;
+	int err = 0;
+	int i;
+	int devices_found = 0;
 
 	physmap_data = dev->dev.platform_data;
 	if (physmap_data == NULL)
 		return -ENODEV;
 
-       	printk(KERN_NOTICE "physmap platform flash device: %.8llx at %.8llx\n",
-	    (unsigned long long)(dev->resource->end - dev->resource->start + 1),
-	    (unsigned long long)dev->resource->start);
-
 	info = kzalloc(sizeof(struct physmap_flash_info), GFP_KERNEL);
 	if (info == NULL) {
 		err = -ENOMEM;
@@ -100,56 +111,83 @@ static int physmap_flash_probe(struct platform_device *dev)
 
 	platform_set_drvdata(dev, info);
 
-	info->res = request_mem_region(dev->resource->start,
-			dev->resource->end - dev->resource->start + 1,
-			dev->dev.bus_id);
-	if (info->res == NULL) {
-		dev_err(&dev->dev, "Could not reserve memory region\n");
-		err = -ENOMEM;
-		goto err_out;
-	}
+	for (i = 0; i < dev->num_resources; i++) {
+		printk(KERN_NOTICE "physmap platform flash device: %.8llx at %.8llx\n",
+		       (unsigned long long)(dev->resource[i].end - dev->resource[i].start + 1),
+		       (unsigned long long)dev->resource[i].start);
+
+		info->res = request_mem_region(dev->resource[i].start,
+					       dev->resource[i].end - dev->resource[i].start + 1,
+					       dev->dev.bus_id);
+		if (info->res == NULL) {
+			dev_err(&dev->dev, "Could not reserve memory region\n");
+			err = -ENOMEM;
+			goto err_out;
+		}
 
-	info->map.name = dev->dev.bus_id;
-	info->map.phys = dev->resource->start;
-	info->map.size = dev->resource->end - dev->resource->start + 1;
-	info->map.bankwidth = physmap_data->width;
-	info->map.set_vpp = physmap_data->set_vpp;
+		info->map[i].name = dev->dev.bus_id;
+		info->map[i].phys = dev->resource[i].start;
+		info->map[i].size = dev->resource[i].end - dev->resource[i].start + 1;
+		info->map[i].bankwidth = physmap_data->width;
+		info->map[i].set_vpp = physmap_data->set_vpp;
+
+		info->map[i].virt = ioremap(info->map[i].phys, info->map[i].size);
+		if (info->map[i].virt == NULL) {
+			dev_err(&dev->dev, "Failed to ioremap flash region\n");
+			err = EIO;
+			goto err_out;
+		}
 
-	info->map.virt = ioremap(info->map.phys, info->map.size);
-	if (info->map.virt == NULL) {
-		dev_err(&dev->dev, "Failed to ioremap flash region\n");
-		err = EIO;
-		goto err_out;
-	}
+		simple_map_init(&info->map[i]);
 
-	simple_map_init(&info->map);
+		probe_type = rom_probe_types;
+		for (; info->mtd[i] == NULL && *probe_type != NULL; probe_type++)
+			info->mtd[i] = do_map_probe(*probe_type, &info->map[i]);
+		if (info->mtd[i] == NULL) {
+			dev_err(&dev->dev, "map_probe failed\n");
+			err = -ENXIO;
+			goto err_out;
+		} else {
+			devices_found++;
+		}
+		info->mtd[i]->owner = THIS_MODULE;
+	}
 
-	probe_type = rom_probe_types;
-	for (; info->mtd == NULL && *probe_type != NULL; probe_type++)
-		info->mtd = do_map_probe(*probe_type, &info->map);
-	if (info->mtd == NULL) {
-		dev_err(&dev->dev, "map_probe failed\n");
+	if (devices_found == 1) {
+		info->cmtd = info->mtd[0];
+	} else if (devices_found > 1) {
+		/*
+		 * We detected multiple devices. Concatenate them together.
+		 */
+#ifdef CONFIG_MTD_CONCAT
+		info->cmtd = mtd_concat_create(info->mtd, devices_found, dev->dev.bus_id);
+		if (info->cmtd == NULL)
+			err = -ENXIO;
+#else
+		printk(KERN_ERR "physmap-flash: multiple devices "
+		       "found but MTD concat support disabled.\n");
 		err = -ENXIO;
-		goto err_out;
+#endif
 	}
-	info->mtd->owner = THIS_MODULE;
+	if (err)
+		goto err_out;
 
 #ifdef CONFIG_MTD_PARTITIONS
-	err = parse_mtd_partitions(info->mtd, part_probe_types, &info->parts, 0);
+	err = parse_mtd_partitions(info->cmtd, part_probe_types, &info->parts, 0);
 	if (err > 0) {
-		add_mtd_partitions(info->mtd, info->parts, err);
+		add_mtd_partitions(info->cmtd, info->parts, err);
 		return 0;
 	}
 
 	if (physmap_data->nr_parts) {
 		printk(KERN_NOTICE "Using physmap partition information\n");
-		add_mtd_partitions(info->mtd, physmap_data->parts,
-						physmap_data->nr_parts);
+		add_mtd_partitions(info->cmtd, physmap_data->parts,
+				   physmap_data->nr_parts);
 		return 0;
 	}
 #endif
 
-	add_mtd_device(info->mtd);
+	add_mtd_device(info->cmtd);
 	return 0;
 
 err_out:
@@ -162,9 +200,11 @@ static int physmap_flash_suspend(struct platform_device *dev, pm_message_t state
 {
 	struct physmap_flash_info *info = platform_get_drvdata(dev);
 	int ret = 0;
+	int i;
 
 	if (info)
-		ret = info->mtd->suspend(info->mtd);
+		for (i = 0; i < MAX_RESOURCES; i++)
+			ret |= info->mtd[i].suspend(info->mtd[i]);
 
 	return ret;
 }
@@ -172,16 +212,22 @@ static int physmap_flash_suspend(struct platform_device *dev, pm_message_t state
 static int physmap_flash_resume(struct platform_device *dev)
 {
 	struct physmap_flash_info *info = platform_get_drvdata(dev);
+	int i;
+
 	if (info)
-		info->mtd->resume(info->mtd);
+		for (i = 0; i < MAX_RESOURCES; i++)
+			info->mtd[i].resume(info->mtd[i]);
 	return 0;
 }
 
 static void physmap_flash_shutdown(struct platform_device *dev)
 {
 	struct physmap_flash_info *info = platform_get_drvdata(dev);
-	if (info && info->mtd->suspend(info->mtd) == 0)
-		info->mtd->resume(info->mtd);
+	int i;
+
+	for (i = 0; i < MAX_RESOURCES; i++)
+		if (info && info->mtd[i].suspend(info->mtd[i]) == 0)
+			info->mtd[i].resume(info->mtd[i]);
 }
 #endif
 
-- 
1.5.4.rc5
