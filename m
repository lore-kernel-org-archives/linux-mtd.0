Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLkb0-0004Yg-Ac
 for linux-mtd@lists.infradead.org; Sun, 11 Nov 2018 07:55:51 +0000
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
Subject: [PATCH v3 06/22] mtd: rawnand: ams-delta: Allow this driver to be
 compiled when COMPILE_TEST=y
Date: Sun, 11 Nov 2018 08:55:08 +0100
Message-Id: <20181111075524.13123-7-boris.brezillon@bootlin.com>
In-Reply-To: <20181111075524.13123-1-boris.brezillon@bootlin.com>
References: <20181111075524.13123-1-boris.brezillon@bootlin.com>
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
Tested-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
Changes in v3:
- Add Janusz T-b
- Include linux/sizes.h and linux/io.h

Changes in v2:
- New patch
---
 drivers/mtd/nand/raw/Kconfig     | 2 +-
 drivers/mtd/nand/raw/ams-delta.c | 7 ++-----
 2 files changed, 3 insertions(+), 6 deletions(-)

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
index 9ca70aab199d..a7c0e3af3b11 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -21,15 +21,12 @@
 #include <linux/module.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
+#include <linux/io.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/platform_data/gpio-omap.h>
-
-#include <asm/io.h>
-#include <asm/sizes.h>
-
-#include <mach/hardware.h>
+#include <linux/sizes.h>
 
 /*
  * MTD structure for E3 (Delta)
-- 
2.17.1
