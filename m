Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QKVve-00029n-Sp
	for linux-mtd@lists.infradead.org; Thu, 12 May 2011 13:27:47 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so1473623wyb.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 May 2011 06:27:46 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [RFC PATCH 3/7] mtd/physmap: convert to mtd_device_register()
Date: Thu, 12 May 2011 14:26:54 +0100
Message-Id: <1305206818-31752-4-git-send-email-jamie@jamieiles.com>
In-Reply-To: <1305206818-31752-1-git-send-email-jamie@jamieiles.com>
References: <1305206818-31752-1-git-send-email-jamie@jamieiles.com>
Cc: Jamie Iles <jamie@jamieiles.com>, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

---
 drivers/mtd/maps/physmap.c  |   31 +++++--------------------------
 include/linux/mtd/physmap.h |    4 ----
 2 files changed, 5 insertions(+), 30 deletions(-)

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index 7522df4..95d4f85 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -27,10 +27,8 @@ struct physmap_flash_info {
 	struct mtd_info		*mtd[MAX_RESOURCES];
 	struct mtd_info		*cmtd;
 	struct map_info		map[MAX_RESOURCES];
-#ifdef CONFIG_MTD_PARTITIONS
 	int			nr_parts;
 	struct mtd_partition	*parts;
-#endif
 };
 
 static int physmap_flash_remove(struct platform_device *dev)
@@ -47,18 +45,11 @@ static int physmap_flash_remove(struct platform_device *dev)
 	physmap_data = dev->dev.platform_data;
 
 	if (info->cmtd) {
-#ifdef CONFIG_MTD_PARTITIONS
+		mtd_device_unregister(info->cmtd);
 		if (info->nr_parts || physmap_data->nr_parts) {
-			del_mtd_partitions(info->cmtd);
-
 			if (info->nr_parts)
 				kfree(info->parts);
-		} else {
-			del_mtd_device(info->cmtd);
 		}
-#else
-		del_mtd_device(info->cmtd);
-#endif
 		if (info->cmtd != info->mtd[0])
 			mtd_concat_destroy(info->cmtd);
 	}
@@ -76,9 +67,7 @@ static const char *rom_probe_types[] = {
 					"qinfo_probe",
 					"map_rom",
 					NULL };
-#ifdef CONFIG_MTD_PARTITIONS
 static const char *part_probe_types[] = { "cmdlinepart", "RedBoot", NULL };
-#endif
 
 static int physmap_flash_probe(struct platform_device *dev)
 {
@@ -164,24 +153,16 @@ static int physmap_flash_probe(struct platform_device *dev)
 	if (err)
 		goto err_out;
 
-#ifdef CONFIG_MTD_PARTITIONS
 	err = parse_mtd_partitions(info->cmtd, part_probe_types,
-				&info->parts, 0);
+				   &info->parts, 0);
 	if (err > 0) {
-		add_mtd_partitions(info->cmtd, info->parts, err);
+		mtd_device_register(info->cmtd, info->parts, err);
 		info->nr_parts = err;
 		return 0;
 	}
 
-	if (physmap_data->nr_parts) {
-		printk(KERN_NOTICE "Using physmap partition information\n");
-		add_mtd_partitions(info->cmtd, physmap_data->parts,
-				   physmap_data->nr_parts);
-		return 0;
-	}
-#endif
-
-	add_mtd_device(info->cmtd);
+	mtd_device_register(info->cmtd, physmap_data->parts,
+			    physmap_data->nr_parts);
 	return 0;
 
 err_out:
@@ -245,14 +226,12 @@ void physmap_configure(unsigned long addr, unsigned long size,
 	physmap_flash_data.set_vpp = set_vpp;
 }
 
-#ifdef CONFIG_MTD_PARTITIONS
 void physmap_set_partitions(struct mtd_partition *parts, int num_parts)
 {
 	physmap_flash_data.nr_parts = num_parts;
 	physmap_flash_data.parts = parts;
 }
 #endif
-#endif
 
 static int __init physmap_init(void)
 {
diff --git a/include/linux/mtd/physmap.h b/include/linux/mtd/physmap.h
index bcfd9f7..e963b86 100644
--- a/include/linux/mtd/physmap.h
+++ b/include/linux/mtd/physmap.h
@@ -35,8 +35,6 @@ struct physmap_flash_data {
 void physmap_configure(unsigned long addr, unsigned long size,
 		int bankwidth, void (*set_vpp)(struct map_info *, int) );
 
-#ifdef CONFIG_MTD_PARTITIONS
-
 /*
  * Machines that wish to do flash partition may want to call this function in
  * their setup routine.
@@ -48,6 +46,4 @@ void physmap_configure(unsigned long addr, unsigned long size,
  */
 void physmap_set_partitions(struct mtd_partition *parts, int num_parts);
 
-#endif /* defined(CONFIG_MTD_PARTITIONS) */
-
 #endif /* __LINUX_MTD_PHYSMAP__ */
-- 
1.7.4.4
