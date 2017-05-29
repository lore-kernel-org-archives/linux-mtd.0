Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dFJLk-0001y5-O2
 for linux-mtd@lists.infradead.org; Mon, 29 May 2017 12:00:42 +0000
Received: by mail-qk0-x244.google.com with SMTP id y128so8371863qka.3
 for <linux-mtd@lists.infradead.org>; Mon, 29 May 2017 05:00:20 -0700 (PDT)
From: "Mario J. Rugiero" <mrugiero@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: computersforpeace@gmail.com, boris.brezillon@free-electrons.com,
 marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr,
 "Mario J. Rugiero" <mrugiero@gmail.com>
Subject: [PATCH v8] mtd: create per-device and module-scope debugfs entries
Date: Mon, 29 May 2017 08:38:41 -0300
Message-Id: <20170529113841.3850-1-mrugiero@gmail.com>
In-Reply-To: <20170516155616.26558-1-mrugiero@gmail.com>
References: <20170516155616.26558-1-mrugiero@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Several MTD devices are using debugfs entries created in the root.
This commit provides the means for a standardized subtree, creating
one "mtd" entry at root, and one entry per device inside it, named
after the device.
The tree is registered in add_mtd_device, and released in
del_mtd_device.
Devices docg3, mtdswap and nandsim were updated to use this subtree
instead of custom ones, and their entries were prefixed with the
drivers' names.

Signed-off-by: Mario J. Rugiero <mrugiero@gmail.com>
Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
v8: - fix CONFIG_DEBUG_FS typo.
v7: - as per derRichard and bbrezillon suggestion, dev_names are used
      instead of 'pretty' names for the entries, and driver-specific
      entries are prefixed with the drivers' names.
v6: - as per bbrezillon suggestion, more cleanups were done in the drivers,
      removing now unused structure members and functions.
    - dropped explicit setting to NULL to the dfs_dir member for the MTD,
      as it is expected to be zeroed out, thanks again to bbrezillon for
      pointing this out.
    - removed an extern declaration of a symbol which was never defined,
      spotted by bbrezillon.
v5: - cleanup drivers creating their own debugfs sub-tree.
    - separate the patch again, as it makes sense on its own as cleanup.
v4: - include in a bigger patchset which explains the use of this tree.
v3: - move the changelog out of the commit message
v2: - remove unused macros and add a commit message
v1: - create the debugfs entries

 drivers/mtd/devices/docg3.c | 49 ++++++++++++++++-----------------------------
 drivers/mtd/devices/docg3.h |  2 --
 drivers/mtd/mtdcore.c       | 16 +++++++++++++++
 drivers/mtd/mtdswap.c       | 18 ++++-------------
 drivers/mtd/nand/nandsim.c  | 48 +++++++++++---------------------------------
 include/linux/mtd/mtd.h     | 10 +++++++++
 6 files changed, 59 insertions(+), 84 deletions(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index b833e6cc684c..84b16133554b 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -1809,37 +1809,22 @@ static int dbg_protection_show(struct seq_file *s, void *p)
 }
 DEBUGFS_RO_ATTR(protection, dbg_protection_show);
 
