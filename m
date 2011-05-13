Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QKz46-0004uY-Dl
	for linux-mtd@lists.infradead.org; Fri, 13 May 2011 20:34:27 +0000
Received: by ewy3 with SMTP id 3so959091ewy.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 13 May 2011 13:34:24 -0700 (PDT)
Date: Fri, 13 May 2011 23:34:19 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: dwmw2@infradead.org
Subject: [PATCH] mtd: convert to seq_file interface
Message-ID: <20110513203419.GA29261@p183>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: akpm@linux-foundation.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

->read_proc interface is going away, switch to seq_file.

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 drivers/mtd/mtdcore.c |   50 +++++++++++++++++++-------------------------------
 1 file changed, 19 insertions(+), 31 deletions(-)

--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -24,6 +24,7 @@
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/ptrace.h>
+#include <linux/seq_file.h>
 #include <linux/string.h>
 #include <linux/timer.h>
 #include <linux/major.h>
@@ -656,44 +657,32 @@ EXPORT_SYMBOL_GPL(default_mtd_writev);
 
 static struct proc_dir_entry *proc_mtd;
 
-static inline int mtd_proc_info(char *buf, struct mtd_info *this)
-{
-	return sprintf(buf, "mtd%d: %8.8llx %8.8x \"%s\"\n", this->index,
-		       (unsigned long long)this->size,
-		       this->erasesize, this->name);
-}
-
-static int mtd_read_proc (char *page, char **start, off_t off, int count,
-			  int *eof, void *data_unused)
+static int mtd_proc_show(struct seq_file *m, void *v)
 {
 	struct mtd_info *mtd;
-	int len, l;
-        off_t   begin = 0;
 
+	seq_puts(m, "dev:    size   erasesize  name\n");
 	mutex_lock(&mtd_table_mutex);
-
-	len = sprintf(page, "dev:    size   erasesize  name\n");
 	mtd_for_each_device(mtd) {
-		l = mtd_proc_info(page + len, mtd);
-                len += l;
-                if (len+begin > off+count)
-                        goto done;
-                if (len+begin < off) {
-                        begin += len;
-                        len = 0;
-                }
+		seq_printf(m, "mtd%d: %8.8llx %8.8x \"%s\"\n",
+			   mtd->index, (unsigned long long)mtd->size,
+			   mtd->erasesize, mtd->name);
         }
-
-        *eof = 1;
-
-done:
 	mutex_unlock(&mtd_table_mutex);
-        if (off >= len+begin)
-                return 0;
-        *start = page + (off-begin);
-        return ((count < begin+len-off) ? count : begin+len-off);
+        return 0;
 }
 
+static int mtd_proc_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, mtd_proc_show, NULL);
+}
+
+static const struct file_operations mtd_proc_ops = {
+	.open		= mtd_proc_open,
+	.read		= seq_read,
+	.llseek		= seq_lseek,
+	.release	= single_release,
+};
 #endif /* CONFIG_PROC_FS */
 
 /*====================================================================*/
@@ -734,8 +723,7 @@ static int __init init_mtd(void)
 		goto err_bdi3;
 
 #ifdef CONFIG_PROC_FS
-	if ((proc_mtd = create_proc_entry( "mtd", 0, NULL )))
-		proc_mtd->read_proc = mtd_read_proc;
+	proc_mtd = proc_create("mtd", 0, NULL, &mtd_proc_ops);
 #endif /* CONFIG_PROC_FS */
 	return 0;
 
