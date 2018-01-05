Received: from mail-it0-x244.google.com ([2607:f8b0:4001:c0b::244])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eXXBP-0001Lr-Cb
 for linux-mtd@lists.infradead.org; Fri, 05 Jan 2018 18:57:43 +0000
Received: by mail-it0-x244.google.com with SMTP id x28so2633310ita.0
 for <linux-mtd@lists.infradead.org>; Fri, 05 Jan 2018 10:57:26 -0800 (PST)
From: Eric Biggers <ebiggers3@gmail.com>
To: linux-fscrypt@vger.kernel.org,
	"Theodore Y . Ts'o" <tytso@mit.edu>
Cc: linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 Eric Biggers <ebiggers@google.com>
Subject: [PATCH v2 03/11] fscrypt: move fscrypt_info_cachep declaration to
 fscrypt_private.h
Date: Fri,  5 Jan 2018 10:44:54 -0800
Message-Id: <20180105184502.48473-4-ebiggers3@gmail.com>
In-Reply-To: <20180105184502.48473-1-ebiggers3@gmail.com>
References: <20180105184502.48473-1-ebiggers3@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Eric Biggers <ebiggers@google.com>

The fscrypt_info kmem_cache is internal to fscrypt; filesystems don't
need to access it.  So move its declaration into fscrypt_private.h.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/fscrypt_private.h  | 1 +
 include/linux/fscrypt_supp.h | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index c0b4f5597e1a..823c43a00bf7 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -72,6 +72,7 @@ typedef enum {
 #define FS_CTX_HAS_BOUNCE_BUFFER_FL		0x00000002
 
 /* crypto.c */
+extern struct kmem_cache *fscrypt_info_cachep;
 extern int fscrypt_initialize(unsigned int cop_flags);
 extern struct workqueue_struct *fscrypt_read_workqueue;
 extern int fscrypt_do_page_crypto(const struct inode *inode,
diff --git a/include/linux/fscrypt_supp.h b/include/linux/fscrypt_supp.h
index ad40780d4653..33d641e27c18 100644
--- a/include/linux/fscrypt_supp.h
+++ b/include/linux/fscrypt_supp.h
@@ -17,7 +17,6 @@ static inline bool fscrypt_has_encryption_key(const struct inode *inode)
 }
 
 /* crypto.c */
-extern struct kmem_cache *fscrypt_info_cachep;
 extern struct fscrypt_ctx *fscrypt_get_ctx(const struct inode *, gfp_t);
 extern void fscrypt_release_ctx(struct fscrypt_ctx *);
 extern struct page *fscrypt_encrypt_page(const struct inode *, struct page *,
-- 
2.16.0.rc0.223.g4a4ac83678-goog
