Received: from skprod3.natinst.com ([130.164.80.24] helo=ni.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XkHIU-0004PG-JL
 for linux-mtd@lists.infradead.org; Fri, 31 Oct 2014 18:51:43 +0000
From: Ben Shelton <ben.shelton@ni.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/4] UBIFS: Add security.* XATTR support for the UBIFS
Date: Fri, 31 Oct 2014 13:50:30 -0500
Message-Id: <1414781431-2911-4-git-send-email-ben.shelton@ni.com>
In-Reply-To: <1414781431-2911-1-git-send-email-ben.shelton@ni.com>
References: <1414781431-2911-1-git-send-email-ben.shelton@ni.com>
Cc: Subodh Nijsure <snijsure@grid-net.com>, dedekind1@gmail.com,
 Ben Shelton <ben.shelton@ni.com>, linux-kernel@vger.kernel.org,
 adrian.hunter@intel.com, Marc Kleine-Budde <mkl@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Subodh Nijsure <snijsure@grid-net.com>

Signed-off-by: Subodh Nijsure <snijsure@grid-net.com>
Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
Signed-off-by: Ben Shelton <ben.shelton@ni.com>
Acked-by: Brad Mouring <brad.mouring@ni.com>
Acked-by: Terry Wilcox <terry.wilcox@ni.com>
Acked-by: Gratian Crisan <gratian.crisan@ni.com>
---
 fs/ubifs/dir.c   | 20 ++++++++++++++
 fs/ubifs/super.c |  1 +
 fs/ubifs/ubifs.h |  4 +++
 fs/ubifs/xattr.c | 79 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 104 insertions(+)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index ea41649..31de1c4 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -272,6 +272,10 @@ static int ubifs_create(struct inode *dir, struct dentry *dentry, umode_t mode,
 		goto out_budg;
 	}
 
+	err = ubifs_init_security(dir, inode, &dentry->d_name);
+	if (err)
+		goto out_cancel;
+
 	mutex_lock(&dir_ui->ui_mutex);
 	dir->i_size += sz_change;
 	dir_ui->ui_size = dir->i_size;
@@ -279,6 +283,7 @@ static int ubifs_create(struct inode *dir, struct dentry *dentry, umode_t mode,
 	err = ubifs_jnl_update(c, dir, &dentry->d_name, inode, 0, 0);
 	if (err)
 		goto out_cancel;
+
 	mutex_unlock(&dir_ui->ui_mutex);
 
 	ubifs_release_budget(c, &req);
@@ -728,6 +733,10 @@ static int ubifs_mkdir(struct inode *dir, struct dentry *dentry, umode_t mode)
 		goto out_budg;
 	}
 
+	err = ubifs_init_security(dir, inode, &dentry->d_name);
+	if (err)
+		goto out_cancel;
+
 	mutex_lock(&dir_ui->ui_mutex);
 	insert_inode_hash(inode);
 	inc_nlink(inode);
@@ -740,6 +749,7 @@ static int ubifs_mkdir(struct inode *dir, struct dentry *dentry, umode_t mode)
 		ubifs_err("cannot create directory, error %d", err);
 		goto out_cancel;
 	}
+
 	mutex_unlock(&dir_ui->ui_mutex);
 
 	ubifs_release_budget(c, &req);
