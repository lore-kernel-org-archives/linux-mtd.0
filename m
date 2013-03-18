Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UHTsA-0002jN-OZ
 for linux-mtd@lists.infradead.org; Mon, 18 Mar 2013 06:48:43 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/7] mtd: mtdcore: remove few useless #ifdef's
Date: Mon, 18 Mar 2013 08:50:16 +0200
Message-Id: <1363589422-1378-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1363589422-1378-1-git-send-email-dedekind1@gmail.com>
References: <1363260463-10609-1-git-send-email-dedekind1@gmail.com>
 <1363589422-1378-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Remove a couple of useles '#ifdef CONFIG_PROC_FS's around procfs functions
which anyway turn into empty function in 'proc_fs.h' file when CONFIG_PROC_FS
is not defined.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/mtdcore.c |   11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 681bb6d..91c2efd 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1116,8 +1116,6 @@ EXPORT_SYMBOL_GPL(mtd_kmalloc_up_to);
 /*====================================================================*/
 /* Support for /proc/mtd */
 
-static struct proc_dir_entry *proc_mtd;
-
 static int mtd_proc_show(struct seq_file *m, void *v)
 {
 	struct mtd_info *mtd;
@@ -1163,6 +1161,8 @@ static int __init mtd_bdi_init(struct backing_dev_info *bdi, const char *name)
 	return ret;
 }
 
+static struct proc_dir_entry *proc_mtd;
+
 static int __init init_mtd(void)
 {
 	int ret;
@@ -1183,9 +1183,8 @@ static int __init init_mtd(void)
 	if (ret)
 		goto err_bdi3;
 
-#ifdef CONFIG_PROC_FS
 	proc_mtd = proc_create("mtd", 0, NULL, &mtd_proc_ops);
-#endif /* CONFIG_PROC_FS */
+
 	return 0;
 
 err_bdi3:
@@ -1201,10 +1200,8 @@ err_reg:
 
 static void __exit cleanup_mtd(void)
 {
-#ifdef CONFIG_PROC_FS
 	if (proc_mtd)
-		remove_proc_entry( "mtd", NULL);
-#endif /* CONFIG_PROC_FS */
+		remove_proc_entry("mtd", NULL);
 	class_unregister(&mtd_class);
 	bdi_destroy(&mtd_bdi_unmappable);
 	bdi_destroy(&mtd_bdi_ro_mappable);
-- 
1.7.10.4
