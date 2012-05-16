Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SUhor-0002Rl-Jl
 for linux-mtd@lists.infradead.org; Wed, 16 May 2012 17:15:37 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/5] UBIFS: rename dumping functions
Date: Wed, 16 May 2012 20:16:23 +0300
Message-Id: <1337188586-32293-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1337188586-32293-1-git-send-email-dedekind1@gmail.com>
References: <1337188586-32293-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

This commit re-names all functions which dump something from "dbg_dump_*()" to
"ubifs_dump_*()". This is done for consistency with UBI and because this way it
will be more logical once we remove the debugging sompilation option.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 fs/ubifs/commit.c     |    4 +-
 fs/ubifs/debug.c      |  110 ++++++++++++++++++++++++-------------------------
 fs/ubifs/debug.h      |   99 +++++++++++++++++++++-----------------------
 fs/ubifs/file.c       |    2 +-
 fs/ubifs/io.c         |   12 +++---
 fs/ubifs/journal.c    |    4 +-
 fs/ubifs/lprops.c     |    8 ++--
 fs/ubifs/lpt.c        |    2 +-
 fs/ubifs/lpt_commit.c |   22 +++++-----
 fs/ubifs/master.c     |    4 +-
 fs/ubifs/orphan.c     |    4 +-
 fs/ubifs/recovery.c   |    8 ++--
 fs/ubifs/replay.c     |    4 +-
 fs/ubifs/sb.c         |    2 +-
 fs/ubifs/scan.c       |    2 +-
 fs/ubifs/super.c      |    8 ++--
 fs/ubifs/tnc.c        |   12 +++---
 fs/ubifs/tnc_commit.c |   12 +++---
 fs/ubifs/tnc_misc.c   |    4 +-
 19 files changed, 160 insertions(+), 163 deletions(-)

diff --git a/fs/ubifs/commit.c b/fs/ubifs/commit.c
index fb3b5c8..4f795d1 100644
--- a/fs/ubifs/commit.c
+++ b/fs/ubifs/commit.c
@@ -715,13 +715,13 @@ out:
 
 out_dump:
 	dbg_err("dumping index node (iip=%d)", i->iip);
-	dbg_dump_node(c, idx);
+	ubifs_dump_node(c, idx);
 	list_del(&i->list);
 	kfree(i);
 	if (!list_empty(&list)) {
 		i = list_entry(list.prev, struct idx_node, list);
 		dbg_err("dumping parent index node");
-		dbg_dump_node(c, &i->idx);
+		ubifs_dump_node(c, &i->idx);
 	}
 out_free:
 	while (!list_empty(&list)) {
diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 139025a..914b4c8 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -232,7 +232,7 @@ static void dump_ch(const struct ubifs_ch *ch)
 	printk(KERN_ERR "\tlen            %u\n", le32_to_cpu(ch->len));
 }
 
-void dbg_dump_inode(struct ubifs_info *c, const struct inode *inode)
+void ubifs_dump_inode(struct ubifs_info *c, const struct inode *inode)
 {
 	const struct ubifs_inode *ui = ubifs_inode(inode);
 	struct qstr nm = { .name = NULL };
@@ -300,7 +300,7 @@ void dbg_dump_inode(struct ubifs_info *c, const struct inode *inode)
 	kfree(pdent);
 }
 
-void dbg_dump_node(const struct ubifs_info *c, const void *node)
+void ubifs_dump_node(const struct ubifs_info *c, const void *node)
 {
 	int i, n;
 	union ubifs_key key;
@@ -603,7 +603,7 @@ void dbg_dump_node(const struct ubifs_info *c, const void *node)
 	spin_unlock(&dbg_lock);
 }
 
