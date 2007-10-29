Received: from mx1.minet.net ([157.159.40.25])
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1ImYVO-0007WP-Dm
	for linux-mtd@lists.infradead.org; Mon, 29 Oct 2007 17:34:29 +0000
From: Florian Fainelli <florian.fainelli@telecomint.eu>
Date: Mon, 29 Oct 2007 18:27:16 +0100
Subject: [PATCH] Extend plat-ram to support platform supplied probe type and
	partiton parser
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org,
	Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200710291827.16903.florian.fainelli@telecomint.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch was originally posted against 2.6.15-rc4. I have taken Jason's work
to update the patch to the current mtd tree and try to make checkpatch happy with it.

This enhances plat-ram to take a map_probes argument in the platform_data
structure which allow plat-ram to support any direct-mapped device that
MTD supports.

A few items are also fixed:
- devinit/devexit are used to mark the driver probe/remove functions
  so they can be discarded if hotplug is disabled
- Don't panic if probes is 0
- Actually use the partition list that is passed in

Signed-off-by: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Signed-off-by: Florian Fainelli <florian.fainelli@telecomint.eu>
---
diff --git a/drivers/mtd/maps/plat-ram.c b/drivers/mtd/maps/plat-ram.c
index 894c0b2..071b4a1 100644
--- a/drivers/mtd/maps/plat-ram.c
+++ b/drivers/mtd/maps/plat-ram.c
@@ -47,6 +47,7 @@ struct platram_info {
 	struct mtd_info		*mtd;
 	struct map_info		 map;
 	struct mtd_partition	*partitions;
+	unsigned int		free_partitions;
 	struct resource		*area;
 	struct platdata_mtd_ram	*pdata;
 };
@@ -83,7 +84,7 @@ static inline void platram_setrw(struct platram_info *info, int to)
  * called to remove the device from the driver's control
 */
 
-static int platram_remove(struct platform_device *pdev)
+static int __devexit platram_remove(struct platform_device *pdev)
 {
 	struct platram_info *info = to_platram_info(pdev);
 
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
@@ -106,7 +108,6 @@ static int platram_remove(struct platform_device *pdev)
 	}
 
 	/* ensure ram is left read-only */
-
 	platram_setrw(info, PLATRAM_RO);
 
 	/* release resources */
@@ -176,7 +177,7 @@ static int platram_probe(struct platform_device *pdev)
 
 	info->map.phys = res->start;
 	info->map.size = (res->end - res->start) + 1;
-	info->map.name = pdata->mapname != NULL ? pdata->mapname : (char *)pdev->name;
+	info->map.name = pdata->mapname != NULL ? (char *)pdata->mapname : (char *)pdev->name;
 	info->map.bankwidth = pdata->bankwidth;
 
 	/* register our usage of the memory area */
@@ -203,9 +204,17 @@ static int platram_probe(struct platform_device *pdev)
 
 	dev_dbg(&pdev->dev, "initialised map, probing for mtd\n");
 
-	/* probe for the right mtd map driver */
+	/* probe for the right mtd map driver, supplied by the platform_data */
+	if (pdata->map_probes != 0) {
+		const char **map_probes = pdata->map_probes;
+
+		for( ; !info->mtd && *map_probes; map_probes++)
+			info->mtd = do_map_probe(*map_probes , &info->map);
+	}
+	/* Fallback to "map_ram" */
+	else
+		info->mtd = do_map_probe("map_ram", &info->map);
 
-	info->mtd = do_map_probe("map_ram" , &info->map);
 	if (info->mtd == NULL) {
 		dev_err(&pdev->dev, "failed to probe for map_ram\n");
 		err = -ENOMEM;
@@ -220,19 +229,21 @@ static int platram_probe(struct platform_device *pdev)
 	 * to add this device whole */
 
 #ifdef CONFIG_MTD_PARTITIONS
-	if (pdata->nr_partitions > 0) {
-		const char **probes = { NULL };
+	if (!pdata->nr_partitions) {
+		/* Try to probe using the supplied probe type */
+		if (pdata->probes) {
 
-		if (pdata->probes)
-			probes = (const char **)pdata->probes;
-
-		err = parse_mtd_partitions(info->mtd, probes,
+		err = parse_mtd_partitions(info->mtd, pdata->probes,
 					   &info->partitions, 0);
-		if (err > 0) {
-			err = add_mtd_partitions(info->mtd, info->partitions,
+		info->free_partitions = 1;
+			if (err > 0)
+				err = add_mtd_partitions(info->mtd, info->partitions,
 						 err);
 		}
 	}
+	/* Use the static mapping */
+	else
+		err = add_mtd_partitions(info->mtd, pdata->partitions, pdata->nr_partitions);
 #endif /* CONFIG_MTD_PARTITIONS */
 
 	if (add_mtd_device(info->mtd)) {
@@ -240,7 +251,10 @@ static int platram_probe(struct platform_device *pdev)
 		err = -ENOMEM;
 	}
 
-	dev_info(&pdev->dev, "registered mtd device\n");
+
+	if (!err)
+		dev_info(&pdev->dev, "registered mtd device\n");
+
 	return err;
 
  exit_free:
@@ -253,7 +267,7 @@ static int platram_probe(struct platform_device *pdev)
 
 static struct platform_driver platram_driver = {
 	.probe		= platram_probe,
-	.remove		= platram_remove,
+	.remove		= __devexit_p(platram_remove),
 	.driver		= {
 		.name	= "mtd-ram",
 		.owner	= THIS_MODULE,
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
