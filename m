From: <xiaolei.li@mediatek.com>
To: <boris.brezillon@free-electrons.com>, <computersforpeace@gmail.com>
CC: <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <rogercc.lin@mediatek.com>,
 <srv_heupstream@mediatek.com>, <xiaolei.li@mediatek.com>,
 <bayi.cheng@mediatek.com>
Subject: [PATCH] mtd: nand: mtk: deselect the chip that was selected in resume
 function
Date: Wed, 1 Nov 2017 14:19:57 +0800
Message-ID: <1509517197-60350-1-git-send-email-xiaolei.li@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Xiaolei Li <xiaolei.li@mediatek.com>

It is necessary to deselect the chip if it was selected before.
But now we only select chips when resume nand driver.
So, deselect the chip after doing nand reset.

Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>
---
 drivers/mtd/nand/mtk_nand.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/mtk_nand.c b/drivers/mtd/nand/mtk_nand.c
index d86a7d1..a8bf61a 100644
--- a/drivers/mtd/nand/mtk_nand.c
+++ b/drivers/mtd/nand/mtk_nand.c
@@ -1557,6 +1557,7 @@ static int mtk_nfc_resume(struct device *dev)
 		for (i = 0; i < chip->nsels; i++) {
 			nand->select_chip(mtd, i);
 			nand->cmdfunc(mtd, NAND_CMD_RESET, -1, -1);
+			nand->select_chip(mtd, -1);
 		}
 	}
 
-- 
1.9.1
