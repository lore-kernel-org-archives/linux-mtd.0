From: Hong Xu <hong.xu@atmel.com>
To: linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org
Subject: [PATCH 1/3] MTD: atmel_nand: modify test case for using DMA operations
Date: Wed, 30 Mar 2011 16:26:39 +0800
Message-Id: <1301473601-29570-1-git-send-email-hong.xu@atmel.com>
Cc: nicolas.ferre@atmel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Nicolas Ferre <nicolas.ferre@atmel.com>

We have better performances not using DMA for oob operations.
Modify size test so that it is using DMA for size greater than oobsize.

Signed-off-by: Nicolas Ferre <nicolas.ferre@atmel.com>
---
 drivers/mtd/nand/atmel_nand.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 6fae04b..9acecdc 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -280,7 +280,7 @@ static void atmel_read_buf(struct mtd_info *mtd, u8 *buf, int len)
 	struct nand_chip *chip = mtd->priv;
 	struct atmel_nand_host *host = chip->priv;
 
-	if (use_dma && len >= mtd->oobsize)
+	if (use_dma && len > mtd->oobsize)
 		if (atmel_nand_dma_op(mtd, buf, len, 1) == 0)
 			return;
 
@@ -295,7 +295,7 @@ static void atmel_write_buf(struct mtd_info *mtd, const u8 *buf, int len)
 	struct nand_chip *chip = mtd->priv;
 	struct atmel_nand_host *host = chip->priv;
 
-	if (use_dma && len >= mtd->oobsize)
+	if (use_dma && len > mtd->oobsize)
 		if (atmel_nand_dma_op(mtd, (void *)buf, len, 0) == 0)
 			return;
 
-- 
1.7.3.3
