Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwewZ-0002VM-JQ
 for linux-mtd@lists.infradead.org; Wed, 11 Nov 2015 23:36:48 +0000
Received: by pacdm15 with SMTP id dm15so44539034pac.3
 for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2015 15:36:26 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>, <linux-mips@linux-mips.org>,
 Ralf Baechle <ralf@linux-mips.org>
Subject: [PATCH] mtd: jz4740_nand: fix build on jz4740 after removing gpio.h
Date: Wed, 11 Nov 2015 15:36:16 -0800
Message-Id: <1447284976-96693-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fallout from commit 832f5dacfa0b ("MIPS: Remove all the uses of custom gpio.h")

We see errors like this:

drivers/mtd/nand/jz4740_nand.c: In function 'jz_nand_detect_bank':
drivers/mtd/nand/jz4740_nand.c:340:9: error: 'JZ_GPIO_MEM_CS0' undeclared (first use in this function)
drivers/mtd/nand/jz4740_nand.c:340:9: note: each undeclared identifier is reported only once for each function it appears in
drivers/mtd/nand/jz4740_nand.c:359:2: error: implicit declaration of function 'jz_gpio_set_function' [-Werror=implicit-function-declaration]
drivers/mtd/nand/jz4740_nand.c:359:29: error: 'JZ_GPIO_FUNC_MEM_CS0' undeclared (first use in this function)
drivers/mtd/nand/jz4740_nand.c:399:29: error: 'JZ_GPIO_FUNC_NONE' undeclared (first use in this function)
drivers/mtd/nand/jz4740_nand.c: In function 'jz_nand_probe':
drivers/mtd/nand/jz4740_nand.c:528:13: error: 'JZ_GPIO_MEM_CS0' undeclared (first use in this function)
drivers/mtd/nand/jz4740_nand.c: In function 'jz_nand_remove':
drivers/mtd/nand/jz4740_nand.c:555:14: error: 'JZ_GPIO_MEM_CS0' undeclared (first use in this function)

Patched similarly to:

https://patchwork.linux-mips.org/patch/11089/

Fixes: 832f5dacfa0b ("MIPS: Remove all the uses of custom gpio.h")
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/jz4740_nand.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/jz4740_nand.c b/drivers/mtd/nand/jz4740_nand.c
index dc4e8446f1ff..5a99a93ed025 100644
--- a/drivers/mtd/nand/jz4740_nand.c
+++ b/drivers/mtd/nand/jz4740_nand.c
@@ -25,6 +25,7 @@
 
 #include <linux/gpio.h>
 
+#include <asm/mach-jz4740/gpio.h>
 #include <asm/mach-jz4740/jz4740_nand.h>
 
 #define JZ_REG_NAND_CTRL	0x50
-- 
2.6.0.rc2.230.g3dd15c0
