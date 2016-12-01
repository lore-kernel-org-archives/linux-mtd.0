Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCZda-0007IP-Kh
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2016 22:15:32 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david@sigma-star.at, tytso@mit.edu, dedekind1@gmail.com,
 ebiggers@google.com, mhalcrow@google.com, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org, hch@infradead.org,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, dengler@linutronix.de,
 sbabic@denx.de, wd@denx.de, Richard Weinberger <richard@nod.at>
Subject: [PATCH 3/6] fscrypt: Cleanup fscrypt_{decrypt,encrypt}_page()
Date: Thu,  1 Dec 2016 23:14:55 +0100
Message-Id: <1480630498-19201-4-git-send-email-richard@nod.at>
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

- Improve documentation
- Add BUG_ON(len == 0) to avoid accidental switch of offs and len
parameters
- Improve variable names for readability
- No need to set ctx->w.control_page in fscrypt_encrypt_page in case of
  in-place encryption.

Signed-off-by: David Gstir <david@sigma-star.at>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/crypto/crypto.c       | 83 ++++++++++++++++++++++++++++--------------------
 include/linux/fscrypto.h |  8 ++---
 2 files changed, 52 insertions(+), 39 deletions(-)

diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index 1b877fcec1c1..3c3c854e5f77 100644
--- a/fs/crypto/crypto.c
+++ b/fs/crypto/crypto.c
@@ -147,9 +147,9 @@ typedef enum {
 } fscrypt_direction_t;
 
 static int do_page_crypto(const struct inode *inode,
-			fscrypt_direction_t rw, pgoff_t index,
+			fscrypt_direction_t rw, u64 lblk_num,
 			struct page *src_page, struct page *dest_page,
-			unsigned int src_len, unsigned int src_offset,
+			unsigned int len, unsigned int offs,
 			gfp_t gfp_flags)
 {
 	struct {
@@ -163,6 +163,8 @@ static int do_page_crypto(const struct inode *inode,
 	struct crypto_skcipher *tfm = ci->ci_ctfm;
 	int res = 0;
 
+	BUG_ON(len == 0);
+
 	req = skcipher_request_alloc(tfm, gfp_flags);
 	if (!req) {
 		printk_ratelimited(KERN_ERR
@@ -176,14 +178,14 @@ static int do_page_crypto(const struct inode *inode,
 		page_crypt_complete, &ecr);
 
 	BUILD_BUG_ON(sizeof(xts_tweak) != FS_XTS_TWEAK_SIZE);
-	xts_tweak.index = cpu_to_le64(index);
+	xts_tweak.index = cpu_to_le64(lblk_num);
 	memset(xts_tweak.padding, 0, sizeof(xts_tweak.padding));
 
 	sg_init_table(&dst, 1);
-	sg_set_page(&dst, dest_page, src_len, src_offset);
+	sg_set_page(&dst, dest_page, len, offs);
 	sg_init_table(&src, 1);
-	sg_set_page(&src, src_page, src_len, src_offset);
-	skcipher_request_set_crypt(req, &src, &dst, src_len, &xts_tweak);
+	sg_set_page(&src, src_page, len, offs);
+	skcipher_request_set_crypt(req, &src, &dst, len, &xts_tweak);
 	if (rw == FS_DECRYPT)
 		res = crypto_skcipher_decrypt(req);
 	else
@@ -214,37 +216,46 @@ static struct page *alloc_bounce_page(struct fscrypt_ctx *ctx, gfp_t gfp_flags)
 
 /**
  * fscypt_encrypt_page() - Encrypts a page
- * @inode:            The inode for which the encryption should take place
- * @plaintext_page:   The page to encrypt. Must be locked.
- * @plaintext_len:    Length of plaintext within page
- * @plaintext_offset: Offset of plaintext within page
- * @index:            Index for encryption. This is mainly the page index, but
- *                    but might be different for multiple calls on same page.
- * @gfp_flags:        The gfp flag for memory allocation
+ * @inode:     The inode for which the encryption should take place
+ * @page:      The page to encrypt. Must be locked for bounce-page
+ *             encryption.
+ * @len:       Length of data to encrypt in @page and encrypted
+ *             data in returned page.
+ * @offs:      Offset of data within @page and returned
+ *             page holding encrypted data.
+ * @lblk_num:  Logical block number. This must be unique for multiple
+ *             calls with same page.
+ * @gfp_flags: The gfp flag for memory allocation
  *
- * Encrypts plaintext_page using the ctx encryption context. If
- * the filesystem supports it, encryption is performed in-place, otherwise a
- * new ciphertext_page is allocated and returned.
+ * Encrypts @page using the ctx encryption context. Performs encryption
+ * either in-place or into a newly allocated bounce page.
+ * Called on the page write path.
  *
- * Called on the page write path.  The caller must call
+ * Bounce page allocation is the default.
+ * In this case, the contents of @page are encrypted and stored in an
+ * allocated bounce page. @page has to be locked and the caller must call
  * fscrypt_restore_control_page() on the returned ciphertext page to
  * release the bounce buffer and the encryption context.
  *
- * Return: An allocated page with the encrypted content on success. Else, an
+ * In-place encryption is used by setting the FS_CFLG_INPLACE_ENCRYPTION flag in
+ * fscrypt_operations. Here, the input-page is returned with its content
+ * encrypted.
+ *
+ * Return: A page with the encrypted content on success. Else, an
  * error value or NULL.
  */
 struct page *fscrypt_encrypt_page(const struct inode *inode,
-				struct page *plaintext_page,
-				unsigned int plaintext_len,
-				unsigned int plaintext_offset,
-				pgoff_t index, gfp_t gfp_flags)
+				struct page *page,
+				unsigned int len,
+				unsigned int offs,
+				u64 lblk_num, gfp_t gfp_flags)
 
 {
 	struct fscrypt_ctx *ctx;
-	struct page *ciphertext_page = plaintext_page;
+	struct page *ciphertext_page = page;
 	int err;
 
-	BUG_ON(plaintext_len % FS_CRYPTO_BLOCK_SIZE != 0);
+	BUG_ON(len % FS_CRYPTO_BLOCK_SIZE != 0);
 
 	ctx = fscrypt_get_ctx(inode, gfp_flags);
 	if (IS_ERR(ctx))
@@ -255,12 +266,13 @@ struct page *fscrypt_encrypt_page(const struct inode *inode,
 		ciphertext_page = alloc_bounce_page(ctx, gfp_flags);
 		if (IS_ERR(ciphertext_page))
 			goto errout;
+
+		ctx->w.control_page = page;
 	}
 
-	ctx->w.control_page = plaintext_page;
-	err = do_page_crypto(inode, FS_ENCRYPT, index,
-					plaintext_page, ciphertext_page,
-					plaintext_len, plaintext_offset,
+	err = do_page_crypto(inode, FS_ENCRYPT, lblk_num,
+					page, ciphertext_page,
+					len, offs,
 					gfp_flags);
 	if (err) {
 		ciphertext_page = ERR_PTR(err);
@@ -283,11 +295,12 @@ EXPORT_SYMBOL(fscrypt_encrypt_page);
 
 /**
  * fscrypt_decrypt_page() - Decrypts a page in-place
- * @inode: Encrypted inode to decrypt.
- * @page:  The page to decrypt. Must be locked.
- * @len:   Number of bytes in @page to be decrypted.
- * @offs:  Start of data in @page.
- * @index: Index for encryption.
+ * @inode:     The corresponding inode for the page to decrypt.
+ * @page:      The page to decrypt. Must be locked in case
+ *             it is a writeback page.
+ * @len:       Number of bytes in @page to be decrypted.
+ * @offs:      Start of data in @page.
+ * @lblk_num:  Logical block number.
  *
  * Decrypts page in-place using the ctx encryption context.
  *
@@ -296,9 +309,9 @@ EXPORT_SYMBOL(fscrypt_encrypt_page);
  * Return: Zero on success, non-zero otherwise.
  */
 int fscrypt_decrypt_page(const struct inode *inode, struct page *page,
-			unsigned int len, unsigned int offs, pgoff_t index)
+			unsigned int len, unsigned int offs, u64 lblk_num)
 {
-	return do_page_crypto(inode, FS_DECRYPT, index, page, page, len, offs,
+	return do_page_crypto(inode, FS_DECRYPT, lblk_num, page, page, len, offs,
 			GFP_NOFS);
 }
 EXPORT_SYMBOL(fscrypt_decrypt_page);
diff --git a/include/linux/fscrypto.h b/include/linux/fscrypto.h
index 98c71e973a96..e9648b62eca6 100644
--- a/include/linux/fscrypto.h
+++ b/include/linux/fscrypto.h
@@ -250,9 +250,9 @@ extern struct fscrypt_ctx *fscrypt_get_ctx(const struct inode *, gfp_t);
 extern void fscrypt_release_ctx(struct fscrypt_ctx *);
 extern struct page *fscrypt_encrypt_page(const struct inode *, struct page *,
 						unsigned int, unsigned int,
-						pgoff_t, gfp_t);
+						u64, gfp_t);
 extern int fscrypt_decrypt_page(const struct inode *, struct page *, unsigned int,
-				unsigned int, pgoff_t);
+				unsigned int, u64);
 extern void fscrypt_decrypt_bio_pages(struct fscrypt_ctx *, struct bio *);
 extern void fscrypt_pullback_bio_page(struct page **, bool);
 extern void fscrypt_restore_control_page(struct page *);
@@ -299,14 +299,14 @@ static inline struct page *fscrypt_notsupp_encrypt_page(const struct inode *i,
 						struct page *p,
 						unsigned int len,
 						unsigned int offs,
-						pgoff_t index, gfp_t f)
+						u64 lblk_num, gfp_t f)
 {
 	return ERR_PTR(-EOPNOTSUPP);
 }
 
 static inline int fscrypt_notsupp_decrypt_page(const struct inode *i, struct page *p,
 						unsigned int len, unsigned int offs,
-						pgoff_t index)
+						u64 lblk_num)
 {
 	return -EOPNOTSUPP;
 }
-- 
2.7.3
