Received: from mailout1.samsung.com ([203.254.224.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UfSn6-0007wG-W8
 for linux-mtd@lists.infradead.org; Thu, 23 May 2013 10:30:40 +0000
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MN800MZ5YI8REL0@mailout1.samsung.com> for
 linux-mtd@lists.infradead.org; Thu, 23 May 2013 19:30:11 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Artem Bityutskiy' <dedekind1@gmail.com>
Subject: [PATCH] mtd: maps: use platform_{get,set}_drvdata()
Date: Thu, 23 May 2013 19:30:11 +0900
Message-id: <002a01ce57a0$8135e5a0$83a1b0e0$@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: 'David Woodhouse' <dwmw2@infradead.org>, Jingoo Han <jg1.han@samsung.com>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use the wrapper functions for getting and setting the driver data using
platform_device instead of using dev_{get,set}_drvdata() with &pdev->dev,
so we can directly pass a struct platform_device.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/mtd/maps/physmap_of.c |    5 ++---
 drivers/mtd/maps/sun_uflash.c |    4 ++--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index d111097..d7deda9 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -43,10 +43,9 @@ static int of_flash_remove(struct platform_device *dev)
 	struct of_flash *info;
 	int i;
 
-	info = dev_get_drvdata(&dev->dev);
+	info = platform_get_drvdata(dev);
 	if (!info)
 		return 0;
-	dev_set_drvdata(&dev->dev, NULL);
 
 	if (info->cmtd != info->list[0].mtd) {
 		mtd_device_unregister(info->cmtd);
@@ -204,7 +203,7 @@ static int of_flash_probe(struct platform_device *dev)
 	if (!info)
 		goto err_flash_remove;
 
-	dev_set_drvdata(&dev->dev, info);
+	platform_set_drvdata(dev, info);
 
 	mtd_list = kzalloc(sizeof(*mtd_list) * count, GFP_KERNEL);
 	if (!mtd_list)
diff --git a/drivers/mtd/maps/sun_uflash.c b/drivers/mtd/maps/sun_uflash.c
index d467f3b..1cd4037 100644
--- a/drivers/mtd/maps/sun_uflash.c
+++ b/drivers/mtd/maps/sun_uflash.c
@@ -103,7 +103,7 @@ int uflash_devinit(struct platform_device *op, struct device_node *dp)
 
 	mtd_device_register(up->mtd, NULL, 0);
 
-	dev_set_drvdata(&op->dev, up);
+	platform_set_drvdata(op, up);
 
 	return 0;
 }
@@ -123,7 +123,7 @@ static int uflash_probe(struct platform_device *op)
 
 static int uflash_remove(struct platform_device *op)
 {
-	struct uflash_dev *up = dev_get_drvdata(&op->dev);
+	struct uflash_dev *up = platform_get_drvdata(op);
 
 	if (up->mtd) {
 		mtd_device_unregister(up->mtd);
-- 
1.7.10.4
