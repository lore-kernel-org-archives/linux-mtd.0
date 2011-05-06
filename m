Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QIM2E-0008OE-Fv
	for linux-mtd@lists.infradead.org; Fri, 06 May 2011 14:29:41 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so2593348wwb.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 06 May 2011 07:29:38 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [RFC PATCH 5/9] nand/denali: convert to dev_() printk helpers
Date: Fri,  6 May 2011 15:28:59 +0100
Message-Id: <1304692143-22432-6-git-send-email-jamie@jamieiles.com>
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

Use the dev_() printk helpers rather than printk so the name of the
device is include.  Also remove a duplicate definition of BANK().

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Chuanxiao Dong <chuanxiao.dong@intel.com>
Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 drivers/mtd/nand/denali.c     |  122 ++++++++++++++++++-----------------------
 drivers/mtd/nand/denali_pci.c |   10 +--
 2 files changed, 58 insertions(+), 74 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index e389c8c..ce6afd7 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -166,8 +166,7 @@ static uint16_t denali_nand_reset(struct denali_nand_info *denali)
 {
 	uint32_t i;
 
-	dev_dbg(denali->dev, "%s, Line %d, Function: %s\n",
-		       __FILE__, __LINE__, __func__);
+	dev_dbg(denali->dev, "resetting\n");
 
 	for (i = 0 ; i < denali->max_banks; i++)
 		iowrite32(INTR_STATUS__RST_COMP | INTR_STATUS__TIME_OUT,
@@ -182,7 +181,8 @@ static uint16_t denali_nand_reset(struct denali_nand_info *denali)
 		if (ioread32(denali->flash_reg + INTR_STATUS(i)) &
 			INTR_STATUS__TIME_OUT)
 			dev_dbg(denali->dev,
-			"NAND Reset operation timed out on bank %d\n", i);
+				"NAND Reset operation timed out on bank %d\n",
+				i);
 	}
 
 	for (i = 0; i < denali->max_banks; i++)
@@ -219,8 +219,7 @@ static void nand_onfi_timing_set(struct denali_nand_info *denali,
 	uint16_t acc_clks;
 	uint16_t addr_2_data, re_2_we, re_2_re, we_2_re, cs_cnt;
 
-	dev_dbg(denali->dev, "%s, Line %d, Function: %s\n",
-		       __FILE__, __LINE__, __func__);
+	dev_dbg(denali->dev, "init timing\n");
 
 	en_lo = CEIL_DIV(Trp[mode], CLK_X);
 	en_hi = CEIL_DIV(Treh[mode], CLK_X);
@@ -256,8 +255,8 @@ static void nand_onfi_timing_set(struct denali_nand_info *denali,
 		acc_clks++;
 
 	if ((data_invalid - acc_clks * CLK_X) < 2)
-		dev_warn(denali->dev, "%s, Line %d: Warning!\n",
-			__FILE__, __LINE__);
+		dev_warn(denali->dev, "%s, Line %d: Warning!\n", __FILE__,
+			 __LINE__);
 
 	addr_2_data = CEIL_DIV(Tadl[mode], CLK_X);
 	re_2_we = CEIL_DIV(Trhw[mode], CLK_X);
@@ -385,9 +384,8 @@ static void get_hynix_nand_para(struct denali_nand_info *denali,
 		break;
 	default:
 		dev_warn(denali->dev,
-			"Spectra: Unknown Hynix NAND (Device ID: 0x%x)."
-			"Will use default parameter values instead.\n",
-			device_id);
+			 "unknown Hynix NAND (Device ID: 0x%x). Will use default parameter values instead.\n",
+			 device_id);
 	}
 }
 
@@ -406,8 +404,8 @@ static void find_valid_banks(struct denali_nand_info *denali)
 		index_addr_read_data(denali,
 				(uint32_t)(MODE_11 | (i << 24) | 2), &id[i]);
 
-		dev_dbg(denali->dev,
-			"Return 1st ID for bank[%d]: %x\n", i, id[i]);
+		dev_dbg(denali->dev, "Return 1st ID for bank[%d]: %x\n", i,
+			id[i]);
 
 		if (i == 0) {
 			if (!(id[i] & 0x0ff))
@@ -427,13 +425,12 @@ static void find_valid_banks(struct denali_nand_info *denali)
 		 */
 		if (denali->total_used_banks != 1) {
 			dev_err(denali->dev,
-					"Sorry, Intel CE4100 only supports "
-					"a single NAND device.\n");
+				"Sorry, Intel CE4100 only supports a single NAND device.\n");
 			BUG();
 		}
 	}
