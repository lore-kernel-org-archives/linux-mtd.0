Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZuvVR-0004L4-9Y
 for linux-mtd@lists.infradead.org; Sat, 07 Nov 2015 04:53:39 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <richard@nod.at>, <dedekind1@gmail.com>
CC: <linux-mtd@lists.infradead.org>, Dongsheng Yang
 <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v7] ubifs: introduce UBIFS_ATIME_SUPPORT to ubifs
Date: Sat, 7 Nov 2015 12:46:11 +0800
Message-ID: <1446871571-21486-1-git-send-email-yangds.fnst@cn.fujitsu.com>
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
Reviewed-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/Kconfig | 15 +++++++++++++++
 fs/ubifs/dir.c   |  3 +++
 fs/ubifs/file.c  | 50 ++++++++++++++++++++++++++++++++++++++++++++++++++
 fs/ubifs/super.c | 12 ++++++++++--
 fs/ubifs/ubifs.h |  3 +++
 5 files changed, 81 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/Kconfig b/fs/ubifs/Kconfig
index ba66d50..7ff7712 100644
--- a/fs/ubifs/Kconfig
+++ b/fs/ubifs/Kconfig
@@ -35,3 +35,18 @@ config UBIFS_FS_ZLIB
 	default y
 	help
 	  Zlib compresses better than LZO but it is slower. Say 'Y' if unsure.
+
+config UBIFS_ATIME_SUPPORT
+	bool "Access time support" if UBIFS_FS
+	depends on UBIFS_FS
+	default n
+	help
+	  Originally UBIFS did not support atime, because it looked like a bad idea due
+	  increased flash wear. This option adds atime support and it is disabled by default
+	  to preserve the old behavior. If you enable this option, UBIFS starts updating atime,
+	  which means that file-system read operations will cause writes (inode atime
+	  updates). This may affect file-system performance and increase flash device wear,
+	  so be careful. How often atime is updated depends on the selected strategy:
+	  strictatime is the "heavy", relatime is "lighter", etc.
+
+	  If unsure, say 'N'
diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 5c27c66..a822148 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -1188,6 +1188,9 @@ const struct inode_operations ubifs_dir_inode_operations = {
 	.getxattr    = ubifs_getxattr,
 	.listxattr   = ubifs_listxattr,
 	.removexattr = ubifs_removexattr,
+#ifdef CONFIG_UBIFS_ATIME_SUPPORT
+	.update_time = ubifs_update_time,
+#endif
 };
 
 const struct file_operations ubifs_dir_operations = {
diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index a3dfe2a..0edc128 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1354,6 +1354,47 @@ static inline int mctime_update_needed(const struct inode *inode,
 	return 0;
 }
 
+#ifdef CONFIG_UBIFS_ATIME_SUPPORT
+/**
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
+	if (flags & S_CTIME)
+		inode->i_ctime = *time;
+	if (flags & S_MTIME)
+		inode->i_mtime = *time;
+
+	if (!(inode->i_sb->s_flags & MS_LAZYTIME))
+		iflags |= I_DIRTY_SYNC;
+
+	release = ui->dirty;
+	__mark_inode_dirty(inode, iflags);
+	mutex_unlock(&ui->ui_mutex);
+	if (release)
+		ubifs_release_budget(c, &req);
+	return 0;
+}
+#endif
+
 /**
  * update_ctime - update mtime and ctime of an inode.
  * @inode: inode to update
@@ -1537,6 +1578,9 @@ static int ubifs_file_mmap(struct file *file, struct vm_area_struct *vma)
 	if (err)
 		return err;
 	vma->vm_ops = &ubifs_file_vm_ops;
+#ifdef CONFIG_UBIFS_ATIME_SUPPORT
+	file_accessed(file);
+#endif
 	return 0;
 }
 
@@ -1557,6 +1601,9 @@ const struct inode_operations ubifs_file_inode_operations = {
 	.getxattr    = ubifs_getxattr,
 	.listxattr   = ubifs_listxattr,
 	.removexattr = ubifs_removexattr,
+#ifdef CONFIG_UBIFS_ATIME_SUPPORT
+	.update_time = ubifs_update_time,
+#endif
 };
 
 const struct inode_operations ubifs_symlink_inode_operations = {
@@ -1568,6 +1615,9 @@ const struct inode_operations ubifs_symlink_inode_operations = {
 	.getxattr    = ubifs_getxattr,
 	.listxattr   = ubifs_listxattr,
 	.removexattr = ubifs_removexattr,
+#ifdef CONFIG_UBIFS_ATIME_SUPPORT
+	.update_time = ubifs_update_time,
+#endif
 };
 
 const struct file_operations ubifs_file_operations = {
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 9547a278..8ee3133 100644
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
@@ -2139,7 +2142,12 @@ static struct dentry *ubifs_mount(struct file_system_type *fs_type, int flags,
 		if (err)
 			goto out_deact;
 		/* We do not support atime */
-		sb->s_flags |= MS_ACTIVE | MS_NOATIME;
+		sb->s_flags |= MS_ACTIVE;
+#ifndef CONFIG_UBIFS_ATIME_SUPPORT
+		sb->s_flags |= MS_NOATIME;
+#else
+		ubifs_msg(c, "full atime support is enabled.");
+#endif
 	}
 
 	/* 'fill_super()' opens ubi again so we must close it here */
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index de75902..7e1f1f3 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1746,6 +1746,9 @@ int ubifs_calc_dark(const struct ubifs_info *c, int spc);
 /* file.c */
 int ubifs_fsync(struct file *file, loff_t start, loff_t end, int datasync);
 int ubifs_setattr(struct dentry *dentry, struct iattr *attr);
+#ifdef CONFIG_UBIFS_ATIME_SUPPORT
+int ubifs_update_time(struct inode *inode, struct timespec *time, int flags);
+#endif
 
 /* dir.c */
 struct inode *ubifs_new_inode(struct ubifs_info *c, const struct inode *dir,
-- 
1.8.4.2
