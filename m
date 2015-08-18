Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRYnG-0002ch-QF
 for linux-mtd@lists.infradead.org; Tue, 18 Aug 2015 04:46:39 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <dedekind1@gmail.com>, <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, Dongsheng Yang
 <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v5] ubifs: introduce UBIFS_ATIME_SUPPORT to ubifs
Date: Tue, 18 Aug 2015 12:40:25 +0800
Message-ID: <1439872825-4988-1-git-send-email-yangds.fnst@cn.fujitsu.com>
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

To make ubifs support atime flexily, this commit introduces
a Kconfig option named as UBIFS_ATIME_SUPPORT.

With UBIFS_ATIME_SUPPORT=n:
	ubifs keeps the full compatibility to no_atime from
the start of ubifs.
=================UBIFS_ATIME_SUPPORT=n=======================
-o - no atime
-o atime - no atime
-o noatime - no atime
-o relatime - no atime
-o strictatime - no atime
-o lazyatime - no atime

With UBIFS_ATIME_SUPPORT=y:
	ubifs supports the atime same with other main stream
file systems.
=================UBIFS_ATIME_SUPPORT=y=======================
-o - default behavior (relatime currently)
-o atime - atime support
-o noatime - no atime support
-o relatime - relative atime support
-o strictatime - strict atime support
-o lazyatime - lazy atime support

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
	-v2:
		implement update_time for ubifs
	-v3:
		Oops, forgot to assign update_time for
		ubifs_dir_inode_operations.
	-v4:
		drop the patch to change 'Y' to 'N' in
		Kconfig
	-v5:
		simplify the warning in atime supporting
 fs/ubifs/Kconfig | 11 +++++++++++
 fs/ubifs/dir.c   |  3 +++
 fs/ubifs/file.c  | 50 ++++++++++++++++++++++++++++++++++++++++++++++++++
 fs/ubifs/super.c | 12 ++++++++++--
 fs/ubifs/ubifs.h |  1 +
 5 files changed, 75 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/Kconfig b/fs/ubifs/Kconfig
index ba66d50..2eaae3e 100644
--- a/fs/ubifs/Kconfig
+++ b/fs/ubifs/Kconfig
@@ -35,3 +35,14 @@ config UBIFS_FS_ZLIB
 	default y
 	help
 	  Zlib compresses better than LZO but it is slower. Say 'Y' if unsure.