-static int __init doc_dbg_register(struct docg3 *docg3)
-{
-	struct dentry *root, *entry;
-
-	root = debugfs_create_dir("docg3", NULL);
-	if (!root)
-		return -ENOMEM;
-
-	entry = debugfs_create_file("flashcontrol", S_IRUSR, root, docg3,
-				  &flashcontrol_fops);
-	if (entry)
-		entry = debugfs_create_file("asic_mode", S_IRUSR, root,
-					    docg3, &asic_mode_fops);
-	if (entry)
-		entry = debugfs_create_file("device_id", S_IRUSR, root,
-					    docg3, &device_id_fops);
-	if (entry)
-		entry = debugfs_create_file("protection", S_IRUSR, root,
-					    docg3, &protection_fops);
-	if (entry) {
-		docg3->debugfs_root = root;
-		return 0;
-	} else {
-		debugfs_remove_recursive(root);
-		return -ENOMEM;
-	}
-}
-
-static void doc_dbg_unregister(struct docg3 *docg3)
+static void __init doc_dbg_register(struct mtd_info *floor)
 {
-	debugfs_remove_recursive(docg3->debugfs_root);
+	struct dentry *root = floor->dbg.dfs_dir;
+	struct docg3 *docg3 = floor->priv;
+
+	if (IS_ERR_OR_NULL(root))
+		return;
+
+	debugfs_create_file("docg3_flashcontrol", S_IRUSR, root, docg3,
+			    &flashcontrol_fops);
+	debugfs_create_file("docg3_asic_mode", S_IRUSR, root, docg3,
+			    &asic_mode_fops);
+	debugfs_create_file("docg3_device_id", S_IRUSR, root, docg3,
+			    &device_id_fops);
+	debugfs_create_file("docg3_protection", S_IRUSR, root, docg3,
+			    &protection_fops);
 }
 
 /**
@@ -2114,6 +2099,8 @@ static int __init docg3_probe(struct platform_device *pdev)
 						0);
 		if (ret)
 			goto err_probe;
+
+		doc_dbg_register(cascade->floors[floor]);
 	}
 
 	ret = doc_register_sysfs(pdev, cascade);
@@ -2121,7 +2108,6 @@ static int __init docg3_probe(struct platform_device *pdev)
 		goto err_probe;
 
 	platform_set_drvdata(pdev, cascade);
-	doc_dbg_register(cascade->floors[0]->priv);
 	return 0;
 
 notfound:
@@ -2148,7 +2134,6 @@ static int docg3_release(struct platform_device *pdev)
 	int floor;
 
 	doc_unregister_sysfs(pdev, cascade);
-	doc_dbg_unregister(docg3);
 	for (floor = 0; floor < DOC_MAX_NBFLOORS; floor++)
 		if (cascade->floors[floor])
 			doc_release_device(cascade->floors[floor]);
diff --git a/drivers/mtd/devices/docg3.h b/drivers/mtd/devices/docg3.h
index 19fb93f96a3a..e99946575398 100644
--- a/drivers/mtd/devices/docg3.h
+++ b/drivers/mtd/devices/docg3.h
@@ -299,7 +299,6 @@ struct docg3_cascade {
  * @oob_autoecc: if 1, use only bytes 0-7, 15, and fill the others with HW ECC
  *               if 0, use all the 16 bytes.
  * @oob_write_buf: prepared OOB for next page_write
- * @debugfs_root: debugfs root node
  */
 struct docg3 {
 	struct device *dev;
@@ -312,7 +311,6 @@ struct docg3 {
 	loff_t oob_write_ofs;
 	int oob_autoecc;
 	u8 oob_write_buf[DOC_LAYOUT_OOB_SIZE];
-	struct dentry *debugfs_root;
 };
 
 #define doc_err(fmt, arg...) dev_err(docg3->dev, (fmt), ## arg)
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 1517da3ddd7d..fe48cb1b381b 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -40,6 +40,7 @@
 #include <linux/slab.h>
 #include <linux/reboot.h>
 #include <linux/leds.h>
+#include <linux/debugfs.h>
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
@@ -477,6 +478,8 @@ int mtd_pairing_groups(struct mtd_info *mtd)
 }
 EXPORT_SYMBOL_GPL(mtd_pairing_groups);
 
