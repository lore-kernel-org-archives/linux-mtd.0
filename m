Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QULH0-0007CU-3N
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 16:06:27 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so630582wyb.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 09:06:25 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 18/43] mtd: sa1100-flash.c: use mtd_device_parse_register
Date: Wed,  8 Jun 2011 20:05:27 +0400
Message-Id: <1307549152-7085-19-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/maps/sa1100-flash.c |   30 +++---------------------------
 1 files changed, 3 insertions(+), 27 deletions(-)

diff --git a/drivers/mtd/maps/sa1100-flash.c b/drivers/mtd/maps/sa1100-flash.c
index a9b5e0e..fa9c0a9 100644
--- a/drivers/mtd/maps/sa1100-flash.c
+++ b/drivers/mtd/maps/sa1100-flash.c
@@ -131,10 +131,8 @@ struct sa_subdev_info {
 };
 
 struct sa_info {
-	struct mtd_partition	*parts;
 	struct mtd_info		*mtd;
 	int			num_subdev;
-	unsigned int		nr_parts;
 	struct sa_subdev_info	subdev[0];
 };
 
@@ -231,8 +229,6 @@ static void sa1100_destroy(struct sa_info *info, struct flash_platform_data *pla
 			mtd_concat_destroy(info->mtd);
 	}
 
-	kfree(info->parts);
-
 	for (i = info->num_subdev - 1; i >= 0; i--)
 		sa1100_destroy_subdev(&info->subdev[i]);
 	kfree(info);
@@ -341,10 +337,8 @@ static const char *part_probes[] = { "cmdlinepart", "RedBoot", NULL };
 static int __devinit sa1100_mtd_probe(struct platform_device *pdev)
 {
 	struct flash_platform_data *plat = pdev->dev.platform_data;
-	struct mtd_partition *parts;
-	const char *part_type = NULL;
 	struct sa_info *info;
-	int err, nr_parts = 0;
+	int err;
 
 	if (!plat)
 		return -ENODEV;
@@ -358,26 +352,8 @@ static int __devinit sa1100_mtd_probe(struct platform_device *pdev)
 	/*
 	 * Partition selection stuff.
 	 */
-	nr_parts = parse_mtd_partitions(info->mtd, part_probes, &parts, 0);
-	if (nr_parts > 0) {
-		info->parts = parts;
-		part_type = "dynamic";
-	} else {
-		parts = plat->parts;
-		nr_parts = plat->nr_parts;
-		part_type = "static";
-	}
-
-	if (nr_parts == 0)
-		printk(KERN_NOTICE "SA1100 flash: no partition info "
-			"available, registering whole flash\n");
-	else
-		printk(KERN_NOTICE "SA1100 flash: using %s partition "
-			"definition\n", part_type);
-
-	mtd_device_register(info->mtd, parts, nr_parts);
-
-	info->nr_parts = nr_parts;
+	mtd_device_parse_register(info->mtd, part_probes, 0,
+			plat->parts, plat->nr_parts);
 
 	platform_set_drvdata(pdev, info);
 	err = 0;
-- 
1.7.4.4
