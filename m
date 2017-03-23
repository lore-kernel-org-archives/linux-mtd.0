Received: from conuserg-09.nifty.com ([210.131.2.76])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqqTT-0001GW-AG
 for linux-mtd@lists.infradead.org; Thu, 23 Mar 2017 00:19:35 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 thorsten.christiansson@idquantique.com, laurent.monat@idquantique.com,
 Dinh Nguyen <dinguyen@kernel.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 Enrico Jorns <ejo@pengutronix.de>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Jassi Brar <jaswinder.singh@linaro.org>, Rob Herring <robh@kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [RESEND PATCH v2 46/53] mtd: nand: denali: merge struct nand_buf into
 struct denali_nand_info
Date: Thu, 23 Mar 2017 09:17:55 +0900
Message-Id: <1490228282-10805-20-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1490228282-10805-1-git-send-email-yamada.masahiro@socionext.com>
References: <1490228282-10805-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Now struct nand_buf has only two members, so I see no reason for the
separation.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Newly added

 drivers/mtd/nand/denali.c | 29 ++++++++++++++---------------
 drivers/mtd/nand/denali.h |  8 ++------
 2 files changed, 16 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index e08eab6..e9e164c 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -595,7 +595,7 @@ static int write_page(struct mtd_info *mtd, struct nand_chip *chip,
 			const uint8_t *buf, int page, bool raw_xfer)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
-	dma_addr_t addr = denali->buf.dma_buf;
+	dma_addr_t addr = denali->dma_addr;
 	size_t size = mtd->writesize + mtd->oobsize;
 	uint32_t irq_status;
 	uint32_t irq_mask = INTR__DMA_CMD_COMP | INTR__PROGRAM_FAIL;
@@ -609,11 +609,11 @@ static int write_page(struct mtd_info *mtd, struct nand_chip *chip,
 	setup_ecc_for_xfer(denali, !raw_xfer, raw_xfer);
 
 	/* copy buffer into DMA buffer */
-	memcpy(denali->buf.buf, buf, mtd->writesize);
+	memcpy(denali->buf, buf, mtd->writesize);
 
 	if (raw_xfer) {
 		/* transfer the data to the spare area */
-		memcpy(denali->buf.buf + mtd->writesize,
+		memcpy(denali->buf + mtd->writesize,
 			chip->oob_poi,
 			mtd->oobsize);
 	}
@@ -690,7 +690,7 @@ static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 			    uint8_t *buf, int oob_required, int page)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
-	dma_addr_t addr = denali->buf.dma_buf;
+	dma_addr_t addr = denali->dma_addr;
 	size_t size = mtd->writesize + mtd->oobsize;
 	uint32_t irq_status;
 	uint32_t irq_mask = denali->caps & DENALI_CAP_HW_ECC_FIXUP ?
@@ -711,7 +711,7 @@ static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 
 	dma_sync_single_for_cpu(denali->dev, addr, size, DMA_FROM_DEVICE);
 
-	memcpy(buf, denali->buf.buf, mtd->writesize);
+	memcpy(buf, denali->buf, mtd->writesize);
 
 	if (denali->caps & DENALI_CAP_HW_ECC_FIXUP)
 		stat = denali_hw_ecc_fixup(mtd, denali);
@@ -746,7 +746,7 @@ static int denali_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 				uint8_t *buf, int oob_required, int page)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
-	dma_addr_t addr = denali->buf.dma_buf;
+	dma_addr_t addr = denali->dma_addr;
 	size_t size = mtd->writesize + mtd->oobsize;
 	uint32_t irq_mask = INTR__DMA_CMD_COMP;
 	uint32_t irq_status;
@@ -768,8 +768,8 @@ static int denali_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 
 	denali_enable_dma(denali, false);
 
-	memcpy(buf, denali->buf.buf, mtd->writesize);
-	memcpy(chip->oob_poi, denali->buf.buf + mtd->writesize, mtd->oobsize);
+	memcpy(buf, denali->buf, mtd->writesize);
+	memcpy(chip->oob_poi, denali->buf + mtd->writesize, mtd->oobsize);
 
 	return 0;
 }
@@ -1187,10 +1187,9 @@ int denali_init(struct denali_nand_info *denali)
 	if (ret)
 		goto disable_irq;
 
-	denali->buf.buf = devm_kzalloc(denali->dev,
-			     mtd->writesize + mtd->oobsize,
-			     GFP_KERNEL);
-	if (!denali->buf.buf) {
+	denali->buf = devm_kzalloc(denali->dev, mtd->writesize + mtd->oobsize,
+				   GFP_KERNEL);
+	if (!denali->buf) {
 		ret = -ENOMEM;
 		goto disable_irq;
 	}
@@ -1203,10 +1202,10 @@ int denali_init(struct denali_nand_info *denali)
 		goto disable_irq;
 	}
 
-	denali->buf.dma_buf = dma_map_single(denali->dev, denali->buf.buf,
+	denali->dma_addr = dma_map_single(denali->dev, denali->buf,
 			     mtd->writesize + mtd->oobsize,
 			     DMA_BIDIRECTIONAL);
-	if (dma_mapping_error(denali->dev, denali->buf.dma_buf)) {
+	if (dma_mapping_error(denali->dev, denali->dma_addr)) {
 		dev_err(denali->dev, "Failed to map DMA buffer\n");
 		ret = -EIO;
 		goto disable_irq;
@@ -1328,7 +1327,7 @@ void denali_remove(struct denali_nand_info *denali)
 
 	nand_release(mtd);
 	denali_disable_irq(denali);
-	dma_unmap_single(denali->dev, denali->buf.dma_buf, bufsize,
+	dma_unmap_single(denali->dev, denali->dma_addr, bufsize,
 			 DMA_BIDIRECTIONAL);
 }
 EXPORT_SYMBOL(denali_remove);
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index 2cc270c6..332db96 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -310,16 +310,10 @@
 #define MODE_10    0x08000000
 #define MODE_11    0x0C000000
 
-struct nand_buf {
-	uint8_t *buf;
-	dma_addr_t dma_buf;
-};
-
 struct denali_nand_info {
 	struct nand_chip nand;
 	unsigned long clk_x_rate;	/* bus interface clock rate */
 	int flash_bank; /* currently selected chip */
-	struct nand_buf buf;
 	struct device *dev;
 	void __iomem *flash_reg;	/* Register Interface */
 	void __iomem *flash_mem;	/* Host Data/Command Interface */
@@ -331,6 +325,8 @@ struct denali_nand_info {
 	uint32_t irq_status;
 	int irq;
 
+	void *buf;
+	dma_addr_t dma_addr;
 	int devnum;	/* represent how many nands connected */
 	int bbtskipbytes;
 	int max_banks;
-- 
2.7.4
