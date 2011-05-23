Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QORNX-0002Tm-3W
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:24:48 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so4359562wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:24:46 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 23/62] mtd/impa7: convert to mtd_device_register()
Date: Mon, 23 May 2011 10:23:04 +0100
Message-Id: <1306142623-24952-24-git-send-email-jamie@jamieiles.com>
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
 drivers/mtd/maps/impa7.c |   22 +++-------------------
 1 files changed, 3 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/maps/impa7.c b/drivers/mtd/maps/impa7.c
index 998a27d..404a50c 100644
--- a/drivers/mtd/maps/impa7.c
+++ b/drivers/mtd/maps/impa7.c
@@ -15,10 +15,7 @@
 #include <asm/io.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/map.h>
-
-#ifdef CONFIG_MTD_PARTITIONS
 #include <linux/mtd/partitions.h>
-#endif
 
 #define WINDOW_ADDR0 0x00000000      /* physical properties of flash */
 #define WINDOW_SIZE0 0x00800000
@@ -49,8 +46,6 @@ static struct map_info impa7_map[NUM_FLASHBANKS] = {
 	},
 };
 
-#ifdef CONFIG_MTD_PARTITIONS
-
 /*
  * MTD partitioning stuff
  */
@@ -66,8 +61,6 @@ static struct mtd_partition static_partitions[] =
 static int mtd_parts_nb[NUM_FLASHBANKS];
 static struct mtd_partition *mtd_parts[NUM_FLASHBANKS];
 
-#endif
-
 static const char *probes[] = { "cmdlinepart", NULL };
 
 static int __init init_impa7(void)
@@ -104,7 +97,6 @@ static int __init init_impa7(void)
 		if (impa7_mtd[i]) {
 			impa7_mtd[i]->owner = THIS_MODULE;
 			devicesfound++;
-#ifdef CONFIG_MTD_PARTITIONS
 			mtd_parts_nb[i] = parse_mtd_partitions(impa7_mtd[i],
 							       probes,
 							       &mtd_parts[i],
@@ -120,12 +112,8 @@ static int __init init_impa7(void)
 			printk(KERN_NOTICE MSG_PREFIX
 			       "using %s partition definition\n",
 			       part_type);
-			add_mtd_partitions(impa7_mtd[i],
-					   mtd_parts[i], mtd_parts_nb[i]);
-#else
-			add_mtd_device(impa7_mtd[i]);
-
-#endif
+			mtd_device_register(impa7_mtd[i],
+					    mtd_parts[i], mtd_parts_nb[i]);
 		}
 		else
 			iounmap((void *)impa7_map[i].virt);
@@ -138,11 +126,7 @@ static void __exit cleanup_impa7(void)
 	int i;
 	for (i=0; i<NUM_FLASHBANKS; i++) {
 		if (impa7_mtd[i]) {
-#ifdef CONFIG_MTD_PARTITIONS
-			del_mtd_partitions(impa7_mtd[i]);
-#else
-			del_mtd_device(impa7_mtd[i]);
-#endif
+			mtd_device_unregister(impa7_mtd[i]);
 			map_destroy(impa7_mtd[i]);
 			iounmap((void *)impa7_map[i].virt);
 			impa7_map[i].virt = 0;
-- 
1.7.4.4
