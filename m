From: Xiaolei Li <xiaolei.li@mediatek.com>
To: <boris.brezillon@free-electrons.com>, <richard@nod.at>
CC: <matthias.bgg@gmail.com>, <linux-mtd@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <rogercc.lin@mediatek.com>,
 <bayi.cheng@mediatek.com>, <jie.wu@mediatek.com>,
 <srv_heupstream@mediatek.com>, <xiaolei.li@mediatek.com>
Subject: [PATCH 1/5] mtd: nand: mtk: fix incorrect register setting order
 about ecc irq
Date: Fri, 23 Jun 2017 15:12:24 +0800
Message-ID: <1498201948-39088-2-git-send-email-xiaolei.li@mediatek.com>
In-Reply-To: <1498201948-39088-1-git-send-email-xiaolei.li@mediatek.com>
References: <1498201948-39088-1-git-send-email-xiaolei.li@mediatek.com>
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

Currently, we trigger ECC HW before setting ecc irq. It is incorrect.
Because ECC starts working once the register ECC_CTL_REG is set as
ECC_OP_ENABLE. And this may lead an abnormal behavior of ecc irq.
So, should enable ecc irq at first, then trigger ECC.

Fixes: 1d6b1e464950 ("mtd: mediatek: driver for MTK Smart Device")
Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>
---
 drivers/mtd/nand/mtk_ecc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/mtk_ecc.c b/drivers/mtd/nand/mtk_ecc.c
index 4958121..a855a4e 100644
--- a/drivers/mtd/nand/mtk_ecc.c
+++ b/drivers/mtd/nand/mtk_ecc.c
@@ -276,8 +276,6 @@ int mtk_ecc_enable(struct mtk_ecc *ecc, struct mtk_ecc_config *config)
 	if (ret)
 		return ret;
 
-	writew(ECC_OP_ENABLE, ecc->regs + ECC_CTL_REG(op));
-
 	init_completion(&ecc->done);
 	reg_val = ECC_IRQ_EN;
 	/*
@@ -289,6 +287,8 @@ int mtk_ecc_enable(struct mtk_ecc *ecc, struct mtk_ecc_config *config)
 		reg_val |= ECC_PG_IRQ_SEL;
 	writew(reg_val, ecc->regs + ECC_IRQ_REG(op));
 
+	writew(ECC_OP_ENABLE, ecc->regs + ECC_CTL_REG(op));
+
 	return 0;
 }
 EXPORT_SYMBOL(mtk_ecc_enable);
-- 
1.9.1
