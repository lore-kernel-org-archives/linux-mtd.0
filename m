Received: from [69.28.251.93] (helo=b32.net)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O9OIQ-0000de-QG
	for linux-mtd@lists.infradead.org; Tue, 04 May 2010 20:00:48 +0000
From: Kevin Cernekee <cernekee@gmail.com>
Date: Tue, 4 May 2010 12:51:34 -0700
Subject: [PATCH] mtd: map.h: add missing bug.h include
Message-Id: <bef290de42df7fe0112febe9f92fd5dc3be2890d@localhost.localdomain>
To: <dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
---
 include/linux/mtd/map.h |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/include/linux/mtd/map.h b/include/linux/mtd/map.h
index b981b87..01703d4 100644
--- a/include/linux/mtd/map.h
+++ b/include/linux/mtd/map.h
@@ -7,6 +7,7 @@
 #include <linux/types.h>
 #include <linux/list.h>
 #include <linux/string.h>
+#include <linux/bug.h>
 
 #include <linux/mtd/compatmac.h>
 
-- 
1.6.3.1