+
+config UBIFS_ATIME_SUPPORT
+	bool "Access time support" if UBIFS_FS
+	depends on UBIFS_FS
+	default n
+	help
+	  This option allows ubifs to support atime. -o strictatime is harmful to
+	  your flash, we don't suggest it. But relatime and lazytime are much
+	  better.
+
+	  If unsure, say 'N'
diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 27060fc..8d93427 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -1187,6 +1187,9 @@ const struct inode_operations ubifs_dir_inode_operations = {
 	.getxattr    = ubifs_getxattr,
 	.listxattr   = ubifs_listxattr,
 	.removexattr = ubifs_removexattr,
+#ifdef CONFIG_UBIFS_ATIME_SUPPORT
+	.update_time = ubifs_update_time,
+#endif
 };
 
 const struct file_operations ubifs_dir_operations = {
diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 35efc10..554d7b9 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1364,6 +1364,47 @@ static inline int mctime_update_needed(const struct inode *inode,
 }
 
 /**
+ * ubifs_update_time - update time of inode.
+ * @inode: inode to update
+ *
+ * This function updates time of the inode.
+ */
+int ubifs_update_time(struct inode *inode, struct timespec *time,
+			     int flags)
+{
+	struct ubifs_inode *ui = ubifs_inode(inode);
+	struct ubifs_info *c = inode->i_sb->s_fs_info;
+	struct ubifs_budget_req req = { .dirtied_ino = 1,
+			.dirtied_ino_d = ALIGN(ui->data_len, 8) };
+	int iflags = I_DIRTY_TIME;
+	int err, release;
+
+	err = ubifs_budget_space(c, &req);
+	if (err)
+		return err;
+
+	mutex_lock(&ui->ui_mutex);
+	if (flags & S_ATIME)
+		inode->i_atime = *time;
+	if (flags & S_VERSION)
+		inode_inc_iversion(inode);
+	if (flags & S_CTIME)
+		inode->i_ctime = *time;
+	if (flags & S_MTIME)
+		inode->i_mtime = *time;
+
+	if (!(inode->i_sb->s_flags & MS_LAZYTIME) || (flags & S_VERSION))
+		iflags |= I_DIRTY_SYNC;
+
+	release = ui->dirty;
+	__mark_inode_dirty(inode, iflags);
+	mutex_unlock(&ui->ui_mutex);
+	if (release)
+		ubifs_release_budget(c, &req);
+	return 0;
+}
+
+/**
  * update_ctime - update mtime and ctime of an inode.
  * @inode: inode to update
  *
@@ -1546,6 +1587,9 @@ static int ubifs_file_mmap(struct file *file, struct vm_area_struct *vma)
 	if (err)
 		return err;
 	vma->vm_ops = &ubifs_file_vm_ops;
+#ifdef CONFIG_UBIFS_ATIME_SUPPORT
+	file_accessed(file);
+#endif
 	return 0;
 }
 
@@ -1566,6 +1610,9 @@ const struct inode_operations ubifs_file_inode_operations = {
 	.getxattr    = ubifs_getxattr,
 	.listxattr   = ubifs_listxattr,
 	.removexattr = ubifs_removexattr,
+#ifdef CONFIG_UBIFS_ATIME_SUPPORT
+	.update_time = ubifs_update_time,
+#endif
 };
 
 const struct inode_operations ubifs_symlink_inode_operations = {
@@ -1577,6 +1624,9 @@ const struct inode_operations ubifs_symlink_inode_operations = {
 	.getxattr    = ubifs_getxattr,
 	.listxattr   = ubifs_listxattr,
 	.removexattr = ubifs_removexattr,
+#ifdef CONFIG_UBIFS_ATIME_SUPPORT
+	.update_time = ubifs_update_time,
+#endif
 };
 
 const struct file_operations ubifs_file_operations = {
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 75e6f04..ab9e9b3 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -128,7 +128,10 @@ struct inode *ubifs_iget(struct super_block *sb, unsigned long inum)
 	if (err)
 		goto out_ino;
 
-	inode->i_flags |= (S_NOCMTIME | S_NOATIME);
+	inode->i_flags |= S_NOCMTIME;
+#ifndef CONFIG_UBIFS_ATIME_SUPPORT
+	inode->i_flags |= S_NOATIME;
+#endif
 	set_nlink(inode, le32_to_cpu(ino->nlink));
 	i_uid_write(inode, le32_to_cpu(ino->uid));
 	i_gid_write(inode, le32_to_cpu(ino->gid));
@@ -2138,7 +2141,12 @@ static struct dentry *ubifs_mount(struct file_system_type *fs_type, int flags,
 		if (err)
 			goto out_deact;
 		/* We do not support atime */
-		sb->s_flags |= MS_ACTIVE | MS_NOATIME;
+		sb->s_flags |= MS_ACTIVE;
+#ifndef CONFIG_UBIFS_ATIME_SUPPORT
+		sb->s_flags |= MS_NOATIME;
+#else
+		ubifs_warn(c, "full atime support is enabled, which may wear out your flash faster");
+#endif
 	}
 
 	/* 'fill_super()' opens ubi again so we must close it here */
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index de75902..216ba87 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1746,6 +1746,7 @@ int ubifs_calc_dark(const struct ubifs_info *c, int spc);
 /* file.c */
 int ubifs_fsync(struct file *file, loff_t start, loff_t end, int datasync);
 int ubifs_setattr(struct dentry *dentry, struct iattr *attr);
+int ubifs_update_time(struct inode *inode, struct timespec *time, int flags);
 
 /* dir.c */
 struct inode *ubifs_new_inode(struct ubifs_info *c, const struct inode *dir,
-- 
1.8.4.2
