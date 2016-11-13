Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c62ED-0004s0-5g
 for linux-mtd@lists.infradead.org; Sun, 13 Nov 2016 21:22:21 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dedekind1@gmail.com, adrian.hunter@intel.com, tytso@mit.edu,
 jaegeuk@kernel.org, david@sigma-star.at, wd@denx.de, sbabic@denx.de,
 dengler@linutronix.de, ebiggers@google.com, mhalcrow@google.com,
 hch@infradead.org, Richard Weinberger <richard@nod.at>
Subject: [PATCH 03/29] fscrypt: Enable partial page encryption
Date: Sun, 13 Nov 2016 22:20:46 +0100
Message-Id: <1479072072-6844-4-git-send-email-richard@nod.at>
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

Not all filesystems work on full pages, thus we should allow them to
hand partial pages to fscrypt for en/decryption.

Signed-off-by: David Gstir <david@sigma-star.at>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/crypto/crypto.c       | 42 ++++++++++++++++++++++++++----------------
 fs/ext4/inode.c          |  6 ++++--
 fs/ext4/page-io.c        |  2 +-
 fs/f2fs/data.c           |  2 ++
 include/linux/fscrypto.h | 16 +++++++++++-----
 5 files changed, 44 insertions(+), 24 deletions(-)

diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index 222a70520565..e170aa05011d 100644
--- a/fs/crypto/crypto.c
+++ b/fs/crypto/crypto.c
@@ -149,6 +149,7 @@ typedef enum {
 static int do_page_crypto(struct inode *inode,
 			fscrypt_direction_t rw, pgoff_t index,
 			struct page *src_page, struct page *dest_page,
+			unsigned int src_len, unsigned int src_offset,
 			gfp_t gfp_flags)
 {
 	struct {
@@ -179,10 +180,10 @@ static int do_page_crypto(struct inode *inode,
 	memset(xts_tweak.padding, 0, sizeof(xts_tweak.padding));
 
 	sg_init_table(&dst, 1);
-	sg_set_page(&dst, dest_page, PAGE_SIZE, 0);
+	sg_set_page(&dst, dest_page, src_len, src_offset);
 	sg_init_table(&src, 1);
-	sg_set_page(&src, src_page, PAGE_SIZE, 0);
-	skcipher_request_set_crypt(req, &src, &dst, PAGE_SIZE, &xts_tweak);
+	sg_set_page(&src, src_page, src_len, src_offset);
+	skcipher_request_set_crypt(req, &src, &dst, src_len, &xts_tweak);
 	if (rw == FS_DECRYPT)
 		res = crypto_skcipher_decrypt(req);
 	else
@@ -213,9 +214,11 @@ static struct page *alloc_bounce_page(struct fscrypt_ctx *ctx, gfp_t gfp_flags)
 
 /**
  * fscypt_encrypt_page() - Encrypts a page
- * @inode:          The inode for which the encryption should take place
- * @plaintext_page: The page to encrypt. Must be locked.
- * @gfp_flags:      The gfp flag for memory allocation
+ * @inode:            The inode for which the encryption should take place
+ * @plaintext_page:   The page to encrypt. Must be locked.
+ * @plaintext_len:    Length of plaintext within page
+ * @plaintext_offset: Offset of plaintext within page
+ * @gfp_flags:        The gfp flag for memory allocation
  *
  * Encrypts plaintext_page using the ctx encryption context. If
  * the filesystem supports it, encryption is performed in-place, otherwise a
@@ -229,13 +232,17 @@ static struct page *alloc_bounce_page(struct fscrypt_ctx *ctx, gfp_t gfp_flags)
  * error value or NULL.
  */
 struct page *fscrypt_encrypt_page(struct inode *inode,
-				struct page *plaintext_page, gfp_t gfp_flags)
+				struct page *plaintext_page,
+				unsigned int plaintext_len,
+				unsigned int plaintext_offset,
+				gfp_t gfp_flags)
+
 {
 	struct fscrypt_ctx *ctx;
 	struct page *ciphertext_page = plaintext_page;
 	int err;
 
-	BUG_ON(!PageLocked(plaintext_page));
+	BUG_ON(plaintext_len % FS_CRYPTO_BLOCK_SIZE != 0);
 
 	ctx = fscrypt_get_ctx(inode, gfp_flags);
 	if (IS_ERR(ctx))
@@ -251,6 +258,7 @@ struct page *fscrypt_encrypt_page(struct inode *inode,
 	ctx->w.control_page = plaintext_page;
 	err = do_page_crypto(inode, FS_ENCRYPT, plaintext_page->index,
 					plaintext_page, ciphertext_page,
+					plaintext_len, plaintext_offset,
 					gfp_flags);
 	if (err) {
 		ciphertext_page = ERR_PTR(err);
@@ -270,9 +278,11 @@ struct page *fscrypt_encrypt_page(struct inode *inode,
 EXPORT_SYMBOL(fscrypt_encrypt_page);
 
 /**
- * f2crypt_decrypt_page() - Decrypts a page in-place
- * @inode: The encrypted inode to decrypt.
+ * fscrypt_decrypt_page() - Decrypts a page in-place
+ * @inode: Encrypted inode to decrypt.
  * @page:  The page to decrypt. Must be locked.
+ * @len:   Number of bytes in @page to be decrypted.
+ * @offs:  Start of data in @page.
  *
  * Decrypts page in-place using the ctx encryption context.
  *
@@ -280,11 +290,10 @@ EXPORT_SYMBOL(fscrypt_encrypt_page);
  *
  * Return: Zero on success, non-zero otherwise.
  */
-int fscrypt_decrypt_page(struct inode *inode, struct page *page)
+int fscrypt_decrypt_page(struct inode *inode, struct page *page,
+			unsigned int len, unsigned int offs)
 {
-	BUG_ON(!PageLocked(page));
-
-	return do_page_crypto(inode, FS_DECRYPT, page->index, page, page,
+	return do_page_crypto(inode, FS_DECRYPT, page->index, page, page, len, offs,
 			GFP_NOFS);
 }
 EXPORT_SYMBOL(fscrypt_decrypt_page);
@@ -312,7 +321,7 @@ int fscrypt_zeroout_range(struct inode *inode, pgoff_t lblk,
 	while (len--) {
 		err = do_page_crypto(inode, FS_ENCRYPT, lblk,
 					ZERO_PAGE(0), ciphertext_page,
-					GFP_NOFS);
+					PAGE_SIZE, 0, GFP_NOFS);
 		if (err)
 			goto errout;
 
@@ -420,7 +429,8 @@ static void completion_pages(struct work_struct *work)
 
 	bio_for_each_segment_all(bv, bio, i) {
 		struct page *page = bv->bv_page;
-		int ret = fscrypt_decrypt_page(page->mapping->host, page);
+		int ret = fscrypt_decrypt_page(page->mapping->host, page,
+				PAGE_SIZE, 0);
 
 		if (ret) {
 			WARN_ON_ONCE(1);
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 4b7b842ec024..1d498c5e2990 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -1166,7 +1166,8 @@ static int ext4_block_write_begin(struct page *page, loff_t pos, unsigned len,
 	if (unlikely(err))
 		page_zero_new_buffers(page, from, to);
 	else if (decrypt)
-		err = fscrypt_decrypt_page(page->mapping->host, page);
+		err = fscrypt_decrypt_page(page->mapping->host, page,
+				PAGE_SIZE, 0);
 	return err;
 }
 #endif
@@ -3743,8 +3744,9 @@ static int __ext4_block_zero_page_range(handle_t *handle,
 			/* We expect the key to be set. */
 			BUG_ON(!fscrypt_has_encryption_key(inode));
 			BUG_ON(blocksize != PAGE_SIZE);
+			BUG_ON(!PageLocked(page));
 			WARN_ON_ONCE(fscrypt_decrypt_page(page->mapping->host,
-						page));
+						page, PAGE_SIZE, 0));
 		}
 	}
 	if (ext4_should_journal_data(inode)) {
diff --git a/fs/ext4/page-io.c b/fs/ext4/page-io.c
index 0094923e5ebf..3d1d3d0f4303 100644
--- a/fs/ext4/page-io.c
+++ b/fs/ext4/page-io.c
@@ -470,7 +470,7 @@ int ext4_bio_write_page(struct ext4_io_submit *io,
 		gfp_t gfp_flags = GFP_NOFS;
 
 	retry_encrypt:
-		data_page = fscrypt_encrypt_page(inode, page, gfp_flags);
+		data_page = fscrypt_encrypt_page(inode, page, PAGE_SIZE, 0, gfp_flags);
 		if (IS_ERR(data_page)) {
 			ret = PTR_ERR(data_page);
 			if (ret == -ENOMEM && wbc->sync_mode == WB_SYNC_ALL) {
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 9ae194fd2fdb..fac207254e8d 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1194,7 +1194,9 @@ int do_write_data_page(struct f2fs_io_info *fio)
 		f2fs_wait_on_encrypted_page_writeback(F2FS_I_SB(inode),
 							fio->old_blkaddr);
 retry_encrypt:
+		BUG_ON(!PageLocked(fio->page));
 		fio->encrypted_page = fscrypt_encrypt_page(inode, fio->page,
+								PAGE_SIZE, 0,
 								gfp_flags);
 		if (IS_ERR(fio->encrypted_page)) {
 			err = PTR_ERR(fio->encrypted_page);
diff --git a/include/linux/fscrypto.h b/include/linux/fscrypto.h
index 8be8e9657c63..e05931272cea 100644
--- a/include/linux/fscrypto.h
+++ b/include/linux/fscrypto.h
@@ -248,8 +248,11 @@ int fscrypt_initialize(void);
 
 extern struct fscrypt_ctx *fscrypt_get_ctx(struct inode *, gfp_t);
 extern void fscrypt_release_ctx(struct fscrypt_ctx *);
-extern struct page *fscrypt_encrypt_page(struct inode *, struct page *, gfp_t);
-extern int fscrypt_decrypt_page(struct inode *, struct page *);
+extern struct page *fscrypt_encrypt_page(struct inode *, struct page *,
+						unsigned int, unsigned int,
+						gfp_t);
+extern int fscrypt_decrypt_page(struct inode *, struct page *, unsigned int,
+				unsigned int);
 extern void fscrypt_decrypt_bio_pages(struct fscrypt_ctx *, struct bio *);
 extern void fscrypt_pullback_bio_page(struct page **, bool);
 extern void fscrypt_restore_control_page(struct page *);
@@ -293,13 +296,16 @@ static inline void fscrypt_notsupp_release_ctx(struct fscrypt_ctx *c)
 }
 
 static inline struct page *fscrypt_notsupp_encrypt_page(struct inode *i,
-						struct page *p, gfp_t f)
+						struct page *p,
+						unsigned int len,
+						unsigned int offs,
+						gfp_t f)
 {
 	return ERR_PTR(-EOPNOTSUPP);
 }
 
-static inline int fscrypt_notsupp_decrypt_page(struct inode *i,
-						struct page *p)
+static inline int fscrypt_notsupp_decrypt_page(struct inode *i, struct page *p,
+						unsigned int len, unsigned int offs)
 {
 	return -EOPNOTSUPP;
 }
-- 
2.7.3
