Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bAsAJ-0006lk-DI
 for linux-mtd@lists.infradead.org; Thu, 09 Jun 2016 05:06:00 +0000
Received: by mail-pf0-x241.google.com with SMTP id 66so202121pfy.1
 for <linux-mtd@lists.infradead.org>; Wed, 08 Jun 2016 22:05:40 -0700 (PDT)
From: Deepa Dinamani <deepa.kernel@gmail.com>
To: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>,
 Al Viro <viro@zeniv.linux.org.uk>,
 Linus Torvalds <torvalds@linux-foundation.org>, y2038@lists.linaro.org,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 03/21] fs: ubifs: Use current_fs_time() for inode timestamps
Date: Wed,  8 Jun 2016 22:04:47 -0700
Message-Id: <1465448705-25055-4-git-send-email-deepa.kernel@gmail.com>
In-Reply-To: <1465448705-25055-1-git-send-email-deepa.kernel@gmail.com>
References: <1465448705-25055-1-git-send-email-deepa.kernel@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

CURRENT_TIME_SEC is not y2038 safe. current_fs_time() will
be transitioned to use 64 bit time along with vfs in a
separate patch.
There is no plan to transition CURRENT_TIME_SEC to use
y2038 safe time interfaces.

current_fs_time() returns timestamps according to the
granularities set in the super_block.
The granularity check to call current_fs_time() or
CURRENT_TIME_SEC is not required.
Use current_fs_time() to obtain timestamps
unconditionally.

