Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fb0qF-0004SJ-AJ
 for linux-mtd@lists.infradead.org; Thu, 05 Jul 2018 09:46:24 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-wireless@vger.kernel.org
Subject: [PATCH 24/27] MIPS: jz4740: Move jz4740_nand.h header to
 include/linux/platform_data/jz4740
Date: Thu,  5 Jul 2018 11:45:19 +0200
Message-Id: <20180705094522.12138-25-boris.brezillon@bootlin.com>
In-Reply-To: <20180705094522.12138-1-boris.brezillon@bootlin.com>
References: <20180705094522.12138-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This way we will be able to compile the jz4740_nand driver when
COMPILE_TEST=y.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 arch/mips/jz4740/board-qi_lb60.c                                      | 3 ++-
 drivers/mtd/nand/raw/jz4740_nand.c                                    | 2 +-
 .../mach-jz4740 => include/linux/platform_data/jz4740}/jz4740_nand.h  | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)
 rename {arch/mips/include/asm/mach-jz4740 => include/linux/platform_data/jz4740}/jz4740_nand.h (91%)

diff --git a/arch/mips/jz4740/board-qi_lb60.c b/arch/mips/jz4740/board-qi_lb60.c
index 60f0767507c6..af0c8ace0141 100644
--- a/arch/mips/jz4740/board-qi_lb60.c
+++ b/arch/mips/jz4740/board-qi_lb60.c
@@ -29,10 +29,11 @@
 #include <linux/power/gpio-charger.h>
 #include <linux/pwm.h>
 
+#include <linux/platform_data/jz4740/jz4740_nand.h>
+
 #include <asm/mach-jz4740/gpio.h>
 #include <asm/mach-jz4740/jz4740_fb.h>
 #include <asm/mach-jz4740/jz4740_mmc.h>
-#include <asm/mach-jz4740/jz4740_nand.h>
 
 #include <linux/regulator/fixed.h>
 #include <linux/regulator/machine.h>
diff --git a/drivers/mtd/nand/raw/jz4740_nand.c b/drivers/mtd/nand/raw/jz4740_nand.c
index 613b00a9604b..a0254461812d 100644
--- a/drivers/mtd/nand/raw/jz4740_nand.c
+++ b/drivers/mtd/nand/raw/jz4740_nand.c
@@ -25,7 +25,7 @@
 
 #include <linux/gpio.h>
 
-#include <asm/mach-jz4740/jz4740_nand.h>
+#include <linux/platform_data/jz4740/jz4740_nand.h>
 
 #define JZ_REG_NAND_CTRL	0x50
 #define JZ_REG_NAND_ECC_CTRL	0x100
diff --git a/arch/mips/include/asm/mach-jz4740/jz4740_nand.h b/include/linux/platform_data/jz4740/jz4740_nand.h
similarity index 91%
rename from arch/mips/include/asm/mach-jz4740/jz4740_nand.h
rename to include/linux/platform_data/jz4740/jz4740_nand.h
index f381d465e768..bc571f6d5ced 100644
--- a/arch/mips/include/asm/mach-jz4740/jz4740_nand.h
+++ b/include/linux/platform_data/jz4740/jz4740_nand.h
@@ -13,8 +13,8 @@
  *
  */
 
-#ifndef __ASM_MACH_JZ4740_JZ4740_NAND_H__
-#define __ASM_MACH_JZ4740_JZ4740_NAND_H__
+#ifndef __JZ4740_NAND_H__
+#define __JZ4740_NAND_H__
 
 #include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
-- 
2.14.1
