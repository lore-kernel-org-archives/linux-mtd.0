Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cqdQn-0007DQ-9x
 for linux-mtd@lists.infradead.org; Wed, 22 Mar 2017 10:23:56 +0000
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: Yuanjie.Huang@windriver.com, raj.khem@gmail.com,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH 3/5] Fix build with musl
Date: Wed, 22 Mar 2017 11:22:55 +0100
Message-Id: <20170322102257.7605-4-david.oberhollenzer@sigma-star.at>
In-Reply-To: <20170322102257.7605-1-david.oberhollenzer@sigma-star.at>
References: <20170322102257.7605-1-david.oberhollenzer@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
---
 jffsX-utils/mkfs.jffs2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/jffsX-utils/mkfs.jffs2.c b/jffsX-utils/mkfs.jffs2.c
index 5446a16..ca5e0d5 100644
--- a/jffsX-utils/mkfs.jffs2.c
+++ b/jffsX-utils/mkfs.jffs2.c
@@ -72,6 +72,7 @@
 #include <byteswap.h>
 #include <crc32.h>
 #include <inttypes.h>
+#include <limits.h>
 
 #include "rbtree.h"
 #include "common.h"
-- 
2.10.2