Signed-off-by: Deepa Dinamani <deepa.kernel@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mtd@lists.infradead.org
---
 fs/ubifs/dir.c   | 10 +++++-----
 fs/ubifs/file.c  | 12 ++++++------
 fs/ubifs/ioctl.c |  2 +-
 fs/ubifs/misc.h  | 10 ----------
 fs/ubifs/sb.c    | 18 ++++++++++++++----
 fs/ubifs/xattr.c |  6 +++---
 6 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 4b86d3a..2dede0f 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -106,7 +106,7 @@ struct inode *ubifs_new_inode(struct ubifs_info *c, const struct inode *dir,
 
 	inode_init_owner(inode, dir, mode);
 	inode->i_mtime = inode->i_atime = inode->i_ctime =
-			 ubifs_current_time(inode);
+			 current_fs_time(inode->i_sb);
 	inode->i_mapping->nrpages = 0;
 
 	switch (mode & S_IFMT) {
@@ -529,7 +529,7 @@ static int ubifs_link(struct dentry *old_dentry, struct inode *dir,
 	lock_2_inodes(dir, inode);
 	inc_nlink(inode);
 	ihold(inode);
-	inode->i_ctime = ubifs_current_time(inode);
+	inode->i_ctime = current_fs_time(inode->i_sb);
 	dir->i_size += sz_change;
 	dir_ui->ui_size = dir->i_size;
 	dir->i_mtime = dir->i_ctime = inode->i_ctime;
@@ -586,7 +586,7 @@ static int ubifs_unlink(struct inode *dir, struct dentry *dentry)
 	}
 
 	lock_2_inodes(dir, inode);
-	inode->i_ctime = ubifs_current_time(dir);
+	inode->i_ctime = current_fs_time(dir->i_sb);
 	drop_nlink(inode);
 	dir->i_size -= sz_change;
 	dir_ui->ui_size = dir->i_size;
@@ -675,7 +675,7 @@ static int ubifs_rmdir(struct inode *dir, struct dentry *dentry)
 	}
 
 	lock_2_inodes(dir, inode);
-	inode->i_ctime = ubifs_current_time(dir);
+	inode->i_ctime = current_fs_time(dir->i_sb);
 	clear_nlink(inode);
 	drop_nlink(dir);
 	dir->i_size -= sz_change;
@@ -1023,7 +1023,7 @@ static int ubifs_rename(struct inode *old_dir, struct dentry *old_dentry,
 	 * Like most other Unix systems, set the @i_ctime for inodes on a
 	 * rename.
 	 */
-	time = ubifs_current_time(old_dir);
+	time = current_fs_time(old_dir->i_sb);
 	old_inode->i_ctime = time;
 
 	/* We must adjust parent link count when renaming directories */
diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 0831697..01c46e0 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1181,7 +1181,7 @@ static int do_truncation(struct ubifs_info *c, struct inode *inode,
 	mutex_lock(&ui->ui_mutex);
 	ui->ui_size = inode->i_size;
 	/* Truncation changes inode [mc]time */
-	inode->i_mtime = inode->i_ctime = ubifs_current_time(inode);
+	inode->i_mtime = inode->i_ctime = current_fs_time(inode->i_sb);
 	/* Other attributes may be changed at the same time as well */
 	do_attr_changes(inode, attr);
 	err = ubifs_jnl_truncate(c, inode, old_size, new_size);
@@ -1228,7 +1228,7 @@ static int do_setattr(struct ubifs_info *c, struct inode *inode,
 	mutex_lock(&ui->ui_mutex);
 	if (attr->ia_valid & ATTR_SIZE) {
 		/* Truncation changes inode [mc]time */
-		inode->i_mtime = inode->i_ctime = ubifs_current_time(inode);
+		inode->i_mtime = inode->i_ctime = current_fs_time(inode->i_sb);
 		/* 'truncate_setsize()' changed @i_size, update @ui_size */
 		ui->ui_size = inode->i_size;
 	}
@@ -1405,7 +1405,7 @@ int ubifs_update_time(struct inode *inode, struct timespec *time,
  */
 static int update_mctime(struct inode *inode)
 {
-	struct timespec now = ubifs_current_time(inode);
+	struct timespec now = current_fs_time(inode->i_sb);
 	struct ubifs_inode *ui = ubifs_inode(inode);
 	struct ubifs_info *c = inode->i_sb->s_fs_info;
 
@@ -1419,7 +1419,7 @@ static int update_mctime(struct inode *inode)
 			return err;
 
 		mutex_lock(&ui->ui_mutex);
-		inode->i_mtime = inode->i_ctime = ubifs_current_time(inode);
+		inode->i_mtime = inode->i_ctime = current_fs_time(inode->i_sb);
 		release = ui->dirty;
 		mark_inode_dirty_sync(inode);
 		mutex_unlock(&ui->ui_mutex);
@@ -1477,7 +1477,7 @@ static int ubifs_vm_page_mkwrite(struct vm_area_struct *vma,
 	struct page *page = vmf->page;
 	struct inode *inode = file_inode(vma->vm_file);
 	struct ubifs_info *c = inode->i_sb->s_fs_info;
-	struct timespec now = ubifs_current_time(inode);
+	struct timespec now = current_fs_time(inode->i_sb);
 	struct ubifs_budget_req req = { .new_page = 1 };
 	int err, update_time;
 
@@ -1545,7 +1545,7 @@ static int ubifs_vm_page_mkwrite(struct vm_area_struct *vma,
 		struct ubifs_inode *ui = ubifs_inode(inode);
 
 		mutex_lock(&ui->ui_mutex);
-		inode->i_mtime = inode->i_ctime = ubifs_current_time(inode);
+		inode->i_mtime = inode->i_ctime = current_fs_time(inode->i_sb);
 		release = ui->dirty;
 		mark_inode_dirty_sync(inode);
 		mutex_unlock(&ui->ui_mutex);
diff --git a/fs/ubifs/ioctl.c b/fs/ubifs/ioctl.c
index 3c7b29d..127b2ae 100644
--- a/fs/ubifs/ioctl.c
+++ b/fs/ubifs/ioctl.c
@@ -126,7 +126,7 @@ static int setflags(struct inode *inode, int flags)
 
 	ui->flags = ioctl2ubifs(flags);
 	ubifs_set_inode_flags(inode);
-	inode->i_ctime = ubifs_current_time(inode);
+	inode->i_ctime = current_fs_time(inode->i_sb);
 	release = ui->dirty;
 	mark_inode_dirty_sync(inode);
 	mutex_unlock(&ui->ui_mutex);
diff --git a/fs/ubifs/misc.h b/fs/ubifs/misc.h
index 8ece6ca..caf83d6 100644
--- a/fs/ubifs/misc.h
+++ b/fs/ubifs/misc.h
@@ -225,16 +225,6 @@ static inline void *ubifs_idx_key(const struct ubifs_info *c,
 }
 
 /**
- * ubifs_current_time - round current time to time granularity.
- * @inode: inode
- */
-static inline struct timespec ubifs_current_time(struct inode *inode)
-{
-	return (inode->i_sb->s_time_gran < NSEC_PER_SEC) ?
-		current_fs_time(inode->i_sb) : CURRENT_TIME_SEC;
-}
-
-/**
  * ubifs_tnc_lookup - look up a file-system node.
  * @c: UBIFS file-system description object
  * @key: node key to lookup
diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index 3cbb904..f4f73d2 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -84,6 +84,8 @@ static int create_default_filesystem(struct ubifs_info *c)
 	int min_leb_cnt = UBIFS_MIN_LEB_CNT;
 	long long tmp64, main_bytes;
 	__le64 tmp_le64;
+	__le32 tmp_le32;
+	struct timespec ts;
 
 	/* Some functions called from here depend on the @c->key_len filed */
 	c->key_len = UBIFS_SK_LEN;
@@ -297,13 +299,21 @@ static int create_default_filesystem(struct ubifs_info *c)
 	ino->ch.node_type = UBIFS_INO_NODE;
 	ino->creat_sqnum = cpu_to_le64(++c->max_sqnum);
 	ino->nlink = cpu_to_le32(2);
-	tmp_le64 = cpu_to_le64(CURRENT_TIME_SEC.tv_sec);
+
+	/* Initialize the super_block properties needed by
+	 * current_fs_time().
+	 */
+	c->vfs_sb->s_time_gran = DEFAULT_TIME_GRAN;
+
+	ts = current_fs_time(c->vfs_sb);
+	tmp_le64 = cpu_to_le64(ts.tv_sec);
 	ino->atime_sec   = tmp_le64;
 	ino->ctime_sec   = tmp_le64;
 	ino->mtime_sec   = tmp_le64;
-	ino->atime_nsec  = 0;
-	ino->ctime_nsec  = 0;
-	ino->mtime_nsec  = 0;
+	tmp_le32 = cpu_to_le32(ts.tv_nsec);
+	ino->atime_nsec  = tmp_le32;
+	ino->ctime_nsec  = tmp_le32;
+	ino->mtime_nsec  = tmp_le32;
 	ino->mode = cpu_to_le32(S_IFDIR | S_IRUGO | S_IWUSR | S_IXUGO);
 	ino->size = cpu_to_le64(UBIFS_INO_NODE_SZ);
 
diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index b5fc279..76a3c49 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -152,7 +152,7 @@ static int create_xattr(struct ubifs_info *c, struct inode *host,
 	ui->data_len = size;
 
 	mutex_lock(&host_ui->ui_mutex);
-	host->i_ctime = ubifs_current_time(host);
+	host->i_ctime = current_fs_time(host->i_sb);
 	host_ui->xattr_cnt += 1;
 	host_ui->xattr_size += CALC_DENT_SIZE(nm->len);
 	host_ui->xattr_size += CALC_XATTR_BYTES(size);
@@ -221,7 +221,7 @@ static int change_xattr(struct ubifs_info *c, struct inode *host,
 	mutex_unlock(&ui->ui_mutex);
 
 	mutex_lock(&host_ui->ui_mutex);
-	host->i_ctime = ubifs_current_time(host);
+	host->i_ctime = current_fs_time(host->i_sb);
 	host_ui->xattr_size -= CALC_XATTR_BYTES(ui->data_len);
 	host_ui->xattr_size += CALC_XATTR_BYTES(size);
 
@@ -458,7 +458,7 @@ static int remove_xattr(struct ubifs_info *c, struct inode *host,
 		return err;
 
 	mutex_lock(&host_ui->ui_mutex);
-	host->i_ctime = ubifs_current_time(host);
+	host->i_ctime = current_fs_time(host->i_sb);
 	host_ui->xattr_cnt -= 1;
 	host_ui->xattr_size -= CALC_DENT_SIZE(nm->len);
 	host_ui->xattr_size -= CALC_XATTR_BYTES(ui->data_len);
-- 
1.9.1
