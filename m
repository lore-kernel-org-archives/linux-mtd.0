Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N7m1x-0004J2-Pt
	for linux-mtd@lists.infradead.org; Tue, 10 Nov 2009 08:24:54 +0000
From: Mika Korhonen <ext-mika.2.korhonen@nokia.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 1/1] MTD OneNAND OMAP2/3: allow giving partition layout as
	module parameter
Date: Tue, 10 Nov 2009 10:22:35 +0200
Message-Id: <1257841355-5773-2-git-send-email-ext-mika.2.korhonen@nokia.com>
In-Reply-To: <1257841355-5773-1-git-send-email-ext-mika.2.korhonen@nokia.com>
References: <1257841355-5773-1-git-send-email-ext-mika.2.korhonen@nokia.com>
Cc: Mika Korhonen <ext-mika.2.korhonen@nokia.com>, adrian.hunter@nokia.com,
	vimal.newwork@gmail.com, dedekind1@gmail.com
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
 drivers/mtd/Kconfig            |   15 ++++++---------
 drivers/mtd/cmdlinepart.c      |   34 ++++++++++++++++++++++++++++------
 drivers/mtd/onenand/Kconfig    |    2 ++
 drivers/mtd/onenand/omap2.c    |   32 +++++++++++++++++++++++++-------
 include/linux/mtd/partitions.h |    1 +
 5 files changed, 62 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index e4ec365..bf92153 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -112,23 +112,20 @@ config MTD_CMDLINE_PARTS
 	  different kinds of flash memory are available.
 
 	  You will still need the parsing functions to be called by the driver
-	  for your particular device. It won't happen automatically. The
-	  SA1100 map driver (CONFIG_MTD_SA1100) has an option for this, for
-	  example.
+	  for your particular device. It won't happen automatically. The SA1100
+	  map driver (CONFIG_MTD_SA1100) has an option for this, for example.
 
 	  The format for the command line is as follows:
 
-	  mtdparts=<mtddef>[;<mtddef]
+	  mtdparts=<mtddef>[;<mtddef>]
 	  <mtddef>  := <mtd-id>:<partdef>[,<partdef>]
 	  <partdef> := <size>[@offset][<name>][ro]
 	  <mtd-id>  := unique id used in mapping driver/device
-	  <size>    := standard linux memsize OR "-" to denote all
-	  remaining space
+	  <size>    := standard linux memsize OR "-" for all remaining space
 	  <name>    := (NAME)
 
-	  Due to the way Linux handles the command line, no spaces are
-	  allowed in the partition definition, including mtd id's and partition
-	  names.
+	  Due to the way Linux handles the command line, no spaces are allowed
+	  in the partition definition, including mtd id's and partition names.
 
 	  Examples:
 
diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index 1479da6..ea4ddd5 100644
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
+		for (mtd = partitions; mtd;) {
+			if (strcmp(this_mtd->mtd_id, mtd->mtd_id) == 0) {
+				printk(KERN_INFO "old entry for mtd id %s "
+				       "exists, removing\n", mtd->mtd_id);
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
@@ -354,11 +374,13 @@ static int parse_cmdline_partitions(struct mtd_info *master,
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
 
 __setup("mtdparts=", mtdpart_setup);
 
diff --git a/drivers/mtd/onenand/Kconfig b/drivers/mtd/onenand/Kconfig
index a38f580..402958c 100644
--- a/drivers/mtd/onenand/Kconfig
+++ b/drivers/mtd/onenand/Kconfig
@@ -30,6 +30,8 @@ config MTD_ONENAND_GENERIC
 config MTD_ONENAND_OMAP2
 	tristate "OneNAND on OMAP2/OMAP3 support"
 	depends on MTD_ONENAND && (ARCH_OMAP2 || ARCH_OMAP3)
+	select MTD_PARTITIONS
+	select MTD_CMDLINE_PARTS
 	help
 	  Support for a OneNAND flash device connected to an OMAP2/OMAP3 CPU
 	  via the GPMC memory controller.
diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
index 0108ed4..27c986e 100644
--- a/drivers/mtd/onenand/omap2.c
+++ b/drivers/mtd/onenand/omap2.c
@@ -64,6 +64,14 @@ struct omap2_onenand {
 	int (*setup)(void __iomem *base, int freq);
 };
 
+
+static const char *part_probes[] = { "cmdlinepart", NULL };
+static char parts[256] = DRIVER_NAME ":";
+
+module_param_string(parts, parts + sizeof(DRIVER_NAME),
+		    256 - sizeof(DRIVER_NAME), 0);
+
+
 static void omap2_onenand_dma_cb(int lch, u16 ch_status, void *data)
 {
 	struct omap2_onenand *c = data;
@@ -708,13 +716,27 @@ static int __devinit omap2_onenand_probe(struct platform_device *pdev)
 		break;
 	}
 
-#ifdef CONFIG_MTD_PARTITIONS
-	if (pdata->parts != NULL)
+	printk(KERN_INFO "parts=%s\n", parts);
+	/* check module parameter */
+	if (parts[sizeof(DRIVER_NAME)] != '\0') {
+		/* check parts string */
+		if (strchr(parts, ';') ||
+		    strchr(parts + sizeof(DRIVER_NAME), ':'))
+			printk(KERN_ERR "%s: invalid partition parameter\n",
+			       __func__);
+		else
+			mtdpart_setup(parts);
+	}
+	r = parse_mtd_partitions(&c->mtd, part_probes, &c->parts, 0);
+	if (r > 0)
+		/* module param or kernel command line arg */
+		r = add_mtd_partitions(&c->mtd, c->parts, r);
+	else if (pdata->parts != NULL)
 		r = add_mtd_partitions(&c->mtd, pdata->parts,
 				       pdata->nr_parts);
 	else
-#endif
 		r = add_mtd_device(&c->mtd);
+
 	if (r < 0)
 		goto err_release_onenand;
 
@@ -750,14 +772,10 @@ static int __devexit omap2_onenand_remove(struct platform_device *pdev)
 
 	BUG_ON(c == NULL);
 
-#ifdef CONFIG_MTD_PARTITIONS
 	if (c->parts)
 		del_mtd_partitions(&c->mtd);
 	else
 		del_mtd_device(&c->mtd);
-#else
-	del_mtd_device(&c->mtd);
-#endif
 
 	onenand_release(&c->mtd);
 	if (c->dma_channel != -1)
diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index 274b619..038ee25 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -84,6 +84,7 @@ static inline int mtd_has_partitions(void) { return 0; }
 #endif
 
 #ifdef CONFIG_MTD_CMDLINE_PARTS
+extern int mtdpart_setup(char *);
 static inline int mtd_has_cmdlinepart(void) { return 1; }
 #else
 static inline int mtd_has_cmdlinepart(void) { return 0; }
-- 
1.6.0.4
