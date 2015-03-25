Received: from szxga01-in.huawei.com ([58.251.152.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YajmL-0002X1-KW
 for linux-mtd@lists.infradead.org; Wed, 25 Mar 2015 11:47:23 +0000
From: Sheng Yong <shengyong1@huawei.com>
To: <dedekind1@gmail.com>, <adrian.hunter@intel.com>
Subject: [RFC PATCH 1/3] UBIFS: xattr: splite generic set/get xattr functions
 from ubifs_set/getxattr
Date: Wed, 25 Mar 2015 11:46:03 +0000
Message-ID: <1427283965-86137-2-git-send-email-shengyong1@huawei.com>
In-Reply-To: <1427283965-86137-1-git-send-email-shengyong1@huawei.com>
References: <1427283965-86137-1-git-send-email-shengyong1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: miaoxie@huawei.com, linux-mtd@lists.infradead.org, hujianyang@huawei.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Splite generic set/get xattr functions from ubifs_set/getxattr. Add them
to ubifs.h so that functions outside xattr.c can use them. Because ACL is
implemented based on xattr, this is a preparation for later ACL patchset.

Signed-off-by: Sheng Yong <shengyong1@huawei.com>
---
 fs/ubifs/ubifs.h |  2 ++
 fs/ubifs/xattr.c | 25 ++++++++++++++++---------
 2 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index bc04b9c..2cb4297 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1758,6 +1758,8 @@ ssize_t ubifs_listxattr(struct dentry *dentry, char *buffer, size_t size);
 int ubifs_removexattr(struct dentry *dentry, const char *name);
 int ubifs_init_security(struct inode *dentry, struct inode *inode,
 			const struct qstr *qstr);
+int __ubifs_setxattr(struct inode *, const char *, const void *, size_t, int);
+ssize_t __ubifs_getxattr(struct inode *, const char *, void *, size_t);
 
 /* super.c */
 struct inode *ubifs_iget(struct super_block *sb, unsigned long inum);
diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index a92be24..c11c1f6 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -299,7 +299,7 @@ static struct inode *iget_xattr(struct ubifs_info *c, ino_t inum)
 	return ERR_PTR(-EINVAL);
 }
 
-static int setxattr(struct inode *host, const char *name, const void *value,
+int __ubifs_setxattr(struct inode *host, const char *name, const void *value,
 		    size_t size, int flags)
 {
 	struct inode *inode;
@@ -366,13 +366,13 @@ int ubifs_setxattr(struct dentry *dentry, const char *name,
 	dbg_gen("xattr '%s', host ino %lu ('%pd'), size %zd",
 		name, dentry->d_inode->i_ino, dentry, size);
 
-	return setxattr(dentry->d_inode, name, value, size, flags);
+	return __ubifs_setxattr(dentry->d_inode, name, value, size, flags);
 }
 
-ssize_t ubifs_getxattr(struct dentry *dentry, const char *name, void *buf,
-		       size_t size)
+ssize_t __ubifs_getxattr(struct inode *host, const char *name, void *buf,
+			size_t size)
 {
-	struct inode *inode, *host = dentry->d_inode;
+	struct inode *inode;
 	struct ubifs_info *c = host->i_sb->s_fs_info;
 	struct qstr nm = QSTR_INIT(name, strlen(name));
 	struct ubifs_inode *ui;
@@ -380,9 +380,6 @@ ssize_t ubifs_getxattr(struct dentry *dentry, const char *name, void *buf,
 	union ubifs_key key;
 	int err;
 
-	dbg_gen("xattr '%s', ino %lu ('%pd'), buf size %zd", name,
-		host->i_ino, dentry, size);
-
 	err = check_namespace(&nm);
 	if (err < 0)
 		return err;
@@ -429,6 +426,15 @@ out_unlock:
 	return err;
 }
 
+ssize_t ubifs_getxattr(struct dentry *dentry, const char *name, void *buf,
+		       size_t size)
+{
+	dbg_gen("xattr '%s', ino %lu ('%pd'), buf size %zd", name,
+		dentry->d_inode->i_ino, dentry, size);
+
+	return __ubifs_getxattr(dentry->d_inode, name, buf, size);
+}
+
 ssize_t ubifs_listxattr(struct dentry *dentry, char *buffer, size_t size)
 {
 	union ubifs_key key;
@@ -638,7 +644,8 @@ static int init_xattrs(struct inode *inode, const struct xattr *xattr_array,
 		}
 		strcpy(name, XATTR_SECURITY_PREFIX);
 		strcpy(name + XATTR_SECURITY_PREFIX_LEN, xattr->name);
-		err = setxattr(inode, name, xattr->value, xattr->value_len, 0);
+		err = __ubifs_setxattr(inode, name, xattr->value,
+				       xattr->value_len, 0);
 		kfree(name);
 		if (err < 0)
 			break;
-- 
1.8.3.4
