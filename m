Received: from mail.sigma-star.at ([95.130.255.111])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bme9m-00048B-3i
 for linux-mtd@lists.infradead.org; Wed, 21 Sep 2016 09:49:34 +0000
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, boris.brezillon@free-electrons.com,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH v2 13/46] mtd: nandsim: Add final logic for multiple instances
Date: Wed, 21 Sep 2016 11:49:06 +0200
Message-Id: <34e778488564422bf15f8ff753e2bdaeb6f5455e.1474450296.git.dwalter@sigma-star.at>
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

Add support to create and delete multiple instances
of nandsim.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/nandsim.c | 59 ++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 49 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 057cc7a..bef5afa 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -47,6 +47,7 @@
 #include <linux/compat.h>
 #include <linux/miscdevice.h>
 #include <linux/major.h>
+#include <linux/mutex.h>
 
 /* Default simulator parameters values */
 #if !defined(CONFIG_NANDSIM_FIRST_ID_BYTE)  || \
@@ -117,6 +118,7 @@ static u_char id_bytes[8] = {
 	[3] = CONFIG_NANDSIM_FOURTH_ID_BYTE,
 	[4 ... 7] = 0xFF,
 };
+static bool defaults = true;
 
 module_param_array(id_bytes, byte, NULL, 0400);
 module_param_named(first_id_byte, id_bytes[0], byte, 0400);
@@ -142,6 +144,7 @@ module_param(overridesize,   uint, 0400);
 module_param(cache_file,     charp, 0400);
 module_param(bbt,	     uint, 0400);
 module_param(bch,	     uint, 0400);
+module_param(defaults,	     bool, 0400);
 
 MODULE_PARM_DESC(id_bytes,       "The ID bytes returned by NAND Flash 'read ID' command");
 MODULE_PARM_DESC(first_id_byte,  "The first byte returned by NAND Flash 'read ID' command (manufacturer ID) (obsolete)");
@@ -177,6 +180,8 @@ MODULE_PARM_DESC(cache_file,     "File to use to cache nand pages instead of mem
 MODULE_PARM_DESC(bbt,		 "0 OOB, 1 BBT with marker in OOB, 2 BBT with marker in data area");
 MODULE_PARM_DESC(bch,		 "Enable BCH ecc and set how many bits should "
 				 "be correctable in 512-byte blocks");
+MODULE_PARM_DESC(defaults,	 "Register a MTD during module load using default values and module parametes. "
+				 "Set to N if you want to use the nandsimctl user space tool to setup nandsim.");
 
 /* The largest possible page size */
 #define NS_LARGEST_PAGE_SIZE	4096
@@ -483,6 +488,7 @@ struct grave_page {
 
 /* MTD structure for NAND controller */
 static struct mtd_info *ns_mtds[NS_MAX_DEVICES];
+static DEFINE_MUTEX(ns_mtd_mutex);
 
 static struct dentry *dfs_root;
 
@@ -2358,11 +2364,24 @@ static int ns_new_instance(struct nandsim_params *nsparam)
 		return -ENOMEM;
 	}
 
-	WARN_ON(ns_mtds[0]);
-	nsmtd = ns_mtds[0] = nand_to_mtd(chip);
+	mutex_lock(&ns_mtd_mutex);
+	for (i = 0; i < NS_MAX_DEVICES; i++) {
+		if (!ns_mtds[i])
+			break;
+	}
+
+	if (i == NS_MAX_DEVICES) {
+		NS_ERR("Cannot allocate more than %i instances!\n", NS_MAX_DEVICES);
+		retval = -ENFILE;
+		mutex_unlock(&ns_mtd_mutex);
+		goto error;
+	}
+
+	nsmtd = ns_mtds[i] = nand_to_mtd(chip);
 	nand = chip_to_ns(chip);
 	nand_set_controller_data(chip, (void *)nand);
-	nand->index = 0;
+	nand->index = i;
+	mutex_unlock(&ns_mtd_mutex);
 
 	INIT_LIST_HEAD(&nand->weak_blocks);
 	INIT_LIST_HEAD(&nand->grave_pages);
@@ -2530,9 +2549,8 @@ error:
 	return retval;
 }
 
-static void __exit ns_cleanup_default(void)
+static void ns_destroy_instance(struct mtd_info *nsmtd)
 {
-	struct mtd_info *nsmtd = ns_mtds[0];
 	struct nand_chip *chip = mtd_to_nand(nsmtd);
 	struct nandsim *ns = nand_get_controller_data(chip);
 	int i;
@@ -2546,6 +2564,17 @@ static void __exit ns_cleanup_default(void)
 	kfree(mtd_to_nand(nsmtd));        /* Free other structures */
 }
 
+static void ns_destroy_all(void)
+{
+	int i;
+
+	mutex_lock(&ns_mtd_mutex);
+	for (i = 0; i < NS_MAX_DEVICES; i++)
+		if (ns_mtds[i])
+			ns_destroy_instance(ns_mtds[i]);
+	mutex_unlock(&ns_mtd_mutex);
+}
+
 static int __init ns_init_default(void)
 {
 	int ret;
@@ -2588,18 +2617,28 @@ static int __init ns_init_module(void)
 	if (ret)
 		return ret;
 
-	ret = ns_init_default();
-	if (ret)
-		return ret;
+	if (defaults) {
+		ret = ns_init_default();
+		if (ret) {
+			debugfs_remove_recursive(dfs_root);
+			return ret;
+		}
+	}
+
+	ret = misc_register(&nandsim_ctrl_cdev);
+	if (ret) {
+		ns_destroy_all();
+		debugfs_remove_recursive(dfs_root);
+	}
 
-	return misc_register(&nandsim_ctrl_cdev);
+	return ret;
 }
 module_init(ns_init_module);
 
 static void __exit ns_cleanup_module(void)
 {
-	ns_cleanup_default();
 	misc_deregister(&nandsim_ctrl_cdev);
+	ns_destroy_all();
 	debugfs_remove_recursive(dfs_root);
 }
 module_exit(ns_cleanup_module);
-- 
2.8.3
