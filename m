Received: from cmccmta2.chinamobile.com ([221.176.66.80])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ajHhy-00023T-N5
 for linux-mtd@lists.infradead.org; Fri, 25 Mar 2016 02:42:45 +0000
From: Yaowei Bai <baiyaowei@cmss.chinamobile.com>
To: dwmw2@infradead.org, computersforpeace@gmail.com, richard@nod.at,
 boris.brezillon@free-electrons.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 baiyaowei@cmss.chinamobile.com
Subject: [PATCH 3/5] drivers/mtd: map_bankwidth_supported can be boolean
Date: Fri, 25 Mar 2016 10:41:53 +0800
Message-Id: <1458873715-3670-4-git-send-email-baiyaowei@cmss.chinamobile.com>
In-Reply-To: <1458873715-3670-1-git-send-email-baiyaowei@cmss.chinamobile.com>
References: <1458873715-3670-1-git-send-email-baiyaowei@cmss.chinamobile.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch makes map_bankwidth_supported return bool due to this
particular function only using either one or zero as its return
value.

No functional change.

Signed-off-by: Yaowei Bai <baiyaowei@cmss.chinamobile.com>
---
 include/linux/mtd/map.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/mtd/map.h b/include/linux/mtd/map.h
index 58f3ba7..130a1b3 100644
--- a/include/linux/mtd/map.h
+++ b/include/linux/mtd/map.h
@@ -155,7 +155,7 @@ static inline int map_bankwidth(void *map)
 #define MAX_MAP_BANKWIDTH 1
 #endif
 
-static inline int map_bankwidth_supported(int w)
+static inline bool map_bankwidth_supported(int w)
 {
 	switch (w) {
 #ifdef CONFIG_MTD_MAP_BANK_WIDTH_1
@@ -176,10 +176,10 @@ static inline int map_bankwidth_supported(int w)
 #ifdef CONFIG_MTD_MAP_BANK_WIDTH_32
 	case 32:
 #endif
-		return 1;
+		return true;
 
 	default:
-		return 0;
+		return false;
 	}
 }
 
-- 
1.9.1
