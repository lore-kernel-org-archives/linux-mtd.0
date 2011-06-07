Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTwSt-0001Tv-7i
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 13:37:04 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so3852637wwb.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Jun 2011 06:37:02 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 11/44] mtd: ixp2000.c: use mtd_device_parse_register
Date: Tue,  7 Jun 2011 17:36:10 +0400
Message-Id: <1307453803-31950-12-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/maps/ixp2000.c |   11 +----------
 1 files changed, 1 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/maps/ixp2000.c b/drivers/mtd/maps/ixp2000.c
index c00b917..93bf83d 100644
--- a/drivers/mtd/maps/ixp2000.c
+++ b/drivers/mtd/maps/ixp2000.c
@@ -38,7 +38,6 @@
 struct ixp2000_flash_info {
 	struct		mtd_info *mtd;
 	struct		map_info map;
-	struct		mtd_partition *partitions;
 	struct		resource *res;
 };
 
@@ -125,8 +124,6 @@ static int ixp2000_flash_remove(struct platform_device *dev)
 	if (info->map.map_priv_1)
 		iounmap((void *) info->map.map_priv_1);
 
-	kfree(info->partitions);
-
 	if (info->res) {
 		release_resource(info->res);
 		kfree(info->res);
@@ -228,13 +225,7 @@ static int ixp2000_flash_probe(struct platform_device *dev)
 	}
 	info->mtd->owner = THIS_MODULE;
 
-	err = parse_mtd_partitions(info->mtd, probes, &info->partitions, 0);
-	if (err > 0) {
-		err = mtd_device_register(info->mtd, info->partitions, err);
-		if(err)
-			dev_err(&dev->dev, "Could not parse partitions\n");
-	}
-
+	err = mtd_device_parse_register(info->mtd, probes, 0, NULL, 0);
 	if (err)
 		goto Error;
 
-- 
1.7.4.4
