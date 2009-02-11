Received: from smtp1.linux-foundation.org ([140.211.169.13])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LXMON-00016A-Pw
	for linux-mtd@lists.infradead.org; Wed, 11 Feb 2009 21:13:14 +0000
Message-Id: <200902112112.n1BLCHWT010244@imap1.linux-foundation.org>
Subject: [patch for 2.6.29? 1/4] mtd: physmap: fix wrong free and
	del_mtd_{partition, device}
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Wed, 11 Feb 2009 13:12:17 -0800
Cc: akpm@linux-foundation.org, linux-mtd@lists.infradead.org,
	anemo@mba.ocn.ne.jp, matthias@kaehlcke.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>

commit 176bf2e0f10ecf1d20a97db3bd5bb2e6ba0b5668 ("physmap: fix leak of
memory returned by parse_mtd_partitions") deals with a memory leak and
frees the pointer array of mtd_partition after the call to
add_mtd_partitions().  the problem is that mtd_table[x]->name still points
to the freed memory.

Aldo physmap_flash_remove() should call del_mtd_partitions() or
del_mtd_device() only once.

Signed-off-by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Reported-by: Matthias Kaehlcke <matthias@kaehlcke.net>
Tested-by: Matthias Kaehlcke <matthias@kaehlcke.net>
Cc: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/mtd/maps/physmap.c |   38 +++++++++++++++++------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff -puN drivers/mtd/maps/physmap.c~mtd-physmap-fix-wrong-free-and-del_mtd_partitiondevice drivers/mtd/maps/physmap.c
--- a/drivers/mtd/maps/physmap.c~mtd-physmap-fix-wrong-free-and-del_mtd_partitiondevice
+++ a/drivers/mtd/maps/physmap.c
@@ -29,6 +29,7 @@ struct physmap_flash_info {
 	struct map_info		map[MAX_RESOURCES];
 #ifdef CONFIG_MTD_PARTITIONS
 	int			nr_parts;
+	struct mtd_partition	*parts;
 #endif
 };
 
@@ -45,25 +46,26 @@ static int physmap_flash_remove(struct p
 
 	physmap_data = dev->dev.platform_data;
 
-#ifdef CONFIG_MTD_CONCAT
-	if (info->cmtd != info->mtd[0]) {
+#ifdef CONFIG_MTD_PARTITIONS
+	if (info->nr_parts) {
+		del_mtd_partitions(info->cmtd);
+		kfree(info->parts);
+	} else if (physmap_data->nr_parts)
+		del_mtd_partitions(info->cmtd);
+	else
 		del_mtd_device(info->cmtd);
+#else
+	del_mtd_device(info->cmtd);
+#endif
+
+#ifdef CONFIG_MTD_CONCAT
+	if (info->cmtd != info->mtd[0])
 		mtd_concat_destroy(info->cmtd);
-	}
 #endif
 
 	for (i = 0; i < MAX_RESOURCES; i++) {
-		if (info->mtd[i] != NULL) {
-#ifdef CONFIG_MTD_PARTITIONS
-			if (info->nr_parts || physmap_data->nr_parts)
-				del_mtd_partitions(info->mtd[i]);
-			else
-				del_mtd_device(info->mtd[i]);
-#else
-			del_mtd_device(info->mtd[i]);
-#endif
+		if (info->mtd[i] != NULL)
 			map_destroy(info->mtd[i]);
-		}
 	}
 	return 0;
 }
@@ -86,9 +88,6 @@ static int physmap_flash_probe(struct pl
 	int err = 0;
 	int i;
 	int devices_found = 0;
-#ifdef CONFIG_MTD_PARTITIONS
-	struct mtd_partition *parts;
-#endif
 
 	physmap_data = dev->dev.platform_data;
 	if (physmap_data == NULL)
@@ -167,10 +166,11 @@ static int physmap_flash_probe(struct pl
 		goto err_out;
 
 #ifdef CONFIG_MTD_PARTITIONS
-	err = parse_mtd_partitions(info->cmtd, part_probe_types, &parts, 0);
+	err = parse_mtd_partitions(info->cmtd, part_probe_types,
+				&info->parts, 0);
 	if (err > 0) {
-		add_mtd_partitions(info->cmtd, parts, err);
-		kfree(parts);
+		add_mtd_partitions(info->cmtd, info->parts, err);
+		info->nr_parts = err;
 		return 0;
 	}
 
_
