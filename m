Message-Id: <200903042001.n24K1feH028798@imap1.linux-foundation.org>
Subject: [patch 14/15] mtd: partitioning utility predicates
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Wed, 04 Mar 2009 12:01:41 -0800
Cc: akpm@linux-foundation.org, dbrownell@users.sourceforge.net,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: David Brownell <dbrownell@users.sourceforge.net>

Move mtd_has_partitions() and mtd_has_cmdlinepart() inlines from a
DaVinci-specific driver to the <linux/mtd/partitions.h> header.

Use those to eliminate #ifdefs in two drivers which had their own
definitions of mtd_has_partitions().

Quite a lot of other MTD drivers could benefit from using use one or both
of these to remove #ifdeffery.  Maybe some Janitors would like to help.

Signed-off-by: David Brownell <dbrownell@users.sourceforge.net>
Cc: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/mtd/devices/m25p80.c        |   17 ++++++-----------
 drivers/mtd/devices/mtd_dataflash.c |   16 ++++++----------
 drivers/mtd/nand/davinci_nand.c     |   13 -------------
 include/linux/mtd/partitions.h      |   12 ++++++++++++
 4 files changed, 24 insertions(+), 34 deletions(-)

diff -puN drivers/mtd/devices/m25p80.c~mtd-partitioning-utility-predicates drivers/mtd/devices/m25p80.c
--- a/drivers/mtd/devices/m25p80.c~mtd-partitioning-utility-predicates
+++ a/drivers/mtd/devices/m25p80.c
@@ -65,12 +65,6 @@
 #define FAST_READ_DUMMY_BYTE 0
 #endif
 
-#ifdef CONFIG_MTD_PARTITIONS
-#define	mtd_has_partitions()	(1)
-#else
-#define	mtd_has_partitions()	(0)
-#endif
-
 /****************************************************************************/
 
 struct m25p {
@@ -708,12 +702,13 @@ static int __devinit m25p_probe(struct s
 		struct mtd_partition	*parts = NULL;
 		int			nr_parts = 0;
 
-#ifdef CONFIG_MTD_CMDLINE_PARTS
-		static const char *part_probes[] = { "cmdlinepart", NULL, };
+		if (mtd_has_cmdlinepart()) {
+			static const char *part_probes[]
+					= { "cmdlinepart", NULL, };
 
-		nr_parts = parse_mtd_partitions(&flash->mtd,
-				part_probes, &parts, 0);
-#endif
+			nr_parts = parse_mtd_partitions(&flash->mtd,
+					part_probes, &parts, 0);
+		}
 
 		if (nr_parts <= 0 && data && data->parts) {
 			parts = data->parts;
diff -puN drivers/mtd/devices/mtd_dataflash.c~mtd-partitioning-utility-predicates drivers/mtd/devices/mtd_dataflash.c
--- a/drivers/mtd/devices/mtd_dataflash.c~mtd-partitioning-utility-predicates
+++ a/drivers/mtd/devices/mtd_dataflash.c
@@ -98,12 +98,6 @@ struct dataflash {
 	struct mtd_info		mtd;
 };
 
-#ifdef CONFIG_MTD_PARTITIONS
-#define	mtd_has_partitions()	(1)
-#else
-#define	mtd_has_partitions()	(0)
-#endif
-
 /* ......................................................................... */
 
 /*
@@ -682,11 +676,13 @@ add_dataflash_otp(struct spi_device *spi
 		struct mtd_partition	*parts;
 		int			nr_parts = 0;
 
-#ifdef CONFIG_MTD_CMDLINE_PARTS
-		static const char *part_probes[] = { "cmdlinepart", NULL, };
+		if (mtd_has_cmdlinepart()) {
+			static const char *part_probes[]
+					= { "cmdlinepart", NULL, };
 
-		nr_parts = parse_mtd_partitions(device, part_probes, &parts, 0);
-#endif
+			nr_parts = parse_mtd_partitions(device,
+					part_probes, &parts, 0);
+		}
 
 		if (nr_parts <= 0 && pdata && pdata->parts) {
 			parts = pdata->parts;
diff -puN drivers/mtd/nand/davinci_nand.c~mtd-partitioning-utility-predicates drivers/mtd/nand/davinci_nand.c
--- a/drivers/mtd/nand/davinci_nand.c~mtd-partitioning-utility-predicates
+++ a/drivers/mtd/nand/davinci_nand.c
@@ -38,19 +38,6 @@
 #include <asm/mach-types.h>
 
 
-#ifdef CONFIG_MTD_PARTITIONS
-static inline int mtd_has_partitions(void) { return 1; }
-#else
-static inline int mtd_has_partitions(void) { return 0; }
-#endif
-
-#ifdef CONFIG_MTD_CMDLINE_PARTS
-static inline int mtd_has_cmdlinepart(void) { return 1; }
-#else
-static inline int mtd_has_cmdlinepart(void) { return 0; }
-#endif
-
-
 /*
  * This is a device driver for the NAND flash controller found on the
  * various DaVinci family chips.  It handles up to four SoC chipselects,
diff -puN include/linux/mtd/partitions.h~mtd-partitioning-utility-predicates include/linux/mtd/partitions.h
--- a/include/linux/mtd/partitions.h~mtd-partitioning-utility-predicates
+++ a/include/linux/mtd/partitions.h
@@ -76,4 +76,16 @@ int __devinit of_mtd_parse_partitions(st
                                       struct device_node *node,
                                       struct mtd_partition **pparts);
 
+#ifdef CONFIG_MTD_PARTITIONS
+static inline int mtd_has_partitions(void) { return 1; }
+#else
+static inline int mtd_has_partitions(void) { return 0; }
+#endif
+
+#ifdef CONFIG_MTD_CMDLINE_PARTS
+static inline int mtd_has_cmdlinepart(void) { return 1; }
+#else
+static inline int mtd_has_cmdlinepart(void) { return 0; }
+#endif
+
 #endif
_
