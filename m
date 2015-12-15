Received: from mail-pa0-x243.google.com ([2607:f8b0:400e:c03::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a8ifh-0008L7-Bv
 for linux-mtd@lists.infradead.org; Tue, 15 Dec 2015 06:01:15 +0000
Received: by pacfl14 with SMTP id fl14so12767859pac.1
 for <linux-mtd@lists.infradead.org>; Mon, 14 Dec 2015 22:00:53 -0800 (PST)
From: Peter Pan <peterpansjtu@gmail.com>
To: computersforpeace@gmail.com, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com, fransklaver@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 karlzhang@micron.com, beanhuo@micron.com,
 Peter Pan <peterpandong@micron.com>
Subject: [PATCH v2 12/12] mtd: nand-bbt: move nand_bbt.c to mtd folder
Date: Tue, 15 Dec 2015 05:59:38 +0000
Message-Id: <1450159178-29895-13-git-send-email-peterpandong@micron.com>
In-Reply-To: <1450159178-29895-1-git-send-email-peterpandong@micron.com>
References: <1450159178-29895-1-git-send-email-peterpandong@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Since struct nand_chip is removed from nand_bbt.c, BBT is now
shareable. Both NAND and SPI NAND can use it. So move nand_bbt.c
from nand/ foler to mtd/ folder and create MTD_NAND_BBT config.
Both NAND and SPI NAND should depend on MTD_NAND_BBT.

Signed-off-by: Peter Pan <peterpandong@micron.com>
---
 drivers/mtd/Kconfig               | 7 +++++++
 drivers/mtd/Makefile              | 1 +
 drivers/mtd/nand/Kconfig          | 2 +-
 drivers/mtd/nand/Makefile         | 2 +-
 drivers/mtd/{nand => }/nand_bbt.c | 0
 5 files changed, 10 insertions(+), 2 deletions(-)
 rename drivers/mtd/{nand => }/nand_bbt.c (100%)

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index 42cc953..8718556 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -322,6 +322,13 @@ config MTD_PARTITIONED_MASTER
 	  the parent of the partition device be the master device, rather than
 	  what lies behind the master.
 
+config MTD_NAND_BBT
+	tristate "Bad Block Table support for NAND based devices"
+	depends on MTD
+	help
+	  Since struct nand_chip is removed from nand_bbt.c, BBT is now
+	  shareable. Both NAND and SPI NAND can use it.
+
 source "drivers/mtd/chips/Kconfig"
 
 source "drivers/mtd/maps/Kconfig"
diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
index 99bb9a1..55aed6f 100644
--- a/drivers/mtd/Makefile
+++ b/drivers/mtd/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_SSFDC)		+= ssfdc.o
 obj-$(CONFIG_SM_FTL)		+= sm_ftl.o
 obj-$(CONFIG_MTD_OOPS)		+= mtdoops.o
 obj-$(CONFIG_MTD_SWAP)		+= mtdswap.o
+obj-$(CONFIG_MTD_NAND_BBT)	+= nand_bbt.o
 
 nftl-objs		:= nftlcore.o nftlmount.o
 inftl-objs		:= inftlcore.o inftlmount.o
diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 6c71f62..2e11994 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -12,7 +12,7 @@ config MTD_NAND_ECC_SMC
 
 menuconfig MTD_NAND
 	tristate "NAND Device Support"
-	depends on MTD
+	depends on MTD && MTD_NAND_BBT
 	select MTD_NAND_IDS
 	select MTD_NAND_ECC
 	help
diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index 2c7f014..4429f86 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -56,4 +56,4 @@ obj-$(CONFIG_MTD_NAND_SUNXI)		+= sunxi_nand.o
 obj-$(CONFIG_MTD_NAND_HISI504)	        += hisi504_nand.o
 obj-$(CONFIG_MTD_NAND_BRCMNAND)		+= brcmnand/
 
-nand-objs := nand_base.o nand_bbt.o nand_timings.o
+nand-objs := nand_base.o nand_timings.o
diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand_bbt.c
similarity index 100%
rename from drivers/mtd/nand/nand_bbt.c
rename to drivers/mtd/nand_bbt.c
-- 
1.9.1
