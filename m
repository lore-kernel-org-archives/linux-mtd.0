Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ah3m2-0005uY-8c
 for linux-mtd@lists.infradead.org; Fri, 18 Mar 2016 23:25:45 +0000
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH] ubifs: Remove unused header
Date: Sat, 19 Mar 2016 00:25:11 +0100
Message-Id: <1458343511-11538-1-git-send-email-agruenba@redhat.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

UBIFS does not support POSIX ACLs, so there is no need for including any
POSIX ACL hesders.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/ubifs/xattr.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index c7f4d434..b043e04 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -59,7 +59,6 @@
 #include <linux/fs.h>
 #include <linux/slab.h>
 #include <linux/xattr.h>
-#include <linux/posix_acl_xattr.h>
 
 /*
  * Limit the number of extended attributes per inode so that the total size
-- 
2.4.3
