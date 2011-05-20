Received: from mail-pw0-f49.google.com ([209.85.160.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QNPXu-00074i-6C
	for linux-mtd@lists.infradead.org; Fri, 20 May 2011 13:15:19 +0000
Received: by pwi8 with SMTP id 8so1985281pwi.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 20 May 2011 06:15:12 -0700 (PDT)
From: Wanlong Gao <wanlong.gao@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] drivers:mtd:fix the bad format in the mtdcore.c
Date: Fri, 20 May 2011 21:14:30 +0800
Message-Id: <1305897270-3685-1-git-send-email-wanlong.gao@gmail.com>
Cc: Wanlong Gao <wanlong.gao@gmail.com>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Remove the spare spaces in the head of the lines.

Signed-off-by: Wanlong Gao <wanlong.gao@gmail.com>
---
 drivers/mtd/mtdcore.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 8e19091..f3c9400 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -444,7 +444,7 @@ void register_mtd_user (struct mtd_notifier *new)
 
 	list_add(&new->list, &mtd_notifiers);
 
- 	__module_get(THIS_MODULE);
+	__module_get(THIS_MODULE);
 
 	mtd_for_each_device(mtd)
 		new->add(mtd);
@@ -707,9 +707,9 @@ static int mtd_proc_show(struct seq_file *m, void *v)
 		seq_printf(m, "mtd%d: %8.8llx %8.8x \"%s\"\n",
 			   mtd->index, (unsigned long long)mtd->size,
 			   mtd->erasesize, mtd->name);
-        }
+	}
 	mutex_unlock(&mtd_table_mutex);
-        return 0;
+	return 0;
 }
 
 static int mtd_proc_open(struct inode *inode, struct file *file)
@@ -781,7 +781,7 @@ err_reg:
 static void __exit cleanup_mtd(void)
 {
 #ifdef CONFIG_PROC_FS
-        if (proc_mtd)
+	if (proc_mtd)
 		remove_proc_entry( "mtd", NULL);
 #endif /* CONFIG_PROC_FS */
 	class_unregister(&mtd_class);
-- 
1.7.4.1