+static struct dentry *dfs_dir_mtd;
+
 /**
  *	add_mtd_device - register an MTD device
  *	@mtd: pointer to new MTD device info structure
@@ -552,6 +555,14 @@ int add_mtd_device(struct mtd_info *mtd)
 	if (error)
 		goto fail_added;
 
+	if (!IS_ERR_OR_NULL(dfs_dir_mtd)) {
+		mtd->dbg.dfs_dir = debugfs_create_dir(dev_name(&mtd->dev), dfs_dir_mtd);
+		if (IS_ERR_OR_NULL(mtd->dbg.dfs_dir)) {
+			pr_debug("mtd device %s won't show data in debugfs\n",
+				 dev_name(&mtd->dev));
+		}
+	}
+
 	device_create(&mtd_class, mtd->dev.parent, MTD_DEVT(i) + 1, NULL,
 		      "mtd%dro", i);
 
@@ -594,6 +605,8 @@ int del_mtd_device(struct mtd_info *mtd)
 
 	mutex_lock(&mtd_table_mutex);
 
+	debugfs_remove_recursive(mtd->dbg.dfs_dir);
+
 	if (idr_find(&mtd_idr, mtd->index) != mtd) {
 		ret = -ENODEV;
 		goto out_error;
@@ -1811,6 +1824,8 @@ static int __init init_mtd(void)
 	if (ret)
 		goto out_procfs;
 
+	dfs_dir_mtd = debugfs_create_dir("mtd", NULL);
+
 	return 0;
 
 out_procfs:
@@ -1826,6 +1841,7 @@ static int __init init_mtd(void)
 
 static void __exit cleanup_mtd(void)
 {
+	debugfs_remove_recursive(dfs_dir_mtd);
 	cleanup_mtdchar();
 	if (proc_mtd)
 		remove_proc_entry("mtd", NULL);
diff --git a/drivers/mtd/mtdswap.c b/drivers/mtd/mtdswap.c
index f12879a3d4ff..6b17932fe557 100644
--- a/drivers/mtd/mtdswap.c
+++ b/drivers/mtd/mtdswap.c
@@ -138,8 +138,6 @@ struct mtdswap_dev {
 
 	char *page_buf;
 	char *oob_buf;
-
-	struct dentry *debugfs_root;
 };
 
 struct mtdswap_oobdata {
@@ -1318,26 +1316,19 @@ static int mtdswap_add_debugfs(struct mtdswap_dev *d)
 	struct gendisk *gd = d->mbd_dev->disk;
 	struct device *dev = disk_to_dev(gd);
 
-	struct dentry *root;
+	struct dentry *root = d->mtd->dbg.dfs_dir;
 	struct dentry *dent;
 
-	root = debugfs_create_dir(gd->disk_name, NULL);
-	if (IS_ERR(root))
+	if (!IS_ENABLED(CONFIG_DEBUG_FS))
 		return 0;
 
-	if (!root) {
-		dev_err(dev, "failed to initialize debugfs\n");
+	if (IS_ERR_OR_NULL(root))
 		return -1;
-	}
-
-	d->debugfs_root = root;
 
-	dent = debugfs_create_file("stats", S_IRUSR, root, d,
+	dent = debugfs_create_file("mtdswap_stats", S_IRUSR, root, d,
 				&mtdswap_fops);
 	if (!dent) {
 		dev_err(d->dev, "debugfs_create_file failed\n");
-		debugfs_remove_recursive(root);
-		d->debugfs_root = NULL;
 		return -1;
 	}
 
@@ -1540,7 +1531,6 @@ static void mtdswap_remove_dev(struct mtd_blktrans_dev *dev)
 {
 	struct mtdswap_dev *d = MTDSWAP_MBD_TO_MTDSWAP(dev);
 
-	debugfs_remove_recursive(d->debugfs_root);
 	del_mtd_blktrans_dev(dev);
 	mtdswap_cleanup(d);
 	kfree(d);
diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 03a0d057bf2f..1ddf0b73c246 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -287,11 +287,6 @@ MODULE_PARM_DESC(bch,		 "Enable BCH ecc and set how many bits should "
 /* Maximum page cache pages needed to read or write a NAND page to the cache_file */
 #define NS_MAX_HELD_PAGES 16
 
-struct nandsim_debug_info {
-	struct dentry *dfs_root;
-	struct dentry *dfs_wear_report;
-};
-
 /*
  * A union to represent flash memory contents and flash buffer.
  */
