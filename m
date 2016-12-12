Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cGa1I-0003ND-UJ
 for linux-mtd@lists.infradead.org; Mon, 12 Dec 2016 23:28:34 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, adrian.hunter@intel.com, dedekind1@gmail.com,
 david@sigma-star.at, Richard Weinberger <richard@nod.at>
Subject: [PATCH 1/2] ubifs: Use FS_CFLG_OWN_PAGES
Date: Tue, 13 Dec 2016 00:27:58 +0100
Message-Id: <20161212232759.30239-1-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit bd7b8290388d ("fscrypt: Cleanup page locking requirements for
fscrypt_{decrypt,encrypt}_page()") renamed the flag.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/crypto.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/crypto.c b/fs/ubifs/crypto.c
index aefa3c30b73b..3402720f2b28 100644
--- a/fs/ubifs/crypto.c
+++ b/fs/ubifs/crypto.c
@@ -87,7 +87,7 @@ int ubifs_decrypt(const struct inode *inode, struct ubifs_data_node *dn,
 }
 
 struct fscrypt_operations ubifs_crypt_operations = {
-	.flags			= FS_CFLG_INPLACE_ENCRYPTION,
+	.flags			= FS_CFLG_OWN_PAGES,
 	.get_context		= ubifs_crypt_get_context,
 	.set_context		= ubifs_crypt_set_context,
 	.is_encrypted		= __ubifs_crypt_is_encrypted,
-- 
2.10.2
