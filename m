Received: from mail-wi0-x22c.google.com ([2a00:1450:400c:c05::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZXpd0-0000h4-4U
 for linux-mtd@lists.infradead.org; Fri, 04 Sep 2015 11:58:02 +0000
Received: by wicfx3 with SMTP id fx3so15429664wic.0
 for <linux-mtd@lists.infradead.org>; Fri, 04 Sep 2015 04:57:36 -0700 (PDT)
From: Andreas Gruenbacher <andreas.gruenbacher@gmail.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>,
 Eric Van Hensbergen <ericvh@gmail.com>, Ron Minnich <rminnich@sandia.gov>,
 Latchesar Ionkov <lucho@ionkov.net>, v9fs-developer@lists.sourceforge.net
Subject: [PATCH 4/5] xattr handlers: Pass handler to operations instead of
 flags
Date: Fri,  4 Sep 2015 13:57:21 +0200
Message-Id: <1441367842-25079-5-git-send-email-agruenba@redhat.com>
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

The xattr_handler operations are currently all passed a file system specific
flags value which the operations can use to disambiguate between different
handlers; some file systems use that to distinguish the xattr namespace, for
example.  In some oprations, it would be useful to also have access to the
handler prefix.  To allow that, pass a pointer to the handler to operations
instead of the flags value alone.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/9p/acl.c                  | 12 +++++++-----
 fs/9p/xattr_security.c       |  6 ++++--
 fs/9p/xattr_trusted.c        |  6 ++++--
 fs/9p/xattr_user.c           |  6 ++++--
 fs/ext2/xattr.c              |  2 +-
 fs/ext2/xattr_security.c     |  9 ++++++---
 fs/ext2/xattr_trusted.c      |  9 ++++++---
 fs/ext2/xattr_user.c         |  9 ++++++---
 fs/ext4/xattr.c              |  2 +-
 fs/ext4/xattr_security.c     |  9 ++++++---
 fs/ext4/xattr_trusted.c      |  9 ++++++---
 fs/ext4/xattr_user.c         |  9 ++++++---
 fs/f2fs/xattr.c              | 32 +++++++++++++++++++-------------
 fs/gfs2/xattr.c              |  9 ++++++---
 fs/hfsplus/xattr.c           |  6 ++++--
 fs/hfsplus/xattr_security.c  |  6 ++++--
 fs/hfsplus/xattr_trusted.c   |  6 ++++--
 fs/hfsplus/xattr_user.c      |  6 ++++--
 fs/jffs2/security.c          |  9 ++++++---
 fs/jffs2/xattr.c             |  4 ++--
 fs/jffs2/xattr_trusted.c     |  8 +++++---
 fs/jffs2/xattr_user.c        |  9 ++++++---
 fs/nfs/nfs4proc.c            | 18 ++++++++++++------
 fs/ocfs2/xattr.c             | 27 ++++++++++++++++++---------
 fs/posix_acl.c               | 17 ++++++++++-------
 fs/reiserfs/xattr.c          | 11 +++++------
 fs/reiserfs/xattr_security.c |  8 +++++---
 fs/reiserfs/xattr_trusted.c  |  8 +++++---
 fs/reiserfs/xattr_user.c     |  8 +++++---
 fs/squashfs/xattr.c          | 16 +++++++++-------
 fs/xattr.c                   | 10 +++++-----
 fs/xfs/xfs_xattr.c           |  8 ++++++--
 include/linux/xattr.h        |  9 +++++----
 33 files changed, 202 insertions(+), 121 deletions(-)

diff --git a/fs/9p/acl.c b/fs/9p/acl.c
index 31c0103..a9e5d72 100644
--- a/fs/9p/acl.c
+++ b/fs/9p/acl.c
@@ -231,10 +231,12 @@ static int v9fs_remote_get_acl(struct dentry *dentry, const char *name,
 }
 
 static int v9fs_xattr_get_acl(struct dentry *dentry, const char *name,
-			      void *buffer, size_t size, int type)
+			      void *buffer, size_t size,
+			      const struct xattr_handler *handler)
 {
 	struct v9fs_session_info *v9ses;
 	struct posix_acl *acl;
+	int type = handler->flags;
 	int error;
 
 	if (strcmp(name, "") != 0)
@@ -280,7 +282,7 @@ static int v9fs_remote_set_acl(struct dentry *dentry, const char *name,
 
 static int v9fs_xattr_set_acl(struct dentry *dentry, const char *name,
 			      const void *value, size_t size,
-			      int flags, int type)
+			      int flags, const struct xattr_handler *handler)
 {
 	int retval;
 	struct posix_acl *acl;
@@ -297,7 +299,7 @@ static int v9fs_xattr_set_acl(struct dentry *dentry, const char *name,
 	 */
 	if ((v9ses->flags & V9FS_ACCESS_MASK) != V9FS_ACCESS_CLIENT)
 		return v9fs_remote_set_acl(dentry, name,
-					   value, size, flags, type);
+					   value, size, flags, handler->flags);
 
 	if (S_ISLNK(inode->i_mode))
 		return -EOPNOTSUPP;
@@ -316,7 +318,7 @@ static int v9fs_xattr_set_acl(struct dentry *dentry, const char *name,
 	} else
 		acl = NULL;
 
-	switch (type) {
+	switch (handler->flags) {
 	case ACL_TYPE_ACCESS:
 		name = POSIX_ACL_XATTR_ACCESS;
 		if (acl) {
@@ -360,7 +362,7 @@ static int v9fs_xattr_set_acl(struct dentry *dentry, const char *name,
 	}
 	retval = v9fs_xattr_set(dentry, name, value, size, flags);
 	if (!retval)
-		set_cached_acl(inode, type, acl);
+		set_cached_acl(inode, handler->flags, acl);
 err_out:
 	posix_acl_release(acl);
 	return retval;
diff --git a/fs/9p/xattr_security.c b/fs/9p/xattr_security.c
index 2c9b394..1d99c65 100644
--- a/fs/9p/xattr_security.c
+++ b/fs/9p/xattr_security.c
@@ -20,7 +20,8 @@
 #include "xattr.h"
 
 static int v9fs_xattr_security_get(struct dentry *dentry, const char *name,
-			void *buffer, size_t size, int type)
+			void *buffer, size_t size,
+			const struct xattr_handler *handler)
 {
 	const char *full_name = name - XATTR_SECURITY_PREFIX_LEN;
 
@@ -34,7 +35,8 @@ static int v9fs_xattr_security_get(struct dentry *dentry, const char *name,
 }
 
 static int v9fs_xattr_security_set(struct dentry *dentry, const char *name,
-			const void *value, size_t size, int flags, int type)
+			const void *value, size_t size, int flags,
+			const struct xattr_handler *handler)
 {
 	const char *full_name = name - XATTR_SECURITY_PREFIX_LEN;
 
diff --git a/fs/9p/xattr_trusted.c b/fs/9p/xattr_trusted.c
index ee470b6..1a24647 100644
--- a/fs/9p/xattr_trusted.c
+++ b/fs/9p/xattr_trusted.c
@@ -20,7 +20,8 @@
 #include "xattr.h"
 
 static int v9fs_xattr_trusted_get(struct dentry *dentry, const char *name,
-			void *buffer, size_t size, int type)
+			void *buffer, size_t size,
+			const struct xattr_handler *handler)
 {
 	const char *full_name = name - XATTR_TRUSTED_PREFIX_LEN;
 
@@ -34,7 +35,8 @@ static int v9fs_xattr_trusted_get(struct dentry *dentry, const char *name,
 }
 
 static int v9fs_xattr_trusted_set(struct dentry *dentry, const char *name,
-			const void *value, size_t size, int flags, int type)
+			const void *value, size_t size, int flags,
+			const struct xattr_handler *handler)
 {
 	const char *full_name = name - XATTR_TRUSTED_PREFIX_LEN;
 
diff --git a/fs/9p/xattr_user.c b/fs/9p/xattr_user.c
index 4432604..2c35e16 100644
--- a/fs/9p/xattr_user.c
+++ b/fs/9p/xattr_user.c
@@ -20,7 +20,8 @@
 #include "xattr.h"
 
 static int v9fs_xattr_user_get(struct dentry *dentry, const char *name,
-			void *buffer, size_t size, int type)
+			void *buffer, size_t size,
+			const struct xattr_handler *handler)
 {
 	const char *full_name = name - XATTR_USER_PREFIX_LEN;
 
@@ -34,7 +35,8 @@ static int v9fs_xattr_user_get(struct dentry *dentry, const char *name,
 }
 
 static int v9fs_xattr_user_set(struct dentry *dentry, const char *name,
-			const void *value, size_t size, int flags, int type)
+			const void *value, size_t size, int flags,
+			const struct xattr_handler *handler)
 {
 	const char *full_name = name - XATTR_USER_PREFIX_LEN;
 
diff --git a/fs/ext2/xattr.c b/fs/ext2/xattr.c
index 0b6bfd3..f786688 100644
--- a/fs/ext2/xattr.c
+++ b/fs/ext2/xattr.c
@@ -296,7 +296,7 @@ bad_block:	ext2_error(inode->i_sb, "ext2_xattr_list",
 			size_t size = handler->list(dentry, buffer, rest,
 						    entry->e_name,
 						    entry->e_name_len,
-						    handler->flags);
+						    handler);
 			if (buffer) {
 				if (size > rest) {
 					error = -ERANGE;
diff --git a/fs/ext2/xattr_security.c b/fs/ext2/xattr_security.c
index 702fc68..ed9f7a32 100644
--- a/fs/ext2/xattr_security.c
+++ b/fs/ext2/xattr_security.c
@@ -9,7 +9,8 @@
 
 static size_t
 ext2_xattr_security_list(struct dentry *dentry, char *list, size_t list_size,
-			 const char *name, size_t name_len, int type)
+			 const char *name, size_t name_len,
+			 const struct xattr_handler *handler)
 {
 	const int prefix_len = XATTR_SECURITY_PREFIX_LEN;
 	const size_t total_len = prefix_len + name_len + 1;
@@ -24,7 +25,8 @@ ext2_xattr_security_list(struct dentry *dentry, char *list, size_t list_size,
 
 static int
 ext2_xattr_security_get(struct dentry *dentry, const char *name,
-		       void *buffer, size_t size, int type)
+		       void *buffer, size_t size,
+		       const struct xattr_handler *handler)
 {
 	if (strcmp(name, "") == 0)
 		return -EINVAL;
@@ -34,7 +36,8 @@ ext2_xattr_security_get(struct dentry *dentry, const char *name,
 
 static int
 ext2_xattr_security_set(struct dentry *dentry, const char *name,
-		const void *value, size_t size, int flags, int type)
+		const void *value, size_t size, int flags,
+		const struct xattr_handler *handler)
 {
 	if (strcmp(name, "") == 0)
 		return -EINVAL;
diff --git a/fs/ext2/xattr_trusted.c b/fs/ext2/xattr_trusted.c
index 42b6e98..991676b 100644
--- a/fs/ext2/xattr_trusted.c
+++ b/fs/ext2/xattr_trusted.c
@@ -10,7 +10,8 @@
 
 static size_t
 ext2_xattr_trusted_list(struct dentry *dentry, char *list, size_t list_size,
-		const char *name, size_t name_len, int type)
+		const char *name, size_t name_len,
+		const struct xattr_handler *handler)
 {
 	const int prefix_len = XATTR_TRUSTED_PREFIX_LEN;
 	const size_t total_len = prefix_len + name_len + 1;
@@ -28,7 +29,8 @@ ext2_xattr_trusted_list(struct dentry *dentry, char *list, size_t list_size,
 
 static int
 ext2_xattr_trusted_get(struct dentry *dentry, const char *name,
-		void *buffer, size_t size, int type)
+		void *buffer, size_t size,
+		const struct xattr_handler *handler)
 {
 	if (strcmp(name, "") == 0)
 		return -EINVAL;
@@ -38,7 +40,8 @@ ext2_xattr_trusted_get(struct dentry *dentry, const char *name,
 
 static int
 ext2_xattr_trusted_set(struct dentry *dentry, const char *name,
-		const void *value, size_t size, int flags, int type)
+		const void *value, size_t size, int flags,
+		const struct xattr_handler *handler)
 {
 	if (strcmp(name, "") == 0)
 		return -EINVAL;
diff --git a/fs/ext2/xattr_user.c b/fs/ext2/xattr_user.c
index ecdc460..b8f7c02 100644
--- a/fs/ext2/xattr_user.c
+++ b/fs/ext2/xattr_user.c
@@ -12,7 +12,8 @@
 
 static size_t
 ext2_xattr_user_list(struct dentry *dentry, char *list, size_t list_size,
-		const char *name, size_t name_len, int type)
+		const char *name, size_t name_len,
+		const struct xattr_handler *handler)
 {
 	const size_t prefix_len = XATTR_USER_PREFIX_LEN;
 	const size_t total_len = prefix_len + name_len + 1;
@@ -30,7 +31,8 @@ ext2_xattr_user_list(struct dentry *dentry, char *list, size_t list_size,
 
 static int
 ext2_xattr_user_get(struct dentry *dentry, const char *name,
-		void *buffer, size_t size, int type)
+		void *buffer, size_t size,
+		const struct xattr_handler *handler)
 {
 	if (strcmp(name, "") == 0)
 		return -EINVAL;
@@ -42,7 +44,8 @@ ext2_xattr_user_get(struct dentry *dentry, const char *name,
 
 static int
 ext2_xattr_user_set(struct dentry *dentry, const char *name,
-		const void *value, size_t size, int flags, int type)
+		const void *value, size_t size, int flags,
+		const struct xattr_handler *handler)
 {
 	if (strcmp(name, "") == 0)
 		return -EINVAL;
diff --git a/fs/ext4/xattr.c b/fs/ext4/xattr.c
index 16e28c0..f5158d9 100644
--- a/fs/ext4/xattr.c
+++ b/fs/ext4/xattr.c
@@ -408,7 +408,7 @@ ext4_xattr_list_entries(struct dentry *dentry, struct ext4_xattr_entry *entry,
 			size_t size = handler->list(dentry, buffer, rest,
 						    entry->e_name,
 						    entry->e_name_len,
-						    handler->flags);
+						    handler);
 			if (buffer) {
 				if (size > rest)
 					return -ERANGE;
diff --git a/fs/ext4/xattr_security.c b/fs/ext4/xattr_security.c
index 95d90e0..5e5b4e0 100644
--- a/fs/ext4/xattr_security.c
+++ b/fs/ext4/xattr_security.c
@@ -13,7 +13,8 @@
 
 static size_t
 ext4_xattr_security_list(struct dentry *dentry, char *list, size_t list_size,
-		const char *name, size_t name_len, int type)
+		const char *name, size_t name_len,
+		const struct xattr_handler *handler)
 {
 	const size_t prefix_len = sizeof(XATTR_SECURITY_PREFIX)-1;
 	const size_t total_len = prefix_len + name_len + 1;
@@ -29,7 +30,8 @@ ext4_xattr_security_list(struct dentry *dentry, char *list, size_t list_size,
 
 static int
 ext4_xattr_security_get(struct dentry *dentry, const char *name,
-		       void *buffer, size_t size, int type)
+		       void *buffer, size_t size,
+		       const struct xattr_handler *handler)
 {
 	if (strcmp(name, "") == 0)
 		return -EINVAL;
@@ -39,7 +41,8 @@ ext4_xattr_security_get(struct dentry *dentry, const char *name,
 
 static int
 ext4_xattr_security_set(struct dentry *dentry, const char *name,
-		const void *value, size_t size, int flags, int type)
+		const void *value, size_t size, int flags,
+		const struct xattr_handler *handler)
 {
 	if (strcmp(name, "") == 0)
 		return -EINVAL;
diff --git a/fs/ext4/xattr_trusted.c b/fs/ext4/xattr_trusted.c
index 891ee2d..b298d01 100644
--- a/fs/ext4/xattr_trusted.c
+++ b/fs/ext4/xattr_trusted.c
@@ -14,7 +14,8 @@
 
 static size_t
 ext4_xattr_trusted_list(struct dentry *dentry, char *list, size_t list_size,
-		const char *name, size_t name_len, int type)
+		const char *name, size_t name_len,
+		const struct xattr_handler *handler)
 {
 	const size_t prefix_len = XATTR_TRUSTED_PREFIX_LEN;
 	const size_t total_len = prefix_len + name_len + 1;
@@ -32,7 +33,8 @@ ext4_xattr_trusted_list(struct dentry *dentry, char *list, size_t list_size,
 
 static int
 ext4_xattr_trusted_get(struct dentry *dentry, const char *name, void *buffer,
-		size_t size, int type)
+		size_t size,
+		const struct xattr_handler *handler)
 {
 	if (strcmp(name, "") == 0)
 		return -EINVAL;
@@ -42,7 +44,8 @@ ext4_xattr_trusted_get(struct dentry *dentry, const char *name, void *buffer,
 
 static int
 ext4_xattr_trusted_set(struct dentry *dentry, const char *name,
-		const void *value, size_t size, int flags, int type)
+		const void *value, size_t size, int flags,
+		const struct xattr_handler *handler)
 {
 	if (strcmp(name, "") == 0)
 		return -EINVAL;
diff --git a/fs/ext4/xattr_user.c b/fs/ext4/xattr_user.c
index 6ed932b..62085d1 100644
--- a/fs/ext4/xattr_user.c
+++ b/fs/ext4/xattr_user.c
@@ -13,7 +13,8 @@
 
 static size_t
 ext4_xattr_user_list(struct dentry *dentry, char *list, size_t list_size,
-		     const char *name, size_t name_len, int type)
+		     const char *name, size_t name_len,
+		     const struct xattr_handler *handler)
 {
 	const size_t prefix_len = XATTR_USER_PREFIX_LEN;
 	const size_t total_len = prefix_len + name_len + 1;
@@ -31,7 +32,8 @@ ext4_xattr_user_list(struct dentry *dentry, char *list, size_t list_size,
 
 static int
 ext4_xattr_user_get(struct dentry *dentry, const char *name,
-		    void *buffer, size_t size, int type)
+		    void *buffer, size_t size,
+		    const struct xattr_handler *handler)
 {
 	if (strcmp(name, "") == 0)
 		return -EINVAL;
@@ -43,7 +45,8 @@ ext4_xattr_user_get(struct dentry *dentry, const char *name,
 
 static int
 ext4_xattr_user_set(struct dentry *dentry, const char *name,
-		    const void *value, size_t size, int flags, int type)
+		    const void *value, size_t size, int flags,
+		    const struct xattr_handler *handler)
 {
 	if (strcmp(name, "") == 0)
 		return -EINVAL;
diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
index 4de2286..eeb7206 100644
--- a/fs/f2fs/xattr.c
+++ b/fs/f2fs/xattr.c
@@ -26,13 +26,14 @@
 #include "xattr.h"
 
 static size_t f2fs_xattr_generic_list(struct dentry *dentry, char *list,
-		size_t list_size, const char *name, size_t len, int type)
+		size_t list_size, const char *name, size_t len,
+		const struct xattr_handler *handler)
 {
 	struct f2fs_sb_info *sbi = F2FS_SB(dentry->d_sb);
 	int total_len, prefix_len = 0;
 	const char *prefix = NULL;
 
-	switch (type) {
+	switch (handler->flags) {
 	case F2FS_XATTR_INDEX_USER:
 		if (!test_opt(sbi, XATTR_USER))
 			return -EOPNOTSUPP;
@@ -63,11 +64,11 @@ static size_t f2fs_xattr_generic_list(struct dentry *dentry, char *list,
 }
 
 static int f2fs_xattr_generic_get(struct dentry *dentry, const char *name,
-		void *buffer, size_t size, int type)
+		void *buffer, size_t size, const struct xattr_handler *handler)
 {
 	struct f2fs_sb_info *sbi = F2FS_SB(dentry->d_sb);
 
-	switch (type) {
+	switch (handler->flags) {
 	case F2FS_XATTR_INDEX_USER:
 		if (!test_opt(sbi, XATTR_USER))
 			return -EOPNOTSUPP;
@@ -83,15 +84,17 @@ static int f2fs_xattr_generic_get(struct dentry *dentry, const char *name,
 	}
 	if (strcmp(name, "") == 0)
 		return -EINVAL;
-	return f2fs_getxattr(d_inode(dentry), type, name, buffer, size, NULL);
+	return f2fs_getxattr(d_inode(dentry), handler->flags, name,
+			     buffer, size, NULL);
 }
 
 static int f2fs_xattr_generic_set(struct dentry *dentry, const char *name,
-		const void *value, size_t size, int flags, int type)
+		const void *value, size_t size, int flags,
+		const struct xattr_handler *handler)
 {
 	struct f2fs_sb_info *sbi = F2FS_SB(dentry->d_sb);
 
-	switch (type) {
+	switch (handler->flags) {
 	case F2FS_XATTR_INDEX_USER:
 		if (!test_opt(sbi, XATTR_USER))
 			return -EOPNOTSUPP;
@@ -108,17 +111,18 @@ static int f2fs_xattr_generic_set(struct dentry *dentry, const char *name,
 	if (strcmp(name, "") == 0)
 		return -EINVAL;
 
-	return f2fs_setxattr(d_inode(dentry), type, name,
+	return f2fs_setxattr(d_inode(dentry), handler->flags, name,
 					value, size, NULL, flags);
 }
 
 static size_t f2fs_xattr_advise_list(struct dentry *dentry, char *list,
-		size_t list_size, const char *name, size_t len, int type)
+		size_t list_size, const char *name, size_t len,
+		const struct xattr_handler *handler)
 {
 	const char *xname = F2FS_SYSTEM_ADVISE_PREFIX;
 	size_t size;
 
-	if (type != F2FS_XATTR_INDEX_ADVISE)
+	if (handler->flags != F2FS_XATTR_INDEX_ADVISE)
 		return 0;
 
 	size = strlen(xname) + 1;
@@ -128,7 +132,8 @@ static size_t f2fs_xattr_advise_list(struct dentry *dentry, char *list,
 }
 
 static int f2fs_xattr_advise_get(struct dentry *dentry, const char *name,
-		void *buffer, size_t size, int type)
+		void *buffer, size_t size,
+		const struct xattr_handler *handler)
 {
 	struct inode *inode = d_inode(dentry);
 
@@ -141,7 +146,8 @@ static int f2fs_xattr_advise_get(struct dentry *dentry, const char *name,
 }
 
 static int f2fs_xattr_advise_set(struct dentry *dentry, const char *name,
-		const void *value, size_t size, int flags, int type)
+		const void *value, size_t size, int flags,
+		const struct xattr_handler *handler)
 {
 	struct inode *inode = d_inode(dentry);
 
@@ -463,7 +469,7 @@ ssize_t f2fs_listxattr(struct dentry *dentry, char *buffer, size_t buffer_size)
 			continue;
 
 		size = handler->list(dentry, buffer, rest, entry->e_name,
-				entry->e_name_len, handler->flags);
+				entry->e_name_len, handler);
 		if (buffer && size > rest) {
 			error = -ERANGE;
 			goto cleanup;
diff --git a/fs/gfs2/xattr.c b/fs/gfs2/xattr.c
index 4c096fa..3979c608 100644
--- a/fs/gfs2/xattr.c
+++ b/fs/gfs2/xattr.c
@@ -584,10 +584,12 @@ out:
  * Returns: actual size of data on success, -errno on error
  */
 static int gfs2_xattr_get(struct dentry *dentry, const char *name,
-		void *buffer, size_t size, int type)
+		void *buffer, size_t size,
+		const struct xattr_handler *handler)
 {
 	struct gfs2_inode *ip = GFS2_I(d_inode(dentry));
 	struct gfs2_ea_location el;
+	int type = handler->flags;
 	int error;
 
 	if (!ip->i_eattr)
@@ -1228,10 +1230,11 @@ int __gfs2_xattr_set(struct inode *inode, const char *name,
 }
 
 static int gfs2_xattr_set(struct dentry *dentry, const char *name,
-		const void *value, size_t size, int flags, int type)
+		const void *value, size_t size, int flags,
+		const struct xattr_handler *handler)
 {
 	return __gfs2_xattr_set(d_inode(dentry), name, value,
-				size, flags, type);
+				size, flags, handler->flags);
 }
 
 
diff --git a/fs/hfsplus/xattr.c b/fs/hfsplus/xattr.c
index e898499..65914db 100644
--- a/fs/hfsplus/xattr.c
+++ b/fs/hfsplus/xattr.c
@@ -850,7 +850,8 @@ end_removexattr:
 }
 
 static int hfsplus_osx_getxattr(struct dentry *dentry, const char *name,
-					void *buffer, size_t size, int type)
+					void *buffer, size_t size,
+					const struct xattr_handler *handler)
 {
 	if (!strcmp(name, ""))
 		return -EINVAL;
@@ -872,7 +873,8 @@ static int hfsplus_osx_getxattr(struct dentry *dentry, const char *name,
 }
 
 static int hfsplus_osx_setxattr(struct dentry *dentry, const char *name,
-		const void *buffer, size_t size, int flags, int type)
+		const void *buffer, size_t size, int flags,
+		const struct xattr_handler *handler)
 {
 	if (!strcmp(name, ""))
 		return -EINVAL;
diff --git a/fs/hfsplus/xattr_security.c b/fs/hfsplus/xattr_security.c
index 024e61c..3601ecc 100644
--- a/fs/hfsplus/xattr_security.c
+++ b/fs/hfsplus/xattr_security.c
@@ -14,7 +14,8 @@
 #include "acl.h"
 
 static int hfsplus_security_getxattr(struct dentry *dentry, const char *name,
-					void *buffer, size_t size, int type)
+					void *buffer, size_t size,
+					const struct xattr_handler *handler)
 {
 	return hfsplus_getxattr(dentry, name, buffer, size,
 				XATTR_SECURITY_PREFIX,
@@ -22,7 +23,8 @@ static int hfsplus_security_getxattr(struct dentry *dentry, const char *name,
 }
 
 static int hfsplus_security_setxattr(struct dentry *dentry, const char *name,
-		const void *buffer, size_t size, int flags, int type)
+		const void *buffer, size_t size, int flags,
+		const struct xattr_handler *handler)
 {
 	return hfsplus_setxattr(dentry, name, buffer, size, flags,
 				XATTR_SECURITY_PREFIX,
diff --git a/fs/hfsplus/xattr_trusted.c b/fs/hfsplus/xattr_trusted.c
index 6186157..123cd8e 100644
--- a/fs/hfsplus/xattr_trusted.c
+++ b/fs/hfsplus/xattr_trusted.c
@@ -12,7 +12,8 @@
 #include "xattr.h"
 
 static int hfsplus_trusted_getxattr(struct dentry *dentry, const char *name,
-					void *buffer, size_t size, int type)
+					void *buffer, size_t size,
+					const struct xattr_handler *handler)
 {
 	return hfsplus_getxattr(dentry, name, buffer, size,
 				XATTR_TRUSTED_PREFIX,
@@ -20,7 +21,8 @@ static int hfsplus_trusted_getxattr(struct dentry *dentry, const char *name,
 }
 
 static int hfsplus_trusted_setxattr(struct dentry *dentry, const char *name,
-		const void *buffer, size_t size, int flags, int type)
+		const void *buffer, size_t size, int flags,
+		const struct xattr_handler *handler)
 {
 	return hfsplus_setxattr(dentry, name, buffer, size, flags,
 				XATTR_TRUSTED_PREFIX, XATTR_TRUSTED_PREFIX_LEN);
diff --git a/fs/hfsplus/xattr_user.c b/fs/hfsplus/xattr_user.c
index 3b4caba..2272557 100644
--- a/fs/hfsplus/xattr_user.c
+++ b/fs/hfsplus/xattr_user.c
@@ -12,7 +12,8 @@
 #include "xattr.h"
 
 static int hfsplus_user_getxattr(struct dentry *dentry, const char *name,
-					void *buffer, size_t size, int type)
+					void *buffer, size_t size,
+					const struct xattr_handler *handler)
 {
 
 	return hfsplus_getxattr(dentry, name, buffer, size,
@@ -20,7 +21,8 @@ static int hfsplus_user_getxattr(struct dentry *dentry, const char *name,
 }
 
 static int hfsplus_user_setxattr(struct dentry *dentry, const char *name,
-		const void *buffer, size_t size, int flags, int type)
+		const void *buffer, size_t size, int flags,
+		const struct xattr_handler *handler)
 {
 	return hfsplus_setxattr(dentry, name, buffer, size, flags,
 				XATTR_USER_PREFIX, XATTR_USER_PREFIX_LEN);
diff --git a/fs/jffs2/security.c b/fs/jffs2/security.c
index d4b43fb..8f609e8 100644
--- a/fs/jffs2/security.c
+++ b/fs/jffs2/security.c
@@ -49,7 +49,8 @@ int jffs2_init_security(struct inode *inode, struct inode *dir,
 
 /* ---- XATTR Handler for "security.*" ----------------- */
 static int jffs2_security_getxattr(struct dentry *dentry, const char *name,
-				   void *buffer, size_t size, int type)
+				   void *buffer, size_t size,
+				   const struct xattr_handler *handler)
 {
 	if (!strcmp(name, ""))
 		return -EINVAL;
@@ -59,7 +60,8 @@ static int jffs2_security_getxattr(struct dentry *dentry, const char *name,
 }
 
 static int jffs2_security_setxattr(struct dentry *dentry, const char *name,
-		const void *buffer, size_t size, int flags, int type)
+		const void *buffer, size_t size, int flags,
+		const struct xattr_handler *handler)
 {
 	if (!strcmp(name, ""))
 		return -EINVAL;
@@ -69,7 +71,8 @@ static int jffs2_security_setxattr(struct dentry *dentry, const char *name,
 }
 
 static size_t jffs2_security_listxattr(struct dentry *dentry, char *list,
-		size_t list_size, const char *name, size_t name_len, int type)
+		size_t list_size, const char *name, size_t name_len,
+		const struct xattr_handler *handler)
 {
 	size_t retlen = XATTR_SECURITY_PREFIX_LEN + name_len + 1;
 
diff --git a/fs/jffs2/xattr.c b/fs/jffs2/xattr.c
index f092fee..8b2305c 100644
--- a/fs/jffs2/xattr.c
+++ b/fs/jffs2/xattr.c
@@ -1002,10 +1002,10 @@ ssize_t jffs2_listxattr(struct dentry *dentry, char *buffer, size_t size)
 			continue;
 		if (buffer) {
 			rc = xhandle->list(dentry, buffer+len, size-len,
-					   xd->xname, xd->name_len, xd->flags);
+					   xd->xname, xd->name_len, xhandle);
 		} else {
 			rc = xhandle->list(dentry, NULL, 0, xd->xname,
-					   xd->name_len, xd->flags);
+					   xd->name_len, xhandle);
 		}
 		if (rc < 0)
 			goto out;
diff --git a/fs/jffs2/xattr_trusted.c b/fs/jffs2/xattr_trusted.c
index ceaf9c6..afa0e4d 100644
--- a/fs/jffs2/xattr_trusted.c
+++ b/fs/jffs2/xattr_trusted.c
@@ -17,7 +17,7 @@
 #include "nodelist.h"
 
 static int jffs2_trusted_getxattr(struct dentry *dentry, const char *name,
-		void *buffer, size_t size, int type)
+		void *buffer, size_t size, const struct xattr_handler *handler)
 {
 	if (!strcmp(name, ""))
 		return -EINVAL;
@@ -26,7 +26,8 @@ static int jffs2_trusted_getxattr(struct dentry *dentry, const char *name,
 }
 
 static int jffs2_trusted_setxattr(struct dentry *dentry, const char *name,
-		const void *buffer, size_t size, int flags, int type)
+		const void *buffer, size_t size, int flags,
+		const struct xattr_handler *handler)
 {
 	if (!strcmp(name, ""))
 		return -EINVAL;
@@ -35,7 +36,8 @@ static int jffs2_trusted_setxattr(struct dentry *dentry, const char *name,
 }
 
 static size_t jffs2_trusted_listxattr(struct dentry *dentry, char *list,
-		size_t list_size, const char *name, size_t name_len, int type)
+		size_t list_size, const char *name, size_t name_len,
+		const struct xattr_handler *handler)
 {
 	size_t retlen = XATTR_TRUSTED_PREFIX_LEN + name_len + 1;
 
diff --git a/fs/jffs2/xattr_user.c b/fs/jffs2/xattr_user.c
index a71391e..4c45567 100644
--- a/fs/jffs2/xattr_user.c
+++ b/fs/jffs2/xattr_user.c
@@ -17,7 +17,8 @@
 #include "nodelist.h"
 
 static int jffs2_user_getxattr(struct dentry *dentry, const char *name,
-			       void *buffer, size_t size, int type)
+			       void *buffer, size_t size,
+			       const struct xattr_handler *handler)
 {
 	if (!strcmp(name, ""))
 		return -EINVAL;
@@ -26,7 +27,8 @@ static int jffs2_user_getxattr(struct dentry *dentry, const char *name,
 }
 
 static int jffs2_user_setxattr(struct dentry *dentry, const char *name,
-		const void *buffer, size_t size, int flags, int type)
+		const void *buffer, size_t size, int flags,
+		const struct xattr_handler *handler)
 {
 	if (!strcmp(name, ""))
 		return -EINVAL;
@@ -35,7 +37,8 @@ static int jffs2_user_setxattr(struct dentry *dentry, const char *name,
 }
 
 static size_t jffs2_user_listxattr(struct dentry *dentry, char *list,
-		size_t list_size, const char *name, size_t name_len, int type)
+		size_t list_size, const char *name, size_t name_len,
+		const struct xattr_handler *handler)
 {
 	size_t retlen = XATTR_USER_PREFIX_LEN + name_len + 1;
 
diff --git a/fs/nfs/nfs4proc.c b/fs/nfs/nfs4proc.c
index 3acb1eb..977165e 100644
--- a/fs/nfs/nfs4proc.c
+++ b/fs/nfs/nfs4proc.c
@@ -6203,7 +6203,8 @@ nfs4_release_lockowner(struct nfs_server *server, struct nfs4_lock_state *lsp)
 
 static int nfs4_xattr_set_nfs4_acl(struct dentry *dentry, const char *key,
 				   const void *buf, size_t buflen,
-				   int flags, int type)
+				   int flags,
+				   const struct xattr_handler *handler)
 {
 	if (strcmp(key, "") != 0)
 		return -EINVAL;
@@ -6212,7 +6213,8 @@ static int nfs4_xattr_set_nfs4_acl(struct dentry *dentry, const char *key,
 }
 
 static int nfs4_xattr_get_nfs4_acl(struct dentry *dentry, const char *key,
-				   void *buf, size_t buflen, int type)
+				   void *buf, size_t buflen,
+				   const struct xattr_handler *handler)
 {
 	if (strcmp(key, "") != 0)
 		return -EINVAL;
@@ -6222,7 +6224,8 @@ static int nfs4_xattr_get_nfs4_acl(struct dentry *dentry, const char *key,
 
 static size_t nfs4_xattr_list_nfs4_acl(struct dentry *dentry, char *list,
 				       size_t list_len, const char *name,
-				       size_t name_len, int type)
+				       size_t name_len,
+				       const struct xattr_handler *handler)
 {
 	size_t len = sizeof(XATTR_NAME_NFSV4_ACL);
 
@@ -6242,7 +6245,8 @@ static inline int nfs4_server_supports_labels(struct nfs_server *server)
 
 static int nfs4_xattr_set_nfs4_label(struct dentry *dentry, const char *key,
 				   const void *buf, size_t buflen,
-				   int flags, int type)
+				   int flags,
+				   const struct xattr_handler *handler)
 {
 	if (security_ismaclabel(key))
 		return nfs4_set_security_label(dentry, buf, buflen);
@@ -6251,7 +6255,8 @@ static int nfs4_xattr_set_nfs4_label(struct dentry *dentry, const char *key,
 }
 
 static int nfs4_xattr_get_nfs4_label(struct dentry *dentry, const char *key,
-				   void *buf, size_t buflen, int type)
+				   void *buf, size_t buflen,
+				   const struct xattr_handler *handler)
 {
 	if (security_ismaclabel(key))
 		return nfs4_get_security_label(d_inode(dentry), buf, buflen);
@@ -6260,7 +6265,8 @@ static int nfs4_xattr_get_nfs4_label(struct dentry *dentry, const char *key,
 
 static size_t nfs4_xattr_list_nfs4_label(struct dentry *dentry, char *list,
 				       size_t list_len, const char *name,
-				       size_t name_len, int type)
+				       size_t name_len,
+				       const struct xattr_handler *handler)
 {
 	size_t len = 0;
 
diff --git a/fs/ocfs2/xattr.c b/fs/ocfs2/xattr.c
index 889f379..f5ce434 100644
--- a/fs/ocfs2/xattr.c
+++ b/fs/ocfs2/xattr.c
@@ -7239,7 +7239,8 @@ leave:
  */
 static size_t ocfs2_xattr_security_list(struct dentry *dentry, char *list,
 					size_t list_size, const char *name,
-					size_t name_len, int type)
+					size_t name_len,
+					const struct xattr_handler *handler)
 {
 	const size_t prefix_len = XATTR_SECURITY_PREFIX_LEN;
 	const size_t total_len = prefix_len + name_len + 1;
@@ -7253,7 +7254,8 @@ static size_t ocfs2_xattr_security_list(struct dentry *dentry, char *list,
 }
 
 static int ocfs2_xattr_security_get(struct dentry *dentry, const char *name,
-				    void *buffer, size_t size, int type)
+				    void *buffer, size_t size,
+				    const struct xattr_handler *handler)
 {
 	if (strcmp(name, "") == 0)
 		return -EINVAL;
@@ -7262,7 +7264,8 @@ static int ocfs2_xattr_security_get(struct dentry *dentry, const char *name,
 }
 
 static int ocfs2_xattr_security_set(struct dentry *dentry, const char *name,
-		const void *value, size_t size, int flags, int type)
+		const void *value, size_t size, int flags,
+		const struct xattr_handler *handler)
 {
 	if (strcmp(name, "") == 0)
 		return -EINVAL;
@@ -7329,7 +7332,8 @@ const struct xattr_handler ocfs2_xattr_security_handler = {
  */
 static size_t ocfs2_xattr_trusted_list(struct dentry *dentry, char *list,
 				       size_t list_size, const char *name,
-				       size_t name_len, int type)
+				       size_t name_len,
+				       const struct xattr_handler *handler)
 {
 	const size_t prefix_len = XATTR_TRUSTED_PREFIX_LEN;
 	const size_t total_len = prefix_len + name_len + 1;
@@ -7343,7 +7347,8 @@ static size_t ocfs2_xattr_trusted_list(struct dentry *dentry, char *list,
 }
 
 static int ocfs2_xattr_trusted_get(struct dentry *dentry, const char *name,
-		void *buffer, size_t size, int type)
+		void *buffer, size_t size,
+		const struct xattr_handler *handler)
 {
 	if (strcmp(name, "") == 0)
 		return -EINVAL;
@@ -7352,7 +7357,8 @@ static int ocfs2_xattr_trusted_get(struct dentry *dentry, const char *name,
 }
 
 static int ocfs2_xattr_trusted_set(struct dentry *dentry, const char *name,
-		const void *value, size_t size, int flags, int type)
+		const void *value, size_t size, int flags,
+		const struct xattr_handler *handler)
 {
 	if (strcmp(name, "") == 0)
 		return -EINVAL;
@@ -7373,7 +7379,8 @@ const struct xattr_handler ocfs2_xattr_trusted_handler = {
  */
 static size_t ocfs2_xattr_user_list(struct dentry *dentry, char *list,
 				    size_t list_size, const char *name,
-				    size_t name_len, int type)
+				    size_t name_len,
+				    const struct xattr_handler *handler)
 {
 	const size_t prefix_len = XATTR_USER_PREFIX_LEN;
 	const size_t total_len = prefix_len + name_len + 1;
@@ -7391,7 +7398,8 @@ static size_t ocfs2_xattr_user_list(struct dentry *dentry, char *list,
 }
 
 static int ocfs2_xattr_user_get(struct dentry *dentry, const char *name,
-		void *buffer, size_t size, int type)
+		void *buffer, size_t size,
+		const struct xattr_handler *handler)
 {
 	struct ocfs2_super *osb = OCFS2_SB(dentry->d_sb);
 
@@ -7404,7 +7412,8 @@ static int ocfs2_xattr_user_get(struct dentry *dentry, const char *name,
 }
 
 static int ocfs2_xattr_user_set(struct dentry *dentry, const char *name,
-		const void *value, size_t size, int flags, int type)
+		const void *value, size_t size, int flags,
+		const struct xattr_handler *handler)
 {
 	struct ocfs2_super *osb = OCFS2_SB(dentry->d_sb);
 
diff --git a/fs/posix_acl.c b/fs/posix_acl.c
index 4fb17de..1c7e94f 100644
--- a/fs/posix_acl.c
+++ b/fs/posix_acl.c
@@ -763,7 +763,8 @@ EXPORT_SYMBOL (posix_acl_to_xattr);
 
 static int
 posix_acl_xattr_get(struct dentry *dentry, const char *name,
-		void *value, size_t size, int type)
+		void *value, size_t size,
+		const struct xattr_handler *handler)
 {
 	struct posix_acl *acl;
 	int error;
@@ -773,7 +774,7 @@ posix_acl_xattr_get(struct dentry *dentry, const char *name,
 	if (d_is_symlink(dentry))
 		return -EOPNOTSUPP;
 
-	acl = get_acl(d_backing_inode(dentry), type);
+	acl = get_acl(d_backing_inode(dentry), handler->flags);
 	if (IS_ERR(acl))
 		return PTR_ERR(acl);
 	if (acl == NULL)
@@ -787,7 +788,8 @@ posix_acl_xattr_get(struct dentry *dentry, const char *name,
 
 static int
 posix_acl_xattr_set(struct dentry *dentry, const char *name,
-		const void *value, size_t size, int flags, int type)
+		const void *value, size_t size, int flags,
+		const struct xattr_handler *handler)
 {
 	struct inode *inode = d_backing_inode(dentry);
 	struct posix_acl *acl = NULL;
@@ -798,7 +800,7 @@ posix_acl_xattr_set(struct dentry *dentry, const char *name,
 	if (!inode->i_op->set_acl)
 		return -EOPNOTSUPP;
 
-	if (type == ACL_TYPE_DEFAULT && !S_ISDIR(inode->i_mode))
+	if (handler->flags == ACL_TYPE_DEFAULT && !S_ISDIR(inode->i_mode))
 		return value ? -EACCES : 0;
 	if (!inode_owner_or_capable(inode))
 		return -EPERM;
@@ -815,7 +817,7 @@ posix_acl_xattr_set(struct dentry *dentry, const char *name,
 		}
 	}
 
-	ret = inode->i_op->set_acl(inode, acl, type);
+	ret = inode->i_op->set_acl(inode, acl, handler->flags);
 out:
 	posix_acl_release(acl);
 	return ret;
@@ -823,7 +825,8 @@ out:
 
 static size_t
 posix_acl_xattr_list(struct dentry *dentry, char *list, size_t list_size,
-		const char *name, size_t name_len, int type)
+		const char *name, size_t name_len,
+		const struct xattr_handler *handler)
 {
 	const char *xname;
 	size_t size;
@@ -833,7 +836,7 @@ posix_acl_xattr_list(struct dentry *dentry, char *list, size_t list_size,
 	if (d_is_symlink(dentry))
 		return -EOPNOTSUPP;
 
-	if (type == ACL_TYPE_ACCESS)
+	if (handler->flags == ACL_TYPE_ACCESS)
 		xname = POSIX_ACL_XATTR_ACCESS;
 	else
 		xname = POSIX_ACL_XATTR_DEFAULT;
diff --git a/fs/reiserfs/xattr.c b/fs/reiserfs/xattr.c
index e87f9b5..ad6e4bb 100644
--- a/fs/reiserfs/xattr.c
+++ b/fs/reiserfs/xattr.c
@@ -778,7 +778,7 @@ reiserfs_getxattr(struct dentry * dentry, const char *name, void *buffer,
 	if (!handler || get_inode_sd_version(d_inode(dentry)) == STAT_DATA_V1)
 		return -EOPNOTSUPP;
 
-	return handler->get(dentry, name, buffer, size, handler->flags);
+	return handler->get(dentry, name, buffer, size, handler);
 }
 
 /*
@@ -797,7 +797,7 @@ reiserfs_setxattr(struct dentry *dentry, const char *name, const void *value,
 	if (!handler || get_inode_sd_version(d_inode(dentry)) == STAT_DATA_V1)
 		return -EOPNOTSUPP;
 
-	return handler->set(dentry, name, value, size, flags, handler->flags);
+	return handler->set(dentry, name, value, size, flags, handler);
 }
 
 /*
@@ -814,7 +814,7 @@ int reiserfs_removexattr(struct dentry *dentry, const char *name)
 	if (!handler || get_inode_sd_version(d_inode(dentry)) == STAT_DATA_V1)
 		return -EOPNOTSUPP;
 
-	return handler->set(dentry, name, NULL, 0, XATTR_REPLACE, handler->flags);
+	return handler->set(dentry, name, NULL, 0, XATTR_REPLACE, handler);
 }
 
 struct listxattr_buf {
@@ -843,13 +843,12 @@ static int listxattr_filler(struct dir_context *ctx, const char *name,
 			return 0;
 		if (b->buf) {
 			size = handler->list(b->dentry, b->buf + b->pos,
-					 b->size, name, namelen,
-					 handler->flags);
+					 b->size, name, namelen, handler);
 			if (size > b->size)
 				return -ERANGE;
 		} else {
 			size = handler->list(b->dentry, NULL, 0, name,
-					     namelen, handler->flags);
+					     namelen, handler);
 		}
 
 		b->pos += size;
diff --git a/fs/reiserfs/xattr_security.c b/fs/reiserfs/xattr_security.c
index 9a3b061..08074f5 100644
--- a/fs/reiserfs/xattr_security.c
+++ b/fs/reiserfs/xattr_security.c
@@ -10,7 +10,7 @@
 
 static int
 security_get(struct dentry *dentry, const char *name, void *buffer, size_t size,
-		int handler_flags)
+	     const struct xattr_handler *handler)
 {
 	if (strlen(name) < sizeof(XATTR_SECURITY_PREFIX))
 		return -EINVAL;
@@ -23,7 +23,8 @@ security_get(struct dentry *dentry, const char *name, void *buffer, size_t size,
 
 static int
 security_set(struct dentry *dentry, const char *name, const void *buffer,
-	     size_t size, int flags, int handler_flags)
+	     size_t size, int flags,
+	     const struct xattr_handler *handler)
 {
 	if (strlen(name) < sizeof(XATTR_SECURITY_PREFIX))
 		return -EINVAL;
@@ -35,7 +36,8 @@ security_set(struct dentry *dentry, const char *name, const void *buffer,
 }
 
 static size_t security_list(struct dentry *dentry, char *list, size_t list_len,
-			    const char *name, size_t namelen, int handler_flags)
+			    const char *name, size_t namelen,
+			    const struct xattr_handler *handler)
 {
 	const size_t len = namelen + 1;
 
diff --git a/fs/reiserfs/xattr_trusted.c b/fs/reiserfs/xattr_trusted.c
index e4f1343..e3ab346 100644
--- a/fs/reiserfs/xattr_trusted.c
+++ b/fs/reiserfs/xattr_trusted.c
@@ -9,7 +9,7 @@
 
 static int
 trusted_get(struct dentry *dentry, const char *name, void *buffer, size_t size,
-	    int handler_flags)
+	    const struct xattr_handler *handler)
 {
 	if (strlen(name) < sizeof(XATTR_TRUSTED_PREFIX))
 		return -EINVAL;
@@ -22,7 +22,8 @@ trusted_get(struct dentry *dentry, const char *name, void *buffer, size_t size,
 
 static int
 trusted_set(struct dentry *dentry, const char *name, const void *buffer,
-	    size_t size, int flags, int handler_flags)
+	    size_t size, int flags,
+	    const struct xattr_handler *handler)
 {
 	if (strlen(name) < sizeof(XATTR_TRUSTED_PREFIX))
 		return -EINVAL;
@@ -34,7 +35,8 @@ trusted_set(struct dentry *dentry, const char *name, const void *buffer,
 }
 
 static size_t trusted_list(struct dentry *dentry, char *list, size_t list_size,
-			   const char *name, size_t name_len, int handler_flags)
+			   const char *name, size_t name_len,
+			   const struct xattr_handler *handler)
 {
 	const size_t len = name_len + 1;
 
diff --git a/fs/reiserfs/xattr_user.c b/fs/reiserfs/xattr_user.c
index d0b08d3..2c8d466 100644
--- a/fs/reiserfs/xattr_user.c
+++ b/fs/reiserfs/xattr_user.c
@@ -8,7 +8,7 @@
 
 static int
 user_get(struct dentry *dentry, const char *name, void *buffer, size_t size,
-	 int handler_flags)
+	 const struct xattr_handler *handler)
 {
 
 	if (strlen(name) < sizeof(XATTR_USER_PREFIX))
@@ -20,7 +20,8 @@ user_get(struct dentry *dentry, const char *name, void *buffer, size_t size,
 
 static int
 user_set(struct dentry *dentry, const char *name, const void *buffer,
-	 size_t size, int flags, int handler_flags)
+	 size_t size, int flags,
+	 const struct xattr_handler *handler)
 {
 	if (strlen(name) < sizeof(XATTR_USER_PREFIX))
 		return -EINVAL;
@@ -31,7 +32,8 @@ user_set(struct dentry *dentry, const char *name, const void *buffer,
 }
 
 static size_t user_list(struct dentry *dentry, char *list, size_t list_size,
-			const char *name, size_t name_len, int handler_flags)
+			const char *name, size_t name_len,
+			const struct xattr_handler *handler)
 {
 	const size_t len = name_len + 1;
 
diff --git a/fs/squashfs/xattr.c b/fs/squashfs/xattr.c
index e5e0ddf..05ef4b9 100644
--- a/fs/squashfs/xattr.c
+++ b/fs/squashfs/xattr.c
@@ -69,7 +69,7 @@ ssize_t squashfs_listxattr(struct dentry *d, char *buffer,
 		handler = squashfs_xattr_handler(le16_to_cpu(entry.type));
 		if (handler)
 			prefix_size = handler->list(d, buffer, rest, NULL,
-				name_size, handler->flags);
+				name_size, handler);
 		if (prefix_size) {
 			if (buffer) {
 				if (prefix_size + name_size + 1 > rest) {
@@ -216,7 +216,7 @@ failed:
  * User namespace support
  */
 static size_t squashfs_user_list(struct dentry *d, char *list, size_t list_size,
-	const char *name, size_t name_len, int type)
+	const char *name, size_t name_len, const struct xattr_handler *handler)
 {
 	if (list && XATTR_USER_PREFIX_LEN <= list_size)
 		memcpy(list, XATTR_USER_PREFIX, XATTR_USER_PREFIX_LEN);
@@ -224,7 +224,7 @@ static size_t squashfs_user_list(struct dentry *d, char *list, size_t list_size,
 }
 
 static int squashfs_user_get(struct dentry *d, const char *name, void *buffer,
-	size_t size, int type)
+	size_t size, const struct xattr_handler *handler)
 {
 	if (name[0] == '\0')
 		return  -EINVAL;
@@ -243,7 +243,8 @@ static const struct xattr_handler squashfs_xattr_user_handler = {
  * Trusted namespace support
  */
 static size_t squashfs_trusted_list(struct dentry *d, char *list,
-	size_t list_size, const char *name, size_t name_len, int type)
+	size_t list_size, const char *name, size_t name_len,
+	const struct xattr_handler *handler)
 {
 	if (!capable(CAP_SYS_ADMIN))
 		return 0;
@@ -254,7 +255,7 @@ static size_t squashfs_trusted_list(struct dentry *d, char *list,
 }
 
 static int squashfs_trusted_get(struct dentry *d, const char *name,
-	void *buffer, size_t size, int type)
+	void *buffer, size_t size, const struct xattr_handler *handler)
 {
 	if (name[0] == '\0')
 		return  -EINVAL;
@@ -273,7 +274,8 @@ static const struct xattr_handler squashfs_xattr_trusted_handler = {
  * Security namespace support
  */
 static size_t squashfs_security_list(struct dentry *d, char *list,
-	size_t list_size, const char *name, size_t name_len, int type)
+	size_t list_size, const char *name, size_t name_len,
+	const struct xattr_handler *handler)
 {
 	if (list && XATTR_SECURITY_PREFIX_LEN <= list_size)
 		memcpy(list, XATTR_SECURITY_PREFIX, XATTR_SECURITY_PREFIX_LEN);
@@ -281,7 +283,7 @@ static size_t squashfs_security_list(struct dentry *d, char *list,
 }
 
 static int squashfs_security_get(struct dentry *d, const char *name,
-	void *buffer, size_t size, int type)
+	void *buffer, size_t size, const struct xattr_handler *handler)
 {
 	if (name[0] == '\0')
 		return  -EINVAL;
diff --git a/fs/xattr.c b/fs/xattr.c
index 072fee1..efa16ce 100644
--- a/fs/xattr.c
+++ b/fs/xattr.c
@@ -720,7 +720,7 @@ generic_getxattr(struct dentry *dentry, const char *name, void *buffer, size_t s
 	handler = xattr_resolve_name(dentry->d_sb->s_xattr, &name);
 	if (!handler)
 		return -EOPNOTSUPP;
-	return handler->get(dentry, name, buffer, size, handler->flags);
+	return handler->get(dentry, name, buffer, size, handler);
 }
 
 /*
@@ -736,14 +736,14 @@ generic_listxattr(struct dentry *dentry, char *buffer, size_t buffer_size)
 	if (!buffer) {
 		for_each_xattr_handler(handlers, handler) {
 			size += handler->list(dentry, NULL, 0, NULL, 0,
-					      handler->flags);
+					      handler);
 		}
 	} else {
 		char *buf = buffer;
 
 		for_each_xattr_handler(handlers, handler) {
 			size = handler->list(dentry, buf, buffer_size,
-					     NULL, 0, handler->flags);
+					     NULL, 0, handler);
 			if (size > buffer_size)
 				return -ERANGE;
 			buf += size;
@@ -767,7 +767,7 @@ generic_setxattr(struct dentry *dentry, const char *name, const void *value, siz
 	handler = xattr_resolve_name(dentry->d_sb->s_xattr, &name);
 	if (!handler)
 		return -EOPNOTSUPP;
-	return handler->set(dentry, name, value, size, flags, handler->flags);
+	return handler->set(dentry, name, value, size, flags, handler);
 }
 
 /*
@@ -783,7 +783,7 @@ generic_removexattr(struct dentry *dentry, const char *name)
 	if (!handler)
 		return -EOPNOTSUPP;
 	return handler->set(dentry, name, NULL, 0,
-			    XATTR_REPLACE, handler->flags);
+			    XATTR_REPLACE, handler);
 }
 
 EXPORT_SYMBOL(generic_getxattr);
diff --git a/fs/xfs/xfs_xattr.c b/fs/xfs/xfs_xattr.c
index c0368151..9dace13 100644
--- a/fs/xfs/xfs_xattr.c
+++ b/fs/xfs/xfs_xattr.c
@@ -33,8 +33,10 @@
 
 static int
 xfs_xattr_get(struct dentry *dentry, const char *name,
-		void *value, size_t size, int xflags)
+		void *value, size_t size,
+		const struct xattr_handler *handler)
 {
+	int xflags = handler->flags;
 	struct xfs_inode *ip = XFS_I(d_inode(dentry));
 	int error, asize = size;
 
@@ -55,8 +57,10 @@ xfs_xattr_get(struct dentry *dentry, const char *name,
 
 static int
 xfs_xattr_set(struct dentry *dentry, const char *name, const void *value,
-		size_t size, int flags, int xflags)
+		size_t size, int flags,
+		const struct xattr_handler *handler)
 {
+	int xflags = handler->flags;
 	struct xfs_inode *ip = XFS_I(d_inode(dentry));
 
 	if (strcmp(name, "") == 0)
diff --git a/include/linux/xattr.h b/include/linux/xattr.h
index 91b0a68..8fd287d 100644
--- a/include/linux/xattr.h
+++ b/include/linux/xattr.h
@@ -21,13 +21,14 @@ struct dentry;
 
 struct xattr_handler {
 	const char *prefix;
-	int flags;	/* fs private flags passed back to the handlers */
+	int flags;      /* fs private flags */
 	size_t (*list)(struct dentry *dentry, char *list, size_t list_size,
-		       const char *name, size_t name_len, int handler_flags);
+		       const char *name, size_t name_len,
+		       const struct xattr_handler *);
 	int (*get)(struct dentry *dentry, const char *name, void *buffer,
-		   size_t size, int handler_flags);
+		   size_t size, const struct xattr_handler *);
 	int (*set)(struct dentry *dentry, const char *name, const void *buffer,
-		   size_t size, int flags, int handler_flags);
+		   size_t size, int flags, const struct xattr_handler *);
 };
 
 struct xattr {
-- 
2.4.3
