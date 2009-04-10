From: Helight.Xu@gmail.com (Zhenwen Xu)
Date: Fri, 10 Apr 2009 20:35:30 +0800
Subject: [PATCH] fix a warning on drivers/mtd/nand/cafe_nand.c
Message-ID: <mailman.3.1239367469.2876.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Signed-off-by: Zhenwen Xu <helight.xu@gmail.com>
---
 drivers/mtd/nand/cafe_nand.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/cafe_nand.c b/drivers/mtd/nand/cafe_nand.c
index 7c5b257..29acd06 100644
--- a/drivers/mtd/nand/cafe_nand.c
+++ b/drivers/mtd/nand/cafe_nand.c
@@ -332,7 +332,7 @@ static void cafe_select_chip(struct mtd_info *mtd, int chipnr)
 		cafe->ctl1 &= ~CTRL1_CHIPSELECT;
 }
 
-static int cafe_nand_interrupt(int irq, void *id)
+static irqreturn_t cafe_nand_interrupt(int irq, void *id)
 {
 	struct mtd_info *mtd = id;
 	struct cafe_priv *cafe = mtd->priv;
-- 
1.5.6.5

-- 
---------------------------------
Zhenwen Xu - Open and Free
Home Page:	http://zhwen.org
My Studio:	http://dim4.cn
