Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP3iy-0006nz-01
 for linux-mtd@lists.infradead.org; Tue, 20 Nov 2018 10:57:45 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Xiaolei Li <xiaolei.li@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>
Subject: [RFC PATCH 1/5] mtd: rawnand: mtk: Use nand_controller_init() instead
 of open-coding it
Date: Tue, 20 Nov 2018 11:57:16 +0100
Message-Id: <20181120105720.23081-2-boris.brezillon@bootlin.com>
In-Reply-To: <20181120105720.23081-1-boris.brezillon@bootlin.com>
References: <20181120105720.23081-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

nand_controller_init() has been added to simplify nand_controller
struct initialization. Use this function instead of duplicating the
logic.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/mtk_nand.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
index b6b4602f5132..2c0e09187773 100644
--- a/drivers/mtd/nand/raw/mtk_nand.c
+++ b/drivers/mtd/nand/raw/mtk_nand.c
@@ -1451,8 +1451,7 @@ static int mtk_nfc_probe(struct platform_device *pdev)
 	if (!nfc)
 		return -ENOMEM;
 
-	spin_lock_init(&nfc->controller.lock);
-	init_waitqueue_head(&nfc->controller.wq);
+	nand_controller_init(&nfc->controller);
 	INIT_LIST_HEAD(&nfc->chips);
 	nfc->controller.ops = &mtk_nfc_controller_ops;
 
-- 
2.17.1
