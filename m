Received: from mout.kundenserver.de ([212.227.126.134])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIXMt-0002Tg-PT
 for linux-mtd@lists.infradead.org; Fri, 02 Nov 2018 11:12:02 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: Richard Weinberger <richard@nod.at>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Sascha Hauer <s.hauer@pengutronix.de>,
 Stefan Agner <stefan@agner.ch>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ubifs: auth: add CONFIG_KEYS dependency
Date: Fri,  2 Nov 2018 12:11:22 +0100
Message-Id: <20181102111129.276496-1-arnd@arndb.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The new authentication support causes a build failure
when CONFIG_KEYS is disabled, so add a dependency.

fs/ubifs/auth.c: In function 'ubifs_init_authentication':
fs/ubifs/auth.c:249:16: error: implicit declaration of function 'request_key'; did you mean 'request_irq'? [-Werror=implicit-function-declaration]
  keyring_key = request_key(&key_type_logon, c->auth_key_name, NULL);

Fixes: d8a22773a12c ("ubifs: Enable authentication support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 fs/ubifs/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ubifs/Kconfig b/fs/ubifs/Kconfig
index 529856fbccd0..406c88dc039e 100644
--- a/fs/ubifs/Kconfig
+++ b/fs/ubifs/Kconfig
@@ -89,6 +89,7 @@ config UBIFS_FS_SECURITY
 
 config UBIFS_FS_AUTHENTICATION
 	bool "UBIFS authentication support"
+	depends on KEYS
 	select CRYPTO_HMAC
 	help
 	  Enable authentication support for UBIFS. This feature offers protection
-- 
2.18.0
