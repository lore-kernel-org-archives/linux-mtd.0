Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vyja2-0004AZ-4X
 for linux-mtd@lists.infradead.org; Thu, 02 Jan 2014 14:49:03 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH] MAINTAINERS: keep UBI and UBIFS stuff in the same tree
Date: Thu,  2 Jan 2014 16:48:13 +0200
Message-Id: <1388674093-11094-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

These 2 subsystems are so much related, and the traffic there became rather
small, so that maintaining 2 separate git trees adds no value, just burden.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d5e4ff3..16e24ce 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8888,7 +8888,7 @@ UNSORTED BLOCK IMAGES (UBI)
 M:	Artem Bityutskiy <dedekind1@gmail.com>
 W:	http://www.linux-mtd.infradead.org/
 L:	linux-mtd@lists.infradead.org
-T:	git git://git.infradead.org/ubi-2.6.git
+T:	git git://git.infradead.org/ubifs-2.6.git
 S:	Maintained
 F:	drivers/mtd/ubi/
 F:	include/linux/mtd/ubi.h
-- 
1.8.5.2
