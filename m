Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dribJ-0006Zt-LJ
 for linux-mtd@lists.infradead.org; Tue, 12 Sep 2017 10:39:31 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>,
 Artem Bityutskiy <dedekind1@gmail.com>, kernel@pengutronix.de,
 Mimi Zohar <zohar@linux.vnet.ibm.com>,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 linux-ima-devel@lists.sourceforge.net,
 Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH] fs: ubifs: Add i_version support
Date: Tue, 12 Sep 2017 12:39:00 +0200
Message-Id: <20170912103900.8629-1-s.hauer@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This adds i_version support to UBIFS. The inodes i_version is used by
IMA to detect changes to an inode and thus necessary to support IMA on
UBIFS. The i_version is stored in the previously unused space in the
UBIFS inode struct. Unlike in ext4 i_version support is unconditionally
enabled in UBIFS as I saw no reason to make it optional.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 fs/ubifs/dir.c         | 30 +++++++++++++++++++-----------
 fs/ubifs/file.c        |  5 +++++
 fs/ubifs/journal.c     |  3 ++-
 fs/ubifs/super.c       |  2 ++
 fs/ubifs/ubifs-media.h |  3 ++-
 5 files changed, 30 insertions(+), 13 deletions(-)

I did this patch exclusively to support IMA on UBIFS. IMA uses the inode's
i_version field to detect changes on inodes. A proper i_version support
needs to make the i_version persistent on disk, although IMA itself doesn't
need a persistent i_version. Last time an earlier version of this patch
was sent by Oleksij Rempel Richard said:

> What about making i_version persistent?
> We still have some empty fields in UBIFS' inode data structure.
> But first we have to be very sure that we need it.

This patch exactly implements this suggestion, leaving the question if we
really need it. I added the IMA maintainers to Cc in the hope that Mimi or
Dmitry can give a good reason why there's no alternative to i_version for IMA.

Sascha

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 417fe0b29f23..addf161df313 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -195,6 +195,13 @@ struct inode *ubifs_new_inode(struct ubifs_info *c, struct inode *dir,
 	return inode;
 }
 
+static void ubifs_dir_update_time(struct inode *dir, struct timespec time)
+{
+	dir->i_mtime = dir->i_ctime = time;
+
+	inode_inc_iversion(dir);
+}
+
 static int dbg_check_name(const struct ubifs_info *c,
 			  const struct ubifs_dent_node *dent,
 			  const struct fscrypt_name *nm)
