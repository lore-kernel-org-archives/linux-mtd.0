Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q6kyo-0003JA-Kj
	for linux-mtd@lists.infradead.org; Mon, 04 Apr 2011 14:42:17 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/5] UBIFS: introduce a separate structure for budgeting info
Date: Mon,  4 Apr 2011 17:44:53 +0300
Message-Id: <1301928297-2246-2-git-send-email-dedekind1@gmail.com>
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

This patch separates out all the budgeting-related information
from 'struct ubifs_info' to 'struct ubifs_budg_info'. This way the
code looks a bit cleaner. However, the main driver for this is
that we want to save budgeting information and print it later,
so a separate data structure for this is helpful.

This patch is a preparation for the further debugging code
improvement.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/budget.c     |  104 ++++++++++++++++++++++++------------------------
 fs/ubifs/commit.c     |    2 +-
 fs/ubifs/debug.c      |   16 ++++----
 fs/ubifs/dir.c        |    4 +-
 fs/ubifs/file.c       |    4 +-
 fs/ubifs/find.c       |   10 ++--
 fs/ubifs/master.c     |    8 ++--
 fs/ubifs/replay.c     |    8 ++--
 fs/ubifs/super.c      |   25 ++++++------
 fs/ubifs/tnc_commit.c |   10 ++--
 fs/ubifs/ubifs.h      |   75 +++++++++++++++++++----------------
 11 files changed, 136 insertions(+), 130 deletions(-)

diff --git a/fs/ubifs/budget.c b/fs/ubifs/budget.c
index c8ff0d1..02c73e7 100644
--- a/fs/ubifs/budget.c
+++ b/fs/ubifs/budget.c
@@ -106,7 +106,7 @@ static long long get_liability(struct ubifs_info *c)
 	long long liab;
 
 	spin_lock(&c->space_lock);
-	liab = c->budg_idx_growth + c->budg_data_growth + c->budg_dd_growth;
+	liab = c->bi.idx_growth + c->bi.data_growth + c->bi.dd_growth;
 	spin_unlock(&c->space_lock);
 	return liab;
 }
@@ -180,7 +180,7 @@ int ubifs_calc_min_idx_lebs(struct ubifs_info *c)
 	int idx_lebs;
 	long long idx_size;
 
