Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTwSy-0001Ql-Iu
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 13:37:09 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so4898925wyb.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Jun 2011 06:37:08 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 14/44] mtd: latch-addr-flash.c: use mtd_device_parse_register
Date: Tue,  7 Jun 2011 17:36:13 +0400
Message-Id: <1307453803-31950-15-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/maps/latch-addr-flash.c |   21 ++-------------------
 1 files changed, 2 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/maps/latch-addr-flash.c b/drivers/mtd/maps/latch-addr-flash.c
index 09cf704..119baa7 100644
--- a/drivers/mtd/maps/latch-addr-flash.c
+++ b/drivers/mtd/maps/latch-addr-flash.c
@@ -33,9 +33,6 @@ struct latch_addr_flash_info {
 	/* cache; could be found out of res */
 	unsigned long		win_mask;
 
-	int			nr_parts;
-	struct mtd_partition	*parts;
-
 	spinlock_t		lock;
 };
 
@@ -110,8 +107,6 @@ static int latch_addr_flash_remove(struct platform_device *dev)
 	latch_addr_data = dev->dev.platform_data;
 
 	if (info->mtd != NULL) {
-		if (info->nr_parts)
-			kfree(info->parts);
 		mtd_device_unregister(info->mtd);
 		map_destroy(info->mtd);
 	}
@@ -204,20 +199,8 @@ static int __devinit latch_addr_flash_probe(struct platform_device *dev)
 	}
 	info->mtd->owner = THIS_MODULE;
 
-	err = parse_mtd_partitions(info->mtd, NULL, &info->parts, 0);
-	if (err > 0) {
-		mtd_device_register(info->mtd, info->parts, err);
-		return 0;
-	}
-	if (latch_addr_data->nr_parts) {
-		pr_notice("Using latch-addr-flash partition information\n");
-		mtd_device_register(info->mtd,
-				    latch_addr_data->parts,
-				    latch_addr_data->nr_parts);
-		return 0;
-	}
-
-	mtd_device_register(info->mtd, NULL, 0);
+	mtd_device_parse_register(info->mtd, NULL, 0,
+			latch_addr_data->parts, latch_addr_data->nr_parts);
 	return 0;
 
 iounmap:
-- 
1.7.4.4
