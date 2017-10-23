From: Xiaolei Li <xiaolei.li@mediatek.com>
To: <boris.brezillon@free-electrons.com>, <computersforpeace@gmail.com>
CC: <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <rogercc.lin@mediatek.com>,
 <srv_heupstream@mediatek.com>, <xiaolei.li@mediatek.com>
Subject: [PATCH v1 1/2] mtd: nand: mtk: do not disable ECC IRQ in the function
 mtk_ecc_disable
Date: Mon, 23 Oct 2017 16:21:36 +0800
Message-ID: <1508746897-62291-2-git-send-email-xiaolei.li@mediatek.com>
In-Reply-To: <1508746897-62291-1-git-send-email-xiaolei.li@mediatek.com>
References: <1508746897-62291-1-git-send-email-xiaolei.li@mediatek.com>
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

There will disable ECC IRQ in ECC IRQ handle function, so no need to
disable it again in the function mtk_ecc_disable.

Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>
---
 drivers/mtd/nand/mtk_ecc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/mtk_ecc.c b/drivers/mtd/nand/mtk_ecc.c
index 7f3b065..82aa6f2 100644
--- a/drivers/mtd/nand/mtk_ecc.c
+++ b/drivers/mtd/nand/mtk_ecc.c
@@ -307,7 +307,6 @@ void mtk_ecc_disable(struct mtk_ecc *ecc)
 
 	/* disable it */
 	mtk_ecc_wait_idle(ecc, op);
-	writew(0, ecc->regs + ECC_IRQ_REG(op));
 	writew(ECC_OP_DISABLE, ecc->regs + ECC_CTL_REG(op));
 
 	mutex_unlock(&ecc->lock);
-- 
1.9.1
