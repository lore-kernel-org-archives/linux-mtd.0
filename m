Received: from mail.sigma-star.at ([95.130.255.111])
 by casper.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCZdZ-0002zG-Um
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2016 22:15:33 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david@sigma-star.at, tytso@mit.edu, dedekind1@gmail.com,
 ebiggers@google.com, mhalcrow@google.com, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org, hch@infradead.org,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, dengler@linutronix.de,
 sbabic@denx.de, wd@denx.de, Richard Weinberger <richard@nod.at>
Subject: [PATCH 4/6] fscrypt: Cleanup page locking requirements for
 fscrypt_{decrypt, encrypt}_page()
Date: Thu,  1 Dec 2016 23:14:56 +0100
Message-Id: <1480630498-19201-5-git-send-email-richard@nod.at>
In-Reply-To: <1480630498-19201-1-git-send-email-richard@nod.at>
References: <1480630498-19201-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: David Gstir <david@sigma-star.at>

Rename the FS_CFLG_INPLACE_ENCRYPTION flag to FS_CFLG_OWN_PAGES which,
when set, indicates that the fs uses pages under its own control as
opposed to writeback pages which require locking and a bounce buffer for
encryption.

Signed-off-by: David Gstir <david@sigma-star.at>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/crypto/crypto.c       | 13 +++++++++----
 fs/ext4/inode.c          |  1 -
 fs/f2fs/data.c           |  1 -
 fs/ubifs/crypto.c        |  2 +-
 include/linux/fscrypto.h |  2 +-
 5 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index 3c3c854e5f77..2f41eee963e1 100644
--- a/fs/crypto/crypto.c
+++ b/fs/crypto/crypto.c
@@ -237,7 +237,7 @@ static struct page *alloc_bounce_page(struct fscrypt_ctx *ctx, gfp_t gfp_flags)
  * fscrypt_restore_control_page() on the returned ciphertext page to
  * release the bounce buffer and the encryption context.
  *
- * In-place encryption is used by setting the FS_CFLG_INPLACE_ENCRYPTION flag in
+ * In-place encryption is used by setting the FS_CFLG_OWN_PAGES flag in
  * fscrypt_operations. Here, the input-page is returned with its content
  * encrypted.
  *
@@ -261,7 +261,9 @@ struct page *fscrypt_encrypt_page(const struct inode *inode,
 	if (IS_ERR(ctx))
 		return (struct page *)ctx;
 
-	if (!(inode->i_sb->s_cop->flags & FS_CFLG_INPLACE_ENCRYPTION)) {
+	if (!(inode->i_sb->s_cop->flags & FS_CFLG_OWN_PAGES)) {
+		BUG_ON(!PageLocked(page));
+
 		/* The encryption operation will require a bounce page. */
 		ciphertext_page = alloc_bounce_page(ctx, gfp_flags);
 		if (IS_ERR(ciphertext_page))
@@ -278,7 +280,7 @@ struct page *fscrypt_encrypt_page(const struct inode *inode,
 		ciphertext_page = ERR_PTR(err);
 		goto errout;
 	}
-	if (!(inode->i_sb->s_cop->flags & FS_CFLG_INPLACE_ENCRYPTION)) {
+	if (!(inode->i_sb->s_cop->flags & FS_CFLG_OWN_PAGES)) {
 		SetPagePrivate(ciphertext_page);
 		set_page_private(ciphertext_page, (unsigned long)ctx);
 		lock_page(ciphertext_page);
@@ -297,7 +299,7 @@ EXPORT_SYMBOL(fscrypt_encrypt_page);
  * fscrypt_decrypt_page() - Decrypts a page in-place
  * @inode:     The corresponding inode for the page to decrypt.
  * @page:      The page to decrypt. Must be locked in case
- *             it is a writeback page.
+ *             it is a writeback page (FS_CFLG_OWN_PAGES unset).
  * @len:       Number of bytes in @page to be decrypted.
  * @offs:      Start of data in @page.
  * @lblk_num:  Logical block number.
@@ -311,6 +313,9 @@ EXPORT_SYMBOL(fscrypt_encrypt_page);
 int fscrypt_decrypt_page(const struct inode *inode, struct page *page,
 			unsigned int len, unsigned int offs, u64 lblk_num)
 {
+	if (!(inode->i_sb->s_cop->flags & FS_CFLG_OWN_PAGES))
+		BUG_ON(!PageLocked(page));
+
 	return do_page_crypto(inode, FS_DECRYPT, lblk_num, page, page, len, offs,
 			GFP_NOFS);
 }
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 1485ac273bfb..fb2b514f675b 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -3744,7 +3744,6 @@ static int __ext4_block_zero_page_range(handle_t *handle,
 			/* We expect the key to be set. */
 			BUG_ON(!fscrypt_has_encryption_key(inode));
 			BUG_ON(blocksize != PAGE_SIZE);
-			BUG_ON(!PageLocked(page));
 			WARN_ON_ONCE(fscrypt_decrypt_page(page->mapping->host,
 						page, PAGE_SIZE, 0, page->index));
 		}
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 435590c4b341..9f0ba90b92e4 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1194,7 +1194,6 @@ int do_write_data_page(struct f2fs_io_info *fio)
 		f2fs_wait_on_encrypted_page_writeback(F2FS_I_SB(inode),
 							fio->old_blkaddr);
 retry_encrypt:
-		BUG_ON(!PageLocked(fio->page));
 		fio->encrypted_page = fscrypt_encrypt_page(inode, fio->page,
 							PAGE_SIZE, 0,
 							fio->page->index,
diff --git a/fs/ubifs/crypto.c b/fs/ubifs/crypto.c
index aefa3c30b73b..3402720f2b28 100644
--- a/fs/ubifs/crypto.c
+++ b/fs/ubifs/crypto.c
@@ -87,7 +87,7 @@ int ubifs_decrypt(const struct inode *inode, struct ubifs_data_node *dn,
 }
 
 struct fscrypt_operations ubifs_crypt_operations = {
-	.flags			= FS_CFLG_INPLACE_ENCRYPTION,
+	.flags			= FS_CFLG_OWN_PAGES,
 	.get_context		= ubifs_crypt_get_context,
 	.set_context		= ubifs_crypt_set_context,
 	.is_encrypted		= __ubifs_crypt_is_encrypted,
diff --git a/include/linux/fscrypto.h b/include/linux/fscrypto.h
index e9648b62eca6..65be74f3afb6 100644
--- a/include/linux/fscrypto.h
+++ b/include/linux/fscrypto.h
@@ -156,7 +156,7 @@ struct fscrypt_name {
 /*
  * fscrypt superblock flags
  */
-#define FS_CFLG_INPLACE_ENCRYPTION (1U << 1)
+#define FS_CFLG_OWN_PAGES (1U << 1)
 
 /*
  * crypto opertions for filesystems
-- 
2.7.3
