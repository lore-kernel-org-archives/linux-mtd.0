Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QORO7-0002Tm-Ca
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:25:25 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so4359562wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:25:23 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 39/62] mtd/edb7312 nand: convert to mtd_device_register()
Date: Mon, 23 May 2011 10:23:20 +0100
Message-Id: <1306142623-24952-40-git-send-email-jamie@jamieiles.com>
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
 drivers/mtd/nand/edb7312.c |    9 +--------
 1 files changed, 1 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/edb7312.c b/drivers/mtd/nand/edb7312.c
index 86366bf..8400d0f 100644
--- a/drivers/mtd/nand/edb7312.c
+++ b/drivers/mtd/nand/edb7312.c
@@ -55,7 +55,6 @@ static unsigned long ep7312_fio_pbase = EP7312_FIO_PBASE;
 static void __iomem *ep7312_pxdr = (void __iomem *)EP7312_PXDR;
 static void __iomem *ep7312_pxddr = (void __iomem *)EP7312_PXDDR;
 
-#ifdef CONFIG_MTD_PARTITIONS
 /*
  * Define static partitions for flash device
  */
@@ -67,8 +66,6 @@ static struct mtd_partition partition_info[] = {
 
 #define NUM_PARTITIONS 1
 
-#endif
-
 /*
  *	hardware specific access to control-lines
  *
@@ -101,9 +98,7 @@ static int ep7312_device_ready(struct mtd_info *mtd)
 	return 1;
 }
 
-#ifdef CONFIG_MTD_PARTITIONS
 const char *part_probes[] = { "cmdlinepart", NULL };
-#endif
 
 /*
  * Main initialization routine
@@ -162,14 +157,12 @@ static int __init ep7312_init(void)
 		kfree(ep7312_mtd);
 		return -ENXIO;
 	}
-#ifdef CONFIG_MTD_PARTITIONS
 	ep7312_mtd->name = "edb7312-nand";
 	mtd_parts_nb = parse_mtd_partitions(ep7312_mtd, part_probes, &mtd_parts, 0);
 	if (mtd_parts_nb > 0)
 		part_type = "command line";
 	else
 		mtd_parts_nb = 0;
-#endif
 	if (mtd_parts_nb == 0) {
 		mtd_parts = partition_info;
 		mtd_parts_nb = NUM_PARTITIONS;
@@ -178,7 +171,7 @@ static int __init ep7312_init(void)
 
 	/* Register the partitions */
 	printk(KERN_NOTICE "Using %s partition definition\n", part_type);
-	add_mtd_partitions(ep7312_mtd, mtd_parts, mtd_parts_nb);
+	mtd_device_register(ep7312_mtd, mtd_parts, mtd_parts_nb);
 
 	/* Return happy */
 	return 0;
-- 
1.7.4.4
