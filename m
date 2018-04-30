Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fDHj5-0003nM-5S
 for linux-mtd@lists.infradead.org; Mon, 30 Apr 2018 22:56:57 +0000
Received: by mail-pf0-x243.google.com with SMTP id f189so7874412pfa.7
 for <linux-mtd@lists.infradead.org>; Mon, 30 Apr 2018 15:56:47 -0700 (PDT)
From: Eric Biggers <ebiggers3@gmail.com>
To: linux-fscrypt@vger.kernel.org,
	"Theodore Y . Ts'o" <tytso@mit.edu>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 Eric Biggers <ebiggers@google.com>
Subject: [PATCH 09/15] fscrypt: drop empty name check from fname_decrypt()
Date: Mon, 30 Apr 2018 15:51:43 -0700
Message-Id: <20180430225149.183514-10-ebiggers3@gmail.com>
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

fname_decrypt() is validating that the encrypted filename is nonempty.
However, earlier a stronger precondition was already enforced: the
encrypted filename must be at least 16 (FS_CRYPTO_BLOCK_SIZE) bytes.

Drop the redundant check for an empty filename.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/fname.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/fs/crypto/fname.c b/fs/crypto/fname.c
index cc9590b5f371..c4eb3a235ae4 100644
--- a/fs/crypto/fname.c
+++ b/fs/crypto/fname.c
@@ -97,9 +97,6 @@ static int fname_decrypt(struct inode *inode,
 	int res = 0;
 	char iv[FS_CRYPTO_BLOCK_SIZE];
 
-	if (iname->len <= 0)
-		return -EIO;
-
 	/* Allocate request */
 	req = skcipher_request_alloc(tfm, GFP_NOFS);
 	if (!req)
-- 
2.17.0.441.gb46fe60e1d-goog