-	dev_dbg(denali->dev,
-		"denali->total_used_banks: %d\n", denali->total_used_banks);
+	dev_dbg(denali->dev, "denali->total_used_banks: %d\n",
+		denali->total_used_banks);
 }
 
 /*
@@ -477,9 +474,7 @@ static uint16_t denali_nand_timing_set(struct denali_nand_info *denali)
 	uint32_t id_bytes[5], addr;
 	uint8_t i, maf_id, device_id;
 
-	dev_dbg(denali->dev,
-			"%s, Line %d, Function: %s\n",
-			__FILE__, __LINE__, __func__);
+	dev_dbg(denali->dev, "set the timing\n");
 
 	/* Use read id method to get device ID and other
 	 * params. For some NAND chips, controller can't
@@ -507,18 +502,17 @@ static uint16_t denali_nand_timing_set(struct denali_nand_info *denali)
 	}
 
 	dev_info(denali->dev,
-			"Dump timing register values:"
-			"acc_clks: %d, re_2_we: %d, re_2_re: %d\n"
-			"we_2_re: %d, addr_2_data: %d, rdwr_en_lo_cnt: %d\n"
-			"rdwr_en_hi_cnt: %d, cs_setup_cnt: %d\n",
-			ioread32(denali->flash_reg + ACC_CLKS),
-			ioread32(denali->flash_reg + RE_2_WE),
-			ioread32(denali->flash_reg + RE_2_RE),
-			ioread32(denali->flash_reg + WE_2_RE),
-			ioread32(denali->flash_reg + ADDR_2_DATA),
-			ioread32(denali->flash_reg + RDWR_EN_LO_CNT),
-			ioread32(denali->flash_reg + RDWR_EN_HI_CNT),
-			ioread32(denali->flash_reg + CS_SETUP_CNT));
+		 "Dump timing register values: acc_clks: %d, re_2_we: %d, re_2_re: %d\n"
+		 "we_2_re: %d, addr_2_data: %d, rdwr_en_lo_cnt: %d\n"
+		 "rdwr_en_hi_cnt: %d, cs_setup_cnt: %d\n",
+		 ioread32(denali->flash_reg + ACC_CLKS),
+		 ioread32(denali->flash_reg + RE_2_WE),
+		 ioread32(denali->flash_reg + RE_2_RE),
+		 ioread32(denali->flash_reg + WE_2_RE),
+		 ioread32(denali->flash_reg + ADDR_2_DATA),
+		 ioread32(denali->flash_reg + RDWR_EN_LO_CNT),
+		 ioread32(denali->flash_reg + RDWR_EN_HI_CNT),
+		 ioread32(denali->flash_reg + CS_SETUP_CNT));
 
 	find_valid_banks(denali);
 
@@ -536,8 +530,7 @@ static uint16_t denali_nand_timing_set(struct denali_nand_info *denali)
 static void denali_set_intr_modes(struct denali_nand_info *denali,
 					uint16_t INT_ENABLE)
 {
-	dev_dbg(denali->dev, "%s, Line %d, Function: %s\n",
-		       __FILE__, __LINE__, __func__);
+	dev_dbg(denali->dev, "set interrupt modes\n");
 
 	if (INT_ENABLE)
 		iowrite32(1, denali->flash_reg + GLOBAL_INT_ENABLE);
@@ -660,7 +653,6 @@ static irqreturn_t denali_isr(int irq, void *dev_id)
 	spin_unlock(&denali->irq_lock);
 	return result;
 }
-#define BANK(x) ((x) << 24)
 
 static uint32_t wait_for_irq(struct denali_nand_info *denali, uint32_t irq_mask)
 {
@@ -690,8 +682,9 @@ static uint32_t wait_for_irq(struct denali_nand_info *denali, uint32_t irq_mask)
 
 	if (comp_res == 0) {
 		/* timeout */
-		printk(KERN_ERR "timeout occurred, status = 0x%x, mask = 0x%x\n",
-				intr_status, irq_mask);
+		dev_err(&denali->mtd.dev,
+			"timeout occurred, status = 0x%x, mask = 0x%x\n",
+			intr_status, irq_mask);
 
 		intr_status = 0;
 	}
