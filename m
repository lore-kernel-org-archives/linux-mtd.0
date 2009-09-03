Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MjAIa-0005mz-EE
	for linux-mtd@lists.infradead.org; Thu, 03 Sep 2009 11:16:22 +0000
Received: from vaebh105.NOE.Nokia.com (vaebh105.europe.nokia.com
	[10.160.244.31])
	by mgw-mx03.nokia.com (Switch-3.3.3/Switch-3.3.3) with ESMTP id
	n83BG1TT008502
	for <linux-mtd@lists.infradead.org>; Thu, 3 Sep 2009 14:16:06 +0300
From: Mika Korhonen <ext-mika.2.korhonen@nokia.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] MTD OneNAND OMAP2/3: allow giving partition layout as module
	parameter
Date: Thu,  3 Sep 2009 14:15:58 +0300
Message-Id: <1251976558-13463-1-git-send-email-ext-mika.2.korhonen@nokia.com>
Cc: Mika Korhonen <ext-mika.2.korhonen@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add module parameter "parts" to omap2-onenand driver. Parameter format is
the same as for cmdlinepart except mtd-id must not be specified - it
gets prepended by the driver, i.e.: parts=<partdef>[,<partdef>]*

This allows one to repartition the OneNAND chip and is useful for flashing
applications that do the partitioning from scratch or want to backup and
update the partitioning.

Signed-off-by: Mika Korhonen <ext-mika.2.korhonen@nokia.com>
---
 drivers/mtd/cmdlinepart.c   |   35 +++++++++++++++++++++++++++++------
 drivers/mtd/onenand/omap2.c |   29 +++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index 1479da6..77fa7b7 100644
--- a/drivers/mtd/cmdlinepart.c
+++ b/drivers/mtd/cmdlinepart.c
@@ -5,7 +5,7 @@
  *
  * The format for the command line is as follows:
  *
- * mtdparts=<mtddef>[;<mtddef]
+ * mtdparts=<mtddef>[;<mtddef>]
  * <mtddef>  := <mtd-id>:<partdef>[,<partdef>]
  *              where <mtd-id> is the name from the "cat /proc/mtd" command
  * <partdef> := <size>[@offset][<name>][ro][lk]
@@ -54,7 +54,7 @@ struct cmdline_mtd_partition {
 /* mtdpart_setup() parses into here */
 static struct cmdline_mtd_partition *partitions;
 
-/* the command line passed to mtdpart_setupd() */
+/* the command line passed to mtdpart_setup() */
 static char *cmdline;
 static int cmdline_parsed = 0;
 
@@ -219,9 +219,8 @@ static int mtdpart_setup_real(char *s)
 {
 	cmdline_parsed = 1;
 
-	for( ; s != NULL; )
-	{
-		struct cmdline_mtd_partition *this_mtd;
+	for ( ; s != NULL; ) {
+		struct cmdline_mtd_partition *this_mtd, *mtd, *mtd_prev;
 		struct mtd_partition *parts;
 	    	int mtd_id_len;
 		int num_parts;
@@ -270,6 +269,27 @@ static int mtdpart_setup_real(char *s)
 		this_mtd->mtd_id = (char*)(this_mtd + 1);
 		strlcpy(this_mtd->mtd_id, mtd_id, mtd_id_len + 1);
 
+		/* remove existing ones with the same id */
+		mtd_prev = NULL;
+		for (mtd = partitions; mtd;)	{
+			if (strcmp(this_mtd->mtd_id, mtd->mtd_id) == 0) {
+				printk(KERN_INFO "old entry for mtd id %s "
+					"exists, removing\n", mtd->mtd_id);
+				if (mtd_prev) {
+					mtd_prev->next = mtd->next;
+					kfree(mtd);
+					mtd = mtd_prev->next;
+				} else {
+					partitions = mtd->next;
+					kfree(mtd);
+					mtd = partitions;
+				}
+			} else {
+				mtd_prev = mtd;
+				mtd = mtd->next;
+			}
+		}
+
 		/* link into chain */
 		this_mtd->next = partitions;
 		partitions = this_mtd;
@@ -354,12 +374,15 @@ static int parse_cmdline_partitions(struct mtd_info *master,
  *
  * This function needs to be visible for bootloaders.
  */
-static int mtdpart_setup(char *s)
+int mtdpart_setup(char *s)
 {
 	cmdline = s;
+	cmdline_parsed = 0;
 	return 1;
 }
 
+EXPORT_SYMBOL(mtdpart_setup);
+
 __setup("mtdparts=", mtdpart_setup);
 
 static struct mtd_part_parser cmdline_parser = {
diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
index 0108ed4..b216a92 100644
--- a/drivers/mtd/onenand/omap2.c
+++ b/drivers/mtd/onenand/omap2.c
@@ -45,6 +45,7 @@
 #include <mach/board.h>
 
 #define DRIVER_NAME "omap2-onenand"
+#define DRIVER_NAME_SIZE sizeof(DRIVER_NAME)
 
 #define ONENAND_IO_SIZE		SZ_128K
 #define ONENAND_BUFRAM_SIZE	(1024 * 5)
@@ -64,6 +65,17 @@ struct omap2_onenand {
 	int (*setup)(void __iomem *base, int freq);
 };
 
+
+#ifdef CONFIG_MTD_CMDLINE_PARTS
+extern int mtdpart_setup(char *);
+
+static const char *part_probes[] = { "cmdlinepart", NULL };
+static char parts[256] = DRIVER_NAME ":";
+
+module_param_string(parts, parts + DRIVER_NAME_SIZE, 256 - DRIVER_NAME_SIZE, 0);
+#endif
+
+
 static void omap2_onenand_dma_cb(int lch, u16 ch_status, void *data)
 {
 	struct omap2_onenand *c = data;
@@ -709,6 +721,23 @@ static int __devinit omap2_onenand_probe(struct platform_device *pdev)
 	}
 
 #ifdef CONFIG_MTD_PARTITIONS
+#ifdef CONFIG_MTD_CMDLINE_PARTS
+	printk(KERN_INFO "parts=%s\n", parts);
+	/* check module parameter */
+	if (parts[DRIVER_NAME_SIZE] != '\0') {
+		/* check parts string */
+		if (strchr(parts, ';') || strchr(parts + DRIVER_NAME_SIZE, ':')) {
+			printk(KERN_ERR "onenand_probe: invalid partition parameter\n");
+		} else {
+			mtdpart_setup(parts);
+		}
+	}
+	r = parse_mtd_partitions(&c->mtd, part_probes, &c->parts, 0);
+	if (r > 0) {
+		/* module param or kernel command line arg */
+		r = add_mtd_partitions(&c->mtd, c->parts, r);
+	} else
+#endif
 	if (pdata->parts != NULL)
 		r = add_mtd_partitions(&c->mtd, pdata->parts,
 				       pdata->nr_parts);
-- 
1.6.0.4
