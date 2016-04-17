Received: from smtp.gentoo.org ([140.211.166.183])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1arcUN-0007RP-Tg
 for linux-mtd@lists.infradead.org; Sun, 17 Apr 2016 02:31:08 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
 by smtp.gentoo.org (Postfix) with ESMTP id BEA68340834
 for <linux-mtd@lists.infradead.org>; Sun, 17 Apr 2016 02:30:46 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH mtd-utils] include sys/sysmacros.h for major/minor/makedev
Date: Sat, 16 Apr 2016 22:30:45 -0400
Message-Id: <1460860245-14895-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

These functions have always been defined in sys/sysmacros.h under
Linux C libraries.  For some, including sys/types.h implicitly
includes that as well, but glibc wants to deprecate that, and some
others already have.  Include the header explicitly for the funcs.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 include/common.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/common.h b/include/common.h
index fb0ca83..8cb3142 100644
--- a/include/common.h
+++ b/include/common.h
@@ -28,6 +28,7 @@
 #include <errno.h>
 #include <features.h>
 #include <inttypes.h>
+#include <sys/sysmacros.h>
 #include "version.h"
 
 #ifndef PROGRAM_NAME
-- 
2.7.4
