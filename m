Received: from mail-wi0-x241.google.com ([2a00:1450:400c:c05::241])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZXpcw-0000gi-JR
 for linux-mtd@lists.infradead.org; Fri, 04 Sep 2015 11:57:55 +0000
Received: by wiku15 with SMTP id u15so2796508wik.1
 for <linux-mtd@lists.infradead.org>; Fri, 04 Sep 2015 04:57:32 -0700 (PDT)
From: Andreas Gruenbacher <andreas.gruenbacher@gmail.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>,
 Eric Van Hensbergen <ericvh@gmail.com>, Ron Minnich <rminnich@sandia.gov>,
 Latchesar Ionkov <lucho@ionkov.net>, v9fs-developer@lists.sourceforge.net
Subject: [PATCH 2/5] hfsplus: Remove unused xattr handler list operations
Date: Fri,  4 Sep 2015 13:57:19 +0200
Message-Id: <1441367842-25079-3-git-send-email-agruenba@redhat.com>
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

The list operations can never be called; they are even documented to be unused.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/hfsplus/xattr.c          | 11 -----------
 fs/hfsplus/xattr_security.c | 11 -----------
 fs/hfsplus/xattr_trusted.c  | 11 -----------
 fs/hfsplus/xattr_user.c     | 11 -----------
 4 files changed, 44 deletions(-)

diff --git a/fs/hfsplus/xattr.c b/fs/hfsplus/xattr.c
index 416b1db..e898499 100644
--- a/fs/hfsplus/xattr.c
+++ b/fs/hfsplus/xattr.c
@@ -893,19 +893,8 @@ static int hfsplus_osx_setxattr(struct dentry *dentry, const char *name,
 	return __hfsplus_setxattr(d_inode(dentry), name, buffer, size, flags);
 }
 
-static size_t hfsplus_osx_listxattr(struct dentry *dentry, char *list,
-		size_t list_size, const char *name, size_t name_len, int type)
-{
-	/*
-	 * This method is not used.
-	 * It is used hfsplus_listxattr() instead of generic_listxattr().
-	 */
-	return -EOPNOTSUPP;
-}
-
 const struct xattr_handler hfsplus_xattr_osx_handler = {
 	.prefix	= XATTR_MAC_OSX_PREFIX,
-	.list	= hfsplus_osx_listxattr,
 	.get	= hfsplus_osx_getxattr,
 	.set	= hfsplus_osx_setxattr,
 };
diff --git a/fs/hfsplus/xattr_security.c b/fs/hfsplus/xattr_security.c
index aacff00..024e61c 100644
--- a/fs/hfsplus/xattr_security.c
+++ b/fs/hfsplus/xattr_security.c
@@ -29,16 +29,6 @@ static int hfsplus_security_setxattr(struct dentry *dentry, const char *name,
 				XATTR_SECURITY_PREFIX_LEN);
 }
 
-static size_t hfsplus_security_listxattr(struct dentry *dentry, char *list,
-		size_t list_size, const char *name, size_t name_len, int type)
-{
-	/*
-	 * This method is not used.
-	 * It is used hfsplus_listxattr() instead of generic_listxattr().
-	 */
-	return -EOPNOTSUPP;
-}
-
 static int hfsplus_initxattrs(struct inode *inode,
 				const struct xattr *xattr_array,
 				void *fs_info)
@@ -92,7 +82,6 @@ int hfsplus_init_inode_security(struct inode *inode,
 
 const struct xattr_handler hfsplus_xattr_security_handler = {
 	.prefix	= XATTR_SECURITY_PREFIX,
-	.list	= hfsplus_security_listxattr,
 	.get	= hfsplus_security_getxattr,
 	.set	= hfsplus_security_setxattr,
 };
diff --git a/fs/hfsplus/xattr_trusted.c b/fs/hfsplus/xattr_trusted.c
index bcf6508..6186157 100644
--- a/fs/hfsplus/xattr_trusted.c
+++ b/fs/hfsplus/xattr_trusted.c
@@ -26,19 +26,8 @@ static int hfsplus_trusted_setxattr(struct dentry *dentry, const char *name,
 				XATTR_TRUSTED_PREFIX, XATTR_TRUSTED_PREFIX_LEN);
 }
 
-static size_t hfsplus_trusted_listxattr(struct dentry *dentry, char *list,
-		size_t list_size, const char *name, size_t name_len, int type)
-{
-	/*
-	 * This method is not used.
-	 * It is used hfsplus_listxattr() instead of generic_listxattr().
-	 */
-	return -EOPNOTSUPP;
-}
-
 const struct xattr_handler hfsplus_xattr_trusted_handler = {
 	.prefix	= XATTR_TRUSTED_PREFIX,
-	.list	= hfsplus_trusted_listxattr,
 	.get	= hfsplus_trusted_getxattr,
 	.set	= hfsplus_trusted_setxattr,
 };
diff --git a/fs/hfsplus/xattr_user.c b/fs/hfsplus/xattr_user.c
index 5aa0e6d..3b4caba 100644
--- a/fs/hfsplus/xattr_user.c
+++ b/fs/hfsplus/xattr_user.c
@@ -26,19 +26,8 @@ static int hfsplus_user_setxattr(struct dentry *dentry, const char *name,
 				XATTR_USER_PREFIX, XATTR_USER_PREFIX_LEN);
 }
 
-static size_t hfsplus_user_listxattr(struct dentry *dentry, char *list,
-		size_t list_size, const char *name, size_t name_len, int type)
-{
-	/*
-	 * This method is not used.
-	 * It is used hfsplus_listxattr() instead of generic_listxattr().
-	 */
-	return -EOPNOTSUPP;
-}
-
 const struct xattr_handler hfsplus_xattr_user_handler = {
 	.prefix	= XATTR_USER_PREFIX,
-	.list	= hfsplus_user_listxattr,
 	.get	= hfsplus_user_getxattr,
 	.set	= hfsplus_user_setxattr,
 };
-- 
2.4.3
