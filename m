Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fDHj2-0003mW-H6
 for linux-mtd@lists.infradead.org; Mon, 30 Apr 2018 22:56:56 +0000
Received: by mail-pg0-x241.google.com with SMTP id i29-v6so7244709pgn.12
 for <linux-mtd@lists.infradead.org>; Mon, 30 Apr 2018 15:56:43 -0700 (PDT)
From: Eric Biggers <ebiggers3@gmail.com>
To: linux-fscrypt@vger.kernel.org,
	"Theodore Y . Ts'o" <tytso@mit.edu>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 Eric Biggers <ebiggers@google.com>
Subject: [PATCH 04/15] fscrypt: remove error messages for
 skcipher_request_alloc() failure
Date: Mon, 30 Apr 2018 15:51:38 -0700
Message-Id: <20180430225149.183514-5-ebiggers3@gmail.com>
In-Reply-To: <20180430225149.183514-1-ebiggers3@gmail.com>
References: <20180430225149.183514-1-ebiggers3@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Eric Biggers <ebiggers@google.com>

skcipher_request_alloc() can only fail due to lack of memory, and in
that case the memory allocator will have already printed a detailed
error message.  Thus, remove the redundant error messages from fscrypt.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/crypto.c |  6 +-----
 fs/crypto/fname.c  | 10 ++--------
 2 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index f2b2d8408a01..58761d816751 100644
--- a/fs/crypto/crypto.c
+++ b/fs/crypto/crypto.c
@@ -156,12 +156,8 @@ int fscrypt_do_page_crypto(const struct inode *inode, fscrypt_direction_t rw,
 	}
 
 	req = skcipher_request_alloc(tfm, gfp_flags);
-	if (!req) {
-		printk_ratelimited(KERN_ERR
-				"%s: crypto_request_alloc() failed\n",
-				__func__);
+	if (!req)
 		return -ENOMEM;
-	}
 
 	skcipher_request_set_callback(
 		req, CRYPTO_TFM_REQ_MAY_BACKLOG | CRYPTO_TFM_REQ_MAY_SLEEP,
diff --git a/fs/crypto/fname.c b/fs/crypto/fname.c
index e33f3d3c5ade..3b5164b159cb 100644
--- a/fs/crypto/fname.c
+++ b/fs/crypto/fname.c
@@ -59,11 +59,8 @@ int fname_encrypt(struct inode *inode, const struct qstr *iname,
 
 	/* Set up the encryption request */
 	req = skcipher_request_alloc(tfm, GFP_NOFS);
-	if (!req) {
-		printk_ratelimited(KERN_ERR
-			"%s: skcipher_request_alloc() failed\n", __func__);
+	if (!req)
 		return -ENOMEM;
-	}
 	skcipher_request_set_callback(req,
 			CRYPTO_TFM_REQ_MAY_BACKLOG | CRYPTO_TFM_REQ_MAY_SLEEP,
 			crypto_req_done, &wait);
@@ -108,11 +105,8 @@ static int fname_decrypt(struct inode *inode,
 
 	/* Allocate request */
 	req = skcipher_request_alloc(tfm, GFP_NOFS);
-	if (!req) {
-		printk_ratelimited(KERN_ERR
-			"%s: crypto_request_alloc() failed\n",  __func__);
+	if (!req)
 		return -ENOMEM;
-	}
 	skcipher_request_set_callback(req,
 		CRYPTO_TFM_REQ_MAY_BACKLOG | CRYPTO_TFM_REQ_MAY_SLEEP,
 		crypto_req_done, &wait);
-- 
2.17.0.441.gb46fe60e1d-goog
