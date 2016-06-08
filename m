Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bAd78-0004r9-CY
 for linux-mtd@lists.infradead.org; Wed, 08 Jun 2016 13:01:43 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>
Cc: Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org,
 Aleksei Mamlin <mamlinav@gmail.com>
Subject: [PATCH v2 06/15] mtd: nand: kill the MTD_NAND_IDS Kconfig option
Date: Wed,  8 Jun 2016 15:00:40 +0200
Message-Id: <1465390849-13199-7-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1465390849-13199-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1465390849-13199-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

MTD_NAND_IDS is selected by MTD_NAND, which makes it useless. Remove the
Kconfig option and link nand_ids.o into the nand.o object file.
Doing that also prevents adding an extra nand_ids.ko module when MTD_NAND
is activated as a module.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 arch/cris/arch-v32/drivers/Kconfig | 1 -
 drivers/mtd/nand/Kconfig           | 4 ----
 drivers/mtd/nand/Makefile          | 3 +--
 3 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/cris/arch-v32/drivers/Kconfig b/arch/cris/arch-v32/drivers/Kconfig
index 2735eb7..b7cd6b9 100644
--- a/arch/cris/arch-v32/drivers/Kconfig
+++ b/arch/cris/arch-v32/drivers/Kconfig
@@ -136,7 +136,6 @@ config ETRAX_NANDFLASH
 	bool "NAND flash support"
 	depends on ETRAX_ARCH_V32
 	select MTD_NAND
-	select MTD_NAND_IDS
 	help
 	  This option enables MTD mapping of NAND flash devices.  Needed to use
 	  NAND flash memories.  If unsure, say Y.
diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index f05e0e9..16d7dff 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -13,7 +13,6 @@ config MTD_NAND_ECC_SMC
 menuconfig MTD_NAND
 	tristate "NAND Device Support"
 	depends on MTD
-	select MTD_NAND_IDS
 	select MTD_NAND_ECC
 	help
 	  This enables support for accessing all type of NAND flash
@@ -109,9 +108,6 @@ config MTD_NAND_OMAP_BCH
 config MTD_NAND_OMAP_BCH_BUILD
 	def_tristate MTD_NAND_OMAP2 && MTD_NAND_OMAP_BCH
 
-config MTD_NAND_IDS
-	tristate
-
 config MTD_NAND_RICOH
 	tristate "Ricoh xD card reader"
 	default n
diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index f553353..d303dee 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -5,7 +5,6 @@
 obj-$(CONFIG_MTD_NAND)			+= nand.o
 obj-$(CONFIG_MTD_NAND_ECC)		+= nand_ecc.o
 obj-$(CONFIG_MTD_NAND_BCH)		+= nand_bch.o
-obj-$(CONFIG_MTD_NAND_IDS)		+= nand_ids.o
 obj-$(CONFIG_MTD_SM_COMMON) 		+= sm_common.o
 
 obj-$(CONFIG_MTD_NAND_CAFE)		+= cafe_nand.o
@@ -58,4 +57,4 @@ obj-$(CONFIG_MTD_NAND_HISI504)	        += hisi504_nand.o
 obj-$(CONFIG_MTD_NAND_BRCMNAND)		+= brcmnand/
 obj-$(CONFIG_MTD_NAND_QCOM)		+= qcom_nandc.o
 
-nand-objs := nand_base.o nand_bbt.o nand_timings.o
+nand-objs := nand_base.o nand_bbt.o nand_timings.o nand_ids.o
-- 
2.7.4
