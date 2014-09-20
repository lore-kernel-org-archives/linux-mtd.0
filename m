Received: from mail-wi0-f180.google.com ([209.85.212.180])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XVNw4-0005L9-Nu
 for linux-mtd@lists.infradead.org; Sat, 20 Sep 2014 16:55:01 +0000
Received: by mail-wi0-f180.google.com with SMTP id q5so965664wiv.7
 for <linux-mtd@lists.infradead.org>; Sat, 20 Sep 2014 09:54:37 -0700 (PDT)
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Brian Norris <computersforpeace@gmail.com>, Roger Quadros <rogerq@ti.com>
Subject: [PATCH v4 3/5] mtd: nand: Move ELM driver and rename as omap_elm
Date: Sat, 20 Sep 2014 17:53:14 +0100
Message-Id: <1411231996-6387-4-git-send-email-ezequiel@vanguardiasur.com.ar>
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

The ELM driver is only used by the OMAP NAND driver, so let's move it
to the nand/ directory. Additionally, let's rename it to a less confusing
name, so the module is built with a meaningful name, instead of the previous
'elm.ko'.

Acked-by: Roger Quadros <rogerq@ti.com>
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
