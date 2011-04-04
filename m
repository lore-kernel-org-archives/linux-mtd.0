Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q6kyo-0003J9-8X
	for linux-mtd@lists.infradead.org; Mon, 04 Apr 2011 14:42:14 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 4/5] UBIFS: improve space checking debugging feature
Date: Mon,  4 Apr 2011 17:44:56 +0300
Message-Id: <1301928297-2246-5-git-send-email-dedekind1@gmail.com>
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

This patch improves the 'dbg_check_space_info()' function which checks
whether the amount of space before re-mounting and after re-mounting
is the same (remounting from R/O to R/W modes and vice-versa).

The problem is that 'dbg_check_space_info()' does not save the budgeting
information before re-mounting, so when an error is reported, we do not
know why the amount of free space changed.

This patches makes the following changes:

1. Teaches 'dbg_dump_budg()' function to accept a 'struct ubifs_budg_info'
   argument and print out the this argument. This way we may ask it to
   print any saved budgeting info, no only the current one.
2. Accordingly changes all the callers of 'dbg_dump_budg()' to comply with
   the changed interface.
3. Introduce a 'saved_bi' (saved budgeting info) field to
   'struct ubifs_debug_info' and save the budgeting info before re-mounting
   there.
4. Change 'dbg_check_space_info()' and make it print both old and new
   budgeting information.
5. Additionally, save 'c->freeable_cnt' and 'c->igx_gc_cnt' and print them
   if and error happens. These values contribute to the amount of free space,
   so we have to print them.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/debug.c      |   49 +++++++++++++++++++++++++++++++++----------------
 fs/ubifs/debug.h      |   12 +++++++++---
 fs/ubifs/journal.c    |    2 +-
 fs/ubifs/super.c      |    2 +-
 fs/ubifs/tnc_commit.c |    2 +-
 5 files changed, 45 insertions(+), 22 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 6646009..92b4709 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -602,7 +602,7 @@ void dbg_dump_lstats(const struct ubifs_lp_stats *lst)
 	spin_unlock(&dbg_lock);
 }
 
-void dbg_dump_budg(struct ubifs_info *c)
+void dbg_dump_budg(struct ubifs_info *c, const struct ubifs_budg_info *bi)
 {
 	int i;
 	struct rb_node *rb;
@@ -614,21 +614,30 @@ void dbg_dump_budg(struct ubifs_info *c)
 	spin_lock(&dbg_lock);
 	printk(KERN_DEBUG "(pid %d) Budgeting info: data budget sum %lld, "
 	       "total budget sum %lld\n", current->pid,
-	       c->bi.data_growth + c->bi.dd_growth,
-	       c->bi.data_growth + c->bi.dd_growth + c->bi.idx_growth);
+	       bi->data_growth + bi->dd_growth,
+	       bi->data_growth + bi->dd_growth + bi->idx_growth);
 	printk(KERN_DEBUG "\tbudg_data_growth %lld, budg_dd_growth %lld, "
-	       "budg_idx_growth %lld\n", c->bi.data_growth, c->bi.dd_growth,
-	       c->bi.idx_growth);
+	       "budg_idx_growth %lld\n", bi->data_growth, bi->dd_growth,
+	       bi->idx_growth);
 	printk(KERN_DEBUG "\tmin_idx_lebs %d, old_idx_sz %llu, "
-	       "uncommitted_idx %lld\n", c->bi.min_idx_lebs, c->bi.old_idx_sz,
-	       c->bi.uncommitted_idx);
+	       "uncommitted_idx %lld\n", bi->min_idx_lebs, bi->old_idx_sz,
+	       bi->uncommitted_idx);
 	printk(KERN_DEBUG "\tpage_budget %d, inode_budget %d, dent_budget %d\n",
-	       c->bi.page_budget, c->bi.inode_budget, c->bi.dent_budget);
+	       bi->page_budget, bi->inode_budget, bi->dent_budget);
 	printk(KERN_DEBUG "\tnospace %u, nospace_rp %u\n",
-	       c->bi.nospace, c->bi.nospace_rp);
+	       bi->nospace, bi->nospace_rp);
 	printk(KERN_DEBUG "\tdark_wm %d, dead_wm %d, max_idx_node_sz %d\n",
 	       c->dark_wm, c->dead_wm, c->max_idx_node_sz);
