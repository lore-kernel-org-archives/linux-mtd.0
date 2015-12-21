Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aAwBT-0000ke-DK
 for linux-mtd@lists.infradead.org; Mon, 21 Dec 2015 08:51:13 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <computersforpeace@gmail.com>, <richard@nod.at>, <david@sigma-star.at>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH 35/38] ubifs: add missing include to defs.h
Date: Mon, 21 Dec 2015 16:41:58 +0800
Message-ID: <1450687321-12381-36-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1450687321-12381-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1450687321-12381-1-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: David Gstir <david@sigma-star.at>

Signed-off-by: David Gstir <david@sigma-star.at>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 ubifs-utils/include/defs.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ubifs-utils/include/defs.h b/ubifs-utils/include/defs.h
index 91ef175..93ff912 100644
--- a/ubifs-utils/include/defs.h
+++ b/ubifs-utils/include/defs.h
@@ -16,6 +16,7 @@
 #include <stddef.h>
 #include <linux/types.h>
 #include <stdint.h>
+#include <limits.h>
 
 #include <features.h>
 
-- 
1.8.4.2
