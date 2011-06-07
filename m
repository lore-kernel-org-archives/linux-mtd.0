Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTwT0-0001Tv-4Q
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 13:37:11 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so3852637wwb.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Jun 2011 06:37:09 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 15/44] mtd: physmap.c: use mtd_device_parse_register
Date: Tue,  7 Jun 2011 17:36:14 +0400
Message-Id: <1307453803-31950-16-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/maps/physmap.c |   23 ++---------------------
 1 files changed, 2 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index 2174d10..256f787 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -27,8 +27,6 @@ struct physmap_flash_info {
 	struct mtd_info		*mtd[MAX_RESOURCES];
 	struct mtd_info		*cmtd;
 	struct map_info		map[MAX_RESOURCES];
-	int			nr_parts;
-	struct mtd_partition	*parts;
 };
 
 static int physmap_flash_remove(struct platform_device *dev)
@@ -46,8 +44,6 @@ static int physmap_flash_remove(struct platform_device *dev)
 
 	if (info->cmtd) {
 		mtd_device_unregister(info->cmtd);
-		if (info->nr_parts)
-			kfree(info->parts);
 		if (info->cmtd != info->mtd[0])
 			mtd_concat_destroy(info->cmtd);
 	}
@@ -175,23 +171,8 @@ static int physmap_flash_probe(struct platform_device *dev)
 	if (err)
 		goto err_out;
 
-	err = parse_mtd_partitions(info->cmtd, part_probe_types,
-				   &info->parts, 0);
-	if (err > 0) {
-		mtd_device_register(info->cmtd, info->parts, err);
-		info->nr_parts = err;
-		return 0;
-	}
-
-	if (physmap_data->nr_parts) {
-		printk(KERN_NOTICE "Using physmap partition information\n");
-		mtd_device_register(info->cmtd, physmap_data->parts,
-				    physmap_data->nr_parts);
-		return 0;
-	}
-
-	mtd_device_register(info->cmtd, NULL, 0);
-
+	mtd_device_parse_register(info->cmtd, part_probe_types, 0,
+			physmap_data->parts, physmap_data->nr_parts);
 	return 0;
 
 err_out:
-- 
1.7.4.4