-	printk(KERN_DEBUG "freeable_cnt %d, calc_idx_sz %lld, idx_gc_cnt %d\n",
+
+	if (bi != &c->bi)
+		/*
+		 * If we are dumping saved budgeting data, do not print
+		 * additional information which is about the current state, not
+		 * the old one which corresponded to the saved budgeting data.
+		 */
+		goto out_unlock;
+
+	printk(KERN_DEBUG "\nfreeable_cnt %d, calc_idx_sz %lld, idx_gc_cnt %d\n",
 	       c->freeable_cnt, c->calc_idx_sz, c->idx_gc_cnt);
 	printk(KERN_DEBUG "\tdirty_pg_cnt %ld, dirty_zn_cnt %ld, "
 	       "clean_zn_cnt %ld\n", atomic_long_read(&c->dirty_pg_cnt),
@@ -636,6 +645,7 @@ void dbg_dump_budg(struct ubifs_info *c)
 	       atomic_long_read(&c->clean_zn_cnt));
 	printk(KERN_DEBUG "\tgc_lnum %d, ihead_lnum %d\n",
 	       c->gc_lnum, c->ihead_lnum);
+
 	/* If we are in R/O mode, journal heads do not exist */
 	if (c->jheads)
 		for (i = 0; i < c->jhead_cnt; i++)
@@ -660,6 +670,7 @@ void dbg_dump_budg(struct ubifs_info *c)
 	printk(KERN_DEBUG "Budgeting predictions:\n");
 	printk(KERN_DEBUG "\tavailable: %lld, outstanding %lld, free %lld\n",
 	       available, outstanding, free);
+out_unlock:
 	spin_unlock(&dbg_lock);
 	spin_unlock(&c->space_lock);
 }
@@ -980,10 +991,12 @@ void dbg_save_space_info(struct ubifs_info *c)
 {
 	struct ubifs_debug_info *d = c->dbg;
 
-	ubifs_get_lp_stats(c, &d->saved_lst);
-
 	spin_lock(&c->space_lock);
+	memcpy(&d->saved_lst, &c->lst, sizeof(struct ubifs_lp_stats));
+	memcpy(&d->saved_bi, &c->bi, sizeof(struct ubifs_budg_info));
 	d->saved_free = ubifs_get_free_space_nolock(c);
+	d->saved_freeable_cnt = c->freeable_cnt;
+	d->saved_idx_gc_cnt = c->idx_gc_cnt;
 	spin_unlock(&c->space_lock);
 }
 
@@ -1018,11 +1031,15 @@ int dbg_check_space_info(struct ubifs_info *c)
 out:
 	ubifs_msg("saved lprops statistics dump");
 	dbg_dump_lstats(&d->saved_lst);
-	ubifs_get_lp_stats(c, &lst);
-
+	ubifs_msg("saved budgeting info dump");
+	dbg_dump_budg(c, &d->saved_bi);
+	ubifs_msg("saved freeable_cnt %d, saved idx_gc_cnt %d",
+		  d->saved_freeable_cnt, d->saved_idx_gc_cnt);
 	ubifs_msg("current lprops statistics dump");
+	ubifs_get_lp_stats(c, &lst);
 	dbg_dump_lstats(&lst);
-	dbg_dump_budg(c);
+	ubifs_msg("current budgeting info dump");
+	dbg_dump_budg(c, &c->bi);
 	dump_stack();
 	return -EINVAL;
 }
