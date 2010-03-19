Received: from mail-fx0-f214.google.com ([209.85.220.214])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Nse2X-0008WS-A4
	for linux-mtd@lists.infradead.org; Fri, 19 Mar 2010 15:23:14 +0000
Received: by fxm6 with SMTP id 6so861360fxm.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 19 Mar 2010 08:23:08 -0700 (PDT)
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 2/2] MTD: NAND: split out ECC module
Date: Fri, 19 Mar 2010 17:22:54 +0200
Message-Id: <1269012174-5375-2-git-send-email-maximlevitsky@gmail.com>
In-Reply-To: <1269000351-12023-1-git-send-email-maximlevitsky@gmail.com>
References: <1269000351-12023-1-git-send-email-maximlevitsky@gmail.com>
Cc: linux-mtd@lists.infradead.org, Maxim Levitsky <maximlevitsky@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This way drivers could use ecc routines without depedency on whole nand

Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>
---
 drivers/mtd/Kconfig       |    3 ++-
 drivers/mtd/nand/Kconfig  |    4 ++++
 drivers/mtd/nand/Makefile |    3 ++-
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index d90652f..f8210bf 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -307,8 +307,9 @@ config SSFDC
 
 config SM_FTL
 	tristate "SmartMedia/xD new translation layer"
-	depends on EXPERIMENTAL && BLOCK && MTD_NAND
+	depends on EXPERIMENTAL && BLOCK
 	select MTD_BLKDEVS
+	select MTD_NAND_ECC
 	help
 	  This enables new and very EXPERMENTAL support for SmartMedia/xD
 	  FTL (Flash translation layer).
diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 983a641..dfde30b 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -2,6 +2,7 @@ menuconfig MTD_NAND
 	tristate "NAND Device Support"
 	depends on MTD
 	select MTD_NAND_IDS
+	select MTD_NAND_ECC
 	help
 	  This enables support for accessing all type of NAND flash
 	  devices. For further information see
@@ -102,6 +103,9 @@ config MTD_NAND_OMAP_PREFETCH_DMA
 config MTD_NAND_IDS
 	tristate
 
+config MTD_NAND_ECC
+	tristate
+
 config MTD_NAND_RICOH
 	tristate "Ricoh xD card reader"
 	default n
diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index 5fbd1f8..04bccf9 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -2,7 +2,8 @@
 # linux/drivers/nand/Makefile
 #
 
-obj-$(CONFIG_MTD_NAND)			+= nand.o nand_ecc.o
+obj-$(CONFIG_MTD_NAND)			+= nand.o
+obj-$(CONFIG_MTD_NAND_ECC)		+= nand_ecc.o
 obj-$(CONFIG_MTD_NAND_IDS)		+= nand_ids.o
 obj-$(CONFIG_MTD_SM_COMMON) 		+= sm_common.o
 
-- 
1.6.3.3
