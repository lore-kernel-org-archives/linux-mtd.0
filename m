Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cEOeW-0000MP-2j
 for linux-mtd@lists.infradead.org; Tue, 06 Dec 2016 22:56:02 +0000
From: David Gstir <david@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: tytso@mit.edu, dedekind1@gmail.com, ebiggers@google.com,
 mhalcrow@google.com, adrian.hunter@intel.com, linux-kernel@vger.kernel.org,
 hch@infradead.org, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 dengler@linutronix.de, sbabic@denx.de, wd@denx.de, richard@nod.at,
 David Gstir <david@sigma-star.at>
Subject: [PATCH v2 2/6] fscrypt: Never allocate fscrypt_ctx on in-place
 encryption
Date: Tue,  6 Dec 2016 23:53:54 +0100
Message-Id: <20161206225358.12126-3-david@sigma-star.at>
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

In case of in-place encryption fscrypt_ctx was allocated but never
released. Since we don't need it for in-place encryption, we skip
allocating it.

Fixes: 1c7dcf69eea3 ("fscrypt: Add in-place encryption mode")

Signed-off-by: David Gstir <david@sigma-star.at>
---
 fs/crypto/crypto.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index 3c1124beae28..8536ac0b50d3 100644
--- a/fs/crypto/crypto.c
+++ b/fs/crypto/crypto.c
@@ -246,16 +246,26 @@ struct page *fscrypt_encrypt_page(const struct inode *inode,
 
 	BUG_ON(plaintext_len % FS_CRYPTO_BLOCK_SIZE != 0);
 
+	if (inode->i_sb->s_cop->flags & FS_CFLG_INPLACE_ENCRYPTION) {
+		/* with inplace-encryption we just encrypt the page */
+		err = do_page_crypto(inode, FS_ENCRYPT, index,
+					plaintext_page, ciphertext_page,
+					plaintext_len, plaintext_offset,
+					gfp_flags);
+		if (err)
+			return ERR_PTR(err);
+
+		return ciphertext_page;
+	}
+
 	ctx = fscrypt_get_ctx(inode, gfp_flags);
 	if (IS_ERR(ctx))
 		return (struct page *)ctx;
 
-	if (!(inode->i_sb->s_cop->flags & FS_CFLG_INPLACE_ENCRYPTION)) {
-		/* The encryption operation will require a bounce page. */
-		ciphertext_page = alloc_bounce_page(ctx, gfp_flags);
-		if (IS_ERR(ciphertext_page))
-			goto errout;
-	}
+	/* The encryption operation will require a bounce page. */
+	ciphertext_page = alloc_bounce_page(ctx, gfp_flags);
+	if (IS_ERR(ciphertext_page))
+		goto errout;
 
 	ctx->w.control_page = plaintext_page;
 	err = do_page_crypto(inode, FS_ENCRYPT, index,
@@ -266,11 +276,9 @@ struct page *fscrypt_encrypt_page(const struct inode *inode,
 		ciphertext_page = ERR_PTR(err);
 		goto errout;
 	}
-	if (!(inode->i_sb->s_cop->flags & FS_CFLG_INPLACE_ENCRYPTION)) {
-		SetPagePrivate(ciphertext_page);
-		set_page_private(ciphertext_page, (unsigned long)ctx);
-		lock_page(ciphertext_page);
-	}
+	SetPagePrivate(ciphertext_page);
+	set_page_private(ciphertext_page, (unsigned long)ctx);
+	lock_page(ciphertext_page);
 	return ciphertext_page;
 
 errout:
-- 
2.10.1
