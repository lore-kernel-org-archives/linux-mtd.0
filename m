Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QORO0-0002TQ-G1
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:25:17 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so5098499wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:25:16 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 36/62] mtd/cs553x_nand: convert to mtd_device_register()
Date: Mon, 23 May 2011 10:23:17 +0100
Message-Id: <1306142623-24952-37-git-send-email-jamie@jamieiles.com>
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
 drivers/mtd/nand/cs553x_nand.c |   19 +++----------------
 1 files changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/cs553x_nand.c b/drivers/mtd/nand/cs553x_nand.c
index 71c35a0..f59ad1f 100644
--- a/drivers/mtd/nand/cs553x_nand.c
+++ b/drivers/mtd/nand/cs553x_nand.c
@@ -277,22 +277,15 @@ static int is_geode(void)
 	return 0;
 }
 
-
-#ifdef CONFIG_MTD_PARTITIONS
 static const char *part_probes[] = { "cmdlinepart", NULL };
-#endif
-
 
 static int __init cs553x_init(void)
 {
 	int err = -ENXIO;
 	int i;
 	uint64_t val;
-
-#ifdef CONFIG_MTD_PARTITIONS
 	int mtd_parts_nb = 0;
 	struct mtd_partition *mtd_parts = NULL;
-#endif
 
 	/* If the CPU isn't a Geode GX or LX, abort */
 	if (!is_geode())
@@ -324,17 +317,11 @@ static int __init cs553x_init(void)
 		if (cs553x_mtd[i]) {
 
 			/* If any devices registered, return success. Else the last error. */
-#ifdef CONFIG_MTD_PARTITIONS
 			mtd_parts_nb = parse_mtd_partitions(cs553x_mtd[i], part_probes, &mtd_parts, 0);
-			if (mtd_parts_nb > 0) {
+			if (mtd_parts_nb > 0)
 				printk(KERN_NOTICE "Using command line partition definition\n");
-				add_mtd_partitions(cs553x_mtd[i], mtd_parts, mtd_parts_nb);
-			} else {
-				add_mtd_device(cs553x_mtd[i]);
-			}
-#else
-			add_mtd_device(cs553x_mtd[i]);
-#endif
+			mtd_device_register(cs553x_mtd[i], mtd_parts,
+					    mtd_parts_nb);
 			err = 0;
 		}
 	}
-- 
1.7.4.4
