Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bxZGk-0004Vm-Qy
 for linux-mtd@lists.infradead.org; Fri, 21 Oct 2016 12:50:10 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dedekind1@gmail.com, adrian.hunter@intel.com, tytso@mit.edu,
 jaegeuk@kernel.org, david@sigma-star.at, wd@denx.de, sbabic@denx.de,
 dengler@linutronix.de, Richard Weinberger <richard@nod.at>
Subject: [PATCH 06/26] ubifs: Add skeleton for fscrypto
Date: Fri, 21 Oct 2016 14:48:21 +0200
Message-Id: <1477054121-10198-7-git-send-email-richard@nod.at>
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

This is the first building block to provide file level
encryption on UBIFS.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/Kconfig       | 11 +++++++++++
 fs/ubifs/Makefile      |  1 +
 fs/ubifs/crypto.c      | 45 +++++++++++++++++++++++++++++++++++++++++++++
 fs/ubifs/dir.c         | 28 +++++++++++++++++++++++++++-
 fs/ubifs/ioctl.c       | 35 +++++++++++++++++++++++++++++++++++
 fs/ubifs/super.c       | 10 ++++++++++
 fs/ubifs/ubifs-media.h |  2 ++
 fs/ubifs/ubifs.h       | 39 ++++++++++++++++++++++++++++++++++++++-
 fs/ubifs/xattr.c       | 10 ++++++++++
 9 files changed, 179 insertions(+), 2 deletions(-)
 create mode 100644 fs/ubifs/crypto.c

diff --git a/fs/ubifs/Kconfig b/fs/ubifs/Kconfig
index 7ff7712f284e..0a908ae7af13 100644
--- a/fs/ubifs/Kconfig
+++ b/fs/ubifs/Kconfig
@@ -50,3 +50,14 @@ config UBIFS_ATIME_SUPPORT
 	  strictatime is the "heavy", relatime is "lighter", etc.
 
 	  If unsure, say 'N'
+
+config UBIFS_FS_ENCRYPTION
+	bool "UBIFS Encryption"
+	depends on UBIFS_FS
+	select FS_ENCRYPTION
+	default n
+	help
+	  Enable encryption of UBIFS files and directories. This
+	  feature is similar to ecryptfs, but it is more memory
+	  efficient since it avoids caching the encrypted and
+	  decrypted pages in the page cache.
diff --git a/fs/ubifs/Makefile b/fs/ubifs/Makefile
index c54a24360f85..6f3251c2bf08 100644
--- a/fs/ubifs/Makefile
+++ b/fs/ubifs/Makefile
@@ -5,3 +5,4 @@ ubifs-y += tnc.o master.o scan.o replay.o log.o commit.o gc.o orphan.o
 ubifs-y += budget.o find.o tnc_commit.o compress.o lpt.o lprops.o
 ubifs-y += recovery.o ioctl.o lpt_commit.o tnc_misc.o xattr.o debug.o
 ubifs-y += misc.o
