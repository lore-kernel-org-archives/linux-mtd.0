Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gSN1y-0003uR-4m
 for linux-mtd@lists.infradead.org; Thu, 29 Nov 2018 14:11:05 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Subject: [PATCH v2 5/6] mtd: spi-nor: Add an SPDX tag to spi-nor.c
Date: Thu, 29 Nov 2018 15:10:25 +0100
Message-Id: <20181129141026.24892-6-boris.brezillon@bootlin.com>
In-Reply-To: <20181129141026.24892-1-boris.brezillon@bootlin.com>
References: <20181129141026.24892-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add an SPDX tag to replace the license boiler-plate and fix the
MODULE_LICENSE() definition to match the the license (GPL v2).

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
Changes in v2:
- New patch
---
 drivers/mtd/spi-nor/spi-nor.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index ed1d7ad2dcbb..d2b09f52b1fb 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1,13 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Based on m25p80.c, by Mike Lavender (mike@steroidmicros.com), with
  * influence from lart.c (Abraham Van Der Merwe) and mtd_dataflash.c
  *
  * Copyright (C) 2005, Intec Automation Inc.
  * Copyright (C) 2014, Freescale Semiconductor, Inc.
- *
- * This code is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
  */
 
 #include <linux/err.h>
@@ -3814,7 +3811,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 }
 EXPORT_SYMBOL_GPL(spi_nor_scan);
 
-MODULE_LICENSE("GPL");
+MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Huang Shijie <shijie8@gmail.com>");
 MODULE_AUTHOR("Mike Lavender");
 MODULE_DESCRIPTION("framework for SPI NOR");
-- 
2.17.1
