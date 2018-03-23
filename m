Received: from mail-pl0-x242.google.com ([2607:f8b0:400e:c01::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ezSPL-0000hK-MA
 for linux-mtd@lists.infradead.org; Fri, 23 Mar 2018 19:31:35 +0000
Received: by mail-pl0-x242.google.com with SMTP id f5-v6so8019306plj.13
 for <linux-mtd@lists.infradead.org>; Fri, 23 Mar 2018 12:31:13 -0700 (PDT)
From: Eric Biggers <ebiggers3@gmail.com>
To: linux-fscrypt@vger.kernel.org,
	"Theodore Y . Ts'o" <tytso@mit.edu>
Cc: linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Eric Biggers <ebiggers@google.com>
Subject: [PATCH 01/14] fscrypt: remove unnecessary NULL check when allocating
 skcipher
Date: Fri, 23 Mar 2018 12:23:45 -0700
Message-Id: <20180323192358.95691-2-ebiggers3@gmail.com>
In-Reply-To: <20180323192358.95691-1-ebiggers3@gmail.com>
References: <20180323192358.95691-1-ebiggers3@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Eric Biggers <ebiggers@google.com>

crypto_alloc_skcipher() returns an ERR_PTR() on failure, not NULL.
Remove the unnecessary check for NULL.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/keyinfo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/crypto/keyinfo.c b/fs/crypto/keyinfo.c
index 96a1eae9e51d..8099388f5581 100644
--- a/fs/crypto/keyinfo.c
+++ b/fs/crypto/keyinfo.c
@@ -320,8 +320,8 @@ int fscrypt_get_encryption_info(struct inode *inode)
 		goto out;
 	}
 	ctfm = crypto_alloc_skcipher(cipher_str, 0, 0);
-	if (!ctfm || IS_ERR(ctfm)) {
-		res = ctfm ? PTR_ERR(ctfm) : -ENOMEM;
+	if (IS_ERR(ctfm)) {
+		res = PTR_ERR(ctfm);
 		pr_debug("%s: error %d (inode %lu) allocating crypto tfm\n",
 			 __func__, res, inode->i_ino);
 		goto out;
-- 
2.17.0.rc0.231.g781580f067-goog
