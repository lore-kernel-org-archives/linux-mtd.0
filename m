Received: from mailout4.samsung.com ([203.254.224.34])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VyuIK-0005Bg-3b
 for linux-mtd@lists.infradead.org; Fri, 03 Jan 2014 02:15:30 +0000
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MYS00C10ZL4J7C0@mailout4.samsung.com> for
 linux-mtd@lists.infradead.org; Fri, 03 Jan 2014 11:15:04 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
Subject: [PATCH V4 1/2] mtd: ixp4xx: Use devm_*() functions
Date: Fri, 03 Jan 2014 11:15:04 +0900
Message-id: <000601cf0829$9d53a620$d7faf260$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: linux-mtd@lists.infradead.org, 'Jingoo Han' <jg1.han@samsung.com>,
 'David Woodhouse' <dwmw2@infradead.org>,
 'Marc Kleine-Budde' <mkl@blackshift.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use devm_*() functions to make cleanup paths simpler.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
Change since v3
- Include err.h in order to prevent possible build errors.

 drivers/mtd/maps/ixp4xx.c |   28 ++++++----------------------
 1 file changed, 6 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/maps/ixp4xx.c b/drivers/mtd/maps/ixp4xx.c
index 10debfe..d6b2451 100644
--- a/drivers/mtd/maps/ixp4xx.c
+++ b/drivers/mtd/maps/ixp4xx.c
@@ -13,6 +13,7 @@
  *
  */
 
+#include <linux/err.h>
 #include <linux/module.h>
 #include <linux/types.h>
 #include <linux/init.h>
@@ -162,13 +163,6 @@ static int ixp4xx_flash_remove(struct platform_device *dev)
 		mtd_device_unregister(info->mtd);
 		map_destroy(info->mtd);
 	}
-	if (info->map.virt)
-		iounmap(info->map.virt);
-
-	if (info->res) {
-		release_resource(info->res);
-		kfree(info->res);
-	}
 
 	if (plat->exit)
 		plat->exit();
@@ -194,7 +188,8 @@ static int ixp4xx_flash_probe(struct platform_device *dev)
 			return err;
 	}
 
-	info = kzalloc(sizeof(struct ixp4xx_flash_info), GFP_KERNEL);
+	info = devm_kzalloc(&dev->dev, sizeof(struct ixp4xx_flash_info),
+			    GFP_KERNEL);
 	if(!info) {
 		err = -ENOMEM;
 		goto Error;
@@ -220,20 +215,9 @@ static int ixp4xx_flash_probe(struct platform_device *dev)
 	info->map.write = ixp4xx_probe_write16;
 	info->map.copy_from = ixp4xx_copy_from;
 
-	info->res = request_mem_region(dev->resource->start,
-			resource_size(dev->resource),
-			"IXP4XXFlash");
-	if (!info->res) {
-		printk(KERN_ERR "IXP4XXFlash: Could not reserve memory region\n");
-		err = -ENOMEM;
-		goto Error;
-	}
-
-	info->map.virt = ioremap(dev->resource->start,
-				 resource_size(dev->resource));
-	if (!info->map.virt) {
-		printk(KERN_ERR "IXP4XXFlash: Failed to ioremap region\n");
-		err = -EIO;
+	info->map.virt = devm_ioremap_resource(&dev->dev, dev->resource);
+	if (IS_ERR(info->map.virt)) {
+		err = PTR_ERR(info->map.virt);
 		goto Error;
 	}
 
-- 
1.7.10.4
