Received: from [198.161.247.241] (helo=quartz.orcorp.ca)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EiPEU-0003ZA-P8
	for linux-mtd@lists.infradead.org; Fri, 02 Dec 2005 23:42:52 -0500
Received: from jgg by quartz.orcorp.ca with local (Exim 4.50)
	id 1EiOhJ-0000W1-QX
	for linux-mtd@lists.infradead.org; Fri, 02 Dec 2005 21:08:29 -0700
Date: Fri, 2 Dec 2005 21:08:29 -0700
From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
To: linux-mtd@lists.infradead.org
Message-ID: <20051203040829.GA1929@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [PATCH 2.6.15-rc4] mtd: Improvements to plat-ram map
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This enhances plat-ram to take a map_probes argument in the platform_data
structure which allow plat-ram to support any direct-mapped device that
MTD supports.

A few items are also fixed:
- devinit/devexit are used to mark the driver probe/remove functions
  so they can be discarded if hotplug is disabled
- Don't panic if probes is 0
- Actually use the partition list that is passed in

This driver isn't used in tree right now, but the general mechanism
it supports via the driver model could replace code in the simpler
map drivers with a few calls into platform_*.

Signed-off-by: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>

---

 drivers/mtd/maps/plat-ram.c  |   46 ++++++++++++++++++++++++++----------------
 include/linux/mtd/plat-ram.h |    5 +++--
 2 files changed, 31 insertions(+), 20 deletions(-)

applies-to: cec49fea2095ec77123684854ed519f01cf890da
53f385a7d61739b1ec209ffddb79f39555bd878c
diff --git a/drivers/mtd/maps/plat-ram.c b/drivers/mtd/maps/plat-ram.c
index 5d3c754..b2aa4aa 100644
--- a/drivers/mtd/maps/plat-ram.c
+++ b/drivers/mtd/maps/plat-ram.c
@@ -47,6 +47,7 @@ struct platram_info {
 	struct mtd_info		*mtd;
 	struct map_info		 map;
 	struct mtd_partition	*partitions;
+	int                      free_partitions;
 	struct resource		*area;
 	struct platdata_mtd_ram	*pdata;
 };
@@ -83,7 +84,7 @@ static inline void platram_setrw(struct 
  * called to remove the device from the driver's control
 */
 
-static int platram_remove(struct platform_device *pdev)
+static int __devexit platram_remove(struct platform_device *pdev)
 {
 	struct platram_info *info = to_platram_info(pdev);
 
@@ -98,7 +99,8 @@ static int platram_remove(struct platfor
 #ifdef CONFIG_MTD_PARTITIONS
 		if (info->partitions) {
 			del_mtd_partitions(info->mtd);
-			kfree(info->partitions);
+			if (info->free_partitions)
+				kfree(info->partitions);
 		}
 #endif
 		del_mtd_device(info->mtd);
@@ -130,7 +132,7 @@ static int platram_remove(struct platfor
  * driver is found.
 */
 
-static int platram_probe(struct platform_device *pdev)
+static int __devinit platram_probe(struct platform_device *pdev)
 {
 	struct platdata_mtd_ram	*pdata;
 	struct platram_info *info;
@@ -176,7 +178,7 @@ static int platram_probe(struct platform
 
 	info->map.phys = res->start;
 	info->map.size = (res->end - res->start) + 1;
-	info->map.name = pdata->mapname != NULL ? pdata->mapname : (char *)pdev->name;
+	info->map.name = pdata->mapname != NULL ? (char *)pdata->mapname : (char *)pdev->name;
 	info->map.bankwidth = pdata->bankwidth;
 
 	/* register our usage of the memory area */
@@ -205,7 +207,13 @@ static int platram_probe(struct platform
 
 	/* probe for the right mtd map driver */
 
-	info->mtd = do_map_probe("map_ram" , &info->map);
+	if (pdata->map_probes != 0) {
+		const char **map_probes = pdata->map_probes;
+		for(; !info->mtd && *map_probes; map_probes++)
+			info->mtd = do_map_probe(*map_probes , &info->map);
+	}
+	else
+		info->mtd = do_map_probe("map_ram", &info->map);
 	if (info->mtd == NULL) {
 		dev_err(&pdev->dev, "failed to probe for map_ram\n");
 		err = -ENOMEM;
@@ -218,21 +226,23 @@ static int platram_probe(struct platform
 
 	/* check to see if there are any available partitions, or wether
 	 * to add this device whole */
-
 #ifdef CONFIG_MTD_PARTITIONS
-	if (pdata->nr_partitions > 0) {
-		const char **probes = { NULL };
-
-		if (pdata->probes)
-			probes = (const char **)pdata->probes;
-
-		err = parse_mtd_partitions(info->mtd, probes,
-					   &info->partitions, 0);
-		if (err > 0) {
-			err = add_mtd_partitions(info->mtd, info->partitions,
-						 err);
+	if (pdata->nr_partitions == 0) {
+		if (pdata->probes) {
+			err = parse_mtd_partitions(info->mtd,
+						   pdata->probes,
+						   &info->partitions, 0);
+			info->free_partitions = 1;
+			if (err > 0)
+				add_mtd_partitions(info->mtd, info->partitions,
+						   err);
 		}
 	}
+	else {
+		add_mtd_partitions(info->mtd,pdata->partitions,
+				   pdata->nr_partitions);
+	}
+
 #endif /* CONFIG_MTD_PARTITIONS */
 
 	if (add_mtd_device(info->mtd)) {
@@ -253,7 +263,7 @@ static int platram_probe(struct platform
 
 static struct platform_driver platram_driver = {
 	.probe		= platram_probe,
-	.remove		= platram_remove,
+	.remove		= __devexit_p(platram_remove),
 	.driver		= {
 		.name	= "mtd-ram",
 		.owner	= THIS_MODULE,
diff --git a/include/linux/mtd/plat-ram.h b/include/linux/mtd/plat-ram.h
index 2332eda..2b87684 100644
--- a/include/linux/mtd/plat-ram.h
+++ b/include/linux/mtd/plat-ram.h
@@ -21,8 +21,9 @@
 #define PLATRAM_RW (1)
 
 struct platdata_mtd_ram {
-	char			*mapname;
-	char		       **probes;
+	const char		*mapname;
+	const char	       **map_probes;
+	const char	       **probes;
 	struct mtd_partition	*partitions;
 	int			 nr_partitions;
 	int			 bankwidth;
---
0.99.9k