-void dbg_dump_budget_req(const struct ubifs_budget_req *req)
+void ubifs_dump_budget_req(const struct ubifs_budget_req *req)
 {
 	spin_lock(&dbg_lock);
 	printk(KERN_ERR "Budgeting request: new_ino %d, dirtied_ino %d\n",
@@ -620,7 +620,7 @@ void dbg_dump_budget_req(const struct ubifs_budget_req *req)
 	spin_unlock(&dbg_lock);
 }
 
-void dbg_dump_lstats(const struct ubifs_lp_stats *lst)
+void ubifs_dump_lstats(const struct ubifs_lp_stats *lst)
 {
 	spin_lock(&dbg_lock);
 	printk(KERN_ERR "(pid %d) Lprops statistics: empty_lebs %d, "
@@ -634,7 +634,7 @@ void dbg_dump_lstats(const struct ubifs_lp_stats *lst)
 	spin_unlock(&dbg_lock);
 }
 
-void dbg_dump_budg(struct ubifs_info *c, const struct ubifs_budg_info *bi)
+void ubifs_dump_budg(struct ubifs_info *c, const struct ubifs_budg_info *bi)
 {
 	int i;
 	struct rb_node *rb;
@@ -707,7 +707,7 @@ out_unlock:
 	spin_unlock(&c->space_lock);
 }
 
-void dbg_dump_lprop(const struct ubifs_info *c, const struct ubifs_lprops *lp)
+void ubifs_dump_lprop(const struct ubifs_info *c, const struct ubifs_lprops *lp)
 {
 	int i, spc, dark = 0, dead = 0;
 	struct rb_node *rb;
@@ -801,7 +801,7 @@ void dbg_dump_lprop(const struct ubifs_info *c, const struct ubifs_lprops *lp)
 	printk(KERN_CONT ")\n");
 }
 
-void dbg_dump_lprops(struct ubifs_info *c)
+void ubifs_dump_lprops(struct ubifs_info *c)
 {
 	int lnum, err;
 	struct ubifs_lprops lp;
@@ -810,20 +810,20 @@ void dbg_dump_lprops(struct ubifs_info *c)
 	printk(KERN_ERR "(pid %d) start dumping LEB properties\n",
 	       current->pid);
 	ubifs_get_lp_stats(c, &lst);
-	dbg_dump_lstats(&lst);
+	ubifs_dump_lstats(&lst);
 
 	for (lnum = c->main_first; lnum < c->leb_cnt; lnum++) {
 		err = ubifs_read_one_lp(c, lnum, &lp);
 		if (err)
 			ubifs_err("cannot read lprops for LEB %d", lnum);
 
-		dbg_dump_lprop(c, &lp);
+		ubifs_dump_lprop(c, &lp);
 	}
 	printk(KERN_ERR "(pid %d) finish dumping LEB properties\n",
 	       current->pid);
 }
 
-void dbg_dump_lpt_info(struct ubifs_info *c)
+void ubifs_dump_lpt_info(struct ubifs_info *c)
 {
 	int i;
 
@@ -862,8 +862,8 @@ void dbg_dump_lpt_info(struct ubifs_info *c)
 	spin_unlock(&dbg_lock);
 }
 
-void dbg_dump_sleb(const struct ubifs_info *c,
-		   const struct ubifs_scan_leb *sleb, int offs)
+void ubifs_dump_sleb(const struct ubifs_info *c,
+		     const struct ubifs_scan_leb *sleb, int offs)
 {
 	struct ubifs_scan_node *snod;
 
@@ -874,11 +874,11 @@ void dbg_dump_sleb(const struct ubifs_info *c,
 		cond_resched();
 		printk(KERN_ERR "Dumping node at LEB %d:%d len %d\n", sleb->lnum,
 		       snod->offs, snod->len);
-		dbg_dump_node(c, snod->node);
+		ubifs_dump_node(c, snod->node);
 	}
 }
 
-void dbg_dump_leb(const struct ubifs_info *c, int lnum)
+void ubifs_dump_leb(const struct ubifs_info *c, int lnum)
 {
 	struct ubifs_scan_leb *sleb;
 	struct ubifs_scan_node *snod;
@@ -909,7 +909,7 @@ void dbg_dump_leb(const struct ubifs_info *c, int lnum)
 		cond_resched();
 		printk(KERN_ERR "Dumping node at LEB %d:%d len %d\n", lnum,
 		       snod->offs, snod->len);
-		dbg_dump_node(c, snod->node);
+		ubifs_dump_node(c, snod->node);
 	}
 
 	printk(KERN_ERR "(pid %d) finish dumping LEB %d\n",
@@ -921,8 +921,8 @@ out:
 	return;
 }
 
-void dbg_dump_znode(const struct ubifs_info *c,
-		    const struct ubifs_znode *znode)
+void ubifs_dump_znode(const struct ubifs_info *c,
+		      const struct ubifs_znode *znode)
 {
 	int n;
 	const struct ubifs_zbranch *zbr;
@@ -965,7 +965,7 @@ void dbg_dump_znode(const struct ubifs_info *c,
 	spin_unlock(&dbg_lock);
 }
 
-void dbg_dump_heap(struct ubifs_info *c, struct ubifs_lpt_heap *heap, int cat)
+void ubifs_dump_heap(struct ubifs_info *c, struct ubifs_lpt_heap *heap, int cat)
 {
 	int i;
 
@@ -981,8 +981,8 @@ void dbg_dump_heap(struct ubifs_info *c, struct ubifs_lpt_heap *heap, int cat)
 	printk(KERN_ERR "(pid %d) finish dumping heap\n", current->pid);
 }
 
-void dbg_dump_pnode(struct ubifs_info *c, struct ubifs_pnode *pnode,
-		    struct ubifs_nnode *parent, int iip)
+void ubifs_dump_pnode(struct ubifs_info *c, struct ubifs_pnode *pnode,
+		      struct ubifs_nnode *parent, int iip)
 {
 	int i;
 
@@ -999,7 +999,7 @@ void dbg_dump_pnode(struct ubifs_info *c, struct ubifs_pnode *pnode,
 	}
 }
 
-void dbg_dump_tnc(struct ubifs_info *c)
+void ubifs_dump_tnc(struct ubifs_info *c)
 {
 	struct ubifs_znode *znode;
 	int level;
@@ -1014,7 +1014,7 @@ void dbg_dump_tnc(struct ubifs_info *c)
 			level = znode->level;
 			printk(KERN_ERR "== Level %d ==\n", level);
 		}
-		dbg_dump_znode(c, znode);
+		ubifs_dump_znode(c, znode);
 		znode = ubifs_tnc_levelorder_next(c->zroot.znode, znode);
 	}
 	printk(KERN_ERR "(pid %d) finish dumping TNC tree\n", current->pid);
@@ -1023,18 +1023,18 @@ void dbg_dump_tnc(struct ubifs_info *c)
 static int dump_znode(struct ubifs_info *c, struct ubifs_znode *znode,
 		      void *priv)
 {
-	dbg_dump_znode(c, znode);
+	ubifs_dump_znode(c, znode);
 	return 0;
 }
 
 /**
- * dbg_dump_index - dump the on-flash index.
+ * ubifs_dump_index - dump the on-flash index.
  * @c: UBIFS file-system description object
  *
- * This function dumps whole UBIFS indexing B-tree, unlike 'dbg_dump_tnc()'
+ * This function dumps whole UBIFS indexing B-tree, unlike 'ubifs_dump_tnc()'
  * which dumps only in-memory znodes and does not read znodes which from flash.
  */
-void dbg_dump_index(struct ubifs_info *c)
+void ubifs_dump_index(struct ubifs_info *c)
 {
 	dbg_walk_index(c, NULL, dump_znode, NULL);
 }
@@ -1120,15 +1120,15 @@ int dbg_check_space_info(struct ubifs_info *c)
 
 out:
 	ubifs_msg("saved lprops statistics dump");
-	dbg_dump_lstats(&d->saved_lst);
+	ubifs_dump_lstats(&d->saved_lst);
 	ubifs_msg("saved budgeting info dump");
-	dbg_dump_budg(c, &d->saved_bi);
+	ubifs_dump_budg(c, &d->saved_bi);
 	ubifs_msg("saved idx_gc_cnt %d", d->saved_idx_gc_cnt);
 	ubifs_msg("current lprops statistics dump");
 	ubifs_get_lp_stats(c, &lst);
-	dbg_dump_lstats(&lst);
+	ubifs_dump_lstats(&lst);
 	ubifs_msg("current budgeting info dump");
-	dbg_dump_budg(c, &c->bi);
+	ubifs_dump_budg(c, &c->bi);
 	dump_stack();
 	return -EINVAL;
 }
@@ -1223,14 +1223,14 @@ int dbg_check_dir(struct ubifs_info *c, const struct inode *dir)
 			  "but calculated size is %llu", dir->i_ino,
 			  (unsigned long long)i_size_read(dir),
 			  (unsigned long long)size);
