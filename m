Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZSA5w-0001lp-GO
 for linux-mtd@lists.infradead.org; Wed, 19 Aug 2015 20:36:26 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Richard Weinberger <richard@nod.at>,
 Subodh Nijsure <snijsure@grid-net.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>, Brad Mouring <brad.mouring@ni.com>,
 Gratian Crisan <gratian.crisan@ni.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Subject: [PATCH 1/2] ubifs: Remove dead xattr code
Date: Wed, 19 Aug 2015 22:35:52 +0200
Message-Id: <1440016553-26481-1-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a partial revert of commit d7f0b70d30ffb9bbe6b8a3e1035cf0b79965ef53
("UBIFS: Add security.* XATTR support for the UBIFS").

As UBIFS does not use generic inode xattr inode operations
the code behind sb->s_xattr is never called.
Remove that dead code for now.

Cc: Subodh Nijsure <snijsure@grid-net.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Brad Mouring <brad.mouring@ni.com>
Cc: Gratian Crisan <gratian.crisan@ni.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Reported-by: Andreas Grünbacher <andreas.gruenbacher@gmail.com>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
After the merge window (and my vacation) I'll have the time to
re-introduce/work security xattr support.

Thanks,
//richard
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
1.8.4.5