-	idx_size = c->old_idx_sz + c->budg_idx_growth + c->budg_uncommitted_idx;
+	idx_size = c->bi.old_idx_sz + c->bi.idx_growth + c->bi.uncommitted_idx;
 	/* And make sure we have thrice the index size of space reserved */
 	idx_size += idx_size << 1;
 	/*
@@ -292,13 +292,13 @@ static int can_use_rp(struct ubifs_info *c)
  * budgeted index space to the size of the current index, multiplies this by 3,
  * and makes sure this does not exceed the amount of free LEBs.
  *
- * Notes about @c->min_idx_lebs and @c->lst.idx_lebs variables:
+ * Notes about @c->bi.min_idx_lebs and @c->lst.idx_lebs variables:
  * o @c->lst.idx_lebs is the number of LEBs the index currently uses. It might
  *    be large, because UBIFS does not do any index consolidation as long as
  *    there is free space. IOW, the index may take a lot of LEBs, but the LEBs
  *    will contain a lot of dirt.
- * o @c->min_idx_lebs is the number of LEBS the index presumably takes. IOW,
- *    the index may be consolidated to take up to @c->min_idx_lebs LEBs.
+ * o @c->bi.min_idx_lebs is the number of LEBS the index presumably takes. IOW,
+ *    the index may be consolidated to take up to @c->bi.min_idx_lebs LEBs.
  *
  * This function returns zero in case of success, and %-ENOSPC in case of
  * failure.
@@ -343,13 +343,13 @@ static int do_budget_space(struct ubifs_info *c)
 	       c->lst.taken_empty_lebs;
 	if (unlikely(rsvd_idx_lebs > lebs)) {
 		dbg_budg("out of indexing space: min_idx_lebs %d (old %d), "
-			 "rsvd_idx_lebs %d", min_idx_lebs, c->min_idx_lebs,
+			 "rsvd_idx_lebs %d", min_idx_lebs, c->bi.min_idx_lebs,
 			 rsvd_idx_lebs);
 		return -ENOSPC;
 	}
 
 	available = ubifs_calc_available(c, min_idx_lebs);
-	outstanding = c->budg_data_growth + c->budg_dd_growth;
+	outstanding = c->bi.data_growth + c->bi.dd_growth;
 
 	if (unlikely(available < outstanding)) {
 		dbg_budg("out of data space: available %lld, outstanding %lld",
@@ -360,7 +360,7 @@ static int do_budget_space(struct ubifs_info *c)
 	if (available - outstanding <= c->rp_size && !can_use_rp(c))
 		return -ENOSPC;
 
-	c->min_idx_lebs = min_idx_lebs;
+	c->bi.min_idx_lebs = min_idx_lebs;
 	return 0;
 }
 
@@ -393,11 +393,11 @@ static int calc_data_growth(const struct ubifs_info *c,
 {
 	int data_growth;
 
-	data_growth = req->new_ino  ? c->inode_budget : 0;
+	data_growth = req->new_ino  ? c->bi.inode_budget : 0;
 	if (req->new_page)
-		data_growth += c->page_budget;
+		data_growth += c->bi.page_budget;
 	if (req->new_dent)
-		data_growth += c->dent_budget;
+		data_growth += c->bi.dent_budget;
 	data_growth += req->new_ino_d;
 	return data_growth;
 }
@@ -413,12 +413,12 @@ static int calc_dd_growth(const struct ubifs_info *c,
 {
 	int dd_growth;
 
-	dd_growth = req->dirtied_page ? c->page_budget : 0;
+	dd_growth = req->dirtied_page ? c->bi.page_budget : 0;
 
 	if (req->dirtied_ino)
-		dd_growth += c->inode_budget << (req->dirtied_ino - 1);
+		dd_growth += c->bi.inode_budget << (req->dirtied_ino - 1);
 	if (req->mod_dent)
-		dd_growth += c->dent_budget;
+		dd_growth += c->bi.dent_budget;
 	dd_growth += req->dirtied_ino_d;
 	return dd_growth;
 }
@@ -460,19 +460,19 @@ int ubifs_budget_space(struct ubifs_info *c, struct ubifs_budget_req *req)
 
 again:
 	spin_lock(&c->space_lock);
-	ubifs_assert(c->budg_idx_growth >= 0);
-	ubifs_assert(c->budg_data_growth >= 0);
-	ubifs_assert(c->budg_dd_growth >= 0);
+	ubifs_assert(c->bi.idx_growth >= 0);
+	ubifs_assert(c->bi.data_growth >= 0);
+	ubifs_assert(c->bi.dd_growth >= 0);
 
-	if (unlikely(c->nospace) && (c->nospace_rp || !can_use_rp(c))) {
+	if (unlikely(c->bi.nospace) && (c->bi.nospace_rp || !can_use_rp(c))) {
 		dbg_budg("no space");
 		spin_unlock(&c->space_lock);
 		return -ENOSPC;
 	}
 
-	c->budg_idx_growth += idx_growth;
-	c->budg_data_growth += data_growth;
-	c->budg_dd_growth += dd_growth;
+	c->bi.idx_growth += idx_growth;
+	c->bi.data_growth += data_growth;
+	c->bi.dd_growth += dd_growth;
 
 	err = do_budget_space(c);
 	if (likely(!err)) {
@@ -484,9 +484,9 @@ again:
 	}
 
 	/* Restore the old values */
-	c->budg_idx_growth -= idx_growth;
-	c->budg_data_growth -= data_growth;
-	c->budg_dd_growth -= dd_growth;
+	c->bi.idx_growth -= idx_growth;
+	c->bi.data_growth -= data_growth;
+	c->bi.dd_growth -= dd_growth;
 	spin_unlock(&c->space_lock);
 
 	if (req->fast) {
@@ -506,9 +506,9 @@ again:
 			goto again;
 		}
 		dbg_budg("FS is full, -ENOSPC");
-		c->nospace = 1;
+		c->bi.nospace = 1;
 		if (can_use_rp(c) || c->rp_size == 0)
-			c->nospace_rp = 1;
+			c->bi.nospace_rp = 1;
 		smp_wmb();
 	} else
 		ubifs_err("cannot budget space, error %d", err);
@@ -523,8 +523,8 @@ again:
  * This function releases the space budgeted by 'ubifs_budget_space()'. Note,
  * since the index changes (which were budgeted for in @req->idx_growth) will
  * only be written to the media on commit, this function moves the index budget