-		dbg_dump_inode(c, dir);
+		ubifs_dump_inode(c, dir);
 		dump_stack();
 		return -EINVAL;
 	}
 	if (dir->i_nlink != nlink) {
 		ubifs_err("directory inode %lu has nlink %u, but calculated "
 			  "nlink is %u", dir->i_ino, dir->i_nlink, nlink);
-		dbg_dump_inode(c, dir);
+		ubifs_dump_inode(c, dir);
 		dump_stack();
 		return -EINVAL;
 	}
@@ -1293,7 +1293,7 @@ static int dbg_check_key_order(struct ubifs_info *c, struct ubifs_zbranch *zbr1,
 		dbg_err("but it should have key %s according to tnc",
 			dbg_snprintf_key(c, &zbr1->key, key_buf,
 					 DBG_KEY_BUF_LEN));
-		dbg_dump_node(c, dent1);
+		ubifs_dump_node(c, dent1);
 		goto out_free;
 	}
 
@@ -1305,7 +1305,7 @@ static int dbg_check_key_order(struct ubifs_info *c, struct ubifs_zbranch *zbr1,
 		dbg_err("but it should have key %s according to tnc",
 			dbg_snprintf_key(c, &zbr2->key, key_buf,
 					 DBG_KEY_BUF_LEN));
-		dbg_dump_node(c, dent2);
+		ubifs_dump_node(c, dent2);
 		goto out_free;
 	}
 
@@ -1324,9 +1324,9 @@ static int dbg_check_key_order(struct ubifs_info *c, struct ubifs_zbranch *zbr1,
 			dbg_snprintf_key(c, &key, key_buf, DBG_KEY_BUF_LEN));
 
 	ubifs_msg("first node at %d:%d\n", zbr1->lnum, zbr1->offs);
-	dbg_dump_node(c, dent1);
+	ubifs_dump_node(c, dent1);
 	ubifs_msg("second node at %d:%d\n", zbr2->lnum, zbr2->offs);
-	dbg_dump_node(c, dent2);
+	ubifs_dump_node(c, dent2);
 
 out_free:
 	kfree(dent2);
@@ -1529,10 +1529,10 @@ static int dbg_check_znode(struct ubifs_info *c, struct ubifs_zbranch *zbr)
 out:
 	ubifs_err("failed, error %d", err);
 	ubifs_msg("dump of the znode");
-	dbg_dump_znode(c, znode);
+	ubifs_dump_znode(c, znode);
 	if (zp) {
 		ubifs_msg("dump of the parent znode");
-		dbg_dump_znode(c, zp);
+		ubifs_dump_znode(c, zp);
 	}
 	dump_stack();
 	return -EINVAL;
@@ -1599,9 +1599,9 @@ int dbg_check_tnc(struct ubifs_info *c, int extra)
 				return err;
 			if (err) {
 				ubifs_msg("first znode");
-				dbg_dump_znode(c, prev);
+				ubifs_dump_znode(c, prev);
 				ubifs_msg("second znode");
-				dbg_dump_znode(c, znode);
+				ubifs_dump_znode(c, znode);
 				return -EINVAL;
 			}
 		}
@@ -1690,7 +1690,7 @@ int dbg_walk_index(struct ubifs_info *c, dbg_leaf_callback leaf_cb,
 			if (err) {
 				ubifs_err("znode checking function returned "
 					  "error %d", err);
-				dbg_dump_znode(c, znode);
+				ubifs_dump_znode(c, znode);
 				goto out_dump;
 			}
 		}
@@ -1758,7 +1758,7 @@ out_dump:
 	else
 		zbr = &c->zroot;
 	ubifs_msg("dump of znode at LEB %d:%d", zbr->lnum, zbr->offs);
-	dbg_dump_znode(c, znode);
+	ubifs_dump_znode(c, znode);
 out_unlock:
 	mutex_unlock(&c->tnc_mutex);
 	return err;
@@ -2194,7 +2194,7 @@ out:
 
 out_dump:
 	ubifs_msg("dump of node at LEB %d:%d", zbr->lnum, zbr->offs);
-	dbg_dump_node(c, node);
+	ubifs_dump_node(c, node);
 out_free:
 	kfree(node);
 	return err;
@@ -2352,7 +2352,7 @@ out_dump:
 
 	ubifs_msg("dump of the inode %lu sitting in LEB %d:%d",
 		  (unsigned long)fscki->inum, zbr->lnum, zbr->offs);
-	dbg_dump_node(c, ino);
+	ubifs_dump_node(c, ino);
 	kfree(ino);
 	return -EINVAL;
 }
@@ -2423,12 +2423,12 @@ int dbg_check_data_nodes_order(struct ubifs_info *c, struct list_head *head)
 
 		if (sa->type != UBIFS_DATA_NODE) {
 			ubifs_err("bad node type %d", sa->type);
-			dbg_dump_node(c, sa->node);
+			ubifs_dump_node(c, sa->node);
 			return -EINVAL;
 		}
 		if (sb->type != UBIFS_DATA_NODE) {
 			ubifs_err("bad node type %d", sb->type);
-			dbg_dump_node(c, sb->node);
+			ubifs_dump_node(c, sb->node);
 			return -EINVAL;
 		}
 
@@ -2459,8 +2459,8 @@ int dbg_check_data_nodes_order(struct ubifs_info *c, struct list_head *head)
 	return 0;
 
 error_dump:
