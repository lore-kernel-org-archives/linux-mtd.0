Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTwT1-0001Qj-P9
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 13:37:12 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so4898888wyb.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Jun 2011 06:37:11 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 16/44] mtd: plat-ram.c: use mtd_device_parse_register
Date: Tue,  7 Jun 2011 17:36:15 +0400
Message-Id: <1307453803-31950-17-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307453803-31950-1-git-send-email-dbaryshkov@gmail.com>
References: <1307453803-31950-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Replace custom invocations of parse_mtd_partitions and mtd_device_register
with common mtd_device_parse_register call. This would bring: standard
handling of all errors, fallback to default partitions, etc.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/maps/plat-ram.c |   23 ++---------------------
 1 files changed, 2 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/maps/plat-ram.c b/drivers/mtd/maps/plat-ram.c
index 9ca1ecc..94f5534 100644
--- a/drivers/mtd/maps/plat-ram.c
+++ b/drivers/mtd/maps/plat-ram.c
@@ -44,8 +44,6 @@ struct platram_info {
 	struct device		*dev;
 	struct mtd_info		*mtd;
 	struct map_info		 map;
-	struct mtd_partition	*partitions;
-	bool			free_partitions;
 	struct resource		*area;
 	struct platdata_mtd_ram	*pdata;
 };
@@ -95,10 +93,6 @@ static int platram_remove(struct platform_device *pdev)
 
 	if (info->mtd) {
 		mtd_device_unregister(info->mtd);
-		if (info->partitions) {
-			if (info->free_partitions)
-				kfree(info->partitions);
-		}
 		map_destroy(info->mtd);
 	}
 
@@ -228,21 +222,8 @@ static int platram_probe(struct platform_device *pdev)
 	/* check to see if there are any available partitions, or wether
 	 * to add this device whole */
 
-	if (!pdata->nr_partitions) {
-		/* try to probe using the supplied probe type */
-		if (pdata->probes) {
-			err = parse_mtd_partitions(info->mtd, pdata->probes,
-					   &info->partitions, 0);
-			info->free_partitions = 1;
-			if (err > 0)
-				err = mtd_device_register(info->mtd,
-					info->partitions, err);
-		}
-	}
-	/* use the static mapping */
-	else
-		err = mtd_device_register(info->mtd, pdata->partitions,
-					  pdata->nr_partitions);
+	err = mtd_device_parse_register(info->mtd, pdata->probes, 0,
+			pdata->partitions, pdata->nr_partitions);
 	if (!err)
 		dev_info(&pdev->dev, "registered mtd device\n");
 
-- 
1.7.4.4
