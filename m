Received: from mailout4.samsung.com ([203.254.224.34])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vtua3-0000yw-Ek
 for linux-mtd@lists.infradead.org; Fri, 20 Dec 2013 07:33:08 +0000
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MY3000KVGYJBXE0@mailout4.samsung.com> for
 linux-mtd@lists.infradead.org; Fri, 20 Dec 2013 16:32:43 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
References: <000d01cefd55$7e48a2a0$7ad9e7e0$%han@samsung.com>
In-reply-to: <000d01cefd55$7e48a2a0$7ad9e7e0$%han@samsung.com>
Subject: [PATCH V2 3/8] mtd: lantiq-flash: Use devm_kzalloc()
Date: Fri, 20 Dec 2013 16:32:41 +0900
Message-id: <001001cefd55$aa828110$ff878330$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: linux-mtd@lists.infradead.org, 'Jingoo Han' <jg1.han@samsung.com>,
 'David Woodhouse' <dwmw2@infradead.org>, 'John Crispin' <blogic@openwrt.org>,
 'Thomas Langer' <thomas.langer@lantiq.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use devm_kzalloc() to make cleanup paths simpler.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
Change since v1
- Remove unnecessary goto labels.

 drivers/mtd/maps/lantiq-flash.c |   31 ++++++++++---------------------
 1 file changed, 10 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/maps/lantiq-flash.c b/drivers/mtd/maps/lantiq-flash.c
index d7ac65d..45a7ac7 100644
--- a/drivers/mtd/maps/lantiq-flash.c
+++ b/drivers/mtd/maps/lantiq-flash.c
@@ -123,24 +123,22 @@ ltq_mtd_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	ltq_mtd = kzalloc(sizeof(struct ltq_mtd), GFP_KERNEL);
+	ltq_mtd = devm_kzalloc(&pdev->dev, sizeof(struct ltq_mtd), GFP_KERNEL);
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
@@ -155,8 +153,7 @@ ltq_mtd_probe(struct platform_device *pdev)
 
 	if (!ltq_mtd->mtd) {
 		dev_err(&pdev->dev, "probing failed\n");
-		err = -ENXIO;
-		goto err_free;
+		return -ENXIO;
 	}
 
 	ltq_mtd->mtd->owner = THIS_MODULE;
@@ -177,10 +174,6 @@ ltq_mtd_probe(struct platform_device *pdev)
 
 err_destroy:
 	map_destroy(ltq_mtd->mtd);
-err_free:
-	kfree(ltq_mtd->map);
-err_out:
-	kfree(ltq_mtd);
 	return err;
 }
 
@@ -189,13 +182,9 @@ ltq_mtd_remove(struct platform_device *pdev)
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
