Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fgIhH-0004VU-SJ
 for linux-mtd@lists.infradead.org; Thu, 19 Jul 2018 23:51:02 +0000
From: Theuns Verwoerd <theuns.verwoerd@alliedtelesis.co.nz>
To: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Theuns Verwoerd <theuns.verwoerd@alliedtelesis.co.nz>
Subject: [PATCH 2/2] jffs2: Provide jffs2_sync files to track gc POLL progress
Date: Fri, 20 Jul 2018 11:50:12 +1200
Message-Id: <f1c6c3cc0c8850e143594afd57b50d30cd8bb5f8.1532043059.git.theuns.verwoerd@alliedtelesis.co.nz>
In-Reply-To: <cover.1532043059.git.theuns.verwoerd@alliedtelesis.co.nz>
References: <cover.1532043059.git.theuns.verwoerd@alliedtelesis.co.nz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When executing secure deletion under JFFS2 via the -POLL forced cleanup
option, userspace may need to know when the process has safely completed.
Provide debugfs files per mount that, when read, blocks while cleanup
is in progress: once the read completes it is safe to assume that all
obsoleted sensitive information has been erased.

If CONFIG_JFFS2_FS_SYNC is configured, create
/sys/kernel/debug/jffs2_sync_<fs name> files that block on read
while forced gc is in progress.

Signed-off-by: Theuns Verwoerd <theuns.verwoerd@alliedtelesis.co.nz>
---
 fs/jffs2/Kconfig |  8 ++++++++
 fs/jffs2/super.c | 40 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/fs/jffs2/Kconfig b/fs/jffs2/Kconfig
index ad850c5bf2ca..191272729f06 100644
--- a/fs/jffs2/Kconfig
+++ b/fs/jffs2/Kconfig
@@ -96,6 +96,14 @@ config JFFS2_FS_SECURITY
 	  If you are not using a security module that requires using
 	  extended attributes for file security labels, say N.
 
+config JFFS2_FS_SYNC
+	bool "JFFS2 jffs2_sync file support"
+	depends on JFFS2_FS
+	help
+	  This enables creation of jffs2_sync files for tracking
+	  POLL forced garbage collection.  It is used as part of FIPS
+	  secure deletion support.
+
 config JFFS2_COMPRESSION_OPTIONS
 	bool "Advanced compression options for JFFS2"
 	depends on JFFS2_FS
diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
index 87bdf0f4cba1..264f68ab2e91 100644
--- a/fs/jffs2/super.c
+++ b/fs/jffs2/super.c
@@ -27,6 +27,7 @@
 #include <linux/namei.h>
 #include <linux/seq_file.h>
 #include <linux/exportfs.h>
+#include <linux/debugfs.h>
 #include "compr.h"
 #include "nodelist.h"
 
@@ -34,6 +35,26 @@ static void jffs2_put_super(struct super_block *);
 
 static struct kmem_cache *jffs2_inode_cachep;
 
+#ifdef CONFIG_JFFS2_FS_SYNC
+#define JFFS2_FS_SYNC_NAME "jffs2_sync"
+static struct dentry *jffs2_debugfs_dir;
+
+ssize_t jffs2_sync_file_read(struct file *f,
+	      char __user *b, size_t len, loff_t *ofs)
+{
+	struct jffs2_sb_info *c = file_inode(f)->i_private;
+
+	while (c->tidemark)
+		schedule();
+
+	return 0;
+}
+const struct file_operations jffs2_sync_ops = {
+	.owner   = THIS_MODULE,
+	.read    = jffs2_sync_file_read,
+};
+#endif
+
 static struct inode *jffs2_alloc_inode(struct super_block *sb)
 {
 	struct jffs2_inode_info *f;
@@ -307,6 +328,17 @@ static int jffs2_fill_super(struct super_block *sb, void *data, int silent)
 	sb->s_flags |= SB_POSIXACL;
 #endif
 	ret = jffs2_do_fill_super(sb, data, silent);
+
+#ifdef CONFIG_JFFS2_FS_SYNC
+	if (jffs2_debugfs_dir) {
+		char fname[128];
+
+		snprintf(fname, sizeof(fname), "%s_%s",
+				JFFS2_FS_SYNC_NAME, sb->s_mtd->name);
+		debugfs_create_file(fname, 0444,
+				jffs2_debugfs_dir, c, &jffs2_sync_ops);
+	}
+#endif
 	return ret;
 }
 
@@ -405,6 +437,11 @@ static int __init init_jffs2_fs(void)
 		pr_err("error: Failed to register filesystem\n");
 		goto out_slab;
 	}
+
+#ifdef CONFIG_JFFS2_FS_SYNC
+	jffs2_debugfs_dir = debugfs_create_dir("jffs2", NULL);
+#endif
+
 	return 0;
 
  out_slab:
@@ -419,6 +456,9 @@ static int __init init_jffs2_fs(void)
 static void __exit exit_jffs2_fs(void)
 {
 	unregister_filesystem(&jffs2_fs_type);
+#ifdef CONFIG_JFFS2_FS_SYNC
+	debugfs_remove_recursive(jffs2_debugfs_dir);
+#endif
 	jffs2_destroy_slab_caches();
 	jffs2_compressors_exit();
 
-- 
2.18.0
