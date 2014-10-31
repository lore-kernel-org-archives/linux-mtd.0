Received: from skprod2.natinst.com ([130.164.80.23] helo=ni.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XkHIJ-0008F3-7J
 for linux-mtd@lists.infradead.org; Fri, 31 Oct 2014 18:51:31 +0000
From: Ben Shelton <ben.shelton@ni.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/4] UBIFS: Add xattr support for symlinks
Date: Fri, 31 Oct 2014 13:50:29 -0500
Message-Id: <1414781431-2911-3-git-send-email-ben.shelton@ni.com>
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
Acked-by: Terry Wilcox <terry.wilcox@ni.com>
Acked-by: Gratian Crisan <gratian.crisan@ni.com>
---
 fs/ubifs/file.c  |  4 ++++
 fs/ubifs/xattr.c | 17 ++++++++++++-----
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index b5b593c..4a1d4cf 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1573,6 +1573,10 @@ const struct inode_operations ubifs_symlink_inode_operations = {
 	.follow_link = ubifs_follow_link,
 	.setattr     = ubifs_setattr,
 	.getattr     = ubifs_getattr,
+	.setxattr    = ubifs_setxattr,
+	.getxattr    = ubifs_getxattr,
+	.listxattr   = ubifs_listxattr,
+	.removexattr = ubifs_removexattr,
 };
 
 const struct file_operations ubifs_file_operations = {
diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index 5e0a63b..d0f69c2 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -293,18 +293,16 @@ static struct inode *iget_xattr(struct ubifs_info *c, ino_t inum)
 	return ERR_PTR(-EINVAL);
 }
 
-int ubifs_setxattr(struct dentry *dentry, const char *name,
-		   const void *value, size_t size, int flags)
+static int __ubifs_setxattr(struct inode *host, const char *name,
+			    const void *value, size_t size, int flags)
 {
-	struct inode *inode, *host = dentry->d_inode;
+	struct inode *inode;
 	struct ubifs_info *c = host->i_sb->s_fs_info;
 	struct qstr nm = QSTR_INIT(name, strlen(name));
 	struct ubifs_dent_node *xent;
 	union ubifs_key key;
 	int err, type;
 
-	dbg_gen("xattr '%s', host ino %lu ('%pd'), size %zd", name,
-		host->i_ino, dentry, size);
 	ubifs_assert(mutex_is_locked(&host->i_mutex));
 
 	if (size > UBIFS_MAX_INO_DATA)
@@ -356,6 +354,15 @@ out_free:
 	return err;
 }
 
+int ubifs_setxattr(struct dentry *dentry, const char *name,
+		   const void *value, size_t size, int flags)
+{
+	dbg_gen("xattr '%s', host ino %lu ('%pd'), size %zd",
+		name, dentry->d_inode->i_ino, dentry, size);
+
+	return __ubifs_setxattr(dentry->d_inode, name, value, size, flags);
+}
+
 ssize_t ubifs_getxattr(struct dentry *dentry, const char *name, void *buf,
 		       size_t size)
 {
-- 
2.1.1
