Received: from mail-pf0-x22f.google.com ([2607:f8b0:400e:c00::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aN5nA-0001Wa-CE
 for linux-mtd@lists.infradead.org; Sat, 23 Jan 2016 21:32:21 +0000
Received: by mail-pf0-x22f.google.com with SMTP id 65so60756574pff.2
 for <linux-mtd@lists.infradead.org>; Sat, 23 Jan 2016 13:31:59 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Marc Kleine-Budde <mkl@pengutronix.de>, Richard Weinberger <richard@nod.at>
Subject: [mtd-utils PATCH] mkfs.ubifs: <sys/xattr.h>, not <attr/xattr.h>
Date: Sat, 23 Jan 2016 13:31:50 -0800
Message-Id: <1453584710-27273-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

To be consistent with mkfs.jffs2, and to get this to build on my
machine, it looks like we should use <sys/xattr.h>, not <attr/xattr.h>.

Fixes this error, seen on an Ubuntu 14.04 build system:

  ubifs-utils/mkfs.ubifs/mkfs.ubifs.c:30:24: fatal error: attr/xattr.h: No such file or directory
   #include <attr/xattr.h>
                          ^

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Richard Weinberger <richard@nod.at>
---
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
index 27f8d0a160c3..a60052d12c46 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -27,7 +27,7 @@
 #include "common.h"
 #include <sys/types.h>
 #ifndef WITHOUT_XATTR
-#include <attr/xattr.h>
+#include <sys/xattr.h>
 #endif
 
 /* Size (prime number) of hash table for link counting */
-- 
2.7.0.rc3.207.g0ac5344
