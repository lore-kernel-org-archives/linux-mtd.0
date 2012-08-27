Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T5yWD-0003TL-IM
 for linux-mtd@lists.infradead.org; Mon, 27 Aug 2012 12:34:18 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/3] UBIFS: comply with coding style
Date: Mon, 27 Aug 2012 15:34:19 +0300
Message-Id: <1346070860-17573-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1346070860-17573-1-git-send-email-dedekind1@gmail.com>
References: <1346070860-17573-1-git-send-email-dedekind1@gmail.com>
Cc: Richard Genoud <richard.genoud@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Join all the split printk lines in order to stop checkpatch complaining.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 fs/ubifs/budget.c     |    5 +-
 fs/ubifs/compress.c   |    7 +--
 fs/ubifs/debug.c      |  157 ++++++++++++++++++++-----------------------------
 fs/ubifs/dir.c        |    4 +-
 fs/ubifs/file.c       |    4 +-
 fs/ubifs/gc.c         |    6 +-
 fs/ubifs/log.c        |   14 ++---
 fs/ubifs/lprops.c     |   58 +++++++++---------
 fs/ubifs/lpt.c        |    3 +-
 fs/ubifs/lpt_commit.c |   14 ++---
 fs/ubifs/orphan.c     |    7 +--
 fs/ubifs/recovery.c   |   11 ++--
 fs/ubifs/replay.c     |   16 ++---
 fs/ubifs/sb.c         |   19 +++---
 fs/ubifs/scan.c       |    7 ++-
 fs/ubifs/super.c      |   35 +++++------
 16 files changed, 161 insertions(+), 206 deletions(-)

diff --git a/fs/ubifs/budget.c b/fs/ubifs/budget.c
index bc4f94b..ea9c814 100644
--- a/fs/ubifs/budget.c
+++ b/fs/ubifs/budget.c
@@ -342,9 +342,8 @@ static int do_budget_space(struct ubifs_info *c)
 	lebs = c->lst.empty_lebs + c->freeable_cnt + c->idx_gc_cnt -
 	       c->lst.taken_empty_lebs;
 	if (unlikely(rsvd_idx_lebs > lebs)) {
-		dbg_budg("out of indexing space: min_idx_lebs %d (old %d), "
-			 "rsvd_idx_lebs %d", min_idx_lebs, c->bi.min_idx_lebs,
-			 rsvd_idx_lebs);
+		dbg_budg("out of indexing space: min_idx_lebs %d (old %d), rsvd_idx_lebs %d",
+			 min_idx_lebs, c->bi.min_idx_lebs, rsvd_idx_lebs);
 		return -ENOSPC;
 	}
 
