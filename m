Received: from mail-qa0-f42.google.com ([209.85.216.42])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TfW7r-0000gT-74
 for linux-mtd@lists.infradead.org; Mon, 03 Dec 2012 13:32:02 +0000
Received: by mail-qa0-f42.google.com with SMTP id hg5so1367506qab.15
 for <linux-mtd@lists.infradead.org>; Mon, 03 Dec 2012 05:31:58 -0800 (PST)
From: Ezequiel Garcia <elezegarcia@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v2] nandsim: Introduce debugfs infrastructure
Date: Mon,  3 Dec 2012 10:31:40 -0300
Message-Id: <1354541500-436-1-git-send-email-elezegarcia@gmail.com>
Cc: Ezequiel Garcia <elezegarcia@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It's more user friendly to report debug information and statistics
through debugfs, than to use printing facilites.

This patch introduces a very minimal debugfs infrastructure
and moves eraseblock wear report to an entry located at:

/sys/kernel/debug/nandsim/wear_report

This means we can remove rptwear option and just let
the user get the wear report when we needs to.

Cc: Artem Bityutskiy <dedekind1@gmail.com>
Signed-off-by: Ezequiel Garcia <elezegarcia@gmail.com>
---
Changelog from v1:
 * Declare nandsim_debugfs_{create,remove} as static

 drivers/mtd/nand/nandsim.c |  186 ++++++++++++++++++++++++++++++-------------
 1 files changed, 130 insertions(+), 56 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index a932c48..2ab8274 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -42,6 +42,8 @@
 #include <linux/sched.h>
 #include <linux/fs.h>
 #include <linux/pagemap.h>
+#include <linux/seq_file.h>
+#include <linux/debugfs.h>
 
 /* Default simulator parameters values */
 #if !defined(CONFIG_NANDSIM_FIRST_ID_BYTE)  || \
@@ -105,7 +107,6 @@ static char *weakblocks = NULL;
 static char *weakpages = NULL;
 static unsigned int bitflips = 0;
 static char *gravepages = NULL;
-static unsigned int rptwear = 0;
 static unsigned int overridesize = 0;
 static char *cache_file = NULL;
 static unsigned int bbt;
@@ -130,7 +131,6 @@ module_param(weakblocks,     charp, 0400);
 module_param(weakpages,      charp, 0400);
 module_param(bitflips,       uint, 0400);
 module_param(gravepages,     charp, 0400);
-module_param(rptwear,        uint, 0400);
 module_param(overridesize,   uint, 0400);
 module_param(cache_file,     charp, 0400);
 module_param(bbt,	     uint, 0400);
