Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QORNn-0002TB-0n
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:25:04 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so5098469wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:25:02 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 30/62] mtd/tqm8xll: convert to mtd_device_register()
Date: Mon, 23 May 2011 10:23:11 +0100
Message-Id: <1306142623-24952-31-git-send-email-jamie@jamieiles.com>
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
 drivers/mtd/maps/tqm8xxl.c |   20 +++++---------------
 1 files changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/maps/tqm8xxl.c b/drivers/mtd/maps/tqm8xxl.c
index 0718dfb..d785879 100644
--- a/drivers/mtd/maps/tqm8xxl.c
+++ b/drivers/mtd/maps/tqm8xxl.c
@@ -62,7 +62,6 @@ static void __iomem *start_scan_addr;
  * "struct map_desc *_io_desc" for the corresponding machine.
  */
 
-#ifdef CONFIG_MTD_PARTITIONS
 /* Currently, TQM8xxL has up to 8MiB flash */
 static unsigned long tqm8xxl_max_flash_size = 0x00800000;
 
@@ -107,7 +106,6 @@ static struct mtd_partition tqm8xxl_fs_partitions[] = {
 	  //.size = MTDPART_SIZ_FULL,
 	}
 };
-#endif
 
 static int __init init_tqm_mtd(void)
 {
@@ -188,7 +186,6 @@ static int __init init_tqm_mtd(void)
 		goto error_mem;
 	}
 
-#ifdef CONFIG_MTD_PARTITIONS
 	/*
 	 * Select Static partition definitions
 	 */
@@ -201,21 +198,14 @@ static int __init init_tqm_mtd(void)
 	part_banks[1].nums = ARRAY_SIZE(tqm8xxl_fs_partitions);
 
 	for(idx = 0; idx < num_banks ; idx++) {
-		if (part_banks[idx].nums == 0) {
+		if (part_banks[idx].nums == 0)
 			printk(KERN_NOTICE "TQM flash%d: no partition info available, registering whole flash at once\n", idx);
-			add_mtd_device(mtd_banks[idx]);
-		} else {
+		else
 			printk(KERN_NOTICE "TQM flash%d: Using %s partition definition\n",
 					idx, part_banks[idx].type);
-			add_mtd_partitions(mtd_banks[idx], part_banks[idx].mtd_part,
-								part_banks[idx].nums);
-		}
+		mtd_device_register(mtd_banks[idx], part_banks[idx].mtd_part,
+		part_banks[idx].nums);
 	}
-#else
-	printk(KERN_NOTICE "TQM flash: registering %d whole flash banks at once\n", num_banks);
-	for(idx = 0 ; idx < num_banks ; idx++)
-		add_mtd_device(mtd_banks[idx]);
-#endif
 	return 0;
 error_mem:
 	for(idx = 0 ; idx < FLASH_BANK_MAX ; idx++) {
@@ -237,7 +227,7 @@ static void __exit cleanup_tqm_mtd(void)
 	for(idx = 0 ; idx < num_banks ; idx++) {
 		/* destroy mtd_info previously allocated */
 		if (mtd_banks[idx]) {
-			del_mtd_partitions(mtd_banks[idx]);
+			mtd_device_unregister(mtd_banks[idx]);
 			map_destroy(mtd_banks[idx]);
 		}
 		/* release map_info not used anymore */
-- 
1.7.4.4
