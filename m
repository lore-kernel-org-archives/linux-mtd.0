Received: from smtp4.int-evry.fr ([157.159.10.71])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JWEvg-0006pT-4A
	for linux-mtd@lists.infradead.org; Mon, 03 Mar 2008 17:58:24 +0000
From: Florian Fainelli <florian.fainelli@telecomint.eu>
Date: Mon, 3 Mar 2008 18:30:24 +0100
Subject: [PATCH] Extend plat-ram to support a supplied probe type
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200803031830.25392.florian.fainelli@telecomint.eu>
Cc: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This enhances plat-ram to take a map_probes argument in
the platform_data structure which allow plat-ram to support
any direct-mapped device that MTD supports (jedec, cfi, amd ..)

A few items are also fixed:
- Don't panic if probes is 0
- Actually use the partition list that is passed in

Signed-off-by: Florian Fainelli <florian.fainelli@telecomint.eu>
Signed-off-by: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
---
diff --git a/drivers/mtd/maps/plat-ram.c b/drivers/mtd/maps/plat-ram.c
index 894c0b2..c23057a 100644
--- a/drivers/mtd/maps/plat-ram.c
+++ b/drivers/mtd/maps/plat-ram.c
@@ -47,6 +47,7 @@ struct platram_info {
 	struct mtd_info		*mtd;
 	struct map_info		 map;
 	struct mtd_partition	*partitions;
+	bool			free_partitions;
 	struct resource		*area;
 	struct platdata_mtd_ram	*pdata;
 };
@@ -98,7 +99,8 @@ static int platram_remove(struct platform_device *pdev)
 #ifdef CONFIG_MTD_PARTITIONS
 		if (info->partitions) {
 			del_mtd_partitions(info->mtd);
-			kfree(info->partitions);
+			if (info->free_partitions)
+				kfree(info->partitions);
 		}
 #endif
 		del_mtd_device(info->mtd);
@@ -176,7 +178,8 @@ static int platram_probe(struct platform_device *pdev)
 
 	info->map.phys = res->start;
 	info->map.size = (res->end - res->start) + 1;
-	info->map.name = pdata->mapname != NULL ? pdata->mapname : (char *)pdev->name;
+	info->map.name = pdata->mapname != NULL ?
+			(char *)pdata->mapname : (char *)pdev->name;
 	info->map.bankwidth = pdata->bankwidth;
 
 	/* register our usage of the memory area */
@@ -203,9 +206,19 @@ static int platram_probe(struct platform_device *pdev)
 
 	dev_dbg(&pdev->dev, "initialised map, probing for mtd\n");
 
-	/* probe for the right mtd map driver */
+	/* probe for the right mtd map driver
+	 * supplied by the platform_data struct */
+
+	if (pdata->map_probes != 0) {
+		const char **map_probes = pdata->map_probes;
+
+		for ( ; !info->mtd && *map_probes; map_probes++)
+			info->mtd = do_map_probe(*map_probes , &info->map);
+	}
+	/* fallback to map_ram */
+	else
+		info->mtd = do_map_probe("map_ram", &info->map);
 
-	info->mtd = do_map_probe("map_ram" , &info->map);
 	if (info->mtd == NULL) {
 		dev_err(&pdev->dev, "failed to probe for map_ram\n");
 		err = -ENOMEM;
@@ -220,19 +233,21 @@ static int platram_probe(struct platform_device *pdev)
 	 * to add this device whole */
 
 #ifdef CONFIG_MTD_PARTITIONS
-	if (pdata->nr_partitions > 0) {
-		const char **probes = { NULL };
-
-		if (pdata->probes)
-			probes = (const char **)pdata->probes;
-
-		err = parse_mtd_partitions(info->mtd, probes,
+	if (!pdata->nr_partitions) {
+		/* try to probe using the supplied probe type */
+		if (pdata->probes) {
+			err = parse_mtd_partitions(info->mtd, pdata->probes,
 					   &info->partitions, 0);
-		if (err > 0) {
-			err = add_mtd_partitions(info->mtd, info->partitions,
-						 err);
+			info->free_partitions = 1;
+			if (err > 0)
+				err = add_mtd_partitions(info->mtd,
+					info->partitions, err);
 		}
 	}
+	/* use the static mapping */
+	else
+		err = add_mtd_partitions(info->mtd, pdata->partitions,
+				pdata->nr_partitions);
 #endif /* CONFIG_MTD_PARTITIONS */
 
 	if (add_mtd_device(info->mtd)) {
@@ -240,7 +255,9 @@ static int platram_probe(struct platform_device *pdev)
 		err = -ENOMEM;
 	}
 
-	dev_info(&pdev->dev, "registered mtd device\n");
+	if (!err)
+		dev_info(&pdev->dev, "registered mtd device\n");
+
 	return err;
 
  exit_free:
diff --git a/include/linux/mtd/plat-ram.h b/include/linux/mtd/plat-ram.h
index 9667863..0e37ad0 100644
--- a/include/linux/mtd/plat-ram.h
+++ b/include/linux/mtd/plat-ram.h
@@ -21,8 +21,9 @@
 #define PLATRAM_RW (1)
 
 struct platdata_mtd_ram {
-	char			*mapname;
-	char		       **probes;
+	const char		*mapname;
+	const char		**map_probes;
+	const char		**probes;
 	struct mtd_partition	*partitions;
 	int			 nr_partitions;
 	int			 bankwidth;
