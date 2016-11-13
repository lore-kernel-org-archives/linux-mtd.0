Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c62Ee-0004vc-OX
 for linux-mtd@lists.infradead.org; Sun, 13 Nov 2016 21:22:53 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dedekind1@gmail.com, adrian.hunter@intel.com, tytso@mit.edu,
 jaegeuk@kernel.org, david@sigma-star.at, wd@denx.de, sbabic@denx.de,
 dengler@linutronix.de, ebiggers@google.com, mhalcrow@google.com,
 hch@infradead.org, Richard Weinberger <richard@nod.at>
Subject: [PATCH 23/29] ubifs: Add support for encrypted symlinks
Date: Sun, 13 Nov 2016 22:21:06 +0100
Message-Id: <1479072072-6844-24-git-send-email-richard@nod.at>
In-Reply-To: <1479072072-6844-1-git-send-email-richard@nod.at>
References: <1479072072-6844-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/dir.c   | 83 ++++++++++++++++++++++++++++++++++++++++++++++++--------
 fs/ubifs/file.c  | 55 ++++++++++++++++++++++++++++++++++++-
 fs/ubifs/super.c |  1 -
 3 files changed, 126 insertions(+), 13 deletions(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 7d1bd4b28140..7d3bc3fb8831 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -629,7 +629,7 @@ static int ubifs_readdir(struct file *file, struct dir_context *ctx)
 			fstr.len = fstr_real_len;
 
 			err = fscrypt_fname_disk_to_usr(dir, key_hash_flash(c, &dent->key), 0, &nm.disk_name, &fstr);
-			if (err < 0)
+			if (err)
 				goto out;
 		} else {
 			fstr.len = fname_len(&nm);
@@ -1164,10 +1164,27 @@ static int ubifs_symlink(struct inode *dir, struct dentry *dentry,
 	struct ubifs_inode *dir_ui = ubifs_inode(dir);
 	struct ubifs_info *c = dir->i_sb->s_fs_info;
 	int err, len = strlen(symname);
-	int sz_change = CALC_DENT_SIZE(dentry->d_name.len);
+	int sz_change = CALC_DENT_SIZE(len);
+	struct fscrypt_str disk_link = FSTR_INIT((char *)symname, len + 1);
+	struct fscrypt_symlink_data *sd = NULL;
 	struct ubifs_budget_req req = { .new_ino = 1, .new_dent = 1,
 					.new_ino_d = ALIGN(len, 8),
 					.dirtied_ino = 1 };
+	struct fscrypt_name nm;
+
+	if (ubifs_crypt_is_encrypted(dir)) {
+		err = fscrypt_get_encryption_info(dir);
+		if (err)
+			goto out_budg;
+
+		if (!fscrypt_has_encryption_key(dir)) {
+			err = -EPERM;
+			goto out_budg;
+		}
+
+		disk_link.len = (fscrypt_fname_encrypted_size(dir, len) +
+				sizeof(struct fscrypt_symlink_data));
+	}
 
 	/*
 	 * Budget request settings: new inode, new direntry and changing parent
@@ -1177,36 +1194,77 @@ static int ubifs_symlink(struct inode *dir, struct dentry *dentry,
 	dbg_gen("dent '%pd', target '%s' in dir ino %lu", dentry,
 		symname, dir->i_ino);
 
-	if (len > UBIFS_MAX_INO_DATA)
+	if (disk_link.len > UBIFS_MAX_INO_DATA)
 		return -ENAMETOOLONG;
 
 	err = ubifs_budget_space(c, &req);
 	if (err)
 		return err;
 
+	err = fscrypt_setup_filename(dir, &dentry->d_name, 0, &nm);
+	if (err)
+		goto out_budg;
+
 	inode = ubifs_new_inode(c, dir, S_IFLNK | S_IRWXUGO);
 	if (IS_ERR(inode)) {
 		err = PTR_ERR(inode);
-		goto out_budg;
+		goto out_fname;
 	}
 
 	ui = ubifs_inode(inode);
-	ui->data = kmalloc(len + 1, GFP_NOFS);
+	ui->data = kmalloc(disk_link.len, GFP_NOFS);
 	if (!ui->data) {
 		err = -ENOMEM;
 		goto out_inode;
 	}
 
-	memcpy(ui->data, symname, len);
-	((char *)ui->data)[len] = '\0';
-	inode->i_link = ui->data;
+	if (ubifs_crypt_is_encrypted(dir)) {
+		struct qstr istr = QSTR_INIT(symname, len);
+		struct fscrypt_str ostr;
+
+		sd = kzalloc(disk_link.len, GFP_NOFS);
+		if (!sd) {
+			err = -ENOMEM;
+			goto out_inode;
+		}
+
+		err = fscrypt_get_encryption_info(inode);
+		if (err) {
+			kfree(sd);
+			goto out_inode;
+		}
+
+		if (!fscrypt_has_encryption_key(inode)) {
+			kfree(sd);
+			err = -EPERM;
+			goto out_inode;
+		}
+
+		ostr.name = sd->encrypted_path;
+		ostr.len = disk_link.len;
+
+		err = fscrypt_fname_usr_to_disk(inode, &istr, &ostr);
+		if (err) {
+			kfree(sd);
+			goto out_inode;
+		}
+
+		sd->len = cpu_to_le16(ostr.len);
+		disk_link.name = (char *)sd;
+	} else {
+		inode->i_link = ui->data;
+	}
+
+	memcpy(ui->data, disk_link.name, disk_link.len);
+	((char *)ui->data)[disk_link.len - 1] = '\0';
+
 	/*
 	 * The terminating zero byte is not written to the flash media and it
 	 * is put just to make later in-memory string processing simpler. Thus,
 	 * data length is @len, not @len + %1.
 	 */
-	ui->data_len = len;
-	inode->i_size = ubifs_inode(inode)->ui_size = len;
+	ui->data_len = disk_link.len - 1;
+	inode->i_size = ubifs_inode(inode)->ui_size = disk_link.len - 1;
 
 	err = ubifs_init_security(dir, inode, &dentry->d_name);
 	if (err)
@@ -1216,7 +1274,7 @@ static int ubifs_symlink(struct inode *dir, struct dentry *dentry,
 	dir->i_size += sz_change;
 	dir_ui->ui_size = dir->i_size;
 	dir->i_mtime = dir->i_ctime = inode->i_ctime;
-	err = ubifs_jnl_update(c, dir, &dentry->d_name, inode, 0, 0);
+	err = ubifs_jnl_update(c, dir, &nm, inode, 0, 0);
 	if (err)
 		goto out_cancel;
 	mutex_unlock(&dir_ui->ui_mutex);
@@ -1224,6 +1282,7 @@ static int ubifs_symlink(struct inode *dir, struct dentry *dentry,
 	ubifs_release_budget(c, &req);
 	insert_inode_hash(inode);
 	d_instantiate(dentry, inode);
+	fscrypt_free_filename(&nm);
 	return 0;
 
 out_cancel:
@@ -1233,6 +1292,8 @@ static int ubifs_symlink(struct inode *dir, struct dentry *dentry,
 out_inode:
 	make_bad_inode(inode);
 	iput(inode);
+out_fname:
+	fscrypt_free_filename(&nm);
 out_budg:
 	ubifs_release_budget(c, &req);
 	return err;
diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 4c50f8feb0d5..aa0625f4f642 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1657,6 +1657,59 @@ static int ubifs_file_open(struct inode *inode, struct file *filp)
 	return 0;
 }
 
+static const char *ubifs_get_link(struct dentry *dentry,
+					    struct inode *inode,
+					    struct delayed_call *done)
+{
+	int err;
+	struct fscrypt_symlink_data *sd;
+	struct ubifs_inode *ui = ubifs_inode(inode);
+	struct fscrypt_str cstr;
+	struct fscrypt_str pstr;
+
+	if (!ubifs_crypt_is_encrypted(inode))
+		return ui->data;
+
+	if (!dentry)
+		return ERR_PTR(-ECHILD);
+
+	err = fscrypt_get_encryption_info(inode);
+	if (err)
+		return ERR_PTR(err);
+
+	sd = (struct fscrypt_symlink_data *)ui->data;
+	cstr.name = sd->encrypted_path;
+	cstr.len = le16_to_cpu(sd->len);
+
+	if (cstr.len == 0)
+		return ERR_PTR(-ENOENT);
+
+	if ((cstr.len + sizeof(struct fscrypt_symlink_data) - 1) > ui->data_len)
+		return ERR_PTR(-EIO);
+
+	err = fscrypt_fname_alloc_buffer(inode, cstr.len, &pstr);
+	if (err)
+		return ERR_PTR(err);
+
+	err = fscrypt_fname_disk_to_usr(inode, 0, 0, &cstr, &pstr);
+	if (err) {
+		fscrypt_fname_free_buffer(&pstr);
+		return ERR_PTR(err);
+	}
+
+	pstr.name[pstr.len] = '\0';
+
+	// XXX this probably won't happen anymore...
+	if (pstr.name[0] == '\0') {
+		fscrypt_fname_free_buffer(&pstr);
+		return ERR_PTR(-ENOENT);
+	}
+
+	set_delayed_call(done, kfree_link, pstr.name);
+	return pstr.name;
+}
+
+
 const struct address_space_operations ubifs_file_address_operations = {
 	.readpage       = ubifs_readpage,
 	.writepage      = ubifs_writepage,
@@ -1681,7 +1734,7 @@ const struct inode_operations ubifs_file_inode_operations = {
 
 const struct inode_operations ubifs_symlink_inode_operations = {
 	.readlink    = generic_readlink,
-	.get_link    = simple_get_link,
+	.get_link    = ubifs_get_link,
 	.setattr     = ubifs_setattr,
 	.getattr     = ubifs_getattr,
 	.listxattr   = ubifs_listxattr,
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index ae25c908fbe5..e08aa04fc835 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -198,7 +198,6 @@ struct inode *ubifs_iget(struct super_block *sb, unsigned long inum)
 		}
 		memcpy(ui->data, ino->data, ui->data_len);
 		((char *)ui->data)[ui->data_len] = '\0';
-		inode->i_link = ui->data;
 		break;
 	case S_IFBLK:
 	case S_IFCHR:
-- 
2.7.3
