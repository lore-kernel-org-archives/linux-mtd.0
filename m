Received: from mail.sigma-star.at ([95.130.255.111])
 by casper.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCZdZ-0002zD-Uo
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2016 22:15:30 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david@sigma-star.at, tytso@mit.edu, dedekind1@gmail.com,
 ebiggers@google.com, mhalcrow@google.com, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org, hch@infradead.org,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, dengler@linutronix.de,
 sbabic@denx.de, wd@denx.de, Richard Weinberger <richard@nod.at>
Subject: [PATCH 2/6] fscrypt: Release fscrypt context on in-place encryption
Date: Thu,  1 Dec 2016 23:14:54 +0100
Message-Id: <1480630498-19201-3-git-send-email-richard@nod.at>
In-Reply-To: <1480630498-19201-1-git-send-email-richard@nod.at>
References: <1480630498-19201-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: David Gstir <david@sigma-star.at>

In case of in-place encryption ctx must be released right away.
Otherwise ctx is never freed.

Fixes: 1c7dcf69eea3 ("fscrypt: Add in-place encryption mode")
Signed-off-by: David Gstir <david@sigma-star.at>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/crypto/crypto.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index 3c1124beae28..1b877fcec1c1 100644
--- a/fs/crypto/crypto.c
+++ b/fs/crypto/crypto.c
@@ -270,6 +270,8 @@ struct page *fscrypt_encrypt_page(const struct inode *inode,
 		SetPagePrivate(ciphertext_page);
 		set_page_private(ciphertext_page, (unsigned long)ctx);
 		lock_page(ciphertext_page);
+	} else {
+		fscrypt_release_ctx(ctx);
 	}
 	return ciphertext_page;
 
-- 
2.7.3
