Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUr6R-0000YH-CJ
 for linux-mtd@lists.infradead.org; Thu, 06 Dec 2018 10:42:00 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Subject: [PATCH v3 5/5] mtd: spi-nor: Add an SPDX tag to spi-nor.{c,h}
Date: Thu,  6 Dec 2018 11:41:20 +0100
Message-Id: <20181206104120.6280-6-boris.brezillon@bootlin.com>
In-Reply-To: <20181206104120.6280-1-boris.brezillon@bootlin.com>
References: <20181206104120.6280-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add SPDX tags to replace the license boiler-plate and fix the
MODULE_LICENSE() definition in spi-nor.c to match the license text
(GPL v2).

Interestingly, spi-nor.h and spi-nor.c do not use the same license
(GPL v2+ for spi-nor.h, GPL v2 for spi-nor.c).

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
Changes in v3:
- Add an SPDX tag to spi-nor.h

Changes in v2:
- New patch
---
 drivers/mtd/spi-nor/spi-nor.c | 7 ++-----
 include/linux/mtd/spi-nor.h   | 6 +-----
 2 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index db31a81a68b2..2e9306e1c52a 100644
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
@@ -3878,7 +3875,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 }
 EXPORT_SYMBOL_GPL(spi_nor_scan);
 
-MODULE_LICENSE("GPL");
+MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Huang Shijie <shijie8@gmail.com>");
 MODULE_AUTHOR("Mike Lavender");
 MODULE_DESCRIPTION("framework for SPI NOR");
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 981d628305a2..5f177aa39f68 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -1,10 +1,6 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
 /*
  * Copyright (C) 2014 Freescale Semiconductor, Inc.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
  */
 
 #ifndef __LINUX_MTD_SPI_NOR_H
-- 
2.17.1