+ubifs-$(CONFIG_UBIFS_FS_ENCRYPTION) += crypto.o
diff --git a/fs/ubifs/crypto.c b/fs/ubifs/crypto.c
new file mode 100644
index 000000000000..160c31479e0c
--- /dev/null
+++ b/fs/ubifs/crypto.c
@@ -0,0 +1,45 @@
+#include "ubifs.h"
+
+static int ubifs_crypt_get_context(struct inode *inode, void *ctx, size_t len)
+{
+	return ubifs_xattr_get(inode, UBIFS_XATTR_NAME_ENCRYPTION_CONTEXT,
+			       ctx, len);
+}
+
+static int ubifs_crypt_set_context(struct inode *inode, const void *ctx,
+				   size_t len, void *fs_data)
+{
+	return ubifs_xattr_set(inode, UBIFS_XATTR_NAME_ENCRYPTION_CONTEXT,
+			       ctx, len, 0);
+}
+
+static bool ubifs_crypt_empty_dir(struct inode *inode)
+{
+	return ubifs_check_dir_empty(inode) == 0;
+}
+
+static unsigned int ubifs_crypt_max_namelen(struct inode *inode)
+{
+	if (S_ISLNK(inode->i_mode))
+		return UBIFS_MAX_INO_DATA;
+	else
+		return UBIFS_MAX_NLEN;
+}
+
+static int ubifs_key_prefix(struct inode *inode, u8 **key)
+{
+	static char prefix[] = "ubifs:";
+
+	*key = prefix;
+
+	return sizeof(prefix) - 1;
+}
+
+struct fscrypt_operations ubifs_crypt_operations = {
+	.get_context		= ubifs_crypt_get_context,
+	.set_context		= ubifs_crypt_set_context,
+	.is_encrypted		= ubifs_crypt_is_encrypted,
+	.empty_dir		= ubifs_crypt_empty_dir,
+	.max_namelen		= ubifs_crypt_max_namelen,
+	.key_prefix		= ubifs_key_prefix,
+};
diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 177343bce143..0e47127352ed 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -85,11 +85,26 @@ static int inherit_flags(const struct inode *dir, umode_t mode)
  * initializes it. Returns new inode in case of success and an error code in
  * case of failure.
  */
-struct inode *ubifs_new_inode(struct ubifs_info *c, const struct inode *dir,
+struct inode *ubifs_new_inode(struct ubifs_info *c, struct inode *dir,
 			      umode_t mode)
 {
+	int err;
 	struct inode *inode;
 	struct ubifs_inode *ui;
+	bool encrypted = false;
+
+	if (ubifs_crypt_is_encrypted(dir)) {
+		err = fscrypt_get_encryption_info(dir);
+		if (err) {
+			ubifs_err(c, "fscrypt_get_encryption_info failed: %i", err);
+			return ERR_PTR(err);
+		}
+
+		if (!fscrypt_has_encryption_key(dir))
+			return ERR_PTR(-EPERM);
+
+		encrypted = true;
+	}
 
 	inode = new_inode(c->vfs_sb);
 	ui = ubifs_inode(inode);
@@ -165,6 +180,17 @@ struct inode *ubifs_new_inode(struct ubifs_info *c, const struct inode *dir,
 	 */
 	ui->creat_sqnum = ++c->max_sqnum;
 	spin_unlock(&c->cnt_lock);
+
+	if (encrypted) {
+		err = fscrypt_inherit_context(dir, inode, &encrypted, true);
+		if (err) {
+			ubifs_err(c, "fscrypt_inherit_context failed: %i", err);
+			make_bad_inode(inode);
+			iput(inode);
+			return ERR_PTR(err);
+		}
+	}
+
 	return inode;
 }
 
diff --git a/fs/ubifs/ioctl.c b/fs/ubifs/ioctl.c
index 3c7b29de0ca7..6bb5b35050de 100644
--- a/fs/ubifs/ioctl.c
+++ b/fs/ubifs/ioctl.c
@@ -181,6 +181,41 @@ long ubifs_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		mnt_drop_write_file(file);
 		return err;
 	}
+	case FS_IOC_SET_ENCRYPTION_POLICY: {
+#ifdef CONFIG_UBIFS_FS_ENCRYPTION
+		struct fscrypt_policy policy;
+
+		if (copy_from_user(&policy,
+				   (struct fscrypt_policy __user *)arg,
+				   sizeof(policy)))
+			return -EFAULT;
+
+		err = fscrypt_process_policy(file, &policy);
+
+		return err;
+#else
+		return -EOPNOTSUPP;
+#endif
+	}
+	case FS_IOC_GET_ENCRYPTION_POLICY: {
+#ifdef CONFIG_UBIFS_FS_ENCRYPTION
+		struct fscrypt_policy policy;
+
+		if (!ubifs_crypt_is_encrypted(inode))
+			return -ENOENT;
+
+		err = fscrypt_get_policy(inode, &policy);
+		if (err)
+			return err;
+
+		if (copy_to_user((void __user *)arg, &policy, sizeof(policy)))
+			return -EFAULT;
+
+		return 0;
+#else
+		return -EOPNOTSUPP;
+#endif
+	}
 
 	default:
 		return -ENOTTY;
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 4ec051089186..a31222947265 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -380,6 +380,9 @@ out:
 	}
 done:
 	clear_inode(inode);