- * from @c->budg_idx_growth to @c->budg_uncommitted_idx. The latter will be
- * zeroed by the commit operation.
+ * from @c->bi.idx_growth to @c->bi.uncommitted_idx. The latter will be zeroed
+ * by the commit operation.
  */
 void ubifs_release_budget(struct ubifs_info *c, struct ubifs_budget_req *req)
 {
@@ -553,23 +553,23 @@ void ubifs_release_budget(struct ubifs_info *c, struct ubifs_budget_req *req)
 	if (!req->data_growth && !req->dd_growth)
 		return;
 
-	c->nospace = c->nospace_rp = 0;
+	c->bi.nospace = c->bi.nospace_rp = 0;
 	smp_wmb();
 
 	spin_lock(&c->space_lock);
-	c->budg_idx_growth -= req->idx_growth;
-	c->budg_uncommitted_idx += req->idx_growth;
-	c->budg_data_growth -= req->data_growth;
-	c->budg_dd_growth -= req->dd_growth;
-	c->min_idx_lebs = ubifs_calc_min_idx_lebs(c);
-
-	ubifs_assert(c->budg_idx_growth >= 0);
-	ubifs_assert(c->budg_data_growth >= 0);
-	ubifs_assert(c->budg_dd_growth >= 0);
-	ubifs_assert(c->min_idx_lebs < c->main_lebs);
-	ubifs_assert(!(c->budg_idx_growth & 7));
-	ubifs_assert(!(c->budg_data_growth & 7));
-	ubifs_assert(!(c->budg_dd_growth & 7));
+	c->bi.idx_growth -= req->idx_growth;
+	c->bi.uncommitted_idx += req->idx_growth;
+	c->bi.data_growth -= req->data_growth;
+	c->bi.dd_growth -= req->dd_growth;
+	c->bi.min_idx_lebs = ubifs_calc_min_idx_lebs(c);
+
+	ubifs_assert(c->bi.idx_growth >= 0);
+	ubifs_assert(c->bi.data_growth >= 0);
+	ubifs_assert(c->bi.dd_growth >= 0);
+	ubifs_assert(c->bi.min_idx_lebs < c->main_lebs);
+	ubifs_assert(!(c->bi.idx_growth & 7));
+	ubifs_assert(!(c->bi.data_growth & 7));
+	ubifs_assert(!(c->bi.dd_growth & 7));
 	spin_unlock(&c->space_lock);
 }
 
@@ -586,13 +586,13 @@ void ubifs_convert_page_budget(struct ubifs_info *c)
 {
 	spin_lock(&c->space_lock);
 	/* Release the index growth reservation */
-	c->budg_idx_growth -= c->max_idx_node_sz << UBIFS_BLOCKS_PER_PAGE_SHIFT;
+	c->bi.idx_growth -= c->max_idx_node_sz << UBIFS_BLOCKS_PER_PAGE_SHIFT;
 	/* Release the data growth reservation */
-	c->budg_data_growth -= c->page_budget;
+	c->bi.data_growth -= c->bi.page_budget;
 	/* Increase the dirty data growth reservation instead */
-	c->budg_dd_growth += c->page_budget;
+	c->bi.dd_growth += c->bi.page_budget;
 	/* And re-calculate the indexing space reservation */
-	c->min_idx_lebs = ubifs_calc_min_idx_lebs(c);
+	c->bi.min_idx_lebs = ubifs_calc_min_idx_lebs(c);
 	spin_unlock(&c->space_lock);
 }
 
@@ -612,7 +612,7 @@ void ubifs_release_dirty_inode_budget(struct ubifs_info *c,
 
 	memset(&req, 0, sizeof(struct ubifs_budget_req));
 	/* The "no space" flags will be cleared because dd_growth is > 0 */
-	req.dd_growth = c->inode_budget + ALIGN(ui->data_len, 8);
+	req.dd_growth = c->bi.inode_budget + ALIGN(ui->data_len, 8);
 	ubifs_release_budget(c, &req);
 }
 
@@ -682,9 +682,9 @@ long long ubifs_get_free_space_nolock(struct ubifs_info *c)
 	int rsvd_idx_lebs, lebs;
 	long long available, outstanding, free;
 
-	ubifs_assert(c->min_idx_lebs == ubifs_calc_min_idx_lebs(c));
-	outstanding = c->budg_data_growth + c->budg_dd_growth;
-	available = ubifs_calc_available(c, c->min_idx_lebs);
+	ubifs_assert(c->bi.min_idx_lebs == ubifs_calc_min_idx_lebs(c));
+	outstanding = c->bi.data_growth + c->bi.dd_growth;
+	available = ubifs_calc_available(c, c->bi.min_idx_lebs);
 
 	/*
 	 * When reporting free space to user-space, UBIFS guarantees that it is
@@ -697,8 +697,8 @@ long long ubifs_get_free_space_nolock(struct ubifs_info *c)
 	 * Note, the calculations below are similar to what we have in
 	 * 'do_budget_space()', so refer there for comments.
 	 */
