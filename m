Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QSRgX-0002ZT-IQ
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2011 10:33:00 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so1814016wyb.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 03 Jun 2011 03:32:57 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCHv2 1/6] nand/denali: convert to dev_() printk helpers
Date: Fri,  3 Jun 2011 11:32:44 +0100
Message-Id: <1307097169-11744-2-git-send-email-jamie@jamieiles.com>
In-Reply-To: <1307097169-11744-1-git-send-email-jamie@jamieiles.com>
References: <1307097169-11744-1-git-send-email-jamie@jamieiles.com>
Cc: Jamie Iles <jamie@jamieiles.com>, Artem Bityutskiy <dedekind1@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Chuanxiao Dong <chuanxiao.dong@intel.com>
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
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 drivers/mtd/nand/denali.c |  133 ++++++++++++++++++++-------------------------
 1 files changed, 60 insertions(+), 73 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index d527621..a4b4a29 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -175,8 +175,7 @@ static uint16_t denali_nand_reset(struct denali_nand_info *denali)
 {
 	uint32_t i;
 
-	dev_dbg(denali->dev, "%s, Line %d, Function: %s\n",
-		       __FILE__, __LINE__, __func__);
+	dev_dbg(denali->dev, "resetting\n");
 
 	for (i = 0 ; i < denali->max_banks; i++)
 		iowrite32(INTR_STATUS__RST_COMP | INTR_STATUS__TIME_OUT,
@@ -191,7 +190,8 @@ static uint16_t denali_nand_reset(struct denali_nand_info *denali)
 		if (ioread32(denali->flash_reg + INTR_STATUS(i)) &
 			INTR_STATUS__TIME_OUT)
 			dev_dbg(denali->dev,
-			"NAND Reset operation timed out on bank %d\n", i);
+				"NAND Reset operation timed out on bank %d\n",
+				i);
 	}
 
 	for (i = 0; i < denali->max_banks; i++)
