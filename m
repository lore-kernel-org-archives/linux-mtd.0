Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZH5hC-0002Gz-5U
 for linux-mtd@lists.infradead.org; Mon, 20 Jul 2015 07:41:07 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <richard.weinberger@gmail.com>, <dedekind1@gmail.com>
CC: <linux-mtd@lists.infradead.org>, Dongsheng Yang
 <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v2] ubifs: introduce UBIFS_ATIME_SUPPORT to ubifs
Date: Mon, 20 Jul 2015 15:35:14 +0800
Message-ID: <1437377714-11673-1-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1435728600-14560-2-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1435728600-14560-2-git-send-email-yangds.fnst@cn.fujitsu.com>
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
changelog:
	v1: remove the new version of ubifs_dirty_inode()
which was implemented with a conditional locking.

 fs/ubifs/Kconfig | 11 +++++++++++
 fs/ubifs/file.c  | 50 ++++++++++++++++++++++++++++++++++++++++++++++++++
 fs/ubifs/super.c | 19 ++++++++++++++++---
 3 files changed, 77 insertions(+), 3 deletions(-)

diff --git a/fs/ubifs/Kconfig b/fs/ubifs/Kconfig
index f9aaad1..44474e7 100644
--- a/fs/ubifs/Kconfig
+++ b/fs/ubifs/Kconfig
@@ -35,3 +35,14 @@ config UBIFS_FS_ZLIB
 	default y
 	help
 	  Zlib compresses better than LZO but it is slower. Say 'N' if unsure.
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
diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 35efc10..27de484 100644
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
+static int ubifs_update_time(struct inode *inode, struct timespec *time,
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
index 75e6f04..c643261 100644
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
@@ -380,7 +383,7 @@ done:
 
 static void ubifs_dirty_inode(struct inode *inode, int flags)
 {
-	struct ubifs_inode *ui = ubifs_inode(inode);
+        struct ubifs_inode *ui = ubifs_inode(inode);
 
 	ubifs_assert(mutex_is_locked(&ui->ui_mutex));
 	if (!ui->dirty) {
@@ -2138,7 +2141,17 @@ static struct dentry *ubifs_mount(struct file_system_type *fs_type, int flags,
 		if (err)
 			goto out_deact;
 		/* We do not support atime */
-		sb->s_flags |= MS_ACTIVE | MS_NOATIME;
+		sb->s_flags |= MS_ACTIVE;
+#ifndef CONFIG_UBIFS_ATIME_SUPPORT
+		sb->s_flags |= MS_NOATIME;
+#else
+		ubifs_warn(c, "************WARNING START****************");
+		ubifs_warn(c, "Ubifs is supporting atime now, that would");
+		ubifs_warn(c, "probably damage your flash. If you are not");
+		ubifs_warn(c, "sure about it, please set UBIFS_ATIME_SUPPORT");
+		ubifs_warn(c, "to 'N'.");
+		ubifs_warn(c, "************WARNING END******************");
+#endif
 	}
 
 	/* 'fill_super()' opens ubi again so we must close it here */
-- 
1.8.4.2
