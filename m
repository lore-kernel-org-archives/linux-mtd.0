Received: from hauke-m.de ([2001:41d0:8:b27b::1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bA1Df-0001oA-1r
 for linux-mtd@lists.infradead.org; Mon, 06 Jun 2016 20:33:55 +0000
From: Hauke Mehrtens <hauke@hauke-m.de>
To: dwmw2@infradead.org
Cc: linux-mtd@lists.infradead.org, John Crispin <john@phrozen.org>,
 Hauke Mehrtens <hauke@hauke-m.de>
Subject: [PATCH] MTD: lantiq: handle NO_XIP on cfi0001 flash
Date: Mon,  6 Jun 2016 22:33:24 +0200
Message-Id: <1465245204-13130-1-git-send-email-hauke@hauke-m.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: John Crispin <john@phrozen.org>

This uses the same device tree attribute as physmap_of.c

Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
 drivers/mtd/maps/lantiq-flash.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/lantiq-flash.c b/drivers/mtd/maps/lantiq-flash.c
index c8febb3..ed48d20 100644
--- a/drivers/mtd/maps/lantiq-flash.c
+++ b/drivers/mtd/maps/lantiq-flash.c
@@ -137,7 +137,10 @@ ltq_mtd_probe(struct platform_device *pdev)
 	if (!ltq_mtd->map)
 		return -ENOMEM;
 
-	ltq_mtd->map->phys = ltq_mtd->res->start;
+	if (of_find_property(pdev->dev.of_node, "no-unaligned-direct-access", NULL))
+		ltq_mtd->map->phys = NO_XIP;
+	else
+		ltq_mtd->map->phys = ltq_mtd->res->start;
 	ltq_mtd->map->size = resource_size(ltq_mtd->res);
 	ltq_mtd->map->virt = devm_ioremap_resource(&pdev->dev, ltq_mtd->res);
 	if (IS_ERR(ltq_mtd->map->virt))
-- 
2.8.1
