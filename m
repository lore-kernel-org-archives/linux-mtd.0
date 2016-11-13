Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c62EZ-0004v2-Ok
 for linux-mtd@lists.infradead.org; Sun, 13 Nov 2016 21:22:49 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dedekind1@gmail.com, adrian.hunter@intel.com, tytso@mit.edu,
 jaegeuk@kernel.org, david@sigma-star.at, wd@denx.de, sbabic@denx.de,
 dengler@linutronix.de, ebiggers@google.com, mhalcrow@google.com,
 hch@infradead.org, Richard Weinberger <richard@nod.at>
Subject: [PATCH 05/29] fscrypt: Let fs select encryption index/tweak
Date: Sun, 13 Nov 2016 22:20:48 +0100
Message-Id: <1479072072-6844-6-git-send-email-richard@nod.at>
In-Reply-To: <1479072072-6844-1-git-send-email-richard@nod.at>
References: <1479072072-6844-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: David Gstir <david@sigma-star.at>

Avoid re-use of page index as tweak for AES-XTS when multiple parts of
same page are encrypted. This will happen on multiple (partial) calls of
fscrypt_encrypt_page on same page.
page->index is only valid for writeback pages.

Signed-off-by: David Gstir <david@sigma-star.at>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/crypto/crypto.c       | 11 +++++++----
 fs/ext4/inode.c          |  4 ++--
 fs/ext4/page-io.c        |  3 ++-
 fs/f2fs/data.c           |  5 +++--
 include/linux/fscrypto.h |  9 +++++----
 5 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index f5c5e84ea9db..b6029785714c 100644
--- a/fs/crypto/crypto.c
+++ b/fs/crypto/crypto.c
@@ -218,6 +218,8 @@ static struct page *alloc_bounce_page(struct fscrypt_ctx *ctx, gfp_t gfp_flags)
  * @plaintext_page:   The page to encrypt. Must be locked.
  * @plaintext_len:    Length of plaintext within page
  * @plaintext_offset: Offset of plaintext within page
+ * @index:            Index for encryption. This is mainly the page index, but
+ *                    but might be different for multiple calls on same page.
  * @gfp_flags:        The gfp flag for memory allocation
  *
  * Encrypts plaintext_page using the ctx encryption context. If
