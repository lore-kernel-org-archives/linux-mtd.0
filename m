Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U5ZUu-00012y-3C
 for linux-mtd@lists.infradead.org; Wed, 13 Feb 2013 10:23:29 +0000
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH RFC 3/5] UBIFS: Add xattr support for symlinks
Date: Wed, 13 Feb 2013 11:23:16 +0100
Message-Id: <1360750998-15191-4-git-send-email-mkl@pengutronix.de>
In-Reply-To: <1360750998-15191-1-git-send-email-mkl@pengutronix.de>
References: <1360750998-15191-1-git-send-email-mkl@pengutronix.de>
Cc: Subodh Nijsure <snijsure@grid-net.com>, artem.bityutskiy@linux.intel.com,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 Marc Kleine-Budde <mkl@pengutronix.de>, kernel@pengutronix.de
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
---
 fs/ubifs/file.c  |    4 ++++
 fs/ubifs/xattr.c |   18 +++++++++++++-----
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 5bc7781..ed9655c 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1574,6 +1574,10 @@ const struct inode_operations ubifs_symlink_inode_operations = {
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
index 1395307..d496aa4 100644
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
 
-	dbg_gen("xattr '%s', host ino %lu ('%.*s'), size %zd", name,
-		host->i_ino, dentry->d_name.len, dentry->d_name.name, size);
 	ubifs_assert(mutex_is_locked(&host->i_mutex));
 
 	if (size > UBIFS_MAX_INO_DATA)
@@ -356,6 +354,16 @@ out_free:
 	return err;
 }
 
+int ubifs_setxattr(struct dentry *dentry, const char *name,
+		     const void *value, size_t size, int flags)
+{
+	dbg_gen("xattr '%s', host ino %lu ('%.*s'), size %zd",
+		name, dentry->d_inode->i_ino, dentry->d_name.len,
+		dentry->d_name.name, size);
+
+	return __ubifs_setxattr(dentry->d_inode, name, value, size, flags);
+}
+
 ssize_t ubifs_getxattr(struct dentry *dentry, const char *name, void *buf,
 		       size_t size)
 {
-- 
1.7.10.4
