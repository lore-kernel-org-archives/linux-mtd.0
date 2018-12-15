Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gY5Fw-0006sv-Mr
 for linux-mtd@lists.infradead.org; Sat, 15 Dec 2018 08:25:12 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH v2 5/7] mtd: rawnand: sunxi: Add an SPDX tag
Date: Sat, 15 Dec 2018 09:24:35 +0100
Message-Id: <20181215082437.9175-6-boris.brezillon@bootlin.com>
In-Reply-To: <20181215082437.9175-1-boris.brezillon@bootlin.com>
References: <20181215082437.9175-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Replace the license text by an SPDX tag and fix MODULE_LICENSE() to
match GPL-2.0+.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index fb02603ab227..9b09c7083d76 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * Copyright (C) 2013 Boris BREZILLON <b.brezillon.dev@gmail.com>
  *
@@ -10,16 +11,6 @@
  *
  *	Copyright (C) 2013 Dmitriy B. <rzk333@gmail.com>
  *	Copyright (C) 2013 Sergey Lapin <slapin@ossfans.org>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
  */
 
 #include <linux/dma-mapping.h>
@@ -2107,7 +2098,7 @@ static struct platform_driver sunxi_nfc_driver = {
 };
 module_platform_driver(sunxi_nfc_driver);
 
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Boris BREZILLON");
 MODULE_DESCRIPTION("Allwinner NAND Flash Controller driver");
 MODULE_ALIAS("platform:sunxi_nand");
-- 
2.17.1
