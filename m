Received: from mail.free-electrons.com ([94.23.35.102])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TykcO-00047J-1h
 for linux-mtd@lists.infradead.org; Fri, 25 Jan 2013 14:51:00 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: physmap: Convert to devm_ioremap_resource()
Date: Fri, 25 Jan 2013 11:50:26 -0300
Message-Id: <1359125428-23801-1-git-send-email-ezequiel.garcia@free-electrons.com>
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

devm_ioremap_resource() provides its own error messages so all explicit
error messages can be removed from the failure code paths.
Tested by compilation only.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
I can't test this patch for the moment.
If anyone can give it a try and add its Tested-by, it'll be appreciated.

Depends on: https://patchwork.kernel.org/patch/2010191/

 drivers/mtd/maps/physmap.c |   21 +++++++--------------
 1 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index 21b0b71..7ca1ae9 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -20,6 +20,7 @@
 #include <linux/mtd/physmap.h>
 #include <linux/mtd/concat.h>
 #include <linux/io.h>
+#include <linux/err.h>
 
 #define MAX_RESOURCES		4
 
@@ -126,19 +127,19 @@ static int physmap_flash_probe(struct platform_device *dev)
 	platform_set_drvdata(dev, info);
 
 	for (i = 0; i < dev->num_resources; i++) {
+		void __iomem *virt;
+
 		printk(KERN_NOTICE "physmap platform flash device: %.8llx at %.8llx\n",
 		       (unsigned long long)resource_size(&dev->resource[i]),
 		       (unsigned long long)dev->resource[i].start);
 
-		if (!devm_request_mem_region(&dev->dev,
-			dev->resource[i].start,
-			resource_size(&dev->resource[i]),
-			dev_name(&dev->dev))) {
-			dev_err(&dev->dev, "Could not reserve memory region\n");
-			err = -ENOMEM;
+		virt = devm_ioremap_resource(&dev->dev, &dev->resource[i]);
+		if (IS_ERR(virt)) {
+			err = PTR_ERR(virt);
 			goto err_out;
 		}
 
+		info->map[i].virt = virt;
 		info->map[i].name = dev_name(&dev->dev);
 		info->map[i].phys = dev->resource[i].start;
 		info->map[i].size = resource_size(&dev->resource[i]);
@@ -147,14 +148,6 @@ static int physmap_flash_probe(struct platform_device *dev)
 		info->map[i].pfow_base = physmap_data->pfow_base;
 		info->map[i].map_priv_1 = (unsigned long)dev;
 
-		info->map[i].virt = devm_ioremap(&dev->dev, info->map[i].phys,
-						 info->map[i].size);
-		if (info->map[i].virt == NULL) {
-			dev_err(&dev->dev, "Failed to ioremap flash region\n");
-			err = -EIO;
-			goto err_out;
-		}
-
 		simple_map_init(&info->map[i]);
 
 		probe_type = rom_probe_types;
-- 
1.7.8.6
