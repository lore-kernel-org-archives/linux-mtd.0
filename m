Received: from mx1.redhat.com ([209.132.183.28])
 by merlin.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1atefI-0004HA-9z
 for linux-mtd@lists.infradead.org; Fri, 22 Apr 2016 17:14:53 +0000
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Richard Weinberger <richard@nod.at>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>
Cc: Andreas Gruenbacher <agruenba@redhat.com>, linux-mtd@lists.infradead.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org
Subject: [PATCH] ubifs: Switch to generic xattr handlers
Date: Fri, 22 Apr 2016 19:14:00 +0200
Message-Id: <1461345240-24117-1-git-send-email-agruenba@redhat.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

could you please review the following change which depends on the work.xattr
branch of vfs.git:

  https://git.kernel.org/cgit/linux/kernel/git/viro/vfs.git/log/?h=work.xattr

I will send the change on to Al once it has been reviewed.

Thanks,
Andreas

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/ubifs/dir.c   |   6 +--
 fs/ubifs/file.c  |  12 ++---
 fs/ubifs/super.c |   1 +
 fs/ubifs/ubifs.h |   7 +--
 fs/ubifs/xattr.c | 143 ++++++++++++++++++++++++++-----------------------------
 5 files changed, 79 insertions(+), 90 deletions(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 795992a..4d07d15 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -1182,10 +1182,10 @@ const struct inode_operations ubifs_dir_inode_operations = {
 	.rename      = ubifs_rename,
 	.setattr     = ubifs_setattr,
 	.getattr     = ubifs_getattr,
-	.setxattr    = ubifs_setxattr,
-	.getxattr    = ubifs_getxattr,
+	.setxattr    = generic_setxattr,
+	.getxattr    = generic_getxattr,
 	.listxattr   = ubifs_listxattr,
-	.removexattr = ubifs_removexattr,
+	.removexattr = generic_removexattr,
 #ifdef CONFIG_UBIFS_ATIME_SUPPORT
 	.update_time = ubifs_update_time,
 #endif
diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 065c88f..e149437 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1597,10 +1597,10 @@ const struct address_space_operations ubifs_file_address_operations = {
 const struct inode_operations ubifs_file_inode_operations = {
 	.setattr     = ubifs_setattr,
 	.getattr     = ubifs_getattr,
-	.setxattr    = ubifs_setxattr,
-	.getxattr    = ubifs_getxattr,
+	.setxattr    = generic_setxattr,
+	.getxattr    = generic_getxattr,
 	.listxattr   = ubifs_listxattr,
-	.removexattr = ubifs_removexattr,
+	.removexattr = generic_removexattr,
 #ifdef CONFIG_UBIFS_ATIME_SUPPORT
 	.update_time = ubifs_update_time,
 #endif
@@ -1611,10 +1611,10 @@ const struct inode_operations ubifs_symlink_inode_operations = {
 	.get_link    = simple_get_link,
 	.setattr     = ubifs_setattr,
 	.getattr     = ubifs_getattr,
-	.setxattr    = ubifs_setxattr,
-	.getxattr    = ubifs_getxattr,
+	.setxattr    = generic_setxattr,
+	.getxattr    = generic_getxattr,
 	.listxattr   = ubifs_listxattr,
-	.removexattr = ubifs_removexattr,
+	.removexattr = generic_removexattr,
 #ifdef CONFIG_UBIFS_ATIME_SUPPORT
 	.update_time = ubifs_update_time,
 #endif
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index a233ba9..f72f642 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -2040,6 +2040,7 @@ static int ubifs_fill_super(struct super_block *sb, void *data, int silent)
 	if (c->max_inode_sz > MAX_LFS_FILESIZE)
 		sb->s_maxbytes = c->max_inode_sz = MAX_LFS_FILESIZE;
 	sb->s_op = &ubifs_super_operations;
+	sb->s_xattr = ubifs_xattr_handlers;
 
 	mutex_lock(&c->umount_mutex);
 	err = mount_ubifs(c);
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 536fb49..05d9fe7 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -37,6 +37,7 @@
 #include <linux/pagemap.h>
 #include <linux/backing-dev.h>
 #include <linux/security.h>
+#include <linux/xattr.h>
 #include "ubifs-media.h"
 
 /* Version of this UBIFS implementation */
@@ -1732,12 +1733,8 @@ int ubifs_getattr(struct vfsmount *mnt, struct dentry *dentry,
 		  struct kstat *stat);
 
 /* xattr.c */
-int ubifs_setxattr(struct dentry *dentry, const char *name,
-		   const void *value, size_t size, int flags);
-ssize_t ubifs_getxattr(struct dentry *dentry, struct inode *host,
-		       const char *name, void *buf, size_t size);
+extern const struct xattr_handler *ubifs_xattr_handlers[];
 ssize_t ubifs_listxattr(struct dentry *dentry, char *buffer, size_t size);
-int ubifs_removexattr(struct dentry *dentry, const char *name);
 int ubifs_init_security(struct inode *dentry, struct inode *inode,
 			const struct qstr *qstr);
 
diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index 413d650..6c277eb 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -249,42 +249,6 @@ out_free:
 	return err;
 }
 
-/**
- * check_namespace - check extended attribute name-space.
- * @nm: extended attribute name
- *
- * This function makes sure the extended attribute name belongs to one of the
- * supported extended attribute name-spaces. Returns name-space index in case
- * of success and a negative error code in case of failure.
- */
-static int check_namespace(const struct qstr *nm)
-{
-	int type;
-
-	if (nm->len > UBIFS_MAX_NLEN)
-		return -ENAMETOOLONG;
-
-	if (!strncmp(nm->name, XATTR_TRUSTED_PREFIX,
-		     XATTR_TRUSTED_PREFIX_LEN)) {
-		if (nm->name[XATTR_TRUSTED_PREFIX_LEN] == '\0')
-			return -EINVAL;
-		type = TRUSTED_XATTR;
-	} else if (!strncmp(nm->name, XATTR_USER_PREFIX,
-				      XATTR_USER_PREFIX_LEN)) {
-		if (nm->name[XATTR_USER_PREFIX_LEN] == '\0')
-			return -EINVAL;
-		type = USER_XATTR;
-	} else if (!strncmp(nm->name, XATTR_SECURITY_PREFIX,
-				     XATTR_SECURITY_PREFIX_LEN)) {
-		if (nm->name[XATTR_SECURITY_PREFIX_LEN] == '\0')
-			return -EINVAL;
-		type = SECURITY_XATTR;
-	} else
-		return -EOPNOTSUPP;
-
-	return type;
-}
-
 static struct inode *iget_xattr(struct ubifs_info *c, ino_t inum)
 {
 	struct inode *inode;
@@ -302,24 +266,23 @@ static struct inode *iget_xattr(struct ubifs_info *c, ino_t inum)
 	return ERR_PTR(-EINVAL);
 }
 
-static int setxattr(struct inode *host, const char *name, const void *value,
-		    size_t size, int flags)
+static int __ubifs_setxattr(struct inode *host, const char *name,
+			    const void *value, size_t size, int flags)
 {
 	struct inode *inode;
 	struct ubifs_info *c = host->i_sb->s_fs_info;
 	struct qstr nm = QSTR_INIT(name, strlen(name));
 	struct ubifs_dent_node *xent;
 	union ubifs_key key;
-	int err, type;
+	int err;
 
 	ubifs_assert(inode_is_locked(host));
 
 	if (size > UBIFS_MAX_INO_DATA)
 		return -ERANGE;
 
-	type = check_namespace(&nm);
-	if (type < 0)
-		return type;
+	if (nm.len > UBIFS_MAX_NLEN)
+		return -ENAMETOOLONG;
 
 	xent = kmalloc(UBIFS_MAX_XENT_NODE_SZ, GFP_NOFS);
 	if (!xent)
@@ -363,17 +326,8 @@ out_free:
 	return err;
 }
 
-int ubifs_setxattr(struct dentry *dentry, const char *name,
-		   const void *value, size_t size, int flags)
-{
-	dbg_gen("xattr '%s', host ino %lu ('%pd'), size %zd",
-		name, d_inode(dentry)->i_ino, dentry, size);
-
-	return setxattr(d_inode(dentry), name, value, size, flags);
-}
-
-ssize_t ubifs_getxattr(struct dentry *dentry, struct inode *host,
-		       const char *name, void *buf, size_t size)
+static ssize_t __ubifs_getxattr(struct inode *host, const char *name,
+				void *buf, size_t size)
 {
 	struct inode *inode;
 	struct ubifs_info *c = host->i_sb->s_fs_info;
@@ -383,12 +337,8 @@ ssize_t ubifs_getxattr(struct dentry *dentry, struct inode *host,
 	union ubifs_key key;
 	int err;
 
-	dbg_gen("xattr '%s', ino %lu ('%pd'), buf size %zd", name,
-		host->i_ino, dentry, size);
-
-	err = check_namespace(&nm);
-	if (err < 0)
-		return err;
+	if (nm.len > UBIFS_MAX_NLEN)
+		return -ENAMETOOLONG;
 
 	xent = kmalloc(UBIFS_MAX_XENT_NODE_SZ, GFP_NOFS);
 	if (!xent)
@@ -460,8 +410,6 @@ ssize_t ubifs_listxattr(struct dentry *dentry, char *buffer, size_t size)
 
 	lowest_xent_key(c, &key, host->i_ino);
 	while (1) {
-		int type;
-
 		xent = ubifs_tnc_next_ent(c, &key, &nm);
 		if (IS_ERR(xent)) {
 			err = PTR_ERR(xent);
@@ -471,14 +419,10 @@ ssize_t ubifs_listxattr(struct dentry *dentry, char *buffer, size_t size)
 		nm.name = xent->name;
 		nm.len = le16_to_cpu(xent->nlen);
 
-		type = check_namespace(&nm);
-		if (unlikely(type < 0)) {
-			err = type;
-			break;
-		}
-
 		/* Show trusted namespace only for "power" users */
-		if (type != TRUSTED_XATTR || capable(CAP_SYS_ADMIN)) {
+		if (strncmp(xent->name, XATTR_TRUSTED_PREFIX,
+			    XATTR_TRUSTED_PREFIX_LEN) ||
+		    capable(CAP_SYS_ADMIN)) {
 			memcpy(buffer + written, nm.name, nm.len + 1);
 			written += nm.len + 1;
 		}
@@ -538,22 +482,19 @@ out_cancel:
 	return err;
 }
 
-int ubifs_removexattr(struct dentry *dentry, const char *name)
+static int __ubifs_removexattr(struct inode *host, const char *name)
 {
-	struct inode *inode, *host = d_inode(dentry);
+	struct inode *inode;
 	struct ubifs_info *c = host->i_sb->s_fs_info;
 	struct qstr nm = QSTR_INIT(name, strlen(name));
 	struct ubifs_dent_node *xent;
 	union ubifs_key key;
 	int err;
 
-	dbg_gen("xattr '%s', ino %lu ('%pd')", name,
-		host->i_ino, dentry);
 	ubifs_assert(inode_is_locked(host));
 
-	err = check_namespace(&nm);
-	if (err < 0)
-		return err;
+	if (nm.len > UBIFS_MAX_NLEN)
+		return -ENAMETOOLONG;
 
 	xent = kmalloc(UBIFS_MAX_XENT_NODE_SZ, GFP_NOFS);
 	if (!xent)
@@ -603,7 +544,7 @@ static int init_xattrs(struct inode *inode, const struct xattr *xattr_array,
 		}
 		strcpy(name, XATTR_SECURITY_PREFIX);
 		strcpy(name + XATTR_SECURITY_PREFIX_LEN, xattr->name);
-		err = setxattr(inode, name, xattr->value, xattr->value_len, 0);
+		err = __ubifs_setxattr(inode, name, xattr->value, xattr->value_len, 0);
 		kfree(name);
 		if (err < 0)
 			break;
@@ -626,3 +567,53 @@ int ubifs_init_security(struct inode *dentry, struct inode *inode,
 	}
 	return err;
 }
+
+static int ubifs_xattr_get(const struct xattr_handler *handler,
+			   struct dentry *dentry, struct inode *inode,
+			   const char *name, void *buffer, size_t size)
+{
+	dbg_gen("xattr '%s', ino %lu ('%pd'), buf size %zd", name,
+		inode->i_ino, dentry, size);
+
+	return  __ubifs_getxattr(inode, name, buffer, size);
+}
+
+static int ubifs_xattr_set(const struct xattr_handler *handler,
+			   struct dentry *dentry, const char *name,
+			   const void *value, size_t size, int flags)
+{
+	struct inode *inode = d_inode(dentry);
+
+	dbg_gen("xattr '%s', host ino %lu ('%pd'), size %zd",
+		name, inode->i_ino, dentry, size);
+
+	if (value)
+		return __ubifs_setxattr(inode, name, value, size, flags);
+	else
+		return __ubifs_removexattr(inode, name);
+}
+
+const struct xattr_handler ubifs_user_xattr_handler = {
+	.prefix = XATTR_USER_PREFIX,
+	.get = ubifs_xattr_get,
+	.set = ubifs_xattr_set,
+};
+
+const struct xattr_handler ubifs_trusted_xattr_handler = {
+	.prefix = XATTR_TRUSTED_PREFIX,
+	.get = ubifs_xattr_get,
+	.set = ubifs_xattr_set,
+};
+
+const struct xattr_handler ubifs_security_xattr_handler = {
+	.prefix = XATTR_SECURITY_PREFIX,
+	.get = ubifs_xattr_get,
+	.set = ubifs_xattr_set,
+};
+
+const struct xattr_handler *ubifs_xattr_handlers[] = {
+	&ubifs_user_xattr_handler,
+	&ubifs_trusted_xattr_handler,
+	&ubifs_security_xattr_handler,
+	NULL
+};
-- 
2.5.5
