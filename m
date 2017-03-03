Received: from lgeamrelo13.lge.com ([156.147.23.53])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cjhtd-0003QF-NQ
 for linux-mtd@lists.infradead.org; Fri, 03 Mar 2017 07:45:04 +0000
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Richard Weinberger <richard@nod.at>
CC: <kernel-team@lge.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 <adrian.hunter@intel.com>, <linux-kernel@vger.kernel.org>,
 <linux-fsdevel@vger.kernel.org>, <linux-mtd@lists.infradead.org>, Hyunchul
 Lee <cheol.lee@lge.com>
Subject: [PATCH] ubifs: add CONFIG_UBIFS_FS_SECURITY to disable/enable
 security labels
Date: Fri, 3 Mar 2017 16:44:03 +0900
Message-ID: <1488527043-7195-1-git-send-email-hyc.lee@gmail.com>
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

From: Hyunchul Lee <cheol.lee@lge.com>

When write syscall is called, every time security label is searched to
determine that file's privileges should be changed.
If LSM(Linux Security Model) is not used, this is useless.

So introduce CONFIG_UBIFS_SECURITY to disable security labels. it's default
value is "y".

Signed-off-by: Hyunchul Lee <cheol.lee@lge.com>
---
 fs/ubifs/Kconfig | 13 +++++++++++++
 fs/ubifs/ubifs.h | 14 ++++++++++++--
 fs/ubifs/xattr.c |  6 ++++++
 3 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/Kconfig b/fs/ubifs/Kconfig
index b0d0623..83a961b 100644
--- a/fs/ubifs/Kconfig
+++ b/fs/ubifs/Kconfig
@@ -61,3 +61,16 @@ config UBIFS_FS_ENCRYPTION
 	  feature is similar to ecryptfs, but it is more memory
 	  efficient since it avoids caching the encrypted and
 	  decrypted pages in the page cache.
+
+config UBIFS_FS_SECURITY
+	bool "UBIFS Security Labels"
+	depends on UBIFS_FS
+	default y
+	help
+	  Security labels provide an access control facility to support Linux
+	  Security Models (LSMs) accepted by AppArmor, SELinux, Smack and TOMOYO
+	  Linux. This option enables an extended attribute handler for file
+	  security labels in the ubifs filesystem, so that it requires enabling
+	  the extended attribute support in advance.
+
+	  If you are not using a security module, say N.
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index ca72382..e960734 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1752,13 +1752,23 @@ int ubifs_getattr(struct vfsmount *mnt, struct dentry *dentry,
 /* xattr.c */
 extern const struct xattr_handler *ubifs_xattr_handlers[];
 ssize_t ubifs_listxattr(struct dentry *dentry, char *buffer, size_t size);
-int ubifs_init_security(struct inode *dentry, struct inode *inode,
-			const struct qstr *qstr);
 int ubifs_xattr_set(struct inode *host, const char *name, const void *value,
 		    size_t size, int flags);
 ssize_t ubifs_xattr_get(struct inode *host, const char *name, void *buf,
 			size_t size);
 
+#ifdef CONFIG_UBIFS_FS_SECURITY
+extern int ubifs_init_security(struct inode *dentry, struct inode *inode,
+			const struct qstr *qstr);
+#else
+static inline int ubifs_init_security(struct inode *dentry,
+			struct inode *inode, const struct qstr *qstr)
+{
+	return 0;
+}
+#endif
+
+
 /* super.c */
 struct inode *ubifs_iget(struct super_block *sb, unsigned long inum);
 
diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index efe00fc..de88732 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -559,6 +559,7 @@ static int ubifs_xattr_remove(struct inode *host, const char *name)
 	return err;
 }
 
+#ifdef CONFIG_UBIFS_FS_SECURITY
 static int init_xattrs(struct inode *inode, const struct xattr *xattr_array,
 		      void *fs_info)
 {
@@ -599,6 +600,7 @@ int ubifs_init_security(struct inode *dentry, struct inode *inode,
 	}
 	return err;
 }
+#endif
 
 static int xattr_get(const struct xattr_handler *handler,
 			   struct dentry *dentry, struct inode *inode,
@@ -639,15 +641,19 @@ static int xattr_set(const struct xattr_handler *handler,
 	.set = xattr_set,
 };
 
+#ifdef CONFIG_UBIFS_FS_SECURITY
 static const struct xattr_handler ubifs_security_xattr_handler = {
 	.prefix = XATTR_SECURITY_PREFIX,
 	.get = xattr_get,
 	.set = xattr_set,
 };
+#endif
 
 const struct xattr_handler *ubifs_xattr_handlers[] = {
 	&ubifs_user_xattr_handler,
 	&ubifs_trusted_xattr_handler,
+#ifdef CONFIG_UBIFS_FS_SECURITY
 	&ubifs_security_xattr_handler,
+#endif
 	NULL
 };
-- 
1.9.1
