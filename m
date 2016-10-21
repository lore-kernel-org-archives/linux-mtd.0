Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bxZGO-0004He-23
 for linux-mtd@lists.infradead.org; Fri, 21 Oct 2016 12:49:34 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dedekind1@gmail.com, adrian.hunter@intel.com, tytso@mit.edu,
 jaegeuk@kernel.org, david@sigma-star.at, wd@denx.de, sbabic@denx.de,
 dengler@linutronix.de, Richard Weinberger <richard@nod.at>
Subject: [PATCH 02/26] fscrypto: Constify struct inode pointer
Date: Fri, 21 Oct 2016 14:48:17 +0200
Message-Id: <1477054121-10198-3-git-send-email-richard@nod.at>
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

Some filesystems, such as UBIFS, maintain a const pointer
for struct inode.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/crypto/crypto.c       | 12 +++++++-----
 include/linux/fscrypto.h | 12 +++++++-----
 2 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index 1c2f9516b4be..8c59912feebb 100644
--- a/fs/crypto/crypto.c
+++ b/fs/crypto/crypto.c
@@ -147,7 +147,7 @@ typedef enum {
 	FS_ENCRYPT,
 } fscrypt_direction_t;
 
-static int do_crypto(struct inode *inode,
+static int do_crypto(const struct inode *inode,
 		     fscrypt_direction_t rw, pgoff_t index,
 		     struct scatterlist *src, struct scatterlist *dst,
 		     unsigned int cryptlen, gfp_t gfp_flags)
@@ -212,7 +212,7 @@ static int do_page_crypto(struct inode *inode,
 	return do_crypto(inode, rw, index, &src, &dst, PAGE_SIZE, gfp_flags);
 }
 
-static int do_buf_crypto(struct inode *inode,
+static int do_buf_crypto(const struct inode *inode,
 			 fscrypt_direction_t rw, pgoff_t index,
 			 const void *src_buf, const void *dst_buf,
 			 unsigned int buflen, gfp_t gfp_flags)
@@ -287,7 +287,7 @@ errout:
 }
 EXPORT_SYMBOL(fscrypt_encrypt_page);
 
-int fscrypt_encrypt_buffer(struct inode *inode, const void *plaintext_buf,
+int fscrypt_encrypt_buffer(const struct inode *inode, const void *plaintext_buf,
 			   const void *ciphertext_buf, unsigned int buflen,
 			   pgoff_t index, gfp_t gfp_flags)
 {
@@ -296,8 +296,10 @@ int fscrypt_encrypt_buffer(struct inode *inode, const void *plaintext_buf,
 }
 EXPORT_SYMBOL(fscrypt_encrypt_buffer);
 
-int fscrypt_decrypt_buffer(struct inode *inode, const void *ciphertext_buf,
-			   const void *plaintext_buf, unsigned int buflen,
+int fscrypt_decrypt_buffer(const struct inode *inode,
+			   const void *ciphertext_buf,
+			   const void *plaintext_buf,
+			   unsigned int buflen,
 			   pgoff_t index, gfp_t gfp_flags)
 {
 	return do_buf_crypto(inode, FS_DECRYPT, index, ciphertext_buf,
diff --git a/include/linux/fscrypto.h b/include/linux/fscrypto.h
index a9628b4882e7..d18ee29cf69a 100644
--- a/include/linux/fscrypto.h
+++ b/include/linux/fscrypto.h
@@ -273,11 +273,13 @@ extern void fscrypt_pullback_bio_page(struct page **, bool);
 extern void fscrypt_restore_control_page(struct page *);
 extern int fscrypt_zeroout_range(struct inode *, pgoff_t, sector_t,
 						unsigned int);
-int fscrypt_encrypt_buffer(struct inode *inode, const void *plaintext_buf,
+int fscrypt_encrypt_buffer(const struct inode *inode, const void *plaintext_buf,
 			   const void *ciphertext_buf, unsigned int buflen,
 			   pgoff_t index, gfp_t gfp_flags);
-int fscrypt_decrypt_buffer(struct inode *inode, const void *ciphertext_buf,
-			   const void *plaintext_buf, unsigned int buflen,
+int fscrypt_decrypt_buffer(const struct inode *inode,
+			   const void *ciphertext_buf,
+			   const void *plaintext_buf,
+			   unsigned int buflen,
 			   pgoff_t index, gfp_t gfp_flags);
 /* policy.c */
 extern int fscrypt_process_policy(struct file *, const struct fscrypt_policy *);
@@ -291,8 +293,8 @@ extern int fscrypt_get_encryption_info(struct inode *);
 extern void fscrypt_put_encryption_info(struct inode *, struct fscrypt_info *);
 
 /* fname.c */
-extern int fscrypt_setup_filename(struct inode *, const struct qstr *,
-				int lookup, struct fscrypt_name *);
+extern int fscrypt_setup_filename(struct inode *dir, const struct qstr *iname,
+			   int lookup, struct fscrypt_name *fname);
 extern void fscrypt_free_filename(struct fscrypt_name *);
 extern u32 fscrypt_fname_encrypted_size(struct inode *, u32);
 extern int fscrypt_fname_alloc_buffer(struct inode *, u32,
-- 
2.7.3
