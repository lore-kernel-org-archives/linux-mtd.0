Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cOOjO-0006MF-Qu
 for linux-mtd@lists.infradead.org; Tue, 03 Jan 2017 13:02:24 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Icenowy Zheng <icenowy@aosc.xyz>, Valdis.Kletnieks@vt.edu,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 06/15] mtd: nand: kill the MTD_NAND_IDS Kconfig option
Date: Tue,  3 Jan 2017 14:01:26 +0100
Message-Id: <1483448495-31607-7-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1483448495-31607-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1483448495-31607-1-git-send-email-boris.brezillon@free-electrons.com>
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
index 2735eb7671a5..b7cd6b9209a9 100644
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
index 353a9ddf6b97..69f9b03c372e 100644
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
index 19a66e404d5b..bfd5d12b9ade 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -5,7 +5,6 @@
 obj-$(CONFIG_MTD_NAND)			+= nand.o
 obj-$(CONFIG_MTD_NAND_ECC)		+= nand_ecc.o
 obj-$(CONFIG_MTD_NAND_BCH)		+= nand_bch.o
-obj-$(CONFIG_MTD_NAND_IDS)		+= nand_ids.o
 obj-$(CONFIG_MTD_SM_COMMON) 		+= sm_common.o
 
 obj-$(CONFIG_MTD_NAND_CAFE)		+= cafe_nand.o
@@ -61,4 +60,4 @@ obj-$(CONFIG_MTD_NAND_BRCMNAND)		+= brcmnand/
 obj-$(CONFIG_MTD_NAND_QCOM)		+= qcom_nandc.o
 obj-$(CONFIG_MTD_NAND_MTK)		+= mtk_nand.o mtk_ecc.o
 
-nand-objs := nand_base.o nand_bbt.o nand_timings.o
+nand-objs := nand_base.o nand_bbt.o nand_timings.o nand_ids.o
-- 
2.7.4
