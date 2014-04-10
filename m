Received: from mail-ig0-x232.google.com ([2607:f8b0:4001:c05::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WYKXh-0005vR-RX
 for linux-mtd@lists.infradead.org; Thu, 10 Apr 2014 19:21:46 +0000
Received: by mail-ig0-f178.google.com with SMTP id hn18so4173939igb.17
 for <linux-mtd@lists.infradead.org>; Thu, 10 Apr 2014 12:21:24 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 05/10] mtd: spi-nor: shorten Kconfig naming
Date: Thu, 10 Apr 2014 12:20:59 -0700
Message-Id: <1397157664-24405-6-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1397157664-24405-1-git-send-email-computersforpeace@gmail.com>
References: <1397157664-24405-1-git-send-email-computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Huang Shijie <b32955@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>, Lee Jones <lee.jones@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Reviewed-by: Marek Vasut <marex@denx.de>
Acked-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/Makefile         |  2 +-
 drivers/mtd/devices/Kconfig  |  2 +-
 drivers/mtd/spi-nor/Kconfig  | 11 ++++++++---
 drivers/mtd/spi-nor/Makefile |  2 +-
 4 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
index 40fd15344387..99bb9a1f6e16 100644
--- a/drivers/mtd/Makefile
+++ b/drivers/mtd/Makefile
@@ -32,5 +32,5 @@ inftl-objs		:= inftlcore.o inftlmount.o
 
 obj-y		+= chips/ lpddr/ maps/ devices/ nand/ onenand/ tests/
 
-obj-$(CONFIG_MTD_SPI_NOR_BASE)	+= spi-nor/
+obj-$(CONFIG_MTD_SPI_NOR)	+= spi-nor/
 obj-$(CONFIG_MTD_UBI)		+= ubi/
diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
index 48aa1aa5820b..f9e32b53dfc6 100644
--- a/drivers/mtd/devices/Kconfig
+++ b/drivers/mtd/devices/Kconfig
@@ -80,7 +80,7 @@ config MTD_DATAFLASH_OTP
 
 config MTD_M25P80
 	tristate "Support most SPI Flash chips (AT26DF, M25P, W25X, ...)"
-	depends on SPI_MASTER && MTD_SPI_NOR_BASE
+	depends on SPI_MASTER && MTD_SPI_NOR
 	help
 	  This enables access to most modern SPI flash chips, used for
 	  program and data storage.   Series supported include Atmel AT26DF,
diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
index 64cfc39ad17e..d682fb440e06 100644
--- a/drivers/mtd/spi-nor/Kconfig
+++ b/drivers/mtd/spi-nor/Kconfig
@@ -1,12 +1,17 @@
-config MTD_SPI_NOR_BASE
-	bool "the framework for SPI-NOR support"
+config MTD_SPI_NOR
+	bool "SPI-NOR device support"
 	depends on MTD
 	help
 	  This is the framework for the SPI NOR which can be used by the SPI
 	  device drivers and the SPI-NOR device driver.
+
+if MTD_SPI_NOR
+
 config SPI_FSL_QUADSPI
 	tristate "Freescale Quad SPI controller"
-	depends on ARCH_MXC && MTD_SPI_NOR_BASE
+	depends on ARCH_MXC
 	help
 	  This enables support for the Quad SPI controller in master mode.
 	  We only connect the NOR to this controller now.
+
+endif # MTD_SPI_NOR
diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
index 51f9d8b99ab7..6a7ce1462247 100644
--- a/drivers/mtd/spi-nor/Makefile
+++ b/drivers/mtd/spi-nor/Makefile
@@ -1,2 +1,2 @@
-obj-$(CONFIG_MTD_SPI_NOR_BASE)	+= spi-nor.o
+obj-$(CONFIG_MTD_SPI_NOR)	+= spi-nor.o
 obj-$(CONFIG_SPI_FSL_QUADSPI)	+= fsl-quadspi.o
-- 
1.8.3.2
