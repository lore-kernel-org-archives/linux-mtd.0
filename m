Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QORMo-0002Tm-NA
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:24:04 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so4359562wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:24:02 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 04/62] mtd/physmap: convert to mtd_device_register()
Date: Mon, 23 May 2011 10:22:45 +0100
Message-Id: <1306142623-24952-5-git-send-email-jamie@jamieiles.com>
In-Reply-To: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
References: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
Cc: Jamie Iles <jamie@jamieiles.com>, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Convert to mtd_device_register() and remove the CONFIG_MTD_PARTITIONS
preprocessor conditionals as partitioning is always available.

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 drivers/mtd/maps/physmap.c    |   34 +++++++++-------------------------
 drivers/mtd/maps/physmap_of.c |   30 ++++--------------------------
 include/linux/mtd/physmap.h   |    4 ----
 3 files changed, 13 insertions(+), 55 deletions(-)

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index 7522df4..d205926 100644
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
@@ -47,18 +45,9 @@ static int physmap_flash_remove(struct platform_device *dev)
 	physmap_data = dev->dev.platform_data;
 
 	if (info->cmtd) {
-#ifdef CONFIG_MTD_PARTITIONS
-		if (info->nr_parts || physmap_data->nr_parts) {
-			del_mtd_partitions(info->cmtd);
-
-			if (info->nr_parts)
-				kfree(info->parts);
-		} else {
-			del_mtd_device(info->cmtd);
-		}
-#else
-		del_mtd_device(info->cmtd);
-#endif
+		mtd_device_unregister(info->cmtd);
+		if (info->nr_parts)
+			kfree(info->parts);
 		if (info->cmtd != info->mtd[0])
 			mtd_concat_destroy(info->cmtd);
 	}
@@ -76,9 +65,7 @@ static const char *rom_probe_types[] = {
 					"qinfo_probe",
 					"map_rom",
 					NULL };
-#ifdef CONFIG_MTD_PARTITIONS
 static const char *part_probe_types[] = { "cmdlinepart", "RedBoot", NULL };
-#endif
 
 static int physmap_flash_probe(struct platform_device *dev)
 {
@@ -164,24 +151,23 @@ static int physmap_flash_probe(struct platform_device *dev)
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
 
 	if (physmap_data->nr_parts) {
 		printk(KERN_NOTICE "Using physmap partition information\n");
-		add_mtd_partitions(info->cmtd, physmap_data->parts,
-				   physmap_data->nr_parts);
+		mtd_device_register(info->cmtd, physmap_data->parts,
+				    physmap_data->nr_parts);
 		return 0;
 	}
-#endif
 
-	add_mtd_device(info->cmtd);
+	mtd_device_register(info->cmtd, NULL, 0);
+
 	return 0;
 
 err_out:
@@ -245,14 +231,12 @@ void physmap_configure(unsigned long addr, unsigned long size,
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
diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index c1d3346..d251d1d 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -34,16 +34,12 @@ struct of_flash_list {
 
 struct of_flash {
 	struct mtd_info		*cmtd;
-#ifdef CONFIG_MTD_PARTITIONS
 	struct mtd_partition	*parts;
-#endif
 	int list_size; /* number of elements in of_flash_list */
 	struct of_flash_list	list[0];
 };
 
-#ifdef CONFIG_MTD_PARTITIONS
 #define OF_FLASH_PARTS(info)	((info)->parts)
-
 static int parse_obsolete_partitions(struct platform_device *dev,
 				     struct of_flash *info,
 				     struct device_node *dp)
@@ -89,10 +85,6 @@ static int parse_obsolete_partitions(struct platform_device *dev,
 
 	return nr_parts;
 }
-#else /* MTD_PARTITIONS */
-#define	OF_FLASH_PARTS(info)		(0)
-#define parse_partitions(info, dev)	(0)
-#endif /* MTD_PARTITIONS */
 
 static int of_flash_remove(struct platform_device *dev)
 {
@@ -105,17 +97,14 @@ static int of_flash_remove(struct platform_device *dev)
 	dev_set_drvdata(&dev->dev, NULL);
 
 	if (info->cmtd != info->list[0].mtd) {
-		del_mtd_device(info->cmtd);
+		mtd_device_unregister(info->cmtd);
 		mtd_concat_destroy(info->cmtd);
 	}
 
 	if (info->cmtd) {
-		if (OF_FLASH_PARTS(info)) {
-			del_mtd_partitions(info->cmtd);
+		if (OF_FLASH_PARTS(info))
 			kfree(OF_FLASH_PARTS(info));
-		} else {
-			del_mtd_device(info->cmtd);
-		}
+		mtd_device_unregister(info->cmtd);
 	}
 
 	for (i = 0; i < info->list_size; i++) {
@@ -172,7 +161,6 @@ static struct mtd_info * __devinit obsolete_probe(struct platform_device *dev,
 	}
 }
 
-#ifdef CONFIG_MTD_PARTITIONS
 /* When partitions are set we look for a linux,part-probe property which
    specifies the list of partition probers to use. If none is given then the
    default is use. These take precedence over other device tree
@@ -212,14 +200,11 @@ static void __devinit of_free_probes(const char **probes)
 	if (probes != part_probe_types_def)
 		kfree(probes);
 }
-#endif
 
 static struct of_device_id of_flash_match[];
 static int __devinit of_flash_probe(struct platform_device *dev)
 {
-#ifdef CONFIG_MTD_PARTITIONS
 	const char **part_probe_types;
-#endif
 	const struct of_device_id *match;
 	struct device_node *dp = dev->dev.of_node;
 	struct resource res;
@@ -346,7 +331,6 @@ static int __devinit of_flash_probe(struct platform_device *dev)
 	if (err)
 		goto err_out;
 
-#ifdef CONFIG_MTD_PARTITIONS
 	part_probe_types = of_get_probes(dp);
 	err = parse_mtd_partitions(info->cmtd, part_probe_types,
 				   &info->parts, 0);
@@ -356,13 +340,11 @@ static int __devinit of_flash_probe(struct platform_device *dev)
 	}
 	of_free_probes(part_probe_types);
 
-#ifdef CONFIG_MTD_OF_PARTS
 	if (err == 0) {
 		err = of_mtd_parse_partitions(&dev->dev, dp, &info->parts);
 		if (err < 0)
 			goto err_out;
 	}
-#endif
 
 	if (err == 0) {
 		err = parse_obsolete_partitions(dev, info, dp);
@@ -370,11 +352,7 @@ static int __devinit of_flash_probe(struct platform_device *dev)
 			goto err_out;
 	}
 
-	if (err > 0)
-		add_mtd_partitions(info->cmtd, info->parts, err);
-	else
-#endif
-		add_mtd_device(info->cmtd);
+	mtd_device_register(info->cmtd, info->parts, err);
 
 	kfree(mtd_list);
 
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
