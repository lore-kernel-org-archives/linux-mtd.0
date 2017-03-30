Received: from conuserg-09.nifty.com ([210.131.2.76])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctVG5-0003tH-Ce
 for linux-mtd@lists.infradead.org; Thu, 30 Mar 2017 08:16:45 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Marek Vasut <marek.vasut@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 Enrico Jorns <ejo@pengutronix.de>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v3 35/37] mtd: nand: denali: skip driver internal bounce
 buffer when possible
Date: Thu, 30 Mar 2017 17:15:06 +0900
Message-Id: <1490861708-27813-5-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1490861708-27813-1-git-send-email-yamada.masahiro@socionext.com>
References: <1490861708-27813-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

For ecc->read_page() and ecc->write_page(), it is possible to call
dma_map_single() against the given buffer.  This bypasses the driver
internal bounce buffer and save the memcpy().

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
denali: set buf_align 16
---

Changes in v3:
  - Set chip->buf_align to 16

Changes in v2:
  - Newly added

 drivers/mtd/nand/denali.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 9ee0f30..87e5f0f 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -646,12 +646,16 @@ static int denali_pio_xfer(struct denali_nand_info *denali, void *buf,
 static int denali_dma_xfer(struct denali_nand_info *denali, void *buf,
 			   size_t size, int page, int raw, int write)
 {
-	dma_addr_t dma_addr = denali->dma_addr;
+	dma_addr_t dma_addr;
 	uint32_t irq_mask, irq_status, ecc_err_mask;
 	enum dma_data_direction dir = write ? DMA_TO_DEVICE : DMA_FROM_DEVICE;
 	int ret = 0;
 
-	dma_sync_single_for_device(denali->dev, dma_addr, size, dir);
+	dma_addr = dma_map_single(denali->dev, buf, size, dir);
+	if (dma_mapping_error(denali->dev, dma_addr)) {
+		dev_dbg(denali->dev, "Failed to DMA-map buffer. Trying PIO.\n");
+		return denali_pio_xfer(denali, buf, size, page, raw, write);
+	}
 
 	if (write) {
 		irq_mask = INTR__DMA_CMD_COMP | INTR__PROGRAM_FAIL;
@@ -677,7 +681,7 @@ static int denali_dma_xfer(struct denali_nand_info *denali, void *buf,
 		ret = -EBADMSG;
 
 	denali_enable_dma(denali, false);
-	dma_sync_single_for_cpu(denali->dev, dma_addr, size, dir);
+	dma_unmap_single(denali->dev, dma_addr, size, dir);
 
 	if (irq_status & INTR__ERASED_PAGE)
 		memset(buf, 0xff, size);
@@ -853,12 +857,10 @@ static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 	int stat = 0;
 	int ret;
 
-	ret = denali_data_xfer(denali, denali->buf, mtd->writesize, page, 0, 0);
+	ret = denali_data_xfer(denali, buf, mtd->writesize, page, 0, 0);
 	if (ret && ret != -EBADMSG)
 		return ret;
 
-	memcpy(buf, denali->buf, mtd->writesize);
-
 	if (denali->caps & DENALI_CAP_HW_ECC_FIXUP)
 		stat = denali_hw_ecc_fixup(mtd, denali, &uncor_ecc_flags);
 	else if (ret == -EBADMSG)
@@ -962,10 +964,8 @@ static int denali_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
 
-	memcpy(denali->buf, buf, mtd->writesize);
-
-	return denali_data_xfer(denali, denali->buf, mtd->writesize, page,
-				0, 1);
+	return denali_data_xfer(denali, (void *)buf, mtd->writesize,
+				page, 0, 1);
 }
 
 static void denali_select_chip(struct mtd_info *mtd, int chip)
@@ -1409,13 +1409,8 @@ int denali_init(struct denali_nand_info *denali)
 	}
 
 	if (denali->dma_avail) {
-		denali->dma_addr = dma_map_single(denali->dev, denali->buf,
-						  mtd->writesize + mtd->oobsize,
-						  DMA_BIDIRECTIONAL);
-		if (dma_mapping_error(denali->dev, denali->dma_addr)) {
-			dev_info(denali->dev, "Failed to map DMA buffer. Disabling DMA.\n");
-			denali->dma_avail = 0;
-		};
+		chip->options |= NAND_USE_BOUNCE_BUFFER;
+		chip->buf_align = 16;
 	}
 
 	/*
-- 
2.7.4
