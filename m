From: RogerCC Lin <rogercc.lin@mediatek.com>
To: <boris.brezillon@free-electrons.com>
CC: <xiaolei.li@mediatek.com>, <steven.liu@mediatek.com>,
 <rogercc.lin@mediatek.com>, <robh@kernel.org>, <computersforpeace@gmail.com>,
 <jorge.ramirez-ortiz@linaro.org>, <daniel.thompson@linaro.org>,
 <linux-mtd@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <dwmw2@infradead.org>, <blogic@openwrt.org>
Subject: [PATCH v5 2/2] mtd: nand: fix chances to create incomplete ECC data
 when writing
Date: Mon, 19 Sep 2016 10:53:26 +0800
Message-ID: <1474253606-9965-3-git-send-email-rogercc.lin@mediatek.com>
In-Reply-To: <1474253606-9965-1-git-send-email-rogercc.lin@mediatek.com>
References: <1474253606-9965-1-git-send-email-rogercc.lin@mediatek.com>
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

From: RogerCC Lin <rogercc.lin@mediatek.com>

When mtk_nfc_do_write_page() comparing the sector number,because the
sector number field is at the 12th-bit position of NFI_BYTELEN
register,the masked register should be shifted 12 bits before being
compared.The result of this bug may cause the second subpage has
incomplete ECC parity bytes.

Signed-off-by: RogerCC Lin <rogercc.lin@mediatek.com>
Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/mtk_nand.c |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/mtk_nand.c b/drivers/mtd/nand/mtk_nand.c
index ddaa2ac..5223a21 100644
--- a/drivers/mtd/nand/mtk_nand.c
+++ b/drivers/mtd/nand/mtk_nand.c
@@ -93,6 +93,9 @@
 #define		NFI_FSM_MASK		(0xf << 16)
 #define NFI_ADDRCNTR		(0x70)
 #define		CNTR_MASK		GENMASK(16, 12)
+#define		ADDRCNTR_SEC_SHIFT	(12)
+#define		ADDRCNTR_SEC(val) \
+		(((val) & CNTR_MASK) >> ADDRCNTR_SEC_SHIFT)
 #define NFI_STRADDR		(0x80)
 #define NFI_BYTELEN		(0x84)
 #define NFI_CSEL		(0x90)
@@ -699,7 +702,7 @@ static int mtk_nfc_do_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 	}
 
 	ret = readl_poll_timeout_atomic(nfc->regs + NFI_ADDRCNTR, reg,
-					(reg & CNTR_MASK) >= chip->ecc.steps,
+					ADDRCNTR_SEC(reg) >= chip->ecc.steps,
 					10, MTK_TIMEOUT);
 	if (ret)
 		dev_err(dev, "hwecc write timeout\n");
@@ -902,7 +905,7 @@ static int mtk_nfc_read_subpage(struct mtd_info *mtd, struct nand_chip *chip,
 		dev_warn(nfc->dev, "read ahb/dma done timeout\n");
 
 	rc = readl_poll_timeout_atomic(nfc->regs + NFI_BYTELEN, reg,
-				       (reg & CNTR_MASK) >= sectors, 10,
+				       ADDRCNTR_SEC(reg) >= sectors, 10,
 				       MTK_TIMEOUT);
 	if (rc < 0) {
 		dev_err(nfc->dev, "subpage done timeout\n");
-- 
1.7.0.4
