Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bkGoq-000828-LK
 for linux-mtd@lists.infradead.org; Wed, 14 Sep 2016 20:30:12 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, richard@nod.at, dedekind1@gmail.com,
 adrian.hunter@intel.com, nbd@nbd.name
Subject: [PATCH 2/4] ubifs: Implement RENAME_WHITEOUT
Date: Wed, 14 Sep 2016 22:28:50 +0200
Message-Id: <1473884932-23689-3-git-send-email-richard@nod.at>
In-Reply-To: <1473884932-23689-1-git-send-email-richard@nod.at>
References: <1473884932-23689-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Adds RENAME_WHITEOUT support to UBIFS, we implement
it in the same way as ext4 and xfs do.
For an overview of other ways to implement it please
refere to commit 7dcf5c3e4527 ("xfs: add RENAME_WHITEOUT support").

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/dir.c     | 120 ++++++++++++++++++++++++++++++++++++++++++++---------
 fs/ubifs/journal.c |  43 +++++++++++++------
 fs/ubifs/ubifs.h   |   4 +-
 3 files changed, 134 insertions(+), 33 deletions(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 8460f48..e028253 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -301,8 +301,8 @@ out_budg:
 	return err;
 }
 
-static int ubifs_tmpfile(struct inode *dir, struct dentry *dentry,
-			 umode_t mode)
+static int do_tmpfile(struct inode *dir, struct dentry *dentry,
+		      umode_t mode, struct inode **whiteout)
 {
 	struct inode *inode;
 	struct ubifs_info *c = dir->i_sb->s_fs_info;
@@ -336,14 +336,27 @@ static int ubifs_tmpfile(struct inode *dir, struct dentry *dentry,
 	}
 	ui = ubifs_inode(inode);
 
+	if (whiteout) {
+		init_special_inode(inode, inode->i_mode, WHITEOUT_DEV);
+		ubifs_assert(inode->i_op == &ubifs_file_inode_operations);
+	}
+
 	err = ubifs_init_security(dir, inode, &dentry->d_name);
 	if (err)
 		goto out_inode;
 
 	mutex_lock(&ui->ui_mutex);
 	insert_inode_hash(inode);
-	d_tmpfile(dentry, inode);
+
+	if (whiteout) {
+		mark_inode_dirty(inode);
+		drop_nlink(inode);
+		*whiteout = inode;
+	} else {
+		d_tmpfile(dentry, inode);
+	}
 	ubifs_assert(ui->dirty);
+
 	instantiated = 1;
 	mutex_unlock(&ui->ui_mutex);
 
@@ -371,6 +384,12 @@ out_budg:
 	return err;
 }
 
+static int ubifs_tmpfile(struct inode *dir, struct dentry *dentry,
+			 umode_t mode)
+{
+	return do_tmpfile(dir, dentry, mode, NULL);
+}
+
 /**
  * vfs_dent_type - get VFS directory entry type.
  * @type: UBIFS directory entry type
@@ -997,37 +1016,43 @@ out_budg:
 }
 
 /**
- * lock_3_inodes - a wrapper for locking three UBIFS inodes.
+ * lock_4_inodes - a wrapper for locking three UBIFS inodes.
  * @inode1: first inode
  * @inode2: second inode
  * @inode3: third inode
+ * @inode4: fouth inode
  *
  * This function is used for 'ubifs_rename()' and @inode1 may be the same as
- * @inode2 whereas @inode3 may be %NULL.
+ * @inode2 whereas @inode3 and @inode4 may be %NULL.
  *
  * We do not implement any tricks to guarantee strict lock ordering, because
  * VFS has already done it for us on the @i_mutex. So this is just a simple
  * wrapper function.
  */
