Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gK2yF-00075c-Ug
 for linux-mtd@lists.infradead.org; Tue, 06 Nov 2018 15:08:51 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Han Xu <han.xu@nxp.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Xiaolei Li <xiaolei.li@mediatek.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Marc Gonzalez <marc.w.gonzalez@free.fr>, Stefan Agner <stefan@agner.ch>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH v2 06/22] mtd: rawnand: ams-delta: Allow this driver to be
 compiled when COMPILE_TEST=y
Date: Tue,  6 Nov 2018 16:07:54 +0100
Message-Id: <20181106150810.9569-7-boris.brezillon@bootlin.com>
In-Reply-To: <20181106150810.9569-1-boris.brezillon@bootlin.com>
References: <20181106150810.9569-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Drop the asm and mach headers inclusion and allow this driver to be
compiled when COMPILE_TEST=y in order to increase compile-test
coverage.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
Changes in v2:
- New patch
---
 drivers/mtd/nand/raw/Kconfig     | 2 +-
 drivers/mtd/nand/raw/ams-delta.c | 5 -----
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index c7efc31384d5..1a55d3e3d4c5 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -70,7 +70,7 @@ config MTD_NAND_GPIO
 
 config MTD_NAND_AMS_DELTA
 	tristate "NAND Flash device on Amstrad E3"
-	depends on MACH_AMS_DELTA
+	depends on MACH_AMS_DELTA || COMPILE_TEST
 	default y
 	help
 	  Support for NAND flash on Amstrad E3 (Delta).
diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index 9ca70aab199d..37dec9ee9239 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -26,11 +26,6 @@
 #include <linux/mtd/partitions.h>
 #include <linux/platform_data/gpio-omap.h>
 
-#include <asm/io.h>
-#include <asm/sizes.h>
-
-#include <mach/hardware.h>
-
 /*
  * MTD structure for E3 (Delta)
  */
-- 
2.17.1
