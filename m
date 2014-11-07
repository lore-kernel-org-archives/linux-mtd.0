Received: from nasmtp01.atmel.com ([192.199.1.245]
 helo=DVREDG01.corp.atmel.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XmdwV-0007KE-QF
 for linux-mtd@lists.infradead.org; Fri, 07 Nov 2014 07:26:48 +0000
From: Josh Wu <josh.wu@atmel.com>
To: <linux-mtd@lists.infradead.org>, <computersforpeace@gmail.com>
Subject: [PATCH v2] mtd: atmel_nand: replace memcpy32_toio/memcpy32_fromio
 with memcpy
Date: Fri, 7 Nov 2014 15:26:09 +0800
Message-ID: <1415345169-9602-1-git-send-email-josh.wu@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: vinod.koul@intel.com, nicolas.ferre@atmel.com, herve.codina@celad.com,
 Josh Wu <josh.wu@atmel.com>, voice.shen@atmel.com, dwmw2@infradead.org
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

Also we removed the __iomem prefix for NFC sram to avoid sparse warnings.

Signed-off-by: Josh Wu <josh.wu@atmel.com>
Reviewed-by: Brian Norris <computersforpeace@gmail.com>
---
v1 -> v2:
  1. fix sparse warnings.
  2. remove __iomem prefix for sram_bank0.


 drivers/mtd/nand/atmel_nand.c | 39 ++++++++++-----------------------------
 1 file changed, 10 insertions(+), 29 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 5c1423a..9c28d01 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -92,7 +92,7 @@ static struct nand_ecclayout atmel_oobinfo_small = {
 struct atmel_nfc {
 	void __iomem		*base_cmd_regs;
 	void __iomem		*hsmc_regs;
-	void __iomem		*sram_bank0;
+	void			*sram_bank0;
 	dma_addr_t		sram_bank0_phys;
 	bool			use_nfc_sram;
 	bool			write_by_sram;
@@ -105,7 +105,7 @@ struct atmel_nfc {
 	struct completion	comp_xfer_done;
 
 	/* Point to the sram bank which include readed data via NFC */
-	void __iomem		*data_in_sram;
+	void			*data_in_sram;
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
@@ -1972,7 +1952,7 @@ static int nfc_sram_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 	int cfg, len;
 	int status = 0;
 	struct atmel_nand_host *host = chip->priv;
-	void __iomem *sram = host->nfc->sram_bank0 + nfc_get_sram_off(host);
+	void *sram = host->nfc->sram_bank0 + nfc_get_sram_off(host);
 
 	/* Subpage write is not supported */
 	if (offset || (data_len < mtd->writesize))
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
@@ -2333,7 +2313,8 @@ static int atmel_nand_nfc_probe(struct platform_device *pdev)
 
 	nfc_sram = platform_get_resource(pdev, IORESOURCE_MEM, 2);
 	if (nfc_sram) {
-		nfc->sram_bank0 = devm_ioremap_resource(&pdev->dev, nfc_sram);
+		nfc->sram_bank0 = (void * __force)
+				devm_ioremap_resource(&pdev->dev, nfc_sram);
 		if (IS_ERR(nfc->sram_bank0)) {
 			dev_warn(&pdev->dev, "Fail to ioremap the NFC sram with error: %ld. So disable NFC sram.\n",
 					PTR_ERR(nfc->sram_bank0));
-- 
1.9.1
