Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QOROa-0002TQ-7l
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:25:54 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so5098499wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:25:51 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 51/62] mtd/ppchameleonevb: convert to mtd_device_register()
Date: Mon, 23 May 2011 10:23:32 +0100
Message-Id: <1306142623-24952-52-git-send-email-jamie@jamieiles.com>
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
 drivers/mtd/nand/ppchameleonevb.c |   15 +++++----------
 1 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/ppchameleonevb.c b/drivers/mtd/nand/ppchameleonevb.c
index cc86584..3bbb796 100644
--- a/drivers/mtd/nand/ppchameleonevb.c
+++ b/drivers/mtd/nand/ppchameleonevb.c
@@ -73,7 +73,6 @@ __setup("ppchameleon_fio_pbase=", ppchameleon_fio_pbase);
 __setup("ppchameleonevb_fio_pbase=", ppchameleonevb_fio_pbase);
 #endif
 
-#ifdef CONFIG_MTD_PARTITIONS
 /*
  * Define static partitions for flash devices
  */
@@ -101,7 +100,6 @@ static struct mtd_partition partition_info_evb[] = {
 #define NUM_PARTITIONS 1
 
 extern int parse_cmdline_partitions(struct mtd_info *master, struct mtd_partition **pparts, const char *mtd_id);
-#endif
 
 /*
  *	hardware specific access to control-lines
@@ -189,10 +187,8 @@ static int ppchameleonevb_device_ready(struct mtd_info *minfo)
 }
 #endif
 
-#ifdef CONFIG_MTD_PARTITIONS
 const char *part_probes[] = { "cmdlinepart", NULL };
 const char *part_probes_evb[] = { "cmdlinepart", NULL };
-#endif
 
 /*
  * Main initialization routine
@@ -284,14 +280,13 @@ static int __init ppchameleonevb_init(void)
 		this->chip_delay = NAND_SMALL_DELAY_US;
 #endif
 
-#ifdef CONFIG_MTD_PARTITIONS
 	ppchameleon_mtd->name = "ppchameleon-nand";
 	mtd_parts_nb = parse_mtd_partitions(ppchameleon_mtd, part_probes, &mtd_parts, 0);
 	if (mtd_parts_nb > 0)
 		part_type = "command line";
 	else
 		mtd_parts_nb = 0;
-#endif
+
 	if (mtd_parts_nb == 0) {
 		if (ppchameleon_mtd->size == NAND_SMALL_SIZE)
 			mtd_parts = partition_info_me;
@@ -303,7 +298,7 @@ static int __init ppchameleonevb_init(void)
 
 	/* Register the partitions */
 	printk(KERN_NOTICE "Using %s partition definition\n", part_type);
-	add_mtd_partitions(ppchameleon_mtd, mtd_parts, mtd_parts_nb);
+	mtd_device_register(ppchameleon_mtd, mtd_parts, mtd_parts_nb);
 
  nand_evb_init:
 	/****************************
@@ -385,14 +380,14 @@ static int __init ppchameleonevb_init(void)
 			iounmap(ppchameleon_fio_base);
 		return -ENXIO;
 	}
-#ifdef CONFIG_MTD_PARTITIONS
+
 	ppchameleonevb_mtd->name = NAND_EVB_MTD_NAME;
 	mtd_parts_nb = parse_mtd_partitions(ppchameleonevb_mtd, part_probes_evb, &mtd_parts, 0);
 	if (mtd_parts_nb > 0)
 		part_type = "command line";
 	else
 		mtd_parts_nb = 0;
-#endif
+
 	if (mtd_parts_nb == 0) {
 		mtd_parts = partition_info_evb;
 		mtd_parts_nb = NUM_PARTITIONS;
@@ -401,7 +396,7 @@ static int __init ppchameleonevb_init(void)
 
 	/* Register the partitions */
 	printk(KERN_NOTICE "Using %s partition definition\n", part_type);
-	add_mtd_partitions(ppchameleonevb_mtd, mtd_parts, mtd_parts_nb);
+	mtd_device_register(ppchameleonevb_mtd, mtd_parts, mtd_parts_nb);
 
 	/* Return happy */
 	return 0;
-- 
1.7.4.4