-	dbg_dump_node(c, sa->node);
-	dbg_dump_node(c, sb->node);
+	ubifs_dump_node(c, sa->node);
+	ubifs_dump_node(c, sb->node);
 	return -EINVAL;
 }
 
@@ -2491,13 +2491,13 @@ int dbg_check_nondata_nodes_order(struct ubifs_info *c, struct list_head *head)
 		if (sa->type != UBIFS_INO_NODE && sa->type != UBIFS_DENT_NODE &&
 		    sa->type != UBIFS_XENT_NODE) {
 			ubifs_err("bad node type %d", sa->type);
-			dbg_dump_node(c, sa->node);
+			ubifs_dump_node(c, sa->node);
 			return -EINVAL;
 		}
 		if (sa->type != UBIFS_INO_NODE && sa->type != UBIFS_DENT_NODE &&
 		    sa->type != UBIFS_XENT_NODE) {
 			ubifs_err("bad node type %d", sb->type);
-			dbg_dump_node(c, sb->node);
+			ubifs_dump_node(c, sb->node);
 			return -EINVAL;
 		}
 
@@ -2547,9 +2547,9 @@ int dbg_check_nondata_nodes_order(struct ubifs_info *c, struct list_head *head)
 
 error_dump:
 	ubifs_msg("dumping first node");
-	dbg_dump_node(c, sa->node);
+	ubifs_dump_node(c, sa->node);
 	ubifs_msg("dumping second node");
-	dbg_dump_node(c, sb->node);
+	ubifs_dump_node(c, sb->node);
 	return -EINVAL;
 	return 0;
 }
