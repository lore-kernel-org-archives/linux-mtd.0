Received: from smtp4.nedap.com ([213.160.213.85])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fYtMy-0002A6-NI
 for linux-mtd@lists.infradead.org; Fri, 29 Jun 2018 13:23:32 +0000
Date: Fri, 29 Jun 2018 15:22:56 +0200
From: Ryan Meulenkamp <ryan.meulenkamp@nedap.com>
To: linux-mtd@lists.infradead.org
Subject: [RFC PATCH] ubifs: add shrink capability
Message-ID: <20180629132256.4dtvrup4pwvbq4dd@nedap.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ubifs: Add shrink capability

Add new file resize.c which mostly uses functions from gc.c to move
lebs within the newly specified boundaries, after which it updates
the master- and superblock.

Some changes were done to other files in order to accomplish this.

Finally a debug function called ubifs_dump_comp was added to be able
to see the rough composition of the file system as a run-length-
encoded string.

I tested this all on my own system using nandsim and some different
test cases:

- Possible test: Enough size to shrink
- Closs call test: Just enough size to shrink
- Unnecessary test: No used lebs outside the new boundaries
- Impossible test: Not enough space to shrink
- Empty impossible test: Shrink empty filesystem to size < main-first

The tests create a new ubi volume and ubifs, and fill it (if
applicable) using random files. Then the sha256sums are taken of
these. Next it removed some of the middle ones, ensuring that lebs
are used outside of the new boundaries. Finally it performs the 
resize action, and checks if the checksums are still correct for the
files that were not removed.

Signed-off-by: Ryan Meulenkamp <ryan.meulenkamp@nedap.com>
---
 fs/ubifs/Makefile  |   4 +-
 fs/ubifs/debug.c   |  58 ++++++++
 fs/ubifs/debug.h   |   5 +
 fs/ubifs/find.c    |  53 +++++--
 fs/ubifs/gc.c      |  64 ++-------
 fs/ubifs/journal.c |  71 ++++++++++
 fs/ubifs/lprops.c  |  40 +++++-
 fs/ubifs/master.c  |   6 +-
 fs/ubifs/resize.c  | 408 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 fs/ubifs/sb.c      |   6 +-
 fs/ubifs/super.c   |  30 ++++
 fs/ubifs/ubifs.h   |  11 ++
 12 files changed, 683 insertions(+), 73 deletions(-)
 create mode 100644 fs/ubifs/resize.c

diff --git a/fs/ubifs/Makefile b/fs/ubifs/Makefile
index 9758f709c736..1d656abc9d79 100644
--- a/fs/ubifs/Makefile
+++ b/fs/ubifs/Makefile
@@ -4,6 +4,6 @@ obj-$(CONFIG_UBIFS_FS) += ubifs.o
 ubifs-y += shrinker.o journal.o file.o dir.o super.o sb.o io.o
 ubifs-y += tnc.o master.o scan.o replay.o log.o commit.o gc.o orphan.o
 ubifs-y += budget.o find.o tnc_commit.o compress.o lpt.o lprops.o
-ubifs-y += recovery.o ioctl.o lpt_commit.o tnc_misc.o xattr.o debug.o
-ubifs-y += misc.o
+ubifs-y += recovery.o resize.o ioctl.o lpt_commit.o tnc_misc.o xattr.o
+ubifs-y += debug.o misc.o
 ubifs-$(CONFIG_UBIFS_FS_ENCRYPTION) += crypto.o
diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 7cd8a7b95299..e1105c36990c 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -965,6 +965,54 @@ void ubifs_dump_index(struct ubifs_info *c)
 }
 
 /**
+ * ubifs_dump_comp - dump the run-length-encoded composition of the filesystem.
+ * @c: UBIFS file-system description object
+ *
+ * This function prints a string that consists of numbers followed by a letter.
+ * The letter is one of:
+ *		E - Empty
+ *		e - Freeable (free space + dirty space)
+ *		D - Dirty ([free space +] dirty space + used space)
+ *		U - Used
+ *		F - Full
+ */
+void ubifs_dump_comp(struct ubifs_info *c)
+{
+	int ret = 0, lnum, count = 0;
+	char state, last = '?';
+	struct ubifs_lprops lp;
+
+	pr_cont("Composition of UBIFS: ");
+
+	for (lnum = c->main_first; lnum < c->leb_cnt; lnum++) {
+		ret = ubifs_read_one_lp(c, lnum, &lp);
+		if (ret)
+			continue;
+
+		if (lp.free == c->leb_size)
+			state = 'E';
+		else if (lp.free + lp.dirty == c->leb_size)
+			state = 'e';
+		else if (lp.dirty > c->min_io_size)
+			state = 'D';
+		else if (lp.free > 0)
+			state = 'U';
+		else
+			state = 'F';
+
+		if (state == last) {
+			count++;
+		} else {
+			if (last != '?')
+				pr_cont("%d%c", count, last);
+			count = 1;
+			last = state;
+		}
+	}
+	pr_cont("%d%c\n", count, last);
+}
+
+/**
  * dbg_save_space_info - save information about flash space.
  * @c: UBIFS file-system description object
  *
@@ -2770,6 +2818,10 @@ static ssize_t dfs_file_write(struct file *file, const char __user *u,
 		mutex_unlock(&c->tnc_mutex);
 		return count;
 	}
+	if (file->f_path.dentry == d->dfs_dump_comp) {
+		ubifs_dump_comp(c);
+		return count;
+	}
 
 	val = interpret_user_input(u, count);
 	if (val < 0)
@@ -2858,6 +2910,12 @@ int dbg_debugfs_init_fs(struct ubifs_info *c)
 		goto out_remove;
 	d->dfs_dump_tnc = dent;
 
+	fname = "dump_comp";
+	dent = debugfs_create_file(fname, S_IWUSR, d->dfs_dir, c, &dfs_fops);
+	if (IS_ERR_OR_NULL(dent))
+		goto out_remove;
+	d->dfs_dump_comp = dent;
+
 	fname = "chk_general";
 	dent = debugfs_create_file(fname, S_IRUSR | S_IWUSR, d->dfs_dir, c,
 				   &dfs_fops);
diff --git a/fs/ubifs/debug.h b/fs/ubifs/debug.h
index e03d5179769a..d07e46792e5f 100644
--- a/fs/ubifs/debug.h
+++ b/fs/ubifs/debug.h
@@ -73,6 +73,7 @@ typedef int (*dbg_znode_callback)(struct ubifs_info *c,
  * @dfs_dump_lprops: "dump lprops" debugfs knob
  * @dfs_dump_budg: "dump budgeting information" debugfs knob
  * @dfs_dump_tnc: "dump TNC" debugfs knob
+ * @dfs_dump_comp: "dump composition" debugfs knob
  * @dfs_chk_gen: debugfs knob to enable UBIFS general extra checks
  * @dfs_chk_index: debugfs knob to enable UBIFS index extra checks
  * @dfs_chk_orph: debugfs knob to enable UBIFS orphans extra checks
@@ -120,6 +121,7 @@ struct ubifs_debug_info {
 	struct dentry *dfs_dump_lprops;
 	struct dentry *dfs_dump_budg;
 	struct dentry *dfs_dump_tnc;
+	struct dentry *dfs_dump_comp;
 	struct dentry *dfs_chk_gen;
 	struct dentry *dfs_chk_index;
 	struct dentry *dfs_chk_orph;
@@ -208,6 +210,8 @@ struct ubifs_global_debug_info {
 #define dbg_scan(fmt, ...)  ubifs_dbg_msg("scan", fmt, ##__VA_ARGS__)
 /* Additional recovery messages */
 #define dbg_rcvry(fmt, ...) ubifs_dbg_msg("rcvry", fmt, ##__VA_ARGS__)
+/* Additional resize messages */
+#define dbg_resize(fmt, ...)    ubifs_dbg_msg("resize", fmt, ##__VA_ARGS__)
 
 extern struct ubifs_global_debug_info ubifs_dbg;
 