@@ -356,7 +363,8 @@ static int ubifs_create(struct inode *dir, struct dentry *dentry, umode_t mode,
 	mutex_lock(&dir_ui->ui_mutex);
 	dir->i_size += sz_change;
 	dir_ui->ui_size = dir->i_size;
-	dir->i_mtime = dir->i_ctime = inode->i_ctime;
+	ubifs_dir_update_time(dir, inode->i_ctime);
+
 	err = ubifs_jnl_update(c, dir, &nm, inode, 0, 0);
 	if (err)
 		goto out_cancel;
@@ -770,7 +778,7 @@ static int ubifs_link(struct dentry *old_dentry, struct inode *dir,
 	inode->i_ctime = current_time(inode);
 	dir->i_size += sz_change;
 	dir_ui->ui_size = dir->i_size;
-	dir->i_mtime = dir->i_ctime = inode->i_ctime;
+	ubifs_dir_update_time(dir, inode->i_ctime);
 	err = ubifs_jnl_update(c, dir, &nm, inode, 0, 0);
 	if (err)
 		goto out_cancel;
@@ -846,7 +854,7 @@ static int ubifs_unlink(struct inode *dir, struct dentry *dentry)
 	drop_nlink(inode);
 	dir->i_size -= sz_change;
 	dir_ui->ui_size = dir->i_size;
-	dir->i_mtime = dir->i_ctime = inode->i_ctime;
+	ubifs_dir_update_time(dir, inode->i_ctime);
 	err = ubifs_jnl_update(c, dir, &nm, inode, 1, 0);
 	if (err)
 		goto out_cancel;
@@ -951,7 +959,7 @@ static int ubifs_rmdir(struct inode *dir, struct dentry *dentry)
 	drop_nlink(dir);
 	dir->i_size -= sz_change;
 	dir_ui->ui_size = dir->i_size;
-	dir->i_mtime = dir->i_ctime = inode->i_ctime;
+	ubifs_dir_update_time(dir, inode->i_ctime);
 	err = ubifs_jnl_update(c, dir, &nm, inode, 1, 0);
 	if (err)
 		goto out_cancel;
@@ -1023,7 +1031,7 @@ static int ubifs_mkdir(struct inode *dir, struct dentry *dentry, umode_t mode)
 	inc_nlink(dir);
 	dir->i_size += sz_change;
 	dir_ui->ui_size = dir->i_size;
-	dir->i_mtime = dir->i_ctime = inode->i_ctime;
+	ubifs_dir_update_time(dir, inode->i_ctime);
 	err = ubifs_jnl_update(c, dir, &nm, inode, 0, 0);
 	if (err) {
 		ubifs_err(c, "cannot create directory, error %d", err);
@@ -1114,7 +1122,7 @@ static int ubifs_mknod(struct inode *dir, struct dentry *dentry,
 	mutex_lock(&dir_ui->ui_mutex);
 	dir->i_size += sz_change;
 	dir_ui->ui_size = dir->i_size;
-	dir->i_mtime = dir->i_ctime = inode->i_ctime;
+	ubifs_dir_update_time(dir, inode->i_ctime);
 	err = ubifs_jnl_update(c, dir, &nm, inode, 0, 0);
 	if (err)
 		goto out_cancel;
@@ -1245,7 +1253,7 @@ static int ubifs_symlink(struct inode *dir, struct dentry *dentry,
 	mutex_lock(&dir_ui->ui_mutex);
 	dir->i_size += sz_change;
 	dir_ui->ui_size = dir->i_size;
-	dir->i_mtime = dir->i_ctime = inode->i_ctime;
+	ubifs_dir_update_time(dir, inode->i_ctime);
 	err = ubifs_jnl_update(c, dir, &nm, inode, 0, 0);
 	if (err)
 		goto out_cancel;
@@ -1450,8 +1458,8 @@ static int do_rename(struct inode *old_dir, struct dentry *old_dentry,
 
 	old_dir->i_size -= old_sz;
 	ubifs_inode(old_dir)->ui_size = old_dir->i_size;
-	old_dir->i_mtime = old_dir->i_ctime = time;
-	new_dir->i_mtime = new_dir->i_ctime = time;
+	ubifs_dir_update_time(old_dir, time);
+	ubifs_dir_update_time(new_dir, time);
 
 	/*
 	 * And finally, if we unlinked a direntry which happened to have the
@@ -1595,8 +1603,8 @@ static int ubifs_xrename(struct inode *old_dir, struct dentry *old_dentry,
 	time = current_time(old_dir);
 	fst_inode->i_ctime = time;
 	snd_inode->i_ctime = time;
-	old_dir->i_mtime = old_dir->i_ctime = time;
-	new_dir->i_mtime = new_dir->i_ctime = time;
+	ubifs_dir_update_time(old_dir, time);
+	ubifs_dir_update_time(new_dir, time);
 
 	if (old_dir != new_dir) {
 		if (S_ISDIR(fst_inode->i_mode) && !S_ISDIR(snd_inode->i_mode)) {
diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 8cad0b19b404..54f58172b6e7 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1104,6 +1104,7 @@ static void do_attr_changes(struct inode *inode, const struct iattr *attr)
 			mode &= ~S_ISGID;
 		inode->i_mode = mode;
 	}
+	inode_inc_iversion(inode);
 }
 
 /**
@@ -1409,6 +1410,8 @@ int ubifs_update_time(struct inode *inode, struct timespec *time,
 	if (!(inode->i_sb->s_flags & MS_LAZYTIME))
 		iflags |= I_DIRTY_SYNC;
 
+	inode_inc_iversion(inode);
+
 	release = ui->dirty;
 	__mark_inode_dirty(inode, iflags);
 	mutex_unlock(&ui->ui_mutex);
@@ -1443,6 +1446,7 @@ static int update_mctime(struct inode *inode)
 
 		mutex_lock(&ui->ui_mutex);
 		inode->i_mtime = inode->i_ctime = current_time(inode);
+		inode_inc_iversion(inode);
 		release = ui->dirty;
 		mark_inode_dirty_sync(inode);
 		mutex_unlock(&ui->ui_mutex);
@@ -1588,6 +1592,7 @@ static int ubifs_vm_page_mkwrite(struct vm_fault *vmf)
 
 		mutex_lock(&ui->ui_mutex);
 		inode->i_mtime = inode->i_ctime = current_time(inode);
+		inode_inc_iversion(inode);
 		release = ui->dirty;
 		mark_inode_dirty_sync(inode);
 		mutex_unlock(&ui->ui_mutex);
diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 04c4ec6483e5..9a2062d57bc8 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -67,7 +67,7 @@
 static inline void zero_ino_node_unused(struct ubifs_ino_node *ino)
 {
 	memset(ino->padding1, 0, 4);
-	memset(ino->padding2, 0, 26);
+	memset(ino->padding2, 0, 18);
 }
 
 /**
@@ -459,6 +459,7 @@ static void pack_inode(struct ubifs_info *c, struct ubifs_ino_node *ino,
 	ino->ctime_nsec = cpu_to_le32(inode->i_ctime.tv_nsec);
 	ino->mtime_sec  = cpu_to_le64(inode->i_mtime.tv_sec);
 	ino->mtime_nsec = cpu_to_le32(inode->i_mtime.tv_nsec);
+	ino->iversion = cpu_to_le64(inode->i_version);
 	ino->uid   = cpu_to_le32(i_uid_read(inode));
 	ino->gid   = cpu_to_le32(i_gid_read(inode));
 	ino->mode  = cpu_to_le32(inode->i_mode);
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index bffadbb67e47..545c268033cc 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -143,6 +143,7 @@ struct inode *ubifs_iget(struct super_block *sb, unsigned long inum)
 	inode->i_ctime.tv_nsec = le32_to_cpu(ino->ctime_nsec);
 	inode->i_mode = le32_to_cpu(ino->mode);
 	inode->i_size = le64_to_cpu(ino->size);
+	inode->i_version = le64_to_cpu(ino->iversion);
 
 	ui->data_len    = le32_to_cpu(ino->data_len);
 	ui->flags       = le32_to_cpu(ino->flags);
@@ -2056,6 +2057,7 @@ static int ubifs_fill_super(struct super_block *sb, void *data, int silent)
 	sb->s_op = &ubifs_super_operations;
 	sb->s_xattr = ubifs_xattr_handlers;
 	sb->s_cop = &ubifs_crypt_operations;
+	sb->s_flags |= MS_I_VERSION;
 
 	mutex_lock(&c->umount_mutex);
 	err = mount_ubifs(c);
diff --git a/fs/ubifs/ubifs-media.h b/fs/ubifs/ubifs-media.h
index e8c23c9d4f4a..d4689c7e9df5 100644
--- a/fs/ubifs/ubifs-media.h
+++ b/fs/ubifs/ubifs-media.h
@@ -525,7 +525,8 @@ struct ubifs_ino_node {
 	__u8 padding1[4]; /* Watch 'zero_ino_node_unused()' if changing! */
 	__le32 xattr_names;
 	__le16 compr_type;
-	__u8 padding2[26]; /* Watch 'zero_ino_node_unused()' if changing! */
+	__le64 iversion;
+	__u8 padding2[18]; /* Watch 'zero_ino_node_unused()' if changing! */
 	__u8 data[];
 } __packed;
 
-- 
2.11.0
