Received: from mail.artecdesign.ee ([62.65.32.9] helo=postikukk.artecdesign.ee)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JM3IU-0007UC-TR
	for linux-mtd@lists.infradead.org; Mon, 04 Feb 2008 15:31:57 +0000
Subject: [PATCH] [MTD] [NAND] cs553x_nand: command line partitioning support
From: Mart Raudsepp <mart.raudsepp@artecdesign.ee>
To: David Woodhouse <dwmw2@infradead.org>,
	linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain
Date: Mon, 04 Feb 2008 16:53:17 +0200
Message-Id: <1202136797.4590.6.camel@martr-gentoo.artec>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Implements kernel command line partitioning support for the CS5535/CS5536 chipsets driver.

For that the following is done:

* cs553x_cleanup(): try the cleanup for all chip selects to not leak memory
* Assign a unique name for each chip select to be separately addressable in the command line mtd-id portion(s)
* Use the already defined PIN_OPT_IDE constant where appropriate for readability
* Include command line partitioning support when CONFIG_MTD_PARTS is set

Signed-off-by: Mart Raudsepp <mart.raudsepp@artecdesign.ee>
---
 drivers/mtd/nand/cs553x_nand.c |   31 ++++++++++++++++++++++++++++---
 1 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/cs553x_nand.c b/drivers/mtd/nand/cs553x_nand.c
index 89deff0..594187b 100644
--- a/drivers/mtd/nand/cs553x_nand.c
+++ b/drivers/mtd/nand/cs553x_nand.c
@@ -13,9 +13,12 @@
  *  Overview:
  *   This is a device driver for the NAND flash controller found on
  *   the AMD CS5535/CS5536 companion chipsets for the Geode processor.
+ *   mtd-id for command line partitioning is cs553x_nand_cs[0-3]
+ *   where 0-3 reflects the chip select for NAND.
  *
  */
 
+#include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/init.h>
 #include <linux/module.h>
@@ -244,6 +247,8 @@ static int __init cs553x_init_one(int cs, int mmio, unsigned long adr)
 		goto out_ior;
 	}
 
+	new_mtd->name = kasprintf(GFP_KERNEL, "cs553x_nand_cs%d", cs);
+
 	cs553x_mtd[cs] = new_mtd;
 	goto out;
 
@@ -272,12 +277,21 @@ static int is_geode(void)
 	return 0;
 }
 
+
+#ifdef CONFIG_MTD_PARTITIONS
+const char *part_probes[] = { "cmdlinepart", NULL };
+#endif
+
+
 static int __init cs553x_init(void)
 {
 	int err = -ENXIO;
 	int i;
 	uint64_t val;
 
+	int mtd_parts_nb = 0;
+	struct mtd_partition *mtd_parts = NULL;
+
 	/* If the CPU isn't a Geode GX or LX, abort */
 	if (!is_geode())
 		return -ENXIO;
@@ -290,7 +304,7 @@ static int __init cs553x_init(void)
 
 	/* If it doesn't have the NAND controller enabled, abort */
 	rdmsrl(MSR_DIVIL_BALL_OPTS, val);
-	if (val & 1) {
+	if (val & PIN_OPT_IDE) {
 		printk(KERN_INFO "CS553x NAND controller: Flash I/O not enabled in MSR_DIVIL_BALL_OPTS.\n");
 		return -ENXIO;
 	}
@@ -306,9 +320,19 @@ static int __init cs553x_init(void)
 	   do mtdconcat etc. if we want to. */
 	for (i = 0; i < NR_CS553X_CONTROLLERS; i++) {
 		if (cs553x_mtd[i]) {
-			add_mtd_device(cs553x_mtd[i]);
 
 			/* If any devices registered, return success. Else the last error. */
+#ifdef CONFIG_MTD_PARTITIONS
+			mtd_parts_nb = parse_mtd_partitions(cs553x_mtd[i], part_probes, &mtd_parts, 0);
+			if (mtd_parts_nb > 0) {
+				printk(KERN_NOTICE "Using command line partition definition\n");
+				add_mtd_partitions(cs553x_mtd[i], mtd_parts, mtd_parts_nb);
+			} else {
+				add_mtd_device(cs553x_mtd[i]);
+			}
+#else
+			add_mtd_device(cs553x_mtd[i]);
+#endif
 			err = 0;
 		}
 	}
@@ -328,13 +352,14 @@ static void __exit cs553x_cleanup(void)
 		void __iomem *mmio_base;
 
 		if (!mtd)
-			break;
+			continue;
 
 		this = cs553x_mtd[i]->priv;
 		mmio_base = this->IO_ADDR_R;
 
 		/* Release resources, unregister device */
 		nand_release(cs553x_mtd[i]);
+		kfree(cs553x_mtd[i]->name);
 		cs553x_mtd[i] = NULL;
 
 		/* unmap physical adress */
-- 
1.5.4