@@ -235,7 +237,7 @@ struct page *fscrypt_encrypt_page(const struct inode *inode,
 				struct page *plaintext_page,
 				unsigned int plaintext_len,
 				unsigned int plaintext_offset,
-				gfp_t gfp_flags)
+				pgoff_t index, gfp_t gfp_flags)
 
 {
 	struct fscrypt_ctx *ctx;
@@ -256,7 +258,7 @@ struct page *fscrypt_encrypt_page(const struct inode *inode,
 	}
 
 	ctx->w.control_page = plaintext_page;
-	err = do_page_crypto(inode, FS_ENCRYPT, plaintext_page->index,
+	err = do_page_crypto(inode, FS_ENCRYPT, index,
 					plaintext_page, ciphertext_page,
 					plaintext_len, plaintext_offset,
 					gfp_flags);
@@ -283,6 +285,7 @@ EXPORT_SYMBOL(fscrypt_encrypt_page);
  * @page:  The page to decrypt. Must be locked.
  * @len:   Number of bytes in @page to be decrypted.
  * @offs:  Start of data in @page.
+ * @index: Index for encryption.
  *
  * Decrypts page in-place using the ctx encryption context.
  *
@@ -291,7 +294,7 @@ EXPORT_SYMBOL(fscrypt_encrypt_page);
  * Return: Zero on success, non-zero otherwise.
  */
 int fscrypt_decrypt_page(const struct inode *inode, struct page *page,
-			unsigned int len, unsigned int offs)
+			unsigned int len, unsigned int offs, pgoff_t index)
 {
 	return do_page_crypto(inode, FS_DECRYPT, page->index, page, page, len, offs,
 			GFP_NOFS);
@@ -430,7 +433,7 @@ static void completion_pages(struct work_struct *work)
 	bio_for_each_segment_all(bv, bio, i) {
 		struct page *page = bv->bv_page;
 		int ret = fscrypt_decrypt_page(page->mapping->host, page,
-				PAGE_SIZE, 0);
+				PAGE_SIZE, 0, page->index);
 
 		if (ret) {
 			WARN_ON_ONCE(1);
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 1d498c5e2990..1485ac273bfb 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -1167,7 +1167,7 @@ static int ext4_block_write_begin(struct page *page, loff_t pos, unsigned len,
 		page_zero_new_buffers(page, from, to);
 	else if (decrypt)
 		err = fscrypt_decrypt_page(page->mapping->host, page,
-				PAGE_SIZE, 0);
+				PAGE_SIZE, 0, page->index);
 	return err;
 }
 #endif
@@ -3746,7 +3746,7 @@ static int __ext4_block_zero_page_range(handle_t *handle,
 			BUG_ON(blocksize != PAGE_SIZE);
 			BUG_ON(!PageLocked(page));
 			WARN_ON_ONCE(fscrypt_decrypt_page(page->mapping->host,
-						page, PAGE_SIZE, 0));
+						page, PAGE_SIZE, 0, page->index));
 		}
 	}
 	if (ext4_should_journal_data(inode)) {
diff --git a/fs/ext4/page-io.c b/fs/ext4/page-io.c
index 3d1d3d0f4303..902a3e3059b3 100644
--- a/fs/ext4/page-io.c
+++ b/fs/ext4/page-io.c
@@ -470,7 +470,8 @@ int ext4_bio_write_page(struct ext4_io_submit *io,
 		gfp_t gfp_flags = GFP_NOFS;
 
 	retry_encrypt:
-		data_page = fscrypt_encrypt_page(inode, page, PAGE_SIZE, 0, gfp_flags);
+		data_page = fscrypt_encrypt_page(inode, page, PAGE_SIZE, 0,
+						page->index, gfp_flags);
 		if (IS_ERR(data_page)) {
 			ret = PTR_ERR(data_page);
 			if (ret == -ENOMEM && wbc->sync_mode == WB_SYNC_ALL) {
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index fac207254e8d..435590c4b341 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1196,8 +1196,9 @@ int do_write_data_page(struct f2fs_io_info *fio)
 retry_encrypt:
 		BUG_ON(!PageLocked(fio->page));
 		fio->encrypted_page = fscrypt_encrypt_page(inode, fio->page,
-								PAGE_SIZE, 0,
-								gfp_flags);
+							PAGE_SIZE, 0,
+							fio->page->index,
+							gfp_flags);
 		if (IS_ERR(fio->encrypted_page)) {
 			err = PTR_ERR(fio->encrypted_page);
 			if (err == -ENOMEM) {
diff --git a/include/linux/fscrypto.h b/include/linux/fscrypto.h
index e9be944a324c..98c71e973a96 100644
--- a/include/linux/fscrypto.h
+++ b/include/linux/fscrypto.h
@@ -250,9 +250,9 @@ extern struct fscrypt_ctx *fscrypt_get_ctx(const struct inode *, gfp_t);
 extern void fscrypt_release_ctx(struct fscrypt_ctx *);
 extern struct page *fscrypt_encrypt_page(const struct inode *, struct page *,
 						unsigned int, unsigned int,
-						gfp_t);
+						pgoff_t, gfp_t);
 extern int fscrypt_decrypt_page(const struct inode *, struct page *, unsigned int,
-				unsigned int);
+				unsigned int, pgoff_t);
 extern void fscrypt_decrypt_bio_pages(struct fscrypt_ctx *, struct bio *);
 extern void fscrypt_pullback_bio_page(struct page **, bool);
 extern void fscrypt_restore_control_page(struct page *);
@@ -299,13 +299,14 @@ static inline struct page *fscrypt_notsupp_encrypt_page(const struct inode *i,
 						struct page *p,
 						unsigned int len,
 						unsigned int offs,
-						gfp_t f)
+						pgoff_t index, gfp_t f)
 {
 	return ERR_PTR(-EOPNOTSUPP);
 }
 
 static inline int fscrypt_notsupp_decrypt_page(const struct inode *i, struct page *p,
-						unsigned int len, unsigned int offs)
+						unsigned int len, unsigned int offs,
+						pgoff_t index)
 {
 	return -EOPNOTSUPP;
 }
-- 
2.7.3
