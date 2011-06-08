Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QULGy-0007CU-8v
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 16:06:25 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so630582wyb.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 09:06:23 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 17/43] mtd: rbtx4939-flash.c: use mtd_device_parse_register
Date: Wed,  8 Jun 2011 20:05:26 +0400
Message-Id: <1307549152-7085-18-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307549152-7085-1-git-send-email-dbaryshkov@gmail.com>
References: <1307549152-7085-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Russell King <linux@arm.linux.org.uk>, dedekind1@gmail.com
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
 drivers/mtd/maps/rbtx4939-flash.c |   21 ++++-----------------
 1 files changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/maps/rbtx4939-flash.c b/drivers/mtd/maps/rbtx4939-flash.c
index 5d15b6b..0237f19 100644
--- a/drivers/mtd/maps/rbtx4939-flash.c
+++ b/drivers/mtd/maps/rbtx4939-flash.c
@@ -25,8 +25,6 @@
 struct rbtx4939_flash_info {
 	struct mtd_info *mtd;
 	struct map_info map;
-	int nr_parts;
-	struct mtd_partition *parts;
 };
 
 static int rbtx4939_flash_remove(struct platform_device *dev)
@@ -41,8 +39,6 @@ static int rbtx4939_flash_remove(struct platform_device *dev)
 	if (info->mtd) {
 		struct rbtx4939_flash_data *pdata = dev->dev.platform_data;
 
-		if (info->nr_parts)
-			kfree(info->parts);
 		mtd_device_unregister(info->mtd);
 		map_destroy(info->mtd);
 	}
@@ -106,20 +102,11 @@ static int rbtx4939_flash_probe(struct platform_device *dev)
 	info->mtd->owner = THIS_MODULE;
 	if (err)
 		goto err_out;
-	err = parse_mtd_partitions(info->mtd, NULL, &info->parts, 0);
-	if (err > 0) {
-		mtd_device_register(info->mtd, info->parts, err);
-		info->nr_parts = err;
-		return 0;
-	}
+	err = mtd_device_parse_register(info->mtd, NULL, 0,
+			pdata->parts, pdata->nr_parts);
 
-	if (pdata->nr_parts) {
-		pr_notice("Using rbtx4939 partition information\n");
-		mtd_device_register(info->mtd, pdata->parts, pdata->nr_parts);
-		return 0;
-	}
-
-	mtd_device_register(info->mtd, NULL, 0);
+	if (err)
+		goto err_out;
 	return 0;
 
 err_out:
-- 
1.7.4.4
