Received: from metis.extern.pengutronix.de ([83.236.181.26])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Egj5F-0003Dq-Aq
	for linux-mtd@lists.infradead.org; Mon, 28 Nov 2005 08:30:23 -0500
Date: Mon, 28 Nov 2005 14:30:03 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20051128133003.GA10558@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: Ben Dooks <ben@simtec.co.uk>
Subject: plat-ram driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi list and Ben,

I was half way through implementing a mapping driver which allows
initialization of a mtd device using a platform_device when I found the
plat-ram.c driver. With some small changes one could use the driver for
flash devices as well.
Would a patch like this be acceptible? Maybe we should rename the driver
to something like plat-mtd. I did not do this to keep the patch small,
but I would do the changes if there is a chance to get this upstream.

BTW there is a goto exit_free missing when add_mtd_device fails, the
attached patch fixes this.

Sascha Hauer

Index: include/linux/mtd/plat-ram.h
===================================================================
--- a/include/linux/mtd/plat-ram.h	(revision 1061)
+++ b/include/linux/mtd/plat-ram.h	(working copy)
@@ -22,7 +22,8 @@
 
 struct platdata_mtd_ram {
 	char			*mapname;
-	char		       **probes;
+	char		       **mtd_probes;
+	char		       **part_probes;
 	struct mtd_partition	*partitions;
 	int			 nr_partitions;
 	int			 bankwidth;
Index: drivers/mtd/maps/plat-ram.c
===================================================================
--- a/drivers/mtd/maps/plat-ram.c	(revision 1061)
+++ b/drivers/mtd/maps/plat-ram.c	(working copy)
@@ -134,6 +134,7 @@
 	struct platdata_mtd_ram	*pdata;
 	struct platram_info *info;
 	struct resource *res;
+	char **type;
 	int err = 0;
 
 	dev_dbg(dev, "probe entered\n");
@@ -202,9 +203,14 @@
 
 	dev_dbg(dev, "initialised map, probing for mtd\n");
 
-	/* probe for the right mtd map driver */
+	/* probe for the right map driver */
+	if(pdata->mtd_probes) {
+		type = pdata->mtd_probes;
+		for(; !info->mtd && *type; type++)
+			info->mtd = do_map_probe(*type, &info->map);
+        } else
+		do_map_probe("map_ram", &info->map);
 
-	info->mtd = do_map_probe("map_ram" , &info->map);
 	if (info->mtd == NULL) {
 		dev_err(dev, "failed to probe for map_ram\n");
 		err = -ENOMEM;
@@ -219,11 +225,11 @@
 	 * to add this device whole */
 
 #ifdef CONFIG_MTD_PARTITIONS
-	if (pdata->nr_partitions > 0) {
+	{
 		const char **probes = { NULL };
 
-		if (pdata->probes)
-			probes = (const char **)pdata->probes;
+		if (pdata->part_probes)
+			probes = (const char **)pdata->part_probes;
 
 		err = parse_mtd_partitions(info->mtd, probes,
 					   &info->partitions, 0);
@@ -237,6 +243,7 @@
 	if (add_mtd_device(info->mtd)) {
 		dev_err(dev, "add_mtd_device() failed\n");
 		err = -ENOMEM;
+		goto exit_free;
 	}
 	
 	dev_info(dev, "registered mtd device\n");