@@ -2857,16 +2857,16 @@ static ssize_t dfs_file_write(struct file *file, const char __user *u,
 	 * 'ubifs-debug' file-system instead.
 	 */
 	if (file->f_path.dentry == d->dfs_dump_lprops) {
-		dbg_dump_lprops(c);
+		ubifs_dump_lprops(c);
 		return count;
 	}
 	if (file->f_path.dentry == d->dfs_dump_budg) {
-		dbg_dump_budg(c, &c->bi);
+		ubifs_dump_budg(c, &c->bi);
 		return count;
 	}
 	if (file->f_path.dentry == d->dfs_dump_tnc) {
 		mutex_lock(&c->tnc_mutex);
-		dbg_dump_tnc(c);
+		ubifs_dump_tnc(c);
 		mutex_unlock(&c->tnc_mutex);
 		return count;
 	}
diff --git a/fs/ubifs/debug.h b/fs/ubifs/debug.h
index 6e5d345..f898369 100644
--- a/fs/ubifs/debug.h
+++ b/fs/ubifs/debug.h
@@ -255,27 +255,27 @@ const char *dbg_get_key_dump(const struct ubifs_info *c,
 			     const union ubifs_key *key);
 const char *dbg_snprintf_key(const struct ubifs_info *c,
 			     const union ubifs_key *key, char *buffer, int len);
-void dbg_dump_inode(struct ubifs_info *c, const struct inode *inode);
-void dbg_dump_node(const struct ubifs_info *c, const void *node);
-void dbg_dump_lpt_node(const struct ubifs_info *c, void *node, int lnum,
-		       int offs);
-void dbg_dump_budget_req(const struct ubifs_budget_req *req);
-void dbg_dump_lstats(const struct ubifs_lp_stats *lst);
-void dbg_dump_budg(struct ubifs_info *c, const struct ubifs_budg_info *bi);
-void dbg_dump_lprop(const struct ubifs_info *c, const struct ubifs_lprops *lp);
-void dbg_dump_lprops(struct ubifs_info *c);
-void dbg_dump_lpt_info(struct ubifs_info *c);
-void dbg_dump_leb(const struct ubifs_info *c, int lnum);
-void dbg_dump_sleb(const struct ubifs_info *c,
-		   const struct ubifs_scan_leb *sleb, int offs);
-void dbg_dump_znode(const struct ubifs_info *c,
-		    const struct ubifs_znode *znode);
-void dbg_dump_heap(struct ubifs_info *c, struct ubifs_lpt_heap *heap, int cat);
-void dbg_dump_pnode(struct ubifs_info *c, struct ubifs_pnode *pnode,
-		    struct ubifs_nnode *parent, int iip);
-void dbg_dump_tnc(struct ubifs_info *c);
-void dbg_dump_index(struct ubifs_info *c);
-void dbg_dump_lpt_lebs(const struct ubifs_info *c);
+void ubifs_dump_inode(struct ubifs_info *c, const struct inode *inode);
+void ubifs_dump_node(const struct ubifs_info *c, const void *node);
+void ubifs_dump_budget_req(const struct ubifs_budget_req *req);
+void ubifs_dump_lstats(const struct ubifs_lp_stats *lst);
+void ubifs_dump_budg(struct ubifs_info *c, const struct ubifs_budg_info *bi);
+void ubifs_dump_lprop(const struct ubifs_info *c,
+		      const struct ubifs_lprops *lp);
+void ubifs_dump_lprops(struct ubifs_info *c);
+void ubifs_dump_lpt_info(struct ubifs_info *c);
+void ubifs_dump_leb(const struct ubifs_info *c, int lnum);
+void ubifs_dump_sleb(const struct ubifs_info *c,
+		     const struct ubifs_scan_leb *sleb, int offs);
+void ubifs_dump_znode(const struct ubifs_info *c,
+		      const struct ubifs_znode *znode);
+void ubifs_dump_heap(struct ubifs_info *c, struct ubifs_lpt_heap *heap,
+		     int cat);
+void ubifs_dump_pnode(struct ubifs_info *c, struct ubifs_pnode *pnode,
+		      struct ubifs_nnode *parent, int iip);
+void ubifs_dump_tnc(struct ubifs_info *c);
+void ubifs_dump_index(struct ubifs_info *c);
+void ubifs_dump_lpt_lebs(const struct ubifs_info *c);
 
 int dbg_walk_index(struct ubifs_info *c, dbg_leaf_callback leaf_cb,
 		   dbg_znode_callback znode_cb, void *priv);
@@ -371,42 +371,39 @@ static inline const char *
 dbg_snprintf_key(const struct ubifs_info *c,
 		 const union ubifs_key *key, char *buffer,
 		 int len)                                         { return ""; }
-static inline void dbg_dump_inode(struct ubifs_info *c,
-				  const struct inode *inode)      { return; }
-static inline void dbg_dump_node(const struct ubifs_info *c,
-				 const void *node)                { return; }
-static inline void dbg_dump_lpt_node(const struct ubifs_info *c,
-				     void *node, int lnum,
-				     int offs)                    { return; }
+static inline void ubifs_dump_inode(struct ubifs_info *c,
+				    const struct inode *inode)    { return; }
+static inline void ubifs_dump_node(const struct ubifs_info *c,
+				   const void *node)              { return; }
 static inline void
-dbg_dump_budget_req(const struct ubifs_budget_req *req)           { return; }
+ubifs_dump_budget_req(const struct ubifs_budget_req *req)         { return; }
 static inline void
-dbg_dump_lstats(const struct ubifs_lp_stats *lst)                 { return; }
+ubifs_dump_lstats(const struct ubifs_lp_stats *lst)               { return; }
 static inline void
-dbg_dump_budg(struct ubifs_info *c,
+ubifs_dump_budg(struct ubifs_info *c,
 	      const struct ubifs_budg_info *bi)                   { return; }
-static inline void dbg_dump_lprop(const struct ubifs_info *c,
-				  const struct ubifs_lprops *lp)  { return; }
-static inline void dbg_dump_lprops(struct ubifs_info *c)          { return; }
-static inline void dbg_dump_lpt_info(struct ubifs_info *c)        { return; }
-static inline void dbg_dump_leb(const struct ubifs_info *c,
-				int lnum)                         { return; }
+static inline void ubifs_dump_lprop(const struct ubifs_info *c,
+				    const struct ubifs_lprops *lp){ return; }
+static inline void ubifs_dump_lprops(struct ubifs_info *c)        { return; }
+static inline void ubifs_dump_lpt_info(struct ubifs_info *c)      { return; }
+static inline void ubifs_dump_leb(const struct ubifs_info *c,
+				  int lnum)                       { return; }
 static inline void
-dbg_dump_sleb(const struct ubifs_info *c,
-	      const struct ubifs_scan_leb *sleb, int offs)        { return; }
+ubifs_dump_sleb(const struct ubifs_info *c,
+		const struct ubifs_scan_leb *sleb, int offs)      { return; }
 static inline void
-dbg_dump_znode(const struct ubifs_info *c,
-	       const struct ubifs_znode *znode)                   { return; }
-static inline void dbg_dump_heap(struct ubifs_info *c,
-				 struct ubifs_lpt_heap *heap,
-				 int cat)                         { return; }
-static inline void dbg_dump_pnode(struct ubifs_info *c,
-				  struct ubifs_pnode *pnode,
-				  struct ubifs_nnode *parent,
-				  int iip)                        { return; }
-static inline void dbg_dump_tnc(struct ubifs_info *c)             { return; }
-static inline void dbg_dump_index(struct ubifs_info *c)           { return; }
-static inline void dbg_dump_lpt_lebs(const struct ubifs_info *c)  { return; }
+ubifs_dump_znode(const struct ubifs_info *c,
+		 const struct ubifs_znode *znode)                 { return; }
+static inline void ubifs_dump_heap(struct ubifs_info *c,
+				   struct ubifs_lpt_heap *heap,
+				   int cat)                       { return; }
+static inline void ubifs_dump_pnode(struct ubifs_info *c,
+				    struct ubifs_pnode *pnode,
+				    struct ubifs_nnode *parent,
+				    int iip)                      { return; }
+static inline void ubifs_dump_tnc(struct ubifs_info *c)           { return; }
+static inline void ubifs_dump_index(struct ubifs_info *c)         { return; }
+static inline void ubifs_dump_lpt_lebs(const struct ubifs_info *c){ return; }
 
 static inline int dbg_walk_index(struct ubifs_info *c,
 				 dbg_leaf_callback leaf_cb,
diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 0fe640c..35389ca 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -97,7 +97,7 @@ static int read_block(struct inode *inode, void *addr, unsigned int block,
 dump:
 	ubifs_err("bad data node (block %u, inode %lu)",
 		  block, inode->i_ino);
-	dbg_dump_node(c, dn);
+	ubifs_dump_node(c, dn);
 	return -EINVAL;
 }
 
diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
index 16d4065..21f0835 100644
--- a/fs/ubifs/io.c
+++ b/fs/ubifs/io.c
@@ -294,7 +294,7 @@ out_len:
 out:
 	if (!quiet) {
 		ubifs_err("bad node at LEB %d:%d", lnum, offs);
-		dbg_dump_node(c, buf);
+		ubifs_dump_node(c, buf);
 		dump_stack();
 	}
 	return err;
@@ -841,9 +841,9 @@ exit:
 out:
 	ubifs_err("cannot write %d bytes to LEB %d:%d, error %d",
 		  len, wbuf->lnum, wbuf->offs, err);
-	dbg_dump_node(c, buf);
+	ubifs_dump_node(c, buf);
 	dump_stack();
-	dbg_dump_leb(c, wbuf->lnum);
+	ubifs_dump_leb(c, wbuf->lnum);
 	return err;
 }
 
@@ -881,7 +881,7 @@ int ubifs_write_node(struct ubifs_info *c, void *buf, int len, int lnum,
 	ubifs_prepare_node(c, buf, len, 1);
 	err = ubifs_leb_write(c, lnum, buf, offs, buf_len, dtype);
 	if (err)
-		dbg_dump_node(c, buf);
+		ubifs_dump_node(c, buf);
 
 	return err;
 }
@@ -960,7 +960,7 @@ int ubifs_read_node_wbuf(struct ubifs_wbuf *wbuf, void *buf, int type, int len,
 
 out:
 	ubifs_err("bad node at LEB %d:%d", lnum, offs);
-	dbg_dump_node(c, buf);
+	ubifs_dump_node(c, buf);
 	dump_stack();
 	return -EINVAL;
 }
@@ -1017,7 +1017,7 @@ int ubifs_read_node(const struct ubifs_info *c, void *buf, int type, int len,
 out:
 	ubifs_err("bad node at LEB %d:%d, LEB mapping status %d", lnum, offs,
 		  ubi_is_mapped(c->ubi, lnum));
-	dbg_dump_node(c, buf);
+	ubifs_dump_node(c, buf);
 	dump_stack();
 	return -EINVAL;
 }
diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index bad8b5f..61cd853 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -386,8 +386,8 @@ out:
 		/* This are some budgeting problems, print useful information */
 		down_write(&c->commit_sem);
 		dump_stack();
-		dbg_dump_budg(c, &c->bi);
-		dbg_dump_lprops(c);
+		ubifs_dump_budg(c, &c->bi);
+		ubifs_dump_lprops(c);
 		cmt_retries = dbg_check_lprops(c);
 		up_write(&c->commit_sem);
 	}
diff --git a/fs/ubifs/lprops.c b/fs/ubifs/lprops.c
index 2e4bc27f..0cf7a18 100644
--- a/fs/ubifs/lprops.c
+++ b/fs/ubifs/lprops.c
@@ -1002,7 +1002,7 @@ out:
 	if (err) {
 		dbg_msg("failed cat %d hpos %d err %d", cat, i, err);
 		dump_stack();
-		dbg_dump_heap(c, heap, cat);
+		ubifs_dump_heap(c, heap, cat);
 	}
 }
 
