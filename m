Received: from mail.sigma-star.at ([95.130.255.111])
 by casper.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCYo0-00011I-6w
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2016 21:22:15 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david@sigma-star.at, tytso@mit.edu, dedekind1@gmail.com,
 ebiggers@google.com, mhalcrow@google.com, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org, hch@infradead.org,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, dengler@linutronix.de,
 sbabic@denx.de, wd@denx.de, Richard Weinberger <richard@nod.at>
Subject: [PATCH 17/24] ubifs: Implement encrypted filenames
Date: Thu,  1 Dec 2016 22:21:04 +0100
Message-Id: <1480627271-10441-18-git-send-email-richard@nod.at>
In-Reply-To: <1480627271-10441-1-git-send-email-richard@nod.at>
References: <1480627271-10441-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Richard Weinberger <richard@nod.at>
Signed-off-by: David Gstir <david@sigma-star.at>
---
 fs/ubifs/debug.c   |  14 +--
 fs/ubifs/dir.c     | 323 +++++++++++++++++++++++++++++++++++++++++++----------
 fs/ubifs/journal.c | 123 ++++++++++----------
 fs/ubifs/key.h     |  19 ++--
 fs/ubifs/replay.c  |   8 +-
 fs/ubifs/tnc.c     |  54 ++++-----
 fs/ubifs/ubifs.h   |  24 ++--
 fs/ubifs/xattr.c   |  46 ++++----
 8 files changed, 414 insertions(+), 197 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 69e287e20732..1e712a364680 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -233,7 +233,7 @@ static void dump_ch(const struct ubifs_ch *ch)
 void ubifs_dump_inode(struct ubifs_info *c, const struct inode *inode)
 {
 	const struct ubifs_inode *ui = ubifs_inode(inode);
-	struct qstr nm = { .name = NULL };
+	struct fscrypt_name nm = {0};
 	union ubifs_key key;
 	struct ubifs_dent_node *dent, *pdent = NULL;
 	int count = 2;
@@ -289,8 +289,8 @@ void ubifs_dump_inode(struct ubifs_info *c, const struct inode *inode)
 		pr_err("\t%d: %s (%s)\n",
 		       count++, dent->name, get_dent_type(dent->type));
 
-		nm.name = dent->name;
-		nm.len = le16_to_cpu(dent->nlen);
+		fname_name(&nm) = dent->name;
+		fname_len(&nm) = le16_to_cpu(dent->nlen);
 		kfree(pdent);
 		pdent = dent;
 		key_read(c, &dent->key, &key);
@@ -1107,7 +1107,7 @@ int dbg_check_dir(struct ubifs_info *c, const struct inode *dir)
 	unsigned int nlink = 2;
 	union ubifs_key key;
 	struct ubifs_dent_node *dent, *pdent = NULL;
-	struct qstr nm = { .name = NULL };
+	struct fscrypt_name nm = {0};
 	loff_t size = UBIFS_INO_NODE_SZ;
 
 	if (!dbg_is_chk_gen(c))
@@ -1128,9 +1128,9 @@ int dbg_check_dir(struct ubifs_info *c, const struct inode *dir)
 			return err;
 		}
 
-		nm.name = dent->name;
-		nm.len = le16_to_cpu(dent->nlen);
-		size += CALC_DENT_SIZE(nm.len);
+		fname_name(&nm) = dent->name;
+		fname_len(&nm) = le16_to_cpu(dent->nlen);
+		size += CALC_DENT_SIZE(fname_len(&nm));
 		if (dent->type == UBIFS_ITYPE_DIR)
 			nlink += 1;
 		kfree(pdent);
diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 9976a709b875..7d1bd4b28140 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -196,13 +196,13 @@ struct inode *ubifs_new_inode(struct ubifs_info *c, struct inode *dir,
 
 static int dbg_check_name(const struct ubifs_info *c,
 			  const struct ubifs_dent_node *dent,
-			  const struct qstr *nm)
+			  const struct fscrypt_name *nm)
 {
 	if (!dbg_is_chk_gen(c))
 		return 0;
-	if (le16_to_cpu(dent->nlen) != nm->len)
+	if (le16_to_cpu(dent->nlen) != fname_len(nm))
 		return -EINVAL;
-	if (memcmp(dent->name, nm->name, nm->len))
+	if (memcmp(dent->name, fname_name(nm), fname_len(nm)))
 		return -EINVAL;
 	return 0;
 }
