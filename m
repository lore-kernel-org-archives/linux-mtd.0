Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZAAgF-0003QW-16
 for linux-mtd@lists.infradead.org; Wed, 01 Jul 2015 05:35:31 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <richard.weinberger@gmail.com>, <dedekind1@gmail.com>
CC: <linux-mtd@lists.infradead.org>, Dongsheng Yang
 <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH 1/2] ubifs: Kconfig: fix the description in Kconfig
Date: Wed, 1 Jul 2015 13:29:59 +0800
Message-ID: <1435728600-14560-1-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If unsure we would say 'N' rather than 'Y'.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 fs/ubifs/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/Kconfig b/fs/ubifs/Kconfig
index ba66d50..f9aaad1 100644
--- a/fs/ubifs/Kconfig
+++ b/fs/ubifs/Kconfig
@@ -27,11 +27,11 @@ config UBIFS_FS_LZO
 	default y
 	help
 	   LZO compressor is generally faster than zlib but compresses worse.
-	   Say 'Y' if unsure.
+	   Say 'N' if unsure.
 
 config UBIFS_FS_ZLIB
 	bool "ZLIB compression support" if UBIFS_FS_ADVANCED_COMPR
 	depends on UBIFS_FS
 	default y
 	help
-	  Zlib compresses better than LZO but it is slower. Say 'Y' if unsure.
+	  Zlib compresses better than LZO but it is slower. Say 'N' if unsure.
-- 
1.8.4.2
