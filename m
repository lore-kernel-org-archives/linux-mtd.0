Received: from szxga01-in.huawei.com ([58.251.152.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YYv4E-0006wG-RT
 for linux-mtd@lists.infradead.org; Fri, 20 Mar 2015 11:26:31 +0000
From: Sheng Yong <shengyong1@huawei.com>
To: <linux-mtd@lists.infradead.org>
Subject: [RFC PATCH] UBIFS: extend debug/message capabilities
Date: Fri, 20 Mar 2015 11:24:58 +0000
Message-ID: <1426850698-226162-1-git-send-email-shengyong1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In the case where we have more than one volumes on different UBI
devices, it may be not that easy to tell which volume prints the
messages.  Add ubi number and volume id in ubifs_msg/warn/error
to help debug. These two values are passed by struct ubifs_info.

For those where ubifs_info is not initialized yet, ubifs_* is
replaced by pr_*. For those where ubifs_info is not avaliable,
ubifs_info is passed to the calling function as a const parameter.

The output looks like,

[   95.444879] UBIFS (ubi0:1): background thread "ubifs_bgt0_1" started, PID 696
[   95.484688] UBIFS (ubi0:1): UBIFS: mounted UBI device 0, volume 1, name "test1"
[   95.484694] UBIFS (ubi0:1): LEB size: 126976 bytes (124 KiB), min./max. I/O unit sizes: 2048 bytes/2048 bytes
[   95.484699] UBIFS (ubi0:1): FS size: 30220288 bytes (28 MiB, 238 LEBs), journal size 1523712 bytes (1 MiB, 12 LEBs)
[   95.484703] UBIFS (ubi0:1): reserved for root: 1427378 bytes (1393 KiB)
[   95.484709] UBIFS (ubi0:1): media format: w4/r0 (latest is w4/r0), UUID 40DFFC0E-70BE-4193-8905-F7D6DFE60B17, small LPT model
[   95.489875] UBIFS (ubi1:0): background thread "ubifs_bgt1_0" started, PID 699
[   95.529713] UBIFS (ubi1:0): UBIFS: mounted UBI device 1, volume 0, name "test2"
[   95.529718] UBIFS (ubi1:0): LEB size: 126976 bytes (124 KiB), min./max. I/O unit sizes: 2048 bytes/2048 bytes
[   95.529724] UBIFS (ubi1:0): FS size: 19808256 bytes (18 MiB, 156 LEBs), journal size 1015809 bytes (0 MiB, 8 LEBs)
[   95.529727] UBIFS (ubi1:0): reserved for root: 935592 bytes (913 KiB)
[   95.529733] UBIFS (ubi1:0): media format: w4/r0 (latest is w4/r0), UUID EEB7779D-F419-4CA9-811B-831CAC7233D4, small LPT model

[  954.264767] UBIFS error (ubi1:0 pid 756): ubifs_read_node: bad node type (255 but expected 6)
[  954.367030] UBIFS error (ubi1:0 pid 756): ubifs_read_node: bad node at LEB 0:0, LEB mapping status 1

Signed-off-by: Sheng Yong <shengyong1@huawei.com>
---
 fs/ubifs/budget.c     |   2 +-
 fs/ubifs/commit.c     |  12 ++--
 fs/ubifs/compress.c   |  22 +++---
 fs/ubifs/debug.c      | 186 +++++++++++++++++++++++++-------------------------
 fs/ubifs/dir.c        |  12 ++--
 fs/ubifs/file.c       |  17 ++---
 fs/ubifs/io.c         |  40 +++++------
 fs/ubifs/ioctl.c      |   2 +-
 fs/ubifs/journal.c    |  17 ++---
 fs/ubifs/log.c        |   4 +-
 fs/ubifs/lprops.c     |  62 ++++++++---------
 fs/ubifs/lpt.c        |  59 ++++++++--------
 fs/ubifs/lpt_commit.c |  34 ++++-----
 fs/ubifs/master.c     |   6 +-
 fs/ubifs/orphan.c     |  26 +++----
 fs/ubifs/recovery.c   |  34 ++++-----
 fs/ubifs/replay.c     |  34 ++++-----
 fs/ubifs/sb.c         |  30 ++++----
 fs/ubifs/scan.c       |  24 +++----
 fs/ubifs/super.c      | 105 ++++++++++++++--------------
 fs/ubifs/tnc.c        |  20 +++---
 fs/ubifs/tnc_commit.c |  12 ++--
 fs/ubifs/tnc_misc.c   |  24 +++----
 fs/ubifs/ubifs.h      |  26 ++++---
 fs/ubifs/xattr.c      |  18 ++---
 25 files changed, 419 insertions(+), 409 deletions(-)

diff --git a/fs/ubifs/budget.c b/fs/ubifs/budget.c
index eb997e9..11a11b3 100644
--- a/fs/ubifs/budget.c
+++ b/fs/ubifs/budget.c
@@ -509,7 +509,7 @@ again:
 			c->bi.nospace_rp = 1;
 		smp_wmb();
 	} else
-		ubifs_err("cannot budget space, error %d", err);
+		ubifs_err(c, "cannot budget space, error %d", err);
 	return err;
 }
 
diff --git a/fs/ubifs/commit.c b/fs/ubifs/commit.c
index 26b69b2..63f5661 100644
--- a/fs/ubifs/commit.c
+++ b/fs/ubifs/commit.c
@@ -225,7 +225,7 @@ out_cancel:
 out_up:
 	up_write(&c->commit_sem);
 out:
-	ubifs_err("commit failed, error %d", err);
+	ubifs_err(c, "commit failed, error %d", err);
 	spin_lock(&c->cs_lock);
 	c->cmt_state = COMMIT_BROKEN;
 	wake_up(&c->cmt_wq);
@@ -289,7 +289,7 @@ int ubifs_bg_thread(void *info)
 	int err;
 	struct ubifs_info *c = info;
 
-	ubifs_msg("background thread \"%s\" started, PID %d",
+	ubifs_msg(c, "background thread \"%s\" started, PID %d",
 		  c->bgt_name, current->pid);
 	set_freezable();
 
@@ -324,7 +324,7 @@ int ubifs_bg_thread(void *info)
 		cond_resched();
 	}
 
-	ubifs_msg("background thread \"%s\" stops", c->bgt_name);
+	ubifs_msg(c, "background thread \"%s\" stops", c->bgt_name);
 	return 0;
 }
 
@@ -712,13 +712,13 @@ out:
 	return 0;
 
 out_dump:
-	ubifs_err("dumping index node (iip=%d)", i->iip);
+	ubifs_err(c, "dumping index node (iip=%d)", i->iip);
 	ubifs_dump_node(c, idx);
 	list_del(&i->list);
 	kfree(i);
 	if (!list_empty(&list)) {
 		i = list_entry(list.prev, struct idx_node, list);
-		ubifs_err("dumping parent index node");
+		ubifs_err(c, "dumping parent index node");
 		ubifs_dump_node(c, &i->idx);
 	}
 out_free:
@@ -727,7 +727,7 @@ out_free:
 		list_del(&i->list);
 		kfree(i);
 	}
-	ubifs_err("failed, error %d", err);
+	ubifs_err(c, "failed, error %d", err);
 	if (err > 0)
 		err = -EINVAL;
 	return err;
diff --git a/fs/ubifs/compress.c b/fs/ubifs/compress.c
index 2bfa095..565cb56 100644
--- a/fs/ubifs/compress.c
+++ b/fs/ubifs/compress.c
@@ -92,8 +92,8 @@ struct ubifs_compressor *ubifs_compressors[UBIFS_COMPR_TYPES_CNT];
  * Note, if the input buffer was not compressed, it is copied to the output
  * buffer and %UBIFS_COMPR_NONE is returned in @compr_type.
  */
