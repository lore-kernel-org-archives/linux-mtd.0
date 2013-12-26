Received: from mailout4.samsung.com ([203.254.224.34])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VvzyU-0002Ar-Ca
 for linux-mtd@lists.infradead.org; Thu, 26 Dec 2013 01:42:59 +0000
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MYE00AYU4QZOFA0@mailout4.samsung.com> for
 linux-mtd@lists.infradead.org; Thu, 26 Dec 2013 10:42:35 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
References: <007901cf01db$8362f580$8a28e080$%han@samsung.com>
In-reply-to: <007901cf01db$8362f580$8a28e080$%han@samsung.com>
Subject: [PATCH V3 3/8] mtd: lantiq-flash: Use devm_kzalloc()
Date: Thu, 26 Dec 2013 10:42:34 +0900
Message-id: <007b01cf01db$c0226960$40673c20$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: 'Jingoo Han' <jg1.han@samsung.com>,
 'Thomas Langer' <thomas.langer@lantiq.com>, linux-mtd@lists.infradead.org,
 'Ezequiel Garcia' <ezequiel.garcia@free-electrons.com>,
 'David Woodhouse' <dwmw2@infradead.org>, 'John Crispin' <blogic@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use devm_kzalloc() to make cleanup paths simpler. Also, checking
return value of devm_kzalloc() is added in order to check if the
allocation succeded.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
Change since v2
- Check the return value of devm_kzalloc(), per Ezequiel Garcia.

Change since v1
- Remove unnecessary goto labels, per John Crispin.

 drivers/mtd/maps/lantiq-flash.c |   37 ++++++++++++++++---------------------
 1 file changed, 16 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/maps/lantiq-flash.c b/drivers/mtd/maps/lantiq-flash.c
index d7ac65d..93c507a 100644
--- a/drivers/mtd/maps/lantiq-flash.c
+++ b/drivers/mtd/maps/lantiq-flash.c
@@ -123,24 +123,28 @@ ltq_mtd_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	ltq_mtd = kzalloc(sizeof(struct ltq_mtd), GFP_KERNEL);
+	ltq_mtd = devm_kzalloc(&pdev->dev, sizeof(struct ltq_mtd), GFP_KERNEL);
+	if (!ltq_mtd)
+		return -ENOMEM;
+
 	platform_set_drvdata(pdev, ltq_mtd);
 
 	ltq_mtd->res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!ltq_mtd->res) {
 		dev_err(&pdev->dev, "failed to get memory resource\n");
-		err = -ENOENT;
-		goto err_out;
+		return -ENOENT;
 	}
 
-	ltq_mtd->map = kzalloc(sizeof(struct map_info), GFP_KERNEL);
+	ltq_mtd->map = devm_kzalloc(&pdev->dev, sizeof(struct map_info),
+				    GFP_KERNEL);
+	if (!ltq_mtd->map)
+		return -ENOMEM;
+
 	ltq_mtd->map->phys = ltq_mtd->res->start;
 	ltq_mtd->map->size = resource_size(ltq_mtd->res);
 	ltq_mtd->map->virt = devm_ioremap_resource(&pdev->dev, ltq_mtd->res);
-	if (IS_ERR(ltq_mtd->map->virt)) {
-		err = PTR_ERR(ltq_mtd->map->virt);
-		goto err_out;
-	}
+	if (IS_ERR(ltq_mtd->map->virt))
+		return PTR_ERR(ltq_mtd->map->virt);
 
 	ltq_mtd->map->name = ltq_map_name;
 	ltq_mtd->map->bankwidth = 2;
@@ -155,8 +159,7 @@ ltq_mtd_probe(struct platform_device *pdev)
 
 	if (!ltq_mtd->mtd) {
 		dev_err(&pdev->dev, "probing failed\n");
-		err = -ENXIO;
-		goto err_free;
+		return -ENXIO;
 	}
 
 	ltq_mtd->mtd->owner = THIS_MODULE;
@@ -177,10 +180,6 @@ ltq_mtd_probe(struct platform_device *pdev)
 
 err_destroy:
 	map_destroy(ltq_mtd->mtd);
-err_free:
-	kfree(ltq_mtd->map);
-err_out:
-	kfree(ltq_mtd);
 	return err;
 }
 
@@ -189,13 +188,9 @@ ltq_mtd_remove(struct platform_device *pdev)
 {
 	struct ltq_mtd *ltq_mtd = platform_get_drvdata(pdev);
 
-	if (ltq_mtd) {
-		if (ltq_mtd->mtd) {
-			mtd_device_unregister(ltq_mtd->mtd);
-			map_destroy(ltq_mtd->mtd);
-		}
-		kfree(ltq_mtd->map);
-		kfree(ltq_mtd);
+	if (ltq_mtd && ltq_mtd->mtd) {
+		mtd_device_unregister(ltq_mtd->mtd);
+		map_destroy(ltq_mtd->mtd);
 	}
 	return 0;
 }
-- 
1.7.10.4
