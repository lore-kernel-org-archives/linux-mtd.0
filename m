Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUg8u-0007V5-Pc
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 14:23:29 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so1305416wwb.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 09 Jun 2011 07:23:28 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 11/17] mtd: physmap_of.c: use mtd_device_parse_register
Date: Thu,  9 Jun 2011 18:23:01 +0400
Message-Id: <1307629388-24769-13-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307629388-24769-1-git-send-email-dbaryshkov@gmail.com>
References: <1307629388-24769-1-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/maps/physmap_of.c |   18 +++---------------
 1 files changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index c953db3..779b184 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -34,13 +34,10 @@ struct of_flash_list {
 
 struct of_flash {
 	struct mtd_info		*cmtd;
-	struct mtd_partition	*parts;
 	int list_size; /* number of elements in of_flash_list */
 	struct of_flash_list	list[0];
 };
 
-#define OF_FLASH_PARTS(info)	((info)->parts)
-
 static int of_flash_remove(struct platform_device *dev)
 {
 	struct of_flash *info;
@@ -56,11 +53,8 @@ static int of_flash_remove(struct platform_device *dev)
 		mtd_concat_destroy(info->cmtd);
 	}
 
-	if (info->cmtd) {
-		if (OF_FLASH_PARTS(info))
-			kfree(OF_FLASH_PARTS(info));
+	if (info->cmtd)
 		mtd_device_unregister(info->cmtd);
-	}
 
 	for (i = 0; i < info->list_size; i++) {
 		if (info->list[i].mtd)
@@ -289,16 +283,10 @@ static int __devinit of_flash_probe(struct platform_device *dev)
 
 	info->cmtd->node = dp;
 	part_probe_types = of_get_probes(dp);
-	err = parse_mtd_partitions(info->cmtd, part_probe_types,
-				   &info->parts, 0);
-	if (err < 0) {
-		of_free_probes(part_probe_types);
-		goto err_out;
-	}
+	mtd_device_parse_register(info->cmtd, part_probe_types, 0,
+			NULL, 0);
 	of_free_probes(part_probe_types);
 
-	mtd_device_register(info->cmtd, info->parts, err);
-
 	kfree(mtd_list);
 
 	return 0;
-- 
1.7.5.3
