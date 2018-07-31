Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fkUT6-0003ET-UP
 for linux-mtd@lists.infradead.org; Tue, 31 Jul 2018 13:13:42 +0000
From: Stefan Agner <stefan@agner.ch>
To: richard@nod.at,
	dedekind1@gmail.com,
	adrian.hunter@intel.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Stefan Agner <stefan@agner.ch>
Subject: [PATCH] fs: ubifs: introduce Kconfig symbol for xattr support
Date: Tue, 31 Jul 2018 15:13:20 +0200
Message-Id: <20180731131320.21087-1-stefan@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Allow to disable extended attribute support.

This aids in reliability testing, especially since some xattr
related bugs have surfaced.

Also an embedded system might not need it, so this allows for a
slightly smaller kernel (about 4KiB).

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 fs/ubifs/Kconfig  | 15 +++++++++++++--
 fs/ubifs/Makefile |  3 ++-
 fs/ubifs/dir.c    |  2 ++
 fs/ubifs/file.c   |  4 ++++
 fs/ubifs/super.c  |  2 ++
 fs/ubifs/ubifs.h  |  6 ++++++
 6 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/fs/ubifs/Kconfig b/fs/ubifs/Kconfig
index 83a961bf7280..bbc78549be4c 100644
--- a/fs/ubifs/Kconfig
+++ b/fs/ubifs/Kconfig
@@ -51,9 +51,20 @@ config UBIFS_ATIME_SUPPORT
 
 	  If unsure, say 'N'
 
+config UBIFS_FS_XATTR
+	bool "UBIFS XATTR support"
+	depends on UBIFS_FS
+	default y
+	help
+	  Saying Y here includes support for extended attributes (xattrs).
+	  Xattrs are name:value pairs associated with inodes by
+	  the kernel or by users (see the attr(5) manual page).
+
+	  If unsure, say Y.
+
 config UBIFS_FS_ENCRYPTION
 	bool "UBIFS Encryption"
-	depends on UBIFS_FS && BLOCK
+	depends on UBIFS_FS && UBIFS_FS_XATTR && BLOCK
 	select FS_ENCRYPTION
 	default n
 	help
@@ -64,7 +75,7 @@ config UBIFS_FS_ENCRYPTION
 
 config UBIFS_FS_SECURITY
 	bool "UBIFS Security Labels"
-	depends on UBIFS_FS
+	depends on UBIFS_FS && UBIFS_FS_XATTR
 	default y
 	help
 	  Security labels provide an access control facility to support Linux
diff --git a/fs/ubifs/Makefile b/fs/ubifs/Makefile
index 9758f709c736..6197d7e539e4 100644
--- a/fs/ubifs/Makefile
+++ b/fs/ubifs/Makefile
@@ -4,6 +4,7 @@ obj-$(CONFIG_UBIFS_FS) += ubifs.o
 ubifs-y += shrinker.o journal.o file.o dir.o super.o sb.o io.o
 ubifs-y += tnc.o master.o scan.o replay.o log.o commit.o gc.o orphan.o
 ubifs-y += budget.o find.o tnc_commit.o compress.o lpt.o lprops.o
-ubifs-y += recovery.o ioctl.o lpt_commit.o tnc_misc.o xattr.o debug.o
+ubifs-y += recovery.o ioctl.o lpt_commit.o tnc_misc.o debug.o
 ubifs-y += misc.o
 ubifs-$(CONFIG_UBIFS_FS_ENCRYPTION) += crypto.o
+ubifs-$(CONFIG_UBIFS_FS_XATTR) += xattr.o
diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 9da224d4f2da..dc875886f11f 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -1647,7 +1647,9 @@ const struct inode_operations ubifs_dir_inode_operations = {
 	.rename      = ubifs_rename,
 	.setattr     = ubifs_setattr,
 	.getattr     = ubifs_getattr,
+#ifdef CONFIG_UBIFS_FS_XATTR
 	.listxattr   = ubifs_listxattr,
+#endif
 #ifdef CONFIG_UBIFS_ATIME_SUPPORT
 	.update_time = ubifs_update_time,
 #endif
diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index fd7eb6fe9090..b8b3962eb449 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1654,7 +1654,9 @@ const struct address_space_operations ubifs_file_address_operations = {
 const struct inode_operations ubifs_file_inode_operations = {
 	.setattr     = ubifs_setattr,
 	.getattr     = ubifs_getattr,
+#ifdef CONFIG_UBIFS_FS_XATTR
 	.listxattr   = ubifs_listxattr,
+#endif
 #ifdef CONFIG_UBIFS_ATIME_SUPPORT
 	.update_time = ubifs_update_time,
 #endif
@@ -1664,7 +1666,9 @@ const struct inode_operations ubifs_symlink_inode_operations = {
 	.get_link    = ubifs_get_link,
 	.setattr     = ubifs_setattr,
 	.getattr     = ubifs_getattr,
+#ifdef CONFIG_UBIFS_FS_XATTR
 	.listxattr   = ubifs_listxattr,
+#endif
 #ifdef CONFIG_UBIFS_ATIME_SUPPORT
 	.update_time = ubifs_update_time,
 #endif
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index c5466c70d620..564a131afc56 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -2053,7 +2053,9 @@ static int ubifs_fill_super(struct super_block *sb, void *data, int silent)
 	if (c->max_inode_sz > MAX_LFS_FILESIZE)
 		sb->s_maxbytes = c->max_inode_sz = MAX_LFS_FILESIZE;
 	sb->s_op = &ubifs_super_operations;
+#ifdef CONFIG_UBIFS_FS_XATTR
 	sb->s_xattr = ubifs_xattr_handlers;
+#endif
 #ifdef CONFIG_UBIFS_FS_ENCRYPTION
 	sb->s_cop = &ubifs_crypt_operations;
 #endif
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 04bf84d71e7b..6aab759f0f9d 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1755,7 +1755,13 @@ int ubifs_xattr_set(struct inode *host, const char *name, const void *value,
 		    size_t size, int flags, bool check_lock);
 ssize_t ubifs_xattr_get(struct inode *host, const char *name, void *buf,
 			size_t size);
+
+#ifdef CONFIG_UBIFS_FS_XATTR
 void ubifs_evict_xattr_inode(struct ubifs_info *c, ino_t xattr_inum);
+#else
+static inline void ubifs_evict_xattr_inode(struct ubifs_info *c,
+					   ino_t xattr_inum) { }
+#endif
 
 #ifdef CONFIG_UBIFS_FS_SECURITY
 extern int ubifs_init_security(struct inode *dentry, struct inode *inode,
-- 
2.18.0
