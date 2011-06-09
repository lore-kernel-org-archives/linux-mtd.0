Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUb6w-0002Ur-GJ
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 09:01:23 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-sa01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p5990wEG028399
	for <linux-mtd@lists.infradead.org>; Thu, 9 Jun 2011 12:01:05 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 16/30] UBIFS: switch self-check knobs to debugfs
Date: Thu,  9 Jun 2011 12:04:56 +0300
Message-Id: <1307610310-28691-17-git-send-email-dedekind1@gmail.com>
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

UBIFS has many built-in self-check functions which can be enabled using the
debug_chks module parameter or the corresponding sysfs file
(/sys/module/ubifs/parameters/debug_chks). However, this is not flexible enough
because it is not per-filesystem. This patch moves this to debugfs interfaces.

We already have debugfs support, so this patch just adds more debugfs files.
While looking at debugfs support I've noticed that it is racy WRT file-system
unmount, and added a TODO entry for that. This problem has been there for long
time and it is quite standard debugfs PITA. The plan is to fix this later.

This patch is simple, but it is large because it changes many places where we
check if a particular type of checks is enabled or disabled.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 Documentation/filesystems/ubifs.txt |   26 -------
 fs/ubifs/debug.c                    |  140 ++++++++++++++++++++++++++++++----
 fs/ubifs/debug.h                    |   72 +++++++++---------
 3 files changed, 159 insertions(+), 79 deletions(-)

diff --git a/Documentation/filesystems/ubifs.txt b/Documentation/filesystems/ubifs.txt
index 91ef076..a0a61d2 100644
--- a/Documentation/filesystems/ubifs.txt
+++ b/Documentation/filesystems/ubifs.txt
@@ -111,32 +111,6 @@ The following is an example of the kernel boot arguments to attach mtd0
 to UBI and mount volume "rootfs":
 ubi.mtd=0 root=ubi0:rootfs rootfstype=ubifs
 
-
-Module Parameters for Debugging
-===============================
-
-When UBIFS has been compiled with debugging enabled, there are 2 module
-parameters that are available to control aspects of testing and debugging.
-
-debug_chks	Selects extra checks that UBIFS can do while running:
-
-		Check					Flag value
-
-		General checks				1
-		Check the index				2
-		Check orphan area			8
-		Check LEB properties (lprops)		32
-		Check leaf nodes and inodes		64
-
-debug_tsts	Selects a mode of testing, as follows:
-
-		Test mode				Flag value
-
-		Failure mode for recovery testing	4
-
-For example, set debug_chks to 3 to enable general and TNC checks.
-
-
 References
 ==========
 
diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index a967d68..fdfa5de 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -31,9 +31,9 @@
 
 #include "ubifs.h"
 #include <linux/module.h>
-#include <linux/moduleparam.h>
 #include <linux/debugfs.h>
 #include <linux/math64.h>
+#include <linux/uaccess.h>
 
 #ifdef CONFIG_UBIFS_FS_DEBUG
 
@@ -42,15 +42,6 @@ DEFINE_SPINLOCK(dbg_lock);
 static char dbg_key_buf0[128];
 static char dbg_key_buf1[128];
 
