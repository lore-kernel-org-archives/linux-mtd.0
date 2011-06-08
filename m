Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QULH2-0007LR-I1
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 16:06:30 +0000
Received: by wyb28 with SMTP id 28so631181wyb.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 09:06:27 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 19/43] mtd: solutionengine.c: use mtd_device_parse_register
Date: Wed,  8 Jun 2011 20:05:28 +0400
Message-Id: <1307549152-7085-20-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307549152-7085-1-git-send-email-dbaryshkov@gmail.com>
References: <1307549152-7085-1-git-send-email-dbaryshkov@gmail.com>
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

Replace custom invocations of parse_mtd_partitions and mtd_device_register
with common mtd_device_parse_register call. This would bring: standard
handling of all errors, fallback to default partitions, etc.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/maps/solutionengine.c |   30 +++++++-----------------------
 1 files changed, 7 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/maps/solutionengine.c b/drivers/mtd/maps/solutionengine.c
index cbf6bad..496c407 100644
--- a/drivers/mtd/maps/solutionengine.c
+++ b/drivers/mtd/maps/solutionengine.c
@@ -19,8 +19,6 @@
 static struct mtd_info *flash_mtd;
 static struct mtd_info *eprom_mtd;
 
-static struct mtd_partition *parsed_parts;
-
 struct map_info soleng_eprom_map = {
 	.name = "Solution Engine EPROM",
 	.size = 0x400000,
@@ -51,12 +49,14 @@ static struct mtd_partition superh_se_partitions[] = {
 		.size = MTDPART_SIZ_FULL,
 	}
 };
+#define NUM_PARTITIONS ARRAY_SIZE(superh_se_partitions)
+#else
+#define superh_se_partitions NULL
+#define NUM_PARTITIONS 0
 #endif /* CONFIG_MTD_SUPERH_RESERVE */
 
 static int __init init_soleng_maps(void)
 {
-	int nr_parts = 0;
-
 	/* First probe at offset 0 */
 	soleng_flash_map.phys = 0;
 	soleng_flash_map.virt = (void __iomem *)P2SEGADDR(0);
@@ -92,21 +92,8 @@ static int __init init_soleng_maps(void)
 		mtd_device_register(eprom_mtd, NULL, 0);
 	}
 
-	nr_parts = parse_mtd_partitions(flash_mtd, probes, &parsed_parts, 0);
-
-#ifdef CONFIG_MTD_SUPERH_RESERVE
-	if (nr_parts <= 0) {
-		printk(KERN_NOTICE "Using configured partition at 0x%08x.\n",
-		       CONFIG_MTD_SUPERH_RESERVE);
-		parsed_parts = superh_se_partitions;
-		nr_parts = sizeof(superh_se_partitions)/sizeof(*parsed_parts);
-	}
-#endif /* CONFIG_MTD_SUPERH_RESERVE */
-
-	if (nr_parts > 0)
-		mtd_device_register(flash_mtd, parsed_parts, nr_parts);
-	else
-		mtd_device_register(flash_mtd, NULL, 0);
+	mtd_device_parse_register(flash_mtd, probes, 0,
+			superh_se_partitions, NUM_PARTITIONS);
 
 	return 0;
 }
@@ -118,10 +105,7 @@ static void __exit cleanup_soleng_maps(void)
 		map_destroy(eprom_mtd);
 	}
 
-	if (parsed_parts)
-		mtd_device_unregister(flash_mtd);
-	else
-		mtd_device_unregister(flash_mtd);
+	mtd_device_unregister(flash_mtd);
 	map_destroy(flash_mtd);
 }
 
-- 
1.7.4.4
