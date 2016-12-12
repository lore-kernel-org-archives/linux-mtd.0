Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cGa1I-0003N5-Q0
 for linux-mtd@lists.infradead.org; Mon, 12 Dec 2016 23:28:34 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, adrian.hunter@intel.com, dedekind1@gmail.com,
 david@sigma-star.at, Richard Weinberger <richard@nod.at>
Subject: [PATCH 2/2] ubifs: Use fscrypt ioctl() helpers
Date: Tue, 13 Dec 2016 00:27:59 +0100
Message-Id: <20161212232759.30239-2-richard@nod.at>
In-Reply-To: <20161212232759.30239-1-richard@nod.at>
References: <20161212232759.30239-1-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit db717d8e26c2 ("fscrypto: move ioctl processing more fully into
common code") moved ioctl() related functions into fscrypt and offers
us now a set of helper functions.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/ioctl.c | 24 ++----------------------
 fs/ubifs/ubifs.h |  4 ++--
 2 files changed, 4 insertions(+), 24 deletions(-)

diff --git a/fs/ubifs/ioctl.c b/fs/ubifs/ioctl.c
index 3d10f5525274..78d713644df3 100644
--- a/fs/ubifs/ioctl.c
+++ b/fs/ubifs/ioctl.c
@@ -184,39 +184,19 @@ long ubifs_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	case FS_IOC_SET_ENCRYPTION_POLICY: {
 #ifdef CONFIG_UBIFS_FS_ENCRYPTION
 		struct ubifs_info *c = inode->i_sb->s_fs_info;
-		struct fscrypt_policy policy;
-
-		if (copy_from_user(&policy,
-				   (struct fscrypt_policy __user *)arg,
-				   sizeof(policy)))
-			return -EFAULT;
 
 		err = ubifs_enable_encryption(c);
 		if (err)
 			return err;
 
-		err = fscrypt_process_policy(file, &policy);
-
-		return err;
+		return fscrypt_ioctl_set_policy(file, (const void __user *)arg);
 #else
 		return -EOPNOTSUPP;
 #endif
 	}
 	case FS_IOC_GET_ENCRYPTION_POLICY: {
 #ifdef CONFIG_UBIFS_FS_ENCRYPTION
-		struct fscrypt_policy policy;
-
-		if (!ubifs_crypt_is_encrypted(inode))
-			return -ENOENT;
-
-		err = fscrypt_get_policy(inode, &policy);
-		if (err)
-			return err;
-
-		if (copy_to_user((void __user *)arg, &policy, sizeof(policy)))
-			return -EFAULT;
-
-		return 0;
+		return fscrypt_ioctl_get_policy(file, (void __user *)arg);
 #else
 		return -EOPNOTSUPP;
 #endif
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 8d0e4818e3ea..ca72382ce6cc 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1806,8 +1806,8 @@ int ubifs_decompress(const struct ubifs_info *c, const void *buf, int len,
 #define fscrypt_pullback_bio_page       fscrypt_notsupp_pullback_bio_page
 #define fscrypt_restore_control_page    fscrypt_notsupp_restore_control_page
 #define fscrypt_zeroout_range           fscrypt_notsupp_zeroout_range
-#define fscrypt_process_policy          fscrypt_notsupp_process_policy
-#define fscrypt_get_policy              fscrypt_notsupp_get_policy
+#define fscrypt_ioctl_set_policy	fscrypt_notsupp_ioctl_set_policy
+#define fscrypt_ioctl_get_policy	fscrypt_notsupp_ioctl_get_policy
 #define fscrypt_has_permitted_context   fscrypt_notsupp_has_permitted_context
 #define fscrypt_inherit_context         fscrypt_notsupp_inherit_context
 #define fscrypt_get_encryption_info     fscrypt_notsupp_get_encryption_info
-- 
2.10.2