@@ -1109,8 +1109,8 @@ static int scan_check_cb(struct ubifs_info *c,
 	if (IS_ERR(sleb)) {
 		ret = PTR_ERR(sleb);
 		if (ret == -EUCLEAN) {
-			dbg_dump_lprops(c);
-			dbg_dump_budg(c, &c->bi);
+			ubifs_dump_lprops(c);
+			ubifs_dump_budg(c, &c->bi);
 		}
 		goto out;
 	}
@@ -1237,7 +1237,7 @@ out_print:
 	ubifs_err("bad accounting of LEB %d: free %d, dirty %d flags %#x, "
 		  "should be free %d, dirty %d",
 		  lnum, lp->free, lp->dirty, lp->flags, free, dirty);
-	dbg_dump_leb(c, lnum);
+	ubifs_dump_leb(c, lnum);
 out_destroy:
 	ubifs_scan_destroy(sleb);
 	ret = -EINVAL;
diff --git a/fs/ubifs/lpt.c b/fs/ubifs/lpt.c
index 4b62998..b6db389 100644
--- a/fs/ubifs/lpt.c
+++ b/fs/ubifs/lpt.c
@@ -1312,7 +1312,7 @@ static int read_pnode(struct ubifs_info *c, struct ubifs_nnode *parent, int iip)
 
 out:
 	ubifs_err("error %d reading pnode at %d:%d", err, lnum, offs);
-	dbg_dump_pnode(c, pnode, parent, iip);
+	ubifs_dump_pnode(c, pnode, parent, iip);
 	dump_stack();
 	dbg_msg("calc num: %d", calc_pnode_num_from_parent(c, parent, iip));
 	kfree(pnode);
diff --git a/fs/ubifs/lpt_commit.c b/fs/ubifs/lpt_commit.c
index cddd6bd..8294d5a 100644
--- a/fs/ubifs/lpt_commit.c
+++ b/fs/ubifs/lpt_commit.c
@@ -327,8 +327,8 @@ no_space:
 	ubifs_err("LPT out of space");
 	dbg_err("LPT out of space at LEB %d:%d needing %d, done_ltab %d, "
 		"done_lsave %d", lnum, offs, len, done_ltab, done_lsave);
-	dbg_dump_lpt_info(c);
-	dbg_dump_lpt_lebs(c);
+	ubifs_dump_lpt_info(c);
+	ubifs_dump_lpt_lebs(c);
 	dump_stack();
 	return err;
 }
@@ -555,8 +555,8 @@ no_space:
 	ubifs_err("LPT out of space mismatch");
 	dbg_err("LPT out of space mismatch at LEB %d:%d needing %d, done_ltab "
 		"%d, done_lsave %d", lnum, offs, len, done_ltab, done_lsave);
-	dbg_dump_lpt_info(c);
-	dbg_dump_lpt_lebs(c);
+	ubifs_dump_lpt_info(c);
+	ubifs_dump_lpt_lebs(c);
 	dump_stack();
 	return err;
 }
@@ -1769,8 +1769,8 @@ int dbg_chk_lpt_free_spc(struct ubifs_info *c)
 	if (free < c->lpt_sz) {
 		dbg_err("LPT space error: free %lld lpt_sz %lld",
 			free, c->lpt_sz);
-		dbg_dump_lpt_info(c);
-		dbg_dump_lpt_lebs(c);
+		ubifs_dump_lpt_info(c);
+		ubifs_dump_lpt_lebs(c);
 		dump_stack();
 		return -EINVAL;
 	}
@@ -1860,8 +1860,8 @@ int dbg_chk_lpt_sz(struct ubifs_info *c, int action, int len)
 			err = -EINVAL;
 		}
 		if (err) {
-			dbg_dump_lpt_info(c);
-			dbg_dump_lpt_lebs(c);
+			ubifs_dump_lpt_info(c);
+			ubifs_dump_lpt_lebs(c);
 			dump_stack();
 		}
 		d->chk_lpt_sz2 = d->chk_lpt_sz;
