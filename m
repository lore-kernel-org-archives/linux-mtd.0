Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SqKJq-0002zx-Jk
 for linux-mtd@lists.infradead.org; Sun, 15 Jul 2012 08:36:49 +0000
Received: by lbbgg6 with SMTP id gg6so6577602lbb.36
 for <linux-mtd@lists.infradead.org>; Sun, 15 Jul 2012 01:36:35 -0700 (PDT)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: James Nute <newten82@gmail.com>,
 Iwo Mergler <Iwo.Mergler@netcommwireless.com>
Subject: [PATCH 1/2] UBIFS: add debugfs knob to switch to R/O mode
Date: Sun, 15 Jul 2012 11:30:50 +0300
Message-Id: <1342341051-30369-1-git-send-email-dedekind1@gmail.com>
Cc: Ben Gardiner <bengardiner@nanometrics.ca>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>

This patch adds another debugfs knob which switches UBIFS to R/O mode.
I needed it while trying to reproduce the 'first log node is not CS node'
bug. Without this debugfs knob you have to perform a power cut to repruduce
the bug. The knob is named 'ro_error' and all it does is it sets the
'ro_error' UBIFS flag which makes UBIFS disallow any further writes - even
write-back will fail with -EROFS. Useful for debugging.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>
---
 fs/ubifs/debug.c |   11 +++++++++++
 fs/ubifs/debug.h |    5 +++++
 2 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 92df3b0..bb31672 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -2802,6 +2802,8 @@ static ssize_t dfs_file_read(struct file *file, char __user *u, size_t count,
 		val = d->chk_fs;
 	else if (dent == d->dfs_tst_rcvry)
 		val = d->tst_rcvry;
+	else if (dent == d->dfs_ro_error)
+		val = c->ro_error;
 	else
 		return -EINVAL;
 
@@ -2885,6 +2887,8 @@ static ssize_t dfs_file_write(struct file *file, const char __user *u,
 		d->chk_fs = val;
 	else if (dent == d->dfs_tst_rcvry)
 		d->tst_rcvry = val;
+	else if (dent == d->dfs_ro_error)
+		c->ro_error = !!val;
 	else
 		return -EINVAL;
 
@@ -2996,6 +3000,13 @@ int dbg_debugfs_init_fs(struct ubifs_info *c)
 		goto out_remove;
 	d->dfs_tst_rcvry = dent;
 
+	fname = "ro_error";
+	dent = debugfs_create_file(fname, S_IRUSR | S_IWUSR, d->dfs_dir, c,
+				   &dfs_fops);
+	if (IS_ERR_OR_NULL(dent))
+		goto out_remove;
+	d->dfs_ro_error = dent;
+
 	return 0;
 
 out_remove:
diff --git a/fs/ubifs/debug.h b/fs/ubifs/debug.h
index 486a8e0..8b8cc4e 100644
--- a/fs/ubifs/debug.h
+++ b/fs/ubifs/debug.h
@@ -79,6 +79,10 @@ typedef int (*dbg_znode_callback)(struct ubifs_info *c,
  * @dfs_chk_lprops: debugfs knob to enable UBIFS LEP properties extra checks
  * @dfs_chk_fs: debugfs knob to enable UBIFS contents extra checks
  * @dfs_tst_rcvry: debugfs knob to enable UBIFS recovery testing
+ * @dfs_ro_error: debugfs knob to switch UBIFS to R/O mode (different to
+ *                re-mounting to R/O mode because it does not flush any buffers
+ *                and UBIFS just starts returning -EROFS on all write
+ *               operations)
  */
 struct ubifs_debug_info {
 	struct ubifs_zbranch old_zroot;
@@ -122,6 +126,7 @@ struct ubifs_debug_info {
 	struct dentry *dfs_chk_lprops;
 	struct dentry *dfs_chk_fs;
 	struct dentry *dfs_tst_rcvry;
+	struct dentry *dfs_ro_error;
 };
 
 /**
-- 
1.7.7.6
