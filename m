Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eioqT-0008V1-EY
 for linux-mtd@lists.infradead.org; Mon, 05 Feb 2018 22:02:40 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Cc: Peter Pan <peterpansjtu@gmail.com>,
 Frieder Schrempf <frieder.schrempf@exceet.de>
Subject: [PATCH v7 3/7] mtd: nand: ams-delta: Fix path to toto.c source file
Date: Mon,  5 Feb 2018 23:02:01 +0100
Message-Id: <20180205220205.3528-4-boris.brezillon@bootlin.com>
In-Reply-To: <20180205220205.3528-1-boris.brezillon@bootlin.com>
References: <20180205220205.3528-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Boris Brezillon <boris.brezillon@free-electrons.com>

Last known location of toto.c was drivers/mtd/nand/toto.c. Fix the
path so that one can use git log to find when the driver was deleted
and possibly checkout the source code.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/ams-delta.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/ams-delta.c b/drivers/mtd/nand/ams-delta.c
index f3eaea9df90b..25a92474fa59 100644
--- a/drivers/mtd/nand/ams-delta.c
+++ b/drivers/mtd/nand/ams-delta.c
@@ -1,7 +1,7 @@
 /*
  *  Copyright (C) 2006 Jonathan McDowell <noodles@earth.li>
  *
- *  Derived from drivers/mtd/toto.c
+ *  Derived from drivers/mtd/nand/toto.c
  *  Converted to platform driver by Janusz Krzysztofik <jkrzyszt@tis.icnet.pl>
  *  Partially stolen from plat_nand.c
  *
-- 
2.14.1
