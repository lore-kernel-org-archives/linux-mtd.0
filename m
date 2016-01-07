Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aHEuG-0000dX-Qt
 for linux-mtd@lists.infradead.org; Thu, 07 Jan 2016 18:03:29 +0000
Received: by mail-pa0-x22f.google.com with SMTP id ho8so3400724pac.2
 for <linux-mtd@lists.infradead.org>; Thu, 07 Jan 2016 10:03:07 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Harvey Hunt <harvey.hunt@imgtec.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Alex Smith <alex@alex-smith.me.uk>
Subject: [PATCH] mtd: jz4780_nand: remove useless mtd->priv = chip assignment
Date: Thu,  7 Jan 2016 10:02:59 -0800
Message-Id: <1452189779-20001-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As of commit 2d3b77bac34b ("mtd: nand: update mtd_to_nand()"), this
assignment isn't necessary, since struct mtd_info is embedded in struct
nand_chip.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Harvey Hunt <harvey.hunt@imgtec.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Alex Smith <alex@alex-smith.me.uk>
---
 drivers/mtd/nand/jz4780_nand.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/jz4780_nand.c b/drivers/mtd/nand/jz4780_nand.c
index 17eb9f264187..6156c554e1c2 100644
--- a/drivers/mtd/nand/jz4780_nand.c
+++ b/drivers/mtd/nand/jz4780_nand.c
@@ -270,7 +270,6 @@ static int jz4780_nand_init_chip(struct platform_device *pdev,
 
 	chip = &nand->chip;
 	mtd = nand_to_mtd(chip);
-	mtd->priv = chip;
 	mtd->name = devm_kasprintf(dev, GFP_KERNEL, "%s.%d", dev_name(dev),
 				   cs->bank);
 	if (!mtd->name)
-- 
2.6.0.rc2.230.g3dd15c0
