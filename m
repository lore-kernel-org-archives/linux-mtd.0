Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dAesB-0004O0-Bo
 for linux-mtd@lists.infradead.org; Tue, 16 May 2017 15:58:57 +0000
Received: by mail-qk0-x242.google.com with SMTP id y128so23468443qka.3
 for <linux-mtd@lists.infradead.org>; Tue, 16 May 2017 08:58:33 -0700 (PDT)
From: "Mario J. Rugiero" <mrugiero@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr, "Mario J. Rugiero" <mrugiero@gmail.com>
Subject: [PATCH] mtd: create per-device and module-scope debugfs entries
Date: Tue, 16 May 2017 12:56:16 -0300
Message-Id: <20170516155616.26558-1-mrugiero@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Mario J. Rugiero <mrugiero@gmail.com>
---
 drivers/mtd/mtdcore.c   | 17 +++++++++++++++++
 drivers/mtd/mtdcore.h   |  2 ++
 include/linux/mtd/mtd.h | 13 +++++++++++++
 3 files changed, 32 insertions(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 1517da3ddd7d..461e8139ac2d 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -40,6 +40,7 @@
 #include <linux/slab.h>
 #include <linux/reboot.h>
 #include <linux/leds.h>
+#include <linux/debugfs.h>
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
@@ -662,6 +663,8 @@ static void mtd_set_dev_defaults(struct mtd_info *mtd)
 	}
 }
 
+static struct dentry *dfs_dir_mtd;
+
 /**
  * mtd_device_parse_register - parse partitions and register an MTD device.
  *
@@ -701,6 +704,10 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 
 	mtd_set_dev_defaults(mtd);
 
+	mtd->dbg.dfs_dir = debugfs_create_dir(mtd->name, dfs_dir_mtd);
+	if (IS_ERR(mtd->dbg.dfs_dir))
+		mtd->dbg.dfs_dir = NULL;
+
 	memset(&parsed, 0, sizeof(parsed));
 
 	ret = parse_mtd_partitions(mtd, types, &parsed, parser_data);
@@ -740,6 +747,8 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 out:
 	/* Cleanup any parsed partitions */
 	mtd_part_parser_cleanup(&parsed);
+	if (ret)
+		debugfs_remove_recursive(mtd->dbg.dfs_dir);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(mtd_device_parse_register);
@@ -754,6 +763,8 @@ int mtd_device_unregister(struct mtd_info *master)
 {
 	int err;
 
+	debugfs_remove_recursive(master->dbg.dfs_dir);
+
 	if (master->_reboot)
 		unregister_reboot_notifier(&master->reboot_notifier);
 
@@ -1807,6 +1818,10 @@ static int __init init_mtd(void)
 
 	proc_mtd = proc_create("mtd", 0, NULL, &mtd_proc_ops);
 
+	dfs_dir_mtd = debugfs_create_dir("mtd", NULL);
+	if (IS_ERR(dfs_dir_mtd))
+		dfs_dir_mtd = NULL;
+
 	ret = init_mtdchar();
 	if (ret)
 		goto out_procfs;
@@ -1816,6 +1831,7 @@ static int __init init_mtd(void)
 out_procfs:
 	if (proc_mtd)
 		remove_proc_entry("mtd", NULL);
+	debugfs_remove(dfs_dir_mtd);
 	bdi_put(mtd_bdi);
 err_bdi:
 	class_unregister(&mtd_class);
@@ -1826,6 +1842,7 @@ static int __init init_mtd(void)
 
 static void __exit cleanup_mtd(void)
 {
+	debugfs_remove_recursive(dfs_dir_mtd);
 	cleanup_mtdchar();
 	if (proc_mtd)
 		remove_proc_entry("mtd", NULL);
diff --git a/drivers/mtd/mtdcore.h b/drivers/mtd/mtdcore.h
index 55fdb8e1fd2a..b5d095d24087 100644
--- a/drivers/mtd/mtdcore.h
+++ b/drivers/mtd/mtdcore.h
@@ -19,6 +19,8 @@ int parse_mtd_partitions(struct mtd_info *master, const char * const *types,
 
 void mtd_part_parser_cleanup(struct mtd_partitions *parts);
 
+extern struct dentry *debug_mtd;
+
 int __init init_mtdchar(void);
 void __exit cleanup_mtdchar(void);
 
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index f8a2ef239c60..905c119a2efe 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -206,6 +206,18 @@ struct mtd_pairing_scheme {
 
 struct module;	/* only needed for owner field in mtd_info */
 
+#define MTD_DFS_DIR_NAME "mtd%2d"
+#define MTD_DFS_DIR_LEN 3 + 2 + 1
+
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
@@ -346,6 +358,7 @@ struct mtd_info {
 	struct module *owner;
 	struct device dev;
 	int usecount;
+	struct mtd_debug_info dbg;
 };
 
 int mtd_ooblayout_ecc(struct mtd_info *mtd, int section,
-- 
2.13.0
