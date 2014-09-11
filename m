Received: from mail-qa0-f41.google.com ([209.85.216.41])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XS4kE-0007t7-ET
 for linux-mtd@lists.infradead.org; Thu, 11 Sep 2014 13:49:06 +0000
Received: by mail-qa0-f41.google.com with SMTP id f12so3441520qad.28
 for <linux-mtd@lists.infradead.org>; Thu, 11 Sep 2014 06:48:44 -0700 (PDT)
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Roger Quadros <rogerq@ti.com>, Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 1/3] mtd: nand: Move ELM driver and rename as omap_elm
Date: Thu, 11 Sep 2014 10:47:02 -0300
Message-Id: <1410443224-18477-2-git-send-email-ezequiel@vanguardiasur.com.ar>
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

The ELM driver is only used by the OMAP NAND driver, so let's move it
to the nand/ directory. Additionally, let's rename it to a less confusing
name, so the module is built with a meaningful name, instead of the previous
'elm.ko'.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 drivers/mtd/devices/Makefile                   | 1 -
 drivers/mtd/nand/Makefile                      | 1 +
 drivers/mtd/{devices/elm.c => nand/omap_elm.c} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename drivers/mtd/{devices/elm.c => nand/omap_elm.c} (100%)

diff --git a/drivers/mtd/devices/Makefile b/drivers/mtd/devices/Makefile
index c68868f..f0b0e61 100644
--- a/drivers/mtd/devices/Makefile
+++ b/drivers/mtd/devices/Makefile
@@ -12,7 +12,6 @@ obj-$(CONFIG_MTD_LART)		+= lart.o
 obj-$(CONFIG_MTD_BLOCK2MTD)	+= block2mtd.o
 obj-$(CONFIG_MTD_DATAFLASH)	+= mtd_dataflash.o
 obj-$(CONFIG_MTD_M25P80)	+= m25p80.o
-obj-$(CONFIG_MTD_NAND_OMAP_BCH)	+= elm.o
 obj-$(CONFIG_MTD_SPEAR_SMI)	+= spear_smi.o
 obj-$(CONFIG_MTD_SST25L)	+= sst25l.o
 obj-$(CONFIG_MTD_BCM47XXSFLASH)	+= bcm47xxsflash.o
diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index a035e7c..b3237b7 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -27,6 +27,7 @@ obj-$(CONFIG_MTD_NAND_NDFC)		+= ndfc.o
 obj-$(CONFIG_MTD_NAND_ATMEL)		+= atmel_nand.o
 obj-$(CONFIG_MTD_NAND_GPIO)		+= gpio.o
 obj-$(CONFIG_MTD_NAND_OMAP2) 		+= omap2.o
+obj-$(CONFIG_MTD_NAND_OMAP_BCH)		+= omap_elm.o
 obj-$(CONFIG_MTD_NAND_CM_X270)		+= cmx270_nand.o
 obj-$(CONFIG_MTD_NAND_PXA3xx)		+= pxa3xx_nand.o
 obj-$(CONFIG_MTD_NAND_TMIO)		+= tmio_nand.o
diff --git a/drivers/mtd/devices/elm.c b/drivers/mtd/nand/omap_elm.c
similarity index 100%
rename from drivers/mtd/devices/elm.c
rename to drivers/mtd/nand/omap_elm.c
-- 
2.1.0
