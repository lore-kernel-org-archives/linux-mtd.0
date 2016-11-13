Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c62ED-0004ry-4L
 for linux-mtd@lists.infradead.org; Sun, 13 Nov 2016 21:22:18 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dedekind1@gmail.com, adrian.hunter@intel.com, tytso@mit.edu,
 jaegeuk@kernel.org, david@sigma-star.at, wd@denx.de, sbabic@denx.de,
 dengler@linutronix.de, ebiggers@google.com, mhalcrow@google.com,
 hch@infradead.org, Richard Weinberger <richard@nod.at>
Subject: [PATCH 01/29] fscrypt: Add in-place encryption mode
Date: Sun, 13 Nov 2016 22:20:44 +0100
Message-Id: <1479072072-6844-2-git-send-email-richard@nod.at>
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

ext4 and f2fs require a bounce page when encrypting pages. However, not
all filesystems will need that (eg. UBIFS). This is handled via a
flag on fscrypt_operations where a fs implementation can select in-place
encryption over using a bounce page (which is the default).

Signed-off-by: David Gstir <david@sigma-star.at>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/crypto/crypto.c       | 25 +++++++++++++++----------
 include/linux/fscrypto.h |  6 ++++++
 2 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index 98f87fe8f186..f38dc8aac2fe 100644
--- a/fs/crypto/crypto.c
+++ b/fs/crypto/crypto.c
@@ -217,8 +217,9 @@ static struct page *alloc_bounce_page(struct fscrypt_ctx *ctx, gfp_t gfp_flags)
  * @plaintext_page: The page to encrypt. Must be locked.
  * @gfp_flags:      The gfp flag for memory allocation
  *
- * Allocates a ciphertext page and encrypts plaintext_page into it using the ctx
- * encryption context.
+ * Encrypts plaintext_page using the ctx encryption context. If
+ * the filesystem supports it, encryption is performed in-place, otherwise a
+ * new ciphertext_page is allocated and returned.
  *
  * Called on the page write path.  The caller must call
  * fscrypt_restore_control_page() on the returned ciphertext page to
@@ -231,7 +232,7 @@ struct page *fscrypt_encrypt_page(struct inode *inode,
 				struct page *plaintext_page, gfp_t gfp_flags)
 {
 	struct fscrypt_ctx *ctx;
-	struct page *ciphertext_page = NULL;
+	struct page *ciphertext_page = plaintext_page;
 	int err;
 
 	BUG_ON(!PageLocked(plaintext_page));
@@ -240,10 +241,12 @@ struct page *fscrypt_encrypt_page(struct inode *inode,
 	if (IS_ERR(ctx))
 		return (struct page *)ctx;
 
-	/* The encryption operation will require a bounce page. */
-	ciphertext_page = alloc_bounce_page(ctx, gfp_flags);
-	if (IS_ERR(ciphertext_page))
-		goto errout;
+	if (!(inode->i_sb->s_cop->flags & FS_CFLG_INPLACE_ENCRYPTION)) {
+		/* The encryption operation will require a bounce page. */
+		ciphertext_page = alloc_bounce_page(ctx, gfp_flags);
+		if (IS_ERR(ciphertext_page))
+			goto errout;
+	}
 
 	ctx->w.control_page = plaintext_page;
 	err = do_page_crypto(inode, FS_ENCRYPT, plaintext_page->index,
@@ -253,9 +256,11 @@ struct page *fscrypt_encrypt_page(struct inode *inode,
 		ciphertext_page = ERR_PTR(err);
 		goto errout;
 	}
-	SetPagePrivate(ciphertext_page);
-	set_page_private(ciphertext_page, (unsigned long)ctx);
-	lock_page(ciphertext_page);
+	if (!(inode->i_sb->s_cop->flags & FS_CFLG_INPLACE_ENCRYPTION)) {
+		SetPagePrivate(ciphertext_page);
+		set_page_private(ciphertext_page, (unsigned long)ctx);
+		lock_page(ciphertext_page);
+	}
 	return ciphertext_page;
 
 errout:
diff --git a/include/linux/fscrypto.h b/include/linux/fscrypto.h
index ff8b11b26f31..5a65b0e3773f 100644
--- a/include/linux/fscrypto.h
+++ b/include/linux/fscrypto.h
@@ -154,9 +154,15 @@ struct fscrypt_name {
 #define fname_len(p)		((p)->disk_name.len)
 
 /*
+ * fscrypt superblock flags
+ */
+#define FS_CFLG_INPLACE_ENCRYPTION (1U << 1)
+
+/*
  * crypto opertions for filesystems
  */
 struct fscrypt_operations {
+	unsigned int flags;
 	int (*get_context)(struct inode *, void *, size_t);
 	int (*key_prefix)(struct inode *, u8 **);
 	int (*prepare_context)(struct inode *);
-- 
2.7.3