-static void lock_3_inodes(struct inode *inode1, struct inode *inode2,
-			  struct inode *inode3)
+static void lock_4_inodes(struct inode *inode1, struct inode *inode2,
+			  struct inode *inode3, struct inode *inode4)
 {
 	mutex_lock_nested(&ubifs_inode(inode1)->ui_mutex, WB_MUTEX_1);
 	if (inode2 != inode1)
 		mutex_lock_nested(&ubifs_inode(inode2)->ui_mutex, WB_MUTEX_2);
 	if (inode3)
 		mutex_lock_nested(&ubifs_inode(inode3)->ui_mutex, WB_MUTEX_3);
+	if (inode4)
+		mutex_lock_nested(&ubifs_inode(inode4)->ui_mutex, WB_MUTEX_4);
 }
 
 /**
- * unlock_3_inodes - a wrapper for unlocking three UBIFS inodes for rename.
+ * unlock_4_inodes - a wrapper for unlocking three UBIFS inodes for rename.
  * @inode1: first inode
  * @inode2: second inode
  * @inode3: third inode
+ * @inode4: fouth inode
  */
-static void unlock_3_inodes(struct inode *inode1, struct inode *inode2,
-			    struct inode *inode3)
+static void unlock_4_inodes(struct inode *inode1, struct inode *inode2,
+			    struct inode *inode3, struct inode *inode4)
 {
+	if (inode4)
+		mutex_unlock(&ubifs_inode(inode4)->ui_mutex);
 	if (inode3)
 		mutex_unlock(&ubifs_inode(inode3)->ui_mutex);
 	if (inode1 != inode2)
@@ -1036,12 +1061,15 @@ static void unlock_3_inodes(struct inode *inode1, struct inode *inode2,
 }
 
 static int ubifs_rename(struct inode *old_dir, struct dentry *old_dentry,
-			struct inode *new_dir, struct dentry *new_dentry)
+			struct inode *new_dir, struct dentry *new_dentry,
+			unsigned int flags)
 {
 	struct ubifs_info *c = old_dir->i_sb->s_fs_info;
 	struct inode *old_inode = d_inode(old_dentry);
 	struct inode *new_inode = d_inode(new_dentry);
+	struct inode *whiteout = NULL;
 	struct ubifs_inode *old_inode_ui = ubifs_inode(old_inode);
+	struct ubifs_inode *whiteout_ui = NULL;
 	int err, release, sync = 0, move = (new_dir != old_dir);
 	int is_dir = S_ISDIR(old_inode->i_mode);
 	int unlink = !!new_inode;
@@ -1063,15 +1091,18 @@ static int ubifs_rename(struct inode *old_dir, struct dentry *old_dentry,
 	 * separately.
 	 */
 
-	dbg_gen("dent '%pd' ino %lu in dir ino %lu to dent '%pd' in dir ino %lu",
+	dbg_gen("dent '%pd' ino %lu in dir ino %lu to dent '%pd' in dir ino %lu flags 0x%x",
 		old_dentry, old_inode->i_ino, old_dir->i_ino,
-		new_dentry, new_dir->i_ino);
+		new_dentry, new_dir->i_ino, flags);
+
+	if (flags & ~(RENAME_NOREPLACE | RENAME_WHITEOUT))
+		return -EINVAL;
+
 	ubifs_assert(inode_is_locked(old_dir));
 	ubifs_assert(inode_is_locked(new_dir));
 	if (unlink)
 		ubifs_assert(inode_is_locked(new_inode));
 
-
 	if (unlink && is_dir) {
 		err = check_dir_empty(c, new_inode);
 		if (err)
@@ -1087,7 +1118,32 @@ static int ubifs_rename(struct inode *old_dir, struct dentry *old_dentry,
 		return err;
 	}
 
-	lock_3_inodes(old_dir, new_dir, new_inode);
+	if (flags & RENAME_WHITEOUT) {
+		union ubifs_dev_desc *dev = NULL;
+
+		dev = kmalloc(sizeof(union ubifs_dev_desc), GFP_NOFS);
+		if (!dev) {
+			ubifs_release_budget(c, &req);
+			ubifs_release_budget(c, &ino_req);
+			return -ENOMEM;
+		}
+
+		err = do_tmpfile(old_dir, old_dentry, S_IFCHR | WHITEOUT_MODE, &whiteout);
+		if (err) {
+			ubifs_release_budget(c, &req);
+			ubifs_release_budget(c, &ino_req);
+			kfree(dev);
+			return err;
+		}
+
+		whiteout->i_state |= I_LINKABLE;
+		whiteout_ui = ubifs_inode(whiteout);
+		whiteout_ui->data = dev;
+		whiteout_ui->data_len = ubifs_encode_dev(dev, MKDEV(0, 0));
+		ubifs_assert(!whiteout_ui->dirty);
+	}
+
+	lock_4_inodes(old_dir, new_dir, new_inode, whiteout);
 
 	/*
 	 * Like most other Unix systems, set the @i_ctime for inodes on a
@@ -1157,12 +1213,34 @@ static int ubifs_rename(struct inode *old_dir, struct dentry *old_dentry,
 		if (unlink && IS_SYNC(new_inode))
 			sync = 1;
 	}
-	err = ubifs_jnl_rename(c, old_dir, old_dentry, new_dir, new_dentry,
+
+	if (whiteout) {
+		struct ubifs_budget_req wht_req = { .dirtied_ino = 1,
+				.dirtied_ino_d = \
+				ALIGN(ubifs_inode(whiteout)->data_len, 8) };
+
+		err = ubifs_budget_space(c, &wht_req);
+		if (err) {
+			ubifs_release_budget(c, &req);
+			ubifs_release_budget(c, &ino_req);
+			kfree(whiteout_ui->data);
+			whiteout_ui->data_len = 0;
+			iput(whiteout);
+			return err;
+		}
+
+		inc_nlink(whiteout);
+		mark_inode_dirty(whiteout);
+		whiteout->i_state &= ~I_LINKABLE;
+		iput(whiteout);
+	}
+
+	err = ubifs_jnl_rename(c, old_dir, old_dentry, new_dir, new_dentry, whiteout,
 			       sync);
 	if (err)
 		goto out_cancel;
 
-	unlock_3_inodes(old_dir, new_dir, new_inode);
+	unlock_4_inodes(old_dir, new_dir, new_inode, whiteout);
 	ubifs_release_budget(c, &req);
 
 	mutex_lock(&old_inode_ui->ui_mutex);
@@ -1195,7 +1273,11 @@ out_cancel:
 				inc_nlink(old_dir);
 		}
 	}
-	unlock_3_inodes(old_dir, new_dir, new_inode);
+	if (whiteout) {
+		drop_nlink(whiteout);
+		iput(whiteout);
+	}
+	unlock_4_inodes(old_dir, new_dir, new_inode, whiteout);
 	ubifs_release_budget(c, &ino_req);
 	ubifs_release_budget(c, &req);
 	return err;
@@ -1249,7 +1331,7 @@ const struct inode_operations ubifs_dir_inode_operations = {
 	.mkdir       = ubifs_mkdir,
 	.rmdir       = ubifs_rmdir,
 	.mknod       = ubifs_mknod,
-	.rename      = ubifs_rename,
+	.rename2     = ubifs_rename,
 	.setattr     = ubifs_setattr,
 	.getattr     = ubifs_getattr,
 	.setxattr    = generic_setxattr,
diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 0b9da5b..6b27ddd 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -917,14 +917,15 @@ int ubifs_jnl_delete_inode(struct ubifs_info *c, const struct inode *inode)
  * @sync: non-zero if the write-buffer has to be synchronized
  *
  * This function implements the re-name operation which may involve writing up
- * to 3 inodes and 2 directory entries. It marks the written inodes as clean
+ * to 4 inodes and 2 directory entries. It marks the written inodes as clean
  * and returns zero on success. In case of failure, a negative error code is
  * returned.
  */
 int ubifs_jnl_rename(struct ubifs_info *c, const struct inode *old_dir,
 		     const struct dentry *old_dentry,
 		     const struct inode *new_dir,
-		     const struct dentry *new_dentry, int sync)
+		     const struct dentry *new_dentry,
+		     const struct inode *whiteout, int sync)
 {
 	void *p;
 	union ubifs_key key;
@@ -980,13 +981,19 @@ int ubifs_jnl_rename(struct ubifs_info *c, const struct inode *old_dir,
 	zero_dent_node_unused(dent);
 	ubifs_prep_grp_node(c, dent, dlen1, 0);
 
-	/* Make deletion dent */
 	dent2 = (void *)dent + aligned_dlen1;
 	dent2->ch.node_type = UBIFS_DENT_NODE;
 	dent_key_init_flash(c, &dent2->key, old_dir->i_ino,
 			    &old_dentry->d_name);
-	dent2->inum = 0;
-	dent2->type = DT_UNKNOWN;
+
+	if (whiteout) {
+		dent2->inum = cpu_to_le64(whiteout->i_ino);
+		dent2->type = get_dent_type(whiteout->i_mode);
+	} else {
+		/* Make deletion dent */
+		dent2->inum = 0;
+		dent2->type = DT_UNKNOWN;
+	}
 	dent2->nlen = cpu_to_le16(old_dentry->d_name.len);
 	memcpy(dent2->name, old_dentry->d_name.name, old_dentry->d_name.len);
 	dent2->name[old_dentry->d_name.len] = '\0';
@@ -1035,16 +1042,26 @@ int ubifs_jnl_rename(struct ubifs_info *c, const struct inode *old_dir,
 	if (err)
 		goto out_ro;
 
-	err = ubifs_add_dirt(c, lnum, dlen2);
-	if (err)
-		goto out_ro;
+	offs += aligned_dlen1;
+	if (whiteout) {
+		dent_key_init(c, &key, old_dir->i_ino, &old_dentry->d_name);
+		err = ubifs_tnc_add_nm(c, &key, lnum, offs, dlen2, &old_dentry->d_name);
+		if (err)
+			goto out_ro;
 
-	dent_key_init(c, &key, old_dir->i_ino, &old_dentry->d_name);
-	err = ubifs_tnc_remove_nm(c, &key, &old_dentry->d_name);
-	if (err)
-		goto out_ro;
+		ubifs_delete_orphan(c, whiteout->i_ino);
+	} else {
+		err = ubifs_add_dirt(c, lnum, dlen2);
+		if (err)
+			goto out_ro;
+
+		dent_key_init(c, &key, old_dir->i_ino, &old_dentry->d_name);
+		err = ubifs_tnc_remove_nm(c, &key, &old_dentry->d_name);
+		if (err)
+			goto out_ro;
+	}
 
-	offs += aligned_dlen1 + aligned_dlen2;
+	offs += aligned_dlen2;
 	if (new_inode) {
 		ino_key_init(c, &key, new_inode->i_ino);
 		err = ubifs_tnc_add(c, &key, lnum, offs, ilen);
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 4617d45..ca86c93 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -157,6 +157,7 @@ enum {
 	WB_MUTEX_1 = 0,
 	WB_MUTEX_2 = 1,
 	WB_MUTEX_3 = 2,
+	WB_MUTEX_4 = 3,
 };
 
 /*
@@ -1523,7 +1524,8 @@ int ubifs_jnl_delete_inode(struct ubifs_info *c, const struct inode *inode);
 int ubifs_jnl_rename(struct ubifs_info *c, const struct inode *old_dir,
 		     const struct dentry *old_dentry,
 		     const struct inode *new_dir,
-		     const struct dentry *new_dentry, int sync);
+		     const struct dentry *new_dentry,
+		     const struct inode *whiteout, int sync);
 int ubifs_jnl_truncate(struct ubifs_info *c, const struct inode *inode,
 		       loff_t old_size, loff_t new_size);
 int ubifs_jnl_delete_xattr(struct ubifs_info *c, const struct inode *host,
-- 
2.7.3
