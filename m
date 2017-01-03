Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cOQ8L-0004Pg-Aa
 for linux-mtd@lists.infradead.org; Tue, 03 Jan 2017 14:32:13 +0000
Received: by mail-wm0-x241.google.com with SMTP id u144so86882948wmu.0
 for <linux-mtd@lists.infradead.org>; Tue, 03 Jan 2017 06:31:52 -0800 (PST)
From: Augusto Mecking Caringi <augustocaringi@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: Augusto Mecking Caringi <augustocaringi@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ubifs: Fix 'unmet direct dependencies' config warning when
 !BLOCK
Date: Tue,  3 Jan 2017 14:31:34 +0000
Message-Id: <1483453903-21297-1-git-send-email-augustocaringi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When UBIFS_FS_ENCRYPTION is selected and BLOCK is not set, the following
warning is given:

warning: (UBIFS_FS_ENCRYPTION) selects FS_ENCRYPTION which has unmet
direct dependencies (BLOCK)

Fix it by making BLOCK a dependency of UBIFS_FS_ENCRYPTION.

Signed-off-by: Augusto Mecking Caringi <augustocaringi@gmail.com>
---
 fs/ubifs/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ubifs/Kconfig b/fs/ubifs/Kconfig
index 0a908ae..e9d7780 100644
--- a/fs/ubifs/Kconfig
+++ b/fs/ubifs/Kconfig
@@ -54,6 +54,7 @@ config UBIFS_ATIME_SUPPORT
 config UBIFS_FS_ENCRYPTION
 	bool "UBIFS Encryption"
 	depends on UBIFS_FS
+	depends on BLOCK
 	select FS_ENCRYPTION
 	default n
 	help
-- 
2.7.4
