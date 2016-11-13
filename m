Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c62ED-0004s1-40
 for linux-mtd@lists.infradead.org; Sun, 13 Nov 2016 21:22:19 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dedekind1@gmail.com, adrian.hunter@intel.com, tytso@mit.edu,
 jaegeuk@kernel.org, david@sigma-star.at, wd@denx.de, sbabic@denx.de,
 dengler@linutronix.de, ebiggers@google.com, mhalcrow@google.com,
 hch@infradead.org, Richard Weinberger <richard@nod.at>
Subject: [PATCH 04/29] fscrypt: Constify struct inode pointer
Date: Sun, 13 Nov 2016 22:20:47 +0100
Message-Id: <1479072072-6844-5-git-send-email-richard@nod.at>
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

Some filesystems, such as UBIFS, maintain a const pointer for struct
inode.

Signed-off-by: David Gstir <david@sigma-star.at>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/crypto/crypto.c       | 10 +++++-----
 fs/crypto/fname.c        |  4 ++--
 include/linux/fscrypto.h | 22 +++++++++++-----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index e170aa05011d..f5c5e84ea9db 100644
--- a/fs/crypto/crypto.c
+++ b/fs/crypto/crypto.c
@@ -88,7 +88,7 @@ EXPORT_SYMBOL(fscrypt_release_ctx);
  * Return: An allocated and initialized encryption context on success; error
  * value or NULL otherwise.
  */
