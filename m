From: <xiaolei.li@mediatek.com>
To: <richard@nod.at>, <dedekind1@gmail.com>
CC: <adrian.hunter@intel.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <xiaolei.li@mediatek.com>
Subject: [PATCH] ubifs: Massage assert in ubifs_xattr_set() wrt. init_xattrs
Date: Fri, 23 Jun 2017 10:37:23 +0800
Message-ID: <1498185443-65378-1-git-send-email-xiaolei.li@mediatek.com>
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

From: Xiaolei Li <xiaolei.li@mediatek.com>

The inode is not locked in init_xattrs when creating a new inode.

Without this patch, there will occurs assert when booting or creating
a new file, if the kernel config CONFIG_SECURITY_SMACK is enabled.

Log likes:

UBIFS assert failed in ubifs_xattr_set at 298 (pid 1156)
CPU: 1 PID: 1156 Comm: ldconfig Tainted: G S 4.12.0-rc1-207440-g1e70b02 #2
Hardware name: MediaTek MT2712 evaluation board (DT)
Call trace:
[<ffff000008088538>] dump_backtrace+0x0/0x238
[<ffff000008088834>] show_stack+0x14/0x20
[<ffff0000083d98d4>] dump_stack+0x9c/0xc0
[<ffff00000835d524>] ubifs_xattr_set+0x374/0x5e0
[<ffff00000835d7ec>] init_xattrs+0x5c/0xb8
[<ffff000008385788>] security_inode_init_security+0x110/0x190
[<ffff00000835e058>] ubifs_init_security+0x30/0x68
[<ffff00000833ada0>] ubifs_mkdir+0x100/0x200
[<ffff00000820669c>] vfs_mkdir+0x11c/0x1b8
[<ffff00000820b73c>] SyS_mkdirat+0x74/0xd0
[<ffff000008082f8c>] __sys_trace_return+0x0/0x4

Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>
---
 fs/ubifs/crypto.c |  7 ++++++-
 fs/ubifs/ubifs.h  |  2 +-
 fs/ubifs/xattr.c  | 17 ++++++++---------
 3 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/fs/ubifs/crypto.c b/fs/ubifs/crypto.c
index 382ed42..114ba45 100644
--- a/fs/ubifs/crypto.c
+++ b/fs/ubifs/crypto.c
@@ -9,8 +9,13 @@ static int ubifs_crypt_get_context(struct inode *inode, void *ctx, size_t len)
 static int ubifs_crypt_set_context(struct inode *inode, const void *ctx,
 				   size_t len, void *fs_data)
 {
+	/*
+	 * Creating an encryption context is done unlocked since we
+	 * operate on a new inode which is not visible to other users
+	 * at this point. So, no need to check whether inode is locked.
+	 */
 	return ubifs_xattr_set(inode, UBIFS_XATTR_NAME_ENCRYPTION_CONTEXT,
-			       ctx, len, 0);
+			       ctx, len, 0, false);
 }
 
 static bool ubifs_crypt_empty_dir(struct inode *inode)
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 298b4d8..1676856 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1754,7 +1754,7 @@ int ubifs_getattr(const struct path *path, struct kstat *stat,
 extern const struct xattr_handler *ubifs_xattr_handlers[];
 ssize_t ubifs_listxattr(struct dentry *dentry, char *buffer, size_t size);
 int ubifs_xattr_set(struct inode *host, const char *name, const void *value,
-		    size_t size, int flags);
+		    size_t size, int flags, bool check_lock);
 ssize_t ubifs_xattr_get(struct inode *host, const char *name, void *buf,
 			size_t size);
 
diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index 6c9e62c..dcfdd53 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -280,7 +280,7 @@ static struct inode *iget_xattr(struct ubifs_info *c, ino_t inum)
 }
 
 int ubifs_xattr_set(struct inode *host, const char *name, const void *value,
-		    size_t size, int flags)
+		    size_t size, int flags, bool check_lock)
 {
 	struct inode *inode;
 	struct ubifs_info *c = host->i_sb->s_fs_info;
@@ -289,12 +289,7 @@ int ubifs_xattr_set(struct inode *host, const char *name, const void *value,
 	union ubifs_key key;
 	int err;
 
-	/*
-	 * Creating an encryption context is done unlocked since we
-	 * operate on a new inode which is not visible to other users
-	 * at this point.
-	 */
-	if (strcmp(name, UBIFS_XATTR_NAME_ENCRYPTION_CONTEXT) != 0)
+	if (check_lock)
 		ubifs_assert(inode_is_locked(host));
 
 	if (size > UBIFS_MAX_INO_DATA)
@@ -576,8 +571,12 @@ static int init_xattrs(struct inode *inode, const struct xattr *xattr_array,
 		}
 		strcpy(name, XATTR_SECURITY_PREFIX);
 		strcpy(name + XATTR_SECURITY_PREFIX_LEN, xattr->name);
+		/*
+		 * creating a new inode without holding the inode rwsem,
+		 * no need to check whether inode is locked.
+		 */
 		err = ubifs_xattr_set(inode, name, xattr->value,
-				      xattr->value_len, 0);
+				      xattr->value_len, 0, false);
 		kfree(name);
 		if (err < 0)
 			break;
@@ -624,7 +623,7 @@ static int xattr_set(const struct xattr_handler *handler,
 	name = xattr_full_name(handler, name);
 
 	if (value)
-		return ubifs_xattr_set(inode, name, value, size, flags);
+		return ubifs_xattr_set(inode, name, value, size, flags, true);
 	else
 		return ubifs_xattr_remove(inode, name);
 }
-- 
1.9.1
