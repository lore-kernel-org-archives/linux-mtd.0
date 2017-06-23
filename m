From: Xiaolei Li <xiaolei.li@mediatek.com>
To: <boris.brezillon@free-electrons.com>, <richard@nod.at>
CC: <matthias.bgg@gmail.com>, <linux-mtd@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <rogercc.lin@mediatek.com>,
 <bayi.cheng@mediatek.com>, <jie.wu@mediatek.com>,
 <srv_heupstream@mediatek.com>, <xiaolei.li@mediatek.com>
Subject: [PATCH 4/5] mtd: nand: mtk: remove unneeded mtk_ecc_hw_init from
 mtk_ecc_resume
Date: Fri, 23 Jun 2017 15:12:27 +0800
Message-ID: <1498201948-39088-5-git-send-email-xiaolei.li@mediatek.com>
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

There is no need to add mtk_ecc_hw_init during ecc resume, because there
always takes mtk_ecc_wait_idle in the function mtk_ecc_enable.

Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>
---
 drivers/mtd/nand/mtk_ecc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/nand/mtk_ecc.c b/drivers/mtd/nand/mtk_ecc.c
index 00ce22e..f38e2bb 100644
--- a/drivers/mtd/nand/mtk_ecc.c
+++ b/drivers/mtd/nand/mtk_ecc.c
@@ -507,8 +507,6 @@ static int mtk_ecc_resume(struct device *dev)
 		return ret;
 	}
 
-	mtk_ecc_hw_init(ecc);
-
 	return 0;
 }
 
-- 
1.9.1
