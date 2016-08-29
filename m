Message-ID: <1472470809.11041.6.camel@mtkswgap22>
Subject: [PATCH v2 2/2] mtd: nand: fix chances to create incomplete ECC data
 when writing.
From: RogerCC.Lin <rogercc.lin@mediatek.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
CC: <xiaolei.li@mediatek.com>, <steven.liu@mediatek.com>, <robh@kernel.org>,
 <computersforpeace@gmail.com>, <daniel.thompson@linaro.org>,
 <linux-mtd@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <linux-mediatek@lists.infradead.org>, <dwmw2@infradead.org>,
 <blogic@openwrt.org>, Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Date: Mon, 29 Aug 2016 19:40:09 +0800
In-Reply-To: <20160829101006.2b200e0a@bbrezillon>
References: <1472443093.27061.4.camel@mtkswgap22>
 <20160829101006.2b200e0a@bbrezillon>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When mtk_nfc_do_write_page() comparing the sector number,because the
sector number field is at the 12th-bit position of NFI_BYTELEN
register,the masked register should be shifted 12 bits before being
compared.The result of this bug may cause the second subpage has
incomplete ECC parity bytes.

Signed-off-by: RogerCC Lin <rogercc.lin@mediatek.com>
---
 drivers/mtd/nand/mtk_nand.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/mtk_nand.c b/drivers/mtd/nand/mtk_nand.c
index ddaa2ac..5e0727c 100644
--- a/drivers/mtd/nand/mtk_nand.c
+++ b/drivers/mtd/nand/mtk_nand.c
@@ -699,8 +699,8 @@ static int mtk_nfc_do_write_page(struct mtd_info
*mtd, struct nand_chip *chip,
 	}
 
 	ret = readl_poll_timeout_atomic(nfc->regs + NFI_ADDRCNTR, reg,
-					(reg & CNTR_MASK) >= chip->ecc.steps,
-					10, MTK_TIMEOUT);
+			  ((reg & CNTR_MASK) >> 12) >= chip->ecc.steps,
+			  10, MTK_TIMEOUT);
 	if (ret)
 		dev_err(dev, "hwecc write timeout\n");
 
@@ -902,8 +902,8 @@ static int mtk_nfc_read_subpage(struct mtd_info
*mtd, struct nand_chip *chip,
 		dev_warn(nfc->dev, "read ahb/dma done timeout\n");
 
 	rc = readl_poll_timeout_atomic(nfc->regs + NFI_BYTELEN, reg,
-				       (reg & CNTR_MASK) >= sectors, 10,
-				       MTK_TIMEOUT);
+				       ((reg & CNTR_MASK) >> 12) >= sectors, 
+				       10, MTK_TIMEOUT);
 	if (rc < 0) {
 		dev_err(nfc->dev, "subpage done timeout\n");
 		bitflips = -EIO;
--
1.7.0.4
