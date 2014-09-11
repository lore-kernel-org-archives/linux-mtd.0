Received: from mail-qg0-f45.google.com ([209.85.192.45])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XS4kN-000834-LF
 for linux-mtd@lists.infradead.org; Thu, 11 Sep 2014 13:49:16 +0000
Received: by mail-qg0-f45.google.com with SMTP id j107so7422447qga.4
 for <linux-mtd@lists.infradead.org>; Thu, 11 Sep 2014 06:48:50 -0700 (PDT)
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Roger Quadros <rogerq@ti.com>, Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 3/3] mtd: nand: Force omap_elm to be built as a module if
 omap2_nand is a module
Date: Thu, 11 Sep 2014 10:47:04 -0300
Message-Id: <1410443224-18477-4-git-send-email-ezequiel@vanguardiasur.com.ar>
In-Reply-To: <1410443224-18477-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1410443224-18477-1-git-send-email-ezequiel@vanguardiasur.com.ar>
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

This commit adds a hidden option to build the omap_elm as a module, if
omap2_nand is a module (and similarly in the built-in case).

This fixes the following build error when omap2_nand is chosen built-in,
and omap_elm is chosen as a module:

drivers/built-in.o: In function `omap_nand_probe':
/work/linux-2.6/drivers/mtd/nand/omap2.c:2010: undefined reference to `elm_config'
/work/linux-2.6/drivers/mtd/nand/omap2.c:1980: undefined reference to `elm_config'
/work/linux-2.6/drivers/mtd/nand/omap2.c:1927: undefined reference to `elm_config'
drivers/built-in.o: In function `omap_elm_correct_data':
/work/linux-2.6/drivers/mtd/nand/omap2.c:1444: undefined reference to `elm_decode_bch_error_page'

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 drivers/mtd/nand/Kconfig  | 8 +++++++-
 drivers/mtd/nand/Makefile | 2 +-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index f1cf503..12e8ee8 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -96,7 +96,7 @@ config MTD_NAND_OMAP2
 
 config MTD_NAND_OMAP_BCH
 	depends on MTD_NAND_OMAP2
-	tristate "Support hardware based BCH error correction"
+	bool "Support hardware based BCH error correction"
 	default n
 	select BCH
 	help
@@ -106,6 +106,12 @@ config MTD_NAND_OMAP_BCH
 	  legacy OMAP families like OMAP2xxx, OMAP3xxx do not have ELM engine
 	  so they should not enable this config symbol.
 
+config MTD_NAND_OMAP_BCH_BUILD
+	tristate
+	depends on MTD_NAND_OMAP2
+	default m if MTD_NAND_OMAP2=m && MTD_NAND_OMAP_BCH
+	default y if MTD_NAND_OMAP2=y && MTD_NAND_OMAP_BCH
+
 config MTD_NAND_IDS
 	tristate
 
diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index 4bcdeb0..3580188 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -27,7 +27,7 @@ obj-$(CONFIG_MTD_NAND_NDFC)		+= ndfc.o
 obj-$(CONFIG_MTD_NAND_ATMEL)		+= atmel_nand.o
 obj-$(CONFIG_MTD_NAND_GPIO)		+= gpio.o
 obj-$(CONFIG_MTD_NAND_OMAP2) 		+= omap2_nand.o
-obj-$(CONFIG_MTD_NAND_OMAP_BCH)		+= omap_elm.o
+obj-$(CONFIG_MTD_NAND_OMAP_BCH_BUILD)	+= omap_elm.o
 obj-$(CONFIG_MTD_NAND_CM_X270)		+= cmx270_nand.o
 obj-$(CONFIG_MTD_NAND_PXA3xx)		+= pxa3xx_nand.o
 obj-$(CONFIG_MTD_NAND_TMIO)		+= tmio_nand.o
-- 
2.1.0
