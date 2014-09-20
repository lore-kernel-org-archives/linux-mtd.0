Received: from mail-we0-f177.google.com ([74.125.82.177])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XVNw5-0005LD-1y
 for linux-mtd@lists.infradead.org; Sat, 20 Sep 2014 16:55:02 +0000
Received: by mail-we0-f177.google.com with SMTP id t60so1070032wes.36
 for <linux-mtd@lists.infradead.org>; Sat, 20 Sep 2014 09:54:38 -0700 (PDT)
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Brian Norris <computersforpeace@gmail.com>, Roger Quadros <rogerq@ti.com>
Subject: [PATCH v4 4/5] mtd: nand: Rename OMAP NAND driver
Date: Sat, 20 Sep 2014 17:53:15 +0100
Message-Id: <1411231996-6387-5-git-send-email-ezequiel@vanguardiasur.com.ar>
In-Reply-To: <1411231996-6387-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1411231996-6387-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Cc: Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
 linux-mtd@lists.infradead.org, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Rename it to a less generic name, so the module is built with a meaningful
name instead of the previous 'omap2.ko'.

Acked-by: Roger Quadros <rogerq@ti.com>
Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 drivers/mtd/nand/Makefile                  | 2 +-
 drivers/mtd/nand/{omap2.c => omap2_nand.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename drivers/mtd/nand/{omap2.c => omap2_nand.c} (100%)

diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index b3237b7..4bcdeb0 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -26,7 +26,7 @@ obj-$(CONFIG_MTD_NAND_CS553X)		+= cs553x_nand.o
 obj-$(CONFIG_MTD_NAND_NDFC)		+= ndfc.o
 obj-$(CONFIG_MTD_NAND_ATMEL)		+= atmel_nand.o
 obj-$(CONFIG_MTD_NAND_GPIO)		+= gpio.o
-obj-$(CONFIG_MTD_NAND_OMAP2) 		+= omap2.o
+obj-$(CONFIG_MTD_NAND_OMAP2) 		+= omap2_nand.o
 obj-$(CONFIG_MTD_NAND_OMAP_BCH)		+= omap_elm.o
 obj-$(CONFIG_MTD_NAND_CM_X270)		+= cmx270_nand.o
 obj-$(CONFIG_MTD_NAND_PXA3xx)		+= pxa3xx_nand.o
diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2_nand.c
similarity index 100%
rename from drivers/mtd/nand/omap2.c
rename to drivers/mtd/nand/omap2_nand.c
-- 
2.1.0
