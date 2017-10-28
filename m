From: <xiaolei.li@mediatek.com>
To: <boris.brezillon@free-electrons.com>, <computersforpeace@gmail.com>
CC: <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <rogercc.lin@mediatek.com>,
 <srv_heupstream@mediatek.com>, <xiaolei.li@mediatek.com>,
 <jie.wu@mediatek.com>
Subject: [PATCH] mtd: nand: mtk: change the compile sequence of mtk_nand.o and
 mtk_ecc.o
Date: Sat, 28 Oct 2017 14:52:23 +0800
Message-ID: <1509173543-38195-1-git-send-email-xiaolei.li@mediatek.com>
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

There will get mtk ecc handler during mtk nand probe now.
If mtk ecc module is not initialized, then mtk nand probe will return
-EPROBE_DEFER, and retry later.

Change the compile sequence of mtk_nand.o and mtk_ecc.o, initialize mtk
ecc module before mtk nand module. This makes mtk nand module initialized
as soon as possible.

Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>
---
 drivers/mtd/nand/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index ade5fc4..57f4cde 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -58,7 +58,7 @@ obj-$(CONFIG_MTD_NAND_SUNXI)		+= sunxi_nand.o
 obj-$(CONFIG_MTD_NAND_HISI504)	        += hisi504_nand.o
 obj-$(CONFIG_MTD_NAND_BRCMNAND)		+= brcmnand/
 obj-$(CONFIG_MTD_NAND_QCOM)		+= qcom_nandc.o
-obj-$(CONFIG_MTD_NAND_MTK)		+= mtk_nand.o mtk_ecc.o
+obj-$(CONFIG_MTD_NAND_MTK)		+= mtk_ecc.o mtk_nand.o
 
 nand-objs := nand_base.o nand_bbt.o nand_timings.o nand_ids.o
 nand-objs += nand_amd.o
-- 
1.9.1
