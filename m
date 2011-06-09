Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUb6x-0002NT-W0
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 09:01:09 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-sa01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p5990wEI028399
	for <linux-mtd@lists.infradead.org>; Thu, 9 Jun 2011 12:01:05 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 18/30] UBIFS: re-arrange debugging code a bit
Date: Thu,  9 Jun 2011 12:04:58 +0300
Message-Id: <1307610310-28691-19-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1307610310-28691-1-git-send-email-dedekind1@gmail.com>
References: <1307610310-28691-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Move 'dbg_debugfs_init()' and 'dbg_debugfs_exit()' functions which initialize
debugfs for whole UBIFS subsystem below the code which initializes debugfs for
a particular UBIFS instance. And do the same for 'ubifs_debugging_init()' and
'ubifs_debugging_exit()' functions. This layout is a bit better for the next
patches, so this is just a preparation.

Also, rename 'open_debugfs_file()' into 'dfs_file_open()' for consistency.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/debug.c |  118 +++++++++++++++++++++++++++---------------------------
 1 files changed, 59 insertions(+), 59 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 05fae3f..515658c 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -2808,70 +2808,13 @@ int dbg_leb_map(struct ubi_volume_desc *desc, int lnum, int dtype)
 	return 0;
 }
 
-/**
- * ubifs_debugging_init - initialize UBIFS debugging.
- * @c: UBIFS file-system description object
- *
- * This function initializes debugging-related data for the file system.
- * Returns zero in case of success and a negative error code in case of
- * failure.
- */
-int ubifs_debugging_init(struct ubifs_info *c)
-{
-	c->dbg = kzalloc(sizeof(struct ubifs_debug_info), GFP_KERNEL);
-	if (!c->dbg)
-		return -ENOMEM;
-
-	failure_mode_init(c);
-	return 0;
-}
-
-/**
- * ubifs_debugging_exit - free debugging data.
- * @c: UBIFS file-system description object
- */
-void ubifs_debugging_exit(struct ubifs_info *c)
-{
-	failure_mode_exit(c);
-	kfree(c->dbg);
-}
-
 /*
  * Root directory for UBIFS stuff in debugfs. Contains sub-directories which
  * contain the stuff specific to particular file-system mounts.
  */
 static struct dentry *dfs_rootdir;
 
-/**
- * dbg_debugfs_init - initialize debugfs file-system.
- *
- * UBIFS uses debugfs file-system to expose various debugging knobs to
- * user-space. This function creates "ubifs" directory in the debugfs
- * file-system. Returns zero in case of success and a negative error code in
- * case of failure.
- */
-int dbg_debugfs_init(void)
-{
-	dfs_rootdir = debugfs_create_dir("ubifs", NULL);
-	if (IS_ERR_OR_NULL(dfs_rootdir)) {
-		int err = dfs_rootdir ? PTR_ERR(dfs_rootdir) : -ENODEV;
-		ubifs_err("cannot create \"ubifs\" debugfs directory, "
-			  "error %d\n", err);
-		return err;
-	}
-
-	return 0;
-}
-
-/**
- * dbg_debugfs_exit - remove the "ubifs" directory from debugfs file-system.
- */
-void dbg_debugfs_exit(void)
-{
-	debugfs_remove(dfs_rootdir);
-}
-
-static int open_debugfs_file(struct inode *inode, struct file *file)
+static int dfs_file_open(struct inode *inode, struct file *file)
 {
 	file->private_data = inode->i_private;
 	return nonseekable_open(inode, file);
@@ -2970,7 +2913,7 @@ static ssize_t dfs_file_write(struct file *file, const char __user *u,
 }
 
 static const struct file_operations dfs_fops = {
-	.open = open_debugfs_file,
+	.open = dfs_file_open,
 	.read = dfs_file_read,
 	.write = dfs_file_write,
 	.owner = THIS_MODULE,
@@ -3091,4 +3034,61 @@ void dbg_debugfs_exit_fs(struct ubifs_info *c)
 	debugfs_remove_recursive(c->dbg->dfs_dir);
 }
 
+/**
+ * dbg_debugfs_init - initialize debugfs file-system.
+ *
+ * UBIFS uses debugfs file-system to expose various debugging knobs to
+ * user-space. This function creates "ubifs" directory in the debugfs
+ * file-system. Returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+int dbg_debugfs_init(void)
+{
+	dfs_rootdir = debugfs_create_dir("ubifs", NULL);
+	if (IS_ERR_OR_NULL(dfs_rootdir)) {
+		int err = dfs_rootdir ? PTR_ERR(dfs_rootdir) : -ENODEV;
+		ubifs_err("cannot create \"ubifs\" debugfs directory, "
+			  "error %d\n", err);
+		return err;
+	}
+
+	return 0;
+}
+
+/**
+ * dbg_debugfs_exit - remove the "ubifs" directory from debugfs file-system.
+ */
+void dbg_debugfs_exit(void)
+{
+	debugfs_remove(dfs_rootdir);
+}
+
+/**
+ * ubifs_debugging_init - initialize UBIFS debugging.
+ * @c: UBIFS file-system description object
+ *
+ * This function initializes debugging-related data for the file system.
+ * Returns zero in case of success and a negative error code in case of
+ * failure.
+ */
+int ubifs_debugging_init(struct ubifs_info *c)
+{
+	c->dbg = kzalloc(sizeof(struct ubifs_debug_info), GFP_KERNEL);
+	if (!c->dbg)
+		return -ENOMEM;
+
+	failure_mode_init(c);
+	return 0;
+}
+
+/**
+ * ubifs_debugging_exit - free debugging data.
+ * @c: UBIFS file-system description object
+ */
+void ubifs_debugging_exit(struct ubifs_info *c)
+{
+	failure_mode_exit(c);
+	kfree(c->dbg);
+}
+
 #endif /* CONFIG_UBIFS_FS_DEBUG */
-- 
1.7.2.3
