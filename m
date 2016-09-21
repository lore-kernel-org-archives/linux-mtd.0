Received: from mail.sigma-star.at ([95.130.255.111])
 by casper.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bme9E-0006Wn-GX
 for linux-mtd@lists.infradead.org; Wed, 21 Sep 2016 09:49:01 +0000
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, boris.brezillon@free-electrons.com,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH v2 12/46] mtd: nandsim: Make debugfs logic multi instance
 capable
Date: Wed, 21 Sep 2016 11:48:39 +0200
Message-Id: <f1f5facb46ca3f3bcda9567023ab84eec0455038.1474450296.git.dwalter@sigma-star.at>
In-Reply-To: <cover.1474450295.git.dwalter@sigma-star.at>
References: <cover.1474450295.git.dwalter@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Richard Weinberger <richard@nod.at>

Instead of creating our files in <debugfs>/nandsim/,
create one directory per instance.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/nandsim.c | 36 ++++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index ab4859d..057cc7a 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -328,6 +328,7 @@ union ns_mem {
  * The structure which describes all the internal simulator data.
  */
 struct nandsim {
+	unsigned int index;
 	struct mtd_partition partitions[CONFIG_NANDSIM_MAX_PARTS];
 	unsigned int nbparts;
 
@@ -483,6 +484,8 @@ struct grave_page {
 /* MTD structure for NAND controller */
 static struct mtd_info *ns_mtds[NS_MAX_DEVICES];
 
+static struct dentry *dfs_root;
+
 static inline struct nandsim *chip_to_ns(struct nand_chip *chip)
 {
 	return (struct nandsim *)(chip + 1);
@@ -560,6 +563,23 @@ static const struct file_operations dfs_fops = {
 	.release	= single_release,
 };
 
+static int nandsim_debugfs_init(void)
+{
+	if (!IS_ENABLED(CONFIG_DEBUG_FS))
+		return 0;
+
+	dfs_root = debugfs_create_dir("nandsim", NULL);
+	if (IS_ERR_OR_NULL(dfs_root)) {
+		int err = dfs_root ? -ENODEV : PTR_ERR(dfs_root);
+
+		NS_ERR("cannot create \"nandsim\" debugfs directory, err %d\n",
+			err);
+		return err;
+	}
+
+	return 0;
+}
+
 /**
  * nandsim_debugfs_create - initialize debugfs
  * @dev: nandsim device description object
@@ -572,15 +592,21 @@ static int nandsim_debugfs_create(struct nandsim *dev)
 	struct nandsim_debug_info *dbg = &dev->dbg;
 	struct dentry *dent;
 	int err;
+	char *dirname;
 
 	if (!IS_ENABLED(CONFIG_DEBUG_FS))
 		return 0;
 
-	dent = debugfs_create_dir("nandsim", NULL);
+	dirname = kasprintf(GFP_KERNEL, "nandsim%i", dev->index);
+	if (!dirname)
+		return -ENOMEM;
+
+	dent = debugfs_create_dir(dirname, dfs_root);
+	kfree(dirname);
 	if (IS_ERR_OR_NULL(dent)) {
 		int err = dent ? -ENODEV : PTR_ERR(dent);
 
-		NS_ERR("cannot create \"nandsim\" debugfs directory, err %d\n",
+		NS_ERR("cannot create nandsim debugfs sub-directory, err %d\n",
 			err);
 		return err;
 	}
@@ -2336,6 +2362,7 @@ static int ns_new_instance(struct nandsim_params *nsparam)
 	nsmtd = ns_mtds[0] = nand_to_mtd(chip);
 	nand = chip_to_ns(chip);
 	nand_set_controller_data(chip, (void *)nand);
+	nand->index = 0;
 
 	INIT_LIST_HEAD(&nand->weak_blocks);
 	INIT_LIST_HEAD(&nand->grave_pages);
@@ -2557,6 +2584,10 @@ static int __init ns_init_module(void)
 {
 	int ret;
 
+	ret = nandsim_debugfs_init();
+	if (ret)
+		return ret;
+
 	ret = ns_init_default();
 	if (ret)
 		return ret;
@@ -2569,6 +2600,7 @@ static void __exit ns_cleanup_module(void)
 {
 	ns_cleanup_default();
 	misc_deregister(&nandsim_ctrl_cdev);
+	debugfs_remove_recursive(dfs_root);
 }
 module_exit(ns_cleanup_module);
 
-- 
2.8.3
