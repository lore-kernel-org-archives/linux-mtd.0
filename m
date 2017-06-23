From: Xiaolei Li <xiaolei.li@mediatek.com>
To: <boris.brezillon@free-electrons.com>, <richard@nod.at>
CC: <matthias.bgg@gmail.com>, <linux-mtd@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <rogercc.lin@mediatek.com>,
 <bayi.cheng@mediatek.com>, <jie.wu@mediatek.com>,
 <srv_heupstream@mediatek.com>, <xiaolei.li@mediatek.com>
Subject: [PATCH 3/5] mtd: nand: mtk: remove unneeded mtk_nfc_hw_init from
 mtk_nfc_resume
Date: Fri, 23 Jun 2017 15:12:26 +0800
Message-ID: <1498201948-39088-4-git-send-email-xiaolei.li@mediatek.com>
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

chip->select_chip will do nfc runtime configuration. There is no need to
do mtk_nfc_hw_init before it.

Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>
---
 drivers/mtd/nand/mtk_nand.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/nand/mtk_nand.c b/drivers/mtd/nand/mtk_nand.c
index 4d9ee27..d51c58e 100644
--- a/drivers/mtd/nand/mtk_nand.c
+++ b/drivers/mtd/nand/mtk_nand.c
@@ -1490,8 +1490,6 @@ static int mtk_nfc_resume(struct device *dev)
 	if (ret)
 		return ret;
 
-	mtk_nfc_hw_init(nfc);
-
 	/* reset NAND chip if VCC was powered off */
 	list_for_each_entry(chip, &nfc->chips, node) {
 		nand = &chip->nand;
-- 
1.9.1
