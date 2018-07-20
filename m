Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fgSAd-00068n-Sd
 for linux-mtd@lists.infradead.org; Fri, 20 Jul 2018 09:57:59 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH 1/4] mtd: rawnand: sunxi: Remove gpio.h and of_gpio.h
 inclusions
Date: Fri, 20 Jul 2018 11:57:38 +0200
Message-Id: <20180720095741.6313-2-boris.brezillon@bootlin.com>
In-Reply-To: <20180720095741.6313-1-boris.brezillon@bootlin.com>
References: <20180720095741.6313-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit ddd5ed3a90e7 ("mtd: rawnand: sunxi: Remove support for
GPIO-based Ready/Busy polling") removed GPIO-based RB polling. We no
longer need to include gpio headers.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 07f3ff9a28f2..2c0cbe72b449 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -29,14 +29,12 @@
 #include <linux/platform_device.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
-#include <linux/of_gpio.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/dmaengine.h>
-#include <linux/gpio.h>
 #include <linux/interrupt.h>
 #include <linux/iopoll.h>
 #include <linux/reset.h>
-- 
2.14.1