+#ifdef CONFIG_UBIFS_FS_ENCRYPTION
+	fscrypt_put_encryption_info(inode, NULL);
+#endif
 }
 
 static void ubifs_dirty_inode(struct inode *inode, int flags)
@@ -1995,6 +1998,12 @@ static struct ubifs_info *alloc_ubifs_info(struct ubi_volume_desc *ubi)
 	return c;
 }
 
+#ifndef CONFIG_UBIFS_FS_ENCRYPTION
+struct fscrypt_operations ubifs_crypt_operations = {
+	.is_encrypted		= __ubifs_crypt_is_encrypted,
+};
+#endif
+
 static int ubifs_fill_super(struct super_block *sb, void *data, int silent)
 {
 	struct ubifs_info *c = sb->s_fs_info;
@@ -2041,6 +2050,7 @@ static int ubifs_fill_super(struct super_block *sb, void *data, int silent)
 		sb->s_maxbytes = c->max_inode_sz = MAX_LFS_FILESIZE;
 	sb->s_op = &ubifs_super_operations;
 	sb->s_xattr = ubifs_xattr_handlers;
+	sb->s_cop = &ubifs_crypt_operations;
 
 	mutex_lock(&c->umount_mutex);
 	err = mount_ubifs(c);
diff --git a/fs/ubifs/ubifs-media.h b/fs/ubifs/ubifs-media.h
index d47e9569b3de..aa302b11aec8 100644
--- a/fs/ubifs/ubifs-media.h
+++ b/fs/ubifs/ubifs-media.h
@@ -316,6 +316,7 @@ enum {
  * UBIFS_APPEND_FL: writes to the inode may only append data
  * UBIFS_DIRSYNC_FL: I/O on this directory inode has to be synchronous
  * UBIFS_XATTR_FL: this inode is the inode for an extended attribute value
+ * UBIFS_CRYPT_FL: use encryption for this inode
  *
  * Note, these are on-flash flags which correspond to ioctl flags
  * (@FS_COMPR_FL, etc). They have the same values now, but generally, do not
@@ -328,6 +329,7 @@ enum {
 	UBIFS_APPEND_FL    = 0x08,
 	UBIFS_DIRSYNC_FL   = 0x10,
 	UBIFS_XATTR_FL     = 0x20,
+	UBIFS_CRYPT_FL     = 0x40,
 };
 
 /* Inode flag bits used by UBIFS */
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 94c1f5563c01..63dd027727ca 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -38,6 +38,7 @@
 #include <linux/backing-dev.h>
 #include <linux/security.h>
 #include <linux/xattr.h>
+#include <linux/fscrypto.h>
 #include "ubifs-media.h"
 
 /* Version of this UBIFS implementation */
@@ -1727,7 +1728,7 @@ int ubifs_update_time(struct inode *inode, struct timespec *time, int flags);
 #endif
 
 /* dir.c */
-struct inode *ubifs_new_inode(struct ubifs_info *c, const struct inode *dir,
+struct inode *ubifs_new_inode(struct ubifs_info *c, struct inode *dir,
 			      umode_t mode);
 int ubifs_getattr(struct vfsmount *mnt, struct dentry *dentry,
 		  struct kstat *stat);
@@ -1776,10 +1777,46 @@ void ubifs_compress(const struct ubifs_info *c, const void *in_buf, int in_len,
 int ubifs_decompress(const struct ubifs_info *c, const void *buf, int len,
 		     void *out, int *out_len, int compr_type);
 
+extern struct fscrypt_operations ubifs_crypt_operations;
+
 #include "debug.h"
 #include "misc.h"
 #include "key.h"
 
+#ifndef CONFIG_UBIFS_FS_ENCRYPTION
+#define fscrypt_set_d_op(i)
+#define fscrypt_get_ctx                 fscrypt_notsupp_get_ctx
+#define fscrypt_release_ctx             fscrypt_notsupp_release_ctx
+#define fscrypt_encrypt_page            fscrypt_notsupp_encrypt_page
+#define fscrypt_decrypt_page            fscrypt_notsupp_decrypt_page
+#define fscrypt_encrypt_buffer          fscrypt_notsupp_encrypt_buffer
+#define fscrypt_decrypt_buffer          fscrypt_notsupp_decrypt_buffer
+#define fscrypt_decrypt_bio_pages       fscrypt_notsupp_decrypt_bio_pages
+#define fscrypt_pullback_bio_page       fscrypt_notsupp_pullback_bio_page
+#define fscrypt_restore_control_page    fscrypt_notsupp_restore_control_page
+#define fscrypt_zeroout_range           fscrypt_notsupp_zeroout_range
+#define fscrypt_process_policy          fscrypt_notsupp_process_policy
+#define fscrypt_get_policy              fscrypt_notsupp_get_policy
+#define fscrypt_has_permitted_context   fscrypt_notsupp_has_permitted_context
+#define fscrypt_inherit_context         fscrypt_notsupp_inherit_context
+#define fscrypt_get_encryption_info     fscrypt_notsupp_get_encryption_info
+#define fscrypt_put_encryption_info     fscrypt_notsupp_put_encryption_info
+#define fscrypt_setup_filename          fscrypt_notsupp_setup_filename
+#define fscrypt_free_filename           fscrypt_notsupp_free_filename
+#define fscrypt_fname_encrypted_size    fscrypt_notsupp_fname_encrypted_size
+#define fscrypt_fname_alloc_buffer      fscrypt_notsupp_fname_alloc_buffer
+#define fscrypt_fname_free_buffer       fscrypt_notsupp_fname_free_buffer
+#define fscrypt_fname_disk_to_usr       fscrypt_notsupp_fname_disk_to_usr
+#define fscrypt_fname_usr_to_disk       fscrypt_notsupp_fname_usr_to_disk
+#endif
+
+static inline bool ubifs_crypt_is_encrypted(struct inode *inode)
+{
+	struct ubifs_inode *ui = ubifs_inode(inode);
+
+	return ui->flags & UBIFS_CRYPT_FL;
+}
+
 /* Normal UBIFS messages */
 __printf(2, 3)
 void ubifs_msg(const struct ubifs_info *c, const char *fmt, ...);
diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index ad4463752709..b390902c48aa 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -158,6 +158,15 @@ static int create_xattr(struct ubifs_info *c, struct inode *host,
 	host_ui->xattr_size += CALC_XATTR_BYTES(size);
 	host_ui->xattr_names += nm->len;
 
+	/*
+	 * We handle UBIFS_XATTR_NAME_ENCRYPTION_CONTEXT here because we
+	 * have to set the UBIFS_CRYPT_FL flag on the host inode.
+	 * To avoid multiple updates of the same inode in the same operation,
+	 * let's do it here.
+	 */
+	if (strcmp(nm->name, UBIFS_XATTR_NAME_ENCRYPTION_CONTEXT) == 0)
+		host_ui->flags |= UBIFS_CRYPT_FL;
+
 	err = ubifs_jnl_update(c, host, nm, inode, 0, 1);
 	if (err)
 		goto out_cancel;
@@ -172,6 +181,7 @@ out_cancel:
 	host_ui->xattr_cnt -= 1;
 	host_ui->xattr_size -= CALC_DENT_SIZE(nm->len);
 	host_ui->xattr_size -= CALC_XATTR_BYTES(size);
+	host_ui->flags &= ~UBIFS_CRYPT_FL;
 	mutex_unlock(&host_ui->ui_mutex);
 out_free:
 	make_bad_inode(inode);
-- 
2.7.3
