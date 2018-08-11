Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1foRKI-00024O-Aj
 for linux-mtd@lists.infradead.org; Sat, 11 Aug 2018 10:40:55 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] mtd: rawnand: atmel: Add dependency on GENERIC_ALLOCATOR
Date: Sat, 11 Aug 2018 12:40:22 +0200
Message-Id: <20180811104022.23446-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The driver uses genalloc functions. Add a dependency on
GENERIC_ALLOCATOR to prevent build errors when selected through
COMPILE_TEST.

Fixes: 88a40e7dca00 ("mtd: rawnand: atmel: Allow selection of this driver when COMPILE_TEST=y")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index b6738ece16f1..0c3cc3e8e144 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -278,7 +278,7 @@ config MTD_NAND_CS553X
 config MTD_NAND_ATMEL
 	tristate "Support for NAND Flash / SmartMedia on AT91"
 	depends on ARCH_AT91 || COMPILE_TEST
-	depends on HAS_IOMEM
+	depends on HAS_IOMEM && GENERIC_ALLOCATOR
 	select MFD_ATMEL_SMC
 	help
 	  Enables support for NAND Flash / Smart Media Card interface
-- 
2.14.1
