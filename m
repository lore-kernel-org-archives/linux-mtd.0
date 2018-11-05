Received: from xavier.telenet-ops.be ([2a02:1800:120:4::f00:14])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJb8C-0003Kv-0T
 for linux-mtd@lists.infradead.org; Mon, 05 Nov 2018 09:25:13 +0000
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Sascha Hauer <s.hauer@pengutronix.de>, Richard Weinberger <richard@nod.at>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] ubifs: CONFIG_UBIFS_FS_AUTHENTICATION should depend on
 UBIFS_FS
Date: Mon,  5 Nov 2018 09:25:40 +0100
Message-Id: <20181105082540.21205-1-geert@linux-m68k.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Instead of adding yet another dependency on UBIFS_FS, wrap the whole
block of ubifs config options in a single "if UBIFS_FS".

Fixes: d8a22773a12c6d78 ("ubifs: Enable authentication support")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 fs/ubifs/Kconfig | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/fs/ubifs/Kconfig b/fs/ubifs/Kconfig
index 529856fbccd0ee5f..3ee613361f4eeded 100644
--- a/fs/ubifs/Kconfig
+++ b/fs/ubifs/Kconfig
@@ -12,9 +12,10 @@ config UBIFS_FS
 	help
 	  UBIFS is a file system for flash devices which works on top of UBI.
 
+if UBIFS_FS
+
 config UBIFS_FS_ADVANCED_COMPR
 	bool "Advanced compression options"
-	depends on UBIFS_FS
 	help
 	  This option allows to explicitly choose which compressions, if any,
 	  are enabled in UBIFS. Removing compressors means inability to read
@@ -24,7 +25,6 @@ config UBIFS_FS_ADVANCED_COMPR
 
 config UBIFS_FS_LZO
 	bool "LZO compression support" if UBIFS_FS_ADVANCED_COMPR
-	depends on UBIFS_FS
 	default y
 	help
 	   LZO compressor is generally faster than zlib but compresses worse.
@@ -32,14 +32,12 @@ config UBIFS_FS_LZO
 
 config UBIFS_FS_ZLIB
 	bool "ZLIB compression support" if UBIFS_FS_ADVANCED_COMPR
-	depends on UBIFS_FS
 	default y
 	help
 	  Zlib compresses better than LZO but it is slower. Say 'Y' if unsure.
 
 config UBIFS_ATIME_SUPPORT
-	bool "Access time support" if UBIFS_FS
-	depends on UBIFS_FS
+	bool "Access time support"
 	default n
 	help
 	  Originally UBIFS did not support atime, because it looked like a bad idea due
@@ -54,7 +52,6 @@ config UBIFS_ATIME_SUPPORT
 
 config UBIFS_FS_XATTR
 	bool "UBIFS XATTR support"
-	depends on UBIFS_FS
 	default y
 	help
 	  Saying Y here includes support for extended attributes (xattrs).
@@ -65,7 +62,7 @@ config UBIFS_FS_XATTR
 
 config UBIFS_FS_ENCRYPTION
 	bool "UBIFS Encryption"
-	depends on UBIFS_FS && UBIFS_FS_XATTR && BLOCK
+	depends on UBIFS_FS_XATTR && BLOCK
 	select FS_ENCRYPTION
 	default n
 	help
@@ -76,7 +73,7 @@ config UBIFS_FS_ENCRYPTION
 
 config UBIFS_FS_SECURITY
 	bool "UBIFS Security Labels"
-	depends on UBIFS_FS && UBIFS_FS_XATTR
+	depends on UBIFS_FS_XATTR
 	default y
 	help
 	  Security labels provide an access control facility to support Linux
@@ -96,3 +93,5 @@ config UBIFS_FS_AUTHENTICATION
 	  If you say yes here you should also select a hashing algorithm such as
 	  sha256, these are not selected automatically since there are many
 	  different options.
+
+endif # UBIFS_FS
-- 
2.17.1
