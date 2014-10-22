Received: from eusmtp01.atmel.com ([212.144.249.243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgsKo-0004cN-Vq
 for linux-mtd@lists.infradead.org; Wed, 22 Oct 2014 09:36:03 +0000
From: Josh Wu <josh.wu@atmel.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] atmel_nand: replace memcpy32_toio/memcpy32_fromio with memcpy
Date: Wed, 22 Oct 2014 17:35:24 +0800
Message-ID: <1413970524-18716-1-git-send-email-josh.wu@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: vinod.koul@intel.com, nicolas.ferre@atmel.com, herve.codina@celad.com,
 Josh Wu <josh.wu@atmel.com>, voice.shen@atmel.com, computersforpeace@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There is no need to use memcpy32_toio/memcpy32_fromio to transfer data
between memory and NFC sram. As the NFC sram is a also a memery space
not a io space.
So just use memcpy is enough.

Signed-off-by: Josh Wu <josh.wu@atmel.com>
---
 drivers/mtd/nand/atmel_nand.c | 32 ++++++--------------------------
 1 file changed, 6 insertions(+), 26 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 5c1423a..28d452e 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -105,7 +105,7 @@ struct atmel_nfc {
 	struct completion	comp_xfer_done;
 
 	/* Point to the sram bank which include readed data via NFC */
-	void __iomem		*data_in_sram;
+	void 			*data_in_sram;
 	bool			will_write_sram;
 };
 static struct atmel_nfc	nand_nfc;
@@ -257,26 +257,6 @@ static int atmel_nand_set_enable_ready_pins(struct mtd_info *mtd)
 	return res;
 }
 
-static void memcpy32_fromio(void *trg, const void __iomem  *src, size_t size)
-{
-	int i;
-	u32 *t = trg;
-	const __iomem u32 *s = src;
-
-	for (i = 0; i < (size >> 2); i++)
-		*t++ = readl_relaxed(s++);
-}
-
-static void memcpy32_toio(void __iomem *trg, const void *src, int size)
-{
-	int i;
-	u32 __iomem *t = trg;
-	const u32 *s = src;
-
-	for (i = 0; i < (size >> 2); i++)
-		writel_relaxed(*s++, t++);
-}
-
 /*
  * Minimal-overhead PIO for data access.
  */
@@ -286,7 +266,7 @@ static void atmel_read_buf8(struct mtd_info *mtd, u8 *buf, int len)
 	struct atmel_nand_host *host = nand_chip->priv;
 
 	if (host->nfc && host->nfc->use_nfc_sram && host->nfc->data_in_sram) {
-		memcpy32_fromio(buf, host->nfc->data_in_sram, len);
+		memcpy(buf, host->nfc->data_in_sram, len);
 		host->nfc->data_in_sram += len;
 	} else {
 		__raw_readsb(nand_chip->IO_ADDR_R, buf, len);
@@ -299,7 +279,7 @@ static void atmel_read_buf16(struct mtd_info *mtd, u8 *buf, int len)
 	struct atmel_nand_host *host = nand_chip->priv;
 
 	if (host->nfc && host->nfc->use_nfc_sram && host->nfc->data_in_sram) {
-		memcpy32_fromio(buf, host->nfc->data_in_sram, len);
+		memcpy(buf, host->nfc->data_in_sram, len);
 		host->nfc->data_in_sram += len;
 	} else {
 		__raw_readsw(nand_chip->IO_ADDR_R, buf, len / 2);
@@ -1983,14 +1963,14 @@ static int nfc_sram_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 	if (use_dma) {
 		if (atmel_nand_dma_op(mtd, (void *)buf, len, 0) != 0)
 			/* Fall back to use cpu copy */
-			memcpy32_toio(sram, buf, len);
+			memcpy(sram, buf, len);
 	} else {
-		memcpy32_toio(sram, buf, len);
+		memcpy(sram, buf, len);
 	}
 
 	cfg = nfc_readl(host->nfc->hsmc_regs, CFG);
 	if (unlikely(raw) && oob_required) {
-		memcpy32_toio(sram + len, chip->oob_poi, mtd->oobsize);
+		memcpy(sram + len, chip->oob_poi, mtd->oobsize);
 		len += mtd->oobsize;
 		nfc_writel(host->nfc->hsmc_regs, CFG, cfg | NFC_CFG_WSPARE);
 	} else {
-- 
1.9.1
