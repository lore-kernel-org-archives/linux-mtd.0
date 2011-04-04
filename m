Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q6kyQ-0003ID-KZ
	for linux-mtd@lists.infradead.org; Mon, 04 Apr 2011 14:41:50 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/5] UBIFS: simplify dbg_dump_budg calling conventions
Date: Mon,  4 Apr 2011 17:44:54 +0300
Message-Id: <1301928297-2246-3-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1301928297-2246-1-git-send-email-dedekind1@gmail.com>
References: <1301928297-2246-1-git-send-email-dedekind1@gmail.com>
Cc: Caizhiyong <caizhiyong@huawei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

The current 'dbg_dump_budg()' calling convention is that the
'c->space_lock' spinlock is held. However, none of the callers
actually use it from contects which have 'c->space_lock' locked,
so all callers have to explicitely lock and unlock the spinlock.
This is not very sensible convention. This patch changes it and
makes 'dbg_dump_budg()' lock the spinlock instead of imposing this
to the callers. This simplifies the code a little.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/debug.c      |   12 ++++--------
 fs/ubifs/journal.c    |    2 --
 fs/ubifs/tnc_commit.c |    2 --
 3 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 5e8d6d3..68014aa 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -610,7 +610,7 @@ void dbg_dump_budg(struct ubifs_info *c)
 	struct ubifs_gced_idx_leb *idx_gc;
 	long long available, outstanding, free;
 
-	ubifs_assert(spin_is_locked(&c->space_lock));
+	spin_lock(&c->space_lock);
 	spin_lock(&dbg_lock);
 	printk(KERN_DEBUG "(pid %d) Budgeting info: budg_data_growth %lld, "
 	       "budg_dd_growth %lld, budg_idx_growth %lld\n", current->pid,
@@ -655,6 +655,7 @@ void dbg_dump_budg(struct ubifs_info *c)
 	printk(KERN_DEBUG "\tavailable: %lld, outstanding %lld, free %lld\n",
 	       available, outstanding, free);
 	spin_unlock(&dbg_lock);
+	spin_unlock(&c->space_lock);
 }
 
 void dbg_dump_lprop(const struct ubifs_info *c, const struct ubifs_lprops *lp)
@@ -1015,10 +1016,7 @@ out:
 
 	ubifs_msg("current lprops statistics dump");
 	dbg_dump_lstats(&lst);
-
-	spin_lock(&c->space_lock);
 	dbg_dump_budg(c);
-	spin_unlock(&c->space_lock);
 	dump_stack();
 	return -EINVAL;
 }
@@ -2765,11 +2763,9 @@ static ssize_t write_debugfs_file(struct file *file, const char __user *buf,
 
 	if (file->f_path.dentry == d->dfs_dump_lprops)
 		dbg_dump_lprops(c);
-	else if (file->f_path.dentry == d->dfs_dump_budg) {
-		spin_lock(&c->space_lock);
+	else if (file->f_path.dentry == d->dfs_dump_budg)
 		dbg_dump_budg(c);
-		spin_unlock(&c->space_lock);
-	} else if (file->f_path.dentry == d->dfs_dump_tnc) {
+	else if (file->f_path.dentry == d->dfs_dump_tnc) {
 		mutex_lock(&c->tnc_mutex);
 		dbg_dump_tnc(c);
 		mutex_unlock(&c->tnc_mutex);
diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index aed25e8..65d485f 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -380,10 +380,8 @@ out:
 	if (err == -ENOSPC) {
 		/* This are some budgeting problems, print useful information */
 		down_write(&c->commit_sem);
-		spin_lock(&c->space_lock);
 		dbg_dump_stack();
 		dbg_dump_budg(c);
-		spin_unlock(&c->space_lock);
 		dbg_dump_lprops(c);
 		cmt_retries = dbg_check_lprops(c);
 		up_write(&c->commit_sem);
diff --git a/fs/ubifs/tnc_commit.c b/fs/ubifs/tnc_commit.c
index 9c376b9..66f066d 100644
--- a/fs/ubifs/tnc_commit.c
+++ b/fs/ubifs/tnc_commit.c
@@ -383,9 +383,7 @@ static int layout_in_gaps(struct ubifs_info *c, int cnt)
 				 * option which forces in-the-gaps is enabled.
 				 */
 				ubifs_err("out of space");
-				spin_lock(&c->space_lock);
 				dbg_dump_budg(c);
-				spin_unlock(&c->space_lock);
 				dbg_dump_lprops(c);
 			}
 			/* Try to commit anyway */
-- 
1.7.2.3
