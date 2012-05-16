Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SUhow-0002SA-2I
 for linux-mtd@lists.infradead.org; Wed, 16 May 2012 17:15:39 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 5/5] UBIFS: get rid of dbg_err
Date: Wed, 16 May 2012 20:16:26 +0300
Message-Id: <1337188586-32293-5-git-send-email-dedekind1@gmail.com>
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

This patch removes the 'dbg_err()' macro and we now use 'ubifs_err()' instead.
The idea of 'dbg_err()' was to compile out some error message to make the
binary a bit smaller - but I think it was a bad idea.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 fs/ubifs/commit.c     |    4 ++--
 fs/ubifs/debug.c      |   30 +++++++++++++++---------------
 fs/ubifs/debug.h      |    4 ----
 fs/ubifs/lpt.c        |   43 ++++++++++++++++++++++---------------------
 fs/ubifs/lpt_commit.c |   44 +++++++++++++++++++++-----------------------
 fs/ubifs/orphan.c     |    4 ++--
 fs/ubifs/recovery.c   |   22 +++++++++++-----------
 fs/ubifs/replay.c     |   20 ++++++++++----------
 fs/ubifs/scan.c       |   12 ++++++------
 fs/ubifs/super.c      |   14 +++++++-------
 fs/ubifs/tnc_misc.c   |   32 ++++++++++++++++----------------
 fs/ubifs/xattr.c      |    4 ++--
 12 files changed, 114 insertions(+), 119 deletions(-)

diff --git a/fs/ubifs/commit.c b/fs/ubifs/commit.c
index 5da20c1..8eda717 100644
--- a/fs/ubifs/commit.c
+++ b/fs/ubifs/commit.c
@@ -716,13 +716,13 @@ out:
 	return 0;
 
 out_dump:
-	dbg_err("dumping index node (iip=%d)", i->iip);
+	ubifs_err("dumping index node (iip=%d)", i->iip);
 	ubifs_dump_node(c, idx);
 	list_del(&i->list);
 	kfree(i);
 	if (!list_empty(&list)) {
 		i = list_entry(list.prev, struct idx_node, list);
-		dbg_err("dumping parent index node");
+		ubifs_err("dumping parent index node");
 		ubifs_dump_node(c, &i->idx);
 	}
 out_free:
diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 3eef253..df83d7b 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -1285,24 +1285,24 @@ static int dbg_check_key_order(struct ubifs_info *c, struct ubifs_zbranch *zbr1,
 	err = 1;
 	key_read(c, &dent1->key, &key);
 	if (keys_cmp(c, &zbr1->key, &key)) {
-		dbg_err("1st entry at %d:%d has key %s", zbr1->lnum,
-			zbr1->offs, dbg_snprintf_key(c, &key, key_buf,
-						     DBG_KEY_BUF_LEN));
-		dbg_err("but it should have key %s according to tnc",
-			dbg_snprintf_key(c, &zbr1->key, key_buf,
-					 DBG_KEY_BUF_LEN));
+		ubifs_err("1st entry at %d:%d has key %s", zbr1->lnum,
+			  zbr1->offs, dbg_snprintf_key(c, &key, key_buf,
+						       DBG_KEY_BUF_LEN));
+		ubifs_err("but it should have key %s according to tnc",
+			  dbg_snprintf_key(c, &zbr1->key, key_buf,
+					   DBG_KEY_BUF_LEN));
 		ubifs_dump_node(c, dent1);
 		goto out_free;
 	}
 
 	key_read(c, &dent2->key, &key);
 	if (keys_cmp(c, &zbr2->key, &key)) {
-		dbg_err("2nd entry at %d:%d has key %s", zbr1->lnum,
-			zbr1->offs, dbg_snprintf_key(c, &key, key_buf,
-						     DBG_KEY_BUF_LEN));
-		dbg_err("but it should have key %s according to tnc",
-			dbg_snprintf_key(c, &zbr2->key, key_buf,
-					 DBG_KEY_BUF_LEN));
+		ubifs_err("2nd entry at %d:%d has key %s", zbr1->lnum,
+			  zbr1->offs, dbg_snprintf_key(c, &key, key_buf,
+						       DBG_KEY_BUF_LEN));
+		ubifs_err("but it should have key %s according to tnc",
+			  dbg_snprintf_key(c, &zbr2->key, key_buf,
+					   DBG_KEY_BUF_LEN));
 		ubifs_dump_node(c, dent2);
 		goto out_free;
 	}
@@ -1316,10 +1316,10 @@ static int dbg_check_key_order(struct ubifs_info *c, struct ubifs_zbranch *zbr1,
 		goto out_free;
 	}
 	if (cmp == 0 && nlen1 == nlen2)
-		dbg_err("2 xent/dent nodes with the same name");
+		ubifs_err("2 xent/dent nodes with the same name");
 	else
-		dbg_err("bad order of colliding key %s",
-			dbg_snprintf_key(c, &key, key_buf, DBG_KEY_BUF_LEN));
+		ubifs_err("bad order of colliding key %s",
+			  dbg_snprintf_key(c, &key, key_buf, DBG_KEY_BUF_LEN));
 
 	ubifs_msg("first node at %d:%d\n", zbr1->lnum, zbr1->offs);
 	ubifs_dump_node(c, dent1);
diff --git a/fs/ubifs/debug.h b/fs/ubifs/debug.h
index 7a6a9e2..6b3a9e2 100644
--- a/fs/ubifs/debug.h
+++ b/fs/ubifs/debug.h
@@ -159,10 +159,6 @@ struct ubifs_global_debug_info {
 	}                                                                      \
 } while (0)
 