@@ -808,6 +818,10 @@ static int ubifs_mknod(struct inode *dir, struct dentry *dentry,
 	ui->data = dev;
 	ui->data_len = devlen;
 
+	err = ubifs_init_security(dir, inode, &dentry->d_name);
+	if (err)
+		goto out_cancel;
+
 	mutex_lock(&dir_ui->ui_mutex);
 	dir->i_size += sz_change;
 	dir_ui->ui_size = dir->i_size;
@@ -815,6 +829,7 @@ static int ubifs_mknod(struct inode *dir, struct dentry *dentry,
 	err = ubifs_jnl_update(c, dir, &dentry->d_name, inode, 0, 0);
 	if (err)
 		goto out_cancel;
+
 	mutex_unlock(&dir_ui->ui_mutex);
 
 	ubifs_release_budget(c, &req);
@@ -884,6 +899,10 @@ static int ubifs_symlink(struct inode *dir, struct dentry *dentry,
 	ui->data_len = len;
 	inode->i_size = ubifs_inode(inode)->ui_size = len;
 
+	err = ubifs_init_security(dir, inode, &dentry->d_name);
+	if (err)
+		goto out_cancel;
+
 	mutex_lock(&dir_ui->ui_mutex);
 	dir->i_size += sz_change;
 	dir_ui->ui_size = dir->i_size;
@@ -891,6 +910,7 @@ static int ubifs_symlink(struct inode *dir, struct dentry *dentry,
 	err = ubifs_jnl_update(c, dir, &dentry->d_name, inode, 0, 0);
 	if (err)
 		goto out_cancel;
+
 	mutex_unlock(&dir_ui->ui_mutex);
 
 	ubifs_release_budget(c, &req);
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 106bf20..e642067 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -2039,6 +2039,7 @@ static int ubifs_fill_super(struct super_block *sb, void *data, int silent)
 	if (c->max_inode_sz > MAX_LFS_FILESIZE)
 		sb->s_maxbytes = c->max_inode_sz = MAX_LFS_FILESIZE;
 	sb->s_op = &ubifs_super_operations;
+	sb->s_xattr = ubifs_xattr_handlers;
 
 	mutex_lock(&c->umount_mutex);
 	err = mount_ubifs(c);
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index c4fe900..bc04b9c 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -36,6 +36,7 @@
 #include <linux/mtd/ubi.h>
 #include <linux/pagemap.h>
 #include <linux/backing-dev.h>
+#include <linux/security.h>
 #include "ubifs-media.h"
 
 /* Version of this UBIFS implementation */
@@ -1465,6 +1466,7 @@ extern spinlock_t ubifs_infos_lock;
 extern atomic_long_t ubifs_clean_zn_cnt;
 extern struct kmem_cache *ubifs_inode_slab;
 extern const struct super_operations ubifs_super_operations;
+extern const struct xattr_handler *ubifs_xattr_handlers[];
 extern const struct address_space_operations ubifs_file_address_operations;
 extern const struct file_operations ubifs_file_operations;
 extern const struct inode_operations ubifs_file_inode_operations;
@@ -1754,6 +1756,8 @@ ssize_t ubifs_getxattr(struct dentry *dentry, const char *name, void *buf,
 		       size_t size);
 ssize_t ubifs_listxattr(struct dentry *dentry, char *buffer, size_t size);
 int ubifs_removexattr(struct dentry *dentry, const char *name);
+int ubifs_init_security(struct inode *dentry, struct inode *inode,
+			const struct qstr *qstr);
 
 /* super.c */
 struct inode *ubifs_iget(struct super_block *sb, unsigned long inum);
diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index d0f69c2..f844841 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -575,3 +575,82 @@ out_free:
 	kfree(xent);
 	return err;
 }
+
+size_t ubifs_security_listxattr(struct dentry *d, char *list, size_t list_size,
+				const char *name, size_t name_len, int flags)
+{
+	const int prefix_len = XATTR_SECURITY_PREFIX_LEN;
+	const size_t total_len = prefix_len + name_len + 1;
+
+	if (list && total_len <= list_size) {
+		memcpy(list, XATTR_SECURITY_PREFIX, prefix_len);
+		memcpy(list + prefix_len, name, name_len);
+		list[prefix_len + name_len] = '\0';
+	}
+
+	return total_len;
+}
+
+int ubifs_security_getxattr(struct dentry *d, const char *name,
+			    void *buffer, size_t size, int flags)
+{
+	return ubifs_getxattr(d, name, buffer, size);
+}
+
+int ubifs_security_setxattr(struct dentry *d, const char *name,
+			    const void *value, size_t size,
+			    int flags, int handler_flags)
+{
+	return ubifs_setxattr(d, name, value, size, flags);
+}
+
+struct xattr_handler ubifs_xattr_security_handler = {
+	.prefix = XATTR_SECURITY_PREFIX,
+	.list   = ubifs_security_listxattr,
+	.get    = ubifs_security_getxattr,
+	.set    = ubifs_security_setxattr,
+};
+
+const struct xattr_handler *ubifs_xattr_handlers[] = {
+	&ubifs_xattr_security_handler,
+	NULL
+};
+
+static int ubifs_initxattrs(struct inode *inode,
+			    const struct xattr *xattr_array, void *fs_info)
+{
+	const struct xattr *xattr;
+	char *name;
+	int err = 0;
+
+	for (xattr = xattr_array; xattr->name != NULL; xattr++) {
+		name = kmalloc(XATTR_SECURITY_PREFIX_LEN +
+			       strlen(xattr->name) + 1, GFP_NOFS);
+		if (!name) {
+			err = -ENOMEM;
+			break;
+		}
+		strcpy(name, XATTR_SECURITY_PREFIX);
+		strcpy(name + XATTR_SECURITY_PREFIX_LEN, xattr->name);
+		err = __ubifs_setxattr(inode, name, xattr->value,
+				       xattr->value_len, 0);
+		kfree(name);
+		if (err < 0)
+			break;
+	}
+
+	return err;
+}
+
+int ubifs_init_security(struct inode *dentry, struct inode *inode,
+			const struct qstr *qstr)
+{
+	int err;
+
+	mutex_lock(&inode->i_mutex);
+	err = security_inode_init_security(inode, dentry, qstr,
+					   &ubifs_initxattrs, 0);
+	mutex_unlock(&inode->i_mutex);
+
+	return err;
+}
-- 
2.1.1
