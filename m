Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTwSv-0001St-55
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 13:37:06 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so3852593wwb.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Jun 2011 06:37:04 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 12/44] mtd: ixp4xx.c: use mtd_device_parse_register
Date: Tue,  7 Jun 2011 17:36:11 +0400
Message-Id: <1307453803-31950-13-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/maps/ixp4xx.c |   29 ++++-------------------------
 1 files changed, 4 insertions(+), 25 deletions(-)

diff --git a/drivers/mtd/maps/ixp4xx.c b/drivers/mtd/maps/ixp4xx.c
index 155b219..3040901 100644
--- a/drivers/mtd/maps/ixp4xx.c
+++ b/drivers/mtd/maps/ixp4xx.c
@@ -145,7 +145,6 @@ static void ixp4xx_write16(struct map_info *map, map_word d, unsigned long adr)
 struct ixp4xx_flash_info {
 	struct mtd_info *mtd;
 	struct map_info map;
-	struct mtd_partition *partitions;
 	struct resource *res;
 };
 
@@ -168,8 +167,6 @@ static int ixp4xx_flash_remove(struct platform_device *dev)
 	if (info->map.virt)
 		iounmap(info->map.virt);
 
-	kfree(info->partitions);
-
 	if (info->res) {
 		release_resource(info->res);
 		kfree(info->res);
@@ -185,8 +182,6 @@ static int ixp4xx_flash_probe(struct platform_device *dev)
 {
 	struct flash_platform_data *plat = dev->dev.platform_data;
 	struct ixp4xx_flash_info *info;
-	const char *part_type = NULL;
-	int nr_parts = 0;
 	int err = -1;
 
 	if (!plat)
@@ -252,28 +247,12 @@ static int ixp4xx_flash_probe(struct platform_device *dev)
 	/* Use the fast version */
 	info->map.write = ixp4xx_write16;
 
-	nr_parts = parse_mtd_partitions(info->mtd, probes, &info->partitions,
-					dev->resource->start);
-	if (nr_parts > 0) {
-		part_type = "dynamic";
-	} else {
-		info->partitions = plat->parts;
-		nr_parts = plat->nr_parts;
-		part_type = "static";
-	}
-	if (nr_parts == 0)
-		printk(KERN_NOTICE "IXP4xx flash: no partition info "
-			"available, registering whole flash\n");
-	else
-		printk(KERN_NOTICE "IXP4xx flash: using %s partition "
-			"definition\n", part_type);
-
-	err = mtd_device_register(info->mtd, info->partitions, nr_parts);
-	if (err)
+	err = mtd_device_parse_register(info->mtd, probes, dev->resource->start,
+			plat->parts, plat->nr_parts);
+	if (err) {
 		printk(KERN_ERR "Could not parse partitions\n");
-
-	if (err)
 		goto Error;
+	}
 
 	return 0;
 
-- 
1.7.4.4
