Received: from smtp.transmode.se ([31.15.61.139])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cvjbL-0005SI-3N
 for linux-mtd@lists.infradead.org; Wed, 05 Apr 2017 11:59:55 +0000
From: Mathias Thore <mathias.thore@infinera.com>
To: linux-mtd@lists.infradead.org
Cc: Mathias Thore <mathias.thore@infinera.com>
Subject: [PATCH] mtd: cfi_cmdset_0002: PPB locking support for larger capacity
 devices
Date: Wed,  5 Apr 2017 13:57:43 +0200
Message-Id: <20170405115743.27441-1-mathias.thore@infinera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Currently cfi_cmdset_0002.c supports advanced sector protection scheme
for devices with 512 or fewer sectors. This patch increases the limit
to enable advanced sector protection on devices with larger capacity.

Signed-off-by: Mathias Thore <mathias.thore@infinera.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 9dca881..4966f12 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -2532,7 +2532,7 @@ struct ppb_lock {
 	int locked;
 };
 
-#define MAX_SECTORS			512
+#define MAX_SECTORS			1024
 
 #define DO_XXLOCK_ONEBLOCK_LOCK		((void *)1)
 #define DO_XXLOCK_ONEBLOCK_UNLOCK	((void *)2)
-- 
2.10.2
