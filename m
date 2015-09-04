Received: from mail-wi0-x232.google.com ([2a00:1450:400c:c05::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZXpcu-0000gT-JK
 for linux-mtd@lists.infradead.org; Fri, 04 Sep 2015 11:57:53 +0000
Received: by wicfx3 with SMTP id fx3so20083537wic.1
 for <linux-mtd@lists.infradead.org>; Fri, 04 Sep 2015 04:57:31 -0700 (PDT)
From: Andreas Gruenbacher <andreas.gruenbacher@gmail.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>,
 Eric Van Hensbergen <ericvh@gmail.com>, Ron Minnich <rminnich@sandia.gov>,
 Latchesar Ionkov <lucho@ionkov.net>, v9fs-developer@lists.sourceforge.net
Subject: [PATCH 1/5] ubifs: Remove unused "security.*" xattr handler
Date: Fri,  4 Sep 2015 13:57:18 +0200
Message-Id: <1441367842-25079-2-git-send-email-agruenba@redhat.com>
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

Ubifs installs a "security.*" xattr handler in sb->s_xattr but doesn't use the
generic_{get,set,list,remove}xattr inode operations needed for processing this
list of attribute handlers; the handler is never called.  Instead, ubifs uses
its own xattr handlers which also process "security.*" xattrs.

Remove the dead code.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/ubifs/super.c |  1 -
 fs/ubifs/ubifs.h |  1 -
 fs/ubifs/xattr.c | 40 ----------------------------------------
 3 files changed, 42 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 9547a278..c71edca 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -2037,7 +2037,6 @@ static int ubifs_fill_super(struct super_block *sb, void *data, int silent)
 	if (c->max_inode_sz > MAX_LFS_FILESIZE)
 		sb->s_maxbytes = c->max_inode_sz = MAX_LFS_FILESIZE;
 	sb->s_op = &ubifs_super_operations;
-	sb->s_xattr = ubifs_xattr_handlers;
 
 	mutex_lock(&c->umount_mutex);
 	err = mount_ubifs(c);
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index de75902..33b6ee7 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1470,7 +1470,6 @@ extern spinlock_t ubifs_infos_lock;
 extern atomic_long_t ubifs_clean_zn_cnt;
 extern struct kmem_cache *ubifs_inode_slab;
 extern const struct super_operations ubifs_super_operations;
-extern const struct xattr_handler *ubifs_xattr_handlers[];
 extern const struct address_space_operations ubifs_file_address_operations;
 extern const struct file_operations ubifs_file_operations;
 extern const struct inode_operations ubifs_file_inode_operations;
diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index 96f3448..b512b14 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -582,46 +582,6 @@ out_free:
 	return err;
 }
 
-static size_t security_listxattr(struct dentry *d, char *list, size_t list_size,
-				 const char *name, size_t name_len, int flags)
-{
-	const int prefix_len = XATTR_SECURITY_PREFIX_LEN;
-	const size_t total_len = prefix_len + name_len + 1;
-
-	if (list && total_len <= list_size) {
-		memcpy(list, XATTR_SECURITY_PREFIX, prefix_len);
-		memcpy(list + prefix_len, name, name_len);
-		list[prefix_len + name_len] = '\0';
-	}
-
-	return total_len;
-}
-
-static int security_getxattr(struct dentry *d, const char *name, void *buffer,
-		      size_t size, int flags)
-{
-	return ubifs_getxattr(d, name, buffer, size);
-}
-
-static int security_setxattr(struct dentry *d, const char *name,
-			     const void *value, size_t size, int flags,
-			     int handler_flags)
-{
-	return ubifs_setxattr(d, name, value, size, flags);
-}
-
-static const struct xattr_handler ubifs_xattr_security_handler = {
-	.prefix = XATTR_SECURITY_PREFIX,
-	.list   = security_listxattr,
-	.get    = security_getxattr,
-	.set    = security_setxattr,
-};
-
-const struct xattr_handler *ubifs_xattr_handlers[] = {
-	&ubifs_xattr_security_handler,
-	NULL,
-};
-
 static int init_xattrs(struct inode *inode, const struct xattr *xattr_array,
 		      void *fs_info)
 {
-- 
2.4.3
