Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QULGk-0007GE-54
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 16:06:11 +0000
Received: by wwb39 with SMTP id 39so531513wwb.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 09:06:08 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 08/43] mtd: impa7.c: use mtd_device_parse_register
Date: Wed,  8 Jun 2011 20:05:17 +0400
Message-Id: <1307549152-7085-9-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/maps/impa7.c |   25 +++----------------------
 1 files changed, 3 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/maps/impa7.c b/drivers/mtd/maps/impa7.c
index 2d45a48..7b8b5d8 100644
--- a/drivers/mtd/maps/impa7.c
+++ b/drivers/mtd/maps/impa7.c
@@ -58,15 +58,10 @@ static struct mtd_partition static_partitions[] =
 	},
 };
 
-static int mtd_parts_nb[NUM_FLASHBANKS];
-static struct mtd_partition *mtd_parts[NUM_FLASHBANKS];
-
-
 static int __init init_impa7(void)
 {
 	static const char *rom_probe_types[] = PROBETYPES;
 	const char **type;
-	const char *part_type = 0;
 	int i;
 	static struct { u_long addr; u_long size; } pt[NUM_FLASHBANKS] = {
 	  { WINDOW_ADDR0, WINDOW_SIZE0 },
@@ -96,23 +91,9 @@ static int __init init_impa7(void)
 		if (impa7_mtd[i]) {
 			impa7_mtd[i]->owner = THIS_MODULE;
 			devicesfound++;
-			mtd_parts_nb[i] = parse_mtd_partitions(impa7_mtd[i],
-							       NULL,
-							       &mtd_parts[i],
-							       0);
-			if (mtd_parts_nb[i] > 0) {
-				part_type = "command line";
-			} else {
-				mtd_parts[i] = static_partitions;
-				mtd_parts_nb[i] = ARRAY_SIZE(static_partitions);
-				part_type = "static";
-			}
-
-			printk(KERN_NOTICE MSG_PREFIX
-			       "using %s partition definition\n",
-			       part_type);
-			mtd_device_register(impa7_mtd[i],
-					    mtd_parts[i], mtd_parts_nb[i]);
+			mtd_device_parse_register(impa7_mtd[i], NULL, 0,
+					static_partitions,
+					ARRAY_SIZE(static_partitions));
 		}
 		else
 			iounmap((void *)impa7_map[i].virt);
-- 
1.7.4.4
