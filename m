Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cEOer-0000XO-Os
 for linux-mtd@lists.infradead.org; Tue, 06 Dec 2016 22:56:23 +0000
From: David Gstir <david@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: tytso@mit.edu, dedekind1@gmail.com, ebiggers@google.com,
 mhalcrow@google.com, adrian.hunter@intel.com, linux-kernel@vger.kernel.org,
 hch@infradead.org, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 dengler@linutronix.de, sbabic@denx.de, wd@denx.de, richard@nod.at,
 David Gstir <david@sigma-star.at>
Subject: [PATCH v2 6/6] fscrypt: Rename FS_WRITE_PATH_FL to
 FS_CTX_HAS_BOUNCE_BUFFER_FL
Date: Tue,  6 Dec 2016 23:53:58 +0100
Message-Id: <20161206225358.12126-7-david@sigma-star.at>
In-Reply-To: <20161206225358.12126-1-david@sigma-star.at>
References: <20161206225358.12126-1-david@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

... to better explain its purpose after introducing in-place encryption
without bounce buffer.

Signed-off-by: David Gstir <david@sigma-star.at>
---
 fs/crypto/crypto.c       | 6 +++---
 include/linux/fscrypto.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index c1e4316045e9..20dd4402af42 100644
--- a/fs/crypto/crypto.c
+++ b/fs/crypto/crypto.c
@@ -63,7 +63,7 @@ void fscrypt_release_ctx(struct fscrypt_ctx *ctx)
 {
 	unsigned long flags;
 
-	if (ctx->flags & FS_WRITE_PATH_FL && ctx->w.bounce_page) {
+	if (ctx->flags & FS_CTX_HAS_BOUNCE_BUFFER_FL && ctx->w.bounce_page) {
 		mempool_free(ctx->w.bounce_page, fscrypt_bounce_page_pool);
 		ctx->w.bounce_page = NULL;
 	}
@@ -121,7 +121,7 @@ struct fscrypt_ctx *fscrypt_get_ctx(const struct inode *inode, gfp_t gfp_flags)
 	} else {
 		ctx->flags &= ~FS_CTX_REQUIRES_FREE_ENCRYPT_FL;
 	}
-	ctx->flags &= ~FS_WRITE_PATH_FL;
+	ctx->flags &= ~FS_CTX_HAS_BOUNCE_BUFFER_FL;
 	return ctx;
 }
 EXPORT_SYMBOL(fscrypt_get_ctx);
@@ -210,7 +210,7 @@ static struct page *alloc_bounce_page(struct fscrypt_ctx *ctx, gfp_t gfp_flags)
 	ctx->w.bounce_page = mempool_alloc(fscrypt_bounce_page_pool, gfp_flags);
 	if (ctx->w.bounce_page == NULL)
 		return ERR_PTR(-ENOMEM);
-	ctx->flags |= FS_WRITE_PATH_FL;
+	ctx->flags |= FS_CTX_HAS_BOUNCE_BUFFER_FL;
 	return ctx->w.bounce_page;
 }
 
diff --git a/include/linux/fscrypto.h b/include/linux/fscrypto.h
index 6039c86ff849..00aa834bf2d9 100644
--- a/include/linux/fscrypto.h
+++ b/include/linux/fscrypto.h
@@ -84,7 +84,7 @@ struct fscrypt_info {
 };
 
 #define FS_CTX_REQUIRES_FREE_ENCRYPT_FL		0x00000001
-#define FS_WRITE_PATH_FL			0x00000002
+#define FS_CTX_HAS_BOUNCE_BUFFER_FL		0x00000002
 
 struct fscrypt_ctx {
 	union {
-- 
2.10.1
