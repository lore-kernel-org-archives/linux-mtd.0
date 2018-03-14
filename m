Received: from mout.kundenserver.de ([212.227.126.134])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ew8eu-0001Vc-4G
 for linux-mtd@lists.infradead.org; Wed, 14 Mar 2018 15:49:46 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Subject: [PATCH 32/47] mtd: maps: remove bfin-async-flash driver
Date: Wed, 14 Mar 2018 16:35:45 +0100
Message-Id: <20180314153603.3127932-33-arnd@arndb.de>
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

The blackfin architecture is getting removed, so this driver
has become obsolete.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/mtd/maps/Kconfig            |  10 --
 drivers/mtd/maps/Makefile           |   1 -
 drivers/mtd/maps/bfin-async-flash.c | 196 ------------------------------------
 3 files changed, 207 deletions(-)
 delete mode 100644 drivers/mtd/maps/bfin-async-flash.c

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index 542fdf8e81fa..bdc1283f30fb 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -334,16 +334,6 @@ config MTD_PCMCIA_ANONYMOUS
 
 	  If unsure, say N.
 
-config MTD_BFIN_ASYNC
-	tristate "Blackfin BF533-STAMP Flash Chip Support"
-	depends on BFIN533_STAMP && MTD_CFI && MTD_COMPLEX_MAPPINGS
-	default y
-	help
-	  Map driver which allows for simultaneous utilization of
-	  ethernet and CFI parallel flash.
-
-	  If compiled as a module, it will be called bfin-async-flash.
-
 config MTD_GPIO_ADDR
 	tristate "GPIO-assisted Flash Chip Support"
 	depends on GPIOLIB || COMPILE_TEST
diff --git a/drivers/mtd/maps/Makefile b/drivers/mtd/maps/Makefile
index b849aaf85c34..51acf1fec19b 100644
--- a/drivers/mtd/maps/Makefile
+++ b/drivers/mtd/maps/Makefile
@@ -42,7 +42,6 @@ obj-$(CONFIG_MTD_SCB2_FLASH)	+= scb2_flash.o
 obj-$(CONFIG_MTD_IXP4XX)	+= ixp4xx.o
 obj-$(CONFIG_MTD_PLATRAM)	+= plat-ram.o
 obj-$(CONFIG_MTD_INTEL_VR_NOR)	+= intel_vr_nor.o
-obj-$(CONFIG_MTD_BFIN_ASYNC)	+= bfin-async-flash.o
 obj-$(CONFIG_MTD_RBTX4939)	+= rbtx4939-flash.o
 obj-$(CONFIG_MTD_VMU)		+= vmu-flash.o
 obj-$(CONFIG_MTD_GPIO_ADDR)	+= gpio-addr-flash.o
diff --git a/drivers/mtd/maps/bfin-async-flash.c b/drivers/mtd/maps/bfin-async-flash.c
deleted file mode 100644
index 41730feeace8..000000000000
-- 
2.9.0
