Received: from szxga01-in.huawei.com ([58.251.152.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZYWeM-0007q6-4i
 for linux-mtd@lists.infradead.org; Sun, 06 Sep 2015 09:54:17 +0000
From: Sheng Yong <shengyong1@huawei.com>
To: <dedekind1@gmail.com>, <richard.weinberger@gmail.com>, <agruen@suse.de>
CC: <linux-mtd@lists.infradead.org>, <yangds.fnst@cn.fujitsu.com>,
 <linux-fsdevel@vger.kernel.org>
Subject: [RFC PATCH v2 1/3] UBIFS: xattr: add generic helper functions for
 set/get xattr
Date: Sun, 6 Sep 2015 17:40:19 +0000
Message-ID: <1441561221-18899-2-git-send-email-shengyong1@huawei.com>
In-Reply-To: <1441561221-18899-1-git-send-email-shengyong1@huawei.com>
References: <1441561221-18899-1-git-send-email-shengyong1@huawei.com>
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

ACL depends on xattr. In order to setting and getting ACL value, generic
functions for setting and getting xattr are needed.

Signed-off-by: Sheng Yong <shengyong1@huawei.com>
---
 fs/ubifs/ubifs.h |  4 ++++
 fs/ubifs/xattr.c | 51 ++++++++++++++++++++++++++++++++-------------------
 2 files changed, 36 insertions(+), 19 deletions(-)

diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index de75902..62aa1a5 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1754,6 +1754,10 @@ int ubifs_getattr(struct vfsmount *mnt, struct dentry *dentry,
 		  struct kstat *stat);
 
 /* xattr.c */
+int ubifs_do_setxattr(struct inode *inode, const char *name,
+		      const void *value, size_t size, int flags);
+ssize_t ubifs_do_getxattr(struct inode *inode, const char *name,
+			  void *value, size_t size);
 int ubifs_setxattr(struct dentry *dentry, const char *name,
 		   const void *value, size_t size, int flags);
 ssize_t ubifs_getxattr(struct dentry *dentry, const char *name, void *buf,
diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index fd65b3f..6534b98 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -299,25 +299,21 @@ static struct inode *iget_xattr(struct ubifs_info *c, ino_t inum)
 	return ERR_PTR(-EINVAL);
 }
 
-static int setxattr(struct inode *host, const char *name, const void *value,
-		    size_t size, int flags)
+int ubifs_do_setxattr(struct inode *host, const char *name,
+		      const void *value, size_t size, int flags)
 {
 	struct inode *inode;
 	struct ubifs_info *c = host->i_sb->s_fs_info;
 	struct qstr nm = QSTR_INIT(name, strlen(name));
 	struct ubifs_dent_node *xent;
 	union ubifs_key key;
-	int err, type;
+	int err;
 
 	ubifs_assert(mutex_is_locked(&host->i_mutex));
 
 	if (size > UBIFS_MAX_INO_DATA)
 		return -ERANGE;
 
-	type = check_namespace(&nm);
-	if (type < 0)
-		return type;
-
 	xent = kmalloc(UBIFS_MAX_XENT_NODE_SZ, GFP_NOFS);
 	if (!xent)
 		return -ENOMEM;
@@ -363,16 +359,23 @@ out_free:
 int ubifs_setxattr(struct dentry *dentry, const char *name,
 		   const void *value, size_t size, int flags)
 {
+	struct qstr nm = QSTR_INIT(name, strlen(name));
+	int type;
+
 	dbg_gen("xattr '%s', host ino %lu ('%pd'), size %zd",
 		name, d_inode(dentry)->i_ino, dentry, size);
 
-	return setxattr(d_inode(dentry), name, value, size, flags);
+	type = check_namespace(&nm);
+	if (type < 0)
+		return type;
+
+	return ubifs_do_setxattr(d_inode(dentry), name, value, size, flags);
 }
 
-ssize_t ubifs_getxattr(struct dentry *dentry, const char *name, void *buf,
-		       size_t size)
+ssize_t ubifs_do_getxattr(struct inode *host, const char *name,
+			  void *buf, size_t size)
 {
-	struct inode *inode, *host = d_inode(dentry);
+	struct inode *inode;
 	struct ubifs_info *c = host->i_sb->s_fs_info;
 	struct qstr nm = QSTR_INIT(name, strlen(name));
 	struct ubifs_inode *ui;
@@ -380,13 +383,6 @@ ssize_t ubifs_getxattr(struct dentry *dentry, const char *name, void *buf,
 	union ubifs_key key;
 	int err;
 
-	dbg_gen("xattr '%s', ino %lu ('%pd'), buf size %zd", name,
-		host->i_ino, dentry, size);
-
-	err = check_namespace(&nm);
-	if (err < 0)
-		return err;
-
 	xent = kmalloc(UBIFS_MAX_XENT_NODE_SZ, GFP_NOFS);
 	if (!xent)
 		return -ENOMEM;
@@ -429,6 +425,22 @@ out_unlock:
 	return err;
 }
 
+ssize_t ubifs_getxattr(struct dentry *dentry, const char *name,
+		       void *value, size_t size)
+{
+	struct qstr nm = QSTR_INIT(name, strlen(name));
+	int type;
+
+	dbg_gen("xattr '%s', ino %lu ('%pd'), buf size %zd", name,
+		d_inode(dentry)->i_ino, dentry, size);
+
+	type = check_namespace(&nm);
+	if (type < 0)
+		return type;
+
+	return ubifs_do_getxattr(d_inode(dentry), name, value, size);
+}
+
 ssize_t ubifs_listxattr(struct dentry *dentry, char *buffer, size_t size)
 {
 	union ubifs_key key;
@@ -638,7 +650,8 @@ static int init_xattrs(struct inode *inode, const struct xattr *xattr_array,
 		}
 		strcpy(name, XATTR_SECURITY_PREFIX);
 		strcpy(name + XATTR_SECURITY_PREFIX_LEN, xattr->name);
-		err = setxattr(inode, name, xattr->value, xattr->value_len, 0);
+		err = ubifs_do_setxattr(inode, name, xattr->value,
+					xattr->value_len, 0);
 		kfree(name);
 		if (err < 0)
 			break;
-- 
1.9.1
