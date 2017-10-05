Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1e09T2-00061B-Pr
 for linux-mtd@lists.infradead.org; Thu, 05 Oct 2017 16:57:50 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, stable@vger.kernel.org,
 Romain Izard <romain.izard.pro@gmail.com>
Subject: [PATCH] mtd: nand: atmel: Actually use the PM ops
Date: Thu,  5 Oct 2017 18:57:24 +0200
Message-Id: <20171005165724.30516-1-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

commit 6e532afaca8e ("mtd: nand: atmel: Add PM ops") was defining PM
ops but nothing was using/referencing those PM ops.

Fixes: 6e532afaca8e ("mtd: nand: atmel: Add PM ops")
Cc: <stable@vger.kernel.org>
Cc: Romain Izard <romain.izard.pro@gmail.com>
Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/atmel/nand-controller.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/atmel/nand-controller.c b/drivers/mtd/nand/atmel/nand-controller.c
index 29182160bb5f..90a71a56bc23 100644
--- a/drivers/mtd/nand/atmel/nand-controller.c
+++ b/drivers/mtd/nand/atmel/nand-controller.c
@@ -2549,6 +2549,7 @@ static struct platform_driver atmel_nand_controller_driver = {
 	.driver = {
 		.name = "atmel-nand-controller",
 		.of_match_table = of_match_ptr(atmel_nand_controller_of_ids),
+		.pm = &atmel_nand_controller_pm_ops,
 	},
 	.probe = atmel_nand_controller_probe,
 	.remove = atmel_nand_controller_remove,
-- 
2.11.0
