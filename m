Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUb6x-0002NU-Vz
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 09:01:09 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-sa01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p5990wEK028399
	for <linux-mtd@lists.infradead.org>; Thu, 9 Jun 2011 12:01:06 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 20/30] UBIFS: add global debugfs knobs
Date: Thu,  9 Jun 2011 12:05:00 +0300
Message-Id: <1307610310-28691-21-git-send-email-dedekind1@gmail.com>
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

Now we have per-FS (superblock) debugfs knobs, but they have one drawback - you
have to first mount the FS and only after this you can switch self-checks
on/off. But often we want to have the checks enabled during the mount.
Introduce global debugging knobs for this purpose.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/debug.c |  138 ++++++++++++++++++++++++++++++++++++++++++++++++++----
 fs/ubifs/debug.h |   35 +++++++++++---
 2 files changed, 157 insertions(+), 16 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 91ac72c..741f939 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -3056,7 +3056,7 @@ out_remove:
 	debugfs_remove_recursive(d->dfs_dir);
 out:
 	err = dent ? PTR_ERR(dent) : -ENODEV;
-	ubifs_err("cannot create \"%s\" debugfs filr or directory, error %d\n",
+	ubifs_err("cannot create \"%s\" debugfs file or directory, error %d\n",
 		  fname, err);
 	return err;
 }
@@ -3070,6 +3070,74 @@ void dbg_debugfs_exit_fs(struct ubifs_info *c)
 	debugfs_remove_recursive(c->dbg->dfs_dir);
 }
 
