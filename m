Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTwSo-0001Tv-Hl
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 13:37:00 +0000
Received: by wwb39 with SMTP id 39so3852637wwb.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Jun 2011 06:36:57 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 08/44] mtd: h720x-flash.c: use mtd_device_parse_register
Date: Tue,  7 Jun 2011 17:36:07 +0400
Message-Id: <1307453803-31950-9-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/maps/h720x-flash.c |   21 ++-------------------
 1 files changed, 2 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/maps/h720x-flash.c b/drivers/mtd/maps/h720x-flash.c
index f331a2c..49c1418 100644
--- a/drivers/mtd/maps/h720x-flash.c
+++ b/drivers/mtd/maps/h720x-flash.c
@@ -58,16 +58,11 @@ static struct mtd_partition h720x_partitions[] = {
 
 #define NUM_PARTITIONS ARRAY_SIZE(h720x_partitions)
 
-static int                   nr_mtd_parts;
-static struct mtd_partition *mtd_parts;
 /*
  * Initialize FLASH support
  */
 static int __init h720x_mtd_init(void)
 {
-
-	char	*part_type = NULL;
-
 	h720x_map.virt = ioremap(h720x_map.phys, h720x_map.size);
 
 	if (!h720x_map.virt) {
@@ -90,16 +85,8 @@ static int __init h720x_mtd_init(void)
 	if (mymtd) {
 		mymtd->owner = THIS_MODULE;
 
-		nr_mtd_parts = parse_mtd_partitions(mymtd, NULL, &mtd_parts, 0);
-		if (nr_mtd_parts > 0)
-			part_type = "command line";
-		if (nr_mtd_parts <= 0) {
-			mtd_parts = h720x_partitions;
-			nr_mtd_parts = NUM_PARTITIONS;
-			part_type = "builtin";
-		}
-		printk(KERN_INFO "Using %s partition table\n", part_type);
-		mtd_device_register(mymtd, mtd_parts, nr_mtd_parts);
+		mtd_device_parse_register(mymtd, NULL, 0,
+				h720x_partitions, NUM_PARTITIONS);
 		return 0;
 	}
 
@@ -118,10 +105,6 @@ static void __exit h720x_mtd_cleanup(void)
 		map_destroy(mymtd);
 	}
 
-	/* Free partition info, if commandline partition was used */
-	if (mtd_parts && (mtd_parts != h720x_partitions))
-		kfree (mtd_parts);
-
 	if (h720x_map.virt) {
 		iounmap((void *)h720x_map.virt);
 		h720x_map.virt = 0;
-- 
1.7.4.4
