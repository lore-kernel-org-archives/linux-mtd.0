Received: from mailout2.samsung.com ([203.254.224.25])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vts9O-00070F-8b
 for linux-mtd@lists.infradead.org; Fri, 20 Dec 2013 04:57:27 +0000
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MY300C2R9R2HB00@mailout2.samsung.com> for
 linux-mtd@lists.infradead.org; Fri, 20 Dec 2013 13:57:02 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
References: <000f01cefd3f$60ef8540$22ce8fc0$%han@samsung.com>
In-reply-to: <000f01cefd3f$60ef8540$22ce8fc0$%han@samsung.com>
Subject: [PATCH 2/8] mtd: ixp4xx: Use devm_*() functions
Date: Fri, 20 Dec 2013 13:56:58 +0900
Message-id: <001101cefd3f$e99a17c0$bcce4740$%han@samsung.com>
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
 drivers/mtd/maps/ixp4xx.c |   27 +++++----------------------
 1 file changed, 5 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/maps/ixp4xx.c b/drivers/mtd/maps/ixp4xx.c
index 10debfe..5f42916 100644
--- a/drivers/mtd/maps/ixp4xx.c
+++ b/drivers/mtd/maps/ixp4xx.c
@@ -162,13 +162,6 @@ static int ixp4xx_flash_remove(struct platform_device *dev)
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
@@ -194,7 +187,8 @@ static int ixp4xx_flash_probe(struct platform_device *dev)
 			return err;
 	}
 
-	info = kzalloc(sizeof(struct ixp4xx_flash_info), GFP_KERNEL);
+	info = devm_kzalloc(&dev->dev, sizeof(struct ixp4xx_flash_info),
+			    GFP_KERNEL);
 	if(!info) {
 		err = -ENOMEM;
 		goto Error;
@@ -220,20 +214,9 @@ static int ixp4xx_flash_probe(struct platform_device *dev)
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