-	if (c->min_idx_lebs > c->lst.idx_lebs)
-		rsvd_idx_lebs = c->min_idx_lebs - c->lst.idx_lebs;
+	if (c->bi.min_idx_lebs > c->lst.idx_lebs)
+		rsvd_idx_lebs = c->bi.min_idx_lebs - c->lst.idx_lebs;
 	else
 		rsvd_idx_lebs = 0;
 	lebs = c->lst.empty_lebs + c->freeable_cnt + c->idx_gc_cnt -
diff --git a/fs/ubifs/commit.c b/fs/ubifs/commit.c
index 1bd01de..87cd0ea 100644
--- a/fs/ubifs/commit.c
+++ b/fs/ubifs/commit.c
@@ -182,7 +182,7 @@ static int do_commit(struct ubifs_info *c)
 	c->mst_node->root_len    = cpu_to_le32(zroot.len);
 	c->mst_node->ihead_lnum  = cpu_to_le32(c->ihead_lnum);
 	c->mst_node->ihead_offs  = cpu_to_le32(c->ihead_offs);
-	c->mst_node->index_size  = cpu_to_le64(c->old_idx_sz);
+	c->mst_node->index_size  = cpu_to_le64(c->bi.old_idx_sz);
 	c->mst_node->lpt_lnum    = cpu_to_le32(c->lpt_lnum);
 	c->mst_node->lpt_offs    = cpu_to_le32(c->lpt_offs);
 	c->mst_node->nhead_lnum  = cpu_to_le32(c->nhead_lnum);
diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index c04efa8..5e8d6d3 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -614,14 +614,14 @@ void dbg_dump_budg(struct ubifs_info *c)
 	spin_lock(&dbg_lock);
 	printk(KERN_DEBUG "(pid %d) Budgeting info: budg_data_growth %lld, "
 	       "budg_dd_growth %lld, budg_idx_growth %lld\n", current->pid,
-	       c->budg_data_growth, c->budg_dd_growth, c->budg_idx_growth);
+	       c->bi.data_growth, c->bi.dd_growth, c->bi.idx_growth);
 	printk(KERN_DEBUG "\tdata budget sum %lld, total budget sum %lld, "
-	       "freeable_cnt %d\n", c->budg_data_growth + c->budg_dd_growth,
-	       c->budg_data_growth + c->budg_dd_growth + c->budg_idx_growth,
+	       "freeable_cnt %d\n", c->bi.data_growth + c->bi.dd_growth,
+	       c->bi.data_growth + c->bi.dd_growth + c->bi.idx_growth,
 	       c->freeable_cnt);
 	printk(KERN_DEBUG "\tmin_idx_lebs %d, old_idx_sz %lld, "
-	       "calc_idx_sz %lld, idx_gc_cnt %d\n", c->min_idx_lebs,
-	       c->old_idx_sz, c->calc_idx_sz, c->idx_gc_cnt);
+	       "calc_idx_sz %lld, idx_gc_cnt %d\n", c->bi.min_idx_lebs,
+	       c->bi.old_idx_sz, c->calc_idx_sz, c->idx_gc_cnt);
 	printk(KERN_DEBUG "\tdirty_pg_cnt %ld, dirty_zn_cnt %ld, "
 	       "clean_zn_cnt %ld\n", atomic_long_read(&c->dirty_pg_cnt),
 	       atomic_long_read(&c->dirty_zn_cnt),
@@ -648,8 +648,8 @@ void dbg_dump_budg(struct ubifs_info *c)
 	printk(KERN_DEBUG "\tcommit state %d\n", c->cmt_state);
 
 	/* Print budgeting predictions */
-	available = ubifs_calc_available(c, c->min_idx_lebs);
-	outstanding = c->budg_data_growth + c->budg_dd_growth;
+	available = ubifs_calc_available(c, c->bi.min_idx_lebs);
+	outstanding = c->bi.data_growth + c->bi.dd_growth;
 	free = ubifs_get_free_space_nolock(c);
 	printk(KERN_DEBUG "Budgeting predictions:\n");
 	printk(KERN_DEBUG "\tavailable: %lld, outstanding %lld, free %lld\n",
@@ -996,7 +996,7 @@ int dbg_check_space_info(struct ubifs_info *c)
 	long long avail, free;
 
 	spin_lock(&c->space_lock);
-	avail = ubifs_calc_available(c, c->min_idx_lebs);
+	avail = ubifs_calc_available(c, c->bi.min_idx_lebs);
 	spin_unlock(&c->space_lock);
 	free = ubifs_get_free_space(c);
 
diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 7217d67..ef5abd3 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -603,7 +603,7 @@ static int ubifs_unlink(struct inode *dir, struct dentry *dentry)
 		ubifs_release_budget(c, &req);
 	else {
 		/* We've deleted something - clean the "no space" flags */
-		c->nospace = c->nospace_rp = 0;
+		c->bi.nospace = c->bi.nospace_rp = 0;
 		smp_wmb();
 	}
 	return 0;
@@ -693,7 +693,7 @@ static int ubifs_rmdir(struct inode *dir, struct dentry *dentry)
 		ubifs_release_budget(c, &req);
 	else {
 		/* We've deleted something - clean the "no space" flags */
-		c->nospace = c->nospace_rp = 0;
+		c->bi.nospace = c->bi.nospace_rp = 0;
 		smp_wmb();
 	}
 	return 0;
diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 0f20df5..a2b5012 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -212,7 +212,7 @@ static void release_new_page_budget(struct ubifs_info *c)
  */
 static void release_existing_page_budget(struct ubifs_info *c)
 {
-	struct ubifs_budget_req req = { .dd_growth = c->page_budget};
+	struct ubifs_budget_req req = { .dd_growth = c->bi.page_budget};
 
 	ubifs_release_budget(c, &req);
 }
@@ -1189,7 +1189,7 @@ out_budg:
 	if (budgeted)
 		ubifs_release_budget(c, &req);
 	else {
-		c->nospace = c->nospace_rp = 0;
+		c->bi.nospace = c->bi.nospace_rp = 0;
 		smp_wmb();
 	}
 	return err;
diff --git a/fs/ubifs/find.c b/fs/ubifs/find.c
index 1d54383..2559d17 100644
--- a/fs/ubifs/find.c
+++ b/fs/ubifs/find.c
@@ -252,8 +252,8 @@ int ubifs_find_dirty_leb(struct ubifs_info *c, struct ubifs_lprops *ret_lp,
 		 * But if the index takes fewer LEBs than it is reserved for it,
 		 * this function must avoid picking those reserved LEBs.
 		 */
-		if (c->min_idx_lebs >= c->lst.idx_lebs) {
-			rsvd_idx_lebs = c->min_idx_lebs -  c->lst.idx_lebs;
+		if (c->bi.min_idx_lebs >= c->lst.idx_lebs) {
+			rsvd_idx_lebs = c->bi.min_idx_lebs -  c->lst.idx_lebs;
 			exclude_index = 1;
 		}
 		spin_unlock(&c->space_lock);
@@ -276,7 +276,7 @@ int ubifs_find_dirty_leb(struct ubifs_info *c, struct ubifs_lprops *ret_lp,
 			pick_free = 0;
 	} else {
 		spin_lock(&c->space_lock);
-		exclude_index = (c->min_idx_lebs >= c->lst.idx_lebs);
+		exclude_index = (c->bi.min_idx_lebs >= c->lst.idx_lebs);
 		spin_unlock(&c->space_lock);
 	}
 
@@ -501,8 +501,8 @@ int ubifs_find_free_space(struct ubifs_info *c, int min_space, int *offs,
 
 	/* Check if there are enough empty LEBs for commit */
 	spin_lock(&c->space_lock);
-	if (c->min_idx_lebs > c->lst.idx_lebs)
-		rsvd_idx_lebs = c->min_idx_lebs -  c->lst.idx_lebs;
+	if (c->bi.min_idx_lebs > c->lst.idx_lebs)
+		rsvd_idx_lebs = c->bi.min_idx_lebs -  c->lst.idx_lebs;
 	else
 		rsvd_idx_lebs = 0;
 	lebs = c->lst.empty_lebs + c->freeable_cnt + c->idx_gc_cnt -
diff --git a/fs/ubifs/master.c b/fs/ubifs/master.c
index 21f47af..278c238 100644
--- a/fs/ubifs/master.c
+++ b/fs/ubifs/master.c
@@ -148,7 +148,7 @@ static int validate_master(const struct ubifs_info *c)
 	}
 
 	main_sz = (long long)c->main_lebs * c->leb_size;
-	if (c->old_idx_sz & 7 || c->old_idx_sz >= main_sz) {
+	if (c->bi.old_idx_sz & 7 || c->bi.old_idx_sz >= main_sz) {
 		err = 9;
 		goto out;
 	}
@@ -218,7 +218,7 @@ static int validate_master(const struct ubifs_info *c)
 	}
 
 	if (c->lst.total_dead + c->lst.total_dark +
-	    c->lst.total_used + c->old_idx_sz > main_sz) {
+	    c->lst.total_used + c->bi.old_idx_sz > main_sz) {
 		err = 21;
 		goto out;
 	}
@@ -286,7 +286,7 @@ int ubifs_read_master(struct ubifs_info *c)
 	c->gc_lnum         = le32_to_cpu(c->mst_node->gc_lnum);
 	c->ihead_lnum      = le32_to_cpu(c->mst_node->ihead_lnum);
 	c->ihead_offs      = le32_to_cpu(c->mst_node->ihead_offs);
-	c->old_idx_sz      = le64_to_cpu(c->mst_node->index_size);
+	c->bi.old_idx_sz   = le64_to_cpu(c->mst_node->index_size);
 	c->lpt_lnum        = le32_to_cpu(c->mst_node->lpt_lnum);
 	c->lpt_offs        = le32_to_cpu(c->mst_node->lpt_offs);
 	c->nhead_lnum      = le32_to_cpu(c->mst_node->nhead_lnum);
@@ -305,7 +305,7 @@ int ubifs_read_master(struct ubifs_info *c)
 	c->lst.total_dead  = le64_to_cpu(c->mst_node->total_dead);
 	c->lst.total_dark  = le64_to_cpu(c->mst_node->total_dark);
 
-	c->calc_idx_sz = c->old_idx_sz;
+	c->calc_idx_sz = c->bi.old_idx_sz;
 
 	if (c->mst_node->flags & cpu_to_le32(UBIFS_MST_NO_ORPHS))
 		c->no_orphs = 1;
diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index eed0fcf..b716a18 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -1059,13 +1059,13 @@ int ubifs_replay_journal(struct ubifs_info *c)
 		goto out;
 
 	/*
-	 * UBIFS budgeting calculations use @c->budg_uncommitted_idx variable
-	 * to roughly estimate index growth. Things like @c->min_idx_lebs
+	 * UBIFS budgeting calculations use @c->bi.uncommitted_idx variable
+	 * to roughly estimate index growth. Things like @c->bi.min_idx_lebs
 	 * depend on it. This means we have to initialize it to make sure
 	 * budgeting works properly.
 	 */
-	c->budg_uncommitted_idx = atomic_long_read(&c->dirty_zn_cnt);
-	c->budg_uncommitted_idx *= c->max_idx_node_sz;
+	c->bi.uncommitted_idx = atomic_long_read(&c->dirty_zn_cnt);
+	c->bi.uncommitted_idx *= c->max_idx_node_sz;
 
 	ubifs_assert(c->bud_bytes <= c->max_bud_bytes || c->need_recovery);
 	dbg_mnt("finished, log head LEB %d:%d, max_sqnum %llu, "
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index e0fb6b8..b9dc373 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -375,7 +375,7 @@ out:
 		ubifs_release_dirty_inode_budget(c, ui);
 	else {
 		/* We've deleted something - clean the "no space" flags */
-		c->nospace = c->nospace_rp = 0;
+		c->bi.nospace = c->bi.nospace_rp = 0;
 		smp_wmb();
 	}
 done:
@@ -694,11 +694,11 @@ static int init_constants_sb(struct ubifs_info *c)
 	 * be compressed and direntries are of the maximum size.
 	 *
 	 * Note, data, which may be stored in inodes is budgeted separately, so
-	 * it is not included into 'c->inode_budget'.
+	 * it is not included into 'c->bi.inode_budget'.
 	 */
-	c->page_budget = UBIFS_MAX_DATA_NODE_SZ * UBIFS_BLOCKS_PER_PAGE;
-	c->inode_budget = UBIFS_INO_NODE_SZ;
-	c->dent_budget = UBIFS_MAX_DENT_NODE_SZ;
+	c->bi.page_budget = UBIFS_MAX_DATA_NODE_SZ * UBIFS_BLOCKS_PER_PAGE;
+	c->bi.inode_budget = UBIFS_INO_NODE_SZ;
+	c->bi.dent_budget = UBIFS_MAX_DENT_NODE_SZ;
 
 	/*
 	 * When the amount of flash space used by buds becomes
@@ -742,7 +742,7 @@ static void init_constants_master(struct ubifs_info *c)
 {
 	long long tmp64;
 
-	c->min_idx_lebs = ubifs_calc_min_idx_lebs(c);
+	c->bi.min_idx_lebs = ubifs_calc_min_idx_lebs(c);
 	c->report_rp_size = ubifs_reported_space(c, c->rp_size);
 
 	/*
@@ -1304,7 +1304,7 @@ static int mount_ubifs(struct ubifs_info *c)
 	if (err)
 		goto out_lpt;
 
-	err = dbg_check_idx_size(c, c->old_idx_sz);
+	err = dbg_check_idx_size(c, c->bi.old_idx_sz);
 	if (err)
 		goto out_lpt;
 
@@ -1313,7 +1313,7 @@ static int mount_ubifs(struct ubifs_info *c)
 		goto out_journal;
 
 	/* Calculate 'min_idx_lebs' after journal replay */
-	c->min_idx_lebs = ubifs_calc_min_idx_lebs(c);
+	c->bi.min_idx_lebs = ubifs_calc_min_idx_lebs(c);
 
 	err = ubifs_mount_orphans(c, c->need_recovery, c->ro_mount);
 	if (err)
@@ -1442,7 +1442,8 @@ static int mount_ubifs(struct ubifs_info *c)
 		c->main_lebs, c->main_first, c->leb_cnt - 1);
 	dbg_msg("index LEBs:          %d", c->lst.idx_lebs);
 	dbg_msg("total index bytes:   %lld (%lld KiB, %lld MiB)",
-		c->old_idx_sz, c->old_idx_sz >> 10, c->old_idx_sz >> 20);
+		c->bi.old_idx_sz, c->bi.old_idx_sz >> 10,
+		c->bi.old_idx_sz >> 20);
 	dbg_msg("key hash type:       %d", c->key_hash_type);
 	dbg_msg("tree fanout:         %d", c->fanout);
 	dbg_msg("reserved GC LEB:     %d", c->gc_lnum);
@@ -1762,9 +1763,9 @@ static void ubifs_put_super(struct super_block *sb)
 	 * to write them back because of I/O errors.
 	 */
 	ubifs_assert(atomic_long_read(&c->dirty_pg_cnt) == 0);
-	ubifs_assert(c->budg_idx_growth == 0);
-	ubifs_assert(c->budg_dd_growth == 0);
-	ubifs_assert(c->budg_data_growth == 0);
+	ubifs_assert(c->bi.idx_growth == 0);
+	ubifs_assert(c->bi.dd_growth == 0);
+	ubifs_assert(c->bi.data_growth == 0);
 
 	/*
 	 * The 'c->umount_lock' prevents races between UBIFS memory shrinker
diff --git a/fs/ubifs/tnc_commit.c b/fs/ubifs/tnc_commit.c
index 53288e5..9c376b9 100644
--- a/fs/ubifs/tnc_commit.c
+++ b/fs/ubifs/tnc_commit.c
@@ -796,16 +796,16 @@ int ubifs_tnc_start_commit(struct ubifs_info *c, struct ubifs_zbranch *zroot)
 	spin_lock(&c->space_lock);
 	/*
 	 * Although we have not finished committing yet, update size of the
-	 * committed index ('c->old_idx_sz') and zero out the index growth
+	 * committed index ('c->bi.old_idx_sz') and zero out the index growth
 	 * budget. It is OK to do this now, because we've reserved all the
 	 * space which is needed to commit the index, and it is save for the
 	 * budgeting subsystem to assume the index is already committed,
 	 * even though it is not.
 	 */
-	ubifs_assert(c->min_idx_lebs == ubifs_calc_min_idx_lebs(c));
-	c->old_idx_sz = c->calc_idx_sz;
-	c->budg_uncommitted_idx = 0;
-	c->min_idx_lebs = ubifs_calc_min_idx_lebs(c);
+	ubifs_assert(c->bi.min_idx_lebs == ubifs_calc_min_idx_lebs(c));
+	c->bi.old_idx_sz = c->calc_idx_sz;
+	c->bi.uncommitted_idx = 0;
+	c->bi.min_idx_lebs = ubifs_calc_min_idx_lebs(c);
 	spin_unlock(&c->space_lock);
 	mutex_unlock(&c->tnc_mutex);
 
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index d4c07a9..26a7ebe 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -937,6 +937,40 @@ struct ubifs_mount_opts {
 	unsigned int compr_type:2;
 };
 
+/**
+ * struct ubifs_budg_info - UBIFS budgeting information.
+ * @idx_growth: amount of bytes budgeted for index growth
+ * @data_growth: amount of bytes budgeted for cached data
+ * @dd_growth: amount of bytes budgeted for cached data that will make
+ *             other data dirty
+ * @uncommitted_idx: amount of bytes were budgeted for growth of the index, but
+ *                   which still have to be taken into account because the index
+ *                   has not been committed so far
+ * @old_idx_sz: size of index on flash
+ * @min_idx_lebs: minimum number of LEBs required for the index
+ * @nospace: non-zero if the file-system does not have flash space (used as
+ *           optimization)
+ * @nospace_rp: the same as @nospace, but additionally means that even reserved
+ *              pool is full
+ * @page_budget: budget for a page (constant, nenver changed after mount)
+ * @inode_budget: budget for an inode (constant, nenver changed after mount)
+ * @dent_budget: budget for a directory entry (constant, nenver changed after
+ *               mount)
+ */
+struct ubifs_budg_info {
+	long long idx_growth;
+	long long data_growth;
+	long long dd_growth;
+	long long uncommitted_idx;
+	unsigned long long old_idx_sz;
+	int min_idx_lebs;
+	unsigned int nospace:1;
+	unsigned int nospace_rp:1;
+	int page_budget;
+	int inode_budget;
+	int dent_budget;
+};
+
 struct ubifs_debug_info;
 
 /**
@@ -1057,32 +1091,14 @@ struct ubifs_debug_info;
  * @dirty_zn_cnt: number of dirty znodes
  * @clean_zn_cnt: number of clean znodes
  *
- * @budg_idx_growth: amount of bytes budgeted for index growth
- * @budg_data_growth: amount of bytes budgeted for cached data
- * @budg_dd_growth: amount of bytes budgeted for cached data that will make
- *                  other data dirty
- * @budg_uncommitted_idx: amount of bytes were budgeted for growth of the index,
- *                        but which still have to be taken into account because
- *                        the index has not been committed so far
- * @space_lock: protects @budg_idx_growth, @budg_data_growth, @budg_dd_growth,
- *              @budg_uncommited_idx, @min_idx_lebs, @old_idx_sz, @lst,
- *              @nospace, and @nospace_rp;
- * @min_idx_lebs: minimum number of LEBs required for the index
- * @old_idx_sz: size of index on flash
+ * @space_lock: protects @bi and @lst
+ * @lst: lprops statistics
+ * @bi: budgeting information
  * @calc_idx_sz: temporary variable which is used to calculate new index size
  *               (contains accurate new index size at end of TNC commit start)
- * @lst: lprops statistics
- * @nospace: non-zero if the file-system does not have flash space (used as
- *           optimization)
- * @nospace_rp: the same as @nospace, but additionally means that even reserved
- *              pool is full
- *
- * @page_budget: budget for a page
- * @inode_budget: budget for an inode
- * @dent_budget: budget for a directory entry
  *
  * @ref_node_alsz: size of the LEB reference node aligned to the min. flash
- * I/O unit
+ *                 I/O unit
  * @mst_node_alsz: master node aligned size
  * @min_idx_node_sz: minimum indexing node aligned on 8-bytes boundary
  * @max_idx_node_sz: maximum indexing node aligned on 8-bytes boundary
@@ -1308,21 +1324,10 @@ struct ubifs_info {
 	atomic_long_t dirty_zn_cnt;
 	atomic_long_t clean_zn_cnt;
 
-	long long budg_idx_growth;
-	long long budg_data_growth;
-	long long budg_dd_growth;
-	long long budg_uncommitted_idx;
 	spinlock_t space_lock;
-	int min_idx_lebs;
-	unsigned long long old_idx_sz;
-	unsigned long long calc_idx_sz;
 	struct ubifs_lp_stats lst;
-	unsigned int nospace:1;
-	unsigned int nospace_rp:1;
-
-	int page_budget;
-	int inode_budget;
-	int dent_budget;
+	struct ubifs_budg_info bi;
+	unsigned long long calc_idx_sz;
 
 	int ref_node_alsz;
 	int mst_node_alsz;
-- 
1.7.2.3
