Received: from mail-px0-f177.google.com ([209.85.212.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oh22D-00076e-GO
	for linux-mtd@lists.infradead.org; Thu, 05 Aug 2010 15:07:07 +0000
Received: by pxi13 with SMTP id 13so2835232pxi.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 05 Aug 2010 08:07:04 -0700 (PDT)
Date: Thu, 5 Aug 2010 23:07:13 +0800
From: Chuanxiao <chuanxiao.dong@gmail.com>
To: linux-mtd@lists.infradead.org, dedekind1@gmail.com,
	david.woodhouse@intel.com
Subject: [PATCH v2 2/5]nand/denali fix all open brace check patch errors
Message-ID: <20100805150713.GA6650@infernal>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: chuanxiao.dong@intel.com, yunpeng.gao@intel.com, hang.yuan@intel.com
Reply-To: Chuanxiao <chuanxiao.dong@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From c5628da88709aad3ddbd213ec40b05da1f6c7aa0 Mon Sep 17 00:00:00 2001
From: Chuanxiao Dong <chuanxiao.dong@intel.com>
Date: Tue, 27 Jul 2010 10:41:53 +0800
Subject: [PATCH 2/5] mtd: denali.c: fixed all open brace { check-patch errors

Signed-off-by: Chuanxiao Dong <chuanxiao.dong@intel.com>
---
 drivers/mtd/nand/denali.c |  164 +++++++++++++--------------------------------
 1 files changed, 48 insertions(+), 116 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index ca02838..f850a65 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -211,9 +211,7 @@ static void reset_bank(struct denali_nand_info *denali)
 	irq_status = wait_for_irq(denali, irq_mask);
 
 	if (irq_status & operation_timeout[denali->flash_bank])
-	{
 		printk(KERN_ERR "reset bank failed.\n");
-	}
 }
 
 /* Reset the flash controller */
@@ -637,14 +635,12 @@ static void find_valid_banks(struct denali_nand_info *denali)
 		}
 	}
 