@@ -2770,7 +2787,7 @@ static ssize_t write_debugfs_file(struct file *file, const char __user *buf,
 	if (file->f_path.dentry == d->dfs_dump_lprops)
 		dbg_dump_lprops(c);
 	else if (file->f_path.dentry == d->dfs_dump_budg)
-		dbg_dump_budg(c);
+		dbg_dump_budg(c, &c->bi);
 	else if (file->f_path.dentry == d->dfs_dump_tnc) {
 		mutex_lock(&c->tnc_mutex);
 		dbg_dump_tnc(c);
diff --git a/fs/ubifs/debug.h b/fs/ubifs/debug.h
index 919f0de..c217ae9 100644
--- a/fs/ubifs/debug.h
+++ b/fs/ubifs/debug.h
@@ -44,7 +44,10 @@
  * @new_ihead_offs: used by debugging to check @c->ihead_offs
  *
  * @saved_lst: saved lprops statistics (used by 'dbg_save_space_info()')
- * @saved_free: saved free space (used by 'dbg_save_space_info()')
+ * @saved_bi: saved budgeting information
+ * @saved_free: saved amount of free space
+ * @saved_freeable_cnt: saved value of @c->freeable_cnt
+ * @saved_idx_gc_cnt: saved value of @c->idx_gc_cnt
  *
  * dfs_dir_name: name of debugfs directory containing this file-system's files
  * dfs_dir: direntry object of the file-system debugfs directory
@@ -70,7 +73,10 @@ struct ubifs_debug_info {
 	int new_ihead_offs;
 
 	struct ubifs_lp_stats saved_lst;
+	struct ubifs_budg_info saved_bi;
 	long long saved_free;
+	int saved_freeable_cnt;
+	int saved_idx_gc_cnt;
 
 	char dfs_dir_name[100];
 	struct dentry *dfs_dir;
@@ -256,7 +262,7 @@ void dbg_dump_lpt_node(const struct ubifs_info *c, void *node, int lnum,
 		       int offs);
 void dbg_dump_budget_req(const struct ubifs_budget_req *req);
 void dbg_dump_lstats(const struct ubifs_lp_stats *lst);
-void dbg_dump_budg(struct ubifs_info *c);
+void dbg_dump_budg(struct ubifs_info *c, const struct ubifs_budg_info *bi);
 void dbg_dump_lprop(const struct ubifs_info *c, const struct ubifs_lprops *lp);
 void dbg_dump_lprops(struct ubifs_info *c);
 void dbg_dump_lpt_info(struct ubifs_info *c);
@@ -413,7 +419,7 @@ void dbg_debugfs_exit_fs(struct ubifs_info *c);
 #define dbg_dump_lpt_node(c, node, lnum, offs) ({})
 #define dbg_dump_budget_req(req)               ({})
 #define dbg_dump_lstats(lst)                   ({})
-#define dbg_dump_budg(c)                       ({})
+#define dbg_dump_budg(c, bi)                   ({})
 #define dbg_dump_lprop(c, lp)                  ({})
 #define dbg_dump_lprops(c)                     ({})
 #define dbg_dump_lpt_info(c)                   ({})
diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 65d485f..ce55a48 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -381,7 +381,7 @@ out:
 		/* This are some budgeting problems, print useful information */
 		down_write(&c->commit_sem);
 		dbg_dump_stack();
-		dbg_dump_budg(c);
+		dbg_dump_budg(c, &c->bi);
 		dbg_dump_lprops(c);
 		cmt_retries = dbg_check_lprops(c);
 		up_write(&c->commit_sem);
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index b9dc373..66c12cd 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1145,7 +1145,7 @@ static int check_free_space(struct ubifs_info *c)
 	ubifs_assert(c->dark_wm > 0);
 	if (c->lst.total_free + c->lst.total_dirty < c->dark_wm) {
 		ubifs_err("insufficient free space to mount in R/W mode");
-		dbg_dump_budg(c);
+		dbg_dump_budg(c, &c->bi);
 		dbg_dump_lprops(c);
 		return -ENOSPC;
 	}
diff --git a/fs/ubifs/tnc_commit.c b/fs/ubifs/tnc_commit.c
index 66f066d..c471b06 100644
--- a/fs/ubifs/tnc_commit.c
+++ b/fs/ubifs/tnc_commit.c
@@ -383,7 +383,7 @@ static int layout_in_gaps(struct ubifs_info *c, int cnt)
 				 * option which forces in-the-gaps is enabled.
 				 */
 				ubifs_err("out of space");
-				dbg_dump_budg(c);
+				dbg_dump_budg(c, &c->bi);
 				dbg_dump_lprops(c);
 			}
 			/* Try to commit anyway */
-- 
1.7.2.3
