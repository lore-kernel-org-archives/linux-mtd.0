Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fgHZ7-0006NY-Vr
 for linux-mtd@lists.infradead.org; Thu, 19 Jul 2018 22:38:31 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH] mtd: rawnand: jz4740: Include gpio/consumer.h instead of
 gpio.h
Date: Fri, 20 Jul 2018 00:38:13 +0200
Message-Id: <20180719223813.14351-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

GPIO consumers should no longer include <linux/gpio.h>, and instead
include <linux/gpio/consumer.h>.

Also, explicitly include <include/io.h> since it seems to be missing
after switching to <linux/gpio/consumer.h>.

This fixes a build error when selecting the driver without selecting
GPIOLIB, which can happen when COMPILE_TEST=y.

Fixes: 6968e07e8169 ("mtd: rawnand: jz4740: Allow selection of this driver when COMPILE_TEST=y")
Reported-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/jz4740_nand.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/jz4740_nand.c b/drivers/mtd/nand/raw/jz4740_nand.c
index da01d967dcc3..d5c226298b91 100644
--- a/drivers/mtd/nand/raw/jz4740_nand.c
+++ b/drivers/mtd/nand/raw/jz4740_nand.c
@@ -13,6 +13,7 @@
  *
  */
 
+#include <linux/io.h>
 #include <linux/ioport.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -23,7 +24,7 @@
 #include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 
 #include <linux/platform_data/jz4740/jz4740_nand.h>
 
-- 
2.14.1
