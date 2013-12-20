Received: from mailout2.samsung.com ([203.254.224.25])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VtsB9-00073f-LB
 for linux-mtd@lists.infradead.org; Fri, 20 Dec 2013 04:59:17 +0000
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MY300CQN9U50X00@mailout2.samsung.com> for
 linux-mtd@lists.infradead.org; Fri, 20 Dec 2013 13:58:53 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
References: <000f01cefd3f$60ef8540$22ce8fc0$%han@samsung.com>
In-reply-to: <000f01cefd3f$60ef8540$22ce8fc0$%han@samsung.com>
Subject: [PATCH 3/8] mtd: lantiq-flash: Use devm_kzalloc()
Date: Fri, 20 Dec 2013 13:58:52 +0900
Message-id: <001201cefd40$2db34260$8919c720$%han@samsung.com>
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
 drivers/mtd/maps/lantiq-flash.c |   17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/maps/lantiq-flash.c b/drivers/mtd/maps/lantiq-flash.c
index d7ac65d..4b197c6 100644
--- a/drivers/mtd/maps/lantiq-flash.c
+++ b/drivers/mtd/maps/lantiq-flash.c
@@ -123,7 +123,7 @@ ltq_mtd_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	ltq_mtd = kzalloc(sizeof(struct ltq_mtd), GFP_KERNEL);
+	ltq_mtd = devm_kzalloc(&pdev->dev, sizeof(struct ltq_mtd), GFP_KERNEL);
 	platform_set_drvdata(pdev, ltq_mtd);
 
 	ltq_mtd->res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -133,7 +133,8 @@ ltq_mtd_probe(struct platform_device *pdev)
 		goto err_out;
 	}
 
-	ltq_mtd->map = kzalloc(sizeof(struct map_info), GFP_KERNEL);
+	ltq_mtd->map = devm_kzalloc(&pdev->dev, sizeof(struct map_info),
+				    GFP_KERNEL);
 	ltq_mtd->map->phys = ltq_mtd->res->start;
 	ltq_mtd->map->size = resource_size(ltq_mtd->res);
 	ltq_mtd->map->virt = devm_ioremap_resource(&pdev->dev, ltq_mtd->res);
@@ -178,9 +179,7 @@ ltq_mtd_probe(struct platform_device *pdev)
 err_destroy:
 	map_destroy(ltq_mtd->mtd);
 err_free:
-	kfree(ltq_mtd->map);
 err_out:
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