-void ubifs_compress(const void *in_buf, int in_len, void *out_buf, int *out_len,
-		    int *compr_type)
+void ubifs_compress(const struct ubifs_info *c, const void *in_buf,
+		    int in_len, void *out_buf, int *out_len, int *compr_type)
 {
 	int err;
 	struct ubifs_compressor *compr = ubifs_compressors[*compr_type];
@@ -112,9 +112,9 @@ void ubifs_compress(const void *in_buf, int in_len, void *out_buf, int *out_len,
 	if (compr->comp_mutex)
 		mutex_unlock(compr->comp_mutex);
 	if (unlikely(err)) {
-		ubifs_warn("cannot compress %d bytes, compressor %s, error %d, leave data uncompressed",
+		ubifs_warn(c, "cannot compress %d bytes, compressor %s, error %d, leave data uncompressed",
 			   in_len, compr->name, err);
-		 goto no_compr;
+		goto no_compr;
 	}
 
 	/*
@@ -144,21 +144,21 @@ no_compr:
  * The length of the uncompressed data is returned in @out_len. This functions
  * returns %0 on success or a negative error code on failure.
  */
-int ubifs_decompress(const void *in_buf, int in_len, void *out_buf,
-		     int *out_len, int compr_type)
+int ubifs_decompress(const struct ubifs_info *c, const void *in_buf,
+		     int in_len, void *out_buf, int *out_len, int compr_type)
 {
 	int err;
 	struct ubifs_compressor *compr;
 
 	if (unlikely(compr_type < 0 || compr_type >= UBIFS_COMPR_TYPES_CNT)) {
-		ubifs_err("invalid compression type %d", compr_type);
+		ubifs_err(c, "invalid compression type %d", compr_type);
 		return -EINVAL;
 	}
 
 	compr = ubifs_compressors[compr_type];
 
 	if (unlikely(!compr->capi_name)) {
-		ubifs_err("%s compression is not compiled in", compr->name);
+		ubifs_err(c, "%s compression is not compiled in", compr->name);
 		return -EINVAL;
 	}
 
@@ -175,7 +175,7 @@ int ubifs_decompress(const void *in_buf, int in_len, void *out_buf,
 	if (compr->decomp_mutex)
 		mutex_unlock(compr->decomp_mutex);
 	if (err)
-		ubifs_err("cannot decompress %d bytes, compressor %s, error %d",
+		ubifs_err(c, "cannot decompress %d bytes, compressor %s, error %d",
 			  in_len, compr->name, err);
 
 	return err;
@@ -193,8 +193,8 @@ static int __init compr_init(struct ubifs_compressor *compr)
 	if (compr->capi_name) {
 		compr->cc = crypto_alloc_comp(compr->capi_name, 0, 0);
 		if (IS_ERR(compr->cc)) {
-			ubifs_err("cannot initialize compressor %s, error %ld",
-				  compr->name, PTR_ERR(compr->cc));
+			pr_err("UBIFS error (pid %d): cannot initialize compressor %s, error %ld",
+			       current->pid, compr->name, PTR_ERR(compr->cc));
 			return PTR_ERR(compr->cc);
 		}
 	}
diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 4cfb3e8..4c46a98 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -746,7 +746,7 @@ void ubifs_dump_lprops(struct ubifs_info *c)
 	for (lnum = c->main_first; lnum < c->leb_cnt; lnum++) {
 		err = ubifs_read_one_lp(c, lnum, &lp);
 		if (err) {
-			ubifs_err("cannot read lprops for LEB %d", lnum);
+			ubifs_err(c, "cannot read lprops for LEB %d", lnum);
 			continue;
 		}
 
@@ -819,13 +819,13 @@ void ubifs_dump_leb(const struct ubifs_info *c, int lnum)
 
 	buf = __vmalloc(c->leb_size, GFP_NOFS, PAGE_KERNEL);
 	if (!buf) {
-		ubifs_err("cannot allocate memory for dumping LEB %d", lnum);
+		ubifs_err(c, "cannot allocate memory for dumping LEB %d", lnum);
 		return;
 	}
 
 	sleb = ubifs_scan(c, lnum, 0, buf, 0);
 	if (IS_ERR(sleb)) {
-		ubifs_err("scan error %d", (int)PTR_ERR(sleb));
+		ubifs_err(c, "scan error %d", (int)PTR_ERR(sleb));
 		goto out;
 	}
 
@@ -1032,7 +1032,7 @@ int dbg_check_space_info(struct ubifs_info *c)
 	spin_unlock(&c->space_lock);
 
 	if (free != d->saved_free) {
-		ubifs_err("free space changed from %lld to %lld",
+		ubifs_err(c, "free space changed from %lld to %lld",
 			  d->saved_free, free);
 		goto out;
 	}
@@ -1040,15 +1040,15 @@ int dbg_check_space_info(struct ubifs_info *c)
 	return 0;
 
 out:
-	ubifs_msg("saved lprops statistics dump");
+	ubifs_msg(c, "saved lprops statistics dump");
 	ubifs_dump_lstats(&d->saved_lst);
-	ubifs_msg("saved budgeting info dump");
+	ubifs_msg(c, "saved budgeting info dump");
 	ubifs_dump_budg(c, &d->saved_bi);
-	ubifs_msg("saved idx_gc_cnt %d", d->saved_idx_gc_cnt);
-	ubifs_msg("current lprops statistics dump");
+	ubifs_msg(c, "saved idx_gc_cnt %d", d->saved_idx_gc_cnt);
+	ubifs_msg(c, "current lprops statistics dump");
 	ubifs_get_lp_stats(c, &lst);
 	ubifs_dump_lstats(&lst);
-	ubifs_msg("current budgeting info dump");
+	ubifs_msg(c, "current budgeting info dump");
 	ubifs_dump_budg(c, &c->bi);
 	dump_stack();
 	return -EINVAL;
@@ -1077,9 +1077,9 @@ int dbg_check_synced_i_size(const struct ubifs_info *c, struct inode *inode)
 	mutex_lock(&ui->ui_mutex);
 	spin_lock(&ui->ui_lock);
 	if (ui->ui_size != ui->synced_i_size && !ui->dirty) {
-		ubifs_err("ui_size is %lld, synced_i_size is %lld, but inode is clean",
+		ubifs_err(c, "ui_size is %lld, synced_i_size is %lld, but inode is clean",
 			  ui->ui_size, ui->synced_i_size);
-		ubifs_err("i_ino %lu, i_mode %#x, i_size %lld", inode->i_ino,
+		ubifs_err(c, "i_ino %lu, i_mode %#x, i_size %lld", inode->i_ino,
 			  inode->i_mode, i_size_read(inode));
 		dump_stack();
 		err = -EINVAL;
@@ -1140,7 +1140,7 @@ int dbg_check_dir(struct ubifs_info *c, const struct inode *dir)
 	kfree(pdent);
 
 	if (i_size_read(dir) != size) {
-		ubifs_err("directory inode %lu has size %llu, but calculated size is %llu",
+		ubifs_err(c, "directory inode %lu has size %llu, but calculated size is %llu",
 			  dir->i_ino, (unsigned long long)i_size_read(dir),
 			  (unsigned long long)size);
 		ubifs_dump_inode(c, dir);
@@ -1148,7 +1148,7 @@ int dbg_check_dir(struct ubifs_info *c, const struct inode *dir)
 		return -EINVAL;
 	}
 	if (dir->i_nlink != nlink) {
-		ubifs_err("directory inode %lu has nlink %u, but calculated nlink is %u",
+		ubifs_err(c, "directory inode %lu has nlink %u, but calculated nlink is %u",
 			  dir->i_ino, dir->i_nlink, nlink);
 		ubifs_dump_inode(c, dir);
 		dump_stack();
@@ -1207,10 +1207,10 @@ static int dbg_check_key_order(struct ubifs_info *c, struct ubifs_zbranch *zbr1,
 	err = 1;
 	key_read(c, &dent1->key, &key);
 	if (keys_cmp(c, &zbr1->key, &key)) {
-		ubifs_err("1st entry at %d:%d has key %s", zbr1->lnum,
+		ubifs_err(c, "1st entry at %d:%d has key %s", zbr1->lnum,
 			  zbr1->offs, dbg_snprintf_key(c, &key, key_buf,
 						       DBG_KEY_BUF_LEN));
-		ubifs_err("but it should have key %s according to tnc",
+		ubifs_err(c, "but it should have key %s according to tnc",
 			  dbg_snprintf_key(c, &zbr1->key, key_buf,
 					   DBG_KEY_BUF_LEN));
 		ubifs_dump_node(c, dent1);
@@ -1219,10 +1219,10 @@ static int dbg_check_key_order(struct ubifs_info *c, struct ubifs_zbranch *zbr1,
 
 	key_read(c, &dent2->key, &key);
 	if (keys_cmp(c, &zbr2->key, &key)) {
-		ubifs_err("2nd entry at %d:%d has key %s", zbr1->lnum,
+		ubifs_err(c, "2nd entry at %d:%d has key %s", zbr1->lnum,
 			  zbr1->offs, dbg_snprintf_key(c, &key, key_buf,
 						       DBG_KEY_BUF_LEN));
-		ubifs_err("but it should have key %s according to tnc",
+		ubifs_err(c, "but it should have key %s according to tnc",
 			  dbg_snprintf_key(c, &zbr2->key, key_buf,
 					   DBG_KEY_BUF_LEN));
 		ubifs_dump_node(c, dent2);
@@ -1238,14 +1238,14 @@ static int dbg_check_key_order(struct ubifs_info *c, struct ubifs_zbranch *zbr1,
 		goto out_free;
 	}
 	if (cmp == 0 && nlen1 == nlen2)
-		ubifs_err("2 xent/dent nodes with the same name");
+		ubifs_err(c, "2 xent/dent nodes with the same name");
 	else
-		ubifs_err("bad order of colliding key %s",
+		ubifs_err(c, "bad order of colliding key %s",
 			  dbg_snprintf_key(c, &key, key_buf, DBG_KEY_BUF_LEN));
 
-	ubifs_msg("first node at %d:%d\n", zbr1->lnum, zbr1->offs);
+	ubifs_msg(c, "first node at %d:%d\n", zbr1->lnum, zbr1->offs);
 	ubifs_dump_node(c, dent1);
-	ubifs_msg("second node at %d:%d\n", zbr2->lnum, zbr2->offs);
+	ubifs_msg(c, "second node at %d:%d\n", zbr2->lnum, zbr2->offs);
 	ubifs_dump_node(c, dent2);
 
 out_free:
@@ -1447,11 +1447,11 @@ static int dbg_check_znode(struct ubifs_info *c, struct ubifs_zbranch *zbr)
 	return 0;
 
 out:
-	ubifs_err("failed, error %d", err);
-	ubifs_msg("dump of the znode");
+	ubifs_err(c, "failed, error %d", err);
+	ubifs_msg(c, "dump of the znode");
 	ubifs_dump_znode(c, znode);
 	if (zp) {
-		ubifs_msg("dump of the parent znode");
+		ubifs_msg(c, "dump of the parent znode");
 		ubifs_dump_znode(c, zp);
 	}
 	dump_stack();
@@ -1518,9 +1518,9 @@ int dbg_check_tnc(struct ubifs_info *c, int extra)
 			if (err < 0)
 				return err;
 			if (err) {
-				ubifs_msg("first znode");
+				ubifs_msg(c, "first znode");
 				ubifs_dump_znode(c, prev);
-				ubifs_msg("second znode");
+				ubifs_msg(c, "second znode");
 				ubifs_dump_znode(c, znode);
 				return -EINVAL;
 			}
@@ -1529,13 +1529,13 @@ int dbg_check_tnc(struct ubifs_info *c, int extra)
 
 	if (extra) {
 		if (clean_cnt != atomic_long_read(&c->clean_zn_cnt)) {
-			ubifs_err("incorrect clean_zn_cnt %ld, calculated %ld",
+			ubifs_err(c, "incorrect clean_zn_cnt %ld, calculated %ld",
 				  atomic_long_read(&c->clean_zn_cnt),
 				  clean_cnt);
 			return -EINVAL;
 		}
 		if (dirty_cnt != atomic_long_read(&c->dirty_zn_cnt)) {
-			ubifs_err("incorrect dirty_zn_cnt %ld, calculated %ld",
+			ubifs_err(c, "incorrect dirty_zn_cnt %ld, calculated %ld",
 				  atomic_long_read(&c->dirty_zn_cnt),
 				  dirty_cnt);
 			return -EINVAL;
@@ -1608,7 +1608,7 @@ int dbg_walk_index(struct ubifs_info *c, dbg_leaf_callback leaf_cb,
 		if (znode_cb) {
 			err = znode_cb(c, znode, priv);
 			if (err) {
-				ubifs_err("znode checking function returned error %d",
+				ubifs_err(c, "znode checking function returned error %d",
 					  err);
 				ubifs_dump_znode(c, znode);
 				goto out_dump;
@@ -1619,7 +1619,7 @@ int dbg_walk_index(struct ubifs_info *c, dbg_leaf_callback leaf_cb,
 				zbr = &znode->zbranch[idx];
 				err = leaf_cb(c, zbr, priv);
 				if (err) {
-					ubifs_err("leaf checking function returned error %d, for leaf at LEB %d:%d",
+					ubifs_err(c, "leaf checking function returned error %d, for leaf at LEB %d:%d",
 						  err, zbr->lnum, zbr->offs);
 					goto out_dump;
 				}
@@ -1675,7 +1675,7 @@ out_dump:
 		zbr = &znode->parent->zbranch[znode->iip];
 	else
 		zbr = &c->zroot;
-	ubifs_msg("dump of znode at LEB %d:%d", zbr->lnum, zbr->offs);
+	ubifs_msg(c, "dump of znode at LEB %d:%d", zbr->lnum, zbr->offs);
 	ubifs_dump_znode(c, znode);
 out_unlock:
 	mutex_unlock(&c->tnc_mutex);
@@ -1722,12 +1722,12 @@ int dbg_check_idx_size(struct ubifs_info *c, long long idx_size)
 
 	err = dbg_walk_index(c, NULL, add_size, &calc);
 	if (err) {
-		ubifs_err("error %d while walking the index", err);
+		ubifs_err(c, "error %d while walking the index", err);
 		return err;
 	}
 
 	if (calc != idx_size) {
-		ubifs_err("index size check failed: calculated size is %lld, should be %lld",
+		ubifs_err(c, "index size check failed: calculated size is %lld, should be %lld",
 			  calc, idx_size);
 		dump_stack();
 		return -EINVAL;
@@ -1814,7 +1814,7 @@ static struct fsck_inode *add_inode(struct ubifs_info *c,
 	}
 
 	if (inum > c->highest_inum) {
-		ubifs_err("too high inode number, max. is %lu",
+		ubifs_err(c, "too high inode number, max. is %lu",
 			  (unsigned long)c->highest_inum);
 		return ERR_PTR(-EINVAL);
 	}
@@ -1921,17 +1921,17 @@ static struct fsck_inode *read_add_inode(struct ubifs_info *c,
 	ino_key_init(c, &key, inum);
 	err = ubifs_lookup_level0(c, &key, &znode, &n);
 	if (!err) {
-		ubifs_err("inode %lu not found in index", (unsigned long)inum);
+		ubifs_err(c, "inode %lu not found in index", (unsigned long)inum);
 		return ERR_PTR(-ENOENT);
 	} else if (err < 0) {
-		ubifs_err("error %d while looking up inode %lu",
+		ubifs_err(c, "error %d while looking up inode %lu",
 			  err, (unsigned long)inum);
 		return ERR_PTR(err);
 	}
 
 	zbr = &znode->zbranch[n];
 	if (zbr->len < UBIFS_INO_NODE_SZ) {
-		ubifs_err("bad node %lu node length %d",
+		ubifs_err(c, "bad node %lu node length %d",
 			  (unsigned long)inum, zbr->len);
 		return ERR_PTR(-EINVAL);
 	}
@@ -1942,7 +1942,7 @@ static struct fsck_inode *read_add_inode(struct ubifs_info *c,
 
 	err = ubifs_tnc_read_node(c, zbr, ino);
 	if (err) {
-		ubifs_err("cannot read inode node at LEB %d:%d, error %d",
+		ubifs_err(c, "cannot read inode node at LEB %d:%d, error %d",
 			  zbr->lnum, zbr->offs, err);
 		kfree(ino);
 		return ERR_PTR(err);
@@ -1951,7 +1951,7 @@ static struct fsck_inode *read_add_inode(struct ubifs_info *c,
 	fscki = add_inode(c, fsckd, ino);
 	kfree(ino);
 	if (IS_ERR(fscki)) {
-		ubifs_err("error %ld while adding inode %lu node",
+		ubifs_err(c, "error %ld while adding inode %lu node",
 			  PTR_ERR(fscki), (unsigned long)inum);
 		return fscki;
 	}
@@ -1985,7 +1985,7 @@ static int check_leaf(struct ubifs_info *c, struct ubifs_zbranch *zbr,
 	struct fsck_inode *fscki;
 
 	if (zbr->len < UBIFS_CH_SZ) {
-		ubifs_err("bad leaf length %d (LEB %d:%d)",
+		ubifs_err(c, "bad leaf length %d (LEB %d:%d)",
 			  zbr->len, zbr->lnum, zbr->offs);
 		return -EINVAL;
 	}
@@ -1996,7 +1996,7 @@ static int check_leaf(struct ubifs_info *c, struct ubifs_zbranch *zbr,
 
 	err = ubifs_tnc_read_node(c, zbr, node);
 	if (err) {
-		ubifs_err("cannot read leaf node at LEB %d:%d, error %d",
+		ubifs_err(c, "cannot read leaf node at LEB %d:%d, error %d",
 			  zbr->lnum, zbr->offs, err);
 		goto out_free;
 	}
@@ -2006,7 +2006,7 @@ static int check_leaf(struct ubifs_info *c, struct ubifs_zbranch *zbr,
 		fscki = add_inode(c, priv, node);
 		if (IS_ERR(fscki)) {
 			err = PTR_ERR(fscki);
-			ubifs_err("error %d while adding inode node", err);
+			ubifs_err(c, "error %d while adding inode node", err);
 			goto out_dump;
 		}
 		goto out;
@@ -2014,7 +2014,7 @@ static int check_leaf(struct ubifs_info *c, struct ubifs_zbranch *zbr,
 
 	if (type != UBIFS_DENT_KEY && type != UBIFS_XENT_KEY &&
 	    type != UBIFS_DATA_KEY) {
-		ubifs_err("unexpected node type %d at LEB %d:%d",
+		ubifs_err(c, "unexpected node type %d at LEB %d:%d",
 			  type, zbr->lnum, zbr->offs);
 		err = -EINVAL;
 		goto out_free;
@@ -2022,7 +2022,7 @@ static int check_leaf(struct ubifs_info *c, struct ubifs_zbranch *zbr,
 
 	ch = node;
 	if (le64_to_cpu(ch->sqnum) > c->max_sqnum) {
-		ubifs_err("too high sequence number, max. is %llu",
+		ubifs_err(c, "too high sequence number, max. is %llu",
 			  c->max_sqnum);
 		err = -EINVAL;
 		goto out_dump;
@@ -2042,7 +2042,7 @@ static int check_leaf(struct ubifs_info *c, struct ubifs_zbranch *zbr,
 		fscki = read_add_inode(c, priv, inum);
 		if (IS_ERR(fscki)) {
 			err = PTR_ERR(fscki);
-			ubifs_err("error %d while processing data node and trying to find inode node %lu",
+			ubifs_err(c, "error %d while processing data node and trying to find inode node %lu",
 				  err, (unsigned long)inum);
 			goto out_dump;
 		}
@@ -2052,7 +2052,7 @@ static int check_leaf(struct ubifs_info *c, struct ubifs_zbranch *zbr,
 		blk_offs <<= UBIFS_BLOCK_SHIFT;
 		blk_offs += le32_to_cpu(dn->size);
 		if (blk_offs > fscki->size) {
-			ubifs_err("data node at LEB %d:%d is not within inode size %lld",
+			ubifs_err(c, "data node at LEB %d:%d is not within inode size %lld",
 				  zbr->lnum, zbr->offs, fscki->size);
 			err = -EINVAL;
 			goto out_dump;
@@ -2076,7 +2076,7 @@ static int check_leaf(struct ubifs_info *c, struct ubifs_zbranch *zbr,
 		fscki = read_add_inode(c, priv, inum);
 		if (IS_ERR(fscki)) {
 			err = PTR_ERR(fscki);
-			ubifs_err("error %d while processing entry node and trying to find inode node %lu",
+			ubifs_err(c, "error %d while processing entry node and trying to find inode node %lu",
 				  err, (unsigned long)inum);
 			goto out_dump;
 		}
@@ -2088,7 +2088,7 @@ static int check_leaf(struct ubifs_info *c, struct ubifs_zbranch *zbr,
 		fscki1 = read_add_inode(c, priv, inum);
 		if (IS_ERR(fscki1)) {
 			err = PTR_ERR(fscki1);
-			ubifs_err("error %d while processing entry node and trying to find parent inode node %lu",
+			ubifs_err(c, "error %d while processing entry node and trying to find parent inode node %lu",
 				  err, (unsigned long)inum);
 			goto out_dump;
 		}
@@ -2111,7 +2111,7 @@ out:
 	return 0;
 
 out_dump:
-	ubifs_msg("dump of node at LEB %d:%d", zbr->lnum, zbr->offs);
+	ubifs_msg(c, "dump of node at LEB %d:%d", zbr->lnum, zbr->offs);
 	ubifs_dump_node(c, node);
 out_free:
 	kfree(node);
@@ -2162,52 +2162,52 @@ static int check_inodes(struct ubifs_info *c, struct fsck_data *fsckd)
 			 */
 			if (fscki->inum != UBIFS_ROOT_INO &&
 			    fscki->references != 1) {
-				ubifs_err("directory inode %lu has %d direntries which refer it, but should be 1",
+				ubifs_err(c, "directory inode %lu has %d direntries which refer it, but should be 1",
 					  (unsigned long)fscki->inum,
 					  fscki->references);
 				goto out_dump;
 			}
 			if (fscki->inum == UBIFS_ROOT_INO &&
 			    fscki->references != 0) {
-				ubifs_err("root inode %lu has non-zero (%d) direntries which refer it",
+				ubifs_err(c, "root inode %lu has non-zero (%d) direntries which refer it",
 					  (unsigned long)fscki->inum,
 					  fscki->references);
 				goto out_dump;
 			}
 			if (fscki->calc_sz != fscki->size) {
-				ubifs_err("directory inode %lu size is %lld, but calculated size is %lld",
+				ubifs_err(c, "directory inode %lu size is %lld, but calculated size is %lld",
 					  (unsigned long)fscki->inum,
 					  fscki->size, fscki->calc_sz);
 				goto out_dump;
 			}
 			if (fscki->calc_cnt != fscki->nlink) {
-				ubifs_err("directory inode %lu nlink is %d, but calculated nlink is %d",
+				ubifs_err(c, "directory inode %lu nlink is %d, but calculated nlink is %d",
 					  (unsigned long)fscki->inum,
 					  fscki->nlink, fscki->calc_cnt);
 				goto out_dump;
 			}
 		} else {
 			if (fscki->references != fscki->nlink) {
-				ubifs_err("inode %lu nlink is %d, but calculated nlink is %d",
+				ubifs_err(c, "inode %lu nlink is %d, but calculated nlink is %d",
 					  (unsigned long)fscki->inum,
 					  fscki->nlink, fscki->references);
 				goto out_dump;
 			}
 		}
 		if (fscki->xattr_sz != fscki->calc_xsz) {
-			ubifs_err("inode %lu has xattr size %u, but calculated size is %lld",
+			ubifs_err(c, "inode %lu has xattr size %u, but calculated size is %lld",
 				  (unsigned long)fscki->inum, fscki->xattr_sz,
 				  fscki->calc_xsz);
 			goto out_dump;
 		}
 		if (fscki->xattr_cnt != fscki->calc_xcnt) {
-			ubifs_err("inode %lu has %u xattrs, but calculated count is %lld",
+			ubifs_err(c, "inode %lu has %u xattrs, but calculated count is %lld",
 				  (unsigned long)fscki->inum,
 				  fscki->xattr_cnt, fscki->calc_xcnt);
 			goto out_dump;
 		}
 		if (fscki->xattr_nms != fscki->calc_xnms) {
-			ubifs_err("inode %lu has xattr names' size %u, but calculated names' size is %lld",
+			ubifs_err(c, "inode %lu has xattr names' size %u, but calculated names' size is %lld",
 				  (unsigned long)fscki->inum, fscki->xattr_nms,
 				  fscki->calc_xnms);
 			goto out_dump;
@@ -2221,11 +2221,11 @@ out_dump:
 	ino_key_init(c, &key, fscki->inum);
 	err = ubifs_lookup_level0(c, &key, &znode, &n);
 	if (!err) {
-		ubifs_err("inode %lu not found in index",
+		ubifs_err(c, "inode %lu not found in index",
 			  (unsigned long)fscki->inum);
 		return -ENOENT;
 	} else if (err < 0) {
-		ubifs_err("error %d while looking up inode %lu",
+		ubifs_err(c, "error %d while looking up inode %lu",
 			  err, (unsigned long)fscki->inum);
 		return err;
 	}
@@ -2237,13 +2237,13 @@ out_dump:
 
 	err = ubifs_tnc_read_node(c, zbr, ino);
 	if (err) {
-		ubifs_err("cannot read inode node at LEB %d:%d, error %d",
+		ubifs_err(c, "cannot read inode node at LEB %d:%d, error %d",
 			  zbr->lnum, zbr->offs, err);
 		kfree(ino);
 		return err;
 	}
 
-	ubifs_msg("dump of the inode %lu sitting in LEB %d:%d",
+	ubifs_msg(c, "dump of the inode %lu sitting in LEB %d:%d",
 		  (unsigned long)fscki->inum, zbr->lnum, zbr->offs);
 	ubifs_dump_node(c, ino);
 	kfree(ino);
@@ -2284,7 +2284,7 @@ int dbg_check_filesystem(struct ubifs_info *c)
 	return 0;
 
 out_free:
-	ubifs_err("file-system check failed with error %d", err);
+	ubifs_err(c, "file-system check failed with error %d", err);
 	dump_stack();
 	free_inodes(&fsckd);
 	return err;
@@ -2315,12 +2315,12 @@ int dbg_check_data_nodes_order(struct ubifs_info *c, struct list_head *head)
 		sb = container_of(cur->next, struct ubifs_scan_node, list);
 
 		if (sa->type != UBIFS_DATA_NODE) {
-			ubifs_err("bad node type %d", sa->type);
+			ubifs_err(c, "bad node type %d", sa->type);
 			ubifs_dump_node(c, sa->node);
 			return -EINVAL;
 		}
 		if (sb->type != UBIFS_DATA_NODE) {
-			ubifs_err("bad node type %d", sb->type);
+			ubifs_err(c, "bad node type %d", sb->type);
 			ubifs_dump_node(c, sb->node);
 			return -EINVAL;
 		}
@@ -2331,7 +2331,7 @@ int dbg_check_data_nodes_order(struct ubifs_info *c, struct list_head *head)
 		if (inuma < inumb)
 			continue;
 		if (inuma > inumb) {
-			ubifs_err("larger inum %lu goes before inum %lu",
+			ubifs_err(c, "larger inum %lu goes before inum %lu",
 				  (unsigned long)inuma, (unsigned long)inumb);
 			goto error_dump;
 		}
@@ -2340,11 +2340,11 @@ int dbg_check_data_nodes_order(struct ubifs_info *c, struct list_head *head)
 		blkb = key_block(c, &sb->key);
 
 		if (blka > blkb) {
-			ubifs_err("larger block %u goes before %u", blka, blkb);
+			ubifs_err(c, "larger block %u goes before %u", blka, blkb);
 			goto error_dump;
 		}
 		if (blka == blkb) {
-			ubifs_err("two data nodes for the same block");
+			ubifs_err(c, "two data nodes for the same block");
 			goto error_dump;
 		}
 	}
@@ -2383,19 +2383,19 @@ int dbg_check_nondata_nodes_order(struct ubifs_info *c, struct list_head *head)
 
 		if (sa->type != UBIFS_INO_NODE && sa->type != UBIFS_DENT_NODE &&
 		    sa->type != UBIFS_XENT_NODE) {
-			ubifs_err("bad node type %d", sa->type);
+			ubifs_err(c, "bad node type %d", sa->type);
 			ubifs_dump_node(c, sa->node);
 			return -EINVAL;
 		}
 		if (sa->type != UBIFS_INO_NODE && sa->type != UBIFS_DENT_NODE &&
 		    sa->type != UBIFS_XENT_NODE) {
-			ubifs_err("bad node type %d", sb->type);
+			ubifs_err(c, "bad node type %d", sb->type);
 			ubifs_dump_node(c, sb->node);
 			return -EINVAL;
 		}
 
 		if (sa->type != UBIFS_INO_NODE && sb->type == UBIFS_INO_NODE) {
-			ubifs_err("non-inode node goes before inode node");
+			ubifs_err(c, "non-inode node goes before inode node");
 			goto error_dump;
 		}
 
@@ -2405,7 +2405,7 @@ int dbg_check_nondata_nodes_order(struct ubifs_info *c, struct list_head *head)
 		if (sa->type == UBIFS_INO_NODE && sb->type == UBIFS_INO_NODE) {
 			/* Inode nodes are sorted in descending size order */
 			if (sa->len < sb->len) {
-				ubifs_err("smaller inode node goes first");
+				ubifs_err(c, "smaller inode node goes first");
 				goto error_dump;
 			}
 			continue;
@@ -2421,7 +2421,7 @@ int dbg_check_nondata_nodes_order(struct ubifs_info *c, struct list_head *head)
 		if (inuma < inumb)
 			continue;
 		if (inuma > inumb) {
-			ubifs_err("larger inum %lu goes before inum %lu",
+			ubifs_err(c, "larger inum %lu goes before inum %lu",
 				  (unsigned long)inuma, (unsigned long)inumb);
 			goto error_dump;
 		}
@@ -2430,7 +2430,7 @@ int dbg_check_nondata_nodes_order(struct ubifs_info *c, struct list_head *head)
 		hashb = key_block(c, &sb->key);
 
 		if (hasha > hashb) {
-			ubifs_err("larger hash %u goes before %u",
+			ubifs_err(c, "larger hash %u goes before %u",
 				  hasha, hashb);
 			goto error_dump;
 		}
@@ -2439,9 +2439,9 @@ int dbg_check_nondata_nodes_order(struct ubifs_info *c, struct list_head *head)
 	return 0;
 
 error_dump:
-	ubifs_msg("dumping first node");
+	ubifs_msg(c, "dumping first node");
 	ubifs_dump_node(c, sa->node);
-	ubifs_msg("dumping second node");
+	ubifs_msg(c, "dumping second node");
 	ubifs_dump_node(c, sb->node);
 	return -EINVAL;
 	return 0;
@@ -2470,13 +2470,13 @@ static int power_cut_emulated(struct ubifs_info *c, int lnum, int write)
 				delay = prandom_u32() % 60000;
 				d->pc_timeout = jiffies;
 				d->pc_timeout += msecs_to_jiffies(delay);
-				ubifs_warn("failing after %lums", delay);
+				ubifs_warn(c, "failing after %lums", delay);
 			} else {
 				d->pc_delay = 2;
 				delay = prandom_u32() % 10000;
 				/* Fail within 10000 operations */
 				d->pc_cnt_max = delay;
-				ubifs_warn("failing after %lu calls", delay);
+				ubifs_warn(c, "failing after %lu calls", delay);
 			}
 		}
 
@@ -2494,55 +2494,55 @@ static int power_cut_emulated(struct ubifs_info *c, int lnum, int write)
 			return 0;
 		if (chance(19, 20))
 			return 0;
-		ubifs_warn("failing in super block LEB %d", lnum);
+		ubifs_warn(c, "failing in super block LEB %d", lnum);
 	} else if (lnum == UBIFS_MST_LNUM || lnum == UBIFS_MST_LNUM + 1) {
 		if (chance(19, 20))
 			return 0;
-		ubifs_warn("failing in master LEB %d", lnum);
+		ubifs_warn(c, "failing in master LEB %d", lnum);
 	} else if (lnum >= UBIFS_LOG_LNUM && lnum <= c->log_last) {
 		if (write && chance(99, 100))
 			return 0;
 		if (chance(399, 400))
 			return 0;
-		ubifs_warn("failing in log LEB %d", lnum);
+		ubifs_warn(c, "failing in log LEB %d", lnum);
 	} else if (lnum >= c->lpt_first && lnum <= c->lpt_last) {
 		if (write && chance(7, 8))
 			return 0;
 		if (chance(19, 20))
 			return 0;
-		ubifs_warn("failing in LPT LEB %d", lnum);
+		ubifs_warn(c, "failing in LPT LEB %d", lnum);
 	} else if (lnum >= c->orph_first && lnum <= c->orph_last) {
 		if (write && chance(1, 2))
 			return 0;
 		if (chance(9, 10))
 			return 0;
-		ubifs_warn("failing in orphan LEB %d", lnum);
+		ubifs_warn(c, "failing in orphan LEB %d", lnum);
 	} else if (lnum == c->ihead_lnum) {
 		if (chance(99, 100))
 			return 0;
-		ubifs_warn("failing in index head LEB %d", lnum);
+		ubifs_warn(c, "failing in index head LEB %d", lnum);
 	} else if (c->jheads && lnum == c->jheads[GCHD].wbuf.lnum) {
 		if (chance(9, 10))
 			return 0;
-		ubifs_warn("failing in GC head LEB %d", lnum);
+		ubifs_warn(c, "failing in GC head LEB %d", lnum);
 	} else if (write && !RB_EMPTY_ROOT(&c->buds) &&
 		   !ubifs_search_bud(c, lnum)) {
 		if (chance(19, 20))
 			return 0;
-		ubifs_warn("failing in non-bud LEB %d", lnum);
+		ubifs_warn(c, "failing in non-bud LEB %d", lnum);
 	} else if (c->cmt_state == COMMIT_RUNNING_BACKGROUND ||
 		   c->cmt_state == COMMIT_RUNNING_REQUIRED) {
 		if (chance(999, 1000))
 			return 0;
-		ubifs_warn("failing in bud LEB %d commit running", lnum);
+		ubifs_warn(c, "failing in bud LEB %d commit running", lnum);
 	} else {
 		if (chance(9999, 10000))
 			return 0;
-		ubifs_warn("failing in bud LEB %d commit not running", lnum);
+		ubifs_warn(c, "failing in bud LEB %d commit not running", lnum);
 	}
 
 	d->pc_happened = 1;
-	ubifs_warn("========== Power cut emulated ==========");
+	ubifs_warn(c, "========== Power cut emulated ==========");
 	dump_stack();
 	return 1;
 }
@@ -2557,7 +2557,7 @@ static int corrupt_data(const struct ubifs_info *c, const void *buf,
 	/* Corruption span max to end of write unit */
 	to = min(len, ALIGN(from + 1, c->max_write_size));
 
-	ubifs_warn("filled bytes %u-%u with %s", from, to - 1,
+	ubifs_warn(c, "filled bytes %u-%u with %s", from, to - 1,
 		   ffs ? "0xFFs" : "random data");
 
 	if (ffs)
@@ -2579,7 +2579,7 @@ int dbg_leb_write(struct ubifs_info *c, int lnum, const void *buf,
 	failing = power_cut_emulated(c, lnum, 1);
 	if (failing) {
 		len = corrupt_data(c, buf, len);
-		ubifs_warn("actually write %d bytes to LEB %d:%d (the buffer was corrupted)",
+		ubifs_warn(c, "actually write %d bytes to LEB %d:%d (the buffer was corrupted)",
 			   len, lnum, offs);
 	}
 	err = ubi_leb_write(c->ubi, lnum, buf, offs, len);
@@ -2909,7 +2909,7 @@ out_remove:
 	debugfs_remove_recursive(d->dfs_dir);
 out:
 	err = dent ? PTR_ERR(dent) : -ENODEV;
-	ubifs_err("cannot create \"%s\" debugfs file or directory, error %d\n",
+	ubifs_err(c, "cannot create \"%s\" debugfs file or directory, error %d\n",
 		  fname, err);
 	return err;
 }
@@ -3063,8 +3063,8 @@ out_remove:
 	debugfs_remove_recursive(dfs_rootdir);
 out:
 	err = dent ? PTR_ERR(dent) : -ENODEV;
-	ubifs_err("cannot create \"%s\" debugfs file or directory, error %d\n",
-		  fname, err);
+	pr_err("UBIFS error (pid %d): cannot create \"%s\" debugfs file or directory, error %d\n",
+	       current->pid, fname, err);
 	return err;
 }
 
diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index f7e8f76..7d62f0d 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -148,12 +148,12 @@ struct inode *ubifs_new_inode(struct ubifs_info *c, const struct inode *dir,
 	if (c->highest_inum >= INUM_WARN_WATERMARK) {
 		if (c->highest_inum >= INUM_WATERMARK) {
 			spin_unlock(&c->cnt_lock);
-			ubifs_err("out of inode numbers");
+			ubifs_err(c, "out of inode numbers");
 			make_bad_inode(inode);
 			iput(inode);
 			return ERR_PTR(-EINVAL);
 		}
-		ubifs_warn("running out of inode numbers (current %lu, max %d)",
+		ubifs_warn(c, "running out of inode numbers (current %lu, max %d)",
 			   (unsigned long)c->highest_inum, INUM_WATERMARK);
 	}
 
@@ -224,7 +224,7 @@ static struct dentry *ubifs_lookup(struct inode *dir, struct dentry *dentry,
 		 * checking.
 		 */
 		err = PTR_ERR(inode);
-		ubifs_err("dead directory entry '%pd', error %d",
+		ubifs_err(c, "dead directory entry '%pd', error %d",
 			  dentry, err);
 		ubifs_ro_mode(c, err);
 		goto out;
@@ -298,7 +298,7 @@ out_cancel:
 	iput(inode);
 out_budg:
 	ubifs_release_budget(c, &req);
-	ubifs_err("cannot create regular file, error %d", err);
+	ubifs_err(c, "cannot create regular file, error %d", err);
 	return err;
 }
 
@@ -451,7 +451,7 @@ static int ubifs_readdir(struct file *file, struct dir_context *ctx)
 
 out:
 	if (err != -ENOENT) {
-		ubifs_err("cannot find next direntry, error %d", err);
+		ubifs_err(c, "cannot find next direntry, error %d", err);
 		return err;
 	}
 
@@ -745,7 +745,7 @@ static int ubifs_mkdir(struct inode *dir, struct dentry *dentry, umode_t mode)
 	dir->i_mtime = dir->i_ctime = inode->i_ctime;
 	err = ubifs_jnl_update(c, dir, &dentry->d_name, inode, 0, 0);
 	if (err) {
-		ubifs_err("cannot create directory, error %d", err);
+		ubifs_err(c, "cannot create directory, error %d", err);
 		goto out_cancel;
 	}
 	mutex_unlock(&dir_ui->ui_mutex);
diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 4855abc..79bfc92 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -80,7 +80,7 @@ static int read_block(struct inode *inode, void *addr, unsigned int block,
 
 	dlen = le32_to_cpu(dn->ch.len) - UBIFS_DATA_NODE_SZ;
 	out_len = UBIFS_BLOCK_SIZE;
-	err = ubifs_decompress(&dn->data, dlen, addr, &out_len,
+	err = ubifs_decompress(c, &dn->data, dlen, addr, &out_len,
 			       le16_to_cpu(dn->compr_type));
 	if (err || len != out_len)
 		goto dump;
@@ -96,7 +96,7 @@ static int read_block(struct inode *inode, void *addr, unsigned int block,
 	return 0;
 
 dump:
-	ubifs_err("bad data node (block %u, inode %lu)",
+	ubifs_err(c, "bad data node (block %u, inode %lu)",
 		  block, inode->i_ino);
 	ubifs_dump_node(c, dn);
 	return -EINVAL;
@@ -161,13 +161,14 @@ static int do_readpage(struct page *page)
 		addr += UBIFS_BLOCK_SIZE;
 	}
 	if (err) {
+		struct ubifs_info *c = inode->i_sb->s_fs_info;
 		if (err == -ENOENT) {
 			/* Not found, so it must be a hole */
 			SetPageChecked(page);
 			dbg_gen("hole");
 			goto out_free;
 		}
-		ubifs_err("cannot read page %lu of inode %lu, error %d",
+		ubifs_err(c, "cannot read page %lu of inode %lu, error %d",
 			  page->index, inode->i_ino, err);
 		goto error;
 	}
@@ -650,7 +651,7 @@ static int populate_page(struct ubifs_info *c, struct page *page,
 
 			dlen = le32_to_cpu(dn->ch.len) - UBIFS_DATA_NODE_SZ;
 			out_len = UBIFS_BLOCK_SIZE;
-			err = ubifs_decompress(&dn->data, dlen, addr, &out_len,
+			err = ubifs_decompress(c, &dn->data, dlen, addr, &out_len,
 					       le16_to_cpu(dn->compr_type));
 			if (err || len != out_len)
 				goto out_err;
@@ -698,7 +699,7 @@ out_err:
 	SetPageError(page);
 	flush_dcache_page(page);
 	kunmap(page);
-	ubifs_err("bad data node (block %u, inode %lu)",
+	ubifs_err(c, "bad data node (block %u, inode %lu)",
 		  page_block, inode->i_ino);
 	return -EINVAL;
 }
@@ -802,7 +803,7 @@ out_free:
 	return ret;
 
 out_warn:
-	ubifs_warn("ignoring error %d and skipping bulk-read", err);
+	ubifs_warn(c, "ignoring error %d and skipping bulk-read", err);
 	goto out_free;
 
 out_bu_off:
@@ -930,7 +931,7 @@ static int do_writepage(struct page *page, int len)
 	}
 	if (err) {
 		SetPageError(page);
-		ubifs_err("cannot write page %lu of inode %lu, error %d",
+		ubifs_err(c, "cannot write page %lu of inode %lu, error %d",
 			  page->index, inode->i_ino, err);
 		ubifs_ro_mode(c, err);
 	}
@@ -1485,7 +1486,7 @@ static int ubifs_vm_page_mkwrite(struct vm_area_struct *vma,
 	err = ubifs_budget_space(c, &req);
 	if (unlikely(err)) {
 		if (err == -ENOSPC)
-			ubifs_warn("out of space for mmapped file (inode number %lu)",
+			ubifs_warn(c, "out of space for mmapped file (inode number %lu)",
 				   inode->i_ino);
 		return VM_FAULT_SIGBUS;
 	}
diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
index fb08b0c..97be412 100644
--- a/fs/ubifs/io.c
+++ b/fs/ubifs/io.c
@@ -85,7 +85,7 @@ void ubifs_ro_mode(struct ubifs_info *c, int err)
 		c->ro_error = 1;
 		c->no_chk_data_crc = 0;
 		c->vfs_sb->s_flags |= MS_RDONLY;
-		ubifs_warn("switched to read-only mode, error %d", err);
+		ubifs_warn(c, "switched to read-only mode, error %d", err);
 		dump_stack();
 	}
 }
@@ -107,7 +107,7 @@ int ubifs_leb_read(const struct ubifs_info *c, int lnum, void *buf, int offs,
 	 * @even_ebadmsg is true.
 	 */
 	if (err && (err != -EBADMSG || even_ebadmsg)) {
-		ubifs_err("reading %d bytes from LEB %d:%d failed, error %d",
+		ubifs_err(c, "reading %d bytes from LEB %d:%d failed, error %d",
 			  len, lnum, offs, err);
 		dump_stack();
 	}
@@ -127,7 +127,7 @@ int ubifs_leb_write(struct ubifs_info *c, int lnum, const void *buf, int offs,
 	else
 		err = dbg_leb_write(c, lnum, buf, offs, len);
 	if (err) {
-		ubifs_err("writing %d bytes to LEB %d:%d failed, error %d",
+		ubifs_err(c, "writing %d bytes to LEB %d:%d failed, error %d",
 			  len, lnum, offs, err);
 		ubifs_ro_mode(c, err);
 		dump_stack();
@@ -147,7 +147,7 @@ int ubifs_leb_change(struct ubifs_info *c, int lnum, const void *buf, int len)
 	else
 		err = dbg_leb_change(c, lnum, buf, len);
 	if (err) {
-		ubifs_err("changing %d bytes in LEB %d failed, error %d",
+		ubifs_err(c, "changing %d bytes in LEB %d failed, error %d",
 			  len, lnum, err);
 		ubifs_ro_mode(c, err);
 		dump_stack();
@@ -167,7 +167,7 @@ int ubifs_leb_unmap(struct ubifs_info *c, int lnum)
 	else
 		err = dbg_leb_unmap(c, lnum);
 	if (err) {
-		ubifs_err("unmap LEB %d failed, error %d", lnum, err);
+		ubifs_err(c, "unmap LEB %d failed, error %d", lnum, err);
 		ubifs_ro_mode(c, err);
 		dump_stack();
 	}
@@ -186,7 +186,7 @@ int ubifs_leb_map(struct ubifs_info *c, int lnum)
 	else
 		err = dbg_leb_map(c, lnum);
 	if (err) {
-		ubifs_err("mapping LEB %d failed, error %d", lnum, err);
+		ubifs_err(c, "mapping LEB %d failed, error %d", lnum, err);
 		ubifs_ro_mode(c, err);
 		dump_stack();
 	}
@@ -199,7 +199,7 @@ int ubifs_is_mapped(const struct ubifs_info *c, int lnum)
 
 	err = ubi_is_mapped(c->ubi, lnum);
 	if (err < 0) {
-		ubifs_err("ubi_is_mapped failed for LEB %d, error %d",
+		ubifs_err(c, "ubi_is_mapped failed for LEB %d, error %d",
 			  lnum, err);
 		dump_stack();
 	}
@@ -247,7 +247,7 @@ int ubifs_check_node(const struct ubifs_info *c, const void *buf, int lnum,
 	magic = le32_to_cpu(ch->magic);
 	if (magic != UBIFS_NODE_MAGIC) {
 		if (!quiet)
-			ubifs_err("bad magic %#08x, expected %#08x",
+			ubifs_err(c, "bad magic %#08x, expected %#08x",
 				  magic, UBIFS_NODE_MAGIC);
 		err = -EUCLEAN;
 		goto out;
@@ -256,7 +256,7 @@ int ubifs_check_node(const struct ubifs_info *c, const void *buf, int lnum,
 	type = ch->node_type;
 	if (type < 0 || type >= UBIFS_NODE_TYPES_CNT) {
 		if (!quiet)
-			ubifs_err("bad node type %d", type);
+			ubifs_err(c, "bad node type %d", type);
 		goto out;
 	}
 
@@ -279,7 +279,7 @@ int ubifs_check_node(const struct ubifs_info *c, const void *buf, int lnum,
 	node_crc = le32_to_cpu(ch->crc);
 	if (crc != node_crc) {
 		if (!quiet)
-			ubifs_err("bad CRC: calculated %#08x, read %#08x",
+			ubifs_err(c, "bad CRC: calculated %#08x, read %#08x",
 				  crc, node_crc);
 		err = -EUCLEAN;
 		goto out;
@@ -289,10 +289,10 @@ int ubifs_check_node(const struct ubifs_info *c, const void *buf, int lnum,
 
 out_len:
 	if (!quiet)
-		ubifs_err("bad node length %d", node_len);
+		ubifs_err(c, "bad node length %d", node_len);
 out:
 	if (!quiet) {
-		ubifs_err("bad node at LEB %d:%d", lnum, offs);
+		ubifs_err(c, "bad node at LEB %d:%d", lnum, offs);
 		ubifs_dump_node(c, buf);
 		dump_stack();
 	}
@@ -355,11 +355,11 @@ static unsigned long long next_sqnum(struct ubifs_info *c)
 
 	if (unlikely(sqnum >= SQNUM_WARN_WATERMARK)) {
 		if (sqnum >= SQNUM_WATERMARK) {
-			ubifs_err("sequence number overflow %llu, end of life",
+			ubifs_err(c, "sequence number overflow %llu, end of life",
 				  sqnum);
 			ubifs_ro_mode(c, -EINVAL);
 		}
-		ubifs_warn("running out of sequence numbers, end of life soon");
+		ubifs_warn(c, "running out of sequence numbers, end of life soon");
 	}
 
 	return sqnum;
@@ -636,7 +636,7 @@ int ubifs_bg_wbufs_sync(struct ubifs_info *c)
 		err = ubifs_wbuf_sync_nolock(wbuf);
 		mutex_unlock(&wbuf->io_mutex);
 		if (err) {
-			ubifs_err("cannot sync write-buffer, error %d", err);
+			ubifs_err(c, "cannot sync write-buffer, error %d", err);
 			ubifs_ro_mode(c, err);
 			goto out_timers;
 		}
@@ -833,7 +833,7 @@ exit:
 	return 0;
 
 out:
-	ubifs_err("cannot write %d bytes to LEB %d:%d, error %d",
+	ubifs_err(c, "cannot write %d bytes to LEB %d:%d, error %d",
 		  len, wbuf->lnum, wbuf->offs, err);
 	ubifs_dump_node(c, buf);
 	dump_stack();
@@ -932,27 +932,27 @@ int ubifs_read_node_wbuf(struct ubifs_wbuf *wbuf, void *buf, int type, int len,
 	}
 
 	if (type != ch->node_type) {
-		ubifs_err("bad node type (%d but expected %d)",
+		ubifs_err(c, "bad node type (%d but expected %d)",
 			  ch->node_type, type);
 		goto out;
 	}
 
 	err = ubifs_check_node(c, buf, lnum, offs, 0, 0);
 	if (err) {
-		ubifs_err("expected node type %d", type);
+		ubifs_err(c, "expected node type %d", type);
 		return err;
 	}
 
 	rlen = le32_to_cpu(ch->len);
 	if (rlen != len) {
-		ubifs_err("bad node length %d, expected %d", rlen, len);
+		ubifs_err(c, "bad node length %d, expected %d", rlen, len);
 		goto out;
 	}
 
 	return 0;
 
 out:
-	ubifs_err("bad node at LEB %d:%d", lnum, offs);
+	ubifs_err(c, "bad node at LEB %d:%d", lnum, offs);
 	ubifs_dump_node(c, buf);
 	dump_stack();
 	return -EINVAL;
diff --git a/fs/ubifs/ioctl.c b/fs/ubifs/ioctl.c
index 648b143..3c7b29d 100644
--- a/fs/ubifs/ioctl.c
+++ b/fs/ubifs/ioctl.c
@@ -138,7 +138,7 @@ static int setflags(struct inode *inode, int flags)
 	return err;
 
 out_unlock:
-	ubifs_err("can't modify inode %lu attributes", inode->i_ino);
+	ubifs_err(c, "can't modify inode %lu attributes", inode->i_ino);
 	mutex_unlock(&ui->ui_mutex);
 	ubifs_release_budget(c, &req);
 	return err;
diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index f6ac3f2..90ae1a8 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -363,11 +363,11 @@ again:
 		 * This should not happen unless the journal size limitations
 		 * are too tough.
 		 */
-		ubifs_err("stuck in space allocation");
+		ubifs_err(c, "stuck in space allocation");
 		err = -ENOSPC;
 		goto out;
 	} else if (cmt_retries > 32)
-		ubifs_warn("too many space allocation re-tries (%d)",
+		ubifs_warn(c, "too many space allocation re-tries (%d)",
 			   cmt_retries);
 
 	dbg_jnl("-EAGAIN, commit and retry (retried %d times)",
@@ -380,7 +380,7 @@ again:
 	goto again;
 
 out:
-	ubifs_err("cannot reserve %d bytes in jhead %d, error %d",
+	ubifs_err(c, "cannot reserve %d bytes in jhead %d, error %d",
 		  len, jhead, err);
 	if (err == -ENOSPC) {
 		/* This are some budgeting problems, print useful information */
@@ -731,7 +731,7 @@ int ubifs_jnl_write_data(struct ubifs_info *c, const struct inode *inode,
 		compr_type = ui->compr_type;
 
 	out_len = dlen - UBIFS_DATA_NODE_SZ;
-	ubifs_compress(buf, len, &data->data, &out_len, &compr_type);
+	ubifs_compress(c, buf, len, &data->data, &out_len, &compr_type);
 	ubifs_assert(out_len <= UBIFS_BLOCK_SIZE);
 
 	dlen = UBIFS_DATA_NODE_SZ + out_len;
@@ -1100,7 +1100,8 @@ out_free:
  * This function is used when an inode is truncated and the last data node of
  * the inode has to be re-compressed and re-written.
  */
-static int recomp_data_node(struct ubifs_data_node *dn, int *new_len)
+static int recomp_data_node(const struct ubifs_info *c,
+			    struct ubifs_data_node *dn, int *new_len)
 {
 	void *buf;
 	int err, len, compr_type, out_len;
@@ -1112,11 +1113,11 @@ static int recomp_data_node(struct ubifs_data_node *dn, int *new_len)
 
 	len = le32_to_cpu(dn->ch.len) - UBIFS_DATA_NODE_SZ;
 	compr_type = le16_to_cpu(dn->compr_type);
-	err = ubifs_decompress(&dn->data, len, buf, &out_len, compr_type);
+	err = ubifs_decompress(c, &dn->data, len, buf, &out_len, compr_type);
 	if (err)
 		goto out;
 
-	ubifs_compress(buf, *new_len, &dn->data, &out_len, &compr_type);
+	ubifs_compress(c, buf, *new_len, &dn->data, &out_len, &compr_type);
 	ubifs_assert(out_len <= UBIFS_BLOCK_SIZE);
 	dn->compr_type = cpu_to_le16(compr_type);
 	dn->size = cpu_to_le32(*new_len);
@@ -1191,7 +1192,7 @@ int ubifs_jnl_truncate(struct ubifs_info *c, const struct inode *inode,
 				int compr_type = le16_to_cpu(dn->compr_type);
 
 				if (compr_type != UBIFS_COMPR_NONE) {
-					err = recomp_data_node(dn, &dlen);
+					err = recomp_data_node(c, dn, &dlen);
 					if (err)
 						goto out_free;
 				} else {
diff --git a/fs/ubifs/log.c b/fs/ubifs/log.c
index c14628f..8c795e6 100644
--- a/fs/ubifs/log.c
+++ b/fs/ubifs/log.c
@@ -696,7 +696,7 @@ int ubifs_consolidate_log(struct ubifs_info *c)
 	destroy_done_tree(&done_tree);
 	vfree(buf);
 	if (write_lnum == c->lhead_lnum) {
-		ubifs_err("log is too full");
+		ubifs_err(c, "log is too full");
 		return -EINVAL;
 	}
 	/* Unmap remaining LEBs */
@@ -743,7 +743,7 @@ static int dbg_check_bud_bytes(struct ubifs_info *c)
 			bud_bytes += c->leb_size - bud->start;
 
 	if (c->bud_bytes != bud_bytes) {
-		ubifs_err("bad bud_bytes %lld, calculated %lld",
+		ubifs_err(c, "bad bud_bytes %lld, calculated %lld",
 			  c->bud_bytes, bud_bytes);
 		err = -EINVAL;
 	}
diff --git a/fs/ubifs/lprops.c b/fs/ubifs/lprops.c
index 46190a7..a0011aa 100644
--- a/fs/ubifs/lprops.c
+++ b/fs/ubifs/lprops.c
@@ -682,7 +682,7 @@ int ubifs_change_one_lp(struct ubifs_info *c, int lnum, int free, int dirty,
 out:
 	ubifs_release_lprops(c);
 	if (err)
-		ubifs_err("cannot change properties of LEB %d, error %d",
+		ubifs_err(c, "cannot change properties of LEB %d, error %d",
 			  lnum, err);
 	return err;
 }
@@ -721,7 +721,7 @@ int ubifs_update_one_lp(struct ubifs_info *c, int lnum, int free, int dirty,
 out:
 	ubifs_release_lprops(c);
 	if (err)
-		ubifs_err("cannot update properties of LEB %d, error %d",
+		ubifs_err(c, "cannot update properties of LEB %d, error %d",
 			  lnum, err);
 	return err;
 }
@@ -746,7 +746,7 @@ int ubifs_read_one_lp(struct ubifs_info *c, int lnum, struct ubifs_lprops *lp)
 	lpp = ubifs_lpt_lookup(c, lnum);
 	if (IS_ERR(lpp)) {
 		err = PTR_ERR(lpp);
-		ubifs_err("cannot read properties of LEB %d, error %d",
+		ubifs_err(c, "cannot read properties of LEB %d, error %d",
 			  lnum, err);
 		goto out;
 	}
@@ -873,13 +873,13 @@ int dbg_check_cats(struct ubifs_info *c)
 
 	list_for_each_entry(lprops, &c->empty_list, list) {
 		if (lprops->free != c->leb_size) {
-			ubifs_err("non-empty LEB %d on empty list (free %d dirty %d flags %d)",
+			ubifs_err(c, "non-empty LEB %d on empty list (free %d dirty %d flags %d)",
 				  lprops->lnum, lprops->free, lprops->dirty,
 				  lprops->flags);
 			return -EINVAL;
 		}
 		if (lprops->flags & LPROPS_TAKEN) {
-			ubifs_err("taken LEB %d on empty list (free %d dirty %d flags %d)",
+			ubifs_err(c, "taken LEB %d on empty list (free %d dirty %d flags %d)",
 				  lprops->lnum, lprops->free, lprops->dirty,
 				  lprops->flags);
 			return -EINVAL;
@@ -889,13 +889,13 @@ int dbg_check_cats(struct ubifs_info *c)
 	i = 0;
 	list_for_each_entry(lprops, &c->freeable_list, list) {
 		if (lprops->free + lprops->dirty != c->leb_size) {
-			ubifs_err("non-freeable LEB %d on freeable list (free %d dirty %d flags %d)",
+			ubifs_err(c, "non-freeable LEB %d on freeable list (free %d dirty %d flags %d)",
 				  lprops->lnum, lprops->free, lprops->dirty,
 				  lprops->flags);
 			return -EINVAL;
 		}
 		if (lprops->flags & LPROPS_TAKEN) {
-			ubifs_err("taken LEB %d on freeable list (free %d dirty %d flags %d)",
+			ubifs_err(c, "taken LEB %d on freeable list (free %d dirty %d flags %d)",
 				  lprops->lnum, lprops->free, lprops->dirty,
 				  lprops->flags);
 			return -EINVAL;
@@ -903,7 +903,7 @@ int dbg_check_cats(struct ubifs_info *c)
 		i += 1;
 	}
 	if (i != c->freeable_cnt) {
-		ubifs_err("freeable list count %d expected %d", i,
+		ubifs_err(c, "freeable list count %d expected %d", i,
 			  c->freeable_cnt);
 		return -EINVAL;
 	}
@@ -912,26 +912,26 @@ int dbg_check_cats(struct ubifs_info *c)
 	list_for_each(pos, &c->idx_gc)
 		i += 1;
 	if (i != c->idx_gc_cnt) {
-		ubifs_err("idx_gc list count %d expected %d", i,
+		ubifs_err(c, "idx_gc list count %d expected %d", i,
 			  c->idx_gc_cnt);
 		return -EINVAL;
 	}
 
 	list_for_each_entry(lprops, &c->frdi_idx_list, list) {
 		if (lprops->free + lprops->dirty != c->leb_size) {
-			ubifs_err("non-freeable LEB %d on frdi_idx list (free %d dirty %d flags %d)",
+			ubifs_err(c, "non-freeable LEB %d on frdi_idx list (free %d dirty %d flags %d)",
 				  lprops->lnum, lprops->free, lprops->dirty,
 				  lprops->flags);
 			return -EINVAL;
 		}
 		if (lprops->flags & LPROPS_TAKEN) {
-			ubifs_err("taken LEB %d on frdi_idx list (free %d dirty %d flags %d)",
+			ubifs_err(c, "taken LEB %d on frdi_idx list (free %d dirty %d flags %d)",
 				  lprops->lnum, lprops->free, lprops->dirty,
 				  lprops->flags);
 			return -EINVAL;
 		}
 		if (!(lprops->flags & LPROPS_INDEX)) {
-			ubifs_err("non-index LEB %d on frdi_idx list (free %d dirty %d flags %d)",
+			ubifs_err(c, "non-index LEB %d on frdi_idx list (free %d dirty %d flags %d)",
 				  lprops->lnum, lprops->free, lprops->dirty,
 				  lprops->flags);
 			return -EINVAL;
@@ -944,15 +944,15 @@ int dbg_check_cats(struct ubifs_info *c)
 		for (i = 0; i < heap->cnt; i++) {
 			lprops = heap->arr[i];
 			if (!lprops) {
-				ubifs_err("null ptr in LPT heap cat %d", cat);
+				ubifs_err(c, "null ptr in LPT heap cat %d", cat);
 				return -EINVAL;
 			}
 			if (lprops->hpos != i) {
-				ubifs_err("bad ptr in LPT heap cat %d", cat);
+				ubifs_err(c, "bad ptr in LPT heap cat %d", cat);
 				return -EINVAL;
 			}
 			if (lprops->flags & LPROPS_TAKEN) {
-				ubifs_err("taken LEB in LPT heap cat %d", cat);
+				ubifs_err(c, "taken LEB in LPT heap cat %d", cat);
 				return -EINVAL;
 			}
 		}
@@ -988,7 +988,7 @@ void dbg_check_heap(struct ubifs_info *c, struct ubifs_lpt_heap *heap, int cat,
 			goto out;
 		}
 		if (lprops != lp) {
-			ubifs_err("lprops %zx lp %zx lprops->lnum %d lp->lnum %d",
+			ubifs_err(c, "lprops %zx lp %zx lprops->lnum %d lp->lnum %d",
 				  (size_t)lprops, (size_t)lp, lprops->lnum,
 				  lp->lnum);
 			err = 4;
@@ -1008,7 +1008,7 @@ void dbg_check_heap(struct ubifs_info *c, struct ubifs_lpt_heap *heap, int cat,
 	}
 out:
 	if (err) {
-		ubifs_err("failed cat %d hpos %d err %d", cat, i, err);
+		ubifs_err(c, "failed cat %d hpos %d err %d", cat, i, err);
 		dump_stack();
 		ubifs_dump_heap(c, heap, cat);
 	}
@@ -1039,7 +1039,7 @@ static int scan_check_cb(struct ubifs_info *c,
 	if (cat != LPROPS_UNCAT) {
 		cat = ubifs_categorize_lprops(c, lp);
 		if (cat != (lp->flags & LPROPS_CAT_MASK)) {
-			ubifs_err("bad LEB category %d expected %d",
+			ubifs_err(c, "bad LEB category %d expected %d",
 				  (lp->flags & LPROPS_CAT_MASK), cat);
 			return -EINVAL;
 		}
@@ -1074,7 +1074,7 @@ static int scan_check_cb(struct ubifs_info *c,
 				}
 			}
 			if (!found) {
-				ubifs_err("bad LPT list (category %d)", cat);
+				ubifs_err(c, "bad LPT list (category %d)", cat);
 				return -EINVAL;
 			}
 		}
@@ -1086,7 +1086,7 @@ static int scan_check_cb(struct ubifs_info *c,
 
 		if ((lp->hpos != -1 && heap->arr[lp->hpos]->lnum != lnum) ||
 		    lp != heap->arr[lp->hpos]) {
-			ubifs_err("bad LPT heap (category %d)", cat);
+			ubifs_err(c, "bad LPT heap (category %d)", cat);
 			return -EINVAL;
 		}
 	}
@@ -1133,7 +1133,7 @@ static int scan_check_cb(struct ubifs_info *c,
 			is_idx = (snod->type == UBIFS_IDX_NODE) ? 1 : 0;
 
 		if (is_idx && snod->type != UBIFS_IDX_NODE) {
-			ubifs_err("indexing node in data LEB %d:%d",
+			ubifs_err(c, "indexing node in data LEB %d:%d",
 				  lnum, snod->offs);
 			goto out_destroy;
 		}
@@ -1159,7 +1159,7 @@ static int scan_check_cb(struct ubifs_info *c,
 
 	if (free > c->leb_size || free < 0 || dirty > c->leb_size ||
 	    dirty < 0) {
-		ubifs_err("bad calculated accounting for LEB %d: free %d, dirty %d",
+		ubifs_err(c, "bad calculated accounting for LEB %d: free %d, dirty %d",
 			  lnum, free, dirty);
 		goto out_destroy;
 	}
@@ -1206,13 +1206,13 @@ static int scan_check_cb(struct ubifs_info *c,
 			/* Free but not unmapped LEB, it's fine */
 			is_idx = 0;
 		else {
-			ubifs_err("indexing node without indexing flag");
+			ubifs_err(c, "indexing node without indexing flag");
 			goto out_print;
 		}
 	}
 
 	if (!is_idx && (lp->flags & LPROPS_INDEX)) {
-		ubifs_err("data node with indexing flag");
+		ubifs_err(c, "data node with indexing flag");
 		goto out_print;
 	}
 
@@ -1241,7 +1241,7 @@ static int scan_check_cb(struct ubifs_info *c,
 	return LPT_SCAN_CONTINUE;
 
 out_print:
-	ubifs_err("bad accounting of LEB %d: free %d, dirty %d flags %#x, should be free %d, dirty %d",
+	ubifs_err(c, "bad accounting of LEB %d: free %d, dirty %d flags %#x, should be free %d, dirty %d",
 		  lnum, lp->free, lp->dirty, lp->flags, free, dirty);
 	ubifs_dump_leb(c, lnum);
 out_destroy:
@@ -1293,11 +1293,11 @@ int dbg_check_lprops(struct ubifs_info *c)
 	    lst.total_free != c->lst.total_free ||
 	    lst.total_dirty != c->lst.total_dirty ||
 	    lst.total_used != c->lst.total_used) {
-		ubifs_err("bad overall accounting");
-		ubifs_err("calculated: empty_lebs %d, idx_lebs %d, total_free %lld, total_dirty %lld, total_used %lld",
+		ubifs_err(c, "bad overall accounting");
+		ubifs_err(c, "calculated: empty_lebs %d, idx_lebs %d, total_free %lld, total_dirty %lld, total_used %lld",
 			  lst.empty_lebs, lst.idx_lebs, lst.total_free,
 			  lst.total_dirty, lst.total_used);
-		ubifs_err("read from lprops: empty_lebs %d, idx_lebs %d, total_free %lld, total_dirty %lld, total_used %lld",
+		ubifs_err(c, "read from lprops: empty_lebs %d, idx_lebs %d, total_free %lld, total_dirty %lld, total_used %lld",
 			  c->lst.empty_lebs, c->lst.idx_lebs, c->lst.total_free,
 			  c->lst.total_dirty, c->lst.total_used);
 		err = -EINVAL;
@@ -1306,10 +1306,10 @@ int dbg_check_lprops(struct ubifs_info *c)
 
 	if (lst.total_dead != c->lst.total_dead ||
 	    lst.total_dark != c->lst.total_dark) {
-		ubifs_err("bad dead/dark space accounting");
-		ubifs_err("calculated: total_dead %lld, total_dark %lld",
+		ubifs_err(c, "bad dead/dark space accounting");
+		ubifs_err(c, "calculated: total_dead %lld, total_dark %lld",
 			  lst.total_dead, lst.total_dark);
-		ubifs_err("read from lprops: total_dead %lld, total_dark %lld",
+		ubifs_err(c, "read from lprops: total_dead %lld, total_dark %lld",
 			  c->lst.total_dead, c->lst.total_dark);
 		err = -EINVAL;
 		goto out;
diff --git a/fs/ubifs/lpt.c b/fs/ubifs/lpt.c
index 421bd0a..dc9f27e 100644
--- a/fs/ubifs/lpt.c
+++ b/fs/ubifs/lpt.c
@@ -145,13 +145,13 @@ int ubifs_calc_lpt_geom(struct ubifs_info *c)
 	sz = c->lpt_sz * 2; /* Must have at least 2 times the size */
 	lebs_needed = div_u64(sz + c->leb_size - 1, c->leb_size);
 	if (lebs_needed > c->lpt_lebs) {
-		ubifs_err("too few LPT LEBs");
+		ubifs_err(c, "too few LPT LEBs");
 		return -EINVAL;
 	}
 
 	/* Verify that ltab fits in a single LEB (since ltab is a single node */
 	if (c->ltab_sz > c->leb_size) {
-		ubifs_err("LPT ltab too big");
+		ubifs_err(c, "LPT ltab too big");
 		return -EINVAL;
 	}
 
@@ -213,7 +213,7 @@ static int calc_dflt_lpt_geom(struct ubifs_info *c, int *main_lebs,
 			continue;
 		}
 		if (c->ltab_sz > c->leb_size) {
-			ubifs_err("LPT ltab too big");
+			ubifs_err(c, "LPT ltab too big");
 			return -EINVAL;
 		}
 		*main_lebs = c->main_lebs;
@@ -911,7 +911,7 @@ static void replace_cats(struct ubifs_info *c, struct ubifs_pnode *old_pnode,
  *
  * This function returns %0 on success and a negative error code on failure.
  */
-static int check_lpt_crc(void *buf, int len)
+static int check_lpt_crc(const struct ubifs_info *c, void *buf, int len)
 {
 	int pos = 0;
 	uint8_t *addr = buf;
@@ -921,8 +921,8 @@ static int check_lpt_crc(void *buf, int len)
 	calc_crc = crc16(-1, buf + UBIFS_LPT_CRC_BYTES,
 			 len - UBIFS_LPT_CRC_BYTES);
 	if (crc != calc_crc) {
-		ubifs_err("invalid crc in LPT node: crc %hx calc %hx", crc,
-			  calc_crc);
+		ubifs_err(c, "invalid crc in LPT node: crc %hx calc %hx",
+			  crc, calc_crc);
 		dump_stack();
 		return -EINVAL;
 	}
@@ -938,14 +938,15 @@ static int check_lpt_crc(void *buf, int len)
  *
  * This function returns %0 on success and a negative error code on failure.
  */
-static int check_lpt_type(uint8_t **addr, int *pos, int type)
+static int check_lpt_type(const struct ubifs_info *c, uint8_t **addr,
+			  int *pos, int type)
 {
 	int node_type;
 
 	node_type = ubifs_unpack_bits(addr, pos, UBIFS_LPT_TYPE_BITS);
 	if (node_type != type) {
-		ubifs_err("invalid type (%d) in LPT node type %d", node_type,
-			  type);
+		ubifs_err(c, "invalid type (%d) in LPT node type %d",
+			  node_type, type);
 		dump_stack();
 		return -EINVAL;
 	}
@@ -966,7 +967,7 @@ static int unpack_pnode(const struct ubifs_info *c, void *buf,
 	uint8_t *addr = buf + UBIFS_LPT_CRC_BYTES;
 	int i, pos = 0, err;
 
-	err = check_lpt_type(&addr, &pos, UBIFS_LPT_PNODE);
+	err = check_lpt_type(c, &addr, &pos, UBIFS_LPT_PNODE);
 	if (err)
 		return err;
 	if (c->big_lpt)
@@ -985,7 +986,7 @@ static int unpack_pnode(const struct ubifs_info *c, void *buf,
 			lprops->flags = 0;
 		lprops->flags |= ubifs_categorize_lprops(c, lprops);
 	}
-	err = check_lpt_crc(buf, c->pnode_sz);
+	err = check_lpt_crc(c, buf, c->pnode_sz);
 	return err;
 }
 
@@ -1003,7 +1004,7 @@ int ubifs_unpack_nnode(const struct ubifs_info *c, void *buf,
 	uint8_t *addr = buf + UBIFS_LPT_CRC_BYTES;
 	int i, pos = 0, err;
 
-	err = check_lpt_type(&addr, &pos, UBIFS_LPT_NNODE);
+	err = check_lpt_type(c, &addr, &pos, UBIFS_LPT_NNODE);
 	if (err)
 		return err;
 	if (c->big_lpt)
@@ -1019,7 +1020,7 @@ int ubifs_unpack_nnode(const struct ubifs_info *c, void *buf,
 		nnode->nbranch[i].offs = ubifs_unpack_bits(&addr, &pos,
 						     c->lpt_offs_bits);
 	}
-	err = check_lpt_crc(buf, c->nnode_sz);
+	err = check_lpt_crc(c, buf, c->nnode_sz);
 	return err;
 }
 
@@ -1035,7 +1036,7 @@ static int unpack_ltab(const struct ubifs_info *c, void *buf)
 	uint8_t *addr = buf + UBIFS_LPT_CRC_BYTES;
 	int i, pos = 0, err;
 
-	err = check_lpt_type(&addr, &pos, UBIFS_LPT_LTAB);
+	err = check_lpt_type(c, &addr, &pos, UBIFS_LPT_LTAB);
 	if (err)
 		return err;
 	for (i = 0; i < c->lpt_lebs; i++) {
@@ -1051,7 +1052,7 @@ static int unpack_ltab(const struct ubifs_info *c, void *buf)
 		c->ltab[i].tgc = 0;
 		c->ltab[i].cmt = 0;
 	}
-	err = check_lpt_crc(buf, c->ltab_sz);
+	err = check_lpt_crc(c, buf, c->ltab_sz);
 	return err;
 }
 
@@ -1067,7 +1068,7 @@ static int unpack_lsave(const struct ubifs_info *c, void *buf)
 	uint8_t *addr = buf + UBIFS_LPT_CRC_BYTES;
 	int i, pos = 0, err;
 
-	err = check_lpt_type(&addr, &pos, UBIFS_LPT_LSAVE);
+	err = check_lpt_type(c, &addr, &pos, UBIFS_LPT_LSAVE);
 	if (err)
 		return err;
 	for (i = 0; i < c->lsave_cnt; i++) {
@@ -1077,7 +1078,7 @@ static int unpack_lsave(const struct ubifs_info *c, void *buf)
 			return -EINVAL;
 		c->lsave[i] = lnum;
 	}
-	err = check_lpt_crc(buf, c->lsave_sz);
+	err = check_lpt_crc(c, buf, c->lsave_sz);
 	return err;
 }
 
@@ -1243,7 +1244,7 @@ int ubifs_read_nnode(struct ubifs_info *c, struct ubifs_nnode *parent, int iip)
 	return 0;
 
 out:
-	ubifs_err("error %d reading nnode at %d:%d", err, lnum, offs);
+	ubifs_err(c, "error %d reading nnode at %d:%d", err, lnum, offs);
 	dump_stack();
 	kfree(nnode);
 	return err;
@@ -1308,10 +1309,10 @@ static int read_pnode(struct ubifs_info *c, struct ubifs_nnode *parent, int iip)
 	return 0;
 
 out:
-	ubifs_err("error %d reading pnode at %d:%d", err, lnum, offs);
+	ubifs_err(c, "error %d reading pnode at %d:%d", err, lnum, offs);
 	ubifs_dump_pnode(c, pnode, parent, iip);
 	dump_stack();
-	ubifs_err("calc num: %d", calc_pnode_num_from_parent(c, parent, iip));
+	ubifs_err(c, "calc num: %d", calc_pnode_num_from_parent(c, parent, iip));
 	kfree(pnode);
 	return err;
 }
@@ -2095,7 +2096,7 @@ static int dbg_chk_pnode(struct ubifs_info *c, struct ubifs_pnode *pnode,
 	int i;
 
 	if (pnode->num != col) {
-		ubifs_err("pnode num %d expected %d parent num %d iip %d",
+		ubifs_err(c, "pnode num %d expected %d parent num %d iip %d",
 			  pnode->num, col, pnode->parent->num, pnode->iip);
 		return -EINVAL;
 	}
@@ -2110,13 +2111,13 @@ static int dbg_chk_pnode(struct ubifs_info *c, struct ubifs_pnode *pnode,
 		if (lnum >= c->leb_cnt)
 			continue;
 		if (lprops->lnum != lnum) {
-			ubifs_err("bad LEB number %d expected %d",
+			ubifs_err(c, "bad LEB number %d expected %d",
 				  lprops->lnum, lnum);
 			return -EINVAL;
 		}
 		if (lprops->flags & LPROPS_TAKEN) {
 			if (cat != LPROPS_UNCAT) {
-				ubifs_err("LEB %d taken but not uncat %d",
+				ubifs_err(c, "LEB %d taken but not uncat %d",
 					  lprops->lnum, cat);
 				return -EINVAL;
 			}
@@ -2129,7 +2130,7 @@ static int dbg_chk_pnode(struct ubifs_info *c, struct ubifs_pnode *pnode,
 			case LPROPS_FRDI_IDX:
 				break;
 			default:
-				ubifs_err("LEB %d index but cat %d",
+				ubifs_err(c, "LEB %d index but cat %d",
 					  lprops->lnum, cat);
 				return -EINVAL;
 			}
@@ -2142,7 +2143,7 @@ static int dbg_chk_pnode(struct ubifs_info *c, struct ubifs_pnode *pnode,
 			case LPROPS_FREEABLE:
 				break;
 			default:
-				ubifs_err("LEB %d not index but cat %d",
+				ubifs_err(c, "LEB %d not index but cat %d",
 					  lprops->lnum, cat);
 				return -EINVAL;
 			}
@@ -2183,14 +2184,14 @@ static int dbg_chk_pnode(struct ubifs_info *c, struct ubifs_pnode *pnode,
 			break;
 		}
 		if (!found) {
-			ubifs_err("LEB %d cat %d not found in cat heap/list",
+			ubifs_err(c, "LEB %d cat %d not found in cat heap/list",
 				  lprops->lnum, cat);
 			return -EINVAL;
 		}
 		switch (cat) {
 		case LPROPS_EMPTY:
 			if (lprops->free != c->leb_size) {
-				ubifs_err("LEB %d cat %d free %d dirty %d",
+				ubifs_err(c, "LEB %d cat %d free %d dirty %d",
 					  lprops->lnum, cat, lprops->free,
 					  lprops->dirty);
 				return -EINVAL;
@@ -2199,7 +2200,7 @@ static int dbg_chk_pnode(struct ubifs_info *c, struct ubifs_pnode *pnode,
 		case LPROPS_FREEABLE:
 		case LPROPS_FRDI_IDX:
 			if (lprops->free + lprops->dirty != c->leb_size) {
-				ubifs_err("LEB %d cat %d free %d dirty %d",
+				ubifs_err(c, "LEB %d cat %d free %d dirty %d",
 					  lprops->lnum, cat, lprops->free,
 					  lprops->dirty);
 				return -EINVAL;
@@ -2236,7 +2237,7 @@ int dbg_check_lpt_nodes(struct ubifs_info *c, struct ubifs_cnode *cnode,
 			/* cnode is a nnode */
 			num = calc_nnode_num(row, col);
 			if (cnode->num != num) {
-				ubifs_err("nnode num %d expected %d parent num %d iip %d",
+				ubifs_err(c, "nnode num %d expected %d parent num %d iip %d",
 					  cnode->num, num,
 					  (nnode ? nnode->num : 0), cnode->iip);
 				return -EINVAL;
diff --git a/fs/ubifs/lpt_commit.c b/fs/ubifs/lpt_commit.c
index d9c0292..ce89bdc 100644
--- a/fs/ubifs/lpt_commit.c
+++ b/fs/ubifs/lpt_commit.c
@@ -319,7 +319,7 @@ static int layout_cnodes(struct ubifs_info *c)
 	return 0;
 
 no_space:
-	ubifs_err("LPT out of space at LEB %d:%d needing %d, done_ltab %d, done_lsave %d",
+	ubifs_err(c, "LPT out of space at LEB %d:%d needing %d, done_ltab %d, done_lsave %d",
 		  lnum, offs, len, done_ltab, done_lsave);
 	ubifs_dump_lpt_info(c);
 	ubifs_dump_lpt_lebs(c);
@@ -543,7 +543,7 @@ static int write_cnodes(struct ubifs_info *c)
 	return 0;
 
 no_space:
-	ubifs_err("LPT out of space mismatch at LEB %d:%d needing %d, done_ltab %d, done_lsave %d",
+	ubifs_err(c, "LPT out of space mismatch at LEB %d:%d needing %d, done_ltab %d, done_lsave %d",
 		  lnum, offs, len, done_ltab, done_lsave);
 	ubifs_dump_lpt_info(c);
 	ubifs_dump_lpt_lebs(c);
@@ -1638,7 +1638,7 @@ static int dbg_check_ltab_lnum(struct ubifs_info *c, int lnum)
 
 	buf = p = __vmalloc(c->leb_size, GFP_NOFS, PAGE_KERNEL);
 	if (!buf) {
-		ubifs_err("cannot allocate memory for ltab checking");
+		ubifs_err(c, "cannot allocate memory for ltab checking");
 		return 0;
 	}
 
@@ -1660,18 +1660,18 @@ static int dbg_check_ltab_lnum(struct ubifs_info *c, int lnum)
 				continue;
 			}
 			if (!dbg_is_all_ff(p, len)) {
-				ubifs_err("invalid empty space in LEB %d at %d",
+				ubifs_err(c, "invalid empty space in LEB %d at %d",
 					  lnum, c->leb_size - len);
 				err = -EINVAL;
 			}
 			i = lnum - c->lpt_first;
 			if (len != c->ltab[i].free) {
-				ubifs_err("invalid free space in LEB %d (free %d, expected %d)",
+				ubifs_err(c, "invalid free space in LEB %d (free %d, expected %d)",
 					  lnum, len, c->ltab[i].free);
 				err = -EINVAL;
 			}
 			if (dirty != c->ltab[i].dirty) {
-				ubifs_err("invalid dirty space in LEB %d (dirty %d, expected %d)",
+				ubifs_err(c, "invalid dirty space in LEB %d (dirty %d, expected %d)",
 					  lnum, dirty, c->ltab[i].dirty);
 				err = -EINVAL;
 			}
@@ -1725,7 +1725,7 @@ int dbg_check_ltab(struct ubifs_info *c)
 	for (lnum = c->lpt_first; lnum <= c->lpt_last; lnum++) {
 		err = dbg_check_ltab_lnum(c, lnum);
 		if (err) {
-			ubifs_err("failed at LEB %d", lnum);
+			ubifs_err(c, "failed at LEB %d", lnum);
 			return err;
 		}
 	}
@@ -1757,7 +1757,7 @@ int dbg_chk_lpt_free_spc(struct ubifs_info *c)
 			free += c->leb_size;
 	}
 	if (free < c->lpt_sz) {
-		ubifs_err("LPT space error: free %lld lpt_sz %lld",
+		ubifs_err(c, "LPT space error: free %lld lpt_sz %lld",
 			  free, c->lpt_sz);
 		ubifs_dump_lpt_info(c);
 		ubifs_dump_lpt_lebs(c);
@@ -1797,12 +1797,12 @@ int dbg_chk_lpt_sz(struct ubifs_info *c, int action, int len)
 		d->chk_lpt_lebs = 0;
 		d->chk_lpt_wastage = 0;
 		if (c->dirty_pn_cnt > c->pnode_cnt) {
-			ubifs_err("dirty pnodes %d exceed max %d",
+			ubifs_err(c, "dirty pnodes %d exceed max %d",
 				  c->dirty_pn_cnt, c->pnode_cnt);
 			err = -EINVAL;
 		}
 		if (c->dirty_nn_cnt > c->nnode_cnt) {
-			ubifs_err("dirty nnodes %d exceed max %d",
+			ubifs_err(c, "dirty nnodes %d exceed max %d",
 				  c->dirty_nn_cnt, c->nnode_cnt);
 			err = -EINVAL;
 		}
@@ -1820,22 +1820,22 @@ int dbg_chk_lpt_sz(struct ubifs_info *c, int action, int len)
 		chk_lpt_sz *= d->chk_lpt_lebs;
 		chk_lpt_sz += len - c->nhead_offs;
 		if (d->chk_lpt_sz != chk_lpt_sz) {
-			ubifs_err("LPT wrote %lld but space used was %lld",
+			ubifs_err(c, "LPT wrote %lld but space used was %lld",
 				  d->chk_lpt_sz, chk_lpt_sz);
 			err = -EINVAL;
 		}
 		if (d->chk_lpt_sz > c->lpt_sz) {
-			ubifs_err("LPT wrote %lld but lpt_sz is %lld",
+			ubifs_err(c, "LPT wrote %lld but lpt_sz is %lld",
 				  d->chk_lpt_sz, c->lpt_sz);
 			err = -EINVAL;
 		}
 		if (d->chk_lpt_sz2 && d->chk_lpt_sz != d->chk_lpt_sz2) {
-			ubifs_err("LPT layout size %lld but wrote %lld",
+			ubifs_err(c, "LPT layout size %lld but wrote %lld",
 				  d->chk_lpt_sz, d->chk_lpt_sz2);
 			err = -EINVAL;
 		}
 		if (d->chk_lpt_sz2 && d->new_nhead_offs != len) {
-			ubifs_err("LPT new nhead offs: expected %d was %d",
+			ubifs_err(c, "LPT new nhead offs: expected %d was %d",
 				  d->new_nhead_offs, len);
 			err = -EINVAL;
 		}
@@ -1845,7 +1845,7 @@ int dbg_chk_lpt_sz(struct ubifs_info *c, int action, int len)
 		if (c->big_lpt)
 			lpt_sz += c->lsave_sz;
 		if (d->chk_lpt_sz - d->chk_lpt_wastage > lpt_sz) {
-			ubifs_err("LPT chk_lpt_sz %lld + waste %lld exceeds %lld",
+			ubifs_err(c, "LPT chk_lpt_sz %lld + waste %lld exceeds %lld",
 				  d->chk_lpt_sz, d->chk_lpt_wastage, lpt_sz);
 			err = -EINVAL;
 		}
@@ -1887,7 +1887,7 @@ static void dump_lpt_leb(const struct ubifs_info *c, int lnum)
 	pr_err("(pid %d) start dumping LEB %d\n", current->pid, lnum);
 	buf = p = __vmalloc(c->leb_size, GFP_NOFS, PAGE_KERNEL);
 	if (!buf) {
-		ubifs_err("cannot allocate memory to dump LPT");
+		ubifs_err(c, "cannot allocate memory to dump LPT");
 		return;
 	}
 
@@ -1962,7 +1962,7 @@ static void dump_lpt_leb(const struct ubifs_info *c, int lnum)
 			pr_err("LEB %d:%d, lsave len\n", lnum, offs);
 			break;
 		default:
-			ubifs_err("LPT node type %d not recognized", node_type);
+			ubifs_err(c, "LPT node type %d not recognized", node_type);
 			goto out;
 		}
 
diff --git a/fs/ubifs/master.c b/fs/ubifs/master.c
index 1a4bb9e..c6a5e39 100644
--- a/fs/ubifs/master.c
+++ b/fs/ubifs/master.c
@@ -82,7 +82,7 @@ out:
 	return -EUCLEAN;
 
 out_dump:
-	ubifs_err("unexpected node type %d master LEB %d:%d",
+	ubifs_err(c, "unexpected node type %d master LEB %d:%d",
 		  snod->type, lnum, snod->offs);
 	ubifs_scan_destroy(sleb);
 	return -EINVAL;
@@ -240,7 +240,7 @@ static int validate_master(const struct ubifs_info *c)
 	return 0;
 
 out:
-	ubifs_err("bad master node at offset %d error %d", c->mst_offs, err);
+	ubifs_err(c, "bad master node at offset %d error %d", c->mst_offs, err);
 	ubifs_dump_node(c, c->mst_node);
 	return -EINVAL;
 }
@@ -316,7 +316,7 @@ int ubifs_read_master(struct ubifs_info *c)
 
 		if (c->leb_cnt < old_leb_cnt ||
 		    c->leb_cnt < UBIFS_MIN_LEB_CNT) {
-			ubifs_err("bad leb_cnt on master node");
+			ubifs_err(c, "bad leb_cnt on master node");
 			ubifs_dump_node(c, c->mst_node);
 			return -EINVAL;
 		}
diff --git a/fs/ubifs/orphan.c b/fs/ubifs/orphan.c
index 4409f48..caf2d12 100644
--- a/fs/ubifs/orphan.c
+++ b/fs/ubifs/orphan.c
@@ -88,7 +88,7 @@ int ubifs_add_orphan(struct ubifs_info *c, ino_t inum)
 		else if (inum > o->inum)
 			p = &(*p)->rb_right;
 		else {
-			ubifs_err("orphaned twice");
+			ubifs_err(c, "orphaned twice");
 			spin_unlock(&c->orphan_lock);
 			kfree(orphan);
 			return 0;
@@ -155,7 +155,7 @@ void ubifs_delete_orphan(struct ubifs_info *c, ino_t inum)
 		}
 	}
 	spin_unlock(&c->orphan_lock);
-	ubifs_err("missing orphan ino %lu", (unsigned long)inum);
+	ubifs_err(c, "missing orphan ino %lu", (unsigned long)inum);
 	dump_stack();
 }
 
@@ -287,7 +287,7 @@ static int write_orph_node(struct ubifs_info *c, int atomic)
 			 * We limit the number of orphans so that this should
 			 * never happen.
 			 */
-			ubifs_err("out of space in orphan area");
+			ubifs_err(c, "out of space in orphan area");
 			return -EINVAL;
 		}
 	}
@@ -397,7 +397,7 @@ static int consolidate(struct ubifs_info *c)
 		 * We limit the number of orphans so that this should
 		 * never happen.
 		 */
-		ubifs_err("out of space in orphan area");
+		ubifs_err(c, "out of space in orphan area");
 		err = -EINVAL;
 	}
 	spin_unlock(&c->orphan_lock);
@@ -569,7 +569,7 @@ static int do_kill_orphans(struct ubifs_info *c, struct ubifs_scan_leb *sleb,
 
 	list_for_each_entry(snod, &sleb->nodes, list) {
 		if (snod->type != UBIFS_ORPH_NODE) {
-			ubifs_err("invalid node type %d in orphan area at %d:%d",
+			ubifs_err(c, "invalid node type %d in orphan area at %d:%d",
 				  snod->type, sleb->lnum, snod->offs);
 			ubifs_dump_node(c, snod->node);
 			return -EINVAL;
@@ -596,7 +596,7 @@ static int do_kill_orphans(struct ubifs_info *c, struct ubifs_scan_leb *sleb,
 			 * number. That makes this orphan node, out of date.
 			 */
 			if (!first) {
-				ubifs_err("out of order commit number %llu in orphan node at %d:%d",
+				ubifs_err(c, "out of order commit number %llu in orphan node at %d:%d",
 					  cmt_no, sleb->lnum, snod->offs);
 				ubifs_dump_node(c, snod->node);
 				return -EINVAL;
@@ -831,20 +831,20 @@ static int dbg_orphan_check(struct ubifs_info *c, struct ubifs_zbranch *zbr,
 	if (inum != ci->last_ino) {
 		/* Lowest node type is the inode node, so it comes first */
 		if (key_type(c, &zbr->key) != UBIFS_INO_KEY)
-			ubifs_err("found orphan node ino %lu, type %d",
+			ubifs_err(c, "found orphan node ino %lu, type %d",
 				  (unsigned long)inum, key_type(c, &zbr->key));
 		ci->last_ino = inum;
 		ci->tot_inos += 1;
 		err = ubifs_tnc_read_node(c, zbr, ci->node);
 		if (err) {
-			ubifs_err("node read failed, error %d", err);
+			ubifs_err(c, "node read failed, error %d", err);
 			return err;
 		}
 		if (ci->node->nlink == 0)
 			/* Must be recorded as an orphan */
 			if (!dbg_find_check_orphan(&ci->root, inum) &&
 			    !dbg_find_orphan(c, inum)) {
-				ubifs_err("missing orphan, ino %lu",
+				ubifs_err(c, "missing orphan, ino %lu",
 					  (unsigned long)inum);
 				ci->missing += 1;
 			}
@@ -887,7 +887,7 @@ static int dbg_scan_orphans(struct ubifs_info *c, struct check_info *ci)
 
 	buf = __vmalloc(c->leb_size, GFP_NOFS, PAGE_KERNEL);
 	if (!buf) {
-		ubifs_err("cannot allocate memory to check orphans");
+		ubifs_err(c, "cannot allocate memory to check orphans");
 		return 0;
 	}
 
@@ -925,7 +925,7 @@ static int dbg_check_orphans(struct ubifs_info *c)
 	ci.root = RB_ROOT;
 	ci.node = kmalloc(UBIFS_MAX_INO_NODE_SZ, GFP_NOFS);
 	if (!ci.node) {
-		ubifs_err("out of memory");
+		ubifs_err(c, "out of memory");
 		return -ENOMEM;
 	}
 
@@ -935,12 +935,12 @@ static int dbg_check_orphans(struct ubifs_info *c)
 
 	err = dbg_walk_index(c, &dbg_orphan_check, NULL, &ci);
 	if (err) {
-		ubifs_err("cannot scan TNC, error %d", err);
+		ubifs_err(c, "cannot scan TNC, error %d", err);
 		goto out;
 	}
 
 	if (ci.missing) {
-		ubifs_err("%lu missing orphan(s)", ci.missing);
+		ubifs_err(c, "%lu missing orphan(s)", ci.missing);
 		err = -EINVAL;
 		goto out;
 	}
diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
index c640938..7ffc336 100644
--- a/fs/ubifs/recovery.c
+++ b/fs/ubifs/recovery.c
@@ -305,7 +305,7 @@ int ubifs_recover_master_node(struct ubifs_info *c)
 		mst = mst2;
 	}
 
-	ubifs_msg("recovered master node from LEB %d",
+	ubifs_msg(c, "recovered master node from LEB %d",
 		  (mst == mst1 ? UBIFS_MST_LNUM : UBIFS_MST_LNUM + 1));
 
 	memcpy(c->mst_node, mst, UBIFS_MST_NODE_SZ);
@@ -360,13 +360,13 @@ int ubifs_recover_master_node(struct ubifs_info *c)
 out_err:
 	err = -EINVAL;
 out_free:
-	ubifs_err("failed to recover master node");
+	ubifs_err(c, "failed to recover master node");
 	if (mst1) {
-		ubifs_err("dumping first master node");
+		ubifs_err(c, "dumping first master node");
 		ubifs_dump_node(c, mst1);
 	}
 	if (mst2) {
-		ubifs_err("dumping second master node");
+		ubifs_err(c, "dumping second master node");
 		ubifs_dump_node(c, mst2);
 	}
 	vfree(buf2);
@@ -682,7 +682,7 @@ struct ubifs_scan_leb *ubifs_recover_leb(struct ubifs_info *c, int lnum,
 				  ret, lnum, offs);
 			break;
 		} else {
-			ubifs_err("unexpected return value %d", ret);
+			ubifs_err(c, "unexpected return value %d", ret);
 			err = -EINVAL;
 			goto error;
 		}
@@ -702,7 +702,7 @@ struct ubifs_scan_leb *ubifs_recover_leb(struct ubifs_info *c, int lnum,
 			 * See header comment for this file for more
 			 * explanations about the reasons we have this check.
 			 */
-			ubifs_err("corrupt empty space LEB %d:%d, corruption starts at %d",
+			ubifs_err(c, "corrupt empty space LEB %d:%d, corruption starts at %d",
 				  lnum, offs, corruption);
 			/* Make sure we dump interesting non-0xFF data */
 			offs += corruption;
@@ -788,13 +788,13 @@ struct ubifs_scan_leb *ubifs_recover_leb(struct ubifs_info *c, int lnum,
 
 corrupted_rescan:
 	/* Re-scan the corrupted data with verbose messages */
-	ubifs_err("corruption %d", ret);
+	ubifs_err(c, "corruption %d", ret);
 	ubifs_scan_a_node(c, buf, len, lnum, offs, 1);
 corrupted:
 	ubifs_scanned_corruption(c, lnum, offs, buf);
 	err = -EUCLEAN;
 error:
-	ubifs_err("LEB %d scanning failed", lnum);
+	ubifs_err(c, "LEB %d scanning failed", lnum);
 	ubifs_scan_destroy(sleb);
 	return ERR_PTR(err);
 }
@@ -826,15 +826,15 @@ static int get_cs_sqnum(struct ubifs_info *c, int lnum, int offs,
 		goto out_free;
 	ret = ubifs_scan_a_node(c, cs_node, UBIFS_CS_NODE_SZ, lnum, offs, 0);
 	if (ret != SCANNED_A_NODE) {
-		ubifs_err("Not a valid node");
+		ubifs_err(c, "Not a valid node");
 		goto out_err;
 	}
 	if (cs_node->ch.node_type != UBIFS_CS_NODE) {
-		ubifs_err("Node a CS node, type is %d", cs_node->ch.node_type);
+		ubifs_err(c, "Node a CS node, type is %d", cs_node->ch.node_type);
 		goto out_err;
 	}
 	if (le64_to_cpu(cs_node->cmt_no) != c->cmt_no) {
-		ubifs_err("CS node cmt_no %llu != current cmt_no %llu",
+		ubifs_err(c, "CS node cmt_no %llu != current cmt_no %llu",
 			  (unsigned long long)le64_to_cpu(cs_node->cmt_no),
 			  c->cmt_no);
 		goto out_err;
@@ -847,7 +847,7 @@ static int get_cs_sqnum(struct ubifs_info *c, int lnum, int offs,
 out_err:
 	err = -EINVAL;
 out_free:
-	ubifs_err("failed to get CS sqnum");
+	ubifs_err(c, "failed to get CS sqnum");
 	kfree(cs_node);
 	return err;
 }
@@ -899,7 +899,7 @@ struct ubifs_scan_leb *ubifs_recover_log_leb(struct ubifs_info *c, int lnum,
 				}
 			}
 			if (snod->sqnum > cs_sqnum) {
-				ubifs_err("unrecoverable log corruption in LEB %d",
+				ubifs_err(c, "unrecoverable log corruption in LEB %d",
 					  lnum);
 				ubifs_scan_destroy(sleb);
 				return ERR_PTR(-EUCLEAN);
@@ -1043,7 +1043,7 @@ static int clean_an_unclean_leb(struct ubifs_info *c,
 		}
 
 		if (ret == SCANNED_EMPTY_SPACE) {
-			ubifs_err("unexpected empty space at %d:%d",
+			ubifs_err(c, "unexpected empty space at %d:%d",
 				  lnum, offs);
 			return -EUCLEAN;
 		}
@@ -1137,7 +1137,7 @@ static int grab_empty_leb(struct ubifs_info *c)
 	 */
 	lnum = ubifs_find_free_leb_for_idx(c);
 	if (lnum < 0) {
-		ubifs_err("could not find an empty LEB");
+		ubifs_err(c, "could not find an empty LEB");
 		ubifs_dump_lprops(c);
 		ubifs_dump_budg(c, &c->bi);
 		return lnum;
@@ -1217,7 +1217,7 @@ int ubifs_rcvry_gc_commit(struct ubifs_info *c)
 	}
 	mutex_unlock(&wbuf->io_mutex);
 	if (err < 0) {
-		ubifs_err("GC failed, error %d", err);
+		ubifs_err(c, "GC failed, error %d", err);
 		if (err == -EAGAIN)
 			err = -EINVAL;
 		return err;
@@ -1464,7 +1464,7 @@ static int fix_size_in_place(struct ubifs_info *c, struct size_entry *e)
 	return 0;
 
 out:
-	ubifs_warn("inode %lu failed to fix size %lld -> %lld error %d",
+	ubifs_warn(c, "inode %lu failed to fix size %lld -> %lld error %d",
 		   (unsigned long)e->inum, e->i_size, e->d_size, err);
 	return err;
 }
diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index 9b40a1c..3ca4540 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -458,13 +458,13 @@ int ubifs_validate_entry(struct ubifs_info *c,
 	    nlen > UBIFS_MAX_NLEN || dent->name[nlen] != 0 ||
 	    strnlen(dent->name, nlen) != nlen ||
 	    le64_to_cpu(dent->inum) > MAX_INUM) {
-		ubifs_err("bad %s node", key_type == UBIFS_DENT_KEY ?
+		ubifs_err(c, "bad %s node", key_type == UBIFS_DENT_KEY ?
 			  "directory entry" : "extended attribute entry");
 		return -EINVAL;
 	}
 
 	if (key_type != UBIFS_DENT_KEY && key_type != UBIFS_XENT_KEY) {
-		ubifs_err("bad key type %d", key_type);
+		ubifs_err(c, "bad key type %d", key_type);
 		return -EINVAL;
 	}
 
@@ -589,7 +589,7 @@ static int replay_bud(struct ubifs_info *c, struct bud_entry *b)
 		cond_resched();
 
 		if (snod->sqnum >= SQNUM_WATERMARK) {
-			ubifs_err("file system's life ended");
+			ubifs_err(c, "file system's life ended");
 			goto out_dump;
 		}
 
@@ -647,7 +647,7 @@ static int replay_bud(struct ubifs_info *c, struct bud_entry *b)
 			if (old_size < 0 || old_size > c->max_inode_sz ||
 			    new_size < 0 || new_size > c->max_inode_sz ||
 			    old_size <= new_size) {
-				ubifs_err("bad truncation node");
+				ubifs_err(c, "bad truncation node");
 				goto out_dump;
 			}
 
@@ -662,7 +662,7 @@ static int replay_bud(struct ubifs_info *c, struct bud_entry *b)
 			break;
 		}
 		default:
-			ubifs_err("unexpected node type %d in bud LEB %d:%d",
+			ubifs_err(c, "unexpected node type %d in bud LEB %d:%d",
 				  snod->type, lnum, snod->offs);
 			err = -EINVAL;
 			goto out_dump;
@@ -685,7 +685,7 @@ out:
 	return err;
 
 out_dump:
-	ubifs_err("bad node is at LEB %d:%d", lnum, snod->offs);
+	ubifs_err(c, "bad node is at LEB %d:%d", lnum, snod->offs);
 	ubifs_dump_node(c, snod->node);
 	ubifs_scan_destroy(sleb);
 	return -EINVAL;
@@ -805,7 +805,7 @@ static int validate_ref(struct ubifs_info *c, const struct ubifs_ref_node *ref)
 	if (bud) {
 		if (bud->jhead == jhead && bud->start <= offs)
 			return 1;
-		ubifs_err("bud at LEB %d:%d was already referred", lnum, offs);
+		ubifs_err(c, "bud at LEB %d:%d was already referred", lnum, offs);
 		return -EINVAL;
 	}
 
@@ -861,12 +861,12 @@ static int replay_log_leb(struct ubifs_info *c, int lnum, int offs, void *sbuf)
 		 * numbers.
 		 */
 		if (snod->type != UBIFS_CS_NODE) {
-			ubifs_err("first log node at LEB %d:%d is not CS node",
+			ubifs_err(c, "first log node at LEB %d:%d is not CS node",
 				  lnum, offs);
 			goto out_dump;
 		}
 		if (le64_to_cpu(node->cmt_no) != c->cmt_no) {
-			ubifs_err("first CS node at LEB %d:%d has wrong commit number %llu expected %llu",
+			ubifs_err(c, "first CS node at LEB %d:%d has wrong commit number %llu expected %llu",
 				  lnum, offs,
 				  (unsigned long long)le64_to_cpu(node->cmt_no),
 				  c->cmt_no);
@@ -891,7 +891,7 @@ static int replay_log_leb(struct ubifs_info *c, int lnum, int offs, void *sbuf)
 
 	/* Make sure the first node sits at offset zero of the LEB */
 	if (snod->offs != 0) {
-		ubifs_err("first node is not at zero offset");
+		ubifs_err(c, "first node is not at zero offset");
 		goto out_dump;
 	}
 
@@ -899,12 +899,12 @@ static int replay_log_leb(struct ubifs_info *c, int lnum, int offs, void *sbuf)
 		cond_resched();
 
 		if (snod->sqnum >= SQNUM_WATERMARK) {
-			ubifs_err("file system's life ended");
+			ubifs_err(c, "file system's life ended");
 			goto out_dump;
 		}
 
 		if (snod->sqnum < c->cs_sqnum) {
-			ubifs_err("bad sqnum %llu, commit sqnum %llu",
+			ubifs_err(c, "bad sqnum %llu, commit sqnum %llu",
 				  snod->sqnum, c->cs_sqnum);
 			goto out_dump;
 		}
@@ -934,12 +934,12 @@ static int replay_log_leb(struct ubifs_info *c, int lnum, int offs, void *sbuf)
 		case UBIFS_CS_NODE:
 			/* Make sure it sits at the beginning of LEB */
 			if (snod->offs != 0) {
-				ubifs_err("unexpected node in log");
+				ubifs_err(c, "unexpected node in log");
 				goto out_dump;
 			}
 			break;
 		default:
-			ubifs_err("unexpected node in log");
+			ubifs_err(c, "unexpected node in log");
 			goto out_dump;
 		}
 	}
@@ -955,7 +955,7 @@ out:
 	return err;
 
 out_dump:
-	ubifs_err("log error detected while replaying the log at LEB %d:%d",
+	ubifs_err(c, "log error detected while replaying the log at LEB %d:%d",
 		  lnum, offs + snod->offs);
 	ubifs_dump_node(c, snod->node);
 	ubifs_scan_destroy(sleb);
@@ -1017,7 +1017,7 @@ int ubifs_replay_journal(struct ubifs_info *c)
 		return free; /* Error code */
 
 	if (c->ihead_offs != c->leb_size - free) {
-		ubifs_err("bad index head LEB %d:%d", c->ihead_lnum,
+		ubifs_err(c, "bad index head LEB %d:%d", c->ihead_lnum,
 			  c->ihead_offs);
 		return -EINVAL;
 	}
@@ -1040,7 +1040,7 @@ int ubifs_replay_journal(struct ubifs_info *c)
 			 * someting went wrong and we cannot proceed mounting
 			 * the file-system.
 			 */
-			ubifs_err("no UBIFS nodes found at the log head LEB %d:%d, possibly corrupted",
+			ubifs_err(c, "no UBIFS nodes found at the log head LEB %d:%d, possibly corrupted",
 				  lnum, 0);
 			err = -EINVAL;
 		}
diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index 79c6dbb..f4fbc7b 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -335,7 +335,7 @@ static int create_default_filesystem(struct ubifs_info *c)
 	if (err)
 		return err;
 
-	ubifs_msg("default file-system created");
+	ubifs_msg(c, "default file-system created");
 	return 0;
 }
 
@@ -365,13 +365,13 @@ static int validate_sb(struct ubifs_info *c, struct ubifs_sb_node *sup)
 	}
 
 	if (le32_to_cpu(sup->min_io_size) != c->min_io_size) {
-		ubifs_err("min. I/O unit mismatch: %d in superblock, %d real",
+		ubifs_err(c, "min. I/O unit mismatch: %d in superblock, %d real",
 			  le32_to_cpu(sup->min_io_size), c->min_io_size);
 		goto failed;
 	}
 
 	if (le32_to_cpu(sup->leb_size) != c->leb_size) {
-		ubifs_err("LEB size mismatch: %d in superblock, %d real",
+		ubifs_err(c, "LEB size mismatch: %d in superblock, %d real",
 			  le32_to_cpu(sup->leb_size), c->leb_size);
 		goto failed;
 	}
@@ -393,33 +393,33 @@ static int validate_sb(struct ubifs_info *c, struct ubifs_sb_node *sup)
 	min_leb_cnt += c->lpt_lebs + c->orph_lebs + c->jhead_cnt + 6;
 
 	if (c->leb_cnt < min_leb_cnt || c->leb_cnt > c->vi.size) {
-		ubifs_err("bad LEB count: %d in superblock, %d on UBI volume, %d minimum required",
+		ubifs_err(c, "bad LEB count: %d in superblock, %d on UBI volume, %d minimum required",
 			  c->leb_cnt, c->vi.size, min_leb_cnt);
 		goto failed;
 	}
 
 	if (c->max_leb_cnt < c->leb_cnt) {
-		ubifs_err("max. LEB count %d less than LEB count %d",
+		ubifs_err(c, "max. LEB count %d less than LEB count %d",
 			  c->max_leb_cnt, c->leb_cnt);
 		goto failed;
 	}
 
 	if (c->main_lebs < UBIFS_MIN_MAIN_LEBS) {
-		ubifs_err("too few main LEBs count %d, must be at least %d",
+		ubifs_err(c, "too few main LEBs count %d, must be at least %d",
 			  c->main_lebs, UBIFS_MIN_MAIN_LEBS);
 		goto failed;
 	}
 
 	max_bytes = (long long)c->leb_size * UBIFS_MIN_BUD_LEBS;
 	if (c->max_bud_bytes < max_bytes) {
-		ubifs_err("too small journal (%lld bytes), must be at least %lld bytes",
+		ubifs_err(c, "too small journal (%lld bytes), must be at least %lld bytes",
 			  c->max_bud_bytes, max_bytes);
 		goto failed;
 	}
 
 	max_bytes = (long long)c->leb_size * c->main_lebs;
 	if (c->max_bud_bytes > max_bytes) {
-		ubifs_err("too large journal size (%lld bytes), only %lld bytes available in the main area",
+		ubifs_err(c, "too large journal size (%lld bytes), only %lld bytes available in the main area",
 			  c->max_bud_bytes, max_bytes);
 		goto failed;
 	}
@@ -468,7 +468,7 @@ static int validate_sb(struct ubifs_info *c, struct ubifs_sb_node *sup)
 	return 0;
 
 failed:
-	ubifs_err("bad superblock, error %d", err);
+	ubifs_err(c, "bad superblock, error %d", err);
 	ubifs_dump_node(c, sup);
 	return -EINVAL;
 }
@@ -549,12 +549,12 @@ int ubifs_read_superblock(struct ubifs_info *c)
 		ubifs_assert(!c->ro_media || c->ro_mount);
 		if (!c->ro_mount ||
 		    c->ro_compat_version > UBIFS_RO_COMPAT_VERSION) {
-			ubifs_err("on-flash format version is w%d/r%d, but software only supports up to version w%d/r%d",
+			ubifs_err(c, "on-flash format version is w%d/r%d, but software only supports up to version w%d/r%d",
 				  c->fmt_version, c->ro_compat_version,
 				  UBIFS_FORMAT_VERSION,
 				  UBIFS_RO_COMPAT_VERSION);
 			if (c->ro_compat_version <= UBIFS_RO_COMPAT_VERSION) {
-				ubifs_msg("only R/O mounting is possible");
+				ubifs_msg(c, "only R/O mounting is possible");
 				err = -EROFS;
 			} else
 				err = -EINVAL;
@@ -570,7 +570,7 @@ int ubifs_read_superblock(struct ubifs_info *c)
 	}
 
 	if (c->fmt_version < 3) {
-		ubifs_err("on-flash format version %d is not supported",
+		ubifs_err(c, "on-flash format version %d is not supported",
 			  c->fmt_version);
 		err = -EINVAL;
 		goto out;
@@ -595,7 +595,7 @@ int ubifs_read_superblock(struct ubifs_info *c)
 		c->key_len = UBIFS_SK_LEN;
 		break;
 	default:
-		ubifs_err("unsupported key format");
+		ubifs_err(c, "unsupported key format");
 		err = -EINVAL;
 		goto out;
 	}
@@ -785,7 +785,7 @@ int ubifs_fixup_free_space(struct ubifs_info *c)
 	ubifs_assert(c->space_fixup);
 	ubifs_assert(!c->ro_mount);
 
-	ubifs_msg("start fixing up free space");
+	ubifs_msg(c, "start fixing up free space");
 
 	err = fixup_free_space(c);
 	if (err)
@@ -804,6 +804,6 @@ int ubifs_fixup_free_space(struct ubifs_info *c)
 	if (err)
 		return err;
 
-	ubifs_msg("free space fixup complete");
+	ubifs_msg(c, "free space fixup complete");
 	return err;
 }
diff --git a/fs/ubifs/scan.c b/fs/ubifs/scan.c
index 89adbc4..aab8734 100644
--- a/fs/ubifs/scan.c
+++ b/fs/ubifs/scan.c
@@ -100,7 +100,7 @@ int ubifs_scan_a_node(const struct ubifs_info *c, void *buf, int len, int lnum,
 		if (pad_len < 0 ||
 		    offs + node_len + pad_len > c->leb_size) {
 			if (!quiet) {
-				ubifs_err("bad pad node at LEB %d:%d",
+				ubifs_err(c, "bad pad node at LEB %d:%d",
 					  lnum, offs);
 				ubifs_dump_node(c, pad);
 			}
@@ -110,7 +110,7 @@ int ubifs_scan_a_node(const struct ubifs_info *c, void *buf, int len, int lnum,
 		/* Make the node pads to 8-byte boundary */
 		if ((node_len + pad_len) & 7) {
 			if (!quiet)
-				ubifs_err("bad padding length %d - %d",
+				ubifs_err(c, "bad padding length %d - %d",
 					  offs, offs + node_len + pad_len);
 			return SCANNED_A_BAD_PAD_NODE;
 		}
@@ -152,7 +152,7 @@ struct ubifs_scan_leb *ubifs_start_scan(const struct ubifs_info *c, int lnum,
 
 	err = ubifs_leb_read(c, lnum, sbuf + offs, offs, c->leb_size - offs, 0);
 	if (err && err != -EBADMSG) {
-		ubifs_err("cannot read %d bytes from LEB %d:%d, error %d",
+		ubifs_err(c, "cannot read %d bytes from LEB %d:%d, error %d",
 			  c->leb_size - offs, lnum, offs, err);
 		kfree(sleb);
 		return ERR_PTR(err);
@@ -240,11 +240,11 @@ void ubifs_scanned_corruption(const struct ubifs_info *c, int lnum, int offs,
 {
 	int len;
 
-	ubifs_err("corruption at LEB %d:%d", lnum, offs);
+	ubifs_err(c, "corruption at LEB %d:%d", lnum, offs);
 	len = c->leb_size - offs;
 	if (len > 8192)
 		len = 8192;
-	ubifs_err("first %d bytes from LEB %d:%d", len, lnum, offs);
+	ubifs_err(c, "first %d bytes from LEB %d:%d", len, lnum, offs);
 	print_hex_dump(KERN_DEBUG, "", DUMP_PREFIX_OFFSET, 32, 4, buf, len, 1);
 }
 
@@ -299,16 +299,16 @@ struct ubifs_scan_leb *ubifs_scan(const struct ubifs_info *c, int lnum,
 
 		switch (ret) {
 		case SCANNED_GARBAGE:
-			ubifs_err("garbage");
+			ubifs_err(c, "garbage");
 			goto corrupted;
 		case SCANNED_A_NODE:
 			break;
 		case SCANNED_A_CORRUPT_NODE:
 		case SCANNED_A_BAD_PAD_NODE:
-			ubifs_err("bad node");
+			ubifs_err(c, "bad node");
 			goto corrupted;
 		default:
-			ubifs_err("unknown");
+			ubifs_err(c, "unknown");
 			err = -EINVAL;
 			goto error;
 		}
@@ -325,7 +325,7 @@ struct ubifs_scan_leb *ubifs_scan(const struct ubifs_info *c, int lnum,
 
 	if (offs % c->min_io_size) {
 		if (!quiet)
-			ubifs_err("empty space starts at non-aligned offset %d",
+			ubifs_err(c, "empty space starts at non-aligned offset %d",
 				  offs);
 		goto corrupted;
 	}
@@ -338,7 +338,7 @@ struct ubifs_scan_leb *ubifs_scan(const struct ubifs_info *c, int lnum,
 	for (; len; offs++, buf++, len--)
 		if (*(uint8_t *)buf != 0xff) {
 			if (!quiet)
-				ubifs_err("corrupt empty space at LEB %d:%d",
+				ubifs_err(c, "corrupt empty space at LEB %d:%d",
 					  lnum, offs);
 			goto corrupted;
 		}
@@ -348,14 +348,14 @@ struct ubifs_scan_leb *ubifs_scan(const struct ubifs_info *c, int lnum,
 corrupted:
 	if (!quiet) {
 		ubifs_scanned_corruption(c, lnum, offs, buf);
-		ubifs_err("LEB %d scanning failed", lnum);
+		ubifs_err(c, "LEB %d scanning failed", lnum);
 	}
 	err = -EUCLEAN;
 	ubifs_scan_destroy(sleb);
 	return ERR_PTR(err);
 
 error:
-	ubifs_err("LEB %d scanning failed, error %d", lnum, err);
+	ubifs_err(c, "LEB %d scanning failed, error %d", lnum, err);
 	ubifs_scan_destroy(sleb);
 	return ERR_PTR(err);
 }
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index e642067..d9e52a2 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -70,13 +70,13 @@ static int validate_inode(struct ubifs_info *c, const struct inode *inode)
 	const struct ubifs_inode *ui = ubifs_inode(inode);
 
 	if (inode->i_size > c->max_inode_sz) {
-		ubifs_err("inode is too large (%lld)",
+		ubifs_err(c, "inode is too large (%lld)",
 			  (long long)inode->i_size);
 		return 1;
 	}
 
 	if (ui->compr_type >= UBIFS_COMPR_TYPES_CNT) {
-		ubifs_err("unknown compression type %d", ui->compr_type);
+		ubifs_err(c, "unknown compression type %d", ui->compr_type);
 		return 2;
 	}
 
@@ -90,7 +90,7 @@ static int validate_inode(struct ubifs_info *c, const struct inode *inode)
 		return 5;
 
 	if (!ubifs_compr_present(ui->compr_type)) {
-		ubifs_warn("inode %lu uses '%s' compression, but it was not compiled in",
+		ubifs_warn(c, "inode %lu uses '%s' compression, but it was not compiled in",
 			   inode->i_ino, ubifs_compr_name(ui->compr_type));
 	}
 
@@ -245,14 +245,14 @@ struct inode *ubifs_iget(struct super_block *sb, unsigned long inum)
 	return inode;
 
 out_invalid:
-	ubifs_err("inode %lu validation failed, error %d", inode->i_ino, err);
+	ubifs_err(c, "inode %lu validation failed, error %d", inode->i_ino, err);
 	ubifs_dump_node(c, ino);
 	ubifs_dump_inode(c, inode);
 	err = -EINVAL;
 out_ino:
 	kfree(ino);
 out:
-	ubifs_err("failed to read inode %lu, error %d", inode->i_ino, err);
+	ubifs_err(c, "failed to read inode %lu, error %d", inode->i_ino, err);
 	iget_failed(inode);
 	return ERR_PTR(err);
 }
@@ -322,7 +322,7 @@ static int ubifs_write_inode(struct inode *inode, struct writeback_control *wbc)
 	if (inode->i_nlink) {
 		err = ubifs_jnl_write_inode(c, inode);
 		if (err)
-			ubifs_err("can't write inode %lu, error %d",
+			ubifs_err(c, "can't write inode %lu, error %d",
 				  inode->i_ino, err);
 		else
 			err = dbg_check_inode_size(c, inode, ui->ui_size);
@@ -366,7 +366,7 @@ static void ubifs_evict_inode(struct inode *inode)
 		 * Worst case we have a lost orphan inode wasting space, so a
 		 * simple error message is OK here.
 		 */
-		ubifs_err("can't delete inode %lu, error %d",
+		ubifs_err(c, "can't delete inode %lu, error %d",
 			  inode->i_ino, err);
 
 out:
@@ -495,17 +495,17 @@ static int ubifs_sync_fs(struct super_block *sb, int wait)
 static int init_constants_early(struct ubifs_info *c)
 {
 	if (c->vi.corrupted) {
-		ubifs_warn("UBI volume is corrupted - read-only mode");
+		ubifs_warn(c, "UBI volume is corrupted - read-only mode");
 		c->ro_media = 1;
 	}
 
 	if (c->di.ro_mode) {
-		ubifs_msg("read-only UBI device");
+		ubifs_msg(c, "read-only UBI device");
 		c->ro_media = 1;
 	}
 
 	if (c->vi.vol_type == UBI_STATIC_VOLUME) {
-		ubifs_msg("static UBI volume - read-only mode");
+		ubifs_msg(c, "static UBI volume - read-only mode");
 		c->ro_media = 1;
 	}
 
@@ -519,19 +519,19 @@ static int init_constants_early(struct ubifs_info *c)
 	c->max_write_shift = fls(c->max_write_size) - 1;
 
 	if (c->leb_size < UBIFS_MIN_LEB_SZ) {
-		ubifs_err("too small LEBs (%d bytes), min. is %d bytes",
+		ubifs_err(c, "too small LEBs (%d bytes), min. is %d bytes",
 			  c->leb_size, UBIFS_MIN_LEB_SZ);
 		return -EINVAL;
 	}
 
 	if (c->leb_cnt < UBIFS_MIN_LEB_CNT) {
-		ubifs_err("too few LEBs (%d), min. is %d",
+		ubifs_err(c, "too few LEBs (%d), min. is %d",
 			  c->leb_cnt, UBIFS_MIN_LEB_CNT);
 		return -EINVAL;
 	}
 
 	if (!is_power_of_2(c->min_io_size)) {
-		ubifs_err("bad min. I/O size %d", c->min_io_size);
+		ubifs_err(c, "bad min. I/O size %d", c->min_io_size);
 		return -EINVAL;
 	}
 
@@ -542,7 +542,7 @@ static int init_constants_early(struct ubifs_info *c)
 	if (c->max_write_size < c->min_io_size ||
 	    c->max_write_size % c->min_io_size ||
 	    !is_power_of_2(c->max_write_size)) {
-		ubifs_err("bad write buffer size %d for %d min. I/O unit",
+		ubifs_err(c, "bad write buffer size %d for %d min. I/O unit",
 			  c->max_write_size, c->min_io_size);
 		return -EINVAL;
 	}
@@ -668,7 +668,7 @@ static int init_constants_sb(struct ubifs_info *c)
 	tmp = UBIFS_CS_NODE_SZ + UBIFS_REF_NODE_SZ * c->jhead_cnt;
 	tmp = ALIGN(tmp, c->min_io_size);
 	if (tmp > c->leb_size) {
-		ubifs_err("too small LEB size %d, at least %d needed",
+		ubifs_err(c, "too small LEB size %d, at least %d needed",
 			  c->leb_size, tmp);
 		return -EINVAL;
 	}
@@ -683,7 +683,7 @@ static int init_constants_sb(struct ubifs_info *c)
 	tmp /= c->leb_size;
 	tmp += 1;
 	if (c->log_lebs < tmp) {
-		ubifs_err("too small log %d LEBs, required min. %d LEBs",
+		ubifs_err(c, "too small log %d LEBs, required min. %d LEBs",
 			  c->log_lebs, tmp);
 		return -EINVAL;
 	}
@@ -775,7 +775,7 @@ static int take_gc_lnum(struct ubifs_info *c)
 	int err;
 
 	if (c->gc_lnum == -1) {
-		ubifs_err("no LEB for GC");
+		ubifs_err(c, "no LEB for GC");
 		return -EINVAL;
 	}
 
@@ -860,7 +860,7 @@ static void free_orphans(struct ubifs_info *c)
 		orph = list_entry(c->orph_list.next, struct ubifs_orphan, list);
 		list_del(&orph->list);
 		kfree(orph);
-		ubifs_err("orphan list not empty at unmount");
+		ubifs_err(c, "orphan list not empty at unmount");
 	}
 
 	vfree(c->orph_buf);
@@ -957,7 +957,8 @@ static const match_table_t tokens = {
  */
 static int parse_standard_option(const char *option)
 {
-	ubifs_msg("parse %s", option);
+
+	pr_notice("UBIFS: parse %s\n", option);
 	if (!strcmp(option, "sync"))
 		return MS_SYNCHRONOUS;
 	return 0;
@@ -1029,7 +1030,7 @@ static int ubifs_parse_options(struct ubifs_info *c, char *options,
 			else if (!strcmp(name, "zlib"))
 				c->mount_opts.compr_type = UBIFS_COMPR_ZLIB;
 			else {
-				ubifs_err("unknown compressor \"%s\"", name);
+				ubifs_err(c, "unknown compressor \"%s\"", name); //FIXME: is c ready?
 				kfree(name);
 				return -EINVAL;
 			}
@@ -1045,7 +1046,7 @@ static int ubifs_parse_options(struct ubifs_info *c, char *options,
 
 			flag = parse_standard_option(p);
 			if (!flag) {
-				ubifs_err("unrecognized mount option \"%s\" or missing value",
+				ubifs_err(c, "unrecognized mount option \"%s\" or missing value",
 					  p);
 				return -EINVAL;
 			}
@@ -1108,7 +1109,7 @@ again:
 		}
 
 		/* Just disable bulk-read */
-		ubifs_warn("cannot allocate %d bytes of memory for bulk-read, disabling it",
+		ubifs_warn(c, "cannot allocate %d bytes of memory for bulk-read, disabling it",
 			   c->max_bu_buf_len);
 		c->mount_opts.bulk_read = 1;
 		c->bulk_read = 0;
@@ -1127,7 +1128,7 @@ static int check_free_space(struct ubifs_info *c)
 {
 	ubifs_assert(c->dark_wm > 0);
 	if (c->lst.total_free + c->lst.total_dirty < c->dark_wm) {
-		ubifs_err("insufficient free space to mount in R/W mode");
+		ubifs_err(c, "insufficient free space to mount in R/W mode");
 		ubifs_dump_budg(c, &c->bi);
 		ubifs_dump_lprops(c);
 		return -ENOSPC;
@@ -1169,14 +1170,14 @@ static int mount_ubifs(struct ubifs_info *c)
 		 * This UBI volume is empty, and read-only, or the file system
 		 * is mounted read-only - we cannot format it.
 		 */
-		ubifs_err("can't format empty UBI volume: read-only %s",
+		ubifs_err(c, "can't format empty UBI volume: read-only %s",
 			  c->ro_media ? "UBI volume" : "mount");
 		err = -EROFS;
 		goto out_free;
 	}
 
 	if (c->ro_media && !c->ro_mount) {
-		ubifs_err("cannot mount read-write - read-only media");
+		ubifs_err(c, "cannot mount read-write - read-only media");
 		err = -EROFS;
 		goto out_free;
 	}
@@ -1224,7 +1225,7 @@ static int mount_ubifs(struct ubifs_info *c)
 	 * or overridden by mount options is actually compiled in.
 	 */
 	if (!ubifs_compr_present(c->default_compr)) {
-		ubifs_err("'compressor \"%s\" is not compiled in",
+		ubifs_err(c, "'compressor \"%s\" is not compiled in",
 			  ubifs_compr_name(c->default_compr));
 		err = -ENOTSUPP;
 		goto out_free;
@@ -1253,7 +1254,7 @@ static int mount_ubifs(struct ubifs_info *c)
 		if (IS_ERR(c->bgt)) {
 			err = PTR_ERR(c->bgt);
 			c->bgt = NULL;
-			ubifs_err("cannot spawn \"%s\", error %d",
+			ubifs_err(c, "cannot spawn \"%s\", error %d",
 				  c->bgt_name, err);
 			goto out_wbufs;
 		}
@@ -1267,7 +1268,7 @@ static int mount_ubifs(struct ubifs_info *c)
 	init_constants_master(c);
 
 	if ((c->mst_node->flags & cpu_to_le32(UBIFS_MST_DIRTY)) != 0) {
-		ubifs_msg("recovery needed");
+		ubifs_msg(c, "recovery needed");
 		c->need_recovery = 1;
 	}
 
@@ -1376,10 +1377,10 @@ static int mount_ubifs(struct ubifs_info *c)
 
 	if (c->need_recovery) {
 		if (c->ro_mount)
-			ubifs_msg("recovery deferred");
+			ubifs_msg(c, "recovery deferred");
 		else {
 			c->need_recovery = 0;
-			ubifs_msg("recovery completed");
+			ubifs_msg(c, "recovery completed");
 			/*
 			 * GC LEB has to be empty and taken at this point. But
 			 * the journal head LEBs may also be accounted as
@@ -1400,20 +1401,20 @@ static int mount_ubifs(struct ubifs_info *c)
 
 	c->mounting = 0;
 
-	ubifs_msg("mounted UBI device %d, volume %d, name \"%s\"%s",
+	ubifs_msg(c, "UBIFS: mounted UBI device %d, volume %d, name \"%s\"%s",
 		  c->vi.ubi_num, c->vi.vol_id, c->vi.name,
 		  c->ro_mount ? ", R/O mode" : "");
 	x = (long long)c->main_lebs * c->leb_size;
 	y = (long long)c->log_lebs * c->leb_size + c->max_bud_bytes;
-	ubifs_msg("LEB size: %d bytes (%d KiB), min./max. I/O unit sizes: %d bytes/%d bytes",
+	ubifs_msg(c, "LEB size: %d bytes (%d KiB), min./max. I/O unit sizes: %d bytes/%d bytes",
 		  c->leb_size, c->leb_size >> 10, c->min_io_size,
 		  c->max_write_size);
-	ubifs_msg("FS size: %lld bytes (%lld MiB, %d LEBs), journal size %lld bytes (%lld MiB, %d LEBs)",
+	ubifs_msg(c, "FS size: %lld bytes (%lld MiB, %d LEBs), journal size %lld bytes (%lld MiB, %d LEBs)",
 		  x, x >> 20, c->main_lebs,
 		  y, y >> 20, c->log_lebs + c->max_bud_cnt);
-	ubifs_msg("reserved for root: %llu bytes (%llu KiB)",
+	ubifs_msg(c, "reserved for root: %llu bytes (%llu KiB)",
 		  c->report_rp_size, c->report_rp_size >> 10);
-	ubifs_msg("media format: w%d/r%d (latest is w%d/r%d), UUID %pUB%s",
+	ubifs_msg(c, "media format: w%d/r%d (latest is w%d/r%d), UUID %pUB%s",
 		  c->fmt_version, c->ro_compat_version,
 		  UBIFS_FORMAT_VERSION, UBIFS_RO_COMPAT_VERSION, c->uuid,
 		  c->big_lpt ? ", big LPT model" : ", small LPT model");
@@ -1546,8 +1547,8 @@ static int ubifs_remount_rw(struct ubifs_info *c)
 	int err, lnum;
 
 	if (c->rw_incompat) {
-		ubifs_err("the file-system is not R/W-compatible");
-		ubifs_msg("on-flash format version is w%d/r%d, but software only supports up to version w%d/r%d",
+		ubifs_err(c, "the file-system is not R/W-compatible");
+		ubifs_msg(c, "on-flash format version is w%d/r%d, but software only supports up to version w%d/r%d",
 			  c->fmt_version, c->ro_compat_version,
 			  UBIFS_FORMAT_VERSION, UBIFS_RO_COMPAT_VERSION);
 		return -EROFS;
@@ -1584,7 +1585,7 @@ static int ubifs_remount_rw(struct ubifs_info *c)
 	}
 
 	if (c->need_recovery) {
-		ubifs_msg("completing deferred recovery");
+		ubifs_msg(c, "completing deferred recovery");
 		err = ubifs_write_rcvrd_mst_node(c);
 		if (err)
 			goto out;
@@ -1633,7 +1634,7 @@ static int ubifs_remount_rw(struct ubifs_info *c)
 	if (IS_ERR(c->bgt)) {
 		err = PTR_ERR(c->bgt);
 		c->bgt = NULL;
-		ubifs_err("cannot spawn \"%s\", error %d",
+		ubifs_err(c, "cannot spawn \"%s\", error %d",
 			  c->bgt_name, err);
 		goto out;
 	}
@@ -1667,7 +1668,7 @@ static int ubifs_remount_rw(struct ubifs_info *c)
 
 	if (c->need_recovery) {
 		c->need_recovery = 0;
-		ubifs_msg("deferred recovery completed");
+		ubifs_msg(c, "deferred recovery completed");
 	} else {
 		/*
 		 * Do not run the debugging space check if the were doing
@@ -1755,8 +1756,7 @@ static void ubifs_put_super(struct super_block *sb)
 	int i;
 	struct ubifs_info *c = sb->s_fs_info;
 
-	ubifs_msg("un-mount UBI device %d, volume %d", c->vi.ubi_num,
-		  c->vi.vol_id);
+	ubifs_msg(c, "un-mount UBI device %d", c->vi.ubi_num);
 
 	/*
 	 * The following asserts are only valid if there has not been a failure
@@ -1812,7 +1812,7 @@ static void ubifs_put_super(struct super_block *sb)
 				 * next mount, so we just print a message and
 				 * continue to unmount normally.
 				 */
-				ubifs_err("failed to write master node, error %d",
+				ubifs_err(c, "failed to write master node, error %d",
 					  err);
 		} else {
 			for (i = 0; i < c->jhead_cnt; i++)
@@ -1837,17 +1837,17 @@ static int ubifs_remount_fs(struct super_block *sb, int *flags, char *data)
 
 	err = ubifs_parse_options(c, data, 1);
 	if (err) {
-		ubifs_err("invalid or unknown remount parameter");
+		ubifs_err(c, "invalid or unknown remount parameter");
 		return err;
 	}
 
 	if (c->ro_mount && !(*flags & MS_RDONLY)) {
 		if (c->ro_error) {
-			ubifs_msg("cannot re-mount R/W due to prior errors");
+			ubifs_msg(c, "cannot re-mount R/W due to prior errors");
 			return -EROFS;
 		}
 		if (c->ro_media) {
-			ubifs_msg("cannot re-mount R/W - UBI volume is R/O");
+			ubifs_msg(c, "cannot re-mount R/W - UBI volume is R/O");
 			return -EROFS;
 		}
 		err = ubifs_remount_rw(c);
@@ -1855,7 +1855,7 @@ static int ubifs_remount_fs(struct super_block *sb, int *flags, char *data)
 			return err;
 	} else if (!c->ro_mount && (*flags & MS_RDONLY)) {
 		if (c->ro_error) {
-			ubifs_msg("cannot re-mount R/O due to prior errors");
+			ubifs_msg(c, "cannot re-mount R/O due to prior errors");
 			return -EROFS;
 		}
 		ubifs_remount_ro(c);
@@ -2107,8 +2107,8 @@ static struct dentry *ubifs_mount(struct file_system_type *fs_type, int flags,
 	 */
 	ubi = open_ubi(name, UBI_READONLY);
 	if (IS_ERR(ubi)) {
-		ubifs_err("cannot open \"%s\", error %d",
-			  name, (int)PTR_ERR(ubi));
+		pr_err("UBIFS error (pid: %d): cannot open \"%s\", error %d",
+		       current->pid, name, (int)PTR_ERR(ubi));
 		return ERR_CAST(ubi);
 	}
 
@@ -2236,8 +2236,8 @@ static int __init ubifs_init(void)
 	 * UBIFS_BLOCK_SIZE. It is assumed that both are powers of 2.
 	 */
 	if (PAGE_CACHE_SIZE < UBIFS_BLOCK_SIZE) {
-		ubifs_err("VFS page cache size is %u bytes, but UBIFS requires at least 4096 bytes",
-			  (unsigned int)PAGE_CACHE_SIZE);
+		pr_err("UBIFS error (pid %d): VFS page cache size is %u bytes, but UBIFS requires at least 4096 bytes",
+		       current->pid, (unsigned int)PAGE_CACHE_SIZE);
 		return -EINVAL;
 	}
 
@@ -2260,7 +2260,8 @@ static int __init ubifs_init(void)
 
 	err = register_filesystem(&ubifs_fs_type);
 	if (err) {
-		ubifs_err("cannot register file system, error %d", err);
+		pr_err("UBIFS error (pid %d): cannot register file system, error %d",
+		       current->pid, err);
 		goto out_dbg;
 	}
 	return 0;
diff --git a/fs/ubifs/tnc.c b/fs/ubifs/tnc.c
index 6793db0..957f575 100644
--- a/fs/ubifs/tnc.c
+++ b/fs/ubifs/tnc.c
@@ -98,7 +98,7 @@ static int insert_old_idx(struct ubifs_info *c, int lnum, int offs)
 		else if (offs > o->offs)
 			p = &(*p)->rb_right;
 		else {
-			ubifs_err("old idx added twice!");
+			ubifs_err(c, "old idx added twice!");
 			kfree(old_idx);
 			return 0;
 		}
@@ -447,7 +447,7 @@ static int try_read_node(const struct ubifs_info *c, void *buf, int type,
 
 	err = ubifs_leb_read(c, lnum, buf, offs, len, 1);
 	if (err) {
-		ubifs_err("cannot read node type %d from LEB %d:%d, error %d",
+		ubifs_err(c, "cannot read node type %d from LEB %d:%d, error %d",
 			  type, lnum, offs, err);
 		return err;
 	}
@@ -1684,27 +1684,27 @@ static int validate_data_node(struct ubifs_info *c, void *buf,
 	int err, len;
 
 	if (ch->node_type != UBIFS_DATA_NODE) {
-		ubifs_err("bad node type (%d but expected %d)",
+		ubifs_err(c, "bad node type (%d but expected %d)",
 			  ch->node_type, UBIFS_DATA_NODE);
 		goto out_err;
 	}
 
 	err = ubifs_check_node(c, buf, zbr->lnum, zbr->offs, 0, 0);
 	if (err) {
-		ubifs_err("expected node type %d", UBIFS_DATA_NODE);
+		ubifs_err(c, "expected node type %d", UBIFS_DATA_NODE);
 		goto out;
 	}
 
 	len = le32_to_cpu(ch->len);
 	if (len != zbr->len) {
-		ubifs_err("bad node length %d, expected %d", len, zbr->len);
+		ubifs_err(c, "bad node length %d, expected %d", len, zbr->len);
 		goto out_err;
 	}
 
 	/* Make sure the key of the read node is correct */
 	key_read(c, buf + UBIFS_KEY_OFFSET, &key1);
 	if (!keys_eq(c, &zbr->key, &key1)) {
-		ubifs_err("bad key in node at LEB %d:%d",
+		ubifs_err(c, "bad key in node at LEB %d:%d",
 			  zbr->lnum, zbr->offs);
 		dbg_tnck(&zbr->key, "looked for key ");
 		dbg_tnck(&key1, "found node's key ");
@@ -1716,7 +1716,7 @@ static int validate_data_node(struct ubifs_info *c, void *buf,
 out_err:
 	err = -EINVAL;
 out:
-	ubifs_err("bad node at LEB %d:%d", zbr->lnum, zbr->offs);
+	ubifs_err(c, "bad node at LEB %d:%d", zbr->lnum, zbr->offs);
 	ubifs_dump_node(c, buf);
 	dump_stack();
 	return err;
@@ -1741,7 +1741,7 @@ int ubifs_tnc_bulk_read(struct ubifs_info *c, struct bu_info *bu)
 	len = bu->zbranch[bu->cnt - 1].offs;
 	len += bu->zbranch[bu->cnt - 1].len - offs;
 	if (len > bu->buf_len) {
-		ubifs_err("buffer too small %d vs %d", bu->buf_len, len);
+		ubifs_err(c, "buffer too small %d vs %d", bu->buf_len, len);
 		return -EINVAL;
 	}
 
@@ -1757,7 +1757,7 @@ int ubifs_tnc_bulk_read(struct ubifs_info *c, struct bu_info *bu)
 		return -EAGAIN;
 
 	if (err && err != -EBADMSG) {
-		ubifs_err("failed to read from LEB %d:%d, error %d",
+		ubifs_err(c, "failed to read from LEB %d:%d, error %d",
 			  lnum, offs, err);
 		dump_stack();
 		dbg_tnck(&bu->key, "key ");
@@ -3313,7 +3313,7 @@ int dbg_check_inode_size(struct ubifs_info *c, const struct inode *inode,
 
 out_dump:
 	block = key_block(c, key);
-	ubifs_err("inode %lu has size %lld, but there are data at offset %lld",
+	ubifs_err(c, "inode %lu has size %lld, but there are data at offset %lld",
 		  (unsigned long)inode->i_ino, size,
 		  ((loff_t)block) << UBIFS_BLOCK_SHIFT);
 	mutex_unlock(&c->tnc_mutex);
diff --git a/fs/ubifs/tnc_commit.c b/fs/ubifs/tnc_commit.c
index 7a205e0..b45345d 100644
--- a/fs/ubifs/tnc_commit.c
+++ b/fs/ubifs/tnc_commit.c
@@ -53,7 +53,7 @@ static int make_idx_node(struct ubifs_info *c, struct ubifs_idx_node *idx,
 		br->offs = cpu_to_le32(zbr->offs);
 		br->len = cpu_to_le32(zbr->len);
 		if (!zbr->lnum || !zbr->len) {
-			ubifs_err("bad ref in znode");
+			ubifs_err(c, "bad ref in znode");
 			ubifs_dump_znode(c, znode);
 			if (zbr->znode)
 				ubifs_dump_znode(c, zbr->znode);
@@ -384,7 +384,7 @@ static int layout_in_gaps(struct ubifs_info *c, int cnt)
 				 * Do not print scary warnings if the debugging
 				 * option which forces in-the-gaps is enabled.
 				 */
-				ubifs_warn("out of space");
+				ubifs_warn(c, "out of space");
 				ubifs_dump_budg(c, &c->bi);
 				ubifs_dump_lprops(c);
 			}
@@ -441,7 +441,7 @@ static int layout_in_empty_space(struct ubifs_info *c)
 		/* Determine the index node position */
 		if (lnum == -1) {
 			if (c->ileb_nxt >= c->ileb_cnt) {
-				ubifs_err("out of space");
+				ubifs_err(c, "out of space");
 				return -ENOSPC;
 			}
 			lnum = c->ilebs[c->ileb_nxt++];
@@ -855,7 +855,7 @@ static int write_index(struct ubifs_info *c)
 			br->offs = cpu_to_le32(zbr->offs);
 			br->len = cpu_to_le32(zbr->len);
 			if (!zbr->lnum || !zbr->len) {
-				ubifs_err("bad ref in znode");
+				ubifs_err(c, "bad ref in znode");
 				ubifs_dump_znode(c, znode);
 				if (zbr->znode)
 					ubifs_dump_znode(c, zbr->znode);
@@ -875,7 +875,7 @@ static int write_index(struct ubifs_info *c)
 
 		if (lnum != znode->lnum || offs != znode->offs ||
 		    len != znode->len) {
-			ubifs_err("inconsistent znode posn");
+			ubifs_err(c, "inconsistent znode posn");
 			return -EINVAL;
 		}
 
@@ -973,7 +973,7 @@ static int write_index(struct ubifs_info *c)
 
 	if (lnum != c->dbg->new_ihead_lnum ||
 	    buf_offs != c->dbg->new_ihead_offs) {
-		ubifs_err("inconsistent ihead");
+		ubifs_err(c, "inconsistent ihead");
 		return -EINVAL;
 	}
 
diff --git a/fs/ubifs/tnc_misc.c b/fs/ubifs/tnc_misc.c
index f6bf899..93f5b78 100644
--- a/fs/ubifs/tnc_misc.c
+++ b/fs/ubifs/tnc_misc.c
@@ -293,9 +293,9 @@ static int read_znode(struct ubifs_info *c, int lnum, int offs, int len,
 		lnum, offs, znode->level, znode->child_cnt);
 
 	if (znode->child_cnt > c->fanout || znode->level > UBIFS_MAX_LEVELS) {
-		ubifs_err("current fanout %d, branch count %d",
+		ubifs_err(c, "current fanout %d, branch count %d",
 			  c->fanout, znode->child_cnt);
-		ubifs_err("max levels %d, znode level %d",
+		ubifs_err(c, "max levels %d, znode level %d",
 			  UBIFS_MAX_LEVELS, znode->level);
 		err = 1;
 		goto out_dump;
@@ -316,7 +316,7 @@ static int read_znode(struct ubifs_info *c, int lnum, int offs, int len,
 		if (zbr->lnum < c->main_first ||
 		    zbr->lnum >= c->leb_cnt || zbr->offs < 0 ||
 		    zbr->offs + zbr->len > c->leb_size || zbr->offs & 7) {
-			ubifs_err("bad branch %d", i);
+			ubifs_err(c, "bad branch %d", i);
 			err = 2;
 			goto out_dump;
 		}
@@ -328,7 +328,7 @@ static int read_znode(struct ubifs_info *c, int lnum, int offs, int len,
 		case UBIFS_XENT_KEY:
 			break;
 		default:
-			ubifs_err("bad key type at slot %d: %d",
+			ubifs_err(c, "bad key type at slot %d: %d",
 				  i, key_type(c, &zbr->key));
 			err = 3;
 			goto out_dump;
@@ -340,17 +340,17 @@ static int read_znode(struct ubifs_info *c, int lnum, int offs, int len,
 		type = key_type(c, &zbr->key);
 		if (c->ranges[type].max_len == 0) {
 			if (zbr->len != c->ranges[type].len) {
-				ubifs_err("bad target node (type %d) length (%d)",
+				ubifs_err(c, "bad target node (type %d) length (%d)",
 					  type, zbr->len);
-				ubifs_err("have to be %d", c->ranges[type].len);
+				ubifs_err(c, "have to be %d", c->ranges[type].len);
 				err = 4;
 				goto out_dump;
 			}
 		} else if (zbr->len < c->ranges[type].min_len ||
 			   zbr->len > c->ranges[type].max_len) {
-			ubifs_err("bad target node (type %d) length (%d)",
+			ubifs_err(c, "bad target node (type %d) length (%d)",
 				  type, zbr->len);
-			ubifs_err("have to be in range of %d-%d",
+			ubifs_err(c, "have to be in range of %d-%d",
 				  c->ranges[type].min_len,
 				  c->ranges[type].max_len);
 			err = 5;
@@ -370,12 +370,12 @@ static int read_znode(struct ubifs_info *c, int lnum, int offs, int len,
 
 		cmp = keys_cmp(c, key1, key2);
 		if (cmp > 0) {
-			ubifs_err("bad key order (keys %d and %d)", i, i + 1);
+			ubifs_err(c, "bad key order (keys %d and %d)", i, i + 1);
 			err = 6;
 			goto out_dump;
 		} else if (cmp == 0 && !is_hash_key(c, key1)) {
 			/* These can only be keys with colliding hash */
-			ubifs_err("keys %d and %d are not hashed but equivalent",
+			ubifs_err(c, "keys %d and %d are not hashed but equivalent",
 				  i, i + 1);
 			err = 7;
 			goto out_dump;
@@ -386,7 +386,7 @@ static int read_znode(struct ubifs_info *c, int lnum, int offs, int len,
 	return 0;
 
 out_dump:
-	ubifs_err("bad indexing node at LEB %d:%d, error %d", lnum, offs, err);
+	ubifs_err(c, "bad indexing node at LEB %d:%d, error %d", lnum, offs, err);
 	ubifs_dump_node(c, idx);
 	kfree(idx);
 	return -EINVAL;
@@ -482,7 +482,7 @@ int ubifs_tnc_read_node(struct ubifs_info *c, struct ubifs_zbranch *zbr,
 	/* Make sure the key of the read node is correct */
 	key_read(c, node + UBIFS_KEY_OFFSET, &key1);
 	if (!keys_eq(c, key, &key1)) {
-		ubifs_err("bad key in node at LEB %d:%d",
+		ubifs_err(c, "bad key in node at LEB %d:%d",
 			  zbr->lnum, zbr->offs);
 		dbg_tnck(key, "looked for key ");
 		dbg_tnck(&key1, "but found node's key ");
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index bc04b9c..80123c1 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -43,15 +43,19 @@
 #define UBIFS_VERSION 1
 
 /* Normal UBIFS messages */
-#define ubifs_msg(fmt, ...) pr_notice("UBIFS: " fmt "\n", ##__VA_ARGS__)
+#define ubifs_msg(c, fmt, ...)                                      \
+	pr_notice("UBIFS (ubi%d:%d): " fmt "\n",                    \
+		  c->vi.ubi_num, c->vi.vol_id, ##__VA_ARGS__)
 /* UBIFS error messages */
-#define ubifs_err(fmt, ...)                                         \
-	pr_err("UBIFS error (pid %d): %s: " fmt "\n", current->pid, \
+#define ubifs_err(c, fmt, ...)                                      \
+	pr_err("UBIFS error (ubi%d:%d pid %d): %s: " fmt "\n",      \
+	       c->vi.ubi_num, c->vi.vol_id, current->pid,           \
 	       __func__, ##__VA_ARGS__)
 /* UBIFS warning messages */
-#define ubifs_warn(fmt, ...)                                        \
-	pr_warn("UBIFS warning (pid %d): %s: " fmt "\n",            \
-		current->pid, __func__, ##__VA_ARGS__)
+#define ubifs_warn(c, fmt, ...)                                     \
+	pr_warn("UBIFS warning (ubi%d:%d pid %d): %s: " fmt "\n",   \
+		c->vi.ubi_num, c->vi.vol_id, current->pid,          \
+		__func__, ##__VA_ARGS__)
 /*
  * A variant of 'ubifs_err()' which takes the UBIFS file-sytem description
  * object as an argument.
@@ -59,7 +63,7 @@
 #define ubifs_errc(c, fmt, ...)                                     \
 	do {                                                        \
 		if (!(c)->probing)                                  \
-			ubifs_err(fmt, ##__VA_ARGS__);              \
+			ubifs_err((c), fmt, ##__VA_ARGS__);         \
 	} while (0)
 
 /* UBIFS file system VFS magic number */
@@ -1787,10 +1791,10 @@ long ubifs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg);
 /* compressor.c */
 int __init ubifs_compressors_init(void);
 void ubifs_compressors_exit(void);
-void ubifs_compress(const void *in_buf, int in_len, void *out_buf, int *out_len,
-		    int *compr_type);
-int ubifs_decompress(const void *buf, int len, void *out, int *out_len,
-		     int compr_type);
+void ubifs_compress(const struct ubifs_info *c, const void *in_buf, int in_len,
+		    void *out_buf, int *out_len, int *compr_type);
+int ubifs_decompress(const struct ubifs_info *c, const void *buf, int len,
+		     void *out, int *out_len, int compr_type);
 
 #include "debug.h"
 #include "misc.h"
diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index a92be24..3659b19 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -108,7 +108,7 @@ static int create_xattr(struct ubifs_info *c, struct inode *host,
 				.dirtied_ino_d = ALIGN(host_ui->data_len, 8) };
 
 	if (host_ui->xattr_cnt >= MAX_XATTRS_PER_INODE) {
-		ubifs_err("inode %lu already has too many xattrs (%d), cannot create more",
+		ubifs_err(c, "inode %lu already has too many xattrs (%d), cannot create more",
 			  host->i_ino, host_ui->xattr_cnt);
 		return -ENOSPC;
 	}
@@ -120,7 +120,7 @@ static int create_xattr(struct ubifs_info *c, struct inode *host,
 	 */
 	names_len = host_ui->xattr_names + host_ui->xattr_cnt + nm->len + 1;
 	if (names_len > XATTR_LIST_MAX) {
-		ubifs_err("cannot add one more xattr name to inode %lu, total names length would become %d, max. is %d",
+		ubifs_err(c, "cannot add one more xattr name to inode %lu, total names length would become %d, max. is %d",
 			  host->i_ino, names_len, XATTR_LIST_MAX);
 		return -ENOSPC;
 	}
@@ -288,13 +288,13 @@ static struct inode *iget_xattr(struct ubifs_info *c, ino_t inum)
 
 	inode = ubifs_iget(c->vfs_sb, inum);
 	if (IS_ERR(inode)) {
-		ubifs_err("dead extended attribute entry, error %d",
+		ubifs_err(c, "dead extended attribute entry, error %d",
 			  (int)PTR_ERR(inode));
 		return inode;
 	}
 	if (ubifs_inode(inode)->xattr)
 		return inode;
-	ubifs_err("corrupt extended attribute entry");
+	ubifs_err(c, "corrupt extended attribute entry");
 	iput(inode);
 	return ERR_PTR(-EINVAL);
 }
@@ -412,7 +412,7 @@ ssize_t ubifs_getxattr(struct dentry *dentry, const char *name, void *buf,
 	if (buf) {
 		/* If @buf is %NULL we are supposed to return the length */
 		if (ui->data_len > size) {
-			ubifs_err("buffer size %zd, xattr len %d",
+			ubifs_err(c, "buffer size %zd, xattr len %d",
 				  size, ui->data_len);
 			err = -ERANGE;
 			goto out_iput;
@@ -485,7 +485,7 @@ ssize_t ubifs_listxattr(struct dentry *dentry, char *buffer, size_t size)
 
 	kfree(pxent);
 	if (err != -ENOENT) {
-		ubifs_err("cannot find next direntry, error %d", err);
+		ubifs_err(c, "cannot find next direntry, error %d", err);
 		return err;
 	}
 
@@ -657,8 +657,10 @@ int ubifs_init_security(struct inode *dentry, struct inode *inode,
 					   &init_xattrs, 0);
 	mutex_unlock(&inode->i_mutex);
 
-	if (err)
-		ubifs_err("cannot initialize security for inode %lu, error %d",
+	if (err) {
+		struct ubifs_info *c = dentry->i_sb->s_fs_info;
+		ubifs_err(c, "cannot initialize security for inode %lu, error %d",
 			  inode->i_ino, err);
+	}
 	return err;
 }
-- 
1.8.3.4
