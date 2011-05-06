Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QIM20-0008O9-Bl
	for linux-mtd@lists.infradead.org; Fri, 06 May 2011 14:29:26 +0000
Received: by wwb39 with SMTP id 39so2593287wwb.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 06 May 2011 07:29:19 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [RFC PATCH 1/9] nand/denali: convert to generic DMA API
Date: Fri,  6 May 2011 15:28:55 +0100
Message-Id: <1304692143-22432-2-git-send-email-jamie@jamieiles.com>
In-Reply-To: <1304692143-22432-1-git-send-email-jamie@jamieiles.com>
References: <1304692143-22432-1-git-send-email-jamie@jamieiles.com>
Cc: Jamie Iles <jamie@jamieiles.com>, dwmw2@infradead.org,
	chuanxiao.dong@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Rather than using the PCI specific DMA API, convert to the generic
DMA API so that we can use the Denali NAND controller on other bus
types.

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Chuanxiao Dong <chuanxiao.dong@intel.com>
Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 drivers/mtd/nand/denali.c |   82 +++++++++++++++++++++-----------------------
 drivers/mtd/nand/denali.h |    2 +-
 2 files changed, 40 insertions(+), 44 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 4633f09..1cf7281 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -19,6 +19,7 @@
 
 #include <linux/interrupt.h>
 #include <linux/delay.h>
+#include <linux/dma-mapping.h>
 #include <linux/wait.h>
 #include <linux/mutex.h>
 #include <linux/slab.h>
@@ -192,7 +193,7 @@ static void reset_bank(struct denali_nand_info *denali)
 	irq_status = wait_for_irq(denali, irq_mask);
 
 	if (irq_status & operation_timeout[denali->flash_bank])
-		dev_err(&denali->dev->dev, "reset bank failed.\n");
+		dev_err(denali->dev, "reset bank failed.\n");
 }
 
 /* Reset the flash controller */
