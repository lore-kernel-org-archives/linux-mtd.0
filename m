Received: from mail-bw0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RYFiR-0005zc-So
 for linux-mtd@lists.infradead.org; Wed, 07 Dec 2011 11:31:12 +0000
Received: by bkcje16 with SMTP id je16so382248bkc.36
 for <linux-mtd@lists.infradead.org>; Wed, 07 Dec 2011 03:31:09 -0800 (PST)
From: Jonas Gorski <jonas.gorski@gmail.com>
To: Artem Bityutskiy <Artem.Bityutskiy@intel.com>
Subject: [PATCH] MTD: MAPS: remove Kconfig/Makefile entries for bcm963xx_flash
Date: Wed,  7 Dec 2011 12:29:53 +0100
Message-Id: <1323257393-12114-1-git-send-email-jonas.gorski@gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---

Gah, accidentially dropped this part when I rebased my patches to
l2-mtd-2.6.git (I wonder how I managed that and not notice it).

Artem, can you fold this into my last patch (commit f1f888fb2c3fb281)?

Regards,
Jonas

 drivers/mtd/maps/Kconfig  |   10 ----------
 drivers/mtd/maps/Makefile |    1 -
 2 files changed, 0 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index acc5e08..6c5c431 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -242,16 +242,6 @@ config MTD_NETtel
 	help
 	  Support for flash chips on NETtel/SecureEdge/SnapGear boards.
 
-config MTD_BCM963XX
-        tristate "Map driver for Broadcom BCM963xx boards"
-        depends on BCM63XX
-	select MTD_MAP_BANK_WIDTH_2
-	select MTD_CFI_I1
-	select MTD_BCM63XX_PARTS
-        help
-	  Support for parsing CFE image tag and creating MTD partitions on
-	  Broadcom BCM63xx boards.
-
 config MTD_LANTIQ
 	tristate "Lantiq SoC NOR support"
 	depends on LANTIQ
diff --git a/drivers/mtd/maps/Makefile b/drivers/mtd/maps/Makefile
index 45dcb8b..68a9a91 100644
--- a/drivers/mtd/maps/Makefile
+++ b/drivers/mtd/maps/Makefile
@@ -55,6 +55,5 @@ obj-$(CONFIG_MTD_BFIN_ASYNC)	+= bfin-async-flash.o
 obj-$(CONFIG_MTD_RBTX4939)	+= rbtx4939-flash.o
 obj-$(CONFIG_MTD_VMU)		+= vmu-flash.o
 obj-$(CONFIG_MTD_GPIO_ADDR)	+= gpio-addr-flash.o
-obj-$(CONFIG_MTD_BCM963XX)	+= bcm963xx-flash.o
 obj-$(CONFIG_MTD_LATCH_ADDR)	+= latch-addr-flash.o
 obj-$(CONFIG_MTD_LANTIQ)	+= lantiq-flash.o
-- 
1.7.2.5
