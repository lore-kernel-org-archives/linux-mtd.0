Received: from eusmtp01.atmel.com ([212.144.249.243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9WL5-0005pX-A3
 for linux-mtd@lists.infradead.org; Tue, 22 Jul 2014 09:26:27 +0000
From: Josh Wu <josh.wu@atmel.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: atmel_nand: NFC: fix mtd_nandbiterrs.ko test fail when
 using sram write
Date: Tue, 22 Jul 2014 17:25:38 +0800
Message-ID: <1406021138-5545-1-git-send-email-josh.wu@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Josh Wu <josh.wu@atmel.com>, computersforpeace@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When enable NFC sram write, it will failed the mtd_nandbiterrs.ko test.

As in driver's nfc_sram_write_page(), if ops->mode equal to MTD_OSP_RAW,
driver assumes the data buffer contains one page data and one oob data
followed. And driver will write the page data and oob data to nand.

But this is wrong implementation. Since the data buffer don't contains the
oob data to write. We should write the chip->oob_poi to nand's oob.

So this patch fix it by writing the oob data from chip->oob_poi.

Signed-off-by: Josh Wu <josh.wu@atmel.com>
---
 drivers/mtd/nand/atmel_nand.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 33826a0..012d687 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -1913,15 +1913,13 @@ static int nfc_sram_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 	if (offset || (data_len < mtd->writesize))
 		return -EINVAL;
 
-	cfg = nfc_readl(host->nfc->hsmc_regs, CFG);
-	len = mtd->writesize;
-
-	if (unlikely(raw)) {
-		len += mtd->oobsize;
-		nfc_writel(host->nfc->hsmc_regs, CFG, cfg | NFC_CFG_WSPARE);
-	} else
-		nfc_writel(host->nfc->hsmc_regs, CFG, cfg & ~NFC_CFG_WSPARE);
+	if (data_len > mtd->writesize) {
+		dev_err(host->dev, "data_len: %d should not bigger than mtd->writesize: %d!\n",
+				data_len, mtd->writesize);
+		return -EINVAL;
+	}
 
+	len = mtd->writesize;
 	/* Copy page data to sram that will write to nand via NFC */
 	if (use_dma) {
 		if (atmel_nand_dma_op(mtd, (void *)buf, len, 0) != 0)
@@ -1931,6 +1929,15 @@ static int nfc_sram_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 		memcpy32_toio(sram, buf, len);
 	}
 
+	cfg = nfc_readl(host->nfc->hsmc_regs, CFG);
+	if (unlikely(raw) && oob_required) {
+		memcpy32_toio(sram + len, chip->oob_poi, mtd->oobsize);
+		len += mtd->oobsize;
+		nfc_writel(host->nfc->hsmc_regs, CFG, cfg | NFC_CFG_WSPARE);
+	} else {
+		nfc_writel(host->nfc->hsmc_regs, CFG, cfg & ~NFC_CFG_WSPARE);
+	}
+
 	if (chip->ecc.mode == NAND_ECC_HW && host->has_pmecc)
 		/*
 		 * When use NFC sram, need set up PMECC before send
-- 
1.9.1