@@ -1880,7 +1880,7 @@ int dbg_chk_lpt_sz(struct ubifs_info *c, int action, int len)
 }
 
 /**
- * dbg_dump_lpt_leb - dump an LPT LEB.
+ * ubifs_dump_lpt_leb - dump an LPT LEB.
  * @c: UBIFS file-system description object
  * @lnum: LEB number to dump
  *
@@ -1986,13 +1986,13 @@ out:
 }
 
 /**
- * dbg_dump_lpt_lebs - dump LPT lebs.
+ * ubifs_dump_lpt_lebs - dump LPT lebs.
  * @c: UBIFS file-system description object
  *
  * This function dumps all LPT LEBs. The caller has to make sure the LPT is
  * locked.
  */
-void dbg_dump_lpt_lebs(const struct ubifs_info *c)
+void ubifs_dump_lpt_lebs(const struct ubifs_info *c)
 {
 	int i;
 
diff --git a/fs/ubifs/master.c b/fs/ubifs/master.c
index 278c238..9fc2829 100644
--- a/fs/ubifs/master.c
+++ b/fs/ubifs/master.c
@@ -241,7 +241,7 @@ static int validate_master(const struct ubifs_info *c)
 
 out:
 	ubifs_err("bad master node at offset %d error %d", c->mst_offs, err);
-	dbg_dump_node(c, c->mst_node);
+	ubifs_dump_node(c, c->mst_node);
 	return -EINVAL;
 }
 
@@ -317,7 +317,7 @@ int ubifs_read_master(struct ubifs_info *c)
 		if (c->leb_cnt < old_leb_cnt ||
 		    c->leb_cnt < UBIFS_MIN_LEB_CNT) {
 			ubifs_err("bad leb_cnt on master node");
-			dbg_dump_node(c, c->mst_node);
+			ubifs_dump_node(c, c->mst_node);
 			return -EINVAL;
 		}
 
diff --git a/fs/ubifs/orphan.c b/fs/ubifs/orphan.c
index be18de8..48ac721 100644
--- a/fs/ubifs/orphan.c
+++ b/fs/ubifs/orphan.c
@@ -569,7 +569,7 @@ static int do_kill_orphans(struct ubifs_info *c, struct ubifs_scan_leb *sleb,
 		if (snod->type != UBIFS_ORPH_NODE) {
 			ubifs_err("invalid node type %d in orphan area at "
 				  "%d:%d", snod->type, sleb->lnum, snod->offs);
-			dbg_dump_node(c, snod->node);
+			ubifs_dump_node(c, snod->node);
 			return -EINVAL;
 		}
 
@@ -597,7 +597,7 @@ static int do_kill_orphans(struct ubifs_info *c, struct ubifs_scan_leb *sleb,
 				ubifs_err("out of order commit number %llu in "
 					  "orphan node at %d:%d",
 					  cmt_no, sleb->lnum, snod->offs);
-				dbg_dump_node(c, snod->node);
+				ubifs_dump_node(c, snod->node);
 				return -EINVAL;
 			}
 			dbg_rcvry("out of date LEB %d", sleb->lnum);
diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
index 2a935b3..bbeab61 100644
--- a/fs/ubifs/recovery.c
+++ b/fs/ubifs/recovery.c
@@ -363,11 +363,11 @@ out_free:
 	ubifs_err("failed to recover master node");
 	if (mst1) {
 		dbg_err("dumping first master node");
-		dbg_dump_node(c, mst1);
+		ubifs_dump_node(c, mst1);
 	}
 	if (mst2) {
 		dbg_err("dumping second master node");
-		dbg_dump_node(c, mst2);
+		ubifs_dump_node(c, mst2);
 	}
 	vfree(buf2);
 	vfree(buf1);
@@ -1139,8 +1139,8 @@ static int grab_empty_leb(struct ubifs_info *c)
 	lnum = ubifs_find_free_leb_for_idx(c);
 	if (lnum < 0) {
 		dbg_err("could not find an empty LEB");
-		dbg_dump_lprops(c);
-		dbg_dump_budg(c, &c->bi);
+		ubifs_dump_lprops(c);
+		ubifs_dump_budg(c, &c->bi);
 		return lnum;
 	}
 
diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index b007637..6ce2596 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -686,7 +686,7 @@ out:
 
 out_dump:
 	ubifs_err("bad node is at LEB %d:%d", lnum, snod->offs);
-	dbg_dump_node(c, snod->node);
+	ubifs_dump_node(c, snod->node);
 	ubifs_scan_destroy(sleb);
 	return -EINVAL;
 }
@@ -958,7 +958,7 @@ out:
 out_dump:
 	ubifs_err("log error detected while replaying the log at LEB %d:%d",
 		  lnum, offs + snod->offs);
-	dbg_dump_node(c, snod->node);
+	ubifs_dump_node(c, snod->node);
 	ubifs_scan_destroy(sleb);
 	return -EINVAL;
 }
diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index 771f7fb..c51f6a4 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -475,7 +475,7 @@ static int validate_sb(struct ubifs_info *c, struct ubifs_sb_node *sup)
 
 failed:
 	ubifs_err("bad superblock, error %d", err);
-	dbg_dump_node(c, sup);
+	ubifs_dump_node(c, sup);
 	return -EINVAL;
 }
 
diff --git a/fs/ubifs/scan.c b/fs/ubifs/scan.c
index 37383e8..ec82a68 100644
--- a/fs/ubifs/scan.c
+++ b/fs/ubifs/scan.c
@@ -101,7 +101,7 @@ int ubifs_scan_a_node(const struct ubifs_info *c, void *buf, int len, int lnum,
 			if (!quiet) {
 				ubifs_err("bad pad node at LEB %d:%d",
 					  lnum, offs);
-				dbg_dump_node(c, pad);
+				ubifs_dump_node(c, pad);
 			}
 			return SCANNED_A_BAD_PAD_NODE;
 		}
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 76e4e05..147b7ac 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -246,8 +246,8 @@ struct inode *ubifs_iget(struct super_block *sb, unsigned long inum)
 
 out_invalid:
 	ubifs_err("inode %lu validation failed, error %d", inode->i_ino, err);
-	dbg_dump_node(c, ino);
-	dbg_dump_inode(c, inode);
+	ubifs_dump_node(c, ino);
+	ubifs_dump_inode(c, inode);
 	err = -EINVAL;
 out_ino:
 	kfree(ino);