@@ -776,9 +769,8 @@ static int denali_send_pipeline_cmd(struct denali_nand_info *denali,
 
 			if (irq_status == 0) {
 				dev_err(denali->dev,
-						"cmd, page, addr on timeout "
-						"(0x%x, 0x%x, 0x%x)\n",
-						cmd, denali->page, addr);
+					"cmd, page, addr on timeout (0x%x, 0x%x, 0x%x)\n",
+					cmd, denali->page, addr);
 				status = FAIL;
 			} else {
 				cmd = MODE_01 | addr;
@@ -880,7 +872,7 @@ static void read_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
 
 		if (irq_status == 0)
 			dev_err(denali->dev, "page on OOB timeout %d\n",
-					denali->page);
+				denali->page);
 
 		/* We set the device back to MAIN_ACCESS here as I observed
 		 * instability with the controller if you do a block erase
@@ -1056,9 +1048,8 @@ static void write_page(struct mtd_info *mtd, struct nand_chip *chip,
 	irq_status = wait_for_irq(denali, irq_mask);
 
 	if (irq_status == 0) {
-		dev_err(denali->dev,
-				"timeout on write_page (type = %d)\n",
-				raw_xfer);
+		dev_err(denali->dev, "timeout on write_page (type = %d)\n",
+			raw_xfer);
 		denali->status =
 			(irq_status & INTR_STATUS__PROGRAM_FAIL) ?
 			NAND_STATUS_FAIL : PASS;
@@ -1123,9 +1114,9 @@ static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 	bool check_erased_page = false;
 
 	if (page != denali->page) {
-		dev_err(denali->dev, "IN %s: page %d is not"
-				" equal to denali->page %d, investigate!!",
-				__func__, page, denali->page);
+		dev_err(denali->dev,
+			"IN %s: page %d is not equal to denali->page %d, investigate!!",
+			__func__, page, denali->page);
 		BUG();
 	}
 
@@ -1173,9 +1164,8 @@ static int denali_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 	uint32_t irq_mask = INTR_STATUS__DMA_CMD_COMP;
 
 	if (page != denali->page) {
-		dev_err(denali->dev, "IN %s: page %d is not"
-				" equal to denali->page %d, investigate!!",
-				__func__, page, denali->page);
+		dev_err(denali->dev, "IN %s: page %d is not equal to denali->page %d, investigate!!",
+			__func__, page, denali->page);
 		BUG();
 	}
 
@@ -1291,8 +1281,8 @@ static void denali_cmdfunc(struct mtd_info *mtd, unsigned int cmd, int col,
 		/* TODO: Read OOB data */
 		break;
 	default:
-		printk(KERN_ERR ": unsupported command"
-				" received 0x%x\n", cmd);
+		dev_err(&denali->mtd.dev, "unsupported command received 0x%x\n",
+			cmd);
 		break;
 	}
 }
@@ -1302,8 +1292,7 @@ static int denali_ecc_calculate(struct mtd_info *mtd, const uint8_t *data,
 				uint8_t *ecc_code)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
-	dev_err(denali->dev,
-			"denali_ecc_calculate called unexpectedly\n");
+	dev_err(denali->dev, "denali_ecc_calculate called unexpectedly\n");
 	BUG();
 	return -EIO;
 }
@@ -1312,8 +1301,7 @@ static int denali_ecc_correct(struct mtd_info *mtd, uint8_t *data,
 				uint8_t *read_ecc, uint8_t *calc_ecc)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
-	dev_err(denali->dev,
-			"denali_ecc_correct called unexpectedly\n");
+	dev_err(denali->dev, "denali_ecc_correct called unexpectedly\n");
 	BUG();
 	return -EIO;
 }
@@ -1321,8 +1309,7 @@ static int denali_ecc_correct(struct mtd_info *mtd, uint8_t *data,
 static void denali_ecc_hwctl(struct mtd_info *mtd, int mode)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
-	dev_err(denali->dev,
-			"denali_ecc_hwctl called unexpectedly\n");
+	dev_err(denali->dev, "denali_ecc_hwctl called unexpectedly\n");
 	BUG();
 }
 /* end NAND core entry points */
@@ -1420,8 +1407,8 @@ int denali_init(struct denali_nand_info *denali)
 		 * ONFI timing mode 1 and below.
 		 */
 		if (onfi_timing_mode < -1 || onfi_timing_mode > 1) {
-			printk(KERN_ERR "Intel CE4100 only supports"
-					" ONFI timing mode 1 or below\n");
+			dev_err(denali->dev,
+				"Intel CE4100 only supports ONFI timing mode 1 or below\n");
 			return -EINVAL;
 		}
 	}