@@ -162,7 +162,6 @@ MODULE_PARM_DESC(bitflips,       "Maximum number of random bit flips per page (z
 MODULE_PARM_DESC(gravepages,     "Pages that lose data [: maximum reads (defaults to 3)]"
 				 " separated by commas e.g. 1401:2 means page 1401"
 				 " can be read only twice before failing");
-MODULE_PARM_DESC(rptwear,        "Number of erases between reporting wear, if not zero");
 MODULE_PARM_DESC(overridesize,   "Specifies the NAND Flash size overriding the ID bytes. "
 				 "The size is specified in erase blocks and as the exponent of a power of two"
 				 " e.g. 5 means a size of 32 erase blocks");
@@ -286,6 +285,11 @@ MODULE_PARM_DESC(bch,		 "Enable BCH ecc and set how many bits should "
 /* Maximum page cache pages needed to read or write a NAND page to the cache_file */
 #define NS_MAX_HELD_PAGES 16
 
+struct nandsim_debug_info {
+	struct dentry *dfs_root;
+	struct dentry *dfs_wear_report;
+};
+
 /*
  * A union to represent flash memory contents and flash buffer.
  */
@@ -365,6 +369,8 @@ struct nandsim {
 	void *file_buf;
 	struct page *held_pages[NS_MAX_HELD_PAGES];
 	int held_cnt;
+
+	struct nandsim_debug_info dbg;
 };
 
 /*
@@ -442,11 +448,123 @@ static LIST_HEAD(grave_pages);
 static unsigned long *erase_block_wear = NULL;
 static unsigned int wear_eb_count = 0;
 static unsigned long total_wear = 0;
-static unsigned int rptwear_cnt = 0;
 
 /* MTD structure for NAND controller */
 static struct mtd_info *nsmtd;
 
+static int nandsim_debugfs_show(struct seq_file *m, void *private)
+{
+	unsigned long wmin = -1, wmax = 0, avg;
+	unsigned long deciles[10], decile_max[10], tot = 0;
+	unsigned int i;
+
+	/* Calc wear stats */
+	for (i = 0; i < wear_eb_count; ++i) {
+		unsigned long wear = erase_block_wear[i];
+		if (wear < wmin)
+			wmin = wear;
+		if (wear > wmax)
+			wmax = wear;
+		tot += wear;
+	}
+
+	for (i = 0; i < 9; ++i) {
+		deciles[i] = 0;
+		decile_max[i] = (wmax * (i + 1) + 5) / 10;
+	}
+	deciles[9] = 0;
+	decile_max[9] = wmax;
+	for (i = 0; i < wear_eb_count; ++i) {
+		int d;
+		unsigned long wear = erase_block_wear[i];
+		for (d = 0; d < 10; ++d)
+			if (wear <= decile_max[d]) {
+				deciles[d] += 1;
+				break;
+			}
+	}
+	avg = tot / wear_eb_count;
+
+	/* Output wear report */
+	seq_printf(m, "Total numbers of erases:  %lu\n", tot);
+	seq_printf(m, "Number of erase blocks:   %u\n", wear_eb_count);
+	seq_printf(m, "Average number of erases: %lu\n", avg);
+	seq_printf(m, "Maximum number of erases: %lu\n", wmax);
+	seq_printf(m, "Minimum number of erases: %lu\n", wmin);
+	for (i = 0; i < 10; ++i) {
+		unsigned long from = (i ? decile_max[i - 1] + 1 : 0);
+		if (from > decile_max[i])
+			continue;
+		seq_printf(m, "Number of ebs with erase counts from %lu to %lu : %lu\n",
+			from,
+			decile_max[i],
+			deciles[i]);
+	}
+
+	return 0;
+}
+
+static int nandsim_debugfs_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, nandsim_debugfs_show, inode->i_private);
+}
+
+static const struct file_operations dfs_fops = {
+	.open		= nandsim_debugfs_open,
+	.read		= seq_read,
+	.llseek		= seq_lseek,
+	.release	= single_release,
+};
+
+/**
+ * nandsim_debugfs_create - initialize debugfs
+ * @dev: nandsim device description object
+ *
+ * This function creates all debugfs files for UBI device @ubi. Returns zero in
+ * case of success and a negative error code in case of failure.
+ */
+static int nandsim_debugfs_create(struct nandsim *dev)
+{
+	struct nandsim_debug_info *dbg = &dev->dbg;
+	struct dentry *dent;
+	int err;
+
+	if (!IS_ENABLED(CONFIG_DEBUG_FS))
+		return 0;
+
+	dent = debugfs_create_dir("nandsim", NULL);
+	if (IS_ERR_OR_NULL(dent)) {
+		int err = dent ? -ENODEV : PTR_ERR(dent);
+
+		NS_ERR("cannot create \"nandsim\" debugfs directory, err %d\n",
+			err);
+		return err;
+	}
+	dbg->dfs_root = dent;
+
+	dent = debugfs_create_file("wear_report", S_IRUSR,
+				   dbg->dfs_root, dev, &dfs_fops);
+	if (IS_ERR_OR_NULL(dent))
+		goto out_remove;
+	dbg->dfs_wear_report = dent;
+
+	return 0;
+
+out_remove:
+	debugfs_remove_recursive(dbg->dfs_root);
+	err = dent ? PTR_ERR(dent) : -ENODEV;
+	return err;
+}
+
+/**
+ * nandsim_debugfs_remove - destroy all debugfs files
+ */
+static void nandsim_debugfs_remove(struct nandsim *ns)
+{
+	if (IS_ENABLED(CONFIG_DEBUG_FS))
+		debugfs_remove_recursive(ns->dbg.dfs_root);
+}
+
 /*
  * Allocate array of page pointers, create slab allocation for an array
  * and initialize the array by NULL pointers.
@@ -911,8 +1029,6 @@ static int setup_wear_reporting(struct mtd_info *mtd)
 {
 	size_t mem;
 
-	if (!rptwear)
-		return 0;
 	wear_eb_count = div_u64(mtd->size, mtd->erasesize);
 	mem = wear_eb_count * sizeof(unsigned long);
 	if (mem / sizeof(unsigned long) != wear_eb_count) {
@@ -929,64 +1045,18 @@ static int setup_wear_reporting(struct mtd_info *mtd)
 
 static void update_wear(unsigned int erase_block_no)
 {
-	unsigned long wmin = -1, wmax = 0, avg;
-	unsigned long deciles[10], decile_max[10], tot = 0;
-	unsigned int i;
-
 	if (!erase_block_wear)
 		return;
 	total_wear += 1;
+	/*
+	 * TODO: Notify this through a debugfs entry,
+	 * instead of showing an error message.
+	 */
 	if (total_wear == 0)
 		NS_ERR("Erase counter total overflow\n");
 	erase_block_wear[erase_block_no] += 1;
 	if (erase_block_wear[erase_block_no] == 0)
 		NS_ERR("Erase counter overflow for erase block %u\n", erase_block_no);
