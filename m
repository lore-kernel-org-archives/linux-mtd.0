Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fgSAd-00068q-Sa
 for linux-mtd@lists.infradead.org; Fri, 20 Jul 2018 09:57:57 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH 3/4] mtd: rawnand: au1550nd: Remove unneeded gpio.h inclusion
Date: Fri, 20 Jul 2018 11:57:40 +0200
Message-Id: <20180720095741.6313-4-boris.brezillon@bootlin.com>
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

We don't use the GPIO API in this driver, let's just remove the
<linux/gpio.h> inclusion.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/au1550nd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/au1550nd.c b/drivers/mtd/nand/raw/au1550nd.c
index df0ef1f1e2f5..35f5c84cd331 100644
--- a/drivers/mtd/nand/raw/au1550nd.c
+++ b/drivers/mtd/nand/raw/au1550nd.c
@@ -8,7 +8,6 @@
  */
 
 #include <linux/slab.h>
-#include <linux/gpio.h>
 #include <linux/module.h>
 #include <linux/interrupt.h>
 #include <linux/mtd/mtd.h>
-- 
2.14.1