+struct ubifs_global_debug_info ubifs_dbg;
+
+static struct dentry *dfs_chk_gen;
+static struct dentry *dfs_chk_index;
+static struct dentry *dfs_chk_orph;
+static struct dentry *dfs_chk_lprops;
+static struct dentry *dfs_chk_fs;
+static struct dentry *dfs_tst_rcvry;
+
+static ssize_t dfs_global_file_read(struct file *file, char __user *u,
+				    size_t count, loff_t *ppos)
+{
+	struct dentry *dent = file->f_path.dentry;
+	int val;
+
+	if (dent == dfs_chk_gen)
+		val = ubifs_dbg.chk_gen;
+	else if (dent == dfs_chk_index)
+		val = ubifs_dbg.chk_index;
+	else if (dent == dfs_chk_orph)
+		val = ubifs_dbg.chk_orph;
+	else if (dent == dfs_chk_lprops)
+		val = ubifs_dbg.chk_lprops;
+	else if (dent == dfs_chk_fs)
+		val = ubifs_dbg.chk_fs;
+	else if (dent == dfs_tst_rcvry)
+		val = ubifs_dbg.tst_rcvry;
+	else
+		return -EINVAL;
+
+	return provide_user_output(val, u, count, ppos);
+}
+
+static ssize_t dfs_global_file_write(struct file *file, const char __user *u,
+				     size_t count, loff_t *ppos)
+{
+	struct dentry *dent = file->f_path.dentry;
+	int val;
+
+	val = interpret_user_input(u, count);
+	if (val < 0)
+		return val;
+
+	if (dent == dfs_chk_gen)
+		ubifs_dbg.chk_gen = val;
+	else if (dent == dfs_chk_index)
+		ubifs_dbg.chk_index = val;
+	else if (dent == dfs_chk_orph)
+		ubifs_dbg.chk_orph = val;
+	else if (dent == dfs_chk_lprops)
+		ubifs_dbg.chk_lprops = val;
+	else if (dent == dfs_chk_fs)
+		ubifs_dbg.chk_fs = val;
+	else if (dent == dfs_tst_rcvry)
+		ubifs_dbg.tst_rcvry = val;
+	else
+		return -EINVAL;
+
+	return count;
+}
+
+static const struct file_operations dfs_global_fops = {
+	.read = dfs_global_file_read,
+	.write = dfs_global_file_write,
+	.owner = THIS_MODULE,
+	.llseek = no_llseek,
+};
+
 /**
  * dbg_debugfs_init - initialize debugfs file-system.
  *
@@ -3080,15 +3148,67 @@ void dbg_debugfs_exit_fs(struct ubifs_info *c)
  */
 int dbg_debugfs_init(void)
 {
-	dfs_rootdir = debugfs_create_dir("ubifs", NULL);
-	if (IS_ERR_OR_NULL(dfs_rootdir)) {
-		int err = dfs_rootdir ? PTR_ERR(dfs_rootdir) : -ENODEV;
-		ubifs_err("cannot create \"ubifs\" debugfs directory, "
-			  "error %d\n", err);
-		return err;
-	}
+	int err;
+	const char *fname;
+	struct dentry *dent;
+
+	fname = "ubifs";
+	dent = debugfs_create_dir(fname, NULL);
+	if (IS_ERR_OR_NULL(dent))
+		goto out;
+	dfs_rootdir = dent;
+
+	fname = "chk_general";
+	dent = debugfs_create_file(fname, S_IRUSR | S_IWUSR, dfs_rootdir, NULL,
+				   &dfs_global_fops);
+	if (IS_ERR_OR_NULL(dent))
+		goto out_remove;
+	dfs_chk_gen = dent;
+
+	fname = "chk_index";
+	dent = debugfs_create_file(fname, S_IRUSR | S_IWUSR, dfs_rootdir, NULL,
+				   &dfs_global_fops);
+	if (IS_ERR_OR_NULL(dent))
+		goto out_remove;
+	dfs_chk_index = dent;
+
+	fname = "chk_orphans";
+	dent = debugfs_create_file(fname, S_IRUSR | S_IWUSR, dfs_rootdir, NULL,
+				   &dfs_global_fops);
+	if (IS_ERR_OR_NULL(dent))
+		goto out_remove;
+	dfs_chk_orph = dent;
+
+	fname = "chk_lprops";
+	dent = debugfs_create_file(fname, S_IRUSR | S_IWUSR, dfs_rootdir, NULL,
+				   &dfs_global_fops);
+	if (IS_ERR_OR_NULL(dent))
+		goto out_remove;
+	dfs_chk_lprops = dent;
+
+	fname = "chk_fs";
+	dent = debugfs_create_file(fname, S_IRUSR | S_IWUSR, dfs_rootdir, NULL,
+				   &dfs_global_fops);
+	if (IS_ERR_OR_NULL(dent))
+		goto out_remove;
+	dfs_chk_fs = dent;
+
+	fname = "tst_recovery";
+	dent = debugfs_create_file(fname, S_IRUSR | S_IWUSR, dfs_rootdir, NULL,
+				   &dfs_global_fops);
+	if (IS_ERR_OR_NULL(dent))
+		goto out_remove;
+	dfs_tst_rcvry = dent;
 
 	return 0;
+
+out_remove:
+	debugfs_remove_recursive(dfs_rootdir);
+out:
+	err = dent ? PTR_ERR(dent) : -ENODEV;
+	ubifs_err("cannot create \"%s\" debugfs file or directory, error %d\n",
+		  fname, err);
+	return err;
 }
 
 /**
@@ -3096,7 +3216,7 @@ int dbg_debugfs_init(void)
  */
 void dbg_debugfs_exit(void)
 {
-	debugfs_remove(dfs_rootdir);
+	debugfs_remove_recursive(dfs_rootdir);
 }
 
 /**
diff --git a/fs/ubifs/debug.h b/fs/ubifs/debug.h
index 8c3bdd3..43ec5d1 100644
--- a/fs/ubifs/debug.h
+++ b/fs/ubifs/debug.h
@@ -126,6 +126,25 @@ struct ubifs_debug_info {
 	struct dentry *dfs_tst_rcvry;
 };
 
+/**
+ * ubifs_global_debug_info - global (not per-FS) UBIFS debugging information.
+ *
+ * @chk_gen: if general extra checks are enabled
+ * @chk_index: if index xtra checks are enabled
+ * @chk_orph: if orphans extra checks are enabled
+ * @chk_lprops: if lprops extra checks are enabled
+ * @chk_fs: if UBIFS contents extra checks are enabled
+ * @tst_rcvry: if UBIFS recovery testing mode enabled
+ */
+struct ubifs_global_debug_info {
+	unsigned int chk_gen:1;
+	unsigned int chk_index:1;
+	unsigned int chk_orph:1;
+	unsigned int chk_lprops:1;
+	unsigned int chk_fs:1;
+	unsigned int tst_rcvry:1;
+};
+
 #define ubifs_assert(expr) do {                                                \
 	if (unlikely(!(expr))) {                                               \
 		printk(KERN_CRIT "UBIFS assert failed in %s at %u (pid %d)\n", \
@@ -162,6 +181,8 @@ const char *dbg_key_str1(const struct ubifs_info *c,
 #define DBGKEY(key) dbg_key_str0(c, (key))
 #define DBGKEY1(key) dbg_key_str1(c, (key))
 
+extern spinlock_t dbg_lock;
+
 #define ubifs_dbg_msg(type, fmt, ...) do {                        \
 	spin_lock(&dbg_lock);                                     \
 	pr_debug("UBIFS DBG " type ": " fmt "\n", ##__VA_ARGS__); \
@@ -197,31 +218,31 @@ const char *dbg_key_str1(const struct ubifs_info *c,
 /* Additional recovery messages */
 #define dbg_rcvry(fmt, ...) ubifs_dbg_msg("rcvry", fmt, ##__VA_ARGS__)
 
-extern spinlock_t dbg_lock;
+extern struct ubifs_global_debug_info ubifs_dbg;
 
 static inline int dbg_is_chk_gen(const struct ubifs_info *c)
 {
-	return c->dbg->chk_gen;
+	return !!(ubifs_dbg.chk_gen || c->dbg->chk_gen);
 }
 static inline int dbg_is_chk_index(const struct ubifs_info *c)
 {
-	return c->dbg->chk_index;
+	return !!(ubifs_dbg.chk_index || c->dbg->chk_index);
 }
 static inline int dbg_is_chk_orph(const struct ubifs_info *c)
 {
-	return c->dbg->chk_orph;
+	return !!(ubifs_dbg.chk_orph || c->dbg->chk_orph);
 }
 static inline int dbg_is_chk_lprops(const struct ubifs_info *c)
 {
-	return c->dbg->chk_lprops;
+	return !!(ubifs_dbg.chk_lprops || c->dbg->chk_lprops);
 }
 static inline int dbg_is_chk_fs(const struct ubifs_info *c)
 {
-	return c->dbg->chk_fs;
+	return !!(ubifs_dbg.chk_fs || c->dbg->chk_fs);
 }
 static inline int dbg_is_tst_rcvry(const struct ubifs_info *c)
 {
-	return c->dbg->tst_rcvry;
+	return !!(ubifs_dbg.tst_rcvry || c->dbg->tst_rcvry);
 }
 
 int ubifs_debugging_init(struct ubifs_info *c);
-- 
1.7.2.3
