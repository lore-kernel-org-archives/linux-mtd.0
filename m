Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bxZGO-0004II-1x
 for linux-mtd@lists.infradead.org; Fri, 21 Oct 2016 12:49:36 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dedekind1@gmail.com, adrian.hunter@intel.com, tytso@mit.edu,
 jaegeuk@kernel.org, david@sigma-star.at, wd@denx.de, sbabic@denx.de,
 dengler@linutronix.de, Richard Weinberger <richard@nod.at>
Subject: [PATCH 04/26] ubifs: Export xattr get and set functions
Date: Fri, 21 Oct 2016 14:48:19 +0200
Message-Id: <1477054121-10198-5-git-send-email-richard@nod.at>
In-Reply-To: <1477054121-10198-1-git-send-email-richard@nod.at>
References: <1477054121-10198-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

For fscrypto we need this function outside of xattr.c.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/ubifs.h |  4 ++++
 fs/ubifs/xattr.c | 35 ++++++++++++++++++-----------------
 2 files changed, 22 insertions(+), 17 deletions(-)

diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index f7d649eb61d5..94c1f5563c01 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1738,6 +1738,10 @@ extern const struct xattr_handler *ubifs_xattr_handlers[];
 ssize_t ubifs_listxattr(struct dentry *dentry, char *buffer, size_t size);
 int ubifs_init_security(struct inode *dentry, struct inode *inode,
 			const struct qstr *qstr);
+int ubifs_xattr_set(struct inode *host, const char *name, const void *value,
+		    size_t size, int flags);
+ssize_t ubifs_xattr_get(struct inode *host, const char *name, void *buf,
+			size_t size);
 
 /* super.c */
 struct inode *ubifs_iget(struct super_block *sb, unsigned long inum);
diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index 11a004114eba..ad4463752709 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -266,8 +266,8 @@ static struct inode *iget_xattr(struct ubifs_info *c, ino_t inum)
 	return ERR_PTR(-EINVAL);
 }
 
-static int __ubifs_setxattr(struct inode *host, const char *name,
-			    const void *value, size_t size, int flags)
+int ubifs_xattr_set(struct inode *host, const char *name, const void *value,
+		    size_t size, int flags)
 {
 	struct inode *inode;
 	struct ubifs_info *c = host->i_sb->s_fs_info;
@@ -326,8 +326,8 @@ out_free:
 	return err;
 }
 
-static ssize_t __ubifs_getxattr(struct inode *host, const char *name,
-				void *buf, size_t size)
+ssize_t ubifs_xattr_get(struct inode *host, const char *name, void *buf,
+			size_t size)
 {
 	struct inode *inode;
 	struct ubifs_info *c = host->i_sb->s_fs_info;
@@ -482,7 +482,7 @@ out_cancel:
 	return err;
 }
 
-static int __ubifs_removexattr(struct inode *host, const char *name)
+static int ubifs_xattr_remove(struct inode *host, const char *name)
 {
 	struct inode *inode;
 	struct ubifs_info *c = host->i_sb->s_fs_info;
@@ -544,7 +544,8 @@ static int init_xattrs(struct inode *inode, const struct xattr *xattr_array,
 		}
 		strcpy(name, XATTR_SECURITY_PREFIX);
 		strcpy(name + XATTR_SECURITY_PREFIX_LEN, xattr->name);
-		err = __ubifs_setxattr(inode, name, xattr->value, xattr->value_len, 0);
+		err = ubifs_xattr_set(inode, name, xattr->value,
+				      xattr->value_len, 0);
 		kfree(name);
 		if (err < 0)
 			break;
@@ -568,7 +569,7 @@ int ubifs_init_security(struct inode *dentry, struct inode *inode,
 	return err;
 }
 
-static int ubifs_xattr_get(const struct xattr_handler *handler,
+static int xattr_get(const struct xattr_handler *handler,
 			   struct dentry *dentry, struct inode *inode,
 			   const char *name, void *buffer, size_t size)
 {
@@ -576,10 +577,10 @@ static int ubifs_xattr_get(const struct xattr_handler *handler,
 		inode->i_ino, dentry, size);
 
 	name = xattr_full_name(handler, name);
-	return __ubifs_getxattr(inode, name, buffer, size);
+	return ubifs_xattr_get(inode, name, buffer, size);
 }
 
-static int ubifs_xattr_set(const struct xattr_handler *handler,
+static int xattr_set(const struct xattr_handler *handler,
 			   struct dentry *dentry, struct inode *inode,
 			   const char *name, const void *value,
 			   size_t size, int flags)
@@ -590,27 +591,27 @@ static int ubifs_xattr_set(const struct xattr_handler *handler,
 	name = xattr_full_name(handler, name);
 
 	if (value)
-		return __ubifs_setxattr(inode, name, value, size, flags);
+		return ubifs_xattr_set(inode, name, value, size, flags);
 	else
-		return __ubifs_removexattr(inode, name);
+		return ubifs_xattr_remove(inode, name);
 }
 
 static const struct xattr_handler ubifs_user_xattr_handler = {
 	.prefix = XATTR_USER_PREFIX,
-	.get = ubifs_xattr_get,
-	.set = ubifs_xattr_set,
+	.get = xattr_get,
+	.set = xattr_set,
 };
 
 static const struct xattr_handler ubifs_trusted_xattr_handler = {
 	.prefix = XATTR_TRUSTED_PREFIX,
-	.get = ubifs_xattr_get,
-	.set = ubifs_xattr_set,
+	.get = xattr_get,
+	.set = xattr_set,
 };
 
 static const struct xattr_handler ubifs_security_xattr_handler = {
 	.prefix = XATTR_SECURITY_PREFIX,
-	.get = ubifs_xattr_get,
-	.set = ubifs_xattr_set,
+	.get = xattr_get,
+	.set = xattr_set,
 };
 
 const struct xattr_handler *ubifs_xattr_handlers[] = {
-- 
2.7.3
