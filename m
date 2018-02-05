Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eioqg-0008W4-PP
 for linux-mtd@lists.infradead.org; Mon, 05 Feb 2018 22:02:54 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Cc: Peter Pan <peterpansjtu@gmail.com>,
 Frieder Schrempf <frieder.schrempf@exceet.de>
Subject: [PATCH v7 5/7] mtd: nand: Add missing copyright information
Date: Mon,  5 Feb 2018 23:02:03 +0100
Message-Id: <20180205220205.3528-6-boris.brezillon@bootlin.com>
In-Reply-To: <20180205220205.3528-1-boris.brezillon@bootlin.com>
References: <20180205220205.3528-1-boris.brezillon@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Boris Brezillon <boris.brezillon@free-electrons.com>

Some drivers have been derived from others which have then been removed
from the source tree. When this is the case, add mention the copyright
of the source file(s) they've been derived from.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/ams-delta.c | 3 +++
 drivers/mtd/nand/fsmc_nand.c | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/mtd/nand/ams-delta.c b/drivers/mtd/nand/ams-delta.c
index 24173a0a7875..35f80523e52e 100644
--- a/drivers/mtd/nand/ams-delta.c
+++ b/drivers/mtd/nand/ams-delta.c
@@ -2,6 +2,9 @@
  *  Copyright (C) 2006 Jonathan McDowell <noodles@earth.li>
  *
  *  Derived from drivers/mtd/nand/toto.c (removed in v2.6.28)
+ *    Copyright (c) 2003 Texas Instruments
+ *    Copyright (c) 2002 Thomas Gleixner <tgxl@linutronix.de>
+ *
  *  Converted to platform driver by Janusz Krzysztofik <jkrzyszt@tis.icnet.pl>
  *  Partially stolen from plat_nand.c
  *
diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index a4a5da318eed..7e66268f8154 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -8,6 +8,8 @@
  * Ashish Priyadarshi
  *
  * Based on drivers/mtd/nand/nomadik_nand.c (removed in v3.8)
+ *  Copyright © 2007 STMicroelectronics Pvt. Ltd.
+ *  Copyright © 2009 Alessandro Rubini
  *
  * This file is licensed under the terms of the GNU General Public
  * License version 2. This program is licensed "as is" without any
-- 
2.14.1
