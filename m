Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QORNP-0002Tm-Gm
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:24:41 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so4359562wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:24:39 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 20/62] mtd/edb7312: convert to mtd_device_register()
Date: Mon, 23 May 2011 10:23:01 +0100
Message-Id: <1306142623-24952-21-git-send-email-jamie@jamieiles.com>
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
 drivers/mtd/maps/edb7312.c |   26 ++++++++------------------
 1 files changed, 8 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/maps/edb7312.c b/drivers/mtd/maps/edb7312.c
index be9e90b..fe42a21 100644
--- a/drivers/mtd/maps/edb7312.c
+++ b/drivers/mtd/maps/edb7312.c
@@ -15,10 +15,7 @@
 #include <asm/io.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/map.h>
-
-#ifdef CONFIG_MTD_PARTITIONS
 #include <linux/mtd/partitions.h>
-#endif
 
 #define WINDOW_ADDR 0x00000000      /* physical properties of flash */
 #define WINDOW_SIZE 0x01000000
@@ -40,8 +37,6 @@ struct map_info edb7312nor_map = {
 	.phys = WINDOW_ADDR,
 };
 
-#ifdef CONFIG_MTD_PARTITIONS
-
 /*
  * MTD partitioning stuff
  */
@@ -66,8 +61,6 @@ static struct mtd_partition static_partitions[3] =
 
 static const char *probes[] = { "RedBoot", "cmdlinepart", NULL };
 
-#endif
-
 static int                   mtd_parts_nb = 0;
 static struct mtd_partition *mtd_parts    = 0;
 
@@ -96,27 +89,24 @@ static int __init init_edb7312nor(void)
 	if (mymtd) {
 		mymtd->owner = THIS_MODULE;
 
-#ifdef CONFIG_MTD_PARTITIONS
 		mtd_parts_nb = parse_mtd_partitions(mymtd, probes, &mtd_parts, MTDID);
 		if (mtd_parts_nb > 0)
-		  part_type = "detected";
+			part_type = "detected";
 
-		if (mtd_parts_nb == 0)
-		{
+		if (mtd_parts_nb == 0) {
 			mtd_parts = static_partitions;
 			mtd_parts_nb = ARRAY_SIZE(static_partitions);
 			part_type = "static";
 		}
-#endif
-		add_mtd_device(mymtd);
+
 		if (mtd_parts_nb == 0)
-		  printk(KERN_NOTICE MSG_PREFIX "no partition info available\n");
+			printk(KERN_NOTICE MSG_PREFIX "no partition info available\n");
 		else
-		{
 			printk(KERN_NOTICE MSG_PREFIX
 			       "using %s partition definition\n", part_type);
-			add_mtd_partitions(mymtd, mtd_parts, mtd_parts_nb);
-		}
+		/* Register the whole device first. */
+		mtd_device_register(mymtd, NULL, 0);
+		mtd_device_register(mymtd, mtd_parts, mtd_parts_nb);
 		return 0;
 	}
 
@@ -127,7 +117,7 @@ static int __init init_edb7312nor(void)
 static void __exit cleanup_edb7312nor(void)
 {
 	if (mymtd) {
-		del_mtd_device(mymtd);
+		mtd_device_unregister(mymtd);
 		map_destroy(mymtd);
 	}
 	if (edb7312nor_map.virt) {
-- 
1.7.4.4
