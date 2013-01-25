Received: from mail.free-electrons.com ([94.23.35.102])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Tykca-00049p-7w
 for linux-mtd@lists.infradead.org; Fri, 25 Jan 2013 14:51:14 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/2] mtd: physmap_of: Convert to devm_ioremap_resource()
Date: Fri, 25 Jan 2013 11:50:28 -0300
Message-Id: <1359125428-23801-3-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1359125428-23801-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1359125428-23801-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: thierry.reding@avionic-design.de, dwmw2@infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Convert non managed request_mem_region() and ioremap()
to its managed counterpart, using devm_ioremap_resource()
to perform both request and ioremap actions.
Tested by compilation only.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
Instead of converting to devm_request_mem_region() and devm_ioremap(),
I just converted to the newest devm_ioremap_resource().

I can't test this patch for the moment.
If anyone can give it a shot and add its Tested-by, it'll be appreciated.

Depends on: https://patchwork.kernel.org/patch/2010191/

 drivers/mtd/maps/physmap_of.c |   36 +++++++++---------------------------
 1 files changed, 9 insertions(+), 27 deletions(-)

diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index c69e5c4..76cbfb5 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -17,6 +17,7 @@
 #include <linux/types.h>
 #include <linux/init.h>
 #include <linux/device.h>
+#include <linux/err.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/map.h>
 #include <linux/mtd/partitions.h>
@@ -29,7 +30,6 @@
 struct of_flash_list {
 	struct mtd_info *mtd;
 	struct map_info map;
-	struct resource *res;
 };
 
 struct of_flash {
@@ -56,18 +56,9 @@ static int of_flash_remove(struct platform_device *dev)
 	if (info->cmtd)
 		mtd_device_unregister(info->cmtd);
 
-	for (i = 0; i < info->list_size; i++) {
+	for (i = 0; i < info->list_size; i++)
 		if (info->list[i].mtd)
 			map_destroy(info->list[i].mtd);
-
-		if (info->list[i].map.virt)
-			iounmap(info->list[i].map.virt);
-
-		if (info->list[i].res) {
-			release_resource(info->list[i].res);
-			kfree(info->list[i].res);
-		}
-	}
 	return 0;
 }
 
@@ -164,7 +155,6 @@ static int of_flash_probe(struct platform_device *dev)
 	const __be32 *p;
 	int reg_tuple_size;
 	struct mtd_info **mtd_list = NULL;
-	resource_size_t res_size;
 	struct mtd_part_parser_data ppdata;
 	bool map_indirect;
 	const char *mtd_name;
@@ -209,6 +199,7 @@ static int of_flash_probe(struct platform_device *dev)
 		goto err_flash_remove;
 
 	for (i = 0; i < count; i++) {
+		void __iomem *virt;
 		err = -ENXIO;
 		if (of_address_to_resource(dp, i, &res)) {
 			/*
@@ -220,12 +211,11 @@ static int of_flash_probe(struct platform_device *dev)
 
 		dev_dbg(&dev->dev, "of_flash device: %pR\n", &res);
 
-		err = -EBUSY;
-		res_size = resource_size(&res);
-		info->list[i].res = request_mem_region(res.start, res_size,
-						       dev_name(&dev->dev));
-		if (!info->list[i].res)
+		virt = devm_ioremap_resource(&dev->dev, &res);
+		if (IS_ERR(virt)) {
+			err = PTR_ERR(virt);
 			goto err_out;
+		}
 
 		err = -ENXIO;
 		width = of_get_property(dp, "bank-width", NULL);
@@ -237,17 +227,9 @@ static int of_flash_probe(struct platform_device *dev)
 
 		info->list[i].map.name = mtd_name ?: dev_name(&dev->dev);
 		info->list[i].map.phys = res.start;
-		info->list[i].map.size = res_size;
+		info->list[i].map.size = resource_size(&res);
 		info->list[i].map.bankwidth = be32_to_cpup(width);
-
-		err = -ENOMEM;
-		info->list[i].map.virt = ioremap(info->list[i].map.phys,
-						 info->list[i].map.size);
-		if (!info->list[i].map.virt) {
-			dev_err(&dev->dev, "Failed to ioremap() flash"
-				" region\n");
-			goto err_out;
-		}
+		info->list[i].map.virt = virt;
 
 		simple_map_init(&info->list[i].map);
 
-- 
1.7.8.6