-struct fscrypt_ctx *fscrypt_get_ctx(struct inode *inode, gfp_t gfp_flags)
+struct fscrypt_ctx *fscrypt_get_ctx(const struct inode *inode, gfp_t gfp_flags)
 {
 	struct fscrypt_ctx *ctx = NULL;
 	struct fscrypt_info *ci = inode->i_crypt_info;
@@ -146,7 +146,7 @@ typedef enum {
 	FS_ENCRYPT,
 } fscrypt_direction_t;
 
-static int do_page_crypto(struct inode *inode,
+static int do_page_crypto(const struct inode *inode,
 			fscrypt_direction_t rw, pgoff_t index,
 			struct page *src_page, struct page *dest_page,
 			unsigned int src_len, unsigned int src_offset,
@@ -231,7 +231,7 @@ static struct page *alloc_bounce_page(struct fscrypt_ctx *ctx, gfp_t gfp_flags)
  * Return: An allocated page with the encrypted content on success. Else, an
  * error value or NULL.
  */
-struct page *fscrypt_encrypt_page(struct inode *inode,
+struct page *fscrypt_encrypt_page(const struct inode *inode,
 				struct page *plaintext_page,
 				unsigned int plaintext_len,
 				unsigned int plaintext_offset,
@@ -290,7 +290,7 @@ EXPORT_SYMBOL(fscrypt_encrypt_page);
  *
  * Return: Zero on success, non-zero otherwise.
  */
-int fscrypt_decrypt_page(struct inode *inode, struct page *page,
+int fscrypt_decrypt_page(const struct inode *inode, struct page *page,
 			unsigned int len, unsigned int offs)
 {
 	return do_page_crypto(inode, FS_DECRYPT, page->index, page, page, len, offs,
@@ -298,7 +298,7 @@ int fscrypt_decrypt_page(struct inode *inode, struct page *page,
 }
 EXPORT_SYMBOL(fscrypt_decrypt_page);
 
-int fscrypt_zeroout_range(struct inode *inode, pgoff_t lblk,
+int fscrypt_zeroout_range(const struct inode *inode, pgoff_t lblk,
 				sector_t pblk, unsigned int len)
 {
 	struct fscrypt_ctx *ctx;
diff --git a/fs/crypto/fname.c b/fs/crypto/fname.c
index 9a28133ac3b8..faeaf0be9400 100644
--- a/fs/crypto/fname.c
+++ b/fs/crypto/fname.c
@@ -220,7 +220,7 @@ static int digest_decode(const char *src, int len, char *dst)
 	return cp - dst;
 }
 
-u32 fscrypt_fname_encrypted_size(struct inode *inode, u32 ilen)
+u32 fscrypt_fname_encrypted_size(const struct inode *inode, u32 ilen)
 {
 	int padding = 32;
 	struct fscrypt_info *ci = inode->i_crypt_info;
@@ -238,7 +238,7 @@ EXPORT_SYMBOL(fscrypt_fname_encrypted_size);
  * Allocates an output buffer that is sufficient for the crypto operation
  * specified by the context and the direction.
  */
-int fscrypt_fname_alloc_buffer(struct inode *inode,
+int fscrypt_fname_alloc_buffer(const struct inode *inode,
 				u32 ilen, struct fscrypt_str *crypto_str)
 {
 	unsigned int olen = fscrypt_fname_encrypted_size(inode, ilen);
diff --git a/include/linux/fscrypto.h b/include/linux/fscrypto.h
index e05931272cea..e9be944a324c 100644
--- a/include/linux/fscrypto.h
+++ b/include/linux/fscrypto.h
@@ -212,7 +212,7 @@ static inline struct page *fscrypt_control_page(struct page *page)
 #endif
 }
 
-static inline int fscrypt_has_encryption_key(struct inode *inode)
+static inline int fscrypt_has_encryption_key(const struct inode *inode)
 {
 #if IS_ENABLED(CONFIG_FS_ENCRYPTION)
 	return (inode->i_crypt_info != NULL);
@@ -246,17 +246,17 @@ static inline void fscrypt_set_d_op(struct dentry *dentry)
 extern struct kmem_cache *fscrypt_info_cachep;
 int fscrypt_initialize(void);
 
-extern struct fscrypt_ctx *fscrypt_get_ctx(struct inode *, gfp_t);
+extern struct fscrypt_ctx *fscrypt_get_ctx(const struct inode *, gfp_t);
 extern void fscrypt_release_ctx(struct fscrypt_ctx *);
-extern struct page *fscrypt_encrypt_page(struct inode *, struct page *,
+extern struct page *fscrypt_encrypt_page(const struct inode *, struct page *,
 						unsigned int, unsigned int,
 						gfp_t);
-extern int fscrypt_decrypt_page(struct inode *, struct page *, unsigned int,
+extern int fscrypt_decrypt_page(const struct inode *, struct page *, unsigned int,
 				unsigned int);
 extern void fscrypt_decrypt_bio_pages(struct fscrypt_ctx *, struct bio *);
 extern void fscrypt_pullback_bio_page(struct page **, bool);
 extern void fscrypt_restore_control_page(struct page *);
-extern int fscrypt_zeroout_range(struct inode *, pgoff_t, sector_t,
+extern int fscrypt_zeroout_range(const struct inode *, pgoff_t, sector_t,
 						unsigned int);
 /* policy.c */
 extern int fscrypt_process_policy(struct file *, const struct fscrypt_policy *);
@@ -273,8 +273,8 @@ extern void fscrypt_put_encryption_info(struct inode *, struct fscrypt_info *);
 extern int fscrypt_setup_filename(struct inode *, const struct qstr *,
 				int lookup, struct fscrypt_name *);
 extern void fscrypt_free_filename(struct fscrypt_name *);
-extern u32 fscrypt_fname_encrypted_size(struct inode *, u32);
-extern int fscrypt_fname_alloc_buffer(struct inode *, u32,
+extern u32 fscrypt_fname_encrypted_size(const struct inode *, u32);
+extern int fscrypt_fname_alloc_buffer(const struct inode *, u32,
 				struct fscrypt_str *);
 extern void fscrypt_fname_free_buffer(struct fscrypt_str *);
 extern int fscrypt_fname_disk_to_usr(struct inode *, u32, u32,
@@ -284,7 +284,7 @@ extern int fscrypt_fname_usr_to_disk(struct inode *, const struct qstr *,
 #endif
 
 /* crypto.c */
-static inline struct fscrypt_ctx *fscrypt_notsupp_get_ctx(struct inode *i,
+static inline struct fscrypt_ctx *fscrypt_notsupp_get_ctx(const struct inode *i,
 							gfp_t f)
 {
 	return ERR_PTR(-EOPNOTSUPP);
@@ -295,7 +295,7 @@ static inline void fscrypt_notsupp_release_ctx(struct fscrypt_ctx *c)
 	return;
 }
 
-static inline struct page *fscrypt_notsupp_encrypt_page(struct inode *i,
+static inline struct page *fscrypt_notsupp_encrypt_page(const struct inode *i,
 						struct page *p,
 						unsigned int len,
 						unsigned int offs,
@@ -304,7 +304,7 @@ static inline struct page *fscrypt_notsupp_encrypt_page(struct inode *i,
 	return ERR_PTR(-EOPNOTSUPP);
 }
 
-static inline int fscrypt_notsupp_decrypt_page(struct inode *i, struct page *p,
+static inline int fscrypt_notsupp_decrypt_page(const struct inode *i, struct page *p,
 						unsigned int len, unsigned int offs)
 {
 	return -EOPNOTSUPP;
@@ -326,7 +326,7 @@ static inline void fscrypt_notsupp_restore_control_page(struct page *p)
 	return;
 }
 
-static inline int fscrypt_notsupp_zeroout_range(struct inode *i, pgoff_t p,
+static inline int fscrypt_notsupp_zeroout_range(const struct inode *i, pgoff_t p,
 					sector_t s, unsigned int f)
 {
 	return -EOPNOTSUPP;
-- 
2.7.3