-unsigned int ubifs_chk_flags;
-unsigned int ubifs_tst_flags;
-
-module_param_named(debug_chks, ubifs_chk_flags, uint, S_IRUGO | S_IWUSR);
-module_param_named(debug_tsts, ubifs_tst_flags, uint, S_IRUGO | S_IWUSR);
-
-MODULE_PARM_DESC(debug_chks, "Debug check flags");
-MODULE_PARM_DESC(debug_tsts, "Debug special test flags");
-
 static const char *get_key_fmt(int fmt)
 {
 	switch (fmt) {
@@ -2886,21 +2877,93 @@ static int open_debugfs_file(struct inode *inode, struct file *file)
 	return nonseekable_open(inode, file);
 }
 
-static ssize_t write_debugfs_file(struct file *file, const char __user *buf,
-				  size_t count, loff_t *ppos)
+static ssize_t dfs_file_read(struct file *file, char __user *u, size_t count,
+			     loff_t *ppos)
+{
+	struct dentry *dent = file->f_path.dentry;
+	struct ubifs_info *c = file->private_data;
+	struct ubifs_debug_info *d = c->dbg;
+	char buf[3];
+	int val;
+
+	if (dent == d->dfs_chk_gen)
+		val = d->chk_gen;
+	else if (dent == d->dfs_chk_index)
+		val = d->chk_index;
+	else if (dent == d->dfs_chk_orph)
+		val = d->chk_orph;
+	else if (dent == d->dfs_chk_lprops)
+		val = d->chk_lprops;
+	else if (dent == d->dfs_chk_fs)
+		val = d->chk_fs;
+	else if (dent == d->dfs_tst_rcvry)
+		val = d->tst_rcvry;
+	else
+		return -EINVAL;
+
+	if (val)
+		buf[0] = '1';
+	else
+		buf[0] = '0';
+	buf[1] = '\n';
+	buf[2] = 0x00;
+
+	return simple_read_from_buffer(u, count, ppos, buf, 2);
+}
+
+static ssize_t dfs_file_write(struct file *file, const char __user *u,
+			      size_t count, loff_t *ppos)
 {
 	struct ubifs_info *c = file->private_data;
 	struct ubifs_debug_info *d = c->dbg;
+	struct dentry *dent = file->f_path.dentry;
+	size_t buf_size;
+	char buf[8];
+	int val;
 
-	if (file->f_path.dentry == d->dfs_dump_lprops)
+	/*
+	 * FIXME: this is racy - the file-system might have already been
+	 * unmounted and we'd oops in this case.
+	 */
+	if (file->f_path.dentry == d->dfs_dump_lprops) {
 		dbg_dump_lprops(c);
-	else if (file->f_path.dentry == d->dfs_dump_budg)
+		return count;
+	}
+	if (file->f_path.dentry == d->dfs_dump_budg) {
 		dbg_dump_budg(c, &c->bi);
-	else if (file->f_path.dentry == d->dfs_dump_tnc) {
+		return count;
+	}
+	if (file->f_path.dentry == d->dfs_dump_tnc) {
 		mutex_lock(&c->tnc_mutex);
 		dbg_dump_tnc(c);
 		mutex_unlock(&c->tnc_mutex);
-	} else
+		return count;
+	}
+
+	buf_size = min_t(size_t, count, (sizeof(buf) - 1));
+	if (copy_from_user(buf, u, buf_size))
+		return -EFAULT;
+
+	if (buf[0] == '1')
+		val = 1;
+	else if (buf[0] == '0')
+		val = 0;
+	else
+		return -EINVAL;
+
+	if (dent == d->dfs_chk_gen)
+		d->chk_gen = val;
+	else if (dent == d->dfs_chk_index)
+		d->chk_index = val;
+	else if (dent == d->dfs_chk_orph)
+		d->chk_orph = val;
+	else if (dent == d->dfs_chk_lprops)
+		d->chk_lprops = val;
+	else if (dent == d->dfs_chk_fs)
+		d->chk_fs = val;
+	else if (dent == d->dfs_tst_rcvry)
+		d->tst_rcvry = val;
+	else
 		return -EINVAL;
 
 	return count;
@@ -2908,7 +2971,8 @@ static ssize_t write_debugfs_file(struct file *file, const char __user *buf,
 
 static const struct file_operations dfs_fops = {
 	.open = open_debugfs_file,
-	.write = write_debugfs_file,
+	.read = dfs_file_read,
+	.write = dfs_file_write,
 	.owner = THIS_MODULE,
 	.llseek = no_llseek,
 };
@@ -2965,6 +3029,48 @@ int dbg_debugfs_init_fs(struct ubifs_info *c)
 		goto out_remove;
 	d->dfs_dump_tnc = dent;
 
+	fname = "chk_general";
+	dent = debugfs_create_file(fname, S_IRUSR | S_IWUSR, d->dfs_dir, c,
+				   &dfs_fops);
+	if (IS_ERR_OR_NULL(dent))
+		goto out_remove;
+	d->dfs_chk_gen = dent;
+
+	fname = "chk_index";
+	dent = debugfs_create_file(fname, S_IRUSR | S_IWUSR, d->dfs_dir, c,
+				   &dfs_fops);
+	if (IS_ERR_OR_NULL(dent))
+		goto out_remove;
+	d->dfs_chk_index = dent;
+
+	fname = "chk_orphans";
+	dent = debugfs_create_file(fname, S_IRUSR | S_IWUSR, d->dfs_dir, c,
+				   &dfs_fops);
+	if (IS_ERR_OR_NULL(dent))
+		goto out_remove;
+	d->dfs_chk_orph = dent;
+
+	fname = "chk_lprops";
+	dent = debugfs_create_file(fname, S_IRUSR | S_IWUSR, d->dfs_dir, c,
+				   &dfs_fops);
+	if (IS_ERR_OR_NULL(dent))
+		goto out_remove;
+	d->dfs_chk_lprops = dent;
+
+	fname = "chk_fs";
+	dent = debugfs_create_file(fname, S_IRUSR | S_IWUSR, d->dfs_dir, c,
+				   &dfs_fops);
+	if (IS_ERR_OR_NULL(dent))
+		goto out_remove;
+	d->dfs_chk_fs = dent;
+
+	fname = "tst_recovery";
+	dent = debugfs_create_file(fname, S_IRUSR | S_IWUSR, d->dfs_dir, c,
+				   &dfs_fops);
+	if (IS_ERR_OR_NULL(dent))
+		goto out_remove;
+	d->dfs_tst_rcvry = dent;
+
 	return 0;
 
 out_remove:
diff --git a/fs/ubifs/debug.h b/fs/ubifs/debug.h
index 44265a3..8c3bdd3 100644
--- a/fs/ubifs/debug.h
+++ b/fs/ubifs/debug.h
@@ -43,11 +43,13 @@ typedef int (*dbg_znode_callback)(struct ubifs_info *c,
  * @old_zroot: old index root - used by 'dbg_check_old_index()'
  * @old_zroot_level: old index root level - used by 'dbg_check_old_index()'
  * @old_zroot_sqnum: old index root sqnum - used by 'dbg_check_old_index()'
+ *
  * @failure_mode: failure mode for recovery testing
  * @fail_delay: 0=>don't delay, 1=>delay a time, 2=>delay a number of calls
  * @fail_timeout: time in jiffies when delay of failure mode expires
  * @fail_cnt: current number of calls to failure mode I/O functions
  * @fail_cnt_max: number of calls by which to delay failure mode
+ *
  * @chk_lpt_sz: used by LPT tree size checker
  * @chk_lpt_sz2: used by LPT tree size checker
  * @chk_lpt_wastage: used by LPT tree size checker
@@ -61,21 +63,36 @@ typedef int (*dbg_znode_callback)(struct ubifs_info *c,
  * @saved_free: saved amount of free space
  * @saved_idx_gc_cnt: saved value of @c->idx_gc_cnt
  *
+ * @chk_gen: if general extra checks are enabled
+ * @chk_index: if index xtra checks are enabled
+ * @chk_orph: if orphans extra checks are enabled
+ * @chk_lprops: if lprops extra checks are enabled
+ * @chk_fs: if UBIFS contents extra checks are enabled
+ * @tst_rcvry: if UBIFS recovery testing mode enabled
+ *
  * @dfs_dir_name: name of debugfs directory containing this file-system's files
  * @dfs_dir: direntry object of the file-system debugfs directory
  * @dfs_dump_lprops: "dump lprops" debugfs knob
  * @dfs_dump_budg: "dump budgeting information" debugfs knob
  * @dfs_dump_tnc: "dump TNC" debugfs knob
+ * @dfs_chk_gen: debugfs knob to enable UBIFS general extra checks
+ * @dfs_chk_index: debugfs knob to enable UBIFS index extra checks
+ * @dfs_chk_orph: debugfs knob to enable UBIFS orphans extra checks
+ * @dfs_chk_lprops: debugfs knob to enable UBIFS LEP properties extra checks
+ * @dfs_chk_fs: debugfs knob to enable UBIFS contents extra checks
+ * @dfs_tst_rcvry: debugfs knob to enable UBIFS recovery testing
  */
 struct ubifs_debug_info {
 	struct ubifs_zbranch old_zroot;
 	int old_zroot_level;
 	unsigned long long old_zroot_sqnum;
+
 	int failure_mode;
 	int fail_delay;
 	unsigned long fail_timeout;
 	unsigned int fail_cnt;
 	unsigned int fail_cnt_max;
+
 	long long chk_lpt_sz;
 	long long chk_lpt_sz2;
 	long long chk_lpt_wastage;
@@ -89,11 +106,24 @@ struct ubifs_debug_info {
 	long long saved_free;
 	int saved_idx_gc_cnt;
 
+	unsigned int chk_gen:1;
+	unsigned int chk_index:1;
+	unsigned int chk_orph:1;
+	unsigned int chk_lprops:1;
+	unsigned int chk_fs:1;
+	unsigned int tst_rcvry:1;
+
 	char dfs_dir_name[UBIFS_DFS_DIR_LEN + 1];
 	struct dentry *dfs_dir;
 	struct dentry *dfs_dump_lprops;
 	struct dentry *dfs_dump_budg;
 	struct dentry *dfs_dump_tnc;
+	struct dentry *dfs_chk_gen;
+	struct dentry *dfs_chk_index;
+	struct dentry *dfs_chk_orph;
+	struct dentry *dfs_chk_lprops;
+	struct dentry *dfs_chk_fs;
+	struct dentry *dfs_tst_rcvry;
 };
 
 #define ubifs_assert(expr) do {                                                \
@@ -169,59 +199,29 @@ const char *dbg_key_str1(const struct ubifs_info *c,
 
 extern spinlock_t dbg_lock;
 
-/*
- * Debugging check flags.
- *
- * UBIFS_CHK_GEN: general checks
- * UBIFS_CHK_INDEX: check the index
- * UBIFS_CHK_ORPH: check orphans
- * UBIFS_CHK_LPROPS: check lprops
- * UBIFS_CHK_FS: check the file-system
- */
-enum {
-	UBIFS_CHK_GEN     = 0x1,
-	UBIFS_CHK_INDEX   = 0x2,
-	UBIFS_CHK_ORPH    = 0x8,
-	UBIFS_CHK_LPROPS  = 0x20,
-	UBIFS_CHK_FS      = 0x40,
-};
-
-/*
- * Special testing flags.
- *
- * UBIFS_TST_RCVRY: failure mode for recovery testing
- */
-enum {
-	UBIFS_TST_RCVRY             = 0x4,
-};
-
-extern unsigned int ubifs_msg_flags;
-extern unsigned int ubifs_chk_flags;
-extern unsigned int ubifs_tst_flags;
-
 static inline int dbg_is_chk_gen(const struct ubifs_info *c)
 {
-	return !!(ubifs_chk_flags & UBIFS_CHK_GEN);
+	return c->dbg->chk_gen;
 }
 static inline int dbg_is_chk_index(const struct ubifs_info *c)
 {
-	return !!(ubifs_chk_flags & UBIFS_CHK_INDEX);
+	return c->dbg->chk_index;
 }
 static inline int dbg_is_chk_orph(const struct ubifs_info *c)
 {
-	return !!(ubifs_chk_flags & UBIFS_CHK_ORPH);
+	return c->dbg->chk_orph;
 }
 static inline int dbg_is_chk_lprops(const struct ubifs_info *c)
 {
-	return !!(ubifs_chk_flags & UBIFS_CHK_LPROPS);
+	return c->dbg->chk_lprops;
 }
 static inline int dbg_is_chk_fs(const struct ubifs_info *c)
 {
-	return !!(ubifs_chk_flags & UBIFS_CHK_FS);
+	return c->dbg->chk_fs;
 }
 static inline int dbg_is_tst_rcvry(const struct ubifs_info *c)
 {
-	return !!(ubifs_tst_flags & UBIFS_TST_RCVRY);
+	return c->dbg->tst_rcvry;
 }
 
 int ubifs_debugging_init(struct ubifs_info *c);
-- 
1.7.2.3