@@ -200,7 +201,7 @@ static uint16_t denali_nand_reset(struct denali_nand_info *denali)
 {
 	uint32_t i;
 
-	dev_dbg(&denali->dev->dev, "%s, Line %d, Function: %s\n",
+	dev_dbg(denali->dev, "%s, Line %d, Function: %s\n",
 		       __FILE__, __LINE__, __func__);
 
 	for (i = 0 ; i < LLD_MAX_FLASH_BANKS; i++)
@@ -216,7 +217,7 @@ static uint16_t denali_nand_reset(struct denali_nand_info *denali)
 			cpu_relax();
 		if (ioread32(denali->flash_reg + intr_status_addresses[i]) &
 			operation_timeout[i])
-			dev_dbg(&denali->dev->dev,
+			dev_dbg(denali->dev,
 			"NAND Reset operation timed out on bank %d\n", i);
 	}
 
@@ -254,7 +255,7 @@ static void nand_onfi_timing_set(struct denali_nand_info *denali,
 	uint16_t acc_clks;
 	uint16_t addr_2_data, re_2_we, re_2_re, we_2_re, cs_cnt;
 
-	dev_dbg(&denali->dev->dev, "%s, Line %d, Function: %s\n",
+	dev_dbg(denali->dev, "%s, Line %d, Function: %s\n",
 		       __FILE__, __LINE__, __func__);
 
 	en_lo = CEIL_DIV(Trp[mode], CLK_X);
@@ -291,7 +292,7 @@ static void nand_onfi_timing_set(struct denali_nand_info *denali,
 		acc_clks++;
 
 	if ((data_invalid - acc_clks * CLK_X) < 2)
-		dev_warn(&denali->dev->dev, "%s, Line %d: Warning!\n",
+		dev_warn(denali->dev, "%s, Line %d: Warning!\n",
 			__FILE__, __LINE__);
 
 	addr_2_data = CEIL_DIV(Tadl[mode], CLK_X);
@@ -419,7 +420,7 @@ static void get_hynix_nand_para(struct denali_nand_info *denali,
 #endif
 		break;
 	default:
-		dev_warn(&denali->dev->dev,
+		dev_warn(denali->dev,
 			"Spectra: Unknown Hynix NAND (Device ID: 0x%x)."
 			"Will use default parameter values instead.\n",
 			device_id);
@@ -441,7 +442,7 @@ static void find_valid_banks(struct denali_nand_info *denali)
 		index_addr_read_data(denali,
 				(uint32_t)(MODE_11 | (i << 24) | 2), &id[i]);
 
-		dev_dbg(&denali->dev->dev,
+		dev_dbg(denali->dev,
 			"Return 1st ID for bank[%d]: %x\n", i, id[i]);
 
 		if (i == 0) {
@@ -461,13 +462,13 @@ static void find_valid_banks(struct denali_nand_info *denali)
 		 * Multichip support is not enabled.
 		 */
 		if (denali->total_used_banks != 1) {
-			dev_err(&denali->dev->dev,
+			dev_err(denali->dev,
 					"Sorry, Intel CE4100 only supports "
 					"a single NAND device.\n");
 			BUG();
 		}
 	}
-	dev_dbg(&denali->dev->dev,
+	dev_dbg(denali->dev,
 		"denali->total_used_banks: %d\n", denali->total_used_banks);
 }
 
@@ -501,7 +502,7 @@ static uint16_t denali_nand_timing_set(struct denali_nand_info *denali)
 	uint32_t id_bytes[5], addr;
 	uint8_t i, maf_id, device_id;
 
-	dev_dbg(&denali->dev->dev,
+	dev_dbg(denali->dev,
 			"%s, Line %d, Function: %s\n",
 			__FILE__, __LINE__, __func__);
 
@@ -530,7 +531,7 @@ static uint16_t denali_nand_timing_set(struct denali_nand_info *denali)
 		get_hynix_nand_para(denali, device_id);
 	}
 
-	dev_info(&denali->dev->dev,
+	dev_info(denali->dev,
 			"Dump timing register values:"
 			"acc_clks: %d, re_2_we: %d, re_2_re: %d\n"
 			"we_2_re: %d, addr_2_data: %d, rdwr_en_lo_cnt: %d\n"
@@ -560,7 +561,7 @@ static uint16_t denali_nand_timing_set(struct denali_nand_info *denali)
 static void denali_set_intr_modes(struct denali_nand_info *denali,
 					uint16_t INT_ENABLE)
 {
-	dev_dbg(&denali->dev->dev, "%s, Line %d, Function: %s\n",
+	dev_dbg(denali->dev, "%s, Line %d, Function: %s\n",
 		       __FILE__, __LINE__, __func__);
 
 	if (INT_ENABLE)
@@ -800,7 +801,7 @@ static int denali_send_pipeline_cmd(struct denali_nand_info *denali,
 			irq_status = wait_for_irq(denali, irq_mask);
 
 			if (irq_status == 0) {
-				dev_err(&denali->dev->dev,
+				dev_err(denali->dev,
 						"cmd, page, addr on timeout "
 						"(0x%x, 0x%x, 0x%x)\n",
 						cmd, denali->page, addr);
@@ -875,11 +876,11 @@ static int write_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
 		irq_status = wait_for_irq(denali, irq_mask);
 
 		if (irq_status == 0) {
-			dev_err(&denali->dev->dev, "OOB write failed\n");
+			dev_err(denali->dev, "OOB write failed\n");
 			status = -EIO;
 		}
 	} else {
-		dev_err(&denali->dev->dev, "unable to send pipeline command\n");
+		dev_err(denali->dev, "unable to send pipeline command\n");
 		status = -EIO;
 	}
 	return status;
@@ -904,7 +905,7 @@ static void read_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
 		irq_status = wait_for_irq(denali, irq_mask);
 
 		if (irq_status == 0)
-			dev_err(&denali->dev->dev, "page on OOB timeout %d\n",
+			dev_err(denali->dev, "page on OOB timeout %d\n",
 					denali->page);
 
 		/* We set the device back to MAIN_ACCESS here as I observed
@@ -1045,7 +1046,6 @@ static void write_page(struct mtd_info *mtd, struct nand_chip *chip,
 			const uint8_t *buf, bool raw_xfer)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
-	struct pci_dev *pci_dev = denali->dev;
 
 	dma_addr_t addr = denali->buf.dma_buf;
 	size_t size = denali->mtd.writesize + denali->mtd.oobsize;
@@ -1071,7 +1071,7 @@ static void write_page(struct mtd_info *mtd, struct nand_chip *chip,
 			mtd->oobsize);
 	}
 
-	pci_dma_sync_single_for_device(pci_dev, addr, size, PCI_DMA_TODEVICE);
+	dma_sync_single_for_device(denali->dev, addr, size, DMA_TO_DEVICE);
 
 	clear_interrupts(denali);
 	denali_enable_dma(denali, true);
@@ -1082,7 +1082,7 @@ static void write_page(struct mtd_info *mtd, struct nand_chip *chip,
 	irq_status = wait_for_irq(denali, irq_mask);
 
 	if (irq_status == 0) {
-		dev_err(&denali->dev->dev,
+		dev_err(denali->dev,
 				"timeout on write_page (type = %d)\n",
 				raw_xfer);
 		denali->status =
@@ -1091,7 +1091,7 @@ static void write_page(struct mtd_info *mtd, struct nand_chip *chip,
 	}
 
 	denali_enable_dma(denali, false);
-	pci_dma_sync_single_for_cpu(pci_dev, addr, size, PCI_DMA_TODEVICE);
+	dma_sync_single_for_cpu(denali->dev, addr, size, DMA_TO_DEVICE);
 }
 
 /* NAND core entry points */
@@ -1139,7 +1139,6 @@ static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 			    uint8_t *buf, int page)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
-	struct pci_dev *pci_dev = denali->dev;
 
 	dma_addr_t addr = denali->buf.dma_buf;
 	size_t size = denali->mtd.writesize + denali->mtd.oobsize;
@@ -1150,7 +1149,7 @@ static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 	bool check_erased_page = false;
 
 	if (page != denali->page) {
-		dev_err(&denali->dev->dev, "IN %s: page %d is not"
+		dev_err(denali->dev, "IN %s: page %d is not"
 				" equal to denali->page %d, investigate!!",
 				__func__, page, denali->page);
 		BUG();
@@ -1159,7 +1158,7 @@ static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 	setup_ecc_for_xfer(denali, true, false);
 
 	denali_enable_dma(denali, true);
-	pci_dma_sync_single_for_device(pci_dev, addr, size, PCI_DMA_FROMDEVICE);
+	dma_sync_single_for_device(denali->dev, addr, size, DMA_FROM_DEVICE);
 
 	clear_interrupts(denali);
 	denali_setup_dma(denali, DENALI_READ);
@@ -1167,7 +1166,7 @@ static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 	/* wait for operation to complete */
 	irq_status = wait_for_irq(denali, irq_mask);
 
-	pci_dma_sync_single_for_cpu(pci_dev, addr, size, PCI_DMA_FROMDEVICE);
+	dma_sync_single_for_cpu(denali->dev, addr, size, DMA_FROM_DEVICE);
 
 	memcpy(buf, denali->buf.buf, mtd->writesize);
 
@@ -1192,7 +1191,6 @@ static int denali_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 				uint8_t *buf, int page)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
-	struct pci_dev *pci_dev = denali->dev;
 
 	dma_addr_t addr = denali->buf.dma_buf;
 	size_t size = denali->mtd.writesize + denali->mtd.oobsize;
@@ -1201,7 +1199,7 @@ static int denali_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 	uint32_t irq_mask = INTR_STATUS0__DMA_CMD_COMP;
 
 	if (page != denali->page) {
-		dev_err(&denali->dev->dev, "IN %s: page %d is not"
+		dev_err(denali->dev, "IN %s: page %d is not"
 				" equal to denali->page %d, investigate!!",
 				__func__, page, denali->page);
 		BUG();
@@ -1210,7 +1208,7 @@ static int denali_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 	setup_ecc_for_xfer(denali, false, true);
 	denali_enable_dma(denali, true);
 
-	pci_dma_sync_single_for_device(pci_dev, addr, size, PCI_DMA_FROMDEVICE);
+	dma_sync_single_for_device(denali->dev, addr, size, DMA_FROM_DEVICE);
 
 	clear_interrupts(denali);
 	denali_setup_dma(denali, DENALI_READ);
@@ -1218,7 +1216,7 @@ static int denali_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 	/* wait for operation to complete */
 	irq_status = wait_for_irq(denali, irq_mask);
 
-	pci_dma_sync_single_for_cpu(pci_dev, addr, size, PCI_DMA_FROMDEVICE);
+	dma_sync_single_for_cpu(denali->dev, addr, size, DMA_FROM_DEVICE);
 
 	denali_enable_dma(denali, false);
 
@@ -1330,7 +1328,7 @@ static int denali_ecc_calculate(struct mtd_info *mtd, const uint8_t *data,
 				uint8_t *ecc_code)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
-	dev_err(&denali->dev->dev,
+	dev_err(denali->dev,
 			"denali_ecc_calculate called unexpectedly\n");
 	BUG();
 	return -EIO;
@@ -1340,7 +1338,7 @@ static int denali_ecc_correct(struct mtd_info *mtd, uint8_t *data,
 				uint8_t *read_ecc, uint8_t *calc_ecc)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
-	dev_err(&denali->dev->dev,
+	dev_err(denali->dev,
 			"denali_ecc_correct called unexpectedly\n");
 	BUG();
 	return -EIO;
@@ -1349,7 +1347,7 @@ static int denali_ecc_correct(struct mtd_info *mtd, uint8_t *data,
 static void denali_ecc_hwctl(struct mtd_info *mtd, int mode)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
-	dev_err(&denali->dev->dev,
+	dev_err(denali->dev,
 			"denali_ecc_hwctl called unexpectedly\n");
 	BUG();
 }
@@ -1484,24 +1482,22 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	}
 
 	/* Is 32-bit DMA supported? */
-	ret = pci_set_dma_mask(dev, DMA_BIT_MASK(32));
-
+	ret = dma_set_mask(&dev->dev, DMA_BIT_MASK(32));
 	if (ret) {
 		printk(KERN_ERR "Spectra: no usable DMA configuration\n");
 		goto failed_enable_dev;
 	}
-	denali->buf.dma_buf =
-		pci_map_single(dev, denali->buf.buf,
-						DENALI_BUF_SIZE,
-						PCI_DMA_BIDIRECTIONAL);
+	denali->buf.dma_buf = dma_map_single(&dev->dev, denali->buf.buf,
+					     DENALI_BUF_SIZE,
+					     DMA_BIDIRECTIONAL);
 
-	if (pci_dma_mapping_error(dev, denali->buf.dma_buf)) {
+	if (dma_mapping_error(&dev->dev, denali->buf.dma_buf)) {
 		dev_err(&dev->dev, "Spectra: failed to map DMA buffer\n");
 		goto failed_enable_dev;
 	}
 
 	pci_set_master(dev);
-	denali->dev = dev;
+	denali->dev = &dev->dev;
 	denali->mtd.dev.parent = &dev->dev;
 
 	ret = pci_request_regions(dev, DENALI_NAND_NAME);
@@ -1681,8 +1677,8 @@ failed_remap_reg:
 failed_req_regions:
 	pci_release_regions(dev);
 failed_dma_map:
-	pci_unmap_single(dev, denali->buf.dma_buf, DENALI_BUF_SIZE,
-							PCI_DMA_BIDIRECTIONAL);
+	dma_unmap_single(&dev->dev, denali->buf.dma_buf, DENALI_BUF_SIZE,
+			 DMA_BIDIRECTIONAL);
 failed_enable_dev:
 	pci_disable_device(dev);
 failed_alloc_memery:
@@ -1704,8 +1700,8 @@ static void denali_pci_remove(struct pci_dev *dev)
 	iounmap(denali->flash_mem);
 	pci_release_regions(dev);
 	pci_disable_device(dev);
-	pci_unmap_single(dev, denali->buf.dma_buf, DENALI_BUF_SIZE,
-							PCI_DMA_BIDIRECTIONAL);
+	dma_unmap_single(&dev->dev, denali->buf.dma_buf, DENALI_BUF_SIZE,
+			 DMA_BIDIRECTIONAL);
 	pci_set_drvdata(dev, NULL);
 	kfree(denali);
 }
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index 3918bcb..9b875fd 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -732,7 +732,7 @@ struct denali_nand_info {
 	int status;
 	int platform;
 	struct nand_buf buf;
-	struct pci_dev *dev;
+	struct device *dev;
 	int total_used_banks;
 	uint32_t block;  /* stored for future use */
 	uint16_t page;
-- 
1.7.4.4