diff --git a/fs/ubifs/compress.c b/fs/ubifs/compress.c
index 11e4132..2bfa095 100644
--- a/fs/ubifs/compress.c
+++ b/fs/ubifs/compress.c
@@ -112,8 +112,7 @@ void ubifs_compress(const void *in_buf, int in_len, void *out_buf, int *out_len,
 	if (compr->comp_mutex)
 		mutex_unlock(compr->comp_mutex);
 	if (unlikely(err)) {
-		ubifs_warn("cannot compress %d bytes, compressor %s, "
-			   "error %d, leave data uncompressed",
+		ubifs_warn("cannot compress %d bytes, compressor %s, error %d, leave data uncompressed",
 			   in_len, compr->name, err);
 		 goto no_compr;
 	}
@@ -176,8 +175,8 @@ int ubifs_decompress(const void *in_buf, int in_len, void *out_buf,
 	if (compr->decomp_mutex)
 		mutex_unlock(compr->decomp_mutex);
 	if (err)
-		ubifs_err("cannot decompress %d bytes, compressor %s, "
-			  "error %d", in_len, compr->name, err);
+		ubifs_err("cannot decompress %d bytes, compressor %s, error %d",
+			  in_len, compr->name, err);
 
 	return err;
 }
diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 7563e64..1e41f2c 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -509,8 +509,7 @@ void ubifs_dump_node(const struct ubifs_info *c, const void *node)
 		printk(KERN_ERR "\tname           ");
 
 		if (nlen > UBIFS_MAX_NLEN)
-			printk(KERN_ERR "(bad name length, not printing, "
-					  "bad or corrupted node)");
+			printk(KERN_ERR "(bad name length, not printing, bad or corrupted node)");
 		else {
 			for (i = 0; i < nlen && dent->name[i]; i++)
 				printk(KERN_CONT "%c", dent->name[i]);
@@ -618,14 +617,12 @@ void ubifs_dump_budget_req(const struct ubifs_budget_req *req)
 void ubifs_dump_lstats(const struct ubifs_lp_stats *lst)
 {
 	spin_lock(&dbg_lock);
-	printk(KERN_ERR "(pid %d) Lprops statistics: empty_lebs %d, "
-	       "idx_lebs  %d\n", current->pid, lst->empty_lebs, lst->idx_lebs);
-	printk(KERN_ERR "\ttaken_empty_lebs %d, total_free %lld, "
-	       "total_dirty %lld\n", lst->taken_empty_lebs, lst->total_free,
-	       lst->total_dirty);
-	printk(KERN_ERR "\ttotal_used %lld, total_dark %lld, "
-	       "total_dead %lld\n", lst->total_used, lst->total_dark,
-	       lst->total_dead);
+	printk(KERN_ERR "(pid %d) Lprops statistics: empty_lebs %d, idx_lebs  %d\n",
+	       current->pid, lst->empty_lebs, lst->idx_lebs);
+	printk(KERN_ERR "\ttaken_empty_lebs %d, total_free %lld, total_dirty %lld\n",
+	       lst->taken_empty_lebs, lst->total_free, lst->total_dirty);
+	printk(KERN_ERR "\ttotal_used %lld, total_dark %lld, total_dead %lld\n",
+	       lst->total_used, lst->total_dark, lst->total_dead);
 	spin_unlock(&dbg_lock);
 }
 
@@ -639,16 +636,13 @@ void ubifs_dump_budg(struct ubifs_info *c, const struct ubifs_budg_info *bi)
 
 	spin_lock(&c->space_lock);
 	spin_lock(&dbg_lock);
-	printk(KERN_ERR "(pid %d) Budgeting info: data budget sum %lld, "
-	       "total budget sum %lld\n", current->pid,
-	       bi->data_growth + bi->dd_growth,
+	printk(KERN_ERR "(pid %d) Budgeting info: data budget sum %lld, total budget sum %lld\n",
+	       current->pid, bi->data_growth + bi->dd_growth,
 	       bi->data_growth + bi->dd_growth + bi->idx_growth);
-	printk(KERN_ERR "\tbudg_data_growth %lld, budg_dd_growth %lld, "
-	       "budg_idx_growth %lld\n", bi->data_growth, bi->dd_growth,
-	       bi->idx_growth);
-	printk(KERN_ERR "\tmin_idx_lebs %d, old_idx_sz %llu, "
-	       "uncommitted_idx %lld\n", bi->min_idx_lebs, bi->old_idx_sz,
-	       bi->uncommitted_idx);
+	printk(KERN_ERR "\tbudg_data_growth %lld, budg_dd_growth %lld, budg_idx_growth %lld\n",
+	       bi->data_growth, bi->dd_growth, bi->idx_growth);
+	printk(KERN_ERR "\tmin_idx_lebs %d, old_idx_sz %llu, uncommitted_idx %lld\n",
+	       bi->min_idx_lebs, bi->old_idx_sz, bi->uncommitted_idx);
 	printk(KERN_ERR "\tpage_budget %d, inode_budget %d, dent_budget %d\n",
 	       bi->page_budget, bi->inode_budget, bi->dent_budget);
 	printk(KERN_ERR "\tnospace %u, nospace_rp %u\n",
@@ -666,8 +660,8 @@ void ubifs_dump_budg(struct ubifs_info *c, const struct ubifs_budg_info *bi)
 
 	printk(KERN_ERR "\tfreeable_cnt %d, calc_idx_sz %lld, idx_gc_cnt %d\n",
 	       c->freeable_cnt, c->calc_idx_sz, c->idx_gc_cnt);
-	printk(KERN_ERR "\tdirty_pg_cnt %ld, dirty_zn_cnt %ld, "
-	       "clean_zn_cnt %ld\n", atomic_long_read(&c->dirty_pg_cnt),
+	printk(KERN_ERR "\tdirty_pg_cnt %ld, dirty_zn_cnt %ld, clean_zn_cnt %ld\n",
+	       atomic_long_read(&c->dirty_pg_cnt),
 	       atomic_long_read(&c->dirty_zn_cnt),
 	       atomic_long_read(&c->clean_zn_cnt));
 	printk(KERN_ERR "\tgc_lnum %d, ihead_lnum %d\n",
@@ -715,15 +709,13 @@ void ubifs_dump_lprop(const struct ubifs_info *c, const struct ubifs_lprops *lp)
 		dark = ubifs_calc_dark(c, spc);
 
 	if (lp->flags & LPROPS_INDEX)
-		printk(KERN_ERR "LEB %-7d free %-8d dirty %-8d used %-8d "
-		       "free + dirty %-8d flags %#x (", lp->lnum, lp->free,
-		       lp->dirty, c->leb_size - spc, spc, lp->flags);
+		printk(KERN_ERR "LEB %-7d free %-8d dirty %-8d used %-8d free + dirty %-8d flags %#x (",
+		       lp->lnum, lp->free, lp->dirty, c->leb_size - spc, spc,
+		       lp->flags);
 	else
-		printk(KERN_ERR "LEB %-7d free %-8d dirty %-8d used %-8d "
-		       "free + dirty %-8d dark %-4d dead %-4d nodes fit %-3d "
-		       "flags %#-4x (", lp->lnum, lp->free, lp->dirty,
-		       c->leb_size - spc, spc, dark, dead,
-		       (int)(spc / UBIFS_MAX_NODE_SZ), lp->flags);
+		printk(KERN_ERR "LEB %-7d free %-8d dirty %-8d used %-8d free + dirty %-8d dark %-4d dead %-4d nodes fit %-3d flags %#-4x (",
+		       lp->lnum, lp->free, lp->dirty, c->leb_size - spc, spc,
+		       dark, dead, (int)(spc / UBIFS_MAX_NODE_SZ), lp->flags);
 
 	if (lp->flags & LPROPS_TAKEN) {
 		if (lp->flags & LPROPS_INDEX)
@@ -851,9 +843,9 @@ void ubifs_dump_lpt_info(struct ubifs_info *c)
 		printk(KERN_ERR "\tLPT lsave is at %d:%d\n",
 		       c->lsave_lnum, c->lsave_offs);
 	for (i = 0; i < c->lpt_lebs; i++)
-		printk(KERN_ERR "\tLPT LEB %d free %d dirty %d tgc %d "
-		       "cmt %d\n", i + c->lpt_first, c->ltab[i].free,
-		       c->ltab[i].dirty, c->ltab[i].tgc, c->ltab[i].cmt);
+		printk(KERN_ERR "\tLPT LEB %d free %d dirty %d tgc %d cmt %d\n",
+		       i + c->lpt_first, c->ltab[i].free, c->ltab[i].dirty,
+		       c->ltab[i].tgc, c->ltab[i].cmt);
 	spin_unlock(&dbg_lock);
 }
 
@@ -867,8 +859,8 @@ void ubifs_dump_sleb(const struct ubifs_info *c,
 
 	list_for_each_entry(snod, &sleb->nodes, list) {
 		cond_resched();
-		printk(KERN_ERR "Dumping node at LEB %d:%d len %d\n", sleb->lnum,
-		       snod->offs, snod->len);
+		printk(KERN_ERR "Dumping node at LEB %d:%d len %d\n",
+		       sleb->lnum, snod->offs, snod->len);
 		ubifs_dump_node(c, snod->node);
 	}
 }
@@ -926,10 +918,9 @@ void ubifs_dump_znode(const struct ubifs_info *c,
 	else
 		zbr = &c->zroot;
 
-	printk(KERN_ERR "znode %p, LEB %d:%d len %d parent %p iip %d level %d"
-	       " child_cnt %d flags %lx\n", znode, zbr->lnum, zbr->offs,
-	       zbr->len, znode->parent, znode->iip, znode->level,
-	       znode->child_cnt, znode->flags);
+	printk(KERN_ERR "znode %p, LEB %d:%d len %d parent %p iip %d level %d child_cnt %d flags %lx\n",
+	       znode, zbr->lnum, zbr->offs, zbr->len, znode->parent, znode->iip,
+	       znode->level, znode->child_cnt, znode->flags);
 
 	if (znode->child_cnt <= 0 || znode->child_cnt > c->fanout) {
 		spin_unlock(&dbg_lock);
@@ -940,19 +931,15 @@ void ubifs_dump_znode(const struct ubifs_info *c,
 	for (n = 0; n < znode->child_cnt; n++) {
 		zbr = &znode->zbranch[n];
 		if (znode->level > 0)
-			printk(KERN_ERR "\t%d: znode %p LEB %d:%d len %d key "
-					  "%s\n", n, zbr->znode, zbr->lnum,
-					  zbr->offs, zbr->len,
-					  dbg_snprintf_key(c, &zbr->key,
-							   key_buf,
-							   DBG_KEY_BUF_LEN));
+			printk(KERN_ERR "\t%d: znode %p LEB %d:%d len %d key %s\n",
+			       n, zbr->znode, zbr->lnum, zbr->offs, zbr->len,
+			       dbg_snprintf_key(c, &zbr->key, key_buf,
+						DBG_KEY_BUF_LEN));
 		else
-			printk(KERN_ERR "\t%d: LNC %p LEB %d:%d len %d key "
-					  "%s\n", n, zbr->znode, zbr->lnum,
-					  zbr->offs, zbr->len,
-					  dbg_snprintf_key(c, &zbr->key,
-							   key_buf,
-							   DBG_KEY_BUF_LEN));
+			printk(KERN_ERR "\t%d: LNC %p LEB %d:%d len %d key %s\n",
+			       n, zbr->znode, zbr->lnum, zbr->offs, zbr->len,
+			       dbg_snprintf_key(c, &zbr->key, key_buf,
+						DBG_KEY_BUF_LEN));
 	}
 	spin_unlock(&dbg_lock);
 }
@@ -966,9 +953,9 @@ void ubifs_dump_heap(struct ubifs_info *c, struct ubifs_lpt_heap *heap, int cat)
 	for (i = 0; i < heap->cnt; i++) {
 		struct ubifs_lprops *lprops = heap->arr[i];
 
-		printk(KERN_ERR "\t%d. LEB %d hpos %d free %d dirty %d "
-		       "flags %d\n", i, lprops->lnum, lprops->hpos,
-		       lprops->free, lprops->dirty, lprops->flags);
+		printk(KERN_ERR "\t%d. LEB %d hpos %d free %d dirty %d flags %d\n",
+		       i, lprops->lnum, lprops->hpos, lprops->free,
+		       lprops->dirty, lprops->flags);
 	}
 	printk(KERN_ERR "(pid %d) finish dumping heap\n", current->pid);
 }
@@ -1148,8 +1135,8 @@ int dbg_check_synced_i_size(const struct ubifs_info *c, struct inode *inode)
 	mutex_lock(&ui->ui_mutex);
 	spin_lock(&ui->ui_lock);
 	if (ui->ui_size != ui->synced_i_size && !ui->dirty) {
-		ubifs_err("ui_size is %lld, synced_i_size is %lld, but inode "
-			  "is clean", ui->ui_size, ui->synced_i_size);
+		ubifs_err("ui_size is %lld, synced_i_size is %lld, but inode is clean",
+			  ui->ui_size, ui->synced_i_size);
 		ubifs_err("i_ino %lu, i_mode %#x, i_size %lld", inode->i_ino,
 			  inode->i_mode, i_size_read(inode));
 		dump_stack();
@@ -1211,17 +1198,16 @@ int dbg_check_dir(struct ubifs_info *c, const struct inode *dir)
 	kfree(pdent);
 
 	if (i_size_read(dir) != size) {
-		ubifs_err("directory inode %lu has size %llu, "
-			  "but calculated size is %llu", dir->i_ino,
-			  (unsigned long long)i_size_read(dir),
+		ubifs_err("directory inode %lu has size %llu, but calculated size is %llu",
+			  dir->i_ino, (unsigned long long)i_size_read(dir),
 			  (unsigned long long)size);
 		ubifs_dump_inode(c, dir);
 		dump_stack();
 		return -EINVAL;
 	}
 	if (dir->i_nlink != nlink) {
-		ubifs_err("directory inode %lu has nlink %u, but calculated "
-			  "nlink is %u", dir->i_ino, dir->i_nlink, nlink);
+		ubifs_err("directory inode %lu has nlink %u, but calculated nlink is %u",
+			  dir->i_ino, dir->i_nlink, nlink);
 		ubifs_dump_inode(c, dir);
 		dump_stack();
 		return -EINVAL;
@@ -1680,8 +1666,8 @@ int dbg_walk_index(struct ubifs_info *c, dbg_leaf_callback leaf_cb,
 		if (znode_cb) {
 			err = znode_cb(c, znode, priv);
 			if (err) {
-				ubifs_err("znode checking function returned "
-					  "error %d", err);
+				ubifs_err("znode checking function returned error %d",
+					  err);
 				ubifs_dump_znode(c, znode);
 				goto out_dump;
 			}
@@ -1691,9 +1677,7 @@ int dbg_walk_index(struct ubifs_info *c, dbg_leaf_callback leaf_cb,
 				zbr = &znode->zbranch[idx];
 				err = leaf_cb(c, zbr, priv);
 				if (err) {
-					ubifs_err("leaf checking function "
-						  "returned error %d, for leaf "
-						  "at LEB %d:%d",
+					ubifs_err("leaf checking function returned error %d, for leaf at LEB %d:%d",
 						  err, zbr->lnum, zbr->offs);
 					goto out_dump;
 				}
@@ -1801,8 +1785,8 @@ int dbg_check_idx_size(struct ubifs_info *c, long long idx_size)
 	}
 
 	if (calc != idx_size) {
-		ubifs_err("index size check failed: calculated size is %lld, "
-			  "should be %lld", calc, idx_size);
+		ubifs_err("index size check failed: calculated size is %lld, should be %lld",
+			  calc, idx_size);
 		dump_stack();
 		return -EINVAL;
 	}
@@ -2114,8 +2098,7 @@ static int check_leaf(struct ubifs_info *c, struct ubifs_zbranch *zbr,
 		fscki = read_add_inode(c, priv, inum);
 		if (IS_ERR(fscki)) {
 			err = PTR_ERR(fscki);
-			ubifs_err("error %d while processing data node and "
-				  "trying to find inode node %lu",
+			ubifs_err("error %d while processing data node and trying to find inode node %lu",
 				  err, (unsigned long)inum);
 			goto out_dump;
 		}
@@ -2125,9 +2108,8 @@ static int check_leaf(struct ubifs_info *c, struct ubifs_zbranch *zbr,
 		blk_offs <<= UBIFS_BLOCK_SHIFT;
 		blk_offs += le32_to_cpu(dn->size);
 		if (blk_offs > fscki->size) {
-			ubifs_err("data node at LEB %d:%d is not within inode "
-				  "size %lld", zbr->lnum, zbr->offs,
-				  fscki->size);
+			ubifs_err("data node at LEB %d:%d is not within inode size %lld",
+				  zbr->lnum, zbr->offs, fscki->size);
 			err = -EINVAL;
 			goto out_dump;
 		}
@@ -2148,8 +2130,7 @@ static int check_leaf(struct ubifs_info *c, struct ubifs_zbranch *zbr,
 		fscki = read_add_inode(c, priv, inum);
 		if (IS_ERR(fscki)) {
 			err = PTR_ERR(fscki);
-			ubifs_err("error %d while processing entry node and "
-				  "trying to find inode node %lu",
+			ubifs_err("error %d while processing entry node and trying to find inode node %lu",
 				  err, (unsigned long)inum);
 			goto out_dump;
 		}
@@ -2161,8 +2142,7 @@ static int check_leaf(struct ubifs_info *c, struct ubifs_zbranch *zbr,
 		fscki1 = read_add_inode(c, priv, inum);
 		if (IS_ERR(fscki1)) {
 			err = PTR_ERR(fscki1);
-			ubifs_err("error %d while processing entry node and "
-				  "trying to find parent inode node %lu",
+			ubifs_err("error %d while processing entry node and trying to find parent inode node %lu",
 				  err, (unsigned long)inum);
 			goto out_dump;
 		}
@@ -2252,61 +2232,52 @@ static int check_inodes(struct ubifs_info *c, struct fsck_data *fsckd)
 			 */
 			if (fscki->inum != UBIFS_ROOT_INO &&
 			    fscki->references != 1) {
-				ubifs_err("directory inode %lu has %d "
-					  "direntries which refer it, but "
-					  "should be 1",
+				ubifs_err("directory inode %lu has %d direntries which refer it, but should be 1",
 					  (unsigned long)fscki->inum,
 					  fscki->references);
 				goto out_dump;
 			}
 			if (fscki->inum == UBIFS_ROOT_INO &&
 			    fscki->references != 0) {
-				ubifs_err("root inode %lu has non-zero (%d) "
-					  "direntries which refer it",
+				ubifs_err("root inode %lu has non-zero (%d) direntries which refer it",
 					  (unsigned long)fscki->inum,
 					  fscki->references);
 				goto out_dump;
 			}
 			if (fscki->calc_sz != fscki->size) {
-				ubifs_err("directory inode %lu size is %lld, "
-					  "but calculated size is %lld",
+				ubifs_err("directory inode %lu size is %lld, but calculated size is %lld",
 					  (unsigned long)fscki->inum,
 					  fscki->size, fscki->calc_sz);
 				goto out_dump;
 			}
 			if (fscki->calc_cnt != fscki->nlink) {
-				ubifs_err("directory inode %lu nlink is %d, "
-					  "but calculated nlink is %d",
+				ubifs_err("directory inode %lu nlink is %d, but calculated nlink is %d",
 					  (unsigned long)fscki->inum,
 					  fscki->nlink, fscki->calc_cnt);
 				goto out_dump;
 			}
 		} else {
 			if (fscki->references != fscki->nlink) {
-				ubifs_err("inode %lu nlink is %d, but "
-					  "calculated nlink is %d",
+				ubifs_err("inode %lu nlink is %d, but calculated nlink is %d",
 					  (unsigned long)fscki->inum,
 					  fscki->nlink, fscki->references);
 				goto out_dump;
 			}
 		}
 		if (fscki->xattr_sz != fscki->calc_xsz) {
-			ubifs_err("inode %lu has xattr size %u, but "
-				  "calculated size is %lld",
+			ubifs_err("inode %lu has xattr size %u, but calculated size is %lld",
 				  (unsigned long)fscki->inum, fscki->xattr_sz,
 				  fscki->calc_xsz);
 			goto out_dump;
 		}
 		if (fscki->xattr_cnt != fscki->calc_xcnt) {
-			ubifs_err("inode %lu has %u xattrs, but "
-				  "calculated count is %lld",
+			ubifs_err("inode %lu has %u xattrs, but calculated count is %lld",
 				  (unsigned long)fscki->inum,
 				  fscki->xattr_cnt, fscki->calc_xcnt);
 			goto out_dump;
 		}
 		if (fscki->xattr_nms != fscki->calc_xnms) {
-			ubifs_err("inode %lu has xattr names' size %u, but "
-				  "calculated names' size is %lld",
+			ubifs_err("inode %lu has xattr names' size %u, but calculated names' size is %lld",
 				  (unsigned long)fscki->inum, fscki->xattr_nms,
 				  fscki->calc_xnms);
 			goto out_dump;
diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index c95681c..e271fba 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -980,8 +980,8 @@ static int ubifs_rename(struct inode *old_dir, struct dentry *old_dentry,
 	 * separately.
 	 */
 
-	dbg_gen("dent '%.*s' ino %lu in dir ino %lu to dent '%.*s' in "
-		"dir ino %lu", old_dentry->d_name.len, old_dentry->d_name.name,
+	dbg_gen("dent '%.*s' ino %lu in dir ino %lu to dent '%.*s' in dir ino %lu",
+		old_dentry->d_name.len, old_dentry->d_name.name,
 		old_inode->i_ino, old_dir->i_ino, new_dentry->d_name.len,
 		new_dentry->d_name.name, new_dir->i_ino);
 	ubifs_assert(mutex_is_locked(&old_dir->i_mutex));
diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 7bd6e72..ff48c5a 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1486,8 +1486,8 @@ static int ubifs_vm_page_mkwrite(struct vm_area_struct *vma,
 	err = ubifs_budget_space(c, &req);
 	if (unlikely(err)) {
 		if (err == -ENOSPC)
-			ubifs_warn("out of space for mmapped file "
-				   "(inode number %lu)", inode->i_ino);
+			ubifs_warn("out of space for mmapped file (inode number %lu)",
+				   inode->i_ino);
 		return VM_FAULT_SIGBUS;
 	}
 
diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
index 04dd6f4..76ca53c 100644
--- a/fs/ubifs/gc.c
+++ b/fs/ubifs/gc.c
@@ -714,9 +714,9 @@ int ubifs_garbage_collect(struct ubifs_info *c, int anyway)
 			break;
 		}
 
-		dbg_gc("found LEB %d: free %d, dirty %d, sum %d "
-		       "(min. space %d)", lp.lnum, lp.free, lp.dirty,
-		       lp.free + lp.dirty, min_space);
+		dbg_gc("found LEB %d: free %d, dirty %d, sum %d (min. space %d)",
+		       lp.lnum, lp.free, lp.dirty, lp.free + lp.dirty,
+		       min_space);
 
 		space_before = c->leb_size - wbuf->offs - wbuf->used;
 		if (wbuf->lnum == -1)
diff --git a/fs/ubifs/log.c b/fs/ubifs/log.c
index c80b15d..36bd4ef 100644
--- a/fs/ubifs/log.c
+++ b/fs/ubifs/log.c
@@ -315,17 +315,15 @@ static void remove_buds(struct ubifs_info *c)
 			 * heads (non-closed buds).
 			 */
 			c->cmt_bud_bytes += wbuf->offs - bud->start;
-			dbg_log("preserve %d:%d, jhead %s, bud bytes %d, "
-				"cmt_bud_bytes %lld", bud->lnum, bud->start,
-				dbg_jhead(bud->jhead), wbuf->offs - bud->start,
-				c->cmt_bud_bytes);
+			dbg_log("preserve %d:%d, jhead %s, bud bytes %d, cmt_bud_bytes %lld",
+				bud->lnum, bud->start, dbg_jhead(bud->jhead),
+				wbuf->offs - bud->start, c->cmt_bud_bytes);
 			bud->start = wbuf->offs;
 		} else {
 			c->cmt_bud_bytes += c->leb_size - bud->start;
-			dbg_log("remove %d:%d, jhead %s, bud bytes %d, "
-				"cmt_bud_bytes %lld", bud->lnum, bud->start,
-				dbg_jhead(bud->jhead), c->leb_size - bud->start,
-				c->cmt_bud_bytes);
+			dbg_log("remove %d:%d, jhead %s, bud bytes %d, cmt_bud_bytes %lld",
+				bud->lnum, bud->start, dbg_jhead(bud->jhead),
+				c->leb_size - bud->start, c->cmt_bud_bytes);
 			rb_erase(p1, &c->buds);
 			/*
 			 * If the commit does not finish, the recovery will need
diff --git a/fs/ubifs/lprops.c b/fs/ubifs/lprops.c
index 86eb8e5..132b8e3 100644
--- a/fs/ubifs/lprops.c
+++ b/fs/ubifs/lprops.c
@@ -867,15 +867,15 @@ int dbg_check_cats(struct ubifs_info *c)
 
 	list_for_each_entry(lprops, &c->empty_list, list) {
 		if (lprops->free != c->leb_size) {
-			ubifs_err("non-empty LEB %d on empty list "
-				  "(free %d dirty %d flags %d)", lprops->lnum,
-				  lprops->free, lprops->dirty, lprops->flags);
+			ubifs_err("non-empty LEB %d on empty list (free %d dirty %d flags %d)",
+				  lprops->lnum, lprops->free, lprops->dirty,
+				  lprops->flags);
 			return -EINVAL;
 		}
 		if (lprops->flags & LPROPS_TAKEN) {
-			ubifs_err("taken LEB %d on empty list "
-				  "(free %d dirty %d flags %d)", lprops->lnum,
-				  lprops->free, lprops->dirty, lprops->flags);
+			ubifs_err("taken LEB %d on empty list (free %d dirty %d flags %d)",
+				  lprops->lnum, lprops->free, lprops->dirty,
+				  lprops->flags);
 			return -EINVAL;
 		}
 	}
@@ -883,15 +883,15 @@ int dbg_check_cats(struct ubifs_info *c)
 	i = 0;
 	list_for_each_entry(lprops, &c->freeable_list, list) {
 		if (lprops->free + lprops->dirty != c->leb_size) {
-			ubifs_err("non-freeable LEB %d on freeable list "
-				  "(free %d dirty %d flags %d)", lprops->lnum,
-				  lprops->free, lprops->dirty, lprops->flags);
+			ubifs_err("non-freeable LEB %d on freeable list (free %d dirty %d flags %d)",
+				  lprops->lnum, lprops->free, lprops->dirty,
+				  lprops->flags);
 			return -EINVAL;
 		}
 		if (lprops->flags & LPROPS_TAKEN) {
-			ubifs_err("taken LEB %d on freeable list "
-				  "(free %d dirty %d flags %d)", lprops->lnum,
-				  lprops->free, lprops->dirty, lprops->flags);
+			ubifs_err("taken LEB %d on freeable list (free %d dirty %d flags %d)",
+				  lprops->lnum, lprops->free, lprops->dirty,
+				  lprops->flags);
 			return -EINVAL;
 		}
 		i += 1;
@@ -913,21 +913,21 @@ int dbg_check_cats(struct ubifs_info *c)
 
 	list_for_each_entry(lprops, &c->frdi_idx_list, list) {
 		if (lprops->free + lprops->dirty != c->leb_size) {
-			ubifs_err("non-freeable LEB %d on frdi_idx list "
-				  "(free %d dirty %d flags %d)", lprops->lnum,
-				  lprops->free, lprops->dirty, lprops->flags);
+			ubifs_err("non-freeable LEB %d on frdi_idx list (free %d dirty %d flags %d)",
+				  lprops->lnum, lprops->free, lprops->dirty,
+				  lprops->flags);
 			return -EINVAL;
 		}
 		if (lprops->flags & LPROPS_TAKEN) {
-			ubifs_err("taken LEB %d on frdi_idx list "
-				  "(free %d dirty %d flags %d)", lprops->lnum,
-				  lprops->free, lprops->dirty, lprops->flags);
+			ubifs_err("taken LEB %d on frdi_idx list (free %d dirty %d flags %d)",
+				  lprops->lnum, lprops->free, lprops->dirty,
+				  lprops->flags);
 			return -EINVAL;
 		}
 		if (!(lprops->flags & LPROPS_INDEX)) {
-			ubifs_err("non-index LEB %d on frdi_idx list "
-				  "(free %d dirty %d flags %d)", lprops->lnum,
-				  lprops->free, lprops->dirty, lprops->flags);
+			ubifs_err("non-index LEB %d on frdi_idx list (free %d dirty %d flags %d)",
+				  lprops->lnum, lprops->free, lprops->dirty,
+				  lprops->flags);
 			return -EINVAL;
 		}
 	}
@@ -1153,8 +1153,8 @@ static int scan_check_cb(struct ubifs_info *c,
 
 	if (free > c->leb_size || free < 0 || dirty > c->leb_size ||
 	    dirty < 0) {
-		ubifs_err("bad calculated accounting for LEB %d: "
-			  "free %d, dirty %d", lnum, free, dirty);
+		ubifs_err("bad calculated accounting for LEB %d: free %d, dirty %d",
+			  lnum, free, dirty);
 		goto out_destroy;
 	}
 
@@ -1200,8 +1200,7 @@ static int scan_check_cb(struct ubifs_info *c,
 			/* Free but not unmapped LEB, it's fine */
 			is_idx = 0;
 		else {
-			ubifs_err("indexing node without indexing "
-				  "flag");
+			ubifs_err("indexing node without indexing flag");
 			goto out_print;
 		}
 	}
@@ -1236,8 +1235,7 @@ static int scan_check_cb(struct ubifs_info *c,
 	return LPT_SCAN_CONTINUE;
 
 out_print:
-	ubifs_err("bad accounting of LEB %d: free %d, dirty %d flags %#x, "
-		  "should be free %d, dirty %d",
+	ubifs_err("bad accounting of LEB %d: free %d, dirty %d flags %#x, should be free %d, dirty %d",
 		  lnum, lp->free, lp->dirty, lp->flags, free, dirty);
 	ubifs_dump_leb(c, lnum);
 out_destroy:
@@ -1290,12 +1288,10 @@ int dbg_check_lprops(struct ubifs_info *c)
 	    lst.total_dirty != c->lst.total_dirty ||
 	    lst.total_used != c->lst.total_used) {
 		ubifs_err("bad overall accounting");
-		ubifs_err("calculated: empty_lebs %d, idx_lebs %d, "
-			  "total_free %lld, total_dirty %lld, total_used %lld",
+		ubifs_err("calculated: empty_lebs %d, idx_lebs %d, total_free %lld, total_dirty %lld, total_used %lld",
 			  lst.empty_lebs, lst.idx_lebs, lst.total_free,
 			  lst.total_dirty, lst.total_used);
-		ubifs_err("read from lprops: empty_lebs %d, idx_lebs %d, "
-			  "total_free %lld, total_dirty %lld, total_used %lld",
+		ubifs_err("read from lprops: empty_lebs %d, idx_lebs %d, total_free %lld, total_dirty %lld, total_used %lld",
 			  c->lst.empty_lebs, c->lst.idx_lebs, c->lst.total_free,
 			  c->lst.total_dirty, c->lst.total_used);
 		err = -EINVAL;
diff --git a/fs/ubifs/lpt.c b/fs/ubifs/lpt.c
index 8640920..c3e6bbf 100644
--- a/fs/ubifs/lpt.c
+++ b/fs/ubifs/lpt.c
@@ -2237,8 +2237,7 @@ int dbg_check_lpt_nodes(struct ubifs_info *c, struct ubifs_cnode *cnode,
 			/* cnode is a nnode */
 			num = calc_nnode_num(row, col);
 			if (cnode->num != num) {
-				ubifs_err("nnode num %d expected %d "
-					  "parent num %d iip %d",
+				ubifs_err("nnode num %d expected %d parent num %d iip %d",
 					  cnode->num, num,
 					  (nnode ? nnode->num : 0), cnode->iip);
 				return -EINVAL;
diff --git a/fs/ubifs/lpt_commit.c b/fs/ubifs/lpt_commit.c
index 4fa7073..7408255 100644
--- a/fs/ubifs/lpt_commit.c
+++ b/fs/ubifs/lpt_commit.c
@@ -320,8 +320,8 @@ static int layout_cnodes(struct ubifs_info *c)
 	return 0;
 
 no_space:
-	ubifs_err("LPT out of space at LEB %d:%d needing %d, done_ltab %d, "
-		  "done_lsave %d", lnum, offs, len, done_ltab, done_lsave);
+	ubifs_err("LPT out of space at LEB %d:%d needing %d, done_ltab %d, done_lsave %d",
+		  lnum, offs, len, done_ltab, done_lsave);
 	ubifs_dump_lpt_info(c);
 	ubifs_dump_lpt_lebs(c);
 	dump_stack();
@@ -545,8 +545,8 @@ static int write_cnodes(struct ubifs_info *c)
 	return 0;
 
 no_space:
-	ubifs_err("LPT out of space mismatch at LEB %d:%d needing %d, done_ltab "
-		  "%d, done_lsave %d", lnum, offs, len, done_ltab, done_lsave);
+	ubifs_err("LPT out of space mismatch at LEB %d:%d needing %d, done_ltab %d, done_lsave %d",
+		  lnum, offs, len, done_ltab, done_lsave);
 	ubifs_dump_lpt_info(c);
 	ubifs_dump_lpt_lebs(c);
 	dump_stack();
@@ -1668,14 +1668,12 @@ static int dbg_check_ltab_lnum(struct ubifs_info *c, int lnum)
 			}
 			i = lnum - c->lpt_first;
 			if (len != c->ltab[i].free) {
-				dbg_msg("invalid free space in LEB %d "
-					"(free %d, expected %d)",
+				dbg_msg("invalid free space in LEB %d (free %d, expected %d)",
 					lnum, len, c->ltab[i].free);
 				err = -EINVAL;
 			}
 			if (dirty != c->ltab[i].dirty) {
-				dbg_msg("invalid dirty space in LEB %d "
-					"(dirty %d, expected %d)",
+				dbg_msg("invalid dirty space in LEB %d (dirty %d, expected %d)",
 					lnum, dirty, c->ltab[i].dirty);
 				err = -EINVAL;
 			}
diff --git a/fs/ubifs/orphan.c b/fs/ubifs/orphan.c
index cebf17e..769701c 100644
--- a/fs/ubifs/orphan.c
+++ b/fs/ubifs/orphan.c
@@ -562,8 +562,8 @@ static int do_kill_orphans(struct ubifs_info *c, struct ubifs_scan_leb *sleb,
 
 	list_for_each_entry(snod, &sleb->nodes, list) {
 		if (snod->type != UBIFS_ORPH_NODE) {
-			ubifs_err("invalid node type %d in orphan area at "
-				  "%d:%d", snod->type, sleb->lnum, snod->offs);
+			ubifs_err("invalid node type %d in orphan area at %d:%d",
+				  snod->type, sleb->lnum, snod->offs);
 			ubifs_dump_node(c, snod->node);
 			return -EINVAL;
 		}
@@ -589,8 +589,7 @@ static int do_kill_orphans(struct ubifs_info *c, struct ubifs_scan_leb *sleb,
 			 * number. That makes this orphan node, out of date.
 			 */
 			if (!first) {
-				ubifs_err("out of order commit number %llu in "
-					  "orphan node at %d:%d",
+				ubifs_err("out of order commit number %llu in orphan node at %d:%d",
 					  cmt_no, sleb->lnum, snod->offs);
 				ubifs_dump_node(c, snod->node);
 				return -EINVAL;
diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
index edeec49..065096e 100644
--- a/fs/ubifs/recovery.c
+++ b/fs/ubifs/recovery.c
@@ -609,7 +609,8 @@ static void drop_last_node(struct ubifs_scan_leb *sleb, int *offs)
 		snod = list_entry(sleb->nodes.prev, struct ubifs_scan_node,
 				  list);
 
-		dbg_rcvry("dropping last node at %d:%d", sleb->lnum, snod->offs);
+		dbg_rcvry("dropping last node at %d:%d",
+			  sleb->lnum, snod->offs);
 		*offs = snod->offs;
 		list_del(&snod->list);
 		kfree(snod);
@@ -702,8 +703,8 @@ struct ubifs_scan_leb *ubifs_recover_leb(struct ubifs_info *c, int lnum,
 			 * See header comment for this file for more
 			 * explanations about the reasons we have this check.
 			 */
-			ubifs_err("corrupt empty space LEB %d:%d, corruption "
-				  "starts at %d", lnum, offs, corruption);
+			ubifs_err("corrupt empty space LEB %d:%d, corruption starts at %d",
+				  lnum, offs, corruption);
 			/* Make sure we dump interesting non-0xFF data */
 			offs += corruption;
 			buf += corruption;
@@ -899,8 +900,8 @@ struct ubifs_scan_leb *ubifs_recover_log_leb(struct ubifs_info *c, int lnum,
 				}
 			}
 			if (snod->sqnum > cs_sqnum) {
-				ubifs_err("unrecoverable log corruption "
-					  "in LEB %d", lnum);
+				ubifs_err("unrecoverable log corruption in LEB %d",
+					  lnum);
 				ubifs_scan_destroy(sleb);
 				return ERR_PTR(-EUCLEAN);
 			}
diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index 94d78fc..ede6e58 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -141,9 +141,9 @@ static int set_bud_lprops(struct ubifs_info *c, struct bud_entry *b)
 		 * during the replay.
 		 */
 		if (dirty != 0)
-			dbg_msg("LEB %d lp: %d free %d dirty "
-				"replay: %d free %d dirty", b->bud->lnum,
-				lp->free, lp->dirty, b->free, b->dirty);
+			dbg_msg("LEB %d lp: %d free %d dirty replay: %d free %d dirty",
+				b->bud->lnum, lp->free, lp->dirty, b->free,
+				b->dirty);
 	}
 	lp = ubifs_change_lp(c, lp, b->free, dirty + b->dirty,
 			     lp->flags | LPROPS_TAKEN, 0);
@@ -677,7 +677,8 @@ static int replay_bud(struct ubifs_info *c, struct bud_entry *b)
 
 	b->dirty = sleb->endpt - offs - used;
 	b->free = c->leb_size - sleb->endpt;
-	dbg_mnt("bud LEB %d replied: dirty %d, free %d", lnum, b->dirty, b->free);
+	dbg_mnt("bud LEB %d replied: dirty %d, free %d",
+		lnum, b->dirty, b->free);
 
 out:
 	ubifs_scan_destroy(sleb);
@@ -865,8 +866,7 @@ static int replay_log_leb(struct ubifs_info *c, int lnum, int offs, void *sbuf)
 			goto out_dump;
 		}
 		if (le64_to_cpu(node->cmt_no) != c->cmt_no) {
-			ubifs_err("first CS node at LEB %d:%d has wrong "
-				  "commit number %llu expected %llu",
+			ubifs_err("first CS node at LEB %d:%d has wrong commit number %llu expected %llu",
 				  lnum, offs,
 				  (unsigned long long)le64_to_cpu(node->cmt_no),
 				  c->cmt_no);
@@ -1058,8 +1058,8 @@ int ubifs_replay_journal(struct ubifs_info *c)
 	c->bi.uncommitted_idx *= c->max_idx_node_sz;
 
 	ubifs_assert(c->bud_bytes <= c->max_bud_bytes || c->need_recovery);
-	dbg_mnt("finished, log head LEB %d:%d, max_sqnum %llu, "
-		"highest_inum %lu", c->lhead_lnum, c->lhead_offs, c->max_sqnum,
+	dbg_mnt("finished, log head LEB %d:%d, max_sqnum %llu, highest_inum %lu",
+		c->lhead_lnum, c->lhead_offs, c->max_sqnum,
 		(unsigned long)c->highest_inum);
 out:
 	destroy_replay_list(c);
diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index 15e2fc5..5b7bfa2 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -391,9 +391,8 @@ static int validate_sb(struct ubifs_info *c, struct ubifs_sb_node *sup)
 	min_leb_cnt += c->lpt_lebs + c->orph_lebs + c->jhead_cnt + 6;
 
 	if (c->leb_cnt < min_leb_cnt || c->leb_cnt > c->vi.size) {
-		ubifs_err("bad LEB count: %d in superblock, %d on UBI volume, "
-			  "%d minimum required", c->leb_cnt, c->vi.size,
-			  min_leb_cnt);
+		ubifs_err("bad LEB count: %d in superblock, %d on UBI volume, %d minimum required",
+			  c->leb_cnt, c->vi.size, min_leb_cnt);
 		goto failed;
 	}
 
@@ -411,15 +410,14 @@ static int validate_sb(struct ubifs_info *c, struct ubifs_sb_node *sup)
 
 	max_bytes = (long long)c->leb_size * UBIFS_MIN_BUD_LEBS;
 	if (c->max_bud_bytes < max_bytes) {
-		ubifs_err("too small journal (%lld bytes), must be at least "
-			  "%lld bytes",  c->max_bud_bytes, max_bytes);
+		ubifs_err("too small journal (%lld bytes), must be at least %lld bytes",
+			  c->max_bud_bytes, max_bytes);
 		goto failed;
 	}
 
 	max_bytes = (long long)c->leb_size * c->main_lebs;
 	if (c->max_bud_bytes > max_bytes) {
-		ubifs_err("too large journal size (%lld bytes), only %lld bytes"
-			  "available in the main area",
+		ubifs_err("too large journal size (%lld bytes), only %lld bytes available in the main area",
 			  c->max_bud_bytes, max_bytes);
 		goto failed;
 	}
@@ -549,10 +547,9 @@ int ubifs_read_superblock(struct ubifs_info *c)
 		ubifs_assert(!c->ro_media || c->ro_mount);
 		if (!c->ro_mount ||
 		    c->ro_compat_version > UBIFS_RO_COMPAT_VERSION) {
-			ubifs_err("on-flash format version is w%d/r%d, but "
-				  "software only supports up to version "
-				  "w%d/r%d", c->fmt_version,
-				  c->ro_compat_version, UBIFS_FORMAT_VERSION,
+			ubifs_err("on-flash format version is w%d/r%d, but software only supports up to version w%d/r%d",
+				  c->fmt_version, c->ro_compat_version,
+				  UBIFS_FORMAT_VERSION,
 				  UBIFS_RO_COMPAT_VERSION);
 			if (c->ro_compat_version <= UBIFS_RO_COMPAT_VERSION) {
 				ubifs_msg("only R/O mounting is possible");
diff --git a/fs/ubifs/scan.c b/fs/ubifs/scan.c
index 019ca47..58aa05d 100644
--- a/fs/ubifs/scan.c
+++ b/fs/ubifs/scan.c
@@ -85,7 +85,8 @@ int ubifs_scan_a_node(const struct ubifs_info *c, void *buf, int len, int lnum,
 	if (len < UBIFS_CH_SZ)
 		return SCANNED_GARBAGE;
 
-	dbg_scan("scanning %s at LEB %d:%d", dbg_ntype(ch->node_type), lnum, offs);
+	dbg_scan("scanning %s at LEB %d:%d",
+		 dbg_ntype(ch->node_type), lnum, offs);
 
 	if (ubifs_check_node(c, buf, lnum, offs, quiet, 1))
 		return SCANNED_A_CORRUPT_NODE;
@@ -150,8 +151,8 @@ struct ubifs_scan_leb *ubifs_start_scan(const struct ubifs_info *c, int lnum,
 
 	err = ubifs_leb_read(c, lnum, sbuf + offs, offs, c->leb_size - offs, 0);
 	if (err && err != -EBADMSG) {
-		ubifs_err("cannot read %d bytes from LEB %d:%d,"
-			  " error %d", c->leb_size - offs, lnum, offs, err);
+		ubifs_err("cannot read %d bytes from LEB %d:%d, error %d",
+			  c->leb_size - offs, lnum, offs, err);
 		kfree(sleb);
 		return ERR_PTR(err);
 	}
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index d319289..448bf24 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -89,9 +89,8 @@ static int validate_inode(struct ubifs_info *c, const struct inode *inode)
 		return 5;
 
 	if (!ubifs_compr_present(ui->compr_type)) {
-		ubifs_warn("inode %lu uses '%s' compression, but it was not "
-			   "compiled in", inode->i_ino,
-			   ubifs_compr_name(ui->compr_type));
+		ubifs_warn("inode %lu uses '%s' compression, but it was not compiled in",
+			   inode->i_ino, ubifs_compr_name(ui->compr_type));
 	}
 
 	err = dbg_check_dir(c, inode);
@@ -1061,8 +1060,8 @@ static int ubifs_parse_options(struct ubifs_info *c, char *options,
 
 			flag = parse_standard_option(p);
 			if (!flag) {
-				ubifs_err("unrecognized mount option \"%s\" "
-					  "or missing value", p);
+				ubifs_err("unrecognized mount option \"%s\" or missing value",
+					  p);
 				return -EINVAL;
 			}
 			sb->s_flags |= flag;
@@ -1124,8 +1123,8 @@ again:
 		}
 
 		/* Just disable bulk-read */
-		ubifs_warn("Cannot allocate %d bytes of memory for bulk-read, "
-			   "disabling it", c->max_bu_buf_len);
+		ubifs_warn("cannot allocate %d bytes of memory for bulk-read, disabling it",
+			   c->max_bu_buf_len);
 		c->mount_opts.bulk_read = 1;
 		c->bulk_read = 0;
 		return;
@@ -1416,11 +1415,11 @@ static int mount_ubifs(struct ubifs_info *c)
 	if (c->ro_mount)
 		ubifs_msg("mounted read-only");
 	x = (long long)c->main_lebs * c->leb_size;
-	ubifs_msg("file system size:   %lld bytes (%lld KiB, %lld MiB, %d "
-		  "LEBs)", x, x >> 10, x >> 20, c->main_lebs);
+	ubifs_msg("file system size:   %lld bytes (%lld KiB, %lld MiB, %d LEBs)",
+		  x, x >> 10, x >> 20, c->main_lebs);
 	x = (long long)c->log_lebs * c->leb_size + c->max_bud_bytes;
-	ubifs_msg("journal size:       %lld bytes (%lld KiB, %lld MiB, %d "
-		  "LEBs)", x, x >> 10, x >> 20, c->log_lebs + c->max_bud_cnt);
+	ubifs_msg("journal size:       %lld bytes (%lld KiB, %lld MiB, %d LEBs)",
+		  x, x >> 10, x >> 20, c->log_lebs + c->max_bud_cnt);
 	ubifs_msg("media format:       w%d/r%d (latest is w%d/r%d)",
 		  c->fmt_version, c->ro_compat_version,
 		  UBIFS_FORMAT_VERSION, UBIFS_RO_COMPAT_VERSION);
@@ -1563,10 +1562,9 @@ static int ubifs_remount_rw(struct ubifs_info *c)
 
 	if (c->rw_incompat) {
 		ubifs_err("the file-system is not R/W-compatible");
-		ubifs_msg("on-flash format version is w%d/r%d, but software "
-			  "only supports up to version w%d/r%d", c->fmt_version,
-			  c->ro_compat_version, UBIFS_FORMAT_VERSION,
-			  UBIFS_RO_COMPAT_VERSION);
+		ubifs_msg("on-flash format version is w%d/r%d, but software only supports up to version w%d/r%d",
+			  c->fmt_version, c->ro_compat_version,
+			  UBIFS_FORMAT_VERSION, UBIFS_RO_COMPAT_VERSION);
 		return -EROFS;
 	}
 
@@ -1827,8 +1825,8 @@ static void ubifs_put_super(struct super_block *sb)
 				 * next mount, so we just print a message and
 				 * continue to unmount normally.
 				 */
-				ubifs_err("failed to write master node, "
-					  "error %d", err);
+				ubifs_err("failed to write master node, error %d",
+					  err);
 		} else {
 			for (i = 0; i < c->jhead_cnt; i++)
 				/* Make sure write-buffer timers are canceled */
@@ -2247,8 +2245,7 @@ static int __init ubifs_init(void)
 	 * UBIFS_BLOCK_SIZE. It is assumed that both are powers of 2.
 	 */
 	if (PAGE_CACHE_SIZE < UBIFS_BLOCK_SIZE) {
-		ubifs_err("VFS page cache size is %u bytes, but UBIFS requires"
-			  " at least 4096 bytes",
+		ubifs_err("VFS page cache size is %u bytes, but UBIFS requires at least 4096 bytes",
 			  (unsigned int)PAGE_CACHE_SIZE);
 		return -EINVAL;
 	}
-- 
1.7.10.4