-	if (denali->platform == INTEL_CE4100)
-	{
+	if (denali->platform == INTEL_CE4100) {
 		/* Platform limitations of the CE4100 device limit
 		 * users to a single chip solution for NAND.
 		 * Multichip support is not enabled.
 		 */
-		if (denali->total_used_banks != 1)
-		{
+		if (denali->total_used_banks != 1) {
 			printk(KERN_ERR "Sorry, Intel CE4100 only supports "
 					"a single NAND device.\n");
 			BUG();
@@ -888,9 +884,7 @@ static uint16_t NAND_Read_Device_ID(struct denali_nand_info *denali)
 	 * with a specific ONFI mode, we apply those changes here.
 	 */
 	if (onfi_timing_mode != NAND_DEFAULT_TIMINGS)
-	{
 		NAND_ONFi_Timing_Mode(denali, onfi_timing_mode);
-	}
 
 	return status;
 }
@@ -997,9 +991,7 @@ static void print_irq_log(struct denali_nand_info *denali)
 
 	printk("ISR debug log index = %X\n", denali->idx);
 	for (i = 0; i < 32; i++)
-	{
 		printk("%08X: %08X\n", i, denali->irq_debug_array[i]);
-	}
 }
 #endif
 
@@ -1018,12 +1010,10 @@ static irqreturn_t denali_isr(int irq, void *dev_id)
 	/* check to see if a valid NAND chip has
 	 * been selected.
 	 */
-	if (is_flash_bank_valid(denali->flash_bank))
-	{
+	if (is_flash_bank_valid(denali->flash_bank)) {
 		/* check to see if controller generated
 		 * the interrupt, since this is a shared interrupt */
-		if ((irq_status = denali_irq_detected(denali)) != 0)
-		{
+		if ((irq_status = denali_irq_detected(denali)) != 0) {
 #if DEBUG_DENALI
 			denali->irq_debug_array[denali->idx++] = 0x10000000 | irq_status;
 			denali->idx %= 32;
@@ -1054,8 +1044,7 @@ static uint32_t wait_for_irq(struct denali_nand_info *denali, uint32_t irq_mask)
 	bool retry = false;
 	unsigned long timeout = msecs_to_jiffies(1000);
 
-	do
-	{
+	do {
 #if DEBUG_DENALI
 		printk("waiting for 0x%x\n", irq_mask);
 #endif
@@ -1068,8 +1057,7 @@ static uint32_t wait_for_irq(struct denali_nand_info *denali, uint32_t irq_mask)
 		denali->idx %= 32;
 #endif
 
-		if (intr_status & irq_mask)
-		{
+		if (intr_status & irq_mask) {
 			denali->irq_status &= ~irq_mask;
 			spin_unlock_irq(&denali->irq_lock);
 #if DEBUG_DENALI
@@ -1077,9 +1065,7 @@ static uint32_t wait_for_irq(struct denali_nand_info *denali, uint32_t irq_mask)
 #endif
 			/* our interrupt was detected */
 			break;
-		}
-		else
-		{
+		} else {
 			/* these are not the interrupts you are looking for -
 			 * need to wait again */
 			spin_unlock_irq(&denali->irq_lock);
@@ -1092,8 +1078,7 @@ static uint32_t wait_for_irq(struct denali_nand_info *denali, uint32_t irq_mask)
 		}
 	} while (comp_res != 0);
 
-	if (comp_res == 0)
-	{
+	if (comp_res == 0) {
 		/* timeout */
 		printk(KERN_ERR "timeout occurred, status = 0x%x, mask = 0x%x\n",
 				intr_status, irq_mask);
@@ -1149,22 +1134,17 @@ static int denali_send_pipeline_cmd(struct denali_nand_info *denali, bool ecc_en
 
 	addr = BANK(denali->flash_bank) | denali->page;
 
-	if (op == DENALI_WRITE && access_type != SPARE_ACCESS)
-	{
+	if (op == DENALI_WRITE && access_type != SPARE_ACCESS) {
 		cmd = MODE_01 | addr;
 		denali_write32(cmd, denali->flash_mem);
-	}
-	else if (op == DENALI_WRITE && access_type == SPARE_ACCESS)
-	{
+	} else if (op == DENALI_WRITE && access_type == SPARE_ACCESS) {
 		/* read spare area */
 		cmd = MODE_10 | addr;
 		index_addr(denali, (uint32_t)cmd, access_type);
 
 		cmd = MODE_01 | addr;
 		denali_write32(cmd, denali->flash_mem);
-	}
-	else if (op == DENALI_READ)
-	{
+	} else if (op == DENALI_READ) {
 		/* setup page read request for access type */
 		cmd = MODE_10 | addr;
 		index_addr(denali, (uint32_t)cmd, access_type);
@@ -1173,13 +1153,10 @@ static int denali_send_pipeline_cmd(struct denali_nand_info *denali, bool ecc_en
 		   use the pipeline commands in Spare area only mode. So we
 		   don't.
 		 */
-		if (access_type == SPARE_ACCESS)
-		{
+		if (access_type == SPARE_ACCESS) {
 			cmd = MODE_01 | addr;
 			denali_write32(cmd, denali->flash_mem);
-		}
-		else
-		{
+		} else {
 			index_addr(denali, (uint32_t)cmd, 0x2000 | op | page_count);
 
 			/* wait for command to be accepted
@@ -1187,14 +1164,11 @@ static int denali_send_pipeline_cmd(struct denali_nand_info *denali, bool ecc_en
 			 * bank. */
 			irq_status = wait_for_irq(denali, irq_mask);
 
-			if (irq_status == 0)
-			{
+			if (irq_status == 0) {
 				printk(KERN_ERR "cmd, page, addr on timeout "
 					"(0x%x, 0x%x, 0x%x)\n", cmd, denali->page, addr);
 				status = FAIL;
-			}
-			else
-			{
+			} else {
 				cmd = MODE_01 | addr;
 				denali_write32(cmd, denali->flash_mem);
 			}
@@ -1216,9 +1190,7 @@ static int write_data_to_flash_mem(struct denali_nand_info *denali, const uint8_
 	/* write the data to the flash memory */
 	buf32 = (uint32_t *)buf;
 	for (i = 0; i < len / 4; i++)
-	{
 		denali_write32(*buf32++, denali->flash_mem + 0x10);
-	}
 	return i*4; /* intent is to return the number of bytes read */
 }
 
@@ -1241,9 +1213,7 @@ static int read_data_from_flash_mem(struct denali_nand_info *denali, uint8_t *bu
 	/* transfer the data from the flash */
 	buf32 = (uint32_t *)buf;
 	for (i = 0; i < len / 4; i++)
-	{
 		*buf32++ = ioread32(denali->flash_mem + 0x10);
-	}
 	return i*4; /* intent is to return the number of bytes read */
 }
 
@@ -1259,8 +1229,7 @@ static int write_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
 	denali->page = page;
 
 	if (denali_send_pipeline_cmd(denali, false, false, SPARE_ACCESS,
-							DENALI_WRITE) == PASS)
-	{
+							DENALI_WRITE) == PASS) {
 		write_data_to_flash_mem(denali, buf, mtd->oobsize);
 
 #if DEBUG_DENALI
@@ -1274,14 +1243,11 @@ static int write_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
 		/* wait for operation to complete */
 		irq_status = wait_for_irq(denali, irq_mask);
 
-		if (irq_status == 0)
-		{
+		if (irq_status == 0) {
 			printk(KERN_ERR "OOB write failed\n");
 			status = -EIO;
 		}
-	}
-	else
-	{
+	} else {
 		printk(KERN_ERR "unable to send pipeline command\n");
 		status = -EIO;
 	}
@@ -1300,8 +1266,7 @@ static void read_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
 	printk("read_oob %d\n", page);
 #endif
 	if (denali_send_pipeline_cmd(denali, false, true, SPARE_ACCESS,
-							DENALI_READ) == PASS)
-	{
+							DENALI_READ) == PASS) {
 		read_data_from_flash_mem(denali, buf, mtd->oobsize);
 
 		/* wait for command to be accepted
@@ -1310,9 +1275,7 @@ static void read_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
 		irq_status = wait_for_irq(denali, irq_mask);
 
 		if (irq_status == 0)
-		{
 			printk(KERN_ERR "page on OOB timeout %d\n", denali->page);
-		}
 
 		/* We set the device back to MAIN_ACCESS here as I observed
 		 * instability with the controller if you do a block erase
@@ -1340,12 +1303,8 @@ bool is_erased(uint8_t *buf, int len)
 {
 	int i = 0;
 	for (i = 0; i < len; i++)
-	{
 		if (buf[i] != 0xFF)
-		{
 			return false;
-		}
-	}
 	return true;
 }
 #define ECC_SECTOR_SIZE 512
@@ -1362,15 +1321,13 @@ static bool handle_ecc(struct denali_nand_info *denali, uint8_t *buf,
 {
 	bool check_erased_page = false;
 
-	if (irq_status & INTR_STATUS0__ECC_ERR)
-	{
+	if (irq_status & INTR_STATUS0__ECC_ERR) {
 		/* read the ECC errors. we'll ignore them for now */
 		uint32_t err_address = 0, err_correction_info = 0;
 		uint32_t err_byte = 0, err_sector = 0, err_device = 0;
 		uint32_t err_correction_value = 0;
 
-		do
-		{
+		do {
 			err_address = ioread32(denali->flash_reg +
 						ECC_ERROR_ADDRESS);
 			err_sector = ECC_SECTOR(err_address);
@@ -1383,29 +1340,23 @@ static bool handle_ecc(struct denali_nand_info *denali, uint8_t *buf,
 				ECC_CORRECTION_VALUE(err_correction_info);
 			err_device = ECC_ERR_DEVICE(err_correction_info);
 
-			if (ECC_ERROR_CORRECTABLE(err_correction_info))
-			{
+			if (ECC_ERROR_CORRECTABLE(err_correction_info)) {
 				/* offset in our buffer is computed as:
 				   sector number * sector size + offset in
 				   sector
 				 */
 				int offset = err_sector * ECC_SECTOR_SIZE +
 								err_byte;
-				if (offset < denali->mtd.writesize)
-				{
+				if (offset < denali->mtd.writesize) {
 					/* correct the ECC error */
 					buf[offset] ^= err_correction_value;
 					denali->mtd.ecc_stats.corrected++;
-				}
-				else
-				{
+				} else {
 					/* bummer, couldn't correct the error */
 					printk(KERN_ERR "ECC offset invalid\n");
 					denali->mtd.ecc_stats.failed++;
 				}
-			}
-			else
-			{
+			} else {
 				/* if the error is not correctable, need to
 				 * look at the page to see if it is an erased page.
 				 * if so, then it's not a real ECC error */
@@ -1482,8 +1433,7 @@ static void write_page(struct mtd_info *mtd, struct nand_chip *chip,
 	/* copy buffer into DMA buffer */
 	memcpy(denali->buf.buf, buf, mtd->writesize);
 
-	if (raw_xfer)
-	{
+	if (raw_xfer) {
 		/* transfer the data to the spare area */
 		memcpy(denali->buf.buf + mtd->writesize,
 			chip->oob_poi,
@@ -1500,8 +1450,7 @@ static void write_page(struct mtd_info *mtd, struct nand_chip *chip,
 	/* wait for operation to complete */
 	irq_status = wait_for_irq(denali, irq_mask);
 
-	if (irq_status == 0)
-	{
+	if (irq_status == 0) {
 		printk(KERN_ERR "timeout on write_page (type = %d)\n", raw_xfer);
 		denali->status =
 			(irq_status & INTR_STATUS0__PROGRAM_FAIL) ? NAND_STATUS_FAIL :
@@ -1584,21 +1533,15 @@ static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 	check_erased_page = handle_ecc(denali, buf, chip->oob_poi, irq_status);
 	denali_enable_dma(denali, false);
 
-	if (check_erased_page)
-	{
+	if (check_erased_page) {
 		read_oob_data(&denali->mtd, chip->oob_poi, denali->page);
 
 		/* check ECC failures that may have occurred on erased pages */
-		if (check_erased_page)
-		{
+		if (check_erased_page) {
 			if (!is_erased(buf, denali->mtd.writesize))
-			{
 				denali->mtd.ecc_stats.failed++;
-			}
 			if (!is_erased(buf, denali->mtd.oobsize))
-			{
 				denali->mtd.ecc_stats.failed++;
-			}
 		}
 	}
 	return 0;
@@ -1643,9 +1586,7 @@ static uint8_t denali_read_byte(struct mtd_info *mtd)
 	uint8_t result = 0xff;
 
 	if (denali->buf.head < denali->buf.tail)
-	{
 		result = denali->buf.buf[denali->buf.head++];
-	}
 
 #if DEBUG_DENALI
 	printk("read byte -> 0x%02x\n", result);
@@ -1708,8 +1649,7 @@ static void denali_cmdfunc(struct mtd_info *mtd, unsigned int cmd, int col,
 #if DEBUG_DENALI
 	printk("cmdfunc: 0x%x %d %d\n", cmd, col, page);
 #endif
-	switch (cmd)
-	{
+	switch (cmd) {
 		case NAND_CMD_PAGEPROG:
 			break;
 		case NAND_CMD_STATUS:
@@ -1717,8 +1657,7 @@ static void denali_cmdfunc(struct mtd_info *mtd, unsigned int cmd, int col,
 			break;
 		case NAND_CMD_READID:
 			reset_buf(denali);
-			if (denali->flash_bank < denali->total_used_banks)
-			{
+			if (denali->flash_bank < denali->total_used_banks) {
 				/* write manufacturer information into nand
 				   buffer for NAND subsystem to fetch.
 				   */
@@ -1727,9 +1666,7 @@ static void denali_cmdfunc(struct mtd_info *mtd, unsigned int cmd, int col,
 				write_byte_to_buf(denali, denali->dev_info.bDeviceParam0);
 				write_byte_to_buf(denali, denali->dev_info.bDeviceParam1);
 				write_byte_to_buf(denali, denali->dev_info.bDeviceParam2);
-			}
-			else
-			{
+			} else {
 				int i;
 				for (i = 0; i < 5; i++)
 					write_byte_to_buf(denali, 0xff);
@@ -1796,20 +1733,24 @@ static void denali_hw_init(struct denali_nand_info *denali)
 static struct nand_ecclayout nand_oob_slc = {
 	.eccbytes = 4,
 	.eccpos = { 0, 1, 2, 3 }, /* not used */
-	.oobfree = {{
+	.oobfree = {
+		{
 			.offset = ECC_BYTES_SLC,
 			.length = 64 - ECC_BYTES_SLC
-		   }}
+		}
+	}
 };
 
 #define ECC_BYTES_MLC   14 * (2048 / ECC_SECTOR_SIZE)
 static struct nand_ecclayout nand_oob_mlc_14bit = {
 	.eccbytes = 14,
 	.eccpos = { 0, 1, 2, 3, 5, 6, 7, 8, 9, 10, 11, 12, 13 }, /* not used */
-	.oobfree = {{
+	.oobfree = {
+		{
 			.offset = ECC_BYTES_MLC,
 			.length = 64 - ECC_BYTES_MLC
-		   }}
+		}
+	}
 };
 
 static uint8_t bbt_pattern[] = {'B', 'b', 't', '0' };
@@ -1882,8 +1823,7 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 		/* Due to a silicon limitation, we can only support
 		 * ONFI timing mode 1 and below.
 		 */
-		if (onfi_timing_mode < -1 || onfi_timing_mode > 1)
-		{
+		if (onfi_timing_mode < -1 || onfi_timing_mode > 1) {
 			printk("Intel CE4100 only supports ONFI timing mode 1 "
 				"or below\n");
 			ret = -EINVAL;
@@ -1912,16 +1852,14 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	/* Is 32-bit DMA supported? */
 	ret = pci_set_dma_mask(dev, DMA_BIT_MASK(32));
 
-	if (ret)
-	{
+	if (ret) {
 		printk(KERN_ERR "Spectra: no usable DMA configuration\n");
 		goto failed_enable;
 	}
 	denali->buf.dma_buf = pci_map_single(dev, denali->buf.buf, DENALI_BUF_SIZE,
 					 PCI_DMA_BIDIRECTIONAL);
 
-	if (pci_dma_mapping_error(dev, denali->buf.dma_buf))
-	{
+	if (pci_dma_mapping_error(dev, denali->buf.dma_buf)) {
 		printk(KERN_ERR "Spectra: failed to map DMA buffer\n");
 		goto failed_enable;
 	}
@@ -1978,8 +1916,7 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	/* MTD supported page sizes vary by kernel. We validate our
 	 * kernel supports the device here.
 	 */
-	if (denali->dev_info.wPageSize > NAND_MAX_PAGESIZE + NAND_MAX_OOBSIZE)
-	{
+	if (denali->dev_info.wPageSize > NAND_MAX_PAGESIZE + NAND_MAX_OOBSIZE) {
 		ret = -ENODEV;
 		printk(KERN_ERR "Spectra: device size not supported by this "
 			"version of MTD.");
@@ -2011,8 +1948,7 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	/* scan for NAND devices attached to the controller
 	 * this is the first stage in a two step process to register
 	 * with the nand subsystem */
-	if (nand_scan_ident(&denali->mtd, LLD_MAX_FLASH_BANKS, NULL))
-	{
+	if (nand_scan_ident(&denali->mtd, LLD_MAX_FLASH_BANKS, NULL)) {
 		ret = -ENXIO;
 		goto failed_nand;
 	}
@@ -2029,13 +1965,10 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	denali->nand.options |= NAND_USE_FLASH_BBT | NAND_SKIP_BBTSCAN;
 	denali->nand.ecc.mode = NAND_ECC_HW_SYNDROME;
 
-	if (denali->dev_info.MLCDevice)
-	{
+	if (denali->dev_info.MLCDevice) {
 		denali->nand.ecc.layout = &nand_oob_mlc_14bit;
 		denali->nand.ecc.bytes = ECC_BYTES_MLC;
-	}
-	else /* SLC */
-	{
+	} else {/* SLC */
 		denali->nand.ecc.layout = &nand_oob_slc;
 		denali->nand.ecc.bytes = ECC_BYTES_SLC;
 	}
@@ -2057,8 +1990,7 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	denali->nand.ecc.write_oob = denali_write_oob;
 	denali->nand.erase_cmd = denali_erase;
 
-	if (nand_scan_tail(&denali->mtd))
-	{
+	if (nand_scan_tail(&denali->mtd)) {
 		ret = -ENXIO;
 		goto failed_nand;
 	}
-- 
1.6.6.1
