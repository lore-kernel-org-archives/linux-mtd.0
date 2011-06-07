Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTwTA-0001Ql-L0
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 13:37:21 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so4898925wyb.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Jun 2011 06:37:20 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 21/44] mtd: wr_sbc82xx_flash.c: use mtd_device_parse_register
Date: Tue,  7 Jun 2011 17:36:20 +0400
Message-Id: <1307453803-31950-22-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307453803-31950-1-git-send-email-dbaryshkov@gmail.com>
References: <1307453803-31950-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Replace custom invocations of parse_mtd_partitions and mtd_device_register
with common mtd_device_parse_register call. This would bring: standard
handling of all errors, fallback to default partitions, etc.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/maps/wr_sbc82xx_flash.c |   30 +++++++++++-------------------
 1 files changed, 11 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/maps/wr_sbc82xx_flash.c b/drivers/mtd/maps/wr_sbc82xx_flash.c
index 901ce96..aaec902 100644
--- a/drivers/mtd/maps/wr_sbc82xx_flash.c
+++ b/drivers/mtd/maps/wr_sbc82xx_flash.c
@@ -20,7 +20,6 @@
 #include <asm/immap_cpm2.h>
 
 static struct mtd_info *sbcmtd[3];
-static struct mtd_partition *sbcmtd_parts[3];
 
 struct map_info sbc82xx_flash_map[3] = {
 	{.name = "Boot flash"},
@@ -101,6 +100,7 @@ static int __init init_sbc82xx_flash(void)
 	for (i=0; i<3; i++) {
 		int8_t flashcs[3] = { 0, 6, 1 };
 		int nr_parts;
+		struct mtd_partition *defparts;
 
 		printk(KERN_NOTICE "PowerQUICC II %s (%ld MiB on CS%d",
 		       sbc82xx_flash_map[i].name,
@@ -129,24 +129,20 @@ static int __init init_sbc82xx_flash(void)
 
 		sbcmtd[i]->owner = THIS_MODULE;
 
-		nr_parts = parse_mtd_partitions(sbcmtd[i], part_probes,
-						&sbcmtd_parts[i], 0);
-		if (nr_parts > 0) {
-			mtd_device_register(sbcmtd[i], sbcmtd_parts[i],
-					    nr_parts);
-			continue;
-		}
-
 		/* No partitioning detected. Use default */
 		if (i == 2) {
-			mtd_device_register(sbcmtd[i], NULL, 0);
+			defparts = NULL;
+			nr_parts = 0;
 		} else if (i == bigflash) {
-			mtd_device_register(sbcmtd[i], bigflash_parts,
-					    ARRAY_SIZE(bigflash_parts));
+			defparts = bigflash_parts;
+			nr_parts = ARRAY_SIZE(bigflash_parts);
 		} else {
-			mtd_device_register(sbcmtd[i], smallflash_parts,
-					    ARRAY_SIZE(smallflash_parts));
+			defparts = smallflash_parts;
+			nr_parts = ARRAY_SIZE(smallflash_parts);
 		}
+
+		mtd_device_parse_register(sbcmtd[i], part_probes, 0,
+				defparts, nr_parts);
 	}
 	return 0;
 }
@@ -159,12 +155,8 @@ static void __exit cleanup_sbc82xx_flash(void)
 		if (!sbcmtd[i])
 			continue;
 
-		if (i<2 || sbcmtd_parts[i])
-			mtd_device_unregister(sbcmtd[i]);
-		else
-			mtd_device_unregister(sbcmtd[i]);
+		mtd_device_unregister(sbcmtd[i]);
 
-		kfree(sbcmtd_parts[i]);
 		map_destroy(sbcmtd[i]);
 
 		iounmap((void *)sbc82xx_flash_map[i].virt);
-- 
1.7.4.4
