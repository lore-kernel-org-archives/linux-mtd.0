Received: from cmccmta2.chinamobile.com ([221.176.66.80])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ajHi0-00023V-F7
 for linux-mtd@lists.infradead.org; Fri, 25 Mar 2016 02:42:46 +0000
From: Yaowei Bai <baiyaowei@cmss.chinamobile.com>
To: dwmw2@infradead.org, computersforpeace@gmail.com, richard@nod.at,
 boris.brezillon@free-electrons.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 baiyaowei@cmss.chinamobile.com
Subject: [PATCH 2/5] drivers/mtd: cfi_interleave_supported can be boolean
Date: Fri, 25 Mar 2016 10:41:52 +0800
Message-Id: <1458873715-3670-3-git-send-email-baiyaowei@cmss.chinamobile.com>
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

This patch makes cfi_interleave_supported return bool due to this
particular function only using either one or zero as its return
value.

No functional change.

Signed-off-by: Yaowei Bai <baiyaowei@cmss.chinamobile.com>
---
 include/linux/mtd/cfi.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/mtd/cfi.h b/include/linux/mtd/cfi.h
index 9b57a9b..68323bc 100644
--- a/include/linux/mtd/cfi.h
+++ b/include/linux/mtd/cfi.h
@@ -81,7 +81,7 @@ static inline int cfi_interleave(void *cfi)
 }
 #endif
 
-static inline int cfi_interleave_supported(int i)
+static inline bool cfi_interleave_supported(int i)
 {
 	switch (i) {
 #ifdef CONFIG_MTD_CFI_I1
@@ -96,10 +96,10 @@ static inline int cfi_interleave_supported(int i)
 #ifdef CONFIG_MTD_CFI_I8
 	case 8:
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