-	rptwear_cnt += 1;
-	if (rptwear_cnt < rptwear)
-		return;
-	rptwear_cnt = 0;
-	/* Calc wear stats */
-	for (i = 0; i < wear_eb_count; ++i) {
-		unsigned long wear = erase_block_wear[i];
-		if (wear < wmin)
-			wmin = wear;
-		if (wear > wmax)
-			wmax = wear;
-		tot += wear;
-	}
-	for (i = 0; i < 9; ++i) {
-		deciles[i] = 0;
-		decile_max[i] = (wmax * (i + 1) + 5) / 10;
-	}
-	deciles[9] = 0;
-	decile_max[9] = wmax;
-	for (i = 0; i < wear_eb_count; ++i) {
-		int d;
-		unsigned long wear = erase_block_wear[i];
-		for (d = 0; d < 10; ++d)
-			if (wear <= decile_max[d]) {
-				deciles[d] += 1;
-				break;
-			}
-	}
-	avg = tot / wear_eb_count;
-	/* Output wear report */
-	NS_INFO("*** Wear Report ***\n");
-	NS_INFO("Total numbers of erases:  %lu\n", tot);
-	NS_INFO("Number of erase blocks:   %u\n", wear_eb_count);
-	NS_INFO("Average number of erases: %lu\n", avg);
-	NS_INFO("Maximum number of erases: %lu\n", wmax);
-	NS_INFO("Minimum number of erases: %lu\n", wmin);
-	for (i = 0; i < 10; ++i) {
-		unsigned long from = (i ? decile_max[i - 1] + 1 : 0);
-		if (from > decile_max[i])
-			continue;
-		NS_INFO("Number of ebs with erase counts from %lu to %lu : %lu\n",
-			from,
-			decile_max[i],
-			deciles[i]);
-	}
-	NS_INFO("*** End of Wear Report ***\n");
 }
 
 /*
@@ -2330,6 +2400,9 @@ static int __init ns_init_module(void)
 	if ((retval = setup_wear_reporting(nsmtd)) != 0)
 		goto err_exit;
 
+	if ((retval = nandsim_debugfs_create(nand)) != 0)
+		goto err_exit;
+
 	if ((retval = init_nandsim(nsmtd)) != 0)
 		goto err_exit;
 
@@ -2369,6 +2442,7 @@ static void __exit ns_cleanup_module(void)
 	struct nandsim *ns = ((struct nand_chip *)nsmtd->priv)->priv;
 	int i;
 
+	nandsim_debugfs_remove(ns);
 	free_nandsim(ns);    /* Free nandsim private resources */
 	nand_release(nsmtd); /* Unregister driver */
 	for (i = 0;i < ARRAY_SIZE(ns->partitions); ++i)
-- 
1.7.8.6