@@ -370,8 +365,6 @@ struct nandsim {
 	void *file_buf;
 	struct page *held_pages[NS_MAX_HELD_PAGES];
 	int held_cnt;
-
-	struct nandsim_debug_info dbg;
 };
 
 /*
@@ -524,39 +517,23 @@ static const struct file_operations dfs_fops = {
  */
 static int nandsim_debugfs_create(struct nandsim *dev)
 {
-	struct nandsim_debug_info *dbg = &dev->dbg;
+	struct dentry *root = nsmtd->dbg.dfs_dir;
 	struct dentry *dent;
 
 	if (!IS_ENABLED(CONFIG_DEBUG_FS))
 		return 0;
 
-	dent = debugfs_create_dir("nandsim", NULL);
-	if (!dent) {
-		NS_ERR("cannot create \"nandsim\" debugfs directory\n");
-		return -ENODEV;
-	}
-	dbg->dfs_root = dent;
+	if (IS_ERR_OR_NULL(root))
+		return -1;
 
-	dent = debugfs_create_file("wear_report", S_IRUSR,
-				   dbg->dfs_root, dev, &dfs_fops);
-	if (!dent)
-		goto out_remove;
-	dbg->dfs_wear_report = dent;
+	dent = debugfs_create_file("nandsim_wear_report", S_IRUSR,
+				   root, dev, &dfs_fops);
+	if (IS_ERR_OR_NULL(dent)) {
+		NS_ERR("cannot create \"nandsim_wear_report\" debugfs entry\n");
+		return -1;
+	}
 
 	return 0;
-
-out_remove:
-	debugfs_remove_recursive(dbg->dfs_root);
-	return -ENODEV;
-}
-
-/**
- * nandsim_debugfs_remove - destroy all debugfs files
- */
-static void nandsim_debugfs_remove(struct nandsim *ns)
-{
-	if (IS_ENABLED(CONFIG_DEBUG_FS))
-		debugfs_remove_recursive(ns->dbg.dfs_root);
 }
 
 /*
@@ -2352,9 +2329,6 @@ static int __init ns_init_module(void)
 	if ((retval = setup_wear_reporting(nsmtd)) != 0)
 		goto err_exit;
 
-	if ((retval = nandsim_debugfs_create(nand)) != 0)
-		goto err_exit;
-
 	if ((retval = init_nandsim(nsmtd)) != 0)
 		goto err_exit;
 
@@ -2370,6 +2344,9 @@ static int __init ns_init_module(void)
 	if (retval != 0)
 		goto err_exit;
 
+	if ((retval = nandsim_debugfs_create(nand)) != 0)
+		goto err_exit;
+
         return 0;
 
 err_exit:
@@ -2395,7 +2372,6 @@ static void __exit ns_cleanup_module(void)
 	struct nandsim *ns = nand_get_controller_data(chip);
 	int i;
 
-	nandsim_debugfs_remove(ns);
 	free_nandsim(ns);    /* Free nandsim private resources */
 	nand_release(nsmtd); /* Unregister driver */
 	for (i = 0;i < ARRAY_SIZE(ns->partitions); ++i)
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index f8a2ef239c60..6cd0f6b7658b 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -206,6 +206,15 @@ struct mtd_pairing_scheme {
 
 struct module;	/* only needed for owner field in mtd_info */
 
+/**
+ * struct mtd_debug_info - debugging information for an MTD device.
+ *
+ * @dfs_dir: direntry object of the MTD device debugfs directory
+ */
+struct mtd_debug_info {
+	struct dentry *dfs_dir;
+};
+
 struct mtd_info {
 	u_char type;
 	uint32_t flags;
@@ -346,6 +355,7 @@ struct mtd_info {
 	struct module *owner;
 	struct device dev;
 	int usecount;
+	struct mtd_debug_info dbg;
 };
 
 int mtd_ooblayout_ecc(struct mtd_info *mtd, int section,
-- 
2.13.0