@@ -1429,7 +1416,7 @@ int denali_init(struct denali_nand_info *denali)
 	/* Is 32-bit DMA supported? */
 	ret = dma_set_mask(denali->dev, DMA_BIT_MASK(32));
 	if (ret) {
-		printk(KERN_ERR "Spectra: no usable DMA configuration\n");
+		dev_err(denali->dev, "no usable DMA configuration\n");
 		return ret;
 	}
 	denali->buf.dma_buf = dma_map_single(denali->dev, denali->buf.buf,
@@ -1437,7 +1424,7 @@ int denali_init(struct denali_nand_info *denali)
 					     DMA_BIDIRECTIONAL);
 
 	if (dma_mapping_error(denali->dev, denali->buf.dma_buf)) {
-		dev_err(denali->dev, "Spectra: failed to map DMA buffer\n");
+		dev_err(denali->dev, "failed to map DMA buffer\n");
 		return -EIO;
 	}
 	denali->mtd.dev.parent = denali->dev;
@@ -1448,7 +1435,7 @@ int denali_init(struct denali_nand_info *denali)
 	 * initilization is finished*/
 	if (request_irq(denali->irq, denali_isr, IRQF_SHARED,
 			DENALI_NAND_NAME, denali)) {
-		printk(KERN_ERR "Spectra: Unable to allocate IRQ\n");
+		dev_err(denali->dev, "unable to allocate IRQ\n");
 		return -ENODEV;
 	}
 
@@ -1477,8 +1464,8 @@ int denali_init(struct denali_nand_info *denali)
 	 */
 	if (denali->mtd.writesize > NAND_MAX_PAGESIZE + NAND_MAX_OOBSIZE) {
 		ret = -ENODEV;
-		printk(KERN_ERR "Spectra: device size not supported by this "
-			"version of MTD.");
+		dev_err(denali->dev,
+			"device size not supported by this version of MTD.");
 		goto failed_req_irq;
 	}
 
@@ -1528,8 +1515,8 @@ int denali_init(struct denali_nand_info *denali)
 	} else if (denali->mtd.oobsize < (denali->bbtskipbytes +
 			ECC_8BITS * (denali->mtd.writesize /
 			ECC_SECTOR_SIZE))) {
-		printk(KERN_ERR "Your NAND chip OOB is not large enough to"
-				" contain 8bit ECC correction codes");
+		dev_err(&denali->mtd.dev,
+			"Your NAND chip OOB is not large enough to contain 8bit ECC correction codes");
 		goto failed_req_irq;
 	} else {
 		denali->nand.ecc.layout = &nand_8bit_oob;
@@ -1579,8 +1566,7 @@ int denali_init(struct denali_nand_info *denali)
 
 	ret = add_mtd_device(&denali->mtd);
 	if (ret) {
-		dev_err(denali->dev, "Spectra: Failed to register MTD: %d\n",
-				ret);
+		dev_err(denali->dev, "failed to register MTD: %d\n", ret);
 		goto failed_req_irq;
 	}
 	return 0;
diff --git a/drivers/mtd/nand/denali_pci.c b/drivers/mtd/nand/denali_pci.c
index 19b11af..1096d49 100644
--- a/drivers/mtd/nand/denali_pci.c
+++ b/drivers/mtd/nand/denali_pci.c
@@ -41,7 +41,7 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 
 	ret = pci_enable_device(dev);
 	if (ret) {
-		printk(KERN_ERR "Spectra: pci_enable_device failed.\n");
+		dev_err(&dev->dev, "pci_enable_device failed.\n");
 		goto failed_alloc_memery;
 	}
 
@@ -69,20 +69,20 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 
 	ret = pci_request_regions(dev, DENALI_NAND_NAME);
 	if (ret) {
-		printk(KERN_ERR "Spectra: Unable to request memory regions\n");
+		dev_err(&dev->dev, "unable to request memory regions\n");
 		goto failed_enable_dev;
 	}
 
 	denali->flash_reg = ioremap_nocache(csr_base, csr_len);
 	if (!denali->flash_reg) {
-		printk(KERN_ERR "Spectra: Unable to remap memory region\n");
+		dev_err(&dev->dev, "unable to remap memory region\n");
 		ret = -ENOMEM;
 		goto failed_req_regions;
 	}
 
 	denali->flash_mem = ioremap_nocache(mem_base, mem_len);
 	if (!denali->flash_mem) {
-		printk(KERN_ERR "Spectra: ioremap_nocache failed!");
+		dev_err(&dev->dev, "ioremap_nocache failed!");
 		ret = -ENOMEM;
 		goto failed_remap_reg;
 	}
@@ -132,8 +132,6 @@ static struct pci_driver denali_pci_driver = {
 
 static int __devinit denali_init_pci(void)
 {
-	printk(KERN_INFO "Spectra MTD driver built on %s @ %s\n",
-			__DATE__, __TIME__);
 	return pci_register_driver(&denali_pci_driver);
 }
 module_init(denali_init_pci);
-- 
1.7.4.4
