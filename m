Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QULAc-0006xQ-2i
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 15:59:50 +0000
Received: by wyb28 with SMTP id 28so623673wyb.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 08:59:47 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: lart.c: cleanup: drop HAVE_PARTITIONS
Date: Wed,  8 Jun 2011 19:59:49 +0400
Message-Id: <1307548789-5733-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Russell King <linux@arm.linux.org.uk>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Consolidate knowledge about partitions in drivers/mtd/devices/lart.c.
Drop all HAVE_PARTITIONS conditionals. Always use partitioning.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/devices/lart.c |   18 +-----------------
 1 files changed, 1 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/devices/lart.c b/drivers/mtd/devices/lart.c
index 772a0ff..3a11ea6 100644
--- a/drivers/mtd/devices/lart.c
+++ b/drivers/mtd/devices/lart.c
@@ -34,9 +34,6 @@
 /* debugging */
 //#define LART_DEBUG
 
-/* partition support */
-#define HAVE_PARTITIONS
-
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/types.h>
@@ -44,9 +41,7 @@
 #include <linux/errno.h>
 #include <linux/string.h>
 #include <linux/mtd/mtd.h>
-#ifdef HAVE_PARTITIONS
 #include <linux/mtd/partitions.h>
-#endif
 
 #ifndef CONFIG_SA1100_LART
 #error This is for LART architecture only
@@ -598,7 +593,6 @@ static struct mtd_erase_region_info erase_regions[] = {
 	}
 };
 
-#ifdef HAVE_PARTITIONS
 static struct mtd_partition lart_partitions[] = {
 	/* blob */
 	{
@@ -619,7 +613,7 @@ static struct mtd_partition lart_partitions[] = {
 		.size	= INITRD_LEN,		/* MTDPART_SIZ_FULL */
 	}
 };
-#endif
+#define NUM_PARTITIONS ARRAY_SIZE(lart_partitions)
 
 static int __init lart_flash_init (void)
 {
@@ -668,7 +662,6 @@ static int __init lart_flash_init (void)
 			   result,mtd.eraseregions[result].erasesize,mtd.eraseregions[result].erasesize / 1024,
 			   result,mtd.eraseregions[result].numblocks);
 
-#ifdef HAVE_PARTITIONS
    printk ("\npartitions = %d\n", ARRAY_SIZE(lart_partitions));
 
    for (result = 0; result < ARRAY_SIZE(lart_partitions); result++)
@@ -681,25 +674,16 @@ static int __init lart_flash_init (void)
 			 result,lart_partitions[result].offset,
 			 result,lart_partitions[result].size,lart_partitions[result].size / 1024);
 #endif
-#endif
 
-#ifndef HAVE_PARTITIONS
-   result = mtd_device_register(&mtd, NULL, 0);
-#else
    result = mtd_device_register(&mtd, lart_partitions,
                                 ARRAY_SIZE(lart_partitions));
-#endif
 
    return (result);
 }
 
 static void __exit lart_flash_exit (void)
 {
-#ifndef HAVE_PARTITIONS
-   mtd_device_unregister(&mtd);
-#else
    mtd_device_unregister(&mtd);
-#endif
 }
 
 module_init (lart_flash_init);
-- 
1.7.4.4
