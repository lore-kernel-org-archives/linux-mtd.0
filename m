Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c62ED-0004rz-5Z
 for linux-mtd@lists.infradead.org; Sun, 13 Nov 2016 21:22:20 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dedekind1@gmail.com, adrian.hunter@intel.com, tytso@mit.edu,
 jaegeuk@kernel.org, david@sigma-star.at, wd@denx.de, sbabic@denx.de,
 dengler@linutronix.de, ebiggers@google.com, mhalcrow@google.com,
 hch@infradead.org, Richard Weinberger <richard@nod.at>
Subject: [PATCH 02/29] fscrypt: Allow fscrypt_decrypt_page() to function with
 non-writeback pages
Date: Sun, 13 Nov 2016 22:20:45 +0100
Message-Id: <1479072072-6844-3-git-send-email-richard@nod.at>
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

Some filesystem might pass pages which do not have page->mapping->host
set to the encrypted inode. We want the caller to explicitly pass the
corresponding inode.

Signed-off-by: David Gstir <david@sigma-star.at>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/crypto/crypto.c       | 11 ++++++-----
 fs/ext4/inode.c          |  5 +++--
 include/linux/fscrypto.h |  5 +++--
 3 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index f38dc8aac2fe..222a70520565 100644
--- a/fs/crypto/crypto.c
+++ b/fs/crypto/crypto.c
@@ -271,7 +271,8 @@ EXPORT_SYMBOL(fscrypt_encrypt_page);
 
 /**
  * f2crypt_decrypt_page() - Decrypts a page in-place
- * @page: The page to decrypt. Must be locked.
+ * @inode: The encrypted inode to decrypt.
+ * @page:  The page to decrypt. Must be locked.
  *
  * Decrypts page in-place using the ctx encryption context.
  *
@@ -279,12 +280,12 @@ EXPORT_SYMBOL(fscrypt_encrypt_page);
  *
  * Return: Zero on success, non-zero otherwise.
  */
-int fscrypt_decrypt_page(struct page *page)
+int fscrypt_decrypt_page(struct inode *inode, struct page *page)
 {
 	BUG_ON(!PageLocked(page));
 
-	return do_page_crypto(page->mapping->host,
-			FS_DECRYPT, page->index, page, page, GFP_NOFS);
+	return do_page_crypto(inode, FS_DECRYPT, page->index, page, page,
+			GFP_NOFS);
 }
 EXPORT_SYMBOL(fscrypt_decrypt_page);
 
@@ -419,7 +420,7 @@ static void completion_pages(struct work_struct *work)
 
 	bio_for_each_segment_all(bv, bio, i) {
 		struct page *page = bv->bv_page;
-		int ret = fscrypt_decrypt_page(page);
+		int ret = fscrypt_decrypt_page(page->mapping->host, page);
 
 		if (ret) {
 			WARN_ON_ONCE(1);
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 9c064727ed62..4b7b842ec024 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -1166,7 +1166,7 @@ static int ext4_block_write_begin(struct page *page, loff_t pos, unsigned len,
 	if (unlikely(err))
 		page_zero_new_buffers(page, from, to);
 	else if (decrypt)
-		err = fscrypt_decrypt_page(page);
+		err = fscrypt_decrypt_page(page->mapping->host, page);
 	return err;
 }
 #endif
@@ -3743,7 +3743,8 @@ static int __ext4_block_zero_page_range(handle_t *handle,
 			/* We expect the key to be set. */
 			BUG_ON(!fscrypt_has_encryption_key(inode));
 			BUG_ON(blocksize != PAGE_SIZE);
-			WARN_ON_ONCE(fscrypt_decrypt_page(page));
+			WARN_ON_ONCE(fscrypt_decrypt_page(page->mapping->host,
+						page));
 		}
 	}
 	if (ext4_should_journal_data(inode)) {
diff --git a/include/linux/fscrypto.h b/include/linux/fscrypto.h
index 5a65b0e3773f..8be8e9657c63 100644
--- a/include/linux/fscrypto.h
+++ b/include/linux/fscrypto.h
@@ -249,7 +249,7 @@ int fscrypt_initialize(void);
 extern struct fscrypt_ctx *fscrypt_get_ctx(struct inode *, gfp_t);
 extern void fscrypt_release_ctx(struct fscrypt_ctx *);
 extern struct page *fscrypt_encrypt_page(struct inode *, struct page *, gfp_t);
-extern int fscrypt_decrypt_page(struct page *);
+extern int fscrypt_decrypt_page(struct inode *, struct page *);
 extern void fscrypt_decrypt_bio_pages(struct fscrypt_ctx *, struct bio *);
 extern void fscrypt_pullback_bio_page(struct page **, bool);
 extern void fscrypt_restore_control_page(struct page *);
@@ -298,7 +298,8 @@ static inline struct page *fscrypt_notsupp_encrypt_page(struct inode *i,
 	return ERR_PTR(-EOPNOTSUPP);
 }
 
-static inline int fscrypt_notsupp_decrypt_page(struct page *p)
+static inline int fscrypt_notsupp_decrypt_page(struct inode *i,
+						struct page *p)
 {
 	return -EOPNOTSUPP;
 }
-- 
2.7.3
