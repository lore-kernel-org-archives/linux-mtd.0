Received: from mail-qg0-x232.google.com ([2607:f8b0:400d:c04::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zu0lg-00017j-5t
 for linux-mtd@lists.infradead.org; Wed, 04 Nov 2015 16:18:38 +0000
Received: by qgad10 with SMTP id d10so44088938qga.3
 for <linux-mtd@lists.infradead.org>; Wed, 04 Nov 2015 08:18:15 -0800 (PST)
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: <linux-mtd@lists.infradead.org>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH 5/6] mtd: pxa3xx_nand: Remove dead code
Date: Wed,  4 Nov 2015 13:13:45 -0300
Message-Id: <1446653626-14802-6-git-send-email-ezequiel@vanguardiasur.com.ar>
In-Reply-To: <1446653626-14802-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1446653626-14802-1-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This macro is not used anymore, so it's just dead code.
Remove it.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 drivers/mtd/nand/pxa3xx_nand.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 89c02f7057fd..0e6eb6c1f9b3 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -30,11 +30,6 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_mtd.h>
-
-#if defined(CONFIG_ARM) && (defined(CONFIG_ARCH_PXA) || defined(CONFIG_ARCH_MMP))
-#define ARCH_HAS_DMA
-#endif
-
 #include <linux/platform_data/mtd-nand-pxa3xx.h>
 
 #define	CHIP_DELAY_TIMEOUT	msecs_to_jiffies(200)
-- 
2.5.2
