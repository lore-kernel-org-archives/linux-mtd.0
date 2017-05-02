Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d5LJn-0001lS-P8
 for linux-mtd@lists.infradead.org; Tue, 02 May 2017 00:05:29 +0000
Received: by mail-pf0-x244.google.com with SMTP id b23so13803079pfc.0
 for <linux-mtd@lists.infradead.org>; Mon, 01 May 2017 17:05:07 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: [PATCH] mtd: nand: drop unneeded module.h include
Date: Mon,  1 May 2017 17:04:52 -0700
Message-Id: <20170502000455.13240-3-computersforpeace@gmail.com>
In-Reply-To: <20170502000455.13240-1-computersforpeace@gmail.com>
References: <20170502000455.13240-1-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

nand_ids isn't a separate module anymore and doesn't need this header.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_ids.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
index 9d5ca0e540b5..92e2cf8e9ff9 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -6,7 +6,6 @@
  * published by the Free Software Foundation.
  *
  */
-#include <linux/module.h>
 #include <linux/mtd/nand.h>
 #include <linux/sizes.h>
 
-- 
2.13.0.rc1.294.g07d810a77f-goog
