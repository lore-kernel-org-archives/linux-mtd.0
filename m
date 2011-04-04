Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q6kyw-0003K8-Qt
	for linux-mtd@lists.infradead.org; Mon, 04 Apr 2011 14:42:23 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 3/5] UBIFS: rearrange the budget dump
Date: Mon,  4 Apr 2011 17:44:55 +0300
Message-Id: <1301928297-2246-4-git-send-email-dedekind1@gmail.com>
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

Re-arrange the budget dump and make sure we first dump all
the 'struct ubifs_budg_info' fields, and then the other information.
Additionally, print the 'uncommitted_idx' variable.

This change is required for to the following dumping function
enhancement where it will be possible to dump saved
'struct ubifs_budg_info' objects, not only the current one.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/debug.c |   30 ++++++++++++++++++------------
 1 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 68014aa..6646009 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -612,22 +612,28 @@ void dbg_dump_budg(struct ubifs_info *c)
 
 	spin_lock(&c->space_lock);
 	spin_lock(&dbg_lock);
-	printk(KERN_DEBUG "(pid %d) Budgeting info: budg_data_growth %lld, "
-	       "budg_dd_growth %lld, budg_idx_growth %lld\n", current->pid,
-	       c->bi.data_growth, c->bi.dd_growth, c->bi.idx_growth);
-	printk(KERN_DEBUG "\tdata budget sum %lld, total budget sum %lld, "
-	       "freeable_cnt %d\n", c->bi.data_growth + c->bi.dd_growth,
-	       c->bi.data_growth + c->bi.dd_growth + c->bi.idx_growth,
-	       c->freeable_cnt);
-	printk(KERN_DEBUG "\tmin_idx_lebs %d, old_idx_sz %lld, "
-	       "calc_idx_sz %lld, idx_gc_cnt %d\n", c->bi.min_idx_lebs,
-	       c->bi.old_idx_sz, c->calc_idx_sz, c->idx_gc_cnt);
+	printk(KERN_DEBUG "(pid %d) Budgeting info: data budget sum %lld, "
+	       "total budget sum %lld\n", current->pid,
+	       c->bi.data_growth + c->bi.dd_growth,
+	       c->bi.data_growth + c->bi.dd_growth + c->bi.idx_growth);
+	printk(KERN_DEBUG "\tbudg_data_growth %lld, budg_dd_growth %lld, "
+	       "budg_idx_growth %lld\n", c->bi.data_growth, c->bi.dd_growth,
+	       c->bi.idx_growth);
+	printk(KERN_DEBUG "\tmin_idx_lebs %d, old_idx_sz %llu, "
+	       "uncommitted_idx %lld\n", c->bi.min_idx_lebs, c->bi.old_idx_sz,
+	       c->bi.uncommitted_idx);
+	printk(KERN_DEBUG "\tpage_budget %d, inode_budget %d, dent_budget %d\n",
+	       c->bi.page_budget, c->bi.inode_budget, c->bi.dent_budget);
+	printk(KERN_DEBUG "\tnospace %u, nospace_rp %u\n",
+	       c->bi.nospace, c->bi.nospace_rp);
+	printk(KERN_DEBUG "\tdark_wm %d, dead_wm %d, max_idx_node_sz %d\n",
+	       c->dark_wm, c->dead_wm, c->max_idx_node_sz);
+	printk(KERN_DEBUG "freeable_cnt %d, calc_idx_sz %lld, idx_gc_cnt %d\n",
+	       c->freeable_cnt, c->calc_idx_sz, c->idx_gc_cnt);
 	printk(KERN_DEBUG "\tdirty_pg_cnt %ld, dirty_zn_cnt %ld, "
 	       "clean_zn_cnt %ld\n", atomic_long_read(&c->dirty_pg_cnt),
 	       atomic_long_read(&c->dirty_zn_cnt),
 	       atomic_long_read(&c->clean_zn_cnt));
-	printk(KERN_DEBUG "\tdark_wm %d, dead_wm %d, max_idx_node_sz %d\n",
-	       c->dark_wm, c->dead_wm, c->max_idx_node_sz);
 	printk(KERN_DEBUG "\tgc_lnum %d, ihead_lnum %d\n",
 	       c->gc_lnum, c->ihead_lnum);
 	/* If we are in R/O mode, journal heads do not exist */
-- 
1.7.2.3
