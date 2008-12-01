Message-Id: <200812012223.mB1MNdrR014535@imap1.linux-foundation.org>
Subject: [patch 4/6] physmap: fix leak of memory returned by
	parse_mtd_partitions
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Mon, 01 Dec 2008 14:23:39 -0800
Cc: akpm@linux-foundation.org, linux-mtd@lists.infradead.org,
	anemo@mba.ocn.ne.jp, vapier.adi@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>

The mtd partition parser returns an allocated pointer array of
mtd_partition.  The caller must free it.  The array is used only for
add_mtd_partitions(), so free it just after the call.

Signed-off-by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Mike Frysinger <vapier.adi@gmail.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/mtd/maps/physmap.c |   17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff -puN drivers/mtd/maps/physmap.c~physmap-fix-leak-of-memory-returned-by-parse_mtd_partitions drivers/mtd/maps/physmap.c
--- a/drivers/mtd/maps/physmap.c~physmap-fix-leak-of-memory-returned-by-parse_mtd_partitions
+++ a/drivers/mtd/maps/physmap.c
@@ -29,7 +29,6 @@ struct physmap_flash_info {
 	struct map_info		map[MAX_RESOURCES];
 #ifdef CONFIG_MTD_PARTITIONS
 	int			nr_parts;
-	struct mtd_partition	*parts;
 #endif
 };
 
@@ -56,14 +55,10 @@ static int physmap_flash_remove(struct p
 	for (i = 0; i < MAX_RESOURCES; i++) {
 		if (info->mtd[i] != NULL) {
 #ifdef CONFIG_MTD_PARTITIONS
-			if (info->nr_parts) {
+			if (info->nr_parts || physmap_data->nr_parts)
 				del_mtd_partitions(info->mtd[i]);
-				kfree(info->parts);
-			} else if (physmap_data->nr_parts) {
-				del_mtd_partitions(info->mtd[i]);
-			} else {
+			else
 				del_mtd_device(info->mtd[i]);
-			}
 #else
 			del_mtd_device(info->mtd[i]);
 #endif
@@ -86,6 +81,9 @@ static int physmap_flash_probe(struct pl
 	int err = 0;
 	int i;
 	int devices_found = 0;
+#ifdef CONFIG_MTD_PARTITIONS
+	struct mtd_partition *parts;
+#endif
 
 	physmap_data = dev->dev.platform_data;
 	if (physmap_data == NULL)
@@ -166,9 +164,10 @@ static int physmap_flash_probe(struct pl
 		goto err_out;
 
 #ifdef CONFIG_MTD_PARTITIONS
-	err = parse_mtd_partitions(info->cmtd, part_probe_types, &info->parts, 0);
+	err = parse_mtd_partitions(info->cmtd, part_probe_types, &parts, 0);
 	if (err > 0) {
-		add_mtd_partitions(info->cmtd, info->parts, err);
+		add_mtd_partitions(info->cmtd, parts, err);
+		kfree(parts);
 		return 0;
 	}
 
_