@@ -1147,8 +1147,8 @@ static int check_free_space(struct ubifs_info *c)
 	ubifs_assert(c->dark_wm > 0);
 	if (c->lst.total_free + c->lst.total_dirty < c->dark_wm) {
 		ubifs_err("insufficient free space to mount in R/W mode");
-		dbg_dump_budg(c, &c->bi);
-		dbg_dump_lprops(c);
+		ubifs_dump_budg(c, &c->bi);
+		ubifs_dump_lprops(c);
 		return -ENOSPC;
 	}
 	return 0;
diff --git a/fs/ubifs/tnc.c b/fs/ubifs/tnc.c
index 2e0bc4e..12c25d9 100644
--- a/fs/ubifs/tnc.c
+++ b/fs/ubifs/tnc.c
@@ -340,7 +340,7 @@ static int lnc_add(struct ubifs_info *c, struct ubifs_zbranch *zbr,
 	err = ubifs_validate_entry(c, dent);
 	if (err) {
 		dump_stack();
-		dbg_dump_node(c, dent);
+		ubifs_dump_node(c, dent);
 		return err;
 	}
 
@@ -373,7 +373,7 @@ static int lnc_add_directly(struct ubifs_info *c, struct ubifs_zbranch *zbr,
 	err = ubifs_validate_entry(c, node);
 	if (err) {
 		dump_stack();
-		dbg_dump_node(c, node);
+		ubifs_dump_node(c, node);
 		return err;
 	}
 
@@ -1733,7 +1733,7 @@ out_err:
 	err = -EINVAL;
 out:
 	ubifs_err("bad node at LEB %d:%d", zbr->lnum, zbr->offs);
-	dbg_dump_node(c, buf);
+	ubifs_dump_node(c, buf);
 	dump_stack();
 	return err;
 }
@@ -2403,7 +2403,7 @@ static int tnc_delete(struct ubifs_info *c, struct ubifs_znode *znode, int n)
 
 	err = ubifs_add_dirt(c, zbr->lnum, zbr->len);
 	if (err) {
-		dbg_dump_znode(c, znode);
+		ubifs_dump_znode(c, znode);
 		return err;
 	}
 
@@ -2649,7 +2649,7 @@ int ubifs_tnc_remove_range(struct ubifs_info *c, union ubifs_key *from_key,
 			err = ubifs_add_dirt(c, znode->zbranch[i].lnum,
 					     znode->zbranch[i].len);
 			if (err) {
-				dbg_dump_znode(c, znode);
+				ubifs_dump_znode(c, znode);
 				goto out_unlock;
 			}
 			dbg_tnck(key, "removing key ");
@@ -3335,7 +3335,7 @@ out_dump:
 		  (unsigned long)inode->i_ino, size,
 		  ((loff_t)block) << UBIFS_BLOCK_SHIFT);
 	mutex_unlock(&c->tnc_mutex);
-	dbg_dump_inode(c, inode);
+	ubifs_dump_inode(c, inode);
 	dump_stack();
 	return -EINVAL;
 
diff --git a/fs/ubifs/tnc_commit.c b/fs/ubifs/tnc_commit.c
index 4c15f07..e8cf891 100644
--- a/fs/ubifs/tnc_commit.c
+++ b/fs/ubifs/tnc_commit.c
@@ -54,9 +54,9 @@ static int make_idx_node(struct ubifs_info *c, struct ubifs_idx_node *idx,
 		br->len = cpu_to_le32(zbr->len);
 		if (!zbr->lnum || !zbr->len) {
 			ubifs_err("bad ref in znode");
-			dbg_dump_znode(c, znode);
+			ubifs_dump_znode(c, znode);
 			if (zbr->znode)
-				dbg_dump_znode(c, zbr->znode);
+				ubifs_dump_znode(c, zbr->znode);
 		}
 	}
 	ubifs_prepare_node(c, idx, len, 0);
@@ -388,8 +388,8 @@ static int layout_in_gaps(struct ubifs_info *c, int cnt)
 				 * option which forces in-the-gaps is enabled.
 				 */
 				ubifs_warn("out of space");
-				dbg_dump_budg(c, &c->bi);
-				dbg_dump_lprops(c);
+				ubifs_dump_budg(c, &c->bi);
+				ubifs_dump_lprops(c);
 			}
 			/* Try to commit anyway */
 			err = 0;
@@ -864,9 +864,9 @@ static int write_index(struct ubifs_info *c)
 			br->len = cpu_to_le32(zbr->len);
 			if (!zbr->lnum || !zbr->len) {
 				ubifs_err("bad ref in znode");
-				dbg_dump_znode(c, znode);
+				ubifs_dump_znode(c, znode);
 				if (zbr->znode)
-					dbg_dump_znode(c, zbr->znode);
+					ubifs_dump_znode(c, zbr->znode);
 			}
 		}
 		len = ubifs_idx_node_sz(c, znode->child_cnt);
diff --git a/fs/ubifs/tnc_misc.c b/fs/ubifs/tnc_misc.c
index dc28fe6..15212d6 100644
--- a/fs/ubifs/tnc_misc.c
+++ b/fs/ubifs/tnc_misc.c
@@ -387,7 +387,7 @@ static int read_znode(struct ubifs_info *c, int lnum, int offs, int len,
 
 out_dump:
 	ubifs_err("bad indexing node at LEB %d:%d, error %d", lnum, offs, err);
-	dbg_dump_node(c, idx);
+	ubifs_dump_node(c, idx);
 	kfree(idx);
 	return -EINVAL;
 }
@@ -486,7 +486,7 @@ int ubifs_tnc_read_node(struct ubifs_info *c, struct ubifs_zbranch *zbr,
 			  zbr->lnum, zbr->offs);
 		dbg_tnck(key, "looked for key ");
 		dbg_tnck(&key1, "but found node's key ");
-		dbg_dump_node(c, node);
+		ubifs_dump_node(c, node);
 		return -EINVAL;
 	}
 
-- 
1.7.10