@@ -215,6 +215,7 @@ static struct dentry *ubifs_lookup(struct inode *dir, struct dentry *dentry,
 	struct inode *inode = NULL;
 	struct ubifs_dent_node *dent;
 	struct ubifs_info *c = dir->i_sb->s_fs_info;
+	struct fscrypt_name nm;
 
 	dbg_gen("'%pd' in dir ino %lu", dentry, dir->i_ino);
 
@@ -233,27 +234,42 @@ static struct dentry *ubifs_lookup(struct inode *dir, struct dentry *dentry,
 			return ERR_PTR(err);
 	}
 
-	if (dentry->d_name.len > UBIFS_MAX_NLEN)
-		return ERR_PTR(-ENAMETOOLONG);
+	err = fscrypt_setup_filename(dir, &dentry->d_name, 1, &nm);
+	if (err)
+		return ERR_PTR(err);
+
+	if (fname_len(&nm) > UBIFS_MAX_NLEN) {
+		err = -ENAMETOOLONG;
+		goto out_fname;
+	}
 
 	dent = kmalloc(UBIFS_MAX_DENT_NODE_SZ, GFP_NOFS);
-	if (!dent)
-		return ERR_PTR(-ENOMEM);
+	if (!dent) {
+		err = -ENOMEM;
+		goto out_fname;
+	}
 
-	dent_key_init(c, &key, dir->i_ino, &dentry->d_name);
+	if (nm.hash) {
+		ubifs_assert(fname_len(&nm) == 0);
+		ubifs_assert(fname_name(&nm) == NULL);
+		dent_key_init_hash(c, &key, dir->i_ino, nm.hash);
+		err = ubifs_tnc_lookup(c, &key, dent);
+	} else {
+		dent_key_init(c, &key, dir->i_ino, &nm);
+		err = ubifs_tnc_lookup_nm(c, &key, dent, &nm);
+	}
 
-	err = ubifs_tnc_lookup_nm(c, &key, dent, &dentry->d_name);
 	if (err) {
 		if (err == -ENOENT) {
 			dbg_gen("not found");
 			goto done;
 		}
-		goto out;
+		goto out_dent;
 	}
 
-	if (dbg_check_name(c, dent, &dentry->d_name)) {
+	if (dbg_check_name(c, dent, &nm)) {
 		err = -EINVAL;
-		goto out;
+		goto out_dent;
 	}
 
 	inode = ubifs_iget(dir->i_sb, le64_to_cpu(dent->inum));
@@ -266,11 +282,12 @@ static struct dentry *ubifs_lookup(struct inode *dir, struct dentry *dentry,
 		ubifs_err(c, "dead directory entry '%pd', error %d",
 			  dentry, err);
 		ubifs_ro_mode(c, err);
-		goto out;
+		goto out_dent;
 	}
 
 done:
 	kfree(dent);
+	fscrypt_free_filename(&nm);
 	/*
 	 * Note, d_splice_alias() would be required instead if we supported
 	 * NFS.
@@ -278,8 +295,10 @@ static struct dentry *ubifs_lookup(struct inode *dir, struct dentry *dentry,
 	d_add(dentry, inode);
 	return NULL;
 
-out:
+out_dent:
 	kfree(dent);
+out_fname:
+	fscrypt_free_filename(&nm);
 	return ERR_PTR(err);
 }
 
@@ -288,10 +307,11 @@ static int ubifs_create(struct inode *dir, struct dentry *dentry, umode_t mode,
 {
 	struct inode *inode;
 	struct ubifs_info *c = dir->i_sb->s_fs_info;
-	int err, sz_change = CALC_DENT_SIZE(dentry->d_name.len);
 	struct ubifs_budget_req req = { .new_ino = 1, .new_dent = 1,
 					.dirtied_ino = 1 };
 	struct ubifs_inode *dir_ui = ubifs_inode(dir);
+	struct fscrypt_name nm;
+	int err, sz_change;
 
 	/*
 	 * Budget request settings: new inode, new direntry, changing the
@@ -305,10 +325,16 @@ static int ubifs_create(struct inode *dir, struct dentry *dentry, umode_t mode,
 	if (err)
 		return err;
 
+	err = fscrypt_setup_filename(dir, &dentry->d_name, 0, &nm);
+	if (err)
+		goto out_budg;
+
+	sz_change = CALC_DENT_SIZE(fname_len(&nm));
+
 	inode = ubifs_new_inode(c, dir, mode);
 	if (IS_ERR(inode)) {
 		err = PTR_ERR(inode);
-		goto out_budg;
+		goto out_fname;
 	}
 
 	err = ubifs_init_security(dir, inode, &dentry->d_name);
@@ -319,12 +345,13 @@ static int ubifs_create(struct inode *dir, struct dentry *dentry, umode_t mode,
 	dir->i_size += sz_change;
 	dir_ui->ui_size = dir->i_size;
 	dir->i_mtime = dir->i_ctime = inode->i_ctime;
-	err = ubifs_jnl_update(c, dir, &dentry->d_name, inode, 0, 0);
+	err = ubifs_jnl_update(c, dir, &nm, inode, 0, 0);
 	if (err)
 		goto out_cancel;
 	mutex_unlock(&dir_ui->ui_mutex);
 
 	ubifs_release_budget(c, &req);
+	fscrypt_free_filename(&nm);
 	insert_inode_hash(inode);
 	d_instantiate(dentry, inode);
 	return 0;
@@ -336,6 +363,8 @@ static int ubifs_create(struct inode *dir, struct dentry *dentry, umode_t mode,
 out_inode:
 	make_bad_inode(inode);
 	iput(inode);
+out_fname:
+	fscrypt_free_filename(&nm);
 out_budg:
 	ubifs_release_budget(c, &req);
 	ubifs_err(c, "cannot create regular file, error %d", err);
@@ -351,6 +380,7 @@ static int do_tmpfile(struct inode *dir, struct dentry *dentry,
 	struct ubifs_budget_req ino_req = { .dirtied_ino = 1 };
 	struct ubifs_inode *ui, *dir_ui = ubifs_inode(dir);
 	int err, instantiated = 0;
+	struct fscrypt_name nm;
 
 	/*
 	 * Budget request settings: new dirty inode, new direntry,
@@ -360,13 +390,30 @@ static int do_tmpfile(struct inode *dir, struct dentry *dentry,
 	dbg_gen("dent '%pd', mode %#hx in dir ino %lu",
 		dentry, mode, dir->i_ino);
 
-	err = ubifs_budget_space(c, &req);
+	if (ubifs_crypt_is_encrypted(dir)) {
+		err = fscrypt_get_encryption_info(dir);
+		if (err)
+			return err;
+
+		if (!fscrypt_has_encryption_key(dir)) {
+			return -EPERM;
+		}
+	}
+
+	err = fscrypt_setup_filename(dir, &dentry->d_name, 0, &nm);
 	if (err)
 		return err;
 
+	err = ubifs_budget_space(c, &req);
+	if (err) {
+		fscrypt_free_filename(&nm);
+		return err;
+	}
+
 	err = ubifs_budget_space(c, &ino_req);
 	if (err) {
 		ubifs_release_budget(c, &req);
+		fscrypt_free_filename(&nm);
 		return err;
 	}
 
@@ -402,7 +449,7 @@ static int do_tmpfile(struct inode *dir, struct dentry *dentry,
 	mutex_unlock(&ui->ui_mutex);
 
 	mutex_lock(&dir_ui->ui_mutex);
-	err = ubifs_jnl_update(c, dir, &dentry->d_name, inode, 1, 0);
+	err = ubifs_jnl_update(c, dir, &nm, inode, 1, 0);
 	if (err)
 		goto out_cancel;
 	mutex_unlock(&dir_ui->ui_mutex);
@@ -421,6 +468,7 @@ static int do_tmpfile(struct inode *dir, struct dentry *dentry,
 	ubifs_release_budget(c, &req);
 	if (!instantiated)
 		ubifs_release_budget(c, &ino_req);
+	fscrypt_free_filename(&nm);
 	ubifs_err(c, "cannot create temporary file, error %d", err);
 	return err;
 }
@@ -480,12 +528,14 @@ static unsigned int vfs_dent_type(uint8_t type)
  */
 static int ubifs_readdir(struct file *file, struct dir_context *ctx)
 {
-	int err = 0;
-	struct qstr nm;
+	int fstr_real_len, err = 0;
+	struct fscrypt_name nm;
+	struct fscrypt_str fstr = {0};
 	union ubifs_key key;
 	struct ubifs_dent_node *dent;
 	struct inode *dir = file_inode(file);
 	struct ubifs_info *c = dir->i_sb->s_fs_info;
+	bool encrypted = ubifs_crypt_is_encrypted(dir);
 
 	dbg_gen("dir ino %lu, f_pos %#llx", dir->i_ino, ctx->pos);
 
@@ -496,6 +546,18 @@ static int ubifs_readdir(struct file *file, struct dir_context *ctx)
 		 */
 		return 0;
 
+	if (encrypted) {
+		err = fscrypt_get_encryption_info(dir);
+		if (err && err != -ENOKEY)
+			return err;
+
+		err = fscrypt_fname_alloc_buffer(dir, UBIFS_MAX_NLEN, &fstr);
+		if (err)
+			return err;
+
+		fstr_real_len = fstr.len;
+	}
+
 	if (file->f_version == 0) {
 		/*
 		 * The file was seek'ed, which means that @file->private_data
@@ -517,12 +579,15 @@ static int ubifs_readdir(struct file *file, struct dir_context *ctx)
 	/* File positions 0 and 1 correspond to "." and ".." */
 	if (ctx->pos < 2) {
 		ubifs_assert(!file->private_data);
-		if (!dir_emit_dots(file, ctx))
+		if (!dir_emit_dots(file, ctx)) {
+			if (encrypted)
+				fscrypt_fname_free_buffer(&fstr);
 			return 0;
+		}
 
 		/* Find the first entry in TNC and save it */
 		lowest_dent_key(c, &key, dir->i_ino);
-		nm.name = NULL;
+		fname_len(&nm) = 0;
 		dent = ubifs_tnc_next_ent(c, &key, &nm);
 		if (IS_ERR(dent)) {
 			err = PTR_ERR(dent);
@@ -540,7 +605,7 @@ static int ubifs_readdir(struct file *file, struct dir_context *ctx)
 		 * Find the entry corresponding to @ctx->pos or the closest one.
 		 */
 		dent_key_init_hash(c, &key, dir->i_ino, ctx->pos);
-		nm.name = NULL;
+		fname_len(&nm) = 0;
 		dent = ubifs_tnc_next_ent(c, &key, &nm);
 		if (IS_ERR(dent)) {
 			err = PTR_ERR(dent);
@@ -557,15 +622,30 @@ static int ubifs_readdir(struct file *file, struct dir_context *ctx)
 		ubifs_assert(le64_to_cpu(dent->ch.sqnum) >
 			     ubifs_inode(dir)->creat_sqnum);
 
-		nm.len = le16_to_cpu(dent->nlen);
-		if (!dir_emit(ctx, dent->name, nm.len,
+		fname_len(&nm) = le16_to_cpu(dent->nlen);
+		fname_name(&nm) = dent->name;
+
+		if (encrypted) {
+			fstr.len = fstr_real_len;
+
+			err = fscrypt_fname_disk_to_usr(dir, key_hash_flash(c, &dent->key), 0, &nm.disk_name, &fstr);
+			if (err < 0)
+				goto out;
+		} else {
+			fstr.len = fname_len(&nm);
+			fstr.name = fname_name(&nm);
+		}
+
+		if (!dir_emit(ctx, fstr.name, fstr.len,
 			       le64_to_cpu(dent->inum),
-			       vfs_dent_type(dent->type)))
+			       vfs_dent_type(dent->type))) {
+			if (encrypted)
+				fscrypt_fname_free_buffer(&fstr);
 			return 0;
+		}
 
 		/* Switch to the next entry */
 		key_read(c, &dent->key, &key);
-		nm.name = dent->name;
 		dent = ubifs_tnc_next_ent(c, &key, &nm);
 		if (IS_ERR(dent)) {
 			err = PTR_ERR(dent);
@@ -582,6 +662,9 @@ static int ubifs_readdir(struct file *file, struct dir_context *ctx)
 	kfree(file->private_data);
 	file->private_data = NULL;
 
+	if (encrypted)
+		fscrypt_fname_free_buffer(&fstr);
+
 	if (err != -ENOENT)
 		ubifs_err(c, "cannot find next direntry, error %d", err);
 	else
@@ -642,6 +725,7 @@ static int ubifs_link(struct dentry *old_dentry, struct inode *dir,
 	int err, sz_change = CALC_DENT_SIZE(dentry->d_name.len);
 	struct ubifs_budget_req req = { .new_dent = 1, .dirtied_ino = 2,
 				.dirtied_ino_d = ALIGN(ui->data_len, 8) };
+	struct fscrypt_name nm;
 
 	/*
 	 * Budget request settings: new direntry, changing the target inode,
@@ -654,17 +738,29 @@ static int ubifs_link(struct dentry *old_dentry, struct inode *dir,
 	ubifs_assert(inode_is_locked(dir));
 	ubifs_assert(inode_is_locked(inode));
 
-	if (ubifs_crypt_is_encrypted(dir) &&
-	    !fscrypt_has_permitted_context(dir, inode))
-		return -EPERM;
+	if (ubifs_crypt_is_encrypted(dir)) {
+		if (!fscrypt_has_permitted_context(dir, inode))
+			return -EPERM;
 
-	err = dbg_check_synced_i_size(c, inode);
+		err = fscrypt_get_encryption_info(inode);
+		if (err)
+			return err;
+
+		if (!fscrypt_has_encryption_key(inode))
+			return -EPERM;
+	}
+
+	err = fscrypt_setup_filename(dir, &dentry->d_name, 0, &nm);
 	if (err)
 		return err;
 
+	err = dbg_check_synced_i_size(c, inode);
+	if (err)
+		goto out_fname;
+
 	err = ubifs_budget_space(c, &req);
 	if (err)
-		return err;
+		goto out_fname;
 
 	lock_2_inodes(dir, inode);
 	inc_nlink(inode);
@@ -673,13 +769,14 @@ static int ubifs_link(struct dentry *old_dentry, struct inode *dir,
 	dir->i_size += sz_change;
 	dir_ui->ui_size = dir->i_size;
 	dir->i_mtime = dir->i_ctime = inode->i_ctime;
-	err = ubifs_jnl_update(c, dir, &dentry->d_name, inode, 0, 0);
+	err = ubifs_jnl_update(c, dir, &nm, inode, 0, 0);
 	if (err)
 		goto out_cancel;
 	unlock_2_inodes(dir, inode);
 
 	ubifs_release_budget(c, &req);
 	d_instantiate(dentry, inode);
+	fscrypt_free_filename(&nm);
 	return 0;
 
 out_cancel:
@@ -689,6 +786,8 @@ static int ubifs_link(struct dentry *old_dentry, struct inode *dir,
 	unlock_2_inodes(dir, inode);
 	ubifs_release_budget(c, &req);
 	iput(inode);
+out_fname:
+	fscrypt_free_filename(&nm);
 	return err;
 }
 
@@ -697,10 +796,10 @@ static int ubifs_unlink(struct inode *dir, struct dentry *dentry)
 	struct ubifs_info *c = dir->i_sb->s_fs_info;
 	struct inode *inode = d_inode(dentry);
 	struct ubifs_inode *dir_ui = ubifs_inode(dir);
-	int sz_change = CALC_DENT_SIZE(dentry->d_name.len);
-	int err, budgeted = 1;
+	int err, sz_change, budgeted = 1;
 	struct ubifs_budget_req req = { .mod_dent = 1, .dirtied_ino = 2 };
 	unsigned int saved_nlink = inode->i_nlink;
+	struct fscrypt_name nm;
 
 	/*
 	 * Budget request settings: deletion direntry, deletion inode (+1 for
@@ -712,16 +811,29 @@ static int ubifs_unlink(struct inode *dir, struct dentry *dentry)
 	dbg_gen("dent '%pd' from ino %lu (nlink %d) in dir ino %lu",
 		dentry, inode->i_ino,
 		inode->i_nlink, dir->i_ino);
+
+	if (ubifs_crypt_is_encrypted(dir)) {
+		err = fscrypt_get_encryption_info(dir);
+		if (err && err != -ENOKEY)
+			return err;
+	}
+
+	err = fscrypt_setup_filename(dir, &dentry->d_name, 1, &nm);
+	if (err)
+		return err;
+
+	sz_change = CALC_DENT_SIZE(fname_len(&nm));
+
 	ubifs_assert(inode_is_locked(dir));
 	ubifs_assert(inode_is_locked(inode));
 	err = dbg_check_synced_i_size(c, inode);
 	if (err)
-		return err;
+		goto out_fname;
 
 	err = ubifs_budget_space(c, &req);
 	if (err) {
 		if (err != -ENOSPC)
-			return err;
+			goto out_fname;
 		budgeted = 0;
 	}
 
@@ -731,7 +843,7 @@ static int ubifs_unlink(struct inode *dir, struct dentry *dentry)
 	dir->i_size -= sz_change;
 	dir_ui->ui_size = dir->i_size;
 	dir->i_mtime = dir->i_ctime = inode->i_ctime;
-	err = ubifs_jnl_update(c, dir, &dentry->d_name, inode, 1, 0);
+	err = ubifs_jnl_update(c, dir, &nm, inode, 1, 0);
 	if (err)
 		goto out_cancel;
 	unlock_2_inodes(dir, inode);
@@ -743,6 +855,7 @@ static int ubifs_unlink(struct inode *dir, struct dentry *dentry)
 		c->bi.nospace = c->bi.nospace_rp = 0;
 		smp_wmb();
 	}
+	fscrypt_free_filename(&nm);
 	return 0;
 
 out_cancel:
@@ -752,6 +865,8 @@ static int ubifs_unlink(struct inode *dir, struct dentry *dentry)
 	unlock_2_inodes(dir, inode);
 	if (budgeted)
 		ubifs_release_budget(c, &req);
+out_fname:
+	fscrypt_free_filename(&nm);
 	return err;
 }
 
@@ -766,7 +881,7 @@ static int ubifs_unlink(struct inode *dir, struct dentry *dentry)
 int ubifs_check_dir_empty(struct inode *dir)
 {
 	struct ubifs_info *c = dir->i_sb->s_fs_info;
-	struct qstr nm = { .name = NULL };
+	struct fscrypt_name nm = { 0 };
 	struct ubifs_dent_node *dent;
 	union ubifs_key key;
 	int err;
@@ -788,10 +903,10 @@ static int ubifs_rmdir(struct inode *dir, struct dentry *dentry)
 {
 	struct ubifs_info *c = dir->i_sb->s_fs_info;
 	struct inode *inode = d_inode(dentry);
-	int sz_change = CALC_DENT_SIZE(dentry->d_name.len);
-	int err, budgeted = 1;
+	int err, sz_change, budgeted = 1;
 	struct ubifs_inode *dir_ui = ubifs_inode(dir);
 	struct ubifs_budget_req req = { .mod_dent = 1, .dirtied_ino = 2 };
+	struct fscrypt_name nm;
 
 	/*
 	 * Budget request settings: deletion direntry, deletion inode and
@@ -807,10 +922,22 @@ static int ubifs_rmdir(struct inode *dir, struct dentry *dentry)
 	if (err)
 		return err;
 
+	if (ubifs_crypt_is_encrypted(dir)) {
+		err = fscrypt_get_encryption_info(dir);
+		if (err && err != -ENOKEY)
+			return err;
+	}
+
+	err = fscrypt_setup_filename(dir, &dentry->d_name, 1, &nm);
+	if (err)
+		return err;
+
+	sz_change = CALC_DENT_SIZE(fname_len(&nm));
+
 	err = ubifs_budget_space(c, &req);
 	if (err) {
 		if (err != -ENOSPC)
-			return err;
+			goto out_fname;
 		budgeted = 0;
 	}
 
@@ -821,7 +948,7 @@ static int ubifs_rmdir(struct inode *dir, struct dentry *dentry)
 	dir->i_size -= sz_change;
 	dir_ui->ui_size = dir->i_size;
 	dir->i_mtime = dir->i_ctime = inode->i_ctime;
-	err = ubifs_jnl_update(c, dir, &dentry->d_name, inode, 1, 0);
+	err = ubifs_jnl_update(c, dir, &nm, inode, 1, 0);
 	if (err)
 		goto out_cancel;
 	unlock_2_inodes(dir, inode);
@@ -833,6 +960,7 @@ static int ubifs_rmdir(struct inode *dir, struct dentry *dentry)
 		c->bi.nospace = c->bi.nospace_rp = 0;
 		smp_wmb();
 	}
+	fscrypt_free_filename(&nm);
 	return 0;
 
 out_cancel:
@@ -843,6 +971,8 @@ static int ubifs_rmdir(struct inode *dir, struct dentry *dentry)
 	unlock_2_inodes(dir, inode);
 	if (budgeted)
 		ubifs_release_budget(c, &req);
+out_fname:
+	fscrypt_free_filename(&nm);
 	return err;
 }
 
@@ -851,8 +981,9 @@ static int ubifs_mkdir(struct inode *dir, struct dentry *dentry, umode_t mode)
 	struct inode *inode;
 	struct ubifs_inode *dir_ui = ubifs_inode(dir);
 	struct ubifs_info *c = dir->i_sb->s_fs_info;
-	int err, sz_change = CALC_DENT_SIZE(dentry->d_name.len);
+	int err, sz_change;
 	struct ubifs_budget_req req = { .new_ino = 1, .new_dent = 1 };
+	struct fscrypt_name nm;
 
 	/*
 	 * Budget request settings: new inode, new direntry and changing parent
@@ -866,10 +997,27 @@ static int ubifs_mkdir(struct inode *dir, struct dentry *dentry, umode_t mode)
 	if (err)
 		return err;
 
+	if (ubifs_crypt_is_encrypted(dir)) {
+		err = fscrypt_get_encryption_info(dir);
+		if (err)
+			goto out_budg;
+
+		if (!fscrypt_has_encryption_key(dir)) {
+			err = -EPERM;
+			goto out_budg;
+		}
+	}
+
+	err = fscrypt_setup_filename(dir, &dentry->d_name, 0, &nm);
+	if (err)
+		goto out_budg;
+
+	sz_change = CALC_DENT_SIZE(fname_len(&nm));
+
 	inode = ubifs_new_inode(c, dir, S_IFDIR | mode);
 	if (IS_ERR(inode)) {
 		err = PTR_ERR(inode);
-		goto out_budg;
+		goto out_fname;
 	}
 
 	err = ubifs_init_security(dir, inode, &dentry->d_name);
@@ -883,7 +1031,7 @@ static int ubifs_mkdir(struct inode *dir, struct dentry *dentry, umode_t mode)
 	dir->i_size += sz_change;
 	dir_ui->ui_size = dir->i_size;
 	dir->i_mtime = dir->i_ctime = inode->i_ctime;
-	err = ubifs_jnl_update(c, dir, &dentry->d_name, inode, 0, 0);
+	err = ubifs_jnl_update(c, dir, &nm, inode, 0, 0);
 	if (err) {
 		ubifs_err(c, "cannot create directory, error %d", err);
 		goto out_cancel;
@@ -892,6 +1040,7 @@ static int ubifs_mkdir(struct inode *dir, struct dentry *dentry, umode_t mode)
 
 	ubifs_release_budget(c, &req);
 	d_instantiate(dentry, inode);
+	fscrypt_free_filename(&nm);
 	return 0;
 
 out_cancel:
@@ -902,6 +1051,8 @@ static int ubifs_mkdir(struct inode *dir, struct dentry *dentry, umode_t mode)
 out_inode:
 	make_bad_inode(inode);
 	iput(inode);
+out_fname:
+	fscrypt_free_filename(&nm);
 out_budg:
 	ubifs_release_budget(c, &req);
 	return err;
@@ -915,11 +1066,12 @@ static int ubifs_mknod(struct inode *dir, struct dentry *dentry,
 	struct ubifs_inode *dir_ui = ubifs_inode(dir);
 	struct ubifs_info *c = dir->i_sb->s_fs_info;
 	union ubifs_dev_desc *dev = NULL;
-	int sz_change = CALC_DENT_SIZE(dentry->d_name.len);
+	int sz_change;
 	int err, devlen = 0;
 	struct ubifs_budget_req req = { .new_ino = 1, .new_dent = 1,
 					.new_ino_d = ALIGN(devlen, 8),
 					.dirtied_ino = 1 };
+	struct fscrypt_name nm;
 
 	/*
 	 * Budget request settings: new inode, new direntry and changing parent
@@ -941,11 +1093,28 @@ static int ubifs_mknod(struct inode *dir, struct dentry *dentry,
 		return err;
 	}
 
+	if (ubifs_crypt_is_encrypted(dir)) {
+		err = fscrypt_get_encryption_info(dir);
+		if (err)
+			goto out_budg;
+
+		if (!fscrypt_has_encryption_key(dir)) {
+			err = -EPERM;
+			goto out_budg;
+		}
+	}
+
+	err = fscrypt_setup_filename(dir, &dentry->d_name, 0, &nm);
+	if (err)
+		goto out_budg;
+
+	sz_change = CALC_DENT_SIZE(fname_len(&nm));
+
 	inode = ubifs_new_inode(c, dir, mode);
 	if (IS_ERR(inode)) {
 		kfree(dev);
 		err = PTR_ERR(inode);
-		goto out_budg;
+		goto out_fname;
 	}
 
 	init_special_inode(inode, inode->i_mode, rdev);
@@ -962,7 +1131,7 @@ static int ubifs_mknod(struct inode *dir, struct dentry *dentry,
 	dir->i_size += sz_change;
 	dir_ui->ui_size = dir->i_size;
 	dir->i_mtime = dir->i_ctime = inode->i_ctime;
-	err = ubifs_jnl_update(c, dir, &dentry->d_name, inode, 0, 0);
+	err = ubifs_jnl_update(c, dir, &nm, inode, 0, 0);
 	if (err)
 		goto out_cancel;
 	mutex_unlock(&dir_ui->ui_mutex);
@@ -970,6 +1139,7 @@ static int ubifs_mknod(struct inode *dir, struct dentry *dentry,
 	ubifs_release_budget(c, &req);
 	insert_inode_hash(inode);
 	d_instantiate(dentry, inode);
+	fscrypt_free_filename(&nm);
 	return 0;
 
 out_cancel:
@@ -979,6 +1149,8 @@ static int ubifs_mknod(struct inode *dir, struct dentry *dentry,
 out_inode:
 	make_bad_inode(inode);
 	iput(inode);
+out_fname:
+	fscrypt_free_filename(&nm);
 out_budg:
 	ubifs_release_budget(c, &req);
 	return err;
@@ -1123,15 +1295,14 @@ static int do_rename(struct inode *old_dir, struct dentry *old_dentry,
 	struct ubifs_inode *whiteout_ui = NULL;
 	int err, release, sync = 0, move = (new_dir != old_dir);
 	int is_dir = S_ISDIR(old_inode->i_mode);
-	int unlink = !!new_inode;
-	int new_sz = CALC_DENT_SIZE(new_dentry->d_name.len);
-	int old_sz = CALC_DENT_SIZE(old_dentry->d_name.len);
+	int unlink = !!new_inode, new_sz, old_sz;
 	struct ubifs_budget_req req = { .new_dent = 1, .mod_dent = 1,
 					.dirtied_ino = 3 };
 	struct ubifs_budget_req ino_req = { .dirtied_ino = 1,
 			.dirtied_ino_d = ALIGN(old_inode_ui->data_len, 8) };
 	struct timespec time;
 	unsigned int uninitialized_var(saved_nlink);
+	struct fscrypt_name old_nm, new_nm;
 
 	if (flags & ~RENAME_NOREPLACE)
 		return -EINVAL;
@@ -1164,11 +1335,29 @@ static int do_rename(struct inode *old_dir, struct dentry *old_dentry,
 			return err;
 	}
 
-	err = ubifs_budget_space(c, &req);
+	err = fscrypt_setup_filename(old_dir, &old_dentry->d_name, 0, &old_nm);
 	if (err)
 		return err;
+
+	err = fscrypt_setup_filename(new_dir, &new_dentry->d_name, 0, &new_nm);
+	if (err) {
+		fscrypt_free_filename(&old_nm);
+		return err;
+	}
+
+	new_sz = CALC_DENT_SIZE(fname_len(&new_nm));
+	old_sz = CALC_DENT_SIZE(fname_len(&old_nm));
+
+	err = ubifs_budget_space(c, &req);
+	if (err) {
+		fscrypt_free_filename(&old_nm);
+		fscrypt_free_filename(&new_nm);
+		return err;
+	}
 	err = ubifs_budget_space(c, &ino_req);
 	if (err) {
+		fscrypt_free_filename(&old_nm);
+		fscrypt_free_filename(&new_nm);
 		ubifs_release_budget(c, &req);
 		return err;
 	}
@@ -1290,8 +1479,8 @@ static int do_rename(struct inode *old_dir, struct dentry *old_dentry,
 		iput(whiteout);
 	}
 
-	err = ubifs_jnl_rename(c, old_dir, old_dentry, new_dir, new_dentry, whiteout,
-			       sync);
+	err = ubifs_jnl_rename(c, old_dir, old_inode, &old_nm, new_dir,
+			       new_inode, &new_nm, whiteout, sync);
 	if (err)
 		goto out_cancel;
 
@@ -1307,6 +1496,9 @@ static int do_rename(struct inode *old_dir, struct dentry *old_dentry,
 		ubifs_release_budget(c, &ino_req);
 	if (IS_SYNC(old_inode))
 		err = old_inode->i_sb->s_op->write_inode(old_inode, NULL);
+
+	fscrypt_free_filename(&old_nm);
+	fscrypt_free_filename(&new_nm);
 	return err;
 
 out_cancel:
@@ -1335,6 +1527,8 @@ static int do_rename(struct inode *old_dir, struct dentry *old_dentry,
 	unlock_4_inodes(old_dir, new_dir, new_inode, whiteout);
 	ubifs_release_budget(c, &ino_req);
 	ubifs_release_budget(c, &req);
+	fscrypt_free_filename(&old_nm);
+	fscrypt_free_filename(&new_nm);
 	return err;
 }
 
@@ -1349,6 +1543,7 @@ static int ubifs_xrename(struct inode *old_dir, struct dentry *old_dentry,
 	struct inode *snd_inode = d_inode(new_dentry);
 	struct timespec time;
 	int err;
+	struct fscrypt_name fst_nm, snd_nm;
 
 	ubifs_assert(fst_inode && snd_inode);
 
@@ -1359,6 +1554,16 @@ static int ubifs_xrename(struct inode *old_dir, struct dentry *old_dentry,
 	     !fscrypt_has_permitted_context(old_dir, snd_inode)))
 		return -EPERM;
 
+	err = fscrypt_setup_filename(old_dir, &old_dentry->d_name, 0, &fst_nm);
+	if (err)
+		return err;
+
+	err = fscrypt_setup_filename(new_dir, &new_dentry->d_name, 0, &snd_nm);
+	if (err) {
+		fscrypt_free_filename(&fst_nm);
+		return err;
+	}
+
 	lock_4_inodes(old_dir, new_dir, NULL, NULL);
 
 	time = ubifs_current_time(old_dir);
@@ -1378,12 +1583,14 @@ static int ubifs_xrename(struct inode *old_dir, struct dentry *old_dentry,
 		}
 	}
 
-	err = ubifs_jnl_xrename(c, old_dir, old_dentry, new_dir, new_dentry,
-				sync);
+	err = ubifs_jnl_xrename(c, old_dir, fst_inode, &fst_nm, new_dir,
+				snd_inode, &snd_nm, sync);
 
 	unlock_4_inodes(old_dir, new_dir, NULL, NULL);
 	ubifs_release_budget(c, &req);
 
+	fscrypt_free_filename(&fst_nm);
+	fscrypt_free_filename(&snd_nm);
 	return err;
 }
 
diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 167b9e1c80df..f2b989dbe25a 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -530,7 +530,7 @@ static void mark_inode_clean(struct ubifs_info *c, struct ubifs_inode *ui)
  * success. In case of failure, a negative error code is returned.
  */
 int ubifs_jnl_update(struct ubifs_info *c, const struct inode *dir,
-		     const struct qstr *nm, const struct inode *inode,
+		     const struct fscrypt_name *nm, const struct inode *inode,
 		     int deletion, int xent)
 {
 	int err, dlen, ilen, len, lnum, ino_offs, dent_offs;
@@ -542,11 +542,11 @@ int ubifs_jnl_update(struct ubifs_info *c, const struct inode *dir,
 	struct ubifs_ino_node *ino;
 	union ubifs_key dent_key, ino_key;
 
-	dbg_jnl("ino %lu, dent '%.*s', data len %d in dir ino %lu",
-		inode->i_ino, nm->len, nm->name, ui->data_len, dir->i_ino);
+	//dbg_jnl("ino %lu, dent '%.*s', data len %d in dir ino %lu",
+	//	inode->i_ino, nm->len, nm->name, ui->data_len, dir->i_ino);
 	ubifs_assert(mutex_is_locked(&host_ui->ui_mutex));
 
-	dlen = UBIFS_DENT_NODE_SZ + nm->len + 1;
+	dlen = UBIFS_DENT_NODE_SZ + fname_len(nm) + 1;
 	ilen = UBIFS_INO_NODE_SZ;
 
 	/*
@@ -587,9 +587,10 @@ int ubifs_jnl_update(struct ubifs_info *c, const struct inode *dir,
 	key_write(c, &dent_key, dent->key);
 	dent->inum = deletion ? 0 : cpu_to_le64(inode->i_ino);
 	dent->type = get_dent_type(inode->i_mode);
-	dent->nlen = cpu_to_le16(nm->len);
-	memcpy(dent->name, nm->name, nm->len);
-	dent->name[nm->len] = '\0';
+	dent->nlen = cpu_to_le16(fname_len(nm));
+	memcpy(dent->name, fname_name(nm), fname_len(nm));
+	dent->name[fname_len(nm)] = '\0';
+
 	zero_dent_node_unused(dent);
 	ubifs_prep_grp_node(c, dent, dlen, 0);
 
@@ -914,9 +915,11 @@ int ubifs_jnl_delete_inode(struct ubifs_info *c, const struct inode *inode)
  * ubifs_jnl_xrename - cross rename two directory entries.
  * @c: UBIFS file-system description object
  * @fst_dir: parent inode of 1st directory entry to exchange
- * @fst_dentry: 1st directory entry to exchange
+ * @fst_inode: 1st inode to exchange
+ * @fst_nm: name of 1st inode to exchange
  * @snd_dir: parent inode of 2nd directory entry to exchange
- * @snd_dentry: 2nd directory entry to exchange
+ * @snd_inode: 2nd inode to exchange
+ * @snd_nm: name of 2nd inode to exchange
  * @sync: non-zero if the write-buffer has to be synchronized
  *
  * This function implements the cross rename operation which may involve
@@ -925,29 +928,29 @@ int ubifs_jnl_delete_inode(struct ubifs_info *c, const struct inode *inode)
  * returned.
  */
 int ubifs_jnl_xrename(struct ubifs_info *c, const struct inode *fst_dir,
-		      const struct dentry *fst_dentry,
+		      const struct inode *fst_inode,
+		      const struct fscrypt_name *fst_nm,
 		      const struct inode *snd_dir,
-		      const struct dentry *snd_dentry, int sync)
+		      const struct inode *snd_inode,
+		      const struct fscrypt_name *snd_nm, int sync)
 {
 	union ubifs_key key;
 	struct ubifs_dent_node *dent1, *dent2;
 	int err, dlen1, dlen2, lnum, offs, len, plen = UBIFS_INO_NODE_SZ;
 	int aligned_dlen1, aligned_dlen2;
 	int twoparents = (fst_dir != snd_dir);
-	const struct inode *fst_inode = d_inode(fst_dentry);
-	const struct inode *snd_inode = d_inode(snd_dentry);
 	void *p;
 
-	dbg_jnl("dent '%pd' in dir ino %lu between dent '%pd' in dir ino %lu",
-		fst_dentry, fst_dir->i_ino, snd_dentry, snd_dir->i_ino);
+	//dbg_jnl("dent '%pd' in dir ino %lu between dent '%pd' in dir ino %lu",
+	//	fst_dentry, fst_dir->i_ino, snd_dentry, snd_dir->i_ino);
 
 	ubifs_assert(ubifs_inode(fst_dir)->data_len == 0);
 	ubifs_assert(ubifs_inode(snd_dir)->data_len == 0);
 	ubifs_assert(mutex_is_locked(&ubifs_inode(fst_dir)->ui_mutex));
 	ubifs_assert(mutex_is_locked(&ubifs_inode(snd_dir)->ui_mutex));
 
-	dlen1 = UBIFS_DENT_NODE_SZ + snd_dentry->d_name.len + 1;
-	dlen2 = UBIFS_DENT_NODE_SZ + fst_dentry->d_name.len + 1;
+	dlen1 = UBIFS_DENT_NODE_SZ + fname_len(snd_nm) + 1;
+	dlen2 = UBIFS_DENT_NODE_SZ + fname_len(fst_nm) + 1;
 	aligned_dlen1 = ALIGN(dlen1, 8);
 	aligned_dlen2 = ALIGN(dlen2, 8);
 
@@ -966,24 +969,24 @@ int ubifs_jnl_xrename(struct ubifs_info *c, const struct inode *fst_dir,
 
 	/* Make new dent for 1st entry */
 	dent1->ch.node_type = UBIFS_DENT_NODE;
-	dent_key_init_flash(c, &dent1->key, snd_dir->i_ino, &snd_dentry->d_name);
+	dent_key_init_flash(c, &dent1->key, snd_dir->i_ino, snd_nm);
 	dent1->inum = cpu_to_le64(fst_inode->i_ino);
 	dent1->type = get_dent_type(fst_inode->i_mode);
-	dent1->nlen = cpu_to_le16(snd_dentry->d_name.len);
-	memcpy(dent1->name, snd_dentry->d_name.name, snd_dentry->d_name.len);
-	dent1->name[snd_dentry->d_name.len] = '\0';
+	dent1->nlen = cpu_to_le16(fname_len(snd_nm));
+	memcpy(dent1->name, fname_name(snd_nm), fname_len(snd_nm));
+	dent1->name[fname_len(snd_nm)] = '\0';
 	zero_dent_node_unused(dent1);
 	ubifs_prep_grp_node(c, dent1, dlen1, 0);
 
 	/* Make new dent for 2nd entry */
 	dent2 = (void *)dent1 + aligned_dlen1;
 	dent2->ch.node_type = UBIFS_DENT_NODE;
-	dent_key_init_flash(c, &dent2->key, fst_dir->i_ino, &fst_dentry->d_name);
+	dent_key_init_flash(c, &dent2->key, fst_dir->i_ino, fst_nm);
 	dent2->inum = cpu_to_le64(snd_inode->i_ino);
 	dent2->type = get_dent_type(snd_inode->i_mode);
-	dent2->nlen = cpu_to_le16(fst_dentry->d_name.len);
-	memcpy(dent2->name, fst_dentry->d_name.name, fst_dentry->d_name.len);
-	dent2->name[fst_dentry->d_name.len] = '\0';
+	dent2->nlen = cpu_to_le16(fname_len(fst_nm));
+	memcpy(dent2->name, fname_name(fst_nm), fname_len(fst_nm));
+	dent2->name[fname_len(fst_nm)] = '\0';
 	zero_dent_node_unused(dent2);
 	ubifs_prep_grp_node(c, dent2, dlen2, 0);
 
@@ -1007,14 +1010,14 @@ int ubifs_jnl_xrename(struct ubifs_info *c, const struct inode *fst_dir,
 	}
 	release_head(c, BASEHD);
 
-	dent_key_init(c, &key, snd_dir->i_ino, &snd_dentry->d_name);
-	err = ubifs_tnc_add_nm(c, &key, lnum, offs, dlen1, &snd_dentry->d_name);
+	dent_key_init(c, &key, snd_dir->i_ino, snd_nm);
+	err = ubifs_tnc_add_nm(c, &key, lnum, offs, dlen1, snd_nm);
 	if (err)
 		goto out_ro;
 
 	offs += aligned_dlen1;
-	dent_key_init(c, &key, fst_dir->i_ino, &fst_dentry->d_name);
-	err = ubifs_tnc_add_nm(c, &key, lnum, offs, dlen2, &fst_dentry->d_name);
+	dent_key_init(c, &key, fst_dir->i_ino, fst_nm);
+	err = ubifs_tnc_add_nm(c, &key, lnum, offs, dlen2, fst_nm);
 	if (err)
 		goto out_ro;
 
@@ -1066,31 +1069,31 @@ int ubifs_jnl_xrename(struct ubifs_info *c, const struct inode *fst_dir,
  * returned.
  */
 int ubifs_jnl_rename(struct ubifs_info *c, const struct inode *old_dir,
-		     const struct dentry *old_dentry,
+		     const struct inode *old_inode,
+		     const struct fscrypt_name *old_nm,
 		     const struct inode *new_dir,
-		     const struct dentry *new_dentry,
+		     const struct inode *new_inode,
+		     const struct fscrypt_name *new_nm,
 		     const struct inode *whiteout, int sync)
 {
 	void *p;
 	union ubifs_key key;
 	struct ubifs_dent_node *dent, *dent2;
 	int err, dlen1, dlen2, ilen, lnum, offs, len;
-	const struct inode *old_inode = d_inode(old_dentry);
-	const struct inode *new_inode = d_inode(new_dentry);
 	int aligned_dlen1, aligned_dlen2, plen = UBIFS_INO_NODE_SZ;
 	int last_reference = !!(new_inode && new_inode->i_nlink == 0);
 	int move = (old_dir != new_dir);
 	struct ubifs_inode *uninitialized_var(new_ui);
 
-	dbg_jnl("dent '%pd' in dir ino %lu to dent '%pd' in dir ino %lu",
-		old_dentry, old_dir->i_ino, new_dentry, new_dir->i_ino);
+	//dbg_jnl("dent '%pd' in dir ino %lu to dent '%pd' in dir ino %lu",
+	//	old_dentry, old_dir->i_ino, new_dentry, new_dir->i_ino);
 	ubifs_assert(ubifs_inode(old_dir)->data_len == 0);
 	ubifs_assert(ubifs_inode(new_dir)->data_len == 0);
 	ubifs_assert(mutex_is_locked(&ubifs_inode(old_dir)->ui_mutex));
 	ubifs_assert(mutex_is_locked(&ubifs_inode(new_dir)->ui_mutex));
 
-	dlen1 = UBIFS_DENT_NODE_SZ + new_dentry->d_name.len + 1;
-	dlen2 = UBIFS_DENT_NODE_SZ + old_dentry->d_name.len + 1;
+	dlen1 = UBIFS_DENT_NODE_SZ + fname_len(new_nm) + 1;
+	dlen2 = UBIFS_DENT_NODE_SZ + fname_len(old_nm) + 1;
 	if (new_inode) {
 		new_ui = ubifs_inode(new_inode);
 		ubifs_assert(mutex_is_locked(&new_ui->ui_mutex));
@@ -1116,19 +1119,18 @@ int ubifs_jnl_rename(struct ubifs_info *c, const struct inode *old_dir,
 
 	/* Make new dent */
 	dent->ch.node_type = UBIFS_DENT_NODE;
-	dent_key_init_flash(c, &dent->key, new_dir->i_ino, &new_dentry->d_name);
+	dent_key_init_flash(c, &dent->key, new_dir->i_ino, new_nm);
 	dent->inum = cpu_to_le64(old_inode->i_ino);
 	dent->type = get_dent_type(old_inode->i_mode);
-	dent->nlen = cpu_to_le16(new_dentry->d_name.len);
-	memcpy(dent->name, new_dentry->d_name.name, new_dentry->d_name.len);
-	dent->name[new_dentry->d_name.len] = '\0';
+	dent->nlen = cpu_to_le16(fname_len(new_nm));
+	memcpy(dent->name, fname_name(new_nm), fname_len(new_nm));
+	dent->name[fname_len(new_nm)] = '\0';
 	zero_dent_node_unused(dent);
 	ubifs_prep_grp_node(c, dent, dlen1, 0);
 
 	dent2 = (void *)dent + aligned_dlen1;
 	dent2->ch.node_type = UBIFS_DENT_NODE;
-	dent_key_init_flash(c, &dent2->key, old_dir->i_ino,
-			    &old_dentry->d_name);
+	dent_key_init_flash(c, &dent2->key, old_dir->i_ino, old_nm);
 
 	if (whiteout) {
 		dent2->inum = cpu_to_le64(whiteout->i_ino);
@@ -1138,9 +1140,9 @@ int ubifs_jnl_rename(struct ubifs_info *c, const struct inode *old_dir,
 		dent2->inum = 0;
 		dent2->type = DT_UNKNOWN;
 	}
-	dent2->nlen = cpu_to_le16(old_dentry->d_name.len);
-	memcpy(dent2->name, old_dentry->d_name.name, old_dentry->d_name.len);
-	dent2->name[old_dentry->d_name.len] = '\0';
+	dent2->nlen = cpu_to_le16(fname_len(old_nm));
+	memcpy(dent2->name, fname_name(old_nm), fname_len(old_nm));
+	dent2->name[fname_len(old_nm)] = '\0';
 	zero_dent_node_unused(dent2);
 	ubifs_prep_grp_node(c, dent2, dlen2, 0);
 
@@ -1181,15 +1183,15 @@ int ubifs_jnl_rename(struct ubifs_info *c, const struct inode *old_dir,
 	}
 	release_head(c, BASEHD);
 
-	dent_key_init(c, &key, new_dir->i_ino, &new_dentry->d_name);
-	err = ubifs_tnc_add_nm(c, &key, lnum, offs, dlen1, &new_dentry->d_name);
+	dent_key_init(c, &key, new_dir->i_ino, new_nm);
+	err = ubifs_tnc_add_nm(c, &key, lnum, offs, dlen1, new_nm);
 	if (err)
 		goto out_ro;
 
 	offs += aligned_dlen1;
 	if (whiteout) {
-		dent_key_init(c, &key, old_dir->i_ino, &old_dentry->d_name);
-		err = ubifs_tnc_add_nm(c, &key, lnum, offs, dlen2, &old_dentry->d_name);
+		dent_key_init(c, &key, old_dir->i_ino, old_nm);
+		err = ubifs_tnc_add_nm(c, &key, lnum, offs, dlen2, old_nm);
 		if (err)
 			goto out_ro;
 
@@ -1199,8 +1201,8 @@ int ubifs_jnl_rename(struct ubifs_info *c, const struct inode *old_dir,
 		if (err)
 			goto out_ro;
 
-		dent_key_init(c, &key, old_dir->i_ino, &old_dentry->d_name);
-		err = ubifs_tnc_remove_nm(c, &key, &old_dentry->d_name);
+		dent_key_init(c, &key, old_dir->i_ino, old_nm);
+		err = ubifs_tnc_remove_nm(c, &key, old_nm);
 		if (err)
 			goto out_ro;
 	}
@@ -1461,7 +1463,8 @@ int ubifs_jnl_truncate(struct ubifs_info *c, const struct inode *inode,
  * error code in case of failure.
  */
 int ubifs_jnl_delete_xattr(struct ubifs_info *c, const struct inode *host,
-			   const struct inode *inode, const struct qstr *nm)
+			   const struct inode *inode,
+			   const struct fscrypt_name *nm)
 {
 	int err, xlen, hlen, len, lnum, xent_offs, aligned_xlen;
 	struct ubifs_dent_node *xent;
@@ -1470,9 +1473,9 @@ int ubifs_jnl_delete_xattr(struct ubifs_info *c, const struct inode *host,
 	int sync = IS_DIRSYNC(host);
 	struct ubifs_inode *host_ui = ubifs_inode(host);
 
-	dbg_jnl("host %lu, xattr ino %lu, name '%s', data len %d",
-		host->i_ino, inode->i_ino, nm->name,
-		ubifs_inode(inode)->data_len);
+	//dbg_jnl("host %lu, xattr ino %lu, name '%s', data len %d",
+	//	host->i_ino, inode->i_ino, nm->name,
+	//	ubifs_inode(inode)->data_len);
 	ubifs_assert(inode->i_nlink == 0);
 	ubifs_assert(mutex_is_locked(&host_ui->ui_mutex));
 
@@ -1480,7 +1483,7 @@ int ubifs_jnl_delete_xattr(struct ubifs_info *c, const struct inode *host,
 	 * Since we are deleting the inode, we do not bother to attach any data
 	 * to it and assume its length is %UBIFS_INO_NODE_SZ.
 	 */
-	xlen = UBIFS_DENT_NODE_SZ + nm->len + 1;
+	xlen = UBIFS_DENT_NODE_SZ + fname_len(nm) + 1;
 	aligned_xlen = ALIGN(xlen, 8);
 	hlen = host_ui->data_len + UBIFS_INO_NODE_SZ;
 	len = aligned_xlen + UBIFS_INO_NODE_SZ + ALIGN(hlen, 8);
@@ -1501,9 +1504,9 @@ int ubifs_jnl_delete_xattr(struct ubifs_info *c, const struct inode *host,
 	key_write(c, &xent_key, xent->key);
 	xent->inum = 0;
 	xent->type = get_dent_type(inode->i_mode);
-	xent->nlen = cpu_to_le16(nm->len);
-	memcpy(xent->name, nm->name, nm->len);
-	xent->name[nm->len] = '\0';
+	xent->nlen = cpu_to_le16(fname_len(nm));
+	memcpy(xent->name, fname_name(nm), fname_len(nm));
+	xent->name[fname_len(nm)] = '\0';
 	zero_dent_node_unused(xent);
 	ubifs_prep_grp_node(c, xent, xlen, 0);
 
diff --git a/fs/ubifs/key.h b/fs/ubifs/key.h
index ca4371fdfa7d..7547be512db2 100644
--- a/fs/ubifs/key.h
+++ b/fs/ubifs/key.h
@@ -153,13 +153,13 @@ static inline void highest_ino_key(const struct ubifs_info *c,
  * @c: UBIFS file-system description object
  * @key: key to initialize
  * @inum: parent inode number
- * @nm: direntry name and length
+ * @nm: direntry name and length. Not a string when encrypted!
  */
 static inline void dent_key_init(const struct ubifs_info *c,
 				 union ubifs_key *key, ino_t inum,
-				 const struct qstr *nm)
+				 const struct fscrypt_name *nm)
 {
-	uint32_t hash = c->key_hash(nm->name, nm->len);
+	uint32_t hash = c->key_hash(fname_name(nm), fname_len(nm));
 
 	ubifs_assert(!(hash & ~UBIFS_S_KEY_HASH_MASK));
 	key->u32[0] = inum;
@@ -191,10 +191,11 @@ static inline void dent_key_init_hash(const struct ubifs_info *c,
  * @nm: direntry name and length
  */
 static inline void dent_key_init_flash(const struct ubifs_info *c, void *k,
-				       ino_t inum, const struct qstr *nm)
+				       ino_t inum,
+				       const struct fscrypt_name *nm)
 {
 	union ubifs_key *key = k;
-	uint32_t hash = c->key_hash(nm->name, nm->len);
+	uint32_t hash = c->key_hash(fname_name(nm), fname_len(nm));
 
 	ubifs_assert(!(hash & ~UBIFS_S_KEY_HASH_MASK));
 	key->j32[0] = cpu_to_le32(inum);
@@ -225,9 +226,9 @@ static inline void lowest_dent_key(const struct ubifs_info *c,
  */
 static inline void xent_key_init(const struct ubifs_info *c,
 				 union ubifs_key *key, ino_t inum,
-				 const struct qstr *nm)
+				 const struct fscrypt_name *nm)
 {
-	uint32_t hash = c->key_hash(nm->name, nm->len);
+	uint32_t hash = c->key_hash(fname_name(nm), fname_len(nm));
 
 	ubifs_assert(!(hash & ~UBIFS_S_KEY_HASH_MASK));
 	key->u32[0] = inum;
@@ -242,10 +243,10 @@ static inline void xent_key_init(const struct ubifs_info *c,
  * @nm: extended attribute entry name and length
  */
 static inline void xent_key_init_flash(const struct ubifs_info *c, void *k,
-				       ino_t inum, const struct qstr *nm)
+				       ino_t inum, const struct fscrypt_name *nm)
 {
 	union ubifs_key *key = k;
-	uint32_t hash = c->key_hash(nm->name, nm->len);
+	uint32_t hash = c->key_hash(fname_name(nm), fname_len(nm));
 
 	ubifs_assert(!(hash & ~UBIFS_S_KEY_HASH_MASK));
 	key->j32[0] = cpu_to_le32(inum);
diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index 026e853d31a7..ae5c02f22f3e 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -61,7 +61,7 @@ struct replay_entry {
 	struct list_head list;
 	union ubifs_key key;
 	union {
-		struct qstr nm;
+		struct fscrypt_name nm;
 		struct {
 			loff_t old_size;
 			loff_t new_size;
@@ -327,7 +327,7 @@ static void destroy_replay_list(struct ubifs_info *c)
 
 	list_for_each_entry_safe(r, tmp, &c->replay_list, list) {
 		if (is_hash_key(c, &r->key))
-			kfree(r->nm.name);
+			kfree(fname_name(&r->nm));
 		list_del(&r->list);
 		kfree(r);
 	}
@@ -430,10 +430,10 @@ static int insert_dent(struct ubifs_info *c, int lnum, int offs, int len,
 	r->deletion = !!deletion;
 	r->sqnum = sqnum;
 	key_copy(c, key, &r->key);
-	r->nm.len = nlen;
+	fname_len(&r->nm) = nlen;
 	memcpy(nbuf, name, nlen);
 	nbuf[nlen] = '\0';
-	r->nm.name = nbuf;
+	fname_name(&r->nm) = nbuf;
 
 	list_add_tail(&r->list, &c->replay_list);
 	return 0;
diff --git a/fs/ubifs/tnc.c b/fs/ubifs/tnc.c
index fa9a20cc60d6..0d0030461cb4 100644
--- a/fs/ubifs/tnc.c
+++ b/fs/ubifs/tnc.c
@@ -519,7 +519,7 @@ static int fallible_read_node(struct ubifs_info *c, const union ubifs_key *key,
  * of failure, a negative error code is returned.
  */
 static int matches_name(struct ubifs_info *c, struct ubifs_zbranch *zbr,
-			const struct qstr *nm)
+			const struct fscrypt_name *nm)
 {
 	struct ubifs_dent_node *dent;
 	int nlen, err;
@@ -542,11 +542,11 @@ static int matches_name(struct ubifs_info *c, struct ubifs_zbranch *zbr,
 		dent = zbr->leaf;
 
 	nlen = le16_to_cpu(dent->nlen);
-	err = memcmp(dent->name, nm->name, min_t(int, nlen, nm->len));
+	err = memcmp(dent->name, fname_name(nm), min_t(int, nlen, fname_len(nm)));
 	if (err == 0) {
-		if (nlen == nm->len)
+		if (nlen == fname_len(nm))
 			return NAME_MATCHES;
-		else if (nlen < nm->len)
+		else if (nlen < fname_len(nm))
 			return NAME_LESS;
 		else
 			return NAME_GREATER;
@@ -689,7 +689,7 @@ static int tnc_prev(struct ubifs_info *c, struct ubifs_znode **zn, int *n)
  */
 static int resolve_collision(struct ubifs_info *c, const union ubifs_key *key,
 			     struct ubifs_znode **zn, int *n,
-			     const struct qstr *nm)
+			     const struct fscrypt_name *nm)
 {
 	int err;
 
@@ -807,7 +807,7 @@ static int resolve_collision(struct ubifs_info *c, const union ubifs_key *key,
  */
 static int fallible_matches_name(struct ubifs_info *c,
 				 struct ubifs_zbranch *zbr,
-				 const struct qstr *nm)
+				 const struct fscrypt_name *nm)
 {
 	struct ubifs_dent_node *dent;
 	int nlen, err;
@@ -835,11 +835,11 @@ static int fallible_matches_name(struct ubifs_info *c,
 		dent = zbr->leaf;
 
 	nlen = le16_to_cpu(dent->nlen);
-	err = memcmp(dent->name, nm->name, min_t(int, nlen, nm->len));
+	err = memcmp(dent->name, fname_name(nm), min_t(int, nlen, fname_len(nm)));
 	if (err == 0) {
-		if (nlen == nm->len)
+		if (nlen == fname_len(nm))
 			return NAME_MATCHES;
-		else if (nlen < nm->len)
+		else if (nlen < fname_len(nm))
 			return NAME_LESS;
 		else
 			return NAME_GREATER;
@@ -878,7 +878,8 @@ static int fallible_matches_name(struct ubifs_info *c,
 static int fallible_resolve_collision(struct ubifs_info *c,
 				      const union ubifs_key *key,
 				      struct ubifs_znode **zn, int *n,
-				      const struct qstr *nm, int adding)
+				      const struct fscrypt_name *nm,
+				      int adding)
 {
 	struct ubifs_znode *o_znode = NULL, *znode = *zn;
 	int uninitialized_var(o_n), err, cmp, unsure = 0, nn = *n;
@@ -1789,12 +1790,12 @@ int ubifs_tnc_bulk_read(struct ubifs_info *c, struct bu_info *bu)
  * was not found, and a negative error code in case of failure.
  */
 static int do_lookup_nm(struct ubifs_info *c, const union ubifs_key *key,
-			void *node, const struct qstr *nm)
+			void *node, const struct fscrypt_name *nm)
 {
 	int found, n, err;
 	struct ubifs_znode *znode;
 
-	dbg_tnck(key, "name '%.*s' key ", nm->len, nm->name);
+	//dbg_tnck(key, "name '%.*s' key ", nm->len, nm->name);
 	mutex_lock(&c->tnc_mutex);
 	found = ubifs_lookup_level0(c, key, &znode, &n);
 	if (!found) {
@@ -1837,7 +1838,7 @@ static int do_lookup_nm(struct ubifs_info *c, const union ubifs_key *key,
  * was not found, and a negative error code in case of failure.
  */
 int ubifs_tnc_lookup_nm(struct ubifs_info *c, const union ubifs_key *key,
-			void *node, const struct qstr *nm)
+			void *node, const struct fscrypt_name *nm)
 {
 	int err, len;
 	const struct ubifs_dent_node *dent = node;
@@ -1851,7 +1852,7 @@ int ubifs_tnc_lookup_nm(struct ubifs_info *c, const union ubifs_key *key,
 		return err;
 
 	len = le16_to_cpu(dent->nlen);
-	if (nm->len == len && !memcmp(dent->name, nm->name, len))
+	if (fname_len(nm) == len && !memcmp(dent->name, fname_name(nm), len))
 		return 0;
 
 	/*
@@ -2279,14 +2280,15 @@ int ubifs_tnc_replace(struct ubifs_info *c, const union ubifs_key *key,
  * may have collisions, like directory entry keys.
  */
 int ubifs_tnc_add_nm(struct ubifs_info *c, const union ubifs_key *key,
-		     int lnum, int offs, int len, const struct qstr *nm)
+		     int lnum, int offs, int len,
+		     const struct fscrypt_name *nm)
 {
 	int found, n, err = 0;
 	struct ubifs_znode *znode;
 
 	mutex_lock(&c->tnc_mutex);
-	dbg_tnck(key, "LEB %d:%d, name '%.*s', key ",
-		 lnum, offs, nm->len, nm->name);
+	//dbg_tnck(key, "LEB %d:%d, name '%.*s', key ",
+	//	 lnum, offs, nm->len, nm->name);
 	found = lookup_level0_dirty(c, key, &znode, &n);
 	if (found < 0) {
 		err = found;
@@ -2344,7 +2346,7 @@ int ubifs_tnc_add_nm(struct ubifs_info *c, const union ubifs_key *key,
 			 * by passing 'ubifs_tnc_remove_nm()' the same key but
 			 * an unmatchable name.
 			 */
-			struct qstr noname = { .name = "" };
+			struct fscrypt_name noname = { .disk_name = { .name = "", .len = 1 } };
 
 			err = dbg_check_tnc(c, 0);
 			mutex_unlock(&c->tnc_mutex);
@@ -2514,13 +2516,13 @@ int ubifs_tnc_remove(struct ubifs_info *c, const union ubifs_key *key)
  * Returns %0 on success or negative error code on failure.
  */
 int ubifs_tnc_remove_nm(struct ubifs_info *c, const union ubifs_key *key,
-			const struct qstr *nm)
+			const struct fscrypt_name *nm)
 {
 	int n, err;
 	struct ubifs_znode *znode;
 
 	mutex_lock(&c->tnc_mutex);
-	dbg_tnck(key, "%.*s, key ", nm->len, nm->name);
+	//dbg_tnck(key, "%.*s, key ", nm->len, nm->name);
 	err = lookup_level0_dirty(c, key, &znode, &n);
 	if (err < 0)
 		goto out_unlock;
@@ -2669,7 +2671,7 @@ int ubifs_tnc_remove_ino(struct ubifs_info *c, ino_t inum)
 {
 	union ubifs_key key1, key2;
 	struct ubifs_dent_node *xent, *pxent = NULL;
-	struct qstr nm = { .name = NULL };
+	struct fscrypt_name nm = {0};
 
 	dbg_tnc("ino %lu", (unsigned long)inum);
 
@@ -2694,8 +2696,8 @@ int ubifs_tnc_remove_ino(struct ubifs_info *c, ino_t inum)
 		dbg_tnc("xent '%s', ino %lu", xent->name,
 			(unsigned long)xattr_inum);
 
-		nm.name = xent->name;
-		nm.len = le16_to_cpu(xent->nlen);
+		fname_name(&nm) = xent->name;
+		fname_len(&nm) = le16_to_cpu(xent->nlen);
 		err = ubifs_tnc_remove_nm(c, &key1, &nm);
 		if (err) {
 			kfree(xent);
@@ -2747,7 +2749,7 @@ int ubifs_tnc_remove_ino(struct ubifs_info *c, ino_t inum)
  */
 struct ubifs_dent_node *ubifs_tnc_next_ent(struct ubifs_info *c,
 					   union ubifs_key *key,
-					   const struct qstr *nm)
+					   const struct fscrypt_name *nm)
 {
 	int n, err, type = key_type(c, key);
 	struct ubifs_znode *znode;
@@ -2755,7 +2757,7 @@ struct ubifs_dent_node *ubifs_tnc_next_ent(struct ubifs_info *c,
 	struct ubifs_zbranch *zbr;
 	union ubifs_key *dkey;
 
-	dbg_tnck(key, "%s ", nm->name ? (char *)nm->name : "(lowest)");
+	//dbg_tnck(key, "%s ", nm->name ? (char *)nm->name : "(lowest)");
 	ubifs_assert(is_hash_key(c, key));
 
 	mutex_lock(&c->tnc_mutex);
@@ -2763,7 +2765,7 @@ struct ubifs_dent_node *ubifs_tnc_next_ent(struct ubifs_info *c,
 	if (unlikely(err < 0))
 		goto out_unlock;
 
-	if (nm->name) {
+	if (fname_len(nm) > 0) {
 		if (err) {
 			/* Handle collisions */
 			err = resolve_collision(c, key, &znode, &n, nm);
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 3803f833b712..fc5a9c37439d 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1522,25 +1522,29 @@ int ubifs_consolidate_log(struct ubifs_info *c);
 
 /* journal.c */
 int ubifs_jnl_update(struct ubifs_info *c, const struct inode *dir,
-		     const struct qstr *nm, const struct inode *inode,
+		     const struct fscrypt_name *nm, const struct inode *inode,
 		     int deletion, int xent);
 int ubifs_jnl_write_data(struct ubifs_info *c, const struct inode *inode,
 			 const union ubifs_key *key, const void *buf, int len);
 int ubifs_jnl_write_inode(struct ubifs_info *c, const struct inode *inode);
 int ubifs_jnl_delete_inode(struct ubifs_info *c, const struct inode *inode);
 int ubifs_jnl_xrename(struct ubifs_info *c, const struct inode *fst_dir,
-		      const struct dentry *fst_dentry,
+		      const struct inode *fst_inode,
+		      const struct fscrypt_name *fst_nm,
 		      const struct inode *snd_dir,
-		      const struct dentry *snd_dentry, int sync);
+		      const struct inode *snd_inode,
+		      const struct fscrypt_name *snd_nm, int sync);
 int ubifs_jnl_rename(struct ubifs_info *c, const struct inode *old_dir,
-		     const struct dentry *old_dentry,
+		     const struct inode *old_inode,
+		     const struct fscrypt_name *old_nm,
 		     const struct inode *new_dir,
-		     const struct dentry *new_dentry,
+		     const struct inode *new_inode,
+		     const struct fscrypt_name *new_nm,
 		     const struct inode *whiteout, int sync);
 int ubifs_jnl_truncate(struct ubifs_info *c, const struct inode *inode,
 		       loff_t old_size, loff_t new_size);
 int ubifs_jnl_delete_xattr(struct ubifs_info *c, const struct inode *host,
-			   const struct inode *inode, const struct qstr *nm);
+			   const struct inode *inode, const struct fscrypt_name *nm);
 int ubifs_jnl_change_xattr(struct ubifs_info *c, const struct inode *inode1,
 			   const struct inode *inode2);
 
@@ -1575,7 +1579,7 @@ int ubifs_save_dirty_idx_lnums(struct ubifs_info *c);
 int ubifs_lookup_level0(struct ubifs_info *c, const union ubifs_key *key,
 			struct ubifs_znode **zn, int *n);
 int ubifs_tnc_lookup_nm(struct ubifs_info *c, const union ubifs_key *key,
-			void *node, const struct qstr *nm);
+			void *node, const struct fscrypt_name *nm);
 int ubifs_tnc_locate(struct ubifs_info *c, const union ubifs_key *key,
 		     void *node, int *lnum, int *offs);
 int ubifs_tnc_add(struct ubifs_info *c, const union ubifs_key *key, int lnum,
@@ -1583,16 +1587,16 @@ int ubifs_tnc_add(struct ubifs_info *c, const union ubifs_key *key, int lnum,
 int ubifs_tnc_replace(struct ubifs_info *c, const union ubifs_key *key,
 		      int old_lnum, int old_offs, int lnum, int offs, int len);
 int ubifs_tnc_add_nm(struct ubifs_info *c, const union ubifs_key *key,
-		     int lnum, int offs, int len, const struct qstr *nm);
+		     int lnum, int offs, int len, const struct fscrypt_name *nm);
 int ubifs_tnc_remove(struct ubifs_info *c, const union ubifs_key *key);
 int ubifs_tnc_remove_nm(struct ubifs_info *c, const union ubifs_key *key,
-			const struct qstr *nm);
+			const struct fscrypt_name *nm);
 int ubifs_tnc_remove_range(struct ubifs_info *c, union ubifs_key *from_key,
 			   union ubifs_key *to_key);
 int ubifs_tnc_remove_ino(struct ubifs_info *c, ino_t inum);
 struct ubifs_dent_node *ubifs_tnc_next_ent(struct ubifs_info *c,
 					   union ubifs_key *key,
-					   const struct qstr *nm);
+					   const struct fscrypt_name *nm);
 void ubifs_tnc_close(struct ubifs_info *c);
 int ubifs_tnc_has_node(struct ubifs_info *c, union ubifs_key *key, int level,
 		       int lnum, int offs, int is_idx);
diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index da59ea3b50c4..efe00fcb8b75 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -97,7 +97,7 @@ static const struct file_operations empty_fops;
  * of failure.
  */
 static int create_xattr(struct ubifs_info *c, struct inode *host,
-			const struct qstr *nm, const void *value, int size)
+			const struct fscrypt_name *nm, const void *value, int size)
 {
 	int err, names_len;
 	struct inode *inode;
@@ -117,7 +117,7 @@ static int create_xattr(struct ubifs_info *c, struct inode *host,
 	 * extended attributes if the name list becomes larger. This limitation
 	 * is artificial for UBIFS, though.
 	 */
-	names_len = host_ui->xattr_names + host_ui->xattr_cnt + nm->len + 1;
+	names_len = host_ui->xattr_names + host_ui->xattr_cnt + fname_len(nm) + 1;
 	if (names_len > XATTR_LIST_MAX) {
 		ubifs_err(c, "cannot add one more xattr name to inode %lu, total names length would become %d, max. is %d",
 			  host->i_ino, names_len, XATTR_LIST_MAX);
@@ -154,9 +154,9 @@ static int create_xattr(struct ubifs_info *c, struct inode *host,
 	mutex_lock(&host_ui->ui_mutex);
 	host->i_ctime = ubifs_current_time(host);
 	host_ui->xattr_cnt += 1;
-	host_ui->xattr_size += CALC_DENT_SIZE(nm->len);
+	host_ui->xattr_size += CALC_DENT_SIZE(fname_len(nm));
 	host_ui->xattr_size += CALC_XATTR_BYTES(size);
-	host_ui->xattr_names += nm->len;
+	host_ui->xattr_names += fname_len(nm);
 
 	/*
 	 * We handle UBIFS_XATTR_NAME_ENCRYPTION_CONTEXT here because we
@@ -164,7 +164,7 @@ static int create_xattr(struct ubifs_info *c, struct inode *host,
 	 * To avoid multiple updates of the same inode in the same operation,
 	 * let's do it here.
 	 */
-	if (strcmp(nm->name, UBIFS_XATTR_NAME_ENCRYPTION_CONTEXT) == 0)
+	if (strcmp(fname_name(nm), UBIFS_XATTR_NAME_ENCRYPTION_CONTEXT) == 0)
 		host_ui->flags |= UBIFS_CRYPT_FL;
 
 	err = ubifs_jnl_update(c, host, nm, inode, 0, 1);
@@ -179,9 +179,9 @@ static int create_xattr(struct ubifs_info *c, struct inode *host,
 
 out_cancel:
 	host_ui->xattr_cnt -= 1;
-	host_ui->xattr_size -= CALC_DENT_SIZE(nm->len);
+	host_ui->xattr_size -= CALC_DENT_SIZE(fname_len(nm));
 	host_ui->xattr_size -= CALC_XATTR_BYTES(size);
-	host_ui->xattr_names -= nm->len;
+	host_ui->xattr_names -= fname_len(nm);
 	host_ui->flags &= ~UBIFS_CRYPT_FL;
 	mutex_unlock(&host_ui->ui_mutex);
 out_free:
@@ -284,7 +284,7 @@ int ubifs_xattr_set(struct inode *host, const char *name, const void *value,
 {
 	struct inode *inode;
 	struct ubifs_info *c = host->i_sb->s_fs_info;
-	struct qstr nm = QSTR_INIT(name, strlen(name));
+	struct fscrypt_name nm = { .disk_name = FSTR_INIT((char *)name, strlen(name))};
 	struct ubifs_dent_node *xent;
 	union ubifs_key key;
 	int err;
@@ -300,7 +300,7 @@ int ubifs_xattr_set(struct inode *host, const char *name, const void *value,
 	if (size > UBIFS_MAX_INO_DATA)
 		return -ERANGE;
 
-	if (nm.len > UBIFS_MAX_NLEN)
+	if (fname_len(&nm) > UBIFS_MAX_NLEN)
 		return -ENAMETOOLONG;
 
 	xent = kmalloc(UBIFS_MAX_XENT_NODE_SZ, GFP_NOFS);
@@ -350,13 +350,13 @@ ssize_t ubifs_xattr_get(struct inode *host, const char *name, void *buf,
 {
 	struct inode *inode;
 	struct ubifs_info *c = host->i_sb->s_fs_info;
-	struct qstr nm = QSTR_INIT(name, strlen(name));
+	struct fscrypt_name nm = { .disk_name = FSTR_INIT((char *)name, strlen(name))};
 	struct ubifs_inode *ui;
 	struct ubifs_dent_node *xent;
 	union ubifs_key key;
 	int err;
 
-	if (nm.len > UBIFS_MAX_NLEN)
+	if (fname_len(&nm) > UBIFS_MAX_NLEN)
 		return -ENAMETOOLONG;
 
 	xent = kmalloc(UBIFS_MAX_XENT_NODE_SZ, GFP_NOFS);
@@ -425,7 +425,7 @@ ssize_t ubifs_listxattr(struct dentry *dentry, char *buffer, size_t size)
 	struct ubifs_inode *host_ui = ubifs_inode(host);
 	struct ubifs_dent_node *xent, *pxent = NULL;
 	int err, len, written = 0;
-	struct qstr nm = { .name = NULL };
+	struct fscrypt_name nm = {0};
 
 	dbg_gen("ino %lu ('%pd'), buffer size %zd", host->i_ino,
 		dentry, size);
@@ -449,12 +449,12 @@ ssize_t ubifs_listxattr(struct dentry *dentry, char *buffer, size_t size)
 			break;
 		}
 
-		nm.name = xent->name;
-		nm.len = le16_to_cpu(xent->nlen);
+		fname_name(&nm) = xent->name;
+		fname_len(&nm) = le16_to_cpu(xent->nlen);
 
 		if (xattr_visible(xent->name)) {
-			memcpy(buffer + written, nm.name, nm.len + 1);
-			written += nm.len + 1;
+			memcpy(buffer + written, fname_name(&nm), fname_len(&nm) + 1);
+			written += fname_len(&nm) + 1;
 		}
 
 		kfree(pxent);
@@ -473,7 +473,7 @@ ssize_t ubifs_listxattr(struct dentry *dentry, char *buffer, size_t size)
 }
 
 static int remove_xattr(struct ubifs_info *c, struct inode *host,
-			struct inode *inode, const struct qstr *nm)
+			struct inode *inode, const struct fscrypt_name *nm)
 {
 	int err;
 	struct ubifs_inode *host_ui = ubifs_inode(host);
@@ -490,9 +490,9 @@ static int remove_xattr(struct ubifs_info *c, struct inode *host,
 	mutex_lock(&host_ui->ui_mutex);
 	host->i_ctime = ubifs_current_time(host);
 	host_ui->xattr_cnt -= 1;
-	host_ui->xattr_size -= CALC_DENT_SIZE(nm->len);
+	host_ui->xattr_size -= CALC_DENT_SIZE(fname_len(nm));
 	host_ui->xattr_size -= CALC_XATTR_BYTES(ui->data_len);
-	host_ui->xattr_names -= nm->len;
+	host_ui->xattr_names -= fname_len(nm);
 
 	err = ubifs_jnl_delete_xattr(c, host, inode, nm);
 	if (err)
@@ -504,9 +504,9 @@ static int remove_xattr(struct ubifs_info *c, struct inode *host,
 
 out_cancel:
 	host_ui->xattr_cnt += 1;
-	host_ui->xattr_size += CALC_DENT_SIZE(nm->len);
+	host_ui->xattr_size += CALC_DENT_SIZE(fname_len(nm));
 	host_ui->xattr_size += CALC_XATTR_BYTES(ui->data_len);
-	host_ui->xattr_names += nm->len;
+	host_ui->xattr_names += fname_len(nm);
 	mutex_unlock(&host_ui->ui_mutex);
 	ubifs_release_budget(c, &req);
 	make_bad_inode(inode);
@@ -517,14 +517,14 @@ static int ubifs_xattr_remove(struct inode *host, const char *name)
 {
 	struct inode *inode;
 	struct ubifs_info *c = host->i_sb->s_fs_info;
-	struct qstr nm = QSTR_INIT(name, strlen(name));
+	struct fscrypt_name nm = { .disk_name = FSTR_INIT((char *)name, strlen(name))};
 	struct ubifs_dent_node *xent;
 	union ubifs_key key;
 	int err;
 
 	ubifs_assert(inode_is_locked(host));
 
-	if (nm.len > UBIFS_MAX_NLEN)
+	if (fname_len(&nm) > UBIFS_MAX_NLEN)
 		return -ENAMETOOLONG;
 
 	xent = kmalloc(UBIFS_MAX_XENT_NODE_SZ, GFP_NOFS);
-- 
2.7.3
