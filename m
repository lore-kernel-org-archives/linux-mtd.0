Received: from mout.kundenserver.de ([212.227.126.133])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dFyrl-000863-2a
 for linux-mtd@lists.infradead.org; Wed, 31 May 2017 08:20:31 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Wenyou Yang <wenyou.yang@atmel.com>,
 Josh Wu <rainyfeeling@outlook.com>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: nand: atmel: mark resume function __maybe_unused
Date: Wed, 31 May 2017 10:19:26 +0200
Message-Id: <20170531081950.2022014-1-arnd@arndb.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The newly added suspend/resume support causes a harmless warning:

drivers/mtd/nand/atmel/nand-controller.c:2513:12: error: 'atmel_nand_controller_resume' defined but not used [-Werror=unused-function]

This shuts up the warning with a __maybe_unused annotation.

Fixes: b107007a7114 ("mtd: nand: atmel: Add PM ops")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/mtd/nand/atmel/nand-controller.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/atmel/nand-controller.c b/drivers/mtd/nand/atmel/nand-controller.c
index 6055831c953f..d24e67b95167 100644
--- a/drivers/mtd/nand/atmel/nand-controller.c
+++ b/drivers/mtd/nand/atmel/nand-controller.c
@@ -2510,7 +2510,7 @@ static int atmel_nand_controller_remove(struct platform_device *pdev)
 	return nc->caps->ops->remove(nc);
 }
 
-static int atmel_nand_controller_resume(struct device *dev)
+static __maybe_unused int atmel_nand_controller_resume(struct device *dev)
 {
 	struct atmel_nand_controller *nc = dev_get_drvdata(dev);
 	struct atmel_nand *nand;
-- 
2.9.0
