Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1d5V3o-0004aI-My
 for linux-mtd@lists.infradead.org; Tue, 02 May 2017 10:29:38 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Harvey Hunt <harveyhuntnexus@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH] mtd: nand: jz4780: Use mtd_set_ooblayout() to set the
 ooblayout
Date: Tue,  2 May 2017 12:29:13 +0200
Message-Id: <1493720953-8471-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The mtd_set_ooblayout() accesor has been added to hide internals of
mtd_info and ease future refactoring. Call mtd_set_ooblayout() instead of
directly accessing mtd->ooblayout.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/jz4780_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/jz4780_nand.c b/drivers/mtd/nand/jz4780_nand.c
index a39bb70175ee..8bc835f71b26 100644
--- a/drivers/mtd/nand/jz4780_nand.c
+++ b/drivers/mtd/nand/jz4780_nand.c
@@ -205,7 +205,7 @@ static int jz4780_nand_init_ecc(struct jz4780_nand_chip *nand, struct device *de
 		return -EINVAL;
 	}
 
-	mtd->ooblayout = &nand_ooblayout_lp_ops;
+	mtd_set_ooblayout(mtd, &nand_ooblayout_lp_ops);
 
 	return 0;
 }
-- 
2.7.4
