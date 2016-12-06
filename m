Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cEOeV-0000M2-RZ
 for linux-mtd@lists.infradead.org; Tue, 06 Dec 2016 22:56:01 +0000
From: David Gstir <david@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: tytso@mit.edu, dedekind1@gmail.com, ebiggers@google.com,
 mhalcrow@google.com, adrian.hunter@intel.com, linux-kernel@vger.kernel.org,
 hch@infradead.org, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 dengler@linutronix.de, sbabic@denx.de, wd@denx.de, richard@nod.at,
 David Gstir <david@sigma-star.at>
Subject: [PATCH v2 1/6] fscrypt: Use correct index in decrypt path.
Date: Tue,  6 Dec 2016 23:53:53 +0100
Message-Id: <20161206225358.12126-2-david@sigma-star.at>
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

Actually use the fs-provided index instead of always using page->index
which is only set for page-cache pages.

Fixes: 9c4bb8a3a9b4 ("fscrypt: Let fs select encryption index/tweak")

Signed-off-by: David Gstir <david@sigma-star.at>
---
 fs/crypto/crypto.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index b6029785714c..3c1124beae28 100644
--- a/fs/crypto/crypto.c
+++ b/fs/crypto/crypto.c
@@ -296,7 +296,7 @@ EXPORT_SYMBOL(fscrypt_encrypt_page);
 int fscrypt_decrypt_page(const struct inode *inode, struct page *page,
 			unsigned int len, unsigned int offs, pgoff_t index)
 {
-	return do_page_crypto(inode, FS_DECRYPT, page->index, page, page, len, offs,
+	return do_page_crypto(inode, FS_DECRYPT, index, page, page, len, offs,
 			GFP_NOFS);
 }
 EXPORT_SYMBOL(fscrypt_decrypt_page);
-- 
2.10.1
