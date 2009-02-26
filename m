Received: from smtp124.sbc.mail.sp1.yahoo.com ([69.147.64.97])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LcpUg-0004mK-NW
	for linux-mtd@lists.infradead.org; Thu, 26 Feb 2009 23:18:21 +0000
From: David Brownell <david-b@pacbell.net>
To: Andrew Morton <akpm@linux-foundation.org>,
 linux-mtd@lists.infradead.org
Subject: [patch 2.6.29-rc6-mmotm] MTD: partitioning utility predicates
Date: Thu, 26 Feb 2009 15:18:16 -0800
References: <200902241509.54649.david-b@pacbell.net>
	<20090226123341.a2421733.akpm@linux-foundation.org>
In-Reply-To: <20090226123341.a2421733.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200902261518.16378.david-b@pacbell.net>
Cc: linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: David Brownell <dbrownell@users.sourceforge.net>

Move mtd_has_partitions() and mtd_has_cmdlinepart() inlines from
a DaVinci-specific driver to the <linux/mtd/partitions.h> header.

Use those to eliminate #ifdefs in two drivers which had their
own definitions of mtd_has_partitions().

Signed-off-by: David Brownell <dbrownell@users.sourceforge.net>
---
Quite a lot of other MTD drivers could benefit from using use one
or both of these to remove #ifdeffery.  Maybe some Janitors
would like to help?

 drivers/mtd/devices/m25p80.c        |   17 ++++++-----------
 drivers/mtd/devices/mtd_dataflash.c |   16 ++++++----------
 drivers/mtd/nand/davinci_nand.c     |   13 -------------
 include/linux/mtd/partitions.h      |   12 ++++++++++++
 4 files changed, 24 insertions(+), 34 deletions(-)

--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
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
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
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
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -39,19 +39,6 @@
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
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
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
