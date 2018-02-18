Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1enRT0-0007pm-Vq
 for linux-mtd@lists.infradead.org; Sun, 18 Feb 2018 16:05:33 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Kyungmin Park <kyungmin.park@samsung.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: [PATCH 2/2] mtd: Move onenand code base to drivers/mtd/nand/onenand
Date: Sun, 18 Feb 2018 17:05:16 +0100
Message-Id: <20180218160516.27946-2-boris.brezillon@bootlin.com>
In-Reply-To: <20180218160516.27946-1-boris.brezillon@bootlin.com>
References: <20180218160516.27946-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Move onenand code base to the drivers/mtd/nand directory in the hope
that someday someone will patch it to use the generic NAND helpers.
If it never happens, at least we'll have all NAND related support in a
single directory and not spread over the drivers/mtd/ directory.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 MAINTAINERS                                   | 2 +-
 drivers/mtd/Kconfig                           | 2 --
 drivers/mtd/Makefile                          | 2 +-
 drivers/mtd/nand/Kconfig                      | 2 ++
 drivers/mtd/nand/Makefile                     | 1 +
 drivers/mtd/{ => nand}/onenand/Kconfig        | 0
 drivers/mtd/{ => nand}/onenand/Makefile       | 0
 drivers/mtd/{ => nand}/onenand/generic.c      | 0
 drivers/mtd/{ => nand}/onenand/omap2.c        | 0
 drivers/mtd/{ => nand}/onenand/onenand_base.c | 0
 drivers/mtd/{ => nand}/onenand/onenand_bbt.c  | 0
 drivers/mtd/{ => nand}/onenand/samsung.c      | 0
 drivers/mtd/{ => nand}/onenand/samsung.h      | 0
 13 files changed, 5 insertions(+), 4 deletions(-)
 rename drivers/mtd/{ => nand}/onenand/Kconfig (100%)
 rename drivers/mtd/{ => nand}/onenand/Makefile (100%)
 rename drivers/mtd/{ => nand}/onenand/generic.c (100%)
 rename drivers/mtd/{ => nand}/onenand/omap2.c (100%)
 rename drivers/mtd/{ => nand}/onenand/onenand_base.c (100%)
 rename drivers/mtd/{ => nand}/onenand/onenand_bbt.c (100%)
 rename drivers/mtd/{ => nand}/onenand/samsung.c (100%)
 rename drivers/mtd/{ => nand}/onenand/samsung.h (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 34b2e9ed6d3d..82678c855d3b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10206,7 +10206,7 @@ ONENAND FLASH DRIVER
 M:	Kyungmin Park <kyungmin.park@samsung.com>
 L:	linux-mtd@lists.infradead.org
 S:	Maintained
-F:	drivers/mtd/onenand/
+F:	drivers/mtd/nand/onenand/
 F:	include/linux/mtd/onenand*.h
 
 ONSTREAM SCSI TAPE DRIVER
diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index 2a8ac6829d42..46ab7feec6b6 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -333,8 +333,6 @@ source "drivers/mtd/devices/Kconfig"
 
 source "drivers/mtd/nand/Kconfig"
 
-source "drivers/mtd/onenand/Kconfig"
-
 source "drivers/mtd/lpddr/Kconfig"
 
 source "drivers/mtd/spi-nor/Kconfig"
diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
index d6f8f625e1ff..93473d215a38 100644
--- a/drivers/mtd/Makefile
+++ b/drivers/mtd/Makefile
@@ -32,7 +32,7 @@ obj-$(CONFIG_MTD_SWAP)		+= mtdswap.o
 nftl-objs		:= nftlcore.o nftlmount.o
 inftl-objs		:= inftlcore.o inftlmount.o
 
-obj-y		+= chips/ lpddr/ maps/ devices/ nand/ onenand/ tests/
+obj-y		+= chips/ lpddr/ maps/ devices/ nand/ tests/
 
 obj-$(CONFIG_MTD_SPI_NOR)	+= spi-nor/
 obj-$(CONFIG_MTD_UBI)		+= ubi/
diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 1c1a1f487e20..88c7d3b4ff8b 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -1,4 +1,6 @@
 config MTD_NAND_CORE
 	tristate
 
+source "drivers/mtd/nand/onenand/Kconfig"
+
 source "drivers/mtd/nand/raw/Kconfig"
diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index a72d3cb0f325..3f0cb87f1a57 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -3,4 +3,5 @@
 nandcore-objs := core.o bbt.o
 obj-$(CONFIG_MTD_NAND_CORE) += nandcore.o
 
+obj-y	+= onenand/
 obj-y	+= raw/
diff --git a/drivers/mtd/onenand/Kconfig b/drivers/mtd/nand/onenand/Kconfig
similarity index 100%
rename from drivers/mtd/onenand/Kconfig
rename to drivers/mtd/nand/onenand/Kconfig
diff --git a/drivers/mtd/onenand/Makefile b/drivers/mtd/nand/onenand/Makefile
similarity index 100%
rename from drivers/mtd/onenand/Makefile
rename to drivers/mtd/nand/onenand/Makefile
diff --git a/drivers/mtd/onenand/generic.c b/drivers/mtd/nand/onenand/generic.c
similarity index 100%
rename from drivers/mtd/onenand/generic.c
rename to drivers/mtd/nand/onenand/generic.c
diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/nand/onenand/omap2.c
similarity index 100%
rename from drivers/mtd/onenand/omap2.c
rename to drivers/mtd/nand/onenand/omap2.c
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/nand/onenand/onenand_base.c
similarity index 100%
rename from drivers/mtd/onenand/onenand_base.c
rename to drivers/mtd/nand/onenand/onenand_base.c
diff --git a/drivers/mtd/onenand/onenand_bbt.c b/drivers/mtd/nand/onenand/onenand_bbt.c
similarity index 100%
rename from drivers/mtd/onenand/onenand_bbt.c
rename to drivers/mtd/nand/onenand/onenand_bbt.c
diff --git a/drivers/mtd/onenand/samsung.c b/drivers/mtd/nand/onenand/samsung.c
similarity index 100%
rename from drivers/mtd/onenand/samsung.c
rename to drivers/mtd/nand/onenand/samsung.c
diff --git a/drivers/mtd/onenand/samsung.h b/drivers/mtd/nand/onenand/samsung.h
similarity index 100%
rename from drivers/mtd/onenand/samsung.h
rename to drivers/mtd/nand/onenand/samsung.h
-- 
2.14.1
