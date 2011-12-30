Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rgfi1-0007Jb-8i
 for linux-mtd@lists.infradead.org; Fri, 30 Dec 2011 16:53:34 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: map.h: fix arm cross-build failure
Date: Fri, 30 Dec 2011 18:55:29 +0200
Message-Id: <1325264129-28752-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

This patch fixes the following build failure:
In file included from include/linux/mtd/qinfo.h:4:0,
                 from include/linux/mtd/pfow.h:7,
                 from drivers/mtd/lpddr/lpddr_cmds.c:27:
include/linux/mtd/map.h: In function 'inline_map_read':
include/linux/mtd/map.h:409:3: error: implicit declaration of function 'BUILD_BUG_ON' [-Werror=implicit-function-declaration]

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 include/linux/mtd/map.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/include/linux/mtd/map.h b/include/linux/mtd/map.h
index 1132410..94e924e 100644
--- a/include/linux/mtd/map.h
+++ b/include/linux/mtd/map.h
@@ -26,7 +26,7 @@
 #include <linux/list.h>
 #include <linux/string.h>
 #include <linux/bug.h>
-
+#include <linux/kernel.h>
 
 #include <asm/unaligned.h>
 #include <asm/system.h>
-- 
1.7.7.3
