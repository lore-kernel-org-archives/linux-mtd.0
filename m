Received: from conuserg-10.nifty.com ([210.131.2.77])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dI1Lt-00084E-Rs
 for linux-mtd@lists.infradead.org; Mon, 05 Jun 2017 23:24:03 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Enrico Jorns <ejo@pengutronix.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-kernel@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH v4 21/23] mtd: nand: denali: skip driver internal bounce
 buffer when possible
Date: Tue,  6 Jun 2017 08:22:00 +0900
Message-Id: <1496704922-12261-22-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1496704922-12261-1-git-send-email-yamada.masahiro@socionext.com>
References: <1496704922-12261-1-git-send-email-yamada.masahiro@socionext.com>
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
---

Changes in v4:
  - Remove dma_unmap_single() from denali_remove()

Changes in v3:
  - Set chip->buf_align to 16

Changes in v2:
  - Newly added

 drivers/mtd/nand/denali.c | 38 ++++++++++++--------------------------
 1 file changed, 12 insertions(+), 26 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 42e0620..e4ab397 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -643,12 +643,16 @@ static int denali_pio_xfer(struct denali_nand_info *denali, void *buf,
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
@@ -674,7 +678,7 @@ static int denali_dma_xfer(struct denali_nand_info *denali, void *buf,
 		ret = -EBADMSG;
 
 	denali_enable_dma(denali, false);
-	dma_sync_single_for_cpu(denali->dev, dma_addr, size, dir);
+	dma_unmap_single(denali->dev, dma_addr, size, dir);
 
 	return ret;
 }
@@ -857,12 +861,10 @@ static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
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
@@ -966,10 +968,8 @@ static int denali_write_page(struct mtd_info *mtd, struct nand_chip *chip,
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
@@ -1424,14 +1424,8 @@ int denali_init(struct denali_nand_info *denali)
 	}
 
 	if (denali->dma_avail) {
-		denali->dma_addr = dma_map_single(denali->dev, denali->buf,
-						  mtd->writesize + mtd->oobsize,
-						  DMA_BIDIRECTIONAL);
-		if (dma_mapping_error(denali->dev, denali->dma_addr)) {
-			dev_info(denali->dev,
-				 "Failed to map DMA buffer. Disabling DMA.\n");
-			denali->dma_avail = 0;
-		};
+		chip->options |= NAND_USE_BOUNCE_BUFFER;
+		chip->buf_align = 16;
 	}
 
 	/*
@@ -1520,16 +1514,8 @@ EXPORT_SYMBOL(denali_init);
 void denali_remove(struct denali_nand_info *denali)
 {
 	struct mtd_info *mtd = nand_to_mtd(&denali->nand);
-	/*
-	 * Pre-compute DMA buffer size to avoid any problems in case
-	 * nand_release() ever changes in a way that mtd->writesize and
-	 * mtd->oobsize are not reliable after this call.
-	 */
-	int bufsize = mtd->writesize + mtd->oobsize;
 
 	nand_release(mtd);
 	denali_disable_irq(denali);
-	dma_unmap_single(denali->dev, denali->dma_addr, bufsize,
-			 DMA_BIDIRECTIONAL);
 }
 EXPORT_SYMBOL(denali_remove);
-- 
2.7.4
