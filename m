Received: from mout.kundenserver.de ([212.227.126.135])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ew8fB-0001YC-40
 for linux-mtd@lists.infradead.org; Wed, 14 Mar 2018 15:50:07 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Subject: [PATCH 33/47] mtd: nand: remove bf5xx_nand driver
Date: Wed, 14 Mar 2018 16:35:46 +0100
Message-Id: <20180314153603.3127932-34-arnd@arndb.de>
In-Reply-To: <20180314153603.3127932-1-arnd@arndb.de>
References: <20180314153603.3127932-1-arnd@arndb.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The blackfin architecture is getting removed, so this driver has
become obsolete.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/mtd/nand/raw/Kconfig      |  32 --
 drivers/mtd/nand/raw/Makefile     |   1 -
 drivers/mtd/nand/raw/bf5xx_nand.c | 861 --------------------------------------
 3 files changed, 894 deletions(-)
 delete mode 100644 drivers/mtd/nand/raw/bf5xx_nand.c

diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index 605ec8cce67b..0f2b6f348a0a 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -116,38 +116,6 @@ config MTD_NAND_AU1550
 	  This enables the driver for the NAND flash controller on the
 	  AMD/Alchemy 1550 SOC.
 
-config MTD_NAND_BF5XX
-	tristate "Blackfin on-chip NAND Flash Controller driver"
-	depends on BF54x || BF52x
-	help
-	  This enables the Blackfin on-chip NAND flash controller
-
-	  No board specific support is done by this driver, each board
-	  must advertise a platform_device for the driver to attach.
-
-	  This driver can also be built as a module. If so, the module
-	  will be called bf5xx-nand.
-
-config MTD_NAND_BF5XX_HWECC
-	bool "BF5XX NAND Hardware ECC"
-	default y
-	depends on MTD_NAND_BF5XX
-	help
-	  Enable the use of the BF5XX's internal ECC generator when
-	  using NAND.
-
-config MTD_NAND_BF5XX_BOOTROM_ECC
-	bool "Use Blackfin BootROM ECC Layout"
-	default n
-	depends on MTD_NAND_BF5XX_HWECC
-	help
-	  If you wish to modify NAND pages and allow the Blackfin on-chip
-	  BootROM to boot from them, say Y here.  This is only necessary
-	  if you are booting U-Boot out of NAND and you wish to update
-	  U-Boot from Linux' userspace.  Otherwise, you should say N here.
-
-	  If unsure, say N.
-
 config MTD_NAND_S3C2410
 	tristate "NAND Flash support for Samsung S3C SoCs"
 	depends on ARCH_S3C24XX || ARCH_S3C64XX
diff --git a/drivers/mtd/nand/raw/Makefile b/drivers/mtd/nand/raw/Makefile
index f16f59a197a3..165b7ef9e9a1 100644
--- a/drivers/mtd/nand/raw/Makefile
+++ b/drivers/mtd/nand/raw/Makefile
@@ -11,7 +11,6 @@ obj-$(CONFIG_MTD_NAND_DENALI)		+= denali.o
 obj-$(CONFIG_MTD_NAND_DENALI_PCI)	+= denali_pci.o
 obj-$(CONFIG_MTD_NAND_DENALI_DT)	+= denali_dt.o
 obj-$(CONFIG_MTD_NAND_AU1550)		+= au1550nd.o
-obj-$(CONFIG_MTD_NAND_BF5XX)		+= bf5xx_nand.o
 obj-$(CONFIG_MTD_NAND_S3C2410)		+= s3c2410.o
 obj-$(CONFIG_MTD_NAND_TANGO)		+= tango_nand.o
 obj-$(CONFIG_MTD_NAND_DAVINCI)		+= davinci_nand.o
diff --git a/drivers/mtd/nand/raw/bf5xx_nand.c b/drivers/mtd/nand/raw/bf5xx_nand.c
deleted file mode 100644
index 9a1d8d104570..000000000000
-- 
2.9.0
