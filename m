Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUb6u-0002S2-Ha
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 09:01:13 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-sa01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p5990wE2028399
	for <linux-mtd@lists.infradead.org>; Thu, 9 Jun 2011 12:00:59 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 02/30] UBIFS: lessen the size of debugging info data structure
Date: Thu,  9 Jun 2011 12:04:42 +0300
Message-Id: <1307610310-28691-3-git-send-email-dedekind1@gmail.com>
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

This patch lessens the 'struct ubifs_debug_info' size by 90 bytes by
allocating less bytes for the debugfs root directory name. It introduces macros
for the name patter an length instead of hard-coding 100 bytes. It also makes
UBIFS use 'snprintf()' and teaches it to gracefully catch situations when the
name array is too short.

Additionally, this patch makes 2 unrelated changes - I just thought they do not
deserve separate commits: simplifies 'ubifs_assert()' for non-debugging case
and makes 'dbg_debugfs_init()' properly verify debugfs return code which may be
an error code or NULL, so we should you 'IS_ERR_OR_NULL()' instead of
'IS_ERR()'.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/debug.c |   18 +++++++++++++-----
 fs/ubifs/debug.h |   11 +++++++++--
 2 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 0bb2bce..c9609a6 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -2815,8 +2815,8 @@ static struct dentry *dfs_rootdir;
 int dbg_debugfs_init(void)
 {
 	dfs_rootdir = debugfs_create_dir("ubifs", NULL);
-	if (IS_ERR(dfs_rootdir)) {
-		int err = PTR_ERR(dfs_rootdir);
+	if (IS_ERR_OR_NULL(dfs_rootdir)) {
+		int err = dfs_rootdir ? PTR_ERR(dfs_rootdir) : -ENODEV;
 		ubifs_err("cannot create \"ubifs\" debugfs directory, "
 			  "error %d\n", err);
 		return err;
@@ -2880,12 +2880,20 @@ static const struct file_operations dfs_fops = {
  */
 int dbg_debugfs_init_fs(struct ubifs_info *c)
 {
-	int err;
+	int err, n;
 	const char *fname;
 	struct dentry *dent;
 	struct ubifs_debug_info *d = c->dbg;
 
-	sprintf(d->dfs_dir_name, "ubi%d_%d", c->vi.ubi_num, c->vi.vol_id);
+	n = snprintf(d->dfs_dir_name, UBIFS_DFS_DIR_LEN + 1, UBIFS_DFS_DIR_NAME,
+		     c->vi.ubi_num, c->vi.vol_id);
+	if (n == UBIFS_DFS_DIR_LEN) {
+		/* The array size is too small */
+		fname = UBIFS_DFS_DIR_NAME;
+		dent = ERR_PTR(-EINVAL);
+		goto out;
+	}
+
 	fname = d->dfs_dir_name;
 	dent = debugfs_create_dir(fname, dfs_rootdir);
 	if (IS_ERR_OR_NULL(dent))
@@ -2916,7 +2924,7 @@ out_remove:
 	debugfs_remove_recursive(d->dfs_dir);
 out:
 	err = dent ? PTR_ERR(dent) : -ENODEV;
-	ubifs_err("cannot create \"%s\" debugfs directory, error %d\n",
+	ubifs_err("cannot create \"%s\" debugfs filr or directory, error %d\n",
 		  fname, err);
 	return err;
 }
diff --git a/fs/ubifs/debug.h b/fs/ubifs/debug.h
index a811ac4..b59c43a 100644
--- a/fs/ubifs/debug.h
+++ b/fs/ubifs/debug.h
@@ -33,6 +33,13 @@ typedef int (*dbg_znode_callback)(struct ubifs_info *c,
 
 #include <linux/random.h>
 
+/*
+ * The UBIFS debugfs directory name pattern and maximum name length (3 for "ubi"
+ * + 1 for "_" and plus 2x2 for 2 UBI numbers and 1 for the trailing zero byte.
+ */
+#define UBIFS_DFS_DIR_NAME "ubi%d_%d"
+#define UBIFS_DFS_DIR_LEN  (3 + 1 + 2*2 + 1)
+
 /**
  * ubifs_debug_info - per-FS debugging information.
  * @old_zroot: old index root - used by 'dbg_check_old_index()'
@@ -84,7 +91,7 @@ struct ubifs_debug_info {
 	long long saved_free;
 	int saved_idx_gc_cnt;
 
-	char dfs_dir_name[100];
+	char dfs_dir_name[UBIFS_DFS_DIR_LEN + 1];
 	struct dentry *dfs_dir;
 	struct dentry *dfs_dump_lprops;
 	struct dentry *dfs_dump_budg;
@@ -313,7 +320,7 @@ void dbg_debugfs_exit_fs(struct ubifs_info *c);
 
 /* Use "if (0)" to make compiler check arguments even if debugging is off */
 #define ubifs_assert(expr)  do {                                               \
-	if (0 && (expr))                                                       \
+	if (0)                                                                 \
 		printk(KERN_CRIT "UBIFS assert failed in %s at %u (pid %d)\n", \
 		       __func__, __LINE__, current->pid);                      \
 } while (0)
-- 
1.7.2.3
