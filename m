Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bxZGO-0004HV-1z
 for linux-mtd@lists.infradead.org; Fri, 21 Oct 2016 12:49:36 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dedekind1@gmail.com, adrian.hunter@intel.com, tytso@mit.edu,
 jaegeuk@kernel.org, david@sigma-star.at, wd@denx.de, sbabic@denx.de,
 dengler@linutronix.de, Richard Weinberger <richard@nod.at>
Subject: [PATCH 01/26] fscrypto: Add buffer operations
Date: Fri, 21 Oct 2016 14:48:16 +0200
Message-Id: <1477054121-10198-2-git-send-email-richard@nod.at>
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

Not all filesystems operate on pages, therefore offer
operations to en/decrypt buffers.
Of course these buffers have to be allocated in a way such that
the kernel crypto framework can work with them.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/crypto/crypto.c       | 63 +++++++++++++++++++++++++++++++++++++++---------
 include/linux/fscrypto.h | 24 ++++++++++++++++++
 2 files changed, 76 insertions(+), 11 deletions(-)

diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index c502c116924c..1c2f9516b4be 100644
--- a/fs/crypto/crypto.c
+++ b/fs/crypto/crypto.c
@@ -147,15 +147,14 @@ typedef enum {
 	FS_ENCRYPT,
 } fscrypt_direction_t;
 
-static int do_page_crypto(struct inode *inode,
-			fscrypt_direction_t rw, pgoff_t index,
-			struct page *src_page, struct page *dest_page,
-			gfp_t gfp_flags)
+static int do_crypto(struct inode *inode,
+		     fscrypt_direction_t rw, pgoff_t index,
+		     struct scatterlist *src, struct scatterlist *dst,
+		     unsigned int cryptlen, gfp_t gfp_flags)
 {
 	u8 xts_tweak[FS_XTS_TWEAK_SIZE];
 	struct skcipher_request *req = NULL;
 	DECLARE_FS_COMPLETION_RESULT(ecr);
-	struct scatterlist dst, src;
 	struct fscrypt_info *ci = inode->i_crypt_info;
 	struct crypto_skcipher *tfm = ci->ci_ctfm;
 	int res = 0;
@@ -177,12 +176,8 @@ static int do_page_crypto(struct inode *inode,
 	memset(&xts_tweak[sizeof(index)], 0,
 			FS_XTS_TWEAK_SIZE - sizeof(index));
 
-	sg_init_table(&dst, 1);
-	sg_set_page(&dst, dest_page, PAGE_SIZE, 0);
-	sg_init_table(&src, 1);
-	sg_set_page(&src, src_page, PAGE_SIZE, 0);
-	skcipher_request_set_crypt(req, &src, &dst, PAGE_SIZE,
-					xts_tweak);
+	skcipher_request_set_crypt(req, src, dst, cryptlen,
+				   xts_tweak);
 	if (rw == FS_DECRYPT)
 		res = crypto_skcipher_decrypt(req);
 	else
@@ -202,6 +197,34 @@ static int do_page_crypto(struct inode *inode,
 	return 0;
 }
 
+static int do_page_crypto(struct inode *inode,
+			  fscrypt_direction_t rw, pgoff_t index,
+			  struct page *src_page, struct page *dst_page,
+			  gfp_t gfp_flags)
+{
+	struct scatterlist src, dst;
+
+	sg_init_table(&src, 1);
+	sg_set_page(&src, src_page, PAGE_SIZE, 0);
+	sg_init_table(&dst, 1);
+	sg_set_page(&dst, dst_page, PAGE_SIZE, 0);
+
+	return do_crypto(inode, rw, index, &src, &dst, PAGE_SIZE, gfp_flags);
+}
+
+static int do_buf_crypto(struct inode *inode,
+			 fscrypt_direction_t rw, pgoff_t index,
+			 const void *src_buf, const void *dst_buf,
+			 unsigned int buflen, gfp_t gfp_flags)
+{
+	struct scatterlist src, dst;
+
+	sg_init_one(&src, src_buf, buflen);
+	sg_init_one(&dst, dst_buf, buflen);
+
+	return do_crypto(inode, rw, index, &src, &dst, buflen, gfp_flags);
+}
+
 static struct page *alloc_bounce_page(struct fscrypt_ctx *ctx, gfp_t gfp_flags)
 {
 	ctx->w.bounce_page = mempool_alloc(fscrypt_bounce_page_pool, gfp_flags);
@@ -264,6 +287,24 @@ errout:
 }
 EXPORT_SYMBOL(fscrypt_encrypt_page);
 
+int fscrypt_encrypt_buffer(struct inode *inode, const void *plaintext_buf,
+			   const void *ciphertext_buf, unsigned int buflen,
+			   pgoff_t index, gfp_t gfp_flags)
+{
+	return do_buf_crypto(inode, FS_ENCRYPT, index, plaintext_buf,
+			     ciphertext_buf, buflen, gfp_flags);
+}
+EXPORT_SYMBOL(fscrypt_encrypt_buffer);
+
+int fscrypt_decrypt_buffer(struct inode *inode, const void *ciphertext_buf,
+			   const void *plaintext_buf, unsigned int buflen,
+			   pgoff_t index, gfp_t gfp_flags)
+{
+	return do_buf_crypto(inode, FS_DECRYPT, index, ciphertext_buf,
+			     plaintext_buf, buflen, gfp_flags);
+}
+EXPORT_SYMBOL(fscrypt_decrypt_buffer);
+
 /**
  * f2crypt_decrypt_page() - Decrypts a page in-place
  * @page: The page to decrypt. Must be locked.
diff --git a/include/linux/fscrypto.h b/include/linux/fscrypto.h
index 76cff18bb032..a9628b4882e7 100644
--- a/include/linux/fscrypto.h
+++ b/include/linux/fscrypto.h
@@ -273,6 +273,12 @@ extern void fscrypt_pullback_bio_page(struct page **, bool);
 extern void fscrypt_restore_control_page(struct page *);
 extern int fscrypt_zeroout_range(struct inode *, pgoff_t, sector_t,
 						unsigned int);
+int fscrypt_encrypt_buffer(struct inode *inode, const void *plaintext_buf,
+			   const void *ciphertext_buf, unsigned int buflen,
+			   pgoff_t index, gfp_t gfp_flags);
+int fscrypt_decrypt_buffer(struct inode *inode, const void *ciphertext_buf,
+			   const void *plaintext_buf, unsigned int buflen,
+			   pgoff_t index, gfp_t gfp_flags);
 /* policy.c */
 extern int fscrypt_process_policy(struct file *, const struct fscrypt_policy *);
 extern int fscrypt_get_policy(struct inode *, struct fscrypt_policy *);
@@ -418,6 +424,24 @@ static inline void fscrypt_notsupp_fname_free_buffer(struct fscrypt_str *c)
 	return;
 }
 
+static inline int fscrypt_notsupp_encrypt_buffer(const struct inode *inode,
+						 const void *plaintext_buf,
+						 const void *ciphertext_buf,
+						 unsigned int buflen,
+						 pgoff_t index, gfp_t gfp_flags)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int fscrypt_notsupp_decrypt_buffer(const struct inode *inode,
+						 const void *ciphertext_buf,
+						 const void *plaintext_buf,
+						 unsigned int buflen,
+						 pgoff_t index, gfp_t gfp_flags)
+{
+	return -EOPNOTSUPP;
+}
+
 static inline int fscrypt_notsupp_fname_disk_to_usr(struct inode *inode,
 			u32 hash, u32 minor_hash,
 			const struct fscrypt_str *iname,
-- 
2.7.3