@@ -272,6 +276,7 @@ void ubifs_dump_pnode(struct ubifs_info *c, struct ubifs_pnode *pnode,
 void ubifs_dump_tnc(struct ubifs_info *c);
 void ubifs_dump_index(struct ubifs_info *c);
 void ubifs_dump_lpt_lebs(const struct ubifs_info *c);
+void ubifs_dump_comp(struct ubifs_info *c);
 
 int dbg_walk_index(struct ubifs_info *c, dbg_leaf_callback leaf_cb,
 		   dbg_znode_callback znode_cb, void *priv);
diff --git a/fs/ubifs/find.c b/fs/ubifs/find.c
index 2dcf3d473fec..5be9f1648c02 100644
--- a/fs/ubifs/find.c
+++ b/fs/ubifs/find.c
@@ -371,6 +371,10 @@ static int scan_for_free_cb(struct ubifs_info *c,
 	/* Determine whether to add these LEB properties to the tree */
 	if (!in_tree && valuable(c, lprops))
 		ret |= LPT_SCAN_ADD;
+	/* Exclude LEBs out of a new range */
+	if (c->min_lnum && c->max_lnum)
+		if (lprops->lnum < c->min_lnum || lprops->lnum > c->max_lnum)
+			return ret;
 	/* Exclude index LEBs */
 	if (lprops->flags & LPROPS_INDEX)
 		return ret;
@@ -432,8 +436,16 @@ const struct ubifs_lprops *do_find_free_space(struct ubifs_info *c,
 	heap = &c->lpt_heap[LPROPS_DIRTY - 1];
 	for (i = 0; i < heap->cnt; i++) {
 		lprops = heap->arr[i];
-		if (lprops->free >= min_space)
-			return lprops;
+		if (lprops->free >= min_space) {
+			if (c->min_lnum && c->max_lnum) {
+				if (lprops->lnum >= c->min_lnum
+					&& lprops->lnum <= c->max_lnum) {
+					return lprops;
+				}
+			} else {
+				return lprops;
+			}
+		}
 	}
 	/*
 	 * A LEB may have fallen off of the bottom of the free heap, and ended
@@ -447,8 +459,16 @@ const struct ubifs_lprops *do_find_free_space(struct ubifs_info *c,
 			continue;
 		if (lprops->flags & LPROPS_INDEX)
 			continue;
-		if (lprops->free >= min_space)
-			return lprops;
+		if (lprops->free >= min_space) {
+			if (c->min_lnum && c->max_lnum) {
+				if (lprops->lnum >= c->min_lnum
+					&& lprops->lnum <= c->max_lnum) {
+					return lprops;
+				}
+			} else {
+				return lprops;
+			}
+		}
 	}
 	/* We have looked everywhere in main memory, now scan the flash */
 	if (c->pnodes_have >= c->pnode_cnt)
@@ -457,9 +477,16 @@ const struct ubifs_lprops *do_find_free_space(struct ubifs_info *c,
 	data.min_space = min_space;
 	data.pick_free = pick_free;
 	data.lnum = -1;
-	err = ubifs_lpt_scan_nolock(c, -1, c->lscan_lnum,
-				    (ubifs_lpt_scan_callback)scan_for_free_cb,
-				    &data);
+
+	if (c->min_lnum && c->max_lnum) {
+		err = ubifs_lpt_scan_nolock(c, c->min_lnum, c->max_lnum,
+					(ubifs_lpt_scan_callback)scan_for_free_cb,
+					&data);
+	} else {
+		err = ubifs_lpt_scan_nolock(c, -1, c->lscan_lnum,
+			(ubifs_lpt_scan_callback)scan_for_free_cb,
+			&data);
+	}
 	if (err)
 		return ERR_PTR(err);
 	ubifs_assert(data.lnum >= c->main_first && data.lnum < c->leb_cnt);
@@ -637,9 +664,15 @@ static const struct ubifs_lprops *scan_for_leb_for_idx(struct ubifs_info *c)
 	int err;
 
 	data.lnum = -1;
-	err = ubifs_lpt_scan_nolock(c, -1, c->lscan_lnum,
-				    (ubifs_lpt_scan_callback)scan_for_idx_cb,
-				    &data);
+	if (c->min_lnum && c->max_lnum) {
+		err = ubifs_lpt_scan_nolock(c, c->min_lnum, c->max_lnum,
+					    (ubifs_lpt_scan_callback)scan_for_idx_cb,
+					    &data);
+	} else {
+		err = ubifs_lpt_scan_nolock(c, -1, c->lscan_lnum,
+					    (ubifs_lpt_scan_callback)scan_for_idx_cb,
+					    &data);
+	}
 	if (err)
 		return ERR_PTR(err);
 	ubifs_assert(data.lnum >= c->main_first && data.lnum < c->leb_cnt);
diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
index 7b35e3d6cde7..12ad5a9680de 100644
--- a/fs/ubifs/gc.c
+++ b/fs/ubifs/gc.c
@@ -67,49 +67,6 @@
 #define HARD_LEBS_LIMIT 32
 
 /**
- * switch_gc_head - switch the garbage collection journal head.
- * @c: UBIFS file-system description object
- * @buf: buffer to write
- * @len: length of the buffer to write
- * @lnum: LEB number written is returned here
- * @offs: offset written is returned here
- *
- * This function switch the GC head to the next LEB which is reserved in
- * @c->gc_lnum. Returns %0 in case of success, %-EAGAIN if commit is required,
- * and other negative error code in case of failures.
- */
-static int switch_gc_head(struct ubifs_info *c)
-{
-	int err, gc_lnum = c->gc_lnum;
-	struct ubifs_wbuf *wbuf = &c->jheads[GCHD].wbuf;
-
-	ubifs_assert(gc_lnum != -1);
-	dbg_gc("switch GC head from LEB %d:%d to LEB %d (waste %d bytes)",
-	       wbuf->lnum, wbuf->offs + wbuf->used, gc_lnum,
-	       c->leb_size - wbuf->offs - wbuf->used);
-
-	err = ubifs_wbuf_sync_nolock(wbuf);
-	if (err)
-		return err;
-
-	/*
-	 * The GC write-buffer was synchronized, we may safely unmap
-	 * 'c->gc_lnum'.
-	 */
-	err = ubifs_leb_unmap(c, gc_lnum);
-	if (err)
-		return err;
-
-	err = ubifs_add_bud_to_log(c, GCHD, gc_lnum, 0);
-	if (err)
-		return err;
-
-	c->gc_lnum = -1;
-	err = ubifs_wbuf_seek_nolock(wbuf, gc_lnum, 0);
-	return err;
-}
-
-/**
  * data_nodes_cmp - compare 2 data nodes.
  * @priv: UBIFS file-system description object
  * @a: first data node
@@ -353,7 +310,7 @@ static int move_nodes(struct ubifs_info *c, struct ubifs_scan_leb *sleb)
 		 * The GC journal head is not set, because it is the first GC
 		 * invocation since mount.
 		 */
-		err = switch_gc_head(c);
+		err = ubifs_jnl_switch_head(c, GCHD);
 		if (err)
 			return err;
 	}
@@ -414,7 +371,7 @@ static int move_nodes(struct ubifs_info *c, struct ubifs_scan_leb *sleb)
 		 * Waste the rest of the space in the LEB and switch to the
 		 * next LEB.
 		 */
-		err = switch_gc_head(c);
+		err = ubifs_jnl_switch_head(c, GCHD);
 		if (err)
 			goto out;
 	}
@@ -469,10 +426,15 @@ int ubifs_garbage_collect_leb(struct ubifs_info *c, struct ubifs_lprops *lp)
 	struct ubifs_wbuf *wbuf = &c->jheads[GCHD].wbuf;
 	int err = 0, lnum = lp->lnum;
 
-	ubifs_assert(c->gc_lnum != -1 || wbuf->offs + wbuf->used == 0 ||
-		     c->need_recovery);
-	ubifs_assert(c->gc_lnum != lnum);
-	ubifs_assert(wbuf->lnum != lnum);
+	if (c->min_lnum && c->max_lnum) {
+		if (wbuf->lnum == lnum)
+			wbuf->lnum = -1;
+	} else {
+		ubifs_assert(c->gc_lnum != -1 || wbuf->offs + wbuf->used == 0 ||
+				c->need_recovery);
+		ubifs_assert(c->gc_lnum != lnum);
+		ubifs_assert(wbuf->lnum != lnum);
+	}
 
 	if (lp->free + lp->dirty == c->leb_size) {
 		/* Special case - a free LEB  */
@@ -497,7 +459,7 @@ int ubifs_garbage_collect_leb(struct ubifs_info *c, struct ubifs_lprops *lp)
 		if (err)
 			return err;
 
-		if (c->gc_lnum == -1) {
+		if (!(c->min_lnum && c->max_lnum) && c->gc_lnum == -1) {
 			c->gc_lnum = lnum;
 			return LEB_RETAINED;
 		}
@@ -576,7 +538,7 @@ int ubifs_garbage_collect_leb(struct ubifs_info *c, struct ubifs_lprops *lp)
 		c->gc_seq += 1;
 		smp_wmb();
 
-		if (c->gc_lnum == -1) {
+		if (!(c->min_lnum && c->max_lnum) && c->gc_lnum == -1) {
 			c->gc_lnum = lnum;
 			err = LEB_RETAINED;
 		} else {
diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 04c4ec6483e5..a2faaa665a65 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -510,6 +510,77 @@ static void set_dent_cookie(struct ubifs_info *c, struct ubifs_dent_node *dent)
 }
 
 /**
+ * ubifs_jnl_switch_head - switch the given journal head.
+ * @c: UBIFS file-system description object
+ * @jhead: the journal head to move
+ *
+ * This function switches the given journal head to an empty LEB. In case of
+ * the garbage collection journal head, it is reserved in @c->gc_lnum. Returns
+ * %0 in case of success, %-EAGAIN if commit is required, and other negative
+ * error code in case of failures.
+ */
+int ubifs_jnl_switch_head(struct ubifs_info *c, int jhead)
+{
+	int err, offs = 0, lnum, temp = 0;
+	struct ubifs_wbuf *wbuf = &c->jheads[jhead].wbuf;
+	struct ubifs_bud *bud;
+
+	err = ubifs_wbuf_sync_nolock(wbuf);
+	if (err)
+		return err;
+
+	/**
+	 * If a resize action is going on, look for empties inside the new
+	 * boundaries. If no resize action is going on, in case of the garbage
+	 * collection, a journal head was already reserved.
+	 */
+	if (!jhead == GCHD || (c->min_lnum && c->max_lnum)) {
+		while (1) {
+			lnum = ubifs_find_free_space(c, c->min_io_size, &offs, 1);
+
+			if (temp) {
+				err = ubifs_return_leb(c, temp);
+				if (err)
+					return err;
+			}
+
+			if (lnum < 0)
+				return lnum;
+
+			bud = ubifs_search_bud(c, lnum);
+			if (bud == NULL)
+				break;
+
+			temp = lnum;
+		}
+	} else
+		lnum = c->gc_lnum;
+
+	dbg_resize("switch head %d from LEB %d:%d to LEB %d:%d (waste %d bytes)",
+		jhead, wbuf->lnum, wbuf->offs + wbuf->used, lnum,
+		offs, c->leb_size - wbuf->offs - wbuf->used);
+
+	/*
+	 * The write-buffer was synchronized, we may safely unmap 'lnum'.
+	 */
+	if (lnum == c->gc_lnum) {
+		err = ubifs_leb_unmap(c, lnum);
+		if (err)
+			return err;
+	}
+
+	err = ubifs_add_bud_to_log(c, jhead, lnum, offs);
+	if (err)
+		return err;
+
+	if (jhead == GCHD)
+		c->gc_lnum = -1;
+
+	err = ubifs_wbuf_seek_nolock(wbuf, lnum, offs);
+	return err;
+}
+
+/**
  * ubifs_jnl_update - update inode.
  * @c: UBIFS file-system description object
  * @dir: parent inode or host inode in case of extended attributes
diff --git a/fs/ubifs/lprops.c b/fs/ubifs/lprops.c
index 6c3a1abd0e22..64c4b2dd9fb4 100644
--- a/fs/ubifs/lprops.c
+++ b/fs/ubifs/lprops.c
@@ -315,7 +315,7 @@ void ubifs_add_to_cat(struct ubifs_info *c, struct ubifs_lprops *lprops,
  *
  * LEB properties are categorized to enable fast find operations.
  */
-static void ubifs_remove_from_cat(struct ubifs_info *c,
+void ubifs_remove_from_cat(struct ubifs_info *c,
 				  struct ubifs_lprops *lprops, int cat)
 {
 	switch (cat) {
@@ -767,6 +767,7 @@ int ubifs_read_one_lp(struct ubifs_info *c, int lnum, struct ubifs_lprops *lp)
  */
 const struct ubifs_lprops *ubifs_fast_find_free(struct ubifs_info *c)
 {
+	int index;
 	struct ubifs_lprops *lprops;
 	struct ubifs_lpt_heap *heap;
 
@@ -776,7 +777,18 @@ const struct ubifs_lprops *ubifs_fast_find_free(struct ubifs_info *c)
 	if (heap->cnt == 0)
 		return NULL;
 
-	lprops = heap->arr[0];
+	if (c->min_lnum && c->max_lnum) {
+		for (index = 0; index < heap->cnt; index++) {
+			lprops = heap->arr[index];
+			if (lprops->lnum >= c->min_lnum && lprops->lnum <= c->max_lnum)
+				goto out;
+		}
+		return NULL;
+	} else
+		lprops = heap->arr[0];
+
+out:
+
 	ubifs_assert(!(lprops->flags & LPROPS_TAKEN));
 	ubifs_assert(!(lprops->flags & LPROPS_INDEX));
 	return lprops;
@@ -798,7 +810,17 @@ const struct ubifs_lprops *ubifs_fast_find_empty(struct ubifs_info *c)
 	if (list_empty(&c->empty_list))
 		return NULL;
 
-	lprops = list_entry(c->empty_list.next, struct ubifs_lprops, list);
+	if (c->min_lnum && c->max_lnum) {
+		list_for_each_entry(lprops, &c->empty_list, list) {
+			if (lprops->lnum >= c->min_lnum && lprops->lnum <= c->max_lnum)
+				goto out;
+		}
+		return NULL;
+	} else
+		lprops = list_entry(c->empty_list.next, struct ubifs_lprops, list);
+
+out:
+
 	ubifs_assert(!(lprops->flags & LPROPS_TAKEN));
 	ubifs_assert(!(lprops->flags & LPROPS_INDEX));
 	ubifs_assert(lprops->free == c->leb_size);
@@ -821,7 +843,17 @@ const struct ubifs_lprops *ubifs_fast_find_freeable(struct ubifs_info *c)
 	if (list_empty(&c->freeable_list))
 		return NULL;
 
-	lprops = list_entry(c->freeable_list.next, struct ubifs_lprops, list);
+	if (c->min_lnum && c->max_lnum) {
+		list_for_each_entry(lprops, &c->freeable_list, list) {
+			if (lprops->lnum >= c->min_lnum && lprops->lnum <= c->max_lnum)
+				goto out;
+		}
+		return NULL;
+	} else
+		lprops = list_entry(c->freeable_list.next, struct ubifs_lprops, list);
+
+out:
+
 	ubifs_assert(!(lprops->flags & LPROPS_TAKEN));
 	ubifs_assert(!(lprops->flags & LPROPS_INDEX));
 	ubifs_assert(lprops->free + lprops->dirty == c->leb_size);
diff --git a/fs/ubifs/master.c b/fs/ubifs/master.c
index c6a5e39e2ba5..7f0b9fa861df 100644
--- a/fs/ubifs/master.c
+++ b/fs/ubifs/master.c
@@ -89,13 +89,13 @@ static int scan_for_master(struct ubifs_info *c)
 }
 
 /**
- * validate_master - validate master node.
+ * ubifs_validate_master - validate master node.
  * @c: UBIFS file-system description object
  *
  * This function validates data which was read from master node. Returns zero
  * if the data is all right and %-EINVAL if not.
  */
-static int validate_master(const struct ubifs_info *c)
+int ubifs_validate_master(const struct ubifs_info *c)
 {
 	long long main_sz;
 	int err;
@@ -339,7 +339,7 @@ int ubifs_read_master(struct ubifs_info *c)
 		c->mst_node->total_dark = cpu_to_le64(c->lst.total_dark);
 	}
 
-	err = validate_master(c);
+	err = ubifs_validate_master(c);
 	if (err)
 		return err;
 
diff --git a/fs/ubifs/resize.c b/fs/ubifs/resize.c
new file mode 100644
index 000000000000..772f0052b7dd
--- /dev/null
+++ b/fs/ubifs/resize.c
@@ -0,0 +1,408 @@
+/*
+ * This file is part of UBIFS.
+ *
+ * Copyright (C) 2006-2008 Nokia Corporation.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as published by
+ * the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program; if not, write to the Free Software Foundation, Inc., 51
+ * Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
+ *
+ * Authors: Ryan Meulenkamp
+ *          Jaap de Jong
+ */
+
+/*
+ * This file provides code that could be used to resize the filesystem
+ * so the surrounding volume could also be resized.
+ */
+
+#include <linux/slab.h>
+#include <linux/pagemap.h>
+#include <linux/list_sort.h>
+#include "ubifs.h"
+
+/**
+ * move_leb - Move an LEB to a new location.
+ * @c: UBIFS file-system description object
+ * @lnum: de leb number of the leb to move
+ *
+ * This function is a modification of the garbage collector.
+ */
+int move_leb(struct ubifs_info *c, int lnum)
+{
+	int err, ret = 0;
+	struct ubifs_lprops lp;
+	struct ubifs_wbuf *wbuf = &c->jheads[GCHD].wbuf;
+
+	ubifs_assert(!c->ro_media && !c->ro_mount);
+
+	if (ubifs_gc_should_commit(c))
+		return -EAGAIN;
+
+	mutex_lock_nested(&wbuf->io_mutex, wbuf->jhead);
+
+	if (c->ro_error) {
+		ret = -EROFS;
+		goto out_unlock;
+	}
+
+	/* We expect the write-buffer to be empty on entry */
+	ubifs_assert(!wbuf->used);
+
+	cond_resched();
+
+	/* Give the commit an opportunity to run */
+	if (ubifs_gc_should_commit(c)) {
+		ret = -EAGAIN;
+		goto out_unlock;
+	}
+
+	ret = ubifs_read_one_lp(c, lnum, &lp);
+	if (ret)
+		goto out;
+
+	dbg_resize("LEB %d flags: %d", lnum, lp.flags);
+
+	/*
+	 * In the first part of the resize, it doesn't matter
+	 * that not all leb's were garbage-collected. Before
+	 * moving the second part, all journal-heads are moved
+	 * so there won't be taken leb's in the second part.
+	 */
+	if (lp.flags & LPROPS_TAKEN) {
+		ret = 0;
+		goto out_unlock;
+	}
+
+	ret = ubifs_change_one_lp(c, lnum, LPROPS_NC, LPROPS_NC,
+			LPROPS_TAKEN, 0, 0);
+
+	if (ret)
+		goto out;
+
+	dbg_resize("Moving LEB %d: free %d, dirty %d, sum %d",
+			lnum, lp.free, lp.dirty, lp.free + lp.dirty);
+
+	ret = ubifs_garbage_collect_leb(c, &lp);
+	if (ret < 0) {
+		if (ret == -EAGAIN) {
+			/*
+			 * This is not an error, so we have to return the
+			 * LEB to lprops. But if 'ubifs_return_leb()'
+			 * fails, its failure code is propagated to the
+			 * caller instead of the original '-EAGAIN'.
+			 */
+			err = ubifs_return_leb(c, lnum);
+			if (err) {
+				ret = err;
+				goto out;
+			}
+		} else
+			goto out;
+	}
+
+	if (ret == LEB_FREED) {
+		dbg_resize("LEB %d freed, return", lp.lnum);
+		ret = ubifs_return_leb(c, lnum);
+	}
+
+	if (ret == LEB_FREED_IDX) {
+		dbg_resize("soft limit, some index LEBs GC'ed, -EAGAIN");
+		ubifs_commit_required(c);
+		ret = 0;
+	}
+
+out_unlock:
+	mutex_unlock(&wbuf->io_mutex);
+	return ret;
+
+out:
+	ubifs_assert(ret < 0);
+	ubifs_assert(ret != -ENOSPC && ret != -EAGAIN);
+	ubifs_wbuf_sync_nolock(wbuf);
+	ubifs_ro_mode(c, ret);
+	mutex_unlock(&wbuf->io_mutex);
+	ubifs_return_leb(c, lp.lnum);
+	return ret;
+}
+
+/**
+ * move_lebs - Move lebs between start and end to a new location.
+ * @c: UBIFS file-system description object
+ * @start: de leb number of the first leb to move
+ * @end: de leb number of the last leb to move
+ *
+ * This function moves all lebs between start and end to a new
+ * location within the boundaries of c->min_leb and c->max_leb.
+ */
+static int move_lebs(struct ubifs_info *c, int start, int end)
+{
+	int lnum, ret, tries;
+
+	for (lnum = end; lnum >= start; lnum--) {
+retry:
+		ret = ubifs_run_commit(c);
+		if (ret)
+			break;
+
+		down_read(&c->commit_sem);
+		ret = move_leb(c, lnum);
+		up_read(&c->commit_sem);
+
+		if (ret == -EAGAIN)
+			goto retry;
+		else if (ret)
+			return ret;
+
+		tries = 0;
+	}
+
+	return ret;
+}
+
+/**
+ * switch_head - Move the given jhead to a new leb.
+ * @c: UBIFS file-system description object
+ * @head: The head to be switched
+ *
+ * Function used to move the given journal head to another leb.
+ */
+static int switch_head(struct ubifs_info *c, int head)
+{
+	int ret;
+	struct ubifs_wbuf *wbuf = &c->jheads[head].wbuf;
+
+	mutex_lock_nested(&wbuf->io_mutex, wbuf->jhead);
+	down_read(&c->commit_sem);
+
+	ret = ubifs_jnl_switch_head(c, head);
+
+	up_read(&c->commit_sem);
+	mutex_unlock(&wbuf->io_mutex);
+
+	return ret;
+}
+
+/**
+ * switch_gc_head - Move the gc jhead to a new leb.
+ * @c: UBIFS file-system description object
+ *
+ * Function used to move the garbage collection journal
+ * head to another leb.
+ */
+static int switch_gc_head(struct ubifs_info *c)
+{
+	int offs = 0, ret, temp;
+
+	ret = ubifs_jnl_switch_head(c, GCHD);
+	if (ret)
+		return ret;
+
+	temp = c->gc_lnum;
+
+	ret = ubifs_find_free_space(c, c->leb_size, &offs, 0);
+	if (ret < 0)
+		return ret;
+
+	ubifs_assert(ret >= c->min_lnum && ret <= c->max_lnum);
+
+	c->gc_lnum = ret;
+
+	return ubifs_return_leb(c, temp);
+}
+
+/**
+ * shrink_to_size - Shrink the ubifs to a new size.
+ * @c: UBIFS file-system description object
+ * @leb_count: the size to fit the filesystem within.
+ *
+ * Function used to shrink ubifs, by making room and
+ * then moving all lebs outside of the new size.
+ */
+static int shrink_to_size(struct ubifs_info *c, int leb_count)
+{
+	int ret;
+
+	c->jheads[GCHD].wbuf.lnum = -1;
+
+	ret = move_lebs(c, c->main_first, leb_count - 1);
+	if (ret)
+		return ret;
+
+	ret = switch_head(c, BASEHD);
+	if (ret)
+		return ret;
+
+	ret = switch_head(c, DATAHD);
+	if (ret)
+		return ret;
+
+	return move_lebs(c, leb_count, c->leb_cnt - 1);
+}
+
+/**
+ * is_move_required - Check if it is even required to move anyting
+ * @c: UBIFS file-system description object
+ * @leb_count: the size to fit the filesystem within.
+ *
+ * Loop over all lebs that would be outside the new size and and check if
+ * there are ones there that are used at all.
+ */
+static int is_move_required(struct ubifs_info *c, int leb_count) {
+	int lnum, ret;
+	struct ubifs_lprops lp;
+
+	for (lnum = leb_count; lnum < c->leb_cnt; lnum++) {
+		ret = ubifs_read_one_lp(c, lnum, &lp);
+		if (ret)
+			return ret;
+
+		if (lp.free != c->leb_size)
+			return 1;
+	}
+	return 0;
+}
+
+/**
+ * fixup_lprops - Uncategorize the lprops outside the new boundaries.
+ * @c: UBIFS file-system description object
+ * @leb_count: a place to start fixing up
+ */
+static int fixup_lprops(struct ubifs_info *c, int leb_count)
+{
+	int lnum, ret = 0;
+	struct ubifs_lprops* lp;
+
+	for (lnum = leb_count; lnum < c->leb_cnt; lnum++) {
+		lp = ubifs_lpt_lookup(c, lnum);
+		if (IS_ERR(lp)) {
+			ret = PTR_ERR(lp);
+			ubifs_err(c, "cannot read properties of LEB %d, error %d",
+				  lnum, ret);
+			break;
+		}
+		ubifs_remove_from_cat(c, lp, lp->flags & LPROPS_CAT_MASK);
+	}
+
+	return ret;
+}
+
+/**
+ * ubifs_resize - Shrink the ubifs to a new size.
+ * @c: UBIFS file-system description object
+ * @leb_count: the size to fit the filesystem within.
+ *
+ * Function used to shrink ubifs, by making room and
+ * then moving all lebs outside of the new size.
+ */
+int ubifs_resize(struct ubifs_info *c, int leb_count)
+{
+	int ret = 0, delta;
+	long long delta_bytes;
+	struct ubifs_sb_node *sup;
+
+	if (c == NULL)
+		return -EINVAL;
+
+	if (leb_count == c->leb_cnt)
+		return 0;
+
+	if (leb_count > c->leb_cnt)
+		return -EINVAL;
+
+	delta = c->leb_cnt - leb_count;
+	delta_bytes = (long) delta * c->leb_size;
+
+	ret = is_move_required(c, leb_count);
+	if (ret < 0)
+		return ret;
+
+	c->min_lnum = c->main_first;
+	c->max_lnum = leb_count - 2;
+
+	if (ret) {
+		ret = shrink_to_size(c, leb_count);
+		if (ret)
+			return ret;
+	} else {
+		ret = switch_head(c, BASEHD);
+		if (ret)
+			return ret;
+
+		ret = switch_head(c, DATAHD);
+		if (ret)
+			return ret;
+	}
+
+	ret = switch_gc_head(c);
+	if (ret)
+		return ret;
+
+	ubifs_get_lprops(c);
+
+	ret = fixup_lprops(c, leb_count);
+	if (ret)
+		goto out_release;
+
+	c->lscan_lnum = c->main_first;
+	c->leb_cnt = leb_count;
+	c->main_lebs -= delta;
+	c->main_bytes -= delta_bytes;
+	c->lst.empty_lebs -= delta;
+	c->lst.total_free -= delta_bytes;
+	c->lst.total_dark -= delta * (long long)c->dark_wm;
+
+	c->min_lnum = 0;
+	c->max_lnum = 0;
+
+	c->mst_node->lscan_lnum = cpu_to_le32(c->main_first);
+	c->mst_node->gc_lnum = cpu_to_le32(c->gc_lnum);
+	c->mst_node->leb_cnt = cpu_to_le32(leb_count);
+	c->mst_node->empty_lebs = cpu_to_le32(c->lst.empty_lebs);
+	c->mst_node->total_free = cpu_to_le64(c->lst.total_free);
+	c->mst_node->total_dark = cpu_to_le64(c->lst.total_dark);
+
+	sup = ubifs_read_sb_node(c);
+	if (IS_ERR(sup)) {
+		ret = PTR_ERR(sup);
+		goto out_release;
+	}
+
+	sup->leb_cnt = cpu_to_le32(leb_count);
+
+	ret = ubifs_validate_master(c);
+	if (ret)
+		goto out;
+
+	ret = ubifs_validate_sb(c, sup);
+	if (ret)
+		goto out;
+
+	ret = ubifs_write_master(c);
+	if (ret)
+		goto out;
+
+	ret = ubifs_write_sb_node(c, sup);
+
+out:
+
+	kfree(sup);
+
+out_release:
+
+	c->min_lnum = 0;
+	c->max_lnum = 0;
+
+	ubifs_release_lprops(c);
+
+	return ret;
+}
diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index 8c25081a5109..5e138fe88a38 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -347,7 +347,7 @@ static int create_default_filesystem(struct ubifs_info *c)
 }
 
 /**
- * validate_sb - validate superblock node.
+ * ubifs_validate_sb - validate superblock node.
  * @c: UBIFS file-system description object
  * @sup: superblock node
  *
@@ -356,7 +356,7 @@ static int create_default_filesystem(struct ubifs_info *c)
  * instead. Returns zero in case of success and %-EINVAL in case of validation
  * failure.
  */
-static int validate_sb(struct ubifs_info *c, struct ubifs_sb_node *sup)
+int ubifs_validate_sb(struct ubifs_info *c, struct ubifs_sb_node *sup)
 {
 	long long max_bytes;
 	int err = 1, min_leb_cnt;
@@ -684,7 +684,7 @@ int ubifs_read_superblock(struct ubifs_info *c)
 	c->main_lebs -= c->log_lebs + c->lpt_lebs + c->orph_lebs;
 	c->main_first = c->leb_cnt - c->main_lebs;
 
-	err = validate_sb(c, sup);
+	err = ubifs_validate_sb(c, sup);
 out:
 	kfree(sup);
 	return err;
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index b16ef162344a..dff668888c3f 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -931,6 +931,7 @@ enum {
 	Opt_chk_data_crc,
 	Opt_no_chk_data_crc,
 	Opt_override_compr,
+	Opt_resize_volume,
 	Opt_ignore,
 	Opt_err,
 };
@@ -943,6 +944,7 @@ static const match_table_t tokens = {
 	{Opt_chk_data_crc, "chk_data_crc"},
 	{Opt_no_chk_data_crc, "no_chk_data_crc"},
 	{Opt_override_compr, "compr=%s"},
+	{Opt_resize_volume, "leb_cnt=%d"},
 	{Opt_ignore, "ubi=%s"},
 	{Opt_ignore, "vol=%s"},
 	{Opt_err, NULL},
@@ -1045,6 +1047,18 @@ static int ubifs_parse_options(struct ubifs_info *c, char *options,
 			c->default_compr = c->mount_opts.compr_type;
 			break;
 		}
+		case Opt_resize_volume:
+		{
+			int leb_count;
+
+			if (match_int(&args[0], &leb_count)) {
+				ubifs_err(c, "leb_cnt requires an argument\n");
+				return -EINVAL;
+			}
+
+			c->new_leb_cnt = leb_count;
+			break;
+		}
 		case Opt_ignore:
 			break;
 		default:
@@ -1880,6 +1894,15 @@ static int ubifs_remount_fs(struct super_block *sb, int *flags, char *data)
 		mutex_unlock(&c->bu_mutex);
 	}
 
+	if (c->new_leb_cnt) {
+		err = ubifs_resize(c, c->new_leb_cnt);
+		c->new_leb_cnt = 0;
+		if (err) {
+			ubifs_err(c, "resize unsuccessful");
+			return err;
+		}
+	}
+
 	ubifs_assert(c->lst.taken_empty_lebs > 0);
 	return 0;
 }
@@ -2071,6 +2094,13 @@ static int ubifs_fill_super(struct super_block *sb, void *data, int silent)
 		goto out_umount;
 	}
 
+	if (c->new_leb_cnt) {
+		err = ubifs_resize(c, c->new_leb_cnt);
+		c->new_leb_cnt = 0;
+		if (err)
+			goto out_unlock;
+	}
+
 	mutex_unlock(&c->umount_mutex);
 	return 0;
 
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 5ee7af879cc4..9bcbb3e93999 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1445,6 +1445,9 @@ struct ubifs_info {
 	struct ubifs_mount_opts mount_opts;
 
 	struct ubifs_debug_info *dbg;
+	int min_lnum;
+	int max_lnum;
+	int new_leb_cnt;
 };
 
 extern struct list_head ubifs_infos;
@@ -1516,6 +1519,7 @@ int ubifs_log_post_commit(struct ubifs_info *c, int old_ltail_lnum);
 int ubifs_consolidate_log(struct ubifs_info *c);
 
 /* journal.c */
+int ubifs_jnl_switch_head(struct ubifs_info *c, int jhead);
 int ubifs_jnl_update(struct ubifs_info *c, const struct inode *dir,
 		     const struct fscrypt_name *nm, const struct inode *inode,
 		     int deletion, int xent);
@@ -1646,6 +1650,7 @@ void ubifs_wait_for_commit(struct ubifs_info *c);
 /* master.c */
 int ubifs_read_master(struct ubifs_info *c);
 int ubifs_write_master(struct ubifs_info *c);
+int ubifs_validate_master(const struct ubifs_info *c);
 
 /* sb.c */
 int ubifs_read_superblock(struct ubifs_info *c);
@@ -1653,6 +1658,7 @@ struct ubifs_sb_node *ubifs_read_sb_node(struct ubifs_info *c);
 int ubifs_write_sb_node(struct ubifs_info *c, struct ubifs_sb_node *sup);
 int ubifs_fixup_free_space(struct ubifs_info *c);
 int ubifs_enable_encryption(struct ubifs_info *c);
+int ubifs_validate_sb(struct ubifs_info *c, struct ubifs_sb_node *sup);
 
 /* replay.c */
 int ubifs_validate_entry(struct ubifs_info *c,
@@ -1720,6 +1726,8 @@ const struct ubifs_lprops *ubifs_change_lp(struct ubifs_info *c,
 void ubifs_get_lp_stats(struct ubifs_info *c, struct ubifs_lp_stats *lst);
 void ubifs_add_to_cat(struct ubifs_info *c, struct ubifs_lprops *lprops,
 		      int cat);
+void ubifs_remove_from_cat(struct ubifs_info *c, struct ubifs_lprops *lprops,
+			   int cat);
 void ubifs_replace_cat(struct ubifs_info *c, struct ubifs_lprops *old_lprops,
 		       struct ubifs_lprops *new_lprops);
 void ubifs_ensure_cat(struct ubifs_info *c, struct ubifs_lprops *lprops);
@@ -1789,6 +1797,9 @@ int ubifs_recover_size_accum(struct ubifs_info *c, union ubifs_key *key,
 int ubifs_recover_size(struct ubifs_info *c);
 void ubifs_destroy_size_tree(struct ubifs_info *c);
 
+/* resize.c */
+int ubifs_resize(struct ubifs_info *c, int leb_count);
+
 /* ioctl.c */
 long ubifs_ioctl(struct file *file, unsigned int cmd, unsigned long arg);
 void ubifs_set_inode_flags(struct inode *inode);
-- 
2.11.0
