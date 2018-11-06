Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gK2yM-0007g7-Ak
 for linux-mtd@lists.infradead.org; Tue, 06 Nov 2018 15:08:55 +0000
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
Subject: [PATCH v2 07/22] mtd: rawnand: ams-delta: Add an SPDX tag to replace
 the license text
Date: Tue,  6 Nov 2018 16:07:55 +0100
Message-Id: <20181106150810.9569-8-boris.brezillon@bootlin.com>
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

Add SPDX GPL2+ since we have MODULE_LICENSE("GPL") which means GPLv2
or later. Note that the license text and the MODULE_LICENSE contradict
each other because one is saying GPLv2 and the other one is saying
GPLv2+.

Let's trust the MODULE_LICENSE() here.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
Changes in v2:
- New patch
---
 drivers/mtd/nand/raw/ams-delta.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index 37dec9ee9239..a00f9e549cb1 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  *  Copyright (C) 2006 Jonathan McDowell <noodles@earth.li>
  *
@@ -8,10 +9,6 @@
  *  Converted to platform driver by Janusz Krzysztofik <jkrzyszt@tis.icnet.pl>
  *  Partially stolen from plat_nand.c
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
  *  Overview:
  *   This is a device driver for the NAND flash device found on the
  *   Amstrad E3 (Delta).
-- 
2.17.1