-#define dbg_err(fmt, ...) do {                                                 \
-	ubifs_err(fmt, ##__VA_ARGS__);                                         \
-} while (0)
-
 #define ubifs_dbg_msg(type, fmt, ...) \
 	pr_debug("UBIFS DBG " type ": " fmt "\n", ##__VA_ARGS__)
 
diff --git a/fs/ubifs/lpt.c b/fs/ubifs/lpt.c
index 5d1d97d..2054e81 100644
--- a/fs/ubifs/lpt.c
+++ b/fs/ubifs/lpt.c
@@ -2094,8 +2094,8 @@ static int dbg_chk_pnode(struct ubifs_info *c, struct ubifs_pnode *pnode,
 	int i;
 
 	if (pnode->num != col) {
-		dbg_err("pnode num %d expected %d parent num %d iip %d",
-			pnode->num, col, pnode->parent->num, pnode->iip);
+		ubifs_err("pnode num %d expected %d parent num %d iip %d",
+			  pnode->num, col, pnode->parent->num, pnode->iip);
 		return -EINVAL;
 	}
 	for (i = 0; i < UBIFS_LPT_FANOUT; i++) {
@@ -2109,14 +2109,14 @@ static int dbg_chk_pnode(struct ubifs_info *c, struct ubifs_pnode *pnode,
 		if (lnum >= c->leb_cnt)
 			continue;
 		if (lprops->lnum != lnum) {
-			dbg_err("bad LEB number %d expected %d",
-				lprops->lnum, lnum);
+			ubifs_err("bad LEB number %d expected %d",
+				  lprops->lnum, lnum);
 			return -EINVAL;
 		}
 		if (lprops->flags & LPROPS_TAKEN) {
 			if (cat != LPROPS_UNCAT) {
-				dbg_err("LEB %d taken but not uncat %d",
-					lprops->lnum, cat);
+				ubifs_err("LEB %d taken but not uncat %d",
+					  lprops->lnum, cat);
 				return -EINVAL;
 			}
 			continue;
@@ -2128,8 +2128,8 @@ static int dbg_chk_pnode(struct ubifs_info *c, struct ubifs_pnode *pnode,
 			case LPROPS_FRDI_IDX:
 				break;
 			default:
-				dbg_err("LEB %d index but cat %d",
-					lprops->lnum, cat);
+				ubifs_err("LEB %d index but cat %d",
+					  lprops->lnum, cat);
 				return -EINVAL;
 			}
 		} else {
@@ -2141,8 +2141,8 @@ static int dbg_chk_pnode(struct ubifs_info *c, struct ubifs_pnode *pnode,
 			case LPROPS_FREEABLE:
 				break;
 			default:
-				dbg_err("LEB %d not index but cat %d",
-					lprops->lnum, cat);
+				ubifs_err("LEB %d not index but cat %d",
+					  lprops->lnum, cat);
 				return -EINVAL;
 			}
 		}
@@ -2182,24 +2182,24 @@ static int dbg_chk_pnode(struct ubifs_info *c, struct ubifs_pnode *pnode,
 			break;
 		}
 		if (!found) {
-			dbg_err("LEB %d cat %d not found in cat heap/list",
-				lprops->lnum, cat);
+			ubifs_err("LEB %d cat %d not found in cat heap/list",
+				  lprops->lnum, cat);
 			return -EINVAL;
 		}
 		switch (cat) {
 		case LPROPS_EMPTY:
 			if (lprops->free != c->leb_size) {
-				dbg_err("LEB %d cat %d free %d dirty %d",
-					lprops->lnum, cat, lprops->free,
-					lprops->dirty);
+				ubifs_err("LEB %d cat %d free %d dirty %d",
+					  lprops->lnum, cat, lprops->free,
+					  lprops->dirty);
 				return -EINVAL;
 			}
 		case LPROPS_FREEABLE:
 		case LPROPS_FRDI_IDX:
 			if (lprops->free + lprops->dirty != c->leb_size) {
-				dbg_err("LEB %d cat %d free %d dirty %d",
-					lprops->lnum, cat, lprops->free,
-					lprops->dirty);
+				ubifs_err("LEB %d cat %d free %d dirty %d",
+					  lprops->lnum, cat, lprops->free,
+					  lprops->dirty);
 				return -EINVAL;
 			}
 		}
@@ -2233,9 +2233,10 @@ int dbg_check_lpt_nodes(struct ubifs_info *c, struct ubifs_cnode *cnode,
 			/* cnode is a nnode */
 			num = calc_nnode_num(row, col);
 			if (cnode->num != num) {
-				dbg_err("nnode num %d expected %d "
-					"parent num %d iip %d", cnode->num, num,
-					(nnode ? nnode->num : 0), cnode->iip);
+				ubifs_err("nnode num %d expected %d "
+					  "parent num %d iip %d",
+					  cnode->num, num,
+					  (nnode ? nnode->num : 0), cnode->iip);
 				return -EINVAL;
 			}
 			nn = (struct ubifs_nnode *)cnode;
diff --git a/fs/ubifs/lpt_commit.c b/fs/ubifs/lpt_commit.c
index 97822db..862c4ca 100644
--- a/fs/ubifs/lpt_commit.c
+++ b/fs/ubifs/lpt_commit.c
@@ -320,9 +320,8 @@ static int layout_cnodes(struct ubifs_info *c)
 	return 0;
 
 no_space:
-	ubifs_err("LPT out of space");
-	dbg_err("LPT out of space at LEB %d:%d needing %d, done_ltab %d, "
-		"done_lsave %d", lnum, offs, len, done_ltab, done_lsave);
+	ubifs_err("LPT out of space at LEB %d:%d needing %d, done_ltab %d, "
+		  "done_lsave %d", lnum, offs, len, done_ltab, done_lsave);
 	ubifs_dump_lpt_info(c);
 	ubifs_dump_lpt_lebs(c);
 	dump_stack();
@@ -548,9 +547,8 @@ static int write_cnodes(struct ubifs_info *c)
 	return 0;
 
 no_space:
-	ubifs_err("LPT out of space mismatch");
-	dbg_err("LPT out of space mismatch at LEB %d:%d needing %d, done_ltab "
-		"%d, done_lsave %d", lnum, offs, len, done_ltab, done_lsave);
+	ubifs_err("LPT out of space mismatch at LEB %d:%d needing %d, done_ltab "
+		  "%d, done_lsave %d", lnum, offs, len, done_ltab, done_lsave);
 	ubifs_dump_lpt_info(c);
 	ubifs_dump_lpt_lebs(c);
 	dump_stack();
@@ -1733,7 +1731,7 @@ int dbg_check_ltab(struct ubifs_info *c)
 	for (lnum = c->lpt_first; lnum <= c->lpt_last; lnum++) {
 		err = dbg_check_ltab_lnum(c, lnum);
 		if (err) {
-			dbg_err("failed at LEB %d", lnum);
+			ubifs_err("failed at LEB %d", lnum);
 			return err;
 		}
 	}
@@ -1765,8 +1763,8 @@ int dbg_chk_lpt_free_spc(struct ubifs_info *c)
 			free += c->leb_size;
 	}
 	if (free < c->lpt_sz) {
-		dbg_err("LPT space error: free %lld lpt_sz %lld",
-			free, c->lpt_sz);
+		ubifs_err("LPT space error: free %lld lpt_sz %lld",
+			  free, c->lpt_sz);
 		ubifs_dump_lpt_info(c);
 		ubifs_dump_lpt_lebs(c);
 		dump_stack();
@@ -1805,13 +1803,13 @@ int dbg_chk_lpt_sz(struct ubifs_info *c, int action, int len)
 		d->chk_lpt_lebs = 0;
 		d->chk_lpt_wastage = 0;
 		if (c->dirty_pn_cnt > c->pnode_cnt) {
-			dbg_err("dirty pnodes %d exceed max %d",
-				c->dirty_pn_cnt, c->pnode_cnt);
+			ubifs_err("dirty pnodes %d exceed max %d",
+				  c->dirty_pn_cnt, c->pnode_cnt);
 			err = -EINVAL;
 		}
 		if (c->dirty_nn_cnt > c->nnode_cnt) {
-			dbg_err("dirty nnodes %d exceed max %d",
-				c->dirty_nn_cnt, c->nnode_cnt);
+			ubifs_err("dirty nnodes %d exceed max %d",
+				  c->dirty_nn_cnt, c->nnode_cnt);
 			err = -EINVAL;
 		}
 		return err;
@@ -1828,23 +1826,23 @@ int dbg_chk_lpt_sz(struct ubifs_info *c, int action, int len)
 		chk_lpt_sz *= d->chk_lpt_lebs;
 		chk_lpt_sz += len - c->nhead_offs;
 		if (d->chk_lpt_sz != chk_lpt_sz) {
-			dbg_err("LPT wrote %lld but space used was %lld",
-				d->chk_lpt_sz, chk_lpt_sz);
+			ubifs_err("LPT wrote %lld but space used was %lld",
+				  d->chk_lpt_sz, chk_lpt_sz);
 			err = -EINVAL;
 		}
 		if (d->chk_lpt_sz > c->lpt_sz) {
-			dbg_err("LPT wrote %lld but lpt_sz is %lld",
-				d->chk_lpt_sz, c->lpt_sz);
+			ubifs_err("LPT wrote %lld but lpt_sz is %lld",
+				  d->chk_lpt_sz, c->lpt_sz);
 			err = -EINVAL;
 		}
 		if (d->chk_lpt_sz2 && d->chk_lpt_sz != d->chk_lpt_sz2) {
-			dbg_err("LPT layout size %lld but wrote %lld",
-				d->chk_lpt_sz, d->chk_lpt_sz2);
+			ubifs_err("LPT layout size %lld but wrote %lld",
+				  d->chk_lpt_sz, d->chk_lpt_sz2);
 			err = -EINVAL;
 		}
 		if (d->chk_lpt_sz2 && d->new_nhead_offs != len) {
-			dbg_err("LPT new nhead offs: expected %d was %d",
-				d->new_nhead_offs, len);
+			ubifs_err("LPT new nhead offs: expected %d was %d",
+				  d->new_nhead_offs, len);
 			err = -EINVAL;
 		}
 		lpt_sz = (long long)c->pnode_cnt * c->pnode_sz;
@@ -1853,8 +1851,8 @@ int dbg_chk_lpt_sz(struct ubifs_info *c, int action, int len)
 		if (c->big_lpt)
 			lpt_sz += c->lsave_sz;
 		if (d->chk_lpt_sz - d->chk_lpt_wastage > lpt_sz) {
-			dbg_err("LPT chk_lpt_sz %lld + waste %lld exceeds %lld",
-				d->chk_lpt_sz, d->chk_lpt_wastage, lpt_sz);
+			ubifs_err("LPT chk_lpt_sz %lld + waste %lld exceeds %lld",
+				  d->chk_lpt_sz, d->chk_lpt_wastage, lpt_sz);
 			err = -EINVAL;
 		}
 		if (err) {
diff --git a/fs/ubifs/orphan.c b/fs/ubifs/orphan.c
index 97ad042..95155cc 100644
--- a/fs/ubifs/orphan.c
+++ b/fs/ubifs/orphan.c
@@ -88,7 +88,7 @@ int ubifs_add_orphan(struct ubifs_info *c, ino_t inum)
 		else if (inum > o->inum)
 			p = &(*p)->rb_right;
 		else {
-			dbg_err("orphaned twice");
+			ubifs_err("orphaned twice");
 			spin_unlock(&c->orphan_lock);
 			kfree(orphan);
 			return 0;
@@ -154,7 +154,7 @@ void ubifs_delete_orphan(struct ubifs_info *c, ino_t inum)
 		}
 	}
 	spin_unlock(&c->orphan_lock);
-	dbg_err("missing orphan ino %lu", (unsigned long)inum);
+	ubifs_err("missing orphan ino %lu", (unsigned long)inum);
 	dump_stack();
 }
 
diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
index bbeab61..01a348d 100644
--- a/fs/ubifs/recovery.c
+++ b/fs/ubifs/recovery.c
@@ -362,11 +362,11 @@ out_err:
 out_free:
 	ubifs_err("failed to recover master node");
 	if (mst1) {
-		dbg_err("dumping first master node");
+		ubifs_err("dumping first master node");
 		ubifs_dump_node(c, mst1);
 	}
 	if (mst2) {
-		dbg_err("dumping second master node");
+		ubifs_err("dumping second master node");
 		ubifs_dump_node(c, mst2);
 	}
 	vfree(buf2);
@@ -683,7 +683,7 @@ struct ubifs_scan_leb *ubifs_recover_leb(struct ubifs_info *c, int lnum,
 				  ret, lnum, offs);
 			break;
 		} else {
-			dbg_err("unexpected return value %d", ret);
+			ubifs_err("unexpected return value %d", ret);
 			err = -EINVAL;
 			goto error;
 		}
@@ -789,7 +789,7 @@ struct ubifs_scan_leb *ubifs_recover_leb(struct ubifs_info *c, int lnum,
 
 corrupted_rescan:
 	/* Re-scan the corrupted data with verbose messages */
-	dbg_err("corruptio %d", ret);
+	ubifs_err("corruptio %d", ret);
 	ubifs_scan_a_node(c, buf, len, lnum, offs, 1);
 corrupted:
 	ubifs_scanned_corruption(c, lnum, offs, buf);
@@ -827,17 +827,17 @@ static int get_cs_sqnum(struct ubifs_info *c, int lnum, int offs,
 		goto out_free;
 	ret = ubifs_scan_a_node(c, cs_node, UBIFS_CS_NODE_SZ, lnum, offs, 0);
 	if (ret != SCANNED_A_NODE) {
-		dbg_err("Not a valid node");
+		ubifs_err("Not a valid node");
 		goto out_err;
 	}
 	if (cs_node->ch.node_type != UBIFS_CS_NODE) {
-		dbg_err("Node a CS node, type is %d", cs_node->ch.node_type);
+		ubifs_err("Node a CS node, type is %d", cs_node->ch.node_type);
 		goto out_err;
 	}
 	if (le64_to_cpu(cs_node->cmt_no) != c->cmt_no) {
-		dbg_err("CS node cmt_no %llu != current cmt_no %llu",
-			(unsigned long long)le64_to_cpu(cs_node->cmt_no),
-			c->cmt_no);
+		ubifs_err("CS node cmt_no %llu != current cmt_no %llu",
+			  (unsigned long long)le64_to_cpu(cs_node->cmt_no),
+			  c->cmt_no);
 		goto out_err;
 	}
 	*cs_sqnum = le64_to_cpu(cs_node->ch.sqnum);
@@ -1138,7 +1138,7 @@ static int grab_empty_leb(struct ubifs_info *c)
 	 */
 	lnum = ubifs_find_free_leb_for_idx(c);
 	if (lnum < 0) {
-		dbg_err("could not find an empty LEB");
+		ubifs_err("could not find an empty LEB");
 		ubifs_dump_lprops(c);
 		ubifs_dump_budg(c, &c->bi);
 		return lnum;
@@ -1218,7 +1218,7 @@ int ubifs_rcvry_gc_commit(struct ubifs_info *c)
 	}
 	mutex_unlock(&wbuf->io_mutex);
 	if (err < 0) {
-		dbg_err("GC failed, error %d", err);
+		ubifs_err("GC failed, error %d", err);
 		if (err == -EAGAIN)
 			err = -EINVAL;
 		return err;
diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index 6ce2596..2a2e3ee 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -861,16 +861,16 @@ static int replay_log_leb(struct ubifs_info *c, int lnum, int offs, void *sbuf)
 		 * numbers.
 		 */
 		if (snod->type != UBIFS_CS_NODE) {
-			dbg_err("first log node at LEB %d:%d is not CS node",
-				lnum, offs);
+			ubifs_err("first log node at LEB %d:%d is not CS node",
+				  lnum, offs);
 			goto out_dump;
 		}
 		if (le64_to_cpu(node->cmt_no) != c->cmt_no) {
-			dbg_err("first CS node at LEB %d:%d has wrong "
-				"commit number %llu expected %llu",
-				lnum, offs,
-				(unsigned long long)le64_to_cpu(node->cmt_no),
-				c->cmt_no);
+			ubifs_err("first CS node at LEB %d:%d has wrong "
+				  "commit number %llu expected %llu",
+				  lnum, offs,
+				  (unsigned long long)le64_to_cpu(node->cmt_no),
+				  c->cmt_no);
 			goto out_dump;
 		}
 
@@ -892,7 +892,7 @@ static int replay_log_leb(struct ubifs_info *c, int lnum, int offs, void *sbuf)
 
 	/* Make sure the first node sits at offset zero of the LEB */
 	if (snod->offs != 0) {
-		dbg_err("first node is not at zero offset");
+		ubifs_err("first node is not at zero offset");
 		goto out_dump;
 	}
 
@@ -905,8 +905,8 @@ static int replay_log_leb(struct ubifs_info *c, int lnum, int offs, void *sbuf)
 		}
 
 		if (snod->sqnum < c->cs_sqnum) {
-			dbg_err("bad sqnum %llu, commit sqnum %llu",
-				snod->sqnum, c->cs_sqnum);
+			ubifs_err("bad sqnum %llu, commit sqnum %llu",
+				  snod->sqnum, c->cs_sqnum);
 			goto out_dump;
 		}
 
diff --git a/fs/ubifs/scan.c b/fs/ubifs/scan.c
index ec82a68..7c40e60 100644
--- a/fs/ubifs/scan.c
+++ b/fs/ubifs/scan.c
@@ -109,8 +109,8 @@ int ubifs_scan_a_node(const struct ubifs_info *c, void *buf, int len, int lnum,
 		/* Make the node pads to 8-byte boundary */
 		if ((node_len + pad_len) & 7) {
 			if (!quiet)
-				dbg_err("bad padding length %d - %d",
-					offs, offs + node_len + pad_len);
+				ubifs_err("bad padding length %d - %d",
+					  offs, offs + node_len + pad_len);
 			return SCANNED_A_BAD_PAD_NODE;
 		}
 
@@ -245,7 +245,7 @@ void ubifs_scanned_corruption(const struct ubifs_info *c, int lnum, int offs,
 	len = c->leb_size - offs;
 	if (len > 8192)
 		len = 8192;
-	dbg_err("first %d bytes from LEB %d:%d", len, lnum, offs);
+	ubifs_err("first %d bytes from LEB %d:%d", len, lnum, offs);
 	print_hex_dump(KERN_DEBUG, "", DUMP_PREFIX_OFFSET, 32, 4, buf, len, 1);
 }
 
@@ -300,16 +300,16 @@ struct ubifs_scan_leb *ubifs_scan(const struct ubifs_info *c, int lnum,
 
 		switch (ret) {
 		case SCANNED_GARBAGE:
-			dbg_err("garbage");
+			ubifs_err("garbage");
 			goto corrupted;
 		case SCANNED_A_NODE:
 			break;
 		case SCANNED_A_CORRUPT_NODE:
 		case SCANNED_A_BAD_PAD_NODE:
-			dbg_err("bad node");
+			ubifs_err("bad node");
 			goto corrupted;
 		default:
-			dbg_err("unknown");
+			ubifs_err("unknown");
 			err = -EINVAL;
 			goto error;
 		}
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 147b7ac..5b30c4d 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -668,8 +668,8 @@ static int init_constants_sb(struct ubifs_info *c)
 	tmp = UBIFS_CS_NODE_SZ + UBIFS_REF_NODE_SZ * c->jhead_cnt;
 	tmp = ALIGN(tmp, c->min_io_size);
 	if (tmp > c->leb_size) {
-		dbg_err("too small LEB size %d, at least %d needed",
-			c->leb_size, tmp);
+		ubifs_err("too small LEB size %d, at least %d needed",
+			  c->leb_size, tmp);
 		return -EINVAL;
 	}
 
@@ -683,8 +683,8 @@ static int init_constants_sb(struct ubifs_info *c)
 	tmp /= c->leb_size;
 	tmp += 1;
 	if (c->log_lebs < tmp) {
-		dbg_err("too small log %d LEBs, required min. %d LEBs",
-			c->log_lebs, tmp);
+		ubifs_err("too small log %d LEBs, required min. %d LEBs",
+			  c->log_lebs, tmp);
 		return -EINVAL;
 	}
 
@@ -863,7 +863,7 @@ static void free_orphans(struct ubifs_info *c)
 		orph = list_entry(c->orph_list.next, struct ubifs_orphan, list);
 		list_del(&orph->list);
 		kfree(orph);
-		dbg_err("orphan list not empty at unmount");
+		ubifs_err("orphan list not empty at unmount");
 	}
 
 	vfree(c->orph_buf);
@@ -2126,8 +2126,8 @@ static struct dentry *ubifs_mount(struct file_system_type *fs_type, int flags,
 	 */
 	ubi = open_ubi(name, UBI_READONLY);
 	if (IS_ERR(ubi)) {
-		dbg_err("cannot open \"%s\", error %d",
-			name, (int)PTR_ERR(ubi));
+		ubifs_err("cannot open \"%s\", error %d",
+			  name, (int)PTR_ERR(ubi));
 		return ERR_CAST(ubi);
 	}
 
diff --git a/fs/ubifs/tnc_misc.c b/fs/ubifs/tnc_misc.c
index 15212d6..d38ac7f 100644
--- a/fs/ubifs/tnc_misc.c
+++ b/fs/ubifs/tnc_misc.c
@@ -293,10 +293,10 @@ static int read_znode(struct ubifs_info *c, int lnum, int offs, int len,
 		lnum, offs, znode->level, znode->child_cnt);
 
 	if (znode->child_cnt > c->fanout || znode->level > UBIFS_MAX_LEVELS) {
-		dbg_err("current fanout %d, branch count %d",
-			c->fanout, znode->child_cnt);
-		dbg_err("max levels %d, znode level %d",
-			UBIFS_MAX_LEVELS, znode->level);
+		ubifs_err("current fanout %d, branch count %d",
+			  c->fanout, znode->child_cnt);
+		ubifs_err("max levels %d, znode level %d",
+			  UBIFS_MAX_LEVELS, znode->level);
 		err = 1;
 		goto out_dump;
 	}
@@ -316,7 +316,7 @@ static int read_znode(struct ubifs_info *c, int lnum, int offs, int len,
 		if (zbr->lnum < c->main_first ||
 		    zbr->lnum >= c->leb_cnt || zbr->offs < 0 ||
 		    zbr->offs + zbr->len > c->leb_size || zbr->offs & 7) {
-			dbg_err("bad branch %d", i);
+			ubifs_err("bad branch %d", i);
 			err = 2;
 			goto out_dump;
 		}
@@ -340,19 +340,19 @@ static int read_znode(struct ubifs_info *c, int lnum, int offs, int len,
 		type = key_type(c, &zbr->key);
 		if (c->ranges[type].max_len == 0) {
 			if (zbr->len != c->ranges[type].len) {
-				dbg_err("bad target node (type %d) length (%d)",
-					type, zbr->len);
-				dbg_err("have to be %d", c->ranges[type].len);
+				ubifs_err("bad target node (type %d) length (%d)",
+					  type, zbr->len);
+				ubifs_err("have to be %d", c->ranges[type].len);
 				err = 4;
 				goto out_dump;
 			}
 		} else if (zbr->len < c->ranges[type].min_len ||
 			   zbr->len > c->ranges[type].max_len) {
-			dbg_err("bad target node (type %d) length (%d)",
-				type, zbr->len);
-			dbg_err("have to be in range of %d-%d",
-				c->ranges[type].min_len,
-				c->ranges[type].max_len);
+			ubifs_err("bad target node (type %d) length (%d)",
+				  type, zbr->len);
+			ubifs_err("have to be in range of %d-%d",
+				  c->ranges[type].min_len,
+				  c->ranges[type].max_len);
 			err = 5;
 			goto out_dump;
 		}
@@ -370,13 +370,13 @@ static int read_znode(struct ubifs_info *c, int lnum, int offs, int len,
 
 		cmp = keys_cmp(c, key1, key2);
 		if (cmp > 0) {
-			dbg_err("bad key order (keys %d and %d)", i, i + 1);
+			ubifs_err("bad key order (keys %d and %d)", i, i + 1);
 			err = 6;
 			goto out_dump;
 		} else if (cmp == 0 && !is_hash_key(c, key1)) {
 			/* These can only be keys with colliding hash */
-			dbg_err("keys %d and %d are not hashed but equivalent",
-				i, i + 1);
+			ubifs_err("keys %d and %d are not hashed but equivalent",
+				  i, i + 1);
 			err = 7;
 			goto out_dump;
 		}
diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index 85b2722..fd4ac85 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -399,8 +399,8 @@ ssize_t ubifs_getxattr(struct dentry *dentry, const char *name, void *buf,
 	if (buf) {
 		/* If @buf is %NULL we are supposed to return the length */
 		if (ui->data_len > size) {
-			dbg_err("buffer size %zd, xattr len %d",
-				size, ui->data_len);
+			ubifs_err("buffer size %zd, xattr len %d",
+				  size, ui->data_len);
 			err = -ERANGE;
 			goto out_iput;
 		}
-- 
1.7.10