@@ -228,8 +228,7 @@ static void nand_onfi_timing_set(struct denali_nand_info *denali,
 	uint16_t acc_clks;
 	uint16_t addr_2_data, re_2_we, re_2_re, we_2_re, cs_cnt;
 
-	dev_dbg(denali->dev, "%s, Line %d, Function: %s\n",
-		       __FILE__, __LINE__, __func__);
+	dev_dbg(denali->dev, "init timing\n");
 
 	en_lo = CEIL_DIV(Trp[mode], CLK_X);
 	en_hi = CEIL_DIV(Treh[mode], CLK_X);
@@ -265,8 +264,8 @@ static void nand_onfi_timing_set(struct denali_nand_info *denali,
 		acc_clks++;
 
 	if ((data_invalid - acc_clks * CLK_X) < 2)
-		dev_warn(denali->dev, "%s, Line %d: Warning!\n",
-			__FILE__, __LINE__);
+		dev_warn(denali->dev, "%s, Line %d: Warning!\n", __FILE__,
+			 __LINE__);
 
 	addr_2_data = CEIL_DIV(Tadl[mode], CLK_X);
 	re_2_we = CEIL_DIV(Trhw[mode], CLK_X);
@@ -394,9 +393,8 @@ static void get_hynix_nand_para(struct denali_nand_info *denali,
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
 
@@ -415,8 +413,8 @@ static void find_valid_banks(struct denali_nand_info *denali)
 		index_addr_read_data(denali,
 				(uint32_t)(MODE_11 | (i << 24) | 2), &id[i]);
 
-		dev_dbg(denali->dev,
-			"Return 1st ID for bank[%d]: %x\n", i, id[i]);
+		dev_dbg(denali->dev, "Return 1st ID for bank[%d]: %x\n", i,
+			id[i]);
 
 		if (i == 0) {
 			if (!(id[i] & 0x0ff))
@@ -436,13 +434,12 @@ static void find_valid_banks(struct denali_nand_info *denali)
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
@@ -486,9 +483,7 @@ static uint16_t denali_nand_timing_set(struct denali_nand_info *denali)
 	uint32_t id_bytes[5], addr;
 	uint8_t i, maf_id, device_id;
 
-	dev_dbg(denali->dev,
-			"%s, Line %d, Function: %s\n",
-			__FILE__, __LINE__, __func__);
+	dev_dbg(denali->dev, "set the timing\n");
 
 	/* Use read id method to get device ID and other
 	 * params. For some NAND chips, controller can't
@@ -516,18 +511,17 @@ static uint16_t denali_nand_timing_set(struct denali_nand_info *denali)
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
 
@@ -545,8 +539,7 @@ static uint16_t denali_nand_timing_set(struct denali_nand_info *denali)
 static void denali_set_intr_modes(struct denali_nand_info *denali,
 					uint16_t INT_ENABLE)
 {
-	dev_dbg(denali->dev, "%s, Line %d, Function: %s\n",
-		       __FILE__, __LINE__, __func__);
+	dev_dbg(denali->dev, "set interrupt modes\n");
 
 	if (INT_ENABLE)
 		iowrite32(1, denali->flash_reg + GLOBAL_INT_ENABLE);
@@ -669,7 +662,6 @@ static irqreturn_t denali_isr(int irq, void *dev_id)
 	spin_unlock(&denali->irq_lock);
 	return result;
 }
-#define BANK(x) ((x) << 24)
 
 static uint32_t wait_for_irq(struct denali_nand_info *denali, uint32_t irq_mask)
 {
@@ -699,8 +691,9 @@ static uint32_t wait_for_irq(struct denali_nand_info *denali, uint32_t irq_mask)
 
 	if (comp_res == 0) {
 		/* timeout */
-		printk(KERN_ERR "timeout occurred, status = 0x%x, mask = 0x%x\n",
-				intr_status, irq_mask);
+		dev_err(&denali->mtd.dev,
+			"timeout occurred, status = 0x%x, mask = 0x%x\n",
+			intr_status, irq_mask);
 
 		intr_status = 0;
 	}
@@ -785,9 +778,8 @@ static int denali_send_pipeline_cmd(struct denali_nand_info *denali,
 
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
@@ -889,7 +881,7 @@ static void read_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
 
 		if (irq_status == 0)
 			dev_err(denali->dev, "page on OOB timeout %d\n",
-					denali->page);
+				denali->page);
 
 		/* We set the device back to MAIN_ACCESS here as I observed
 		 * instability with the controller if you do a block erase
@@ -1065,9 +1057,8 @@ static void write_page(struct mtd_info *mtd, struct nand_chip *chip,
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
@@ -1132,9 +1123,9 @@ static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
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
 
@@ -1182,9 +1173,8 @@ static int denali_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 	uint32_t irq_mask = INTR_STATUS__DMA_CMD_COMP;
 
 	if (page != denali->page) {
-		dev_err(denali->dev, "IN %s: page %d is not"
-				" equal to denali->page %d, investigate!!",
-				__func__, page, denali->page);
+		dev_err(denali->dev, "IN %s: page %d is not equal to denali->page %d, investigate!!",
+			__func__, page, denali->page);
 		BUG();
 	}
 
@@ -1300,8 +1290,8 @@ static void denali_cmdfunc(struct mtd_info *mtd, unsigned int cmd, int col,
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
@@ -1311,8 +1301,7 @@ static int denali_ecc_calculate(struct mtd_info *mtd, const uint8_t *data,
 				uint8_t *ecc_code)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
-	dev_err(denali->dev,
-			"denali_ecc_calculate called unexpectedly\n");
+	dev_err(denali->dev, "denali_ecc_calculate called unexpectedly\n");
 	BUG();
 	return -EIO;
 }
@@ -1321,8 +1310,7 @@ static int denali_ecc_correct(struct mtd_info *mtd, uint8_t *data,
 				uint8_t *read_ecc, uint8_t *calc_ecc)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
-	dev_err(denali->dev,
-			"denali_ecc_correct called unexpectedly\n");
+	dev_err(denali->dev, "denali_ecc_correct called unexpectedly\n");
 	BUG();
 	return -EIO;
 }
@@ -1330,8 +1318,7 @@ static int denali_ecc_correct(struct mtd_info *mtd, uint8_t *data,
 static void denali_ecc_hwctl(struct mtd_info *mtd, int mode)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
-	dev_err(denali->dev,
-			"denali_ecc_hwctl called unexpectedly\n");
+	dev_err(denali->dev, "denali_ecc_hwctl called unexpectedly\n");
 	BUG();
 }
 /* end NAND core entry points */
@@ -1432,9 +1419,11 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	if (!denali)
 		return -ENOMEM;
 
+	denali->dev = &dev->dev;
+
 	ret = pci_enable_device(dev);
 	if (ret) {
-		printk(KERN_ERR "Spectra: pci_enable_device failed.\n");
+		dev_err(denali->dev, "Spectra: pci_enable_device failed.\n");
 		goto failed_alloc_memery;
 	}
 
@@ -1443,8 +1432,7 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 		 * ONFI timing mode 1 and below.
 		 */
 		if (onfi_timing_mode < -1 || onfi_timing_mode > 1) {
-			printk(KERN_ERR "Intel CE4100 only supports"
-					" ONFI timing mode 1 or below\n");
+			dev_err(denali->dev, "Intel CE4100 only supports ONFI timing mode 1 or below\n");
 			ret = -EINVAL;
 			goto failed_enable_dev;
 		}
@@ -1468,38 +1456,37 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	/* Is 32-bit DMA supported? */
 	ret = dma_set_mask(&dev->dev, DMA_BIT_MASK(32));
 	if (ret) {
-		printk(KERN_ERR "Spectra: no usable DMA configuration\n");
+		dev_err(denali->dev, "Spectra: no usable DMA configuration\n");
 		goto failed_enable_dev;
 	}
 	denali->buf.dma_buf = dma_map_single(&dev->dev, denali->buf.buf,
 					     DENALI_BUF_SIZE,
 					     DMA_BIDIRECTIONAL);
 
-	if (dma_mapping_error(&dev->dev, denali->buf.dma_buf)) {
+	if (dma_mapping_error(denali->dev, denali->buf.dma_buf)) {
 		dev_err(&dev->dev, "Spectra: failed to map DMA buffer\n");
 		goto failed_enable_dev;
 	}
 
 	pci_set_master(dev);
-	denali->dev = &dev->dev;
 	denali->mtd.dev.parent = &dev->dev;
 
 	ret = pci_request_regions(dev, DENALI_NAND_NAME);
 	if (ret) {
-		printk(KERN_ERR "Spectra: Unable to request memory regions\n");
+		dev_err(denali->dev, "Spectra: Unable to request memory regions\n");
 		goto failed_dma_map;
 	}
 
 	denali->flash_reg = ioremap_nocache(csr_base, csr_len);
 	if (!denali->flash_reg) {
-		printk(KERN_ERR "Spectra: Unable to remap memory region\n");
+		dev_err(denali->dev, "Spectra: Unable to remap memory region\n");
 		ret = -ENOMEM;
 		goto failed_req_regions;
 	}
 
 	denali->flash_mem = ioremap_nocache(mem_base, mem_len);
 	if (!denali->flash_mem) {
-		printk(KERN_ERR "Spectra: ioremap_nocache failed!");
+		dev_err(denali->dev, "Spectra: ioremap_nocache failed!");
 		ret = -ENOMEM;
 		goto failed_remap_reg;
 	}
@@ -1511,7 +1498,7 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	 * initilization is finished*/
 	if (request_irq(dev->irq, denali_isr, IRQF_SHARED,
 			DENALI_NAND_NAME, denali)) {
-		printk(KERN_ERR "Spectra: Unable to allocate IRQ\n");
+		dev_err(denali->dev, "Spectra: Unable to allocate IRQ\n");
 		ret = -ENODEV;
 		goto failed_remap_mem;
 	}
@@ -1544,8 +1531,8 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	 */
 	if (denali->mtd.writesize > NAND_MAX_PAGESIZE + NAND_MAX_OOBSIZE) {
 		ret = -ENODEV;
-		printk(KERN_ERR "Spectra: device size not supported by this "
-			"version of MTD.");
+		dev_err(denali->dev,
+			"device size not supported by this version of MTD.");
 		goto failed_req_irq;
 	}
 
@@ -1595,8 +1582,8 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
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
@@ -1646,7 +1633,7 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 
 	ret = mtd_device_register(&denali->mtd, NULL, 0);
 	if (ret) {
-		dev_err(&dev->dev, "Spectra: Failed to register MTD: %d\n",
+		dev_err(denali->dev, "Spectra: Failed to register MTD: %d\n",
 				ret);
 		goto failed_req_irq;
 	}
@@ -1701,7 +1688,7 @@ static struct pci_driver denali_pci_driver = {
 
 static int __devinit denali_init(void)
 {
-	printk(KERN_INFO "Spectra MTD driver\n");
+	pr_info(KERN_INFO "Spectra MTD driver\n");
 	return pci_register_driver(&denali_pci_driver);
 }
 
-- 
1.7.4.1
