Received: from mout.kundenserver.de ([212.227.126.187])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cHo6a-0007mb-BH
 for linux-mtd@lists.infradead.org; Fri, 16 Dec 2016 08:43:05 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: Richard Weinberger <richard@nod.at>
Cc: Arnd Bergmann <arnd@arndb.de>, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ubifs: add CONFIG_BLOCK dependency for encryption
Date: Fri, 16 Dec 2016 09:42:16 +0100
Message-Id: <20161216084231.1637761-1-arnd@arndb.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This came up during the v4.10 merge window:

warning: (UBIFS_FS_ENCRYPTION) selects FS_ENCRYPTION which has unmet direct dependencies (BLOCK)
fs/crypto/crypto.c: In function 'fscrypt_zeroout_range':
fs/crypto/crypto.c:355:9: error: implicit declaration of function 'bio_alloc';did you mean 'd_alloc'? [-Werror=implicit-function-declaration]
   bio = bio_alloc(GFP_NOWAIT, 1);

The easiest way out is to limit UBIFS_FS_ENCRYPTION to configurations
that also enable BLOCK.

Fixes: d475a507457b ("ubifs: Add skeleton for fscrypto")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 fs/ubifs/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/Kconfig b/fs/ubifs/Kconfig
index 0a908ae7af13..b0d0623c83ed 100644
--- a/fs/ubifs/Kconfig
+++ b/fs/ubifs/Kconfig
@@ -53,7 +53,7 @@ config UBIFS_ATIME_SUPPORT
 
 config UBIFS_FS_ENCRYPTION
 	bool "UBIFS Encryption"
-	depends on UBIFS_FS
+	depends on UBIFS_FS && BLOCK
 	select FS_ENCRYPTION
 	default n
 	help
-- 
2.9.0
