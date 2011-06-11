Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QVXLq-00011e-Vx
	for linux-mtd@lists.infradead.org; Sat, 11 Jun 2011 23:12:24 +0000
Received: by mail-ey0-f177.google.com with SMTP id 6so1530638eyh.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 11 Jun 2011 16:12:22 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 12/18] mtd: physmap_of.c: use mtd_device_parse_register
Date: Sun, 12 Jun 2011 03:11:56 +0400
Message-Id: <1307833922-21602-13-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307833922-21602-1-git-send-email-dbaryshkov@gmail.com>
References: <1307833922-21602-1-git-send-email-dbaryshkov@gmail.com>
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
index 55c4e2e..7d65f9d 100644
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
@@ -290,16 +284,10 @@ static int __devinit of_flash_probe(struct platform_device *dev)
 
 	ppdata.of_node = dp;
 	part_probe_types = of_get_probes(dp);
-	err = parse_mtd_partitions(info->cmtd, part_probe_types,
-				   &info->parts, &ppdata);
-	if (err < 0) {
-		of_free_probes(part_probe_types);
-		goto err_out;
-	}
+	mtd_device_parse_register(info->cmtd, part_probe_types, &ppdata,
+			NULL, 0);
 	of_free_probes(part_probe_types);
 
-	mtd_device_register(info->cmtd, info->parts, err);
-
 	kfree(mtd_list);
 
 	return 0;
-- 
1.7.5.3
