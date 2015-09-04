Received: from mail-wi0-x22b.google.com ([2a00:1450:400c:c05::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZXpd1-0000h7-G6
 for linux-mtd@lists.infradead.org; Fri, 04 Sep 2015 11:58:02 +0000
Received: by wicfx3 with SMTP id fx3so15430223wic.0
 for <linux-mtd@lists.infradead.org>; Fri, 04 Sep 2015 04:57:37 -0700 (PDT)
From: Andreas Gruenbacher <andreas.gruenbacher@gmail.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>,
 Eric Van Hensbergen <ericvh@gmail.com>, Ron Minnich <rminnich@sandia.gov>,
 Latchesar Ionkov <lucho@ionkov.net>, v9fs-developer@lists.sourceforge.net
Subject: [PATCH 5/5] xattr handlers: Some simplifications
Date: Fri,  4 Sep 2015 13:57:22 +0200
Message-Id: <1441367842-25079-6-git-send-email-agruenba@redhat.com>
In-Reply-To: <1441367842-25079-1-git-send-email-agruenba@redhat.com>
References: <1441367842-25079-1-git-send-email-agruenba@redhat.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We have access to struct xattr_handler inside the list/get/set operations now,
so simplify some of the xattr code.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/9p/Makefile         |  5 +---
 fs/9p/acl.c            | 51 ++++-----------------------------
 fs/9p/xattr.c          | 42 +++++++++++++++++++++++++++
 fs/9p/xattr.h          |  3 --
 fs/9p/xattr_security.c | 56 ------------------------------------
 fs/9p/xattr_trusted.c  | 56 ------------------------------------
 fs/9p/xattr_user.c     | 56 ------------------------------------
 fs/f2fs/xattr.c        | 18 ++++--------
 fs/posix_acl.c         |  7 +----
 fs/squashfs/xattr.c    | 77 +++++++++++++++++---------------------------------
 10 files changed, 80 insertions(+), 291 deletions(-)
 delete mode 100644 fs/9p/xattr_security.c
 delete mode 100644 fs/9p/xattr_trusted.c
 delete mode 100644 fs/9p/xattr_user.c

diff --git a/fs/9p/Makefile b/fs/9p/Makefile
index ff7be98..9619cca 100644
--- a/fs/9p/Makefile
+++ b/fs/9p/Makefile
@@ -10,10 +10,7 @@ obj-$(CONFIG_9P_FS) := 9p.o
 	vfs_dentry.o \
 	v9fs.o \
 	fid.o  \
-	xattr.o \
-	xattr_user.o \
-	xattr_trusted.o
+	xattr.o
 
 9p-$(CONFIG_9P_FSCACHE) += cache.o
 9p-$(CONFIG_9P_FS_POSIX_ACL) += acl.o
-9p-$(CONFIG_9P_FS_SECURITY) += xattr_security.o
diff --git a/fs/9p/acl.c b/fs/9p/acl.c
index a9e5d72..5325304 100644
--- a/fs/9p/acl.c
+++ b/fs/9p/acl.c
@@ -212,31 +212,12 @@ int v9fs_acl_mode(struct inode *dir, umode_t *modep,
 	return 0;
 }
 
-static int v9fs_remote_get_acl(struct dentry *dentry, const char *name,
-			       void *buffer, size_t size, int type)
-{
-	char *full_name;
-
-	switch (type) {
-	case ACL_TYPE_ACCESS:
-		full_name =  POSIX_ACL_XATTR_ACCESS;
-		break;
-	case ACL_TYPE_DEFAULT:
-		full_name = POSIX_ACL_XATTR_DEFAULT;
-		break;
-	default:
-		BUG();
-	}
-	return v9fs_xattr_get(dentry, full_name, buffer, size);
-}
-
 static int v9fs_xattr_get_acl(struct dentry *dentry, const char *name,
 			      void *buffer, size_t size,
 			      const struct xattr_handler *handler)
 {
 	struct v9fs_session_info *v9ses;
 	struct posix_acl *acl;
-	int type = handler->flags;
 	int error;
 
 	if (strcmp(name, "") != 0)
@@ -247,9 +228,9 @@ static int v9fs_xattr_get_acl(struct dentry *dentry, const char *name,
 	 * We allow set/get/list of acl when access=client is not specified
 	 */
 	if ((v9ses->flags & V9FS_ACCESS_MASK) != V9FS_ACCESS_CLIENT)
-		return v9fs_remote_get_acl(dentry, name, buffer, size, type);
+		return v9fs_xattr_get(dentry, handler->prefix, buffer, size);
 
-	acl = v9fs_get_cached_acl(d_inode(dentry), type);
+	acl = v9fs_get_cached_acl(d_inode(dentry), handler->flags);
 	if (IS_ERR(acl))
 		return PTR_ERR(acl);
 	if (acl == NULL)
@@ -260,26 +241,6 @@ static int v9fs_xattr_get_acl(struct dentry *dentry, const char *name,
 	return error;
 }
 
-static int v9fs_remote_set_acl(struct dentry *dentry, const char *name,
-			      const void *value, size_t size,
-			      int flags, int type)
-{
-	char *full_name;
-
-	switch (type) {
-	case ACL_TYPE_ACCESS:
-		full_name =  POSIX_ACL_XATTR_ACCESS;
-		break;
-	case ACL_TYPE_DEFAULT:
-		full_name = POSIX_ACL_XATTR_DEFAULT;
-		break;
-	default:
-		BUG();
-	}
-	return v9fs_xattr_set(dentry, full_name, value, size, flags);
-}
-
-
 static int v9fs_xattr_set_acl(struct dentry *dentry, const char *name,
 			      const void *value, size_t size,
 			      int flags, const struct xattr_handler *handler)
@@ -298,8 +259,8 @@ static int v9fs_xattr_set_acl(struct dentry *dentry, const char *name,
 	 * xattr value. We leave it to the server to validate
 	 */
 	if ((v9ses->flags & V9FS_ACCESS_MASK) != V9FS_ACCESS_CLIENT)
-		return v9fs_remote_set_acl(dentry, name,
-					   value, size, flags, handler->flags);
+		return v9fs_xattr_set(dentry, handler->prefix,
+				      value, size, flags);
 
 	if (S_ISLNK(inode->i_mode))
 		return -EOPNOTSUPP;
@@ -320,7 +281,6 @@ static int v9fs_xattr_set_acl(struct dentry *dentry, const char *name,
 
 	switch (handler->flags) {
 	case ACL_TYPE_ACCESS:
-		name = POSIX_ACL_XATTR_ACCESS;
 		if (acl) {
 			umode_t mode = inode->i_mode;
 			retval = posix_acl_equiv_mode(acl, &mode);
@@ -351,7 +311,6 @@ static int v9fs_xattr_set_acl(struct dentry *dentry, const char *name,
 		}
 		break;
 	case ACL_TYPE_DEFAULT:
-		name = POSIX_ACL_XATTR_DEFAULT;
 		if (!S_ISDIR(inode->i_mode)) {
 			retval = acl ? -EINVAL : 0;
 			goto err_out;
@@ -360,7 +319,7 @@ static int v9fs_xattr_set_acl(struct dentry *dentry, const char *name,
 	default:
 		BUG();
 	}
-	retval = v9fs_xattr_set(dentry, name, value, size, flags);
+	retval = v9fs_xattr_set(dentry, handler->prefix, value, size, flags);
 	if (!retval)
 		set_cached_acl(inode, handler->flags, acl);
 err_out:
diff --git a/fs/9p/xattr.c b/fs/9p/xattr.c
index 0cf44b6..00b28f4 100644
--- a/fs/9p/xattr.c
+++ b/fs/9p/xattr.c
@@ -137,6 +137,48 @@ ssize_t v9fs_listxattr(struct dentry *dentry, char *buffer, size_t buffer_size)
 	return v9fs_xattr_get(dentry, NULL, buffer, buffer_size);
 }
 
+static int v9fs_xattr_handler_get(struct dentry *dentry, const char *name,
+				  void *buffer, size_t size,
+				  const struct xattr_handler *handler)
+{
+	int prefix_len = strlen(handler->prefix);
+
+	if (strcmp(name, "") == 0)
+		return -EINVAL;
+	return v9fs_xattr_get(dentry, name - prefix_len, buffer, size);
+}
+
+static int v9fs_xattr_handler_set(struct dentry *dentry, const char *name,
+				  const void *value, size_t size, int flags,
+				  const struct xattr_handler *handler)
+{
+	int prefix_len = strlen(handler->prefix);
+
+	if (strcmp(name, "") == 0)
+		return -EINVAL;
+	return v9fs_xattr_set(dentry, name - prefix_len, value, size, flags);
+}
+
+static struct xattr_handler v9fs_xattr_user_handler = {
+	.prefix	= XATTR_USER_PREFIX,
+	.get	= v9fs_xattr_handler_get,
+	.set	= v9fs_xattr_handler_set,
+};
+
+static struct xattr_handler v9fs_xattr_trusted_handler = {
+	.prefix	= XATTR_TRUSTED_PREFIX,
+	.get	= v9fs_xattr_handler_get,
+	.set	= v9fs_xattr_handler_set,
+};
+
+#ifdef CONFIG_9P_FS_SECURITY
+static struct xattr_handler v9fs_xattr_security_handler = {
+	.prefix	= XATTR_SECURITY_PREFIX,
+	.get	= v9fs_xattr_handler_get,
+	.set	= v9fs_xattr_handler_set,
+};
+#endif
+
 const struct xattr_handler *v9fs_xattr_handlers[] = {
 	&v9fs_xattr_user_handler,
 	&v9fs_xattr_trusted_handler,
diff --git a/fs/9p/xattr.h b/fs/9p/xattr.h
index d3e2ea3..c63c3be 100644
--- a/fs/9p/xattr.h
+++ b/fs/9p/xattr.h
@@ -19,9 +19,6 @@
 #include <net/9p/client.h>
 
 extern const struct xattr_handler *v9fs_xattr_handlers[];
-extern struct xattr_handler v9fs_xattr_user_handler;
-extern struct xattr_handler v9fs_xattr_trusted_handler;
-extern struct xattr_handler v9fs_xattr_security_handler;
 extern const struct xattr_handler v9fs_xattr_acl_access_handler;
 extern const struct xattr_handler v9fs_xattr_acl_default_handler;
 
diff --git a/fs/9p/xattr_security.c b/fs/9p/xattr_security.c
deleted file mode 100644
index 1d99c65..0000000
--- a/fs/9p/xattr_security.c
+++ /dev/null
@@ -1,56 +0,0 @@
-/*
- * Copyright IBM Corporation, 2010
- * Author Aneesh Kumar K.V <aneesh.kumar@linux.vnet.ibm.com>
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2.1 of the GNU Lesser General Public License
- * as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it would be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
- *
- */
-
-
-#include <linux/module.h>
-#include <linux/string.h>
-#include <linux/fs.h>
-#include <linux/slab.h>
-#include "xattr.h"
-
-static int v9fs_xattr_security_get(struct dentry *dentry, const char *name,
-			void *buffer, size_t size,
-			const struct xattr_handler *handler)
-{
-	const char *full_name = name - XATTR_SECURITY_PREFIX_LEN;
-
-	if (name == NULL)
-		return -EINVAL;
-
-	if (strcmp(name, "") == 0)
-		return -EINVAL;
-
-	return v9fs_xattr_get(dentry, full_name, buffer, size);
-}
-
-static int v9fs_xattr_security_set(struct dentry *dentry, const char *name,
-			const void *value, size_t size, int flags,
-			const struct xattr_handler *handler)
-{
-	const char *full_name = name - XATTR_SECURITY_PREFIX_LEN;
-
-	if (name == NULL)
-		return -EINVAL;
-
-	if (strcmp(name, "") == 0)
-		return -EINVAL;
-
-	return v9fs_xattr_set(dentry, full_name, value, size, flags);
-}
-
-struct xattr_handler v9fs_xattr_security_handler = {
-	.prefix	= XATTR_SECURITY_PREFIX,
-	.get	= v9fs_xattr_security_get,
-	.set	= v9fs_xattr_security_set,
-};
diff --git a/fs/9p/xattr_trusted.c b/fs/9p/xattr_trusted.c
deleted file mode 100644
index 1a24647..0000000
--- a/fs/9p/xattr_trusted.c
+++ /dev/null
@@ -1,56 +0,0 @@
-/*
- * Copyright IBM Corporation, 2010
- * Author Aneesh Kumar K.V <aneesh.kumar@linux.vnet.ibm.com>
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2.1 of the GNU Lesser General Public License
- * as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it would be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
- *
- */
-
-
-#include <linux/module.h>
-#include <linux/string.h>
-#include <linux/fs.h>
-#include <linux/slab.h>
-#include "xattr.h"
-
-static int v9fs_xattr_trusted_get(struct dentry *dentry, const char *name,
-			void *buffer, size_t size,
-			const struct xattr_handler *handler)
-{
-	const char *full_name = name - XATTR_TRUSTED_PREFIX_LEN;
-
-	if (name == NULL)
-		return -EINVAL;
-
-	if (strcmp(name, "") == 0)
-		return -EINVAL;
-
-	return v9fs_xattr_get(dentry, full_name, buffer, size);
-}
-
-static int v9fs_xattr_trusted_set(struct dentry *dentry, const char *name,
-			const void *value, size_t size, int flags,
-			const struct xattr_handler *handler)
-{
-	const char *full_name = name - XATTR_TRUSTED_PREFIX_LEN;
-
-	if (name == NULL)
-		return -EINVAL;
-
-	if (strcmp(name, "") == 0)
-		return -EINVAL;
-
-	return v9fs_xattr_set(dentry, full_name, value, size, flags);
-}
-
-struct xattr_handler v9fs_xattr_trusted_handler = {
-	.prefix	= XATTR_TRUSTED_PREFIX,
-	.get	= v9fs_xattr_trusted_get,
-	.set	= v9fs_xattr_trusted_set,
-};
diff --git a/fs/9p/xattr_user.c b/fs/9p/xattr_user.c
deleted file mode 100644
index 2c35e16..0000000
--- a/fs/9p/xattr_user.c
+++ /dev/null
@@ -1,56 +0,0 @@
-/*
- * Copyright IBM Corporation, 2010
- * Author Aneesh Kumar K.V <aneesh.kumar@linux.vnet.ibm.com>
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2.1 of the GNU Lesser General Public License
- * as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it would be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
- *
- */
-
-
-#include <linux/module.h>
-#include <linux/string.h>
-#include <linux/fs.h>
-#include <linux/slab.h>
-#include "xattr.h"
-
-static int v9fs_xattr_user_get(struct dentry *dentry, const char *name,
-			void *buffer, size_t size,
-			const struct xattr_handler *handler)
-{
-	const char *full_name = name - XATTR_USER_PREFIX_LEN;
-
-	if (name == NULL)
-		return -EINVAL;
-
-	if (strcmp(name, "") == 0)
-		return -EINVAL;
-
-	return v9fs_xattr_get(dentry, full_name, buffer, size);
-}
-
-static int v9fs_xattr_user_set(struct dentry *dentry, const char *name,
-			const void *value, size_t size, int flags,
-			const struct xattr_handler *handler)
-{
-	const char *full_name = name - XATTR_USER_PREFIX_LEN;
-
-	if (name == NULL)
-		return -EINVAL;
-
-	if (strcmp(name, "") == 0)
-		return -EINVAL;
-
-	return v9fs_xattr_set(dentry, full_name, value, size, flags);
-}
-
-struct xattr_handler v9fs_xattr_user_handler = {
-	.prefix	= XATTR_USER_PREFIX,
-	.get	= v9fs_xattr_user_get,
-	.set	= v9fs_xattr_user_set,
-};
diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
index eeb7206..7ee6d34 100644
--- a/fs/f2fs/xattr.c
+++ b/fs/f2fs/xattr.c
@@ -30,33 +30,27 @@ static size_t f2fs_xattr_generic_list(struct dentry *dentry, char *list,
 		const struct xattr_handler *handler)
 {
 	struct f2fs_sb_info *sbi = F2FS_SB(dentry->d_sb);
-	int total_len, prefix_len = 0;
-	const char *prefix = NULL;
+	int total_len, prefix_len;
 
 	switch (handler->flags) {
 	case F2FS_XATTR_INDEX_USER:
 		if (!test_opt(sbi, XATTR_USER))
 			return -EOPNOTSUPP;
-		prefix = XATTR_USER_PREFIX;
-		prefix_len = XATTR_USER_PREFIX_LEN;
 		break;
 	case F2FS_XATTR_INDEX_TRUSTED:
 		if (!capable(CAP_SYS_ADMIN))
 			return -EPERM;
-		prefix = XATTR_TRUSTED_PREFIX;
-		prefix_len = XATTR_TRUSTED_PREFIX_LEN;
 		break;
 	case F2FS_XATTR_INDEX_SECURITY:
-		prefix = XATTR_SECURITY_PREFIX;
-		prefix_len = XATTR_SECURITY_PREFIX_LEN;
 		break;
 	default:
 		return -EINVAL;
 	}
 
+	prefix_len = strlen(handler->prefix);
 	total_len = prefix_len + len + 1;
 	if (list && total_len <= list_size) {
-		memcpy(list, prefix, prefix_len);
+		memcpy(list, handler->prefix, prefix_len);
 		memcpy(list + prefix_len, name, len);
 		list[prefix_len + len] = '\0';
 	}
@@ -64,7 +58,8 @@ static size_t f2fs_xattr_generic_list(struct dentry *dentry, char *list,
 }
 
 static int f2fs_xattr_generic_get(struct dentry *dentry, const char *name,
-		void *buffer, size_t size, const struct xattr_handler *handler)
+		void *buffer, size_t size,
+		const struct xattr_handler *handler)
 {
 	struct f2fs_sb_info *sbi = F2FS_SB(dentry->d_sb);
 
@@ -122,9 +117,6 @@ static size_t f2fs_xattr_advise_list(struct dentry *dentry, char *list,
 	const char *xname = F2FS_SYSTEM_ADVISE_PREFIX;
 	size_t size;
 
-	if (handler->flags != F2FS_XATTR_INDEX_ADVISE)
-		return 0;
-
 	size = strlen(xname) + 1;
 	if (list && size <= list_size)
 		memcpy(list, xname, size);
diff --git a/fs/posix_acl.c b/fs/posix_acl.c
index 1c7e94f..cea22e6 100644
--- a/fs/posix_acl.c
+++ b/fs/posix_acl.c
@@ -828,7 +828,7 @@ posix_acl_xattr_list(struct dentry *dentry, char *list, size_t list_size,
 		const char *name, size_t name_len,
 		const struct xattr_handler *handler)
 {
-	const char *xname;
+	const char *xname = handler->prefix;
 	size_t size;
 
 	if (!IS_POSIXACL(d_backing_inode(dentry)))
@@ -836,11 +836,6 @@ posix_acl_xattr_list(struct dentry *dentry, char *list, size_t list_size,
 	if (d_is_symlink(dentry))
 		return -EOPNOTSUPP;
 
-	if (handler->flags == ACL_TYPE_ACCESS)
-		xname = POSIX_ACL_XATTR_ACCESS;
-	else
-		xname = POSIX_ACL_XATTR_DEFAULT;
-
 	size = strlen(xname) + 1;
 	if (list && size <= list_size)
 		memcpy(list, xname, size);
diff --git a/fs/squashfs/xattr.c b/fs/squashfs/xattr.c
index 05ef4b9..268e25b 100644
--- a/fs/squashfs/xattr.c
+++ b/fs/squashfs/xattr.c
@@ -212,90 +212,65 @@ failed:
 }
 
 
-/*
- * User namespace support
- */
-static size_t squashfs_user_list(struct dentry *d, char *list, size_t list_size,
-	const char *name, size_t name_len, const struct xattr_handler *handler)
+static size_t squashfs_xattr_handler_list(struct dentry *d, char *list,
+	size_t list_size, const char *name, size_t name_len,
+	const struct xattr_handler *handler)
 {
-	if (list && XATTR_USER_PREFIX_LEN <= list_size)
-		memcpy(list, XATTR_USER_PREFIX, XATTR_USER_PREFIX_LEN);
-	return XATTR_USER_PREFIX_LEN;
+	int len = strlen(handler->prefix);
+
+	if (list && len <= list_size)
+		memcpy(list, handler->prefix, len);
+	return len;
 }
 
-static int squashfs_user_get(struct dentry *d, const char *name, void *buffer,
-	size_t size, const struct xattr_handler *handler)
+static int squashfs_xattr_handler_get(struct dentry *d, const char *name,
+	void *buffer, size_t size, const struct xattr_handler *handler)
 {
 	if (name[0] == '\0')
 		return  -EINVAL;
 
-	return squashfs_xattr_get(d_inode(d), SQUASHFS_XATTR_USER, name,
+	return squashfs_xattr_get(d_inode(d), handler->flags, name,
 		buffer, size);
 }
 
+/*
+ * User namespace support
+ */
 static const struct xattr_handler squashfs_xattr_user_handler = {
 	.prefix	= XATTR_USER_PREFIX,
-	.list	= squashfs_user_list,
-	.get	= squashfs_user_get
+	.flags	= SQUASHFS_XATTR_USER,
+	.list	= squashfs_xattr_handler_list,
+	.get	= squashfs_xattr_handler_get
 };
 
 /*
  * Trusted namespace support
  */
-static size_t squashfs_trusted_list(struct dentry *d, char *list,
+static size_t squashfs_trusted_xattr_handler_list(struct dentry *d, char *list,
 	size_t list_size, const char *name, size_t name_len,
 	const struct xattr_handler *handler)
 {
 	if (!capable(CAP_SYS_ADMIN))
 		return 0;
-
-	if (list && XATTR_TRUSTED_PREFIX_LEN <= list_size)
-		memcpy(list, XATTR_TRUSTED_PREFIX, XATTR_TRUSTED_PREFIX_LEN);
-	return XATTR_TRUSTED_PREFIX_LEN;
-}
-
-static int squashfs_trusted_get(struct dentry *d, const char *name,
-	void *buffer, size_t size, const struct xattr_handler *handler)
-{
-	if (name[0] == '\0')
-		return  -EINVAL;
-
-	return squashfs_xattr_get(d_inode(d), SQUASHFS_XATTR_TRUSTED, name,
-		buffer, size);
+	return squashfs_xattr_handler_list(d, list, list_size, name, name_len,
+		handler);
 }
 
 static const struct xattr_handler squashfs_xattr_trusted_handler = {
 	.prefix	= XATTR_TRUSTED_PREFIX,
-	.list	= squashfs_trusted_list,
-	.get	= squashfs_trusted_get
+	.flags	= SQUASHFS_XATTR_TRUSTED,
+	.list	= squashfs_trusted_xattr_handler_list,
+	.get	= squashfs_xattr_handler_get
 };
 
 /*
  * Security namespace support
  */
-static size_t squashfs_security_list(struct dentry *d, char *list,
-	size_t list_size, const char *name, size_t name_len,
-	const struct xattr_handler *handler)
-{
-	if (list && XATTR_SECURITY_PREFIX_LEN <= list_size)
-		memcpy(list, XATTR_SECURITY_PREFIX, XATTR_SECURITY_PREFIX_LEN);
-	return XATTR_SECURITY_PREFIX_LEN;
-}
-
-static int squashfs_security_get(struct dentry *d, const char *name,
-	void *buffer, size_t size, const struct xattr_handler *handler)
-{
-	if (name[0] == '\0')
-		return  -EINVAL;
-
-	return squashfs_xattr_get(d_inode(d), SQUASHFS_XATTR_SECURITY, name,
-		buffer, size);
-}
-
 static const struct xattr_handler squashfs_xattr_security_handler = {
 	.prefix	= XATTR_SECURITY_PREFIX,
-	.list	= squashfs_security_list,
-	.get	= squashfs_security_get
+	.flags	= SQUASHFS_XATTR_SECURITY,
+	.list	= squashfs_xattr_handler_list,
+	.get	= squashfs_xattr_handler_get
 };
 
 static const struct xattr_handler *squashfs_xattr_handler(int type)
-- 
2.4.3
