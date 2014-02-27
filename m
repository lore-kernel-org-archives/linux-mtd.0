Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WJ4Wy-0005Kv-SD
 for linux-mtd@lists.infradead.org; Thu, 27 Feb 2014 17:13:57 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/2] mtd: nand: pxa3xx: Remove unused macro
Date: Thu, 27 Feb 2014 14:13:25 -0300
Message-Id: <1393521206-4623-2-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1393521206-4623-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1393521206-4623-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This macro is not used so it's safe to remove it.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 2a7a0b2..1e136a6 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -38,7 +38,6 @@
 
 #include <linux/platform_data/mtd-nand-pxa3xx.h>
 
-#define NAND_DEV_READY_TIMEOUT  50
 #define	CHIP_DELAY_TIMEOUT	(2 * HZ/10)
 #define NAND_STOP_DELAY		(2 * HZ/50)
 #define PAGE_CHUNK_SIZE		(2048)
-- 
1.8.1.5
