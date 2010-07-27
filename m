From: chuanxiao.dong@intel.com (Chuanxiao Dong)
Date: Tue, 27 Jul 2010 11:28:09 +0800
Subject: [PATCH 4/5] mtd: denali.c: fix all "line over 80 characters" warnings
Message-ID: <mailman.157.1281020919.27306.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Signed-off-by: Chuanxiao Dong <chuanxiao.dong@intel.com>
---
 drivers/mtd/nand/denali.c |  300 +++++++++++++++++++++++++++++----------------
 1 files changed, 192 insertions(+), 108 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 55a7a39..3ce11cc 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -36,8 +36,8 @@ MODULE_LICENSE("GPL");
 
 static int onfi_timing_mode = NAND_DEFAULT_TIMINGS;
 module_param(onfi_timing_mode, int, S_IRUGO);
-MODULE_PARM_DESC(onfi_timing_mode, "Overrides default ONFI setting. -1 indicates"
-					" use default timings");
+MODULE_PARM_DESC(onfi_timing_mode, "Overrides default ONFI setting."
+			" -1 indicates use default timings");
 
 #define DENALI_NAND_NAME    "denali-nand"
 
@@ -123,8 +123,10 @@ static int nand_debug_level = 0;
 
 /* forward declarations */
 static void clear_interrupts(struct denali_nand_info *denali);
-static uint32_t wait_for_irq(struct denali_nand_info *denali, uint32_t irq_mask);
-static void denali_irq_enable(struct denali_nand_info *denali, uint32_t int_mask);
+static uint32_t wait_for_irq(struct denali_nand_info *denali,
+							uint32_t irq_mask);
+static void denali_irq_enable(struct denali_nand_info *denali,
+							uint32_t int_mask);
 static uint32_t read_interrupt_status(struct denali_nand_info *denali);
 
 #define DEBUG_DENALI 0
@@ -138,16 +140,19 @@ static void denali_write32(uint32_t value, void *addr)
 	iowrite32(value, addr);
 
 #if DEBUG_DENALI
-	printk(KERN_INFO "wrote: 0x%x -> 0x%x\n", value, (uint32_t)((uint32_t)addr & 0x1fff));
+	printk(KERN_INFO "wrote: 0x%x -> 0x%x\n", value,
+			(uint32_t)((uint32_t)addr & 0x1fff));
 #endif
 }
 
-/* Certain operations for the denali NAND controller use an indexed mode to read/write
-   data. The operation is performed by writing the address value of the command to
-   the device memory followed by the data. This function abstracts this common
-   operation.
+/* Certain operations for the denali NAND controller use
+ * an indexed mode to read/write data. The operation is
+ * performed by writing the address value of the command
+ * to the device memory followed by the data. This function
+ * abstracts this common operation.
 */
-static void index_addr(struct denali_nand_info *denali, uint32_t address, uint32_t data)
+static void index_addr(struct denali_nand_info *denali,
+				uint32_t address, uint32_t data)
 {
 	denali_write32(address, denali->flash_mem);
 	denali_write32(data, denali->flash_mem + 0x10);
@@ -191,7 +196,8 @@ static void read_status(struct denali_nand_info *denali)
 	write_byte_to_buf(denali, ioread32(denali->flash_mem + 0x10));
 
 #if DEBUG_DENALI
-	printk(KERN_INFO "device reporting status value of 0x%2x\n", denali->buf.buf[0]);
+	printk(KERN_INFO "device reporting status value of 0x%2x\n",
+			denali->buf.buf[0]);
 #endif
 }
 
@@ -227,8 +233,10 @@ static uint16_t NAND_Flash_Reset(struct denali_nand_info *denali)
 		denali->flash_reg + intr_status_addresses[i]);
 
 	for (i = 0 ; i < LLD_MAX_FLASH_BANKS; i++) {
-		denali_write32(device_reset_banks[i], denali->flash_reg + DEVICE_RESET);
-		while (!(ioread32(denali->flash_reg + intr_status_addresses[i]) &
+		denali_write32(device_reset_banks[i],
+				denali->flash_reg + DEVICE_RESET);
+		while (!(ioread32(denali->flash_reg +
+						intr_status_addresses[i]) &
 			(reset_complete[i] | operation_timeout[i])))
 			;
 		if (ioread32(denali->flash_reg + intr_status_addresses[i]) &
@@ -244,11 +252,12 @@ static uint16_t NAND_Flash_Reset(struct denali_nand_info *denali)
 	return PASS;
 }
 
-/* this routine calculates the ONFI timing values for a given mode and programs
- * the clocking register accordingly. The mode is determined by the get_onfi_nand_para
-   routine.
+/* this routine calculates the ONFI timing values for a given mode and
+ * programs the clocking register accordingly. The mode is determined by
+ * the get_onfi_nand_para routine.
  */
-static void NAND_ONFi_Timing_Mode(struct denali_nand_info *denali, uint16_t mode)
+static void NAND_ONFi_Timing_Mode(struct denali_nand_info *denali,
+								uint16_t mode)
 {
 	uint16_t Trea[6] = {40, 30, 25, 20, 20, 16};
 	uint16_t Trp[6] = {50, 25, 17, 15, 12, 10};
@@ -354,10 +363,11 @@ static void set_ecc_config(struct denali_nand_info *denali)
 		denali_write32(8, denali->flash_reg + ECC_CORRECTION);
 #endif
 
-	if ((ioread32(denali->flash_reg + ECC_CORRECTION) & ECC_CORRECTION__VALUE)
-		== 1) {
+	if ((ioread32(denali->flash_reg + ECC_CORRECTION) &
+				ECC_CORRECTION__VALUE) == 1) {
 		denali->dev_info.wECCBytesPerSector = 4;
-		denali->dev_info.wECCBytesPerSector *= denali->dev_info.wDevicesConnected;
+		denali->dev_info.wECCBytesPerSector *=
+			denali->dev_info.wDevicesConnected;
 		denali->dev_info.wNumPageSpareFlag =
 			denali->dev_info.wPageSpareSize -
 			denali->dev_info.wPageDataSize /
@@ -373,8 +383,10 @@ static void set_ecc_config(struct denali_nand_info *denali)
 		else
 			denali->dev_info.wECCBytesPerSector += 1;
 
-		denali->dev_info.wECCBytesPerSector *= denali->dev_info.wDevicesConnected;
-		denali->dev_info.wNumPageSpareFlag = denali->dev_info.wPageSpareSize -
+		denali->dev_info.wECCBytesPerSector *=
+			denali->dev_info.wDevicesConnected;
+		denali->dev_info.wNumPageSpareFlag =
+			denali->dev_info.wPageSpareSize -
 			denali->dev_info.wPageDataSize /
 			(ECC_SECTOR_SIZE * denali->dev_info.wDevicesConnected) *
 			denali->dev_info.wECCBytesPerSector
@@ -392,13 +404,15 @@ static uint16_t get_onfi_nand_para(struct denali_nand_info *denali)
 	denali_write32(DEVICE_RESET__BANK0, denali->flash_reg + DEVICE_RESET);
 
 	while (!((ioread32(denali->flash_reg + INTR_STATUS0) &
-		INTR_STATUS0__RST_COMP) |
-		(ioread32(denali->flash_reg + INTR_STATUS0) &
-		INTR_STATUS0__TIME_OUT)))
+			INTR_STATUS0__RST_COMP) |
+			(ioread32(denali->flash_reg + INTR_STATUS0) &
+			INTR_STATUS0__TIME_OUT)))
 		;
 
-	if (ioread32(denali->flash_reg + INTR_STATUS0) & INTR_STATUS0__RST_COMP) {
-		denali_write32(DEVICE_RESET__BANK1, denali->flash_reg + DEVICE_RESET);
+	if (ioread32(denali->flash_reg + INTR_STATUS0) &
+			INTR_STATUS0__RST_COMP) {
+		denali_write32(DEVICE_RESET__BANK1,
+				denali->flash_reg + DEVICE_RESET);
 		while (!((ioread32(denali->flash_reg + INTR_STATUS1) &
 			INTR_STATUS1__RST_COMP) |
 			(ioread32(denali->flash_reg + INTR_STATUS1) &
@@ -419,10 +433,12 @@ static uint16_t get_onfi_nand_para(struct denali_nand_info *denali)
 				INTR_STATUS2__RST_COMP) {
 				denali_write32(DEVICE_RESET__BANK3,
 					denali->flash_reg + DEVICE_RESET);
-				while (!((ioread32(denali->flash_reg + INTR_STATUS3) &
-					INTR_STATUS3__RST_COMP) |
-					(ioread32(denali->flash_reg + INTR_STATUS3) &
-					INTR_STATUS3__TIME_OUT)))
+				while (!((ioread32(denali->flash_reg +
+						INTR_STATUS3) &
+						INTR_STATUS3__RST_COMP) |
+						(ioread32(denali->flash_reg +
+						INTR_STATUS3) &
+						INTR_STATUS3__TIME_OUT)))
 					;
 			} else {
 				printk(KERN_ERR "Getting a time out for bank 2!\n");
@@ -432,10 +448,14 @@ static uint16_t get_onfi_nand_para(struct denali_nand_info *denali)
 		}
 	}
 
-	denali_write32(INTR_STATUS0__TIME_OUT, denali->flash_reg + INTR_STATUS0);
-	denali_write32(INTR_STATUS1__TIME_OUT, denali->flash_reg + INTR_STATUS1);
-	denali_write32(INTR_STATUS2__TIME_OUT, denali->flash_reg + INTR_STATUS2);
-	denali_write32(INTR_STATUS3__TIME_OUT, denali->flash_reg + INTR_STATUS3);
+	denali_write32(INTR_STATUS0__TIME_OUT,
+			denali->flash_reg + INTR_STATUS0);
+	denali_write32(INTR_STATUS1__TIME_OUT,
+			denali->flash_reg + INTR_STATUS1);
+	denali_write32(INTR_STATUS2__TIME_OUT,
+			denali->flash_reg + INTR_STATUS2);
+	denali_write32(INTR_STATUS3__TIME_OUT,
+			denali->flash_reg + INTR_STATUS3);
 
 	denali->dev_info.wONFIDevFeatures =
 		ioread32(denali->flash_reg + ONFI_DEVICE_FEATURES);
@@ -448,8 +468,10 @@ static uint16_t get_onfi_nand_para(struct denali_nand_info *denali)
 
 	n_of_luns = ioread32(denali->flash_reg + ONFI_DEVICE_NO_OF_LUNS) &
 		ONFI_DEVICE_NO_OF_LUNS__NO_OF_LUNS;
-	blks_lun_l = ioread32(denali->flash_reg + ONFI_DEVICE_NO_OF_BLOCKS_PER_LUN_L);
-	blks_lun_h = ioread32(denali->flash_reg + ONFI_DEVICE_NO_OF_BLOCKS_PER_LUN_U);
+	blks_lun_l = ioread32(denali->flash_reg +
+				ONFI_DEVICE_NO_OF_BLOCKS_PER_LUN_L);
+	blks_lun_h = ioread32(denali->flash_reg +
+				ONFI_DEVICE_NO_OF_BLOCKS_PER_LUN_U);
 
 	blockperlun = (blks_lun_h << 16) | blks_lun_l;
 
@@ -460,7 +482,8 @@ static uint16_t get_onfi_nand_para(struct denali_nand_info *denali)
 		return FAIL;
 
 	for (i = 5; i > 0; i--) {
-		if (ioread32(denali->flash_reg + ONFI_TIMING_MODE) & (0x01 << i))
+		if (ioread32(denali->flash_reg + ONFI_TIMING_MODE) &
+			(0x01 << i))
 			break;
 	}
 
@@ -495,7 +518,8 @@ static void get_samsung_nand_para(struct denali_nand_info *denali)
 	index_addr(denali, (uint32_t)(MODE_11 | 0), 0x90);
 	index_addr(denali, (uint32_t)(MODE_11 | 1), 0);
 	for (i = 0; i < 5; i++)
-		index_addr_read_data(denali, (uint32_t)(MODE_11 | 2), &id_bytes[i]);
+		index_addr_read_data(denali, (uint32_t)(MODE_11 | 2),
+							&id_bytes[i]);
 
 	nand_dbg_print(NAND_DBG_DEBUG,
 		"ID bytes: 0x%x, 0x%x, 0x%x, 0x%x, 0x%x\n",
@@ -515,7 +539,8 @@ static void get_samsung_nand_para(struct denali_nand_info *denali)
 
 	no_of_planes = 1 << ((id_bytes[4] & 0x0c) >> 2);
 	plane_size  = (uint64_t)64 << ((id_bytes[4] & 0x70) >> 4);
-	blk_size = 64 << ((ioread32(denali->flash_reg + DEVICE_PARAM_1) & 0x30) >> 4);
+	blk_size = 64 << ((ioread32(denali->flash_reg + DEVICE_PARAM_1) &
+					0x30) >> 4);
 	capacity = (uint64_t)128 * plane_size * no_of_planes;
 
 	do_div(capacity, blk_size);
@@ -534,7 +559,8 @@ static void get_toshiba_nand_para(struct denali_nand_info *denali)
 		denali_write32(216, denali->flash_reg + DEVICE_SPARE_AREA_SIZE);
 		tmp = ioread32(denali->flash_reg + DEVICES_CONNECTED) *
 			ioread32(denali->flash_reg + DEVICE_SPARE_AREA_SIZE);
-		denali_write32(tmp, denali->flash_reg + LOGICAL_PAGE_SPARE_SIZE);
+		denali_write32(tmp,
+				denali->flash_reg + LOGICAL_PAGE_SPARE_SIZE);
 #if SUPPORT_15BITECC
 		denali_write32(15, denali->flash_reg + ECC_CORRECTION);
 #elif SUPPORT_8BITECC
@@ -573,10 +599,14 @@ static void get_hynix_nand_para(struct denali_nand_info *denali)
 		denali_write32(128, denali->flash_reg + PAGES_PER_BLOCK);
 		denali_write32(4096, denali->flash_reg + DEVICE_MAIN_AREA_SIZE);
 		denali_write32(224, denali->flash_reg + DEVICE_SPARE_AREA_SIZE);
-		main_size = 4096 * ioread32(denali->flash_reg + DEVICES_CONNECTED);
-		spare_size = 224 * ioread32(denali->flash_reg + DEVICES_CONNECTED);
-		denali_write32(main_size, denali->flash_reg + LOGICAL_PAGE_DATA_SIZE);
-		denali_write32(spare_size, denali->flash_reg + LOGICAL_PAGE_SPARE_SIZE);
+		main_size = 4096 *
+			ioread32(denali->flash_reg + DEVICES_CONNECTED);
+		spare_size = 224 *
+			ioread32(denali->flash_reg + DEVICES_CONNECTED);
+		denali_write32(main_size,
+				denali->flash_reg + LOGICAL_PAGE_DATA_SIZE);
+		denali_write32(spare_size,
+				denali->flash_reg + LOGICAL_PAGE_SPARE_SIZE);
 		denali_write32(0, denali->flash_reg + DEVICE_WIDTH);
 #if SUPPORT_15BITECC
 		denali_write32(15, denali->flash_reg + ECC_CORRECTION);
@@ -619,7 +649,8 @@ static void find_valid_banks(struct denali_nand_info *denali)
 	for (i = 0; i < LLD_MAX_FLASH_BANKS; i++) {
 		index_addr(denali, (uint32_t)(MODE_11 | (i << 24) | 0), 0x90);
 		index_addr(denali, (uint32_t)(MODE_11 | (i << 24) | 1), 0);
-		index_addr_read_data(denali, (uint32_t)(MODE_11 | (i << 24) | 2), &id[i]);
+		index_addr_read_data(denali,
+				(uint32_t)(MODE_11 | (i << 24) | 2), &id[i]);
 
 		nand_dbg_print(NAND_DBG_DEBUG,
 			"Return 1st ID for bank[%d]: %x\n", i, id[i]);
@@ -671,7 +702,8 @@ static void detect_partition_feature(struct denali_nand_info *denali)
 			    (ioread32(denali->flash_reg + MAX_BLK_ADDR_1) &
 			    MAX_BLK_ADDR_1__VALUE);
 
-			denali->dev_info.wTotalBlocks *= denali->total_used_banks;
+			denali->dev_info.wTotalBlocks *=
+				denali->total_used_banks;
 
 			if (denali->dev_info.wSpectraEndBlock >=
 			    denali->dev_info.wTotalBlocks) {
@@ -683,8 +715,10 @@ static void detect_partition_feature(struct denali_nand_info *denali)
 				denali->dev_info.wSpectraEndBlock -
 				denali->dev_info.wSpectraStartBlock + 1;
 		} else {
-			denali->dev_info.wTotalBlocks *= denali->total_used_banks;
-			denali->dev_info.wSpectraStartBlock = SPECTRA_START_BLOCK;
+			denali->dev_info.wTotalBlocks *=
+				denali->total_used_banks;
+			denali->dev_info.wSpectraStartBlock =
+				SPECTRA_START_BLOCK;
 			denali->dev_info.wSpectraEndBlock =
 				denali->dev_info.wTotalBlocks - 1;
 			denali->dev_info.wDataBlockNum =
@@ -694,7 +728,8 @@ static void detect_partition_feature(struct denali_nand_info *denali)
 	} else {
 		denali->dev_info.wTotalBlocks *= denali->total_used_banks;
 		denali->dev_info.wSpectraStartBlock = SPECTRA_START_BLOCK;
-		denali->dev_info.wSpectraEndBlock = denali->dev_info.wTotalBlocks - 1;
+		denali->dev_info.wSpectraEndBlock =
+			denali->dev_info.wTotalBlocks - 1;
 		denali->dev_info.wDataBlockNum =
 			denali->dev_info.wSpectraEndBlock -
 			denali->dev_info.wSpectraStartBlock + 1;
@@ -776,13 +811,19 @@ static uint16_t NAND_Read_Device_ID(struct denali_nand_info *denali)
 	nand_dbg_print(NAND_DBG_TRACE, "%s, Line %d, Function: %s\n",
 		       __FILE__, __LINE__, __func__);
 
-	denali->dev_info.wDeviceMaker = ioread32(denali->flash_reg + MANUFACTURER_ID);
-	denali->dev_info.wDeviceID = ioread32(denali->flash_reg + DEVICE_ID);
-	denali->dev_info.bDeviceParam0 = ioread32(denali->flash_reg + DEVICE_PARAM_0);
-	denali->dev_info.bDeviceParam1 = ioread32(denali->flash_reg + DEVICE_PARAM_1);
-	denali->dev_info.bDeviceParam2 = ioread32(denali->flash_reg + DEVICE_PARAM_2);
+	denali->dev_info.wDeviceMaker =
+		ioread32(denali->flash_reg + MANUFACTURER_ID);
+	denali->dev_info.wDeviceID =
+		ioread32(denali->flash_reg + DEVICE_ID);
+	denali->dev_info.bDeviceParam0 =
+		ioread32(denali->flash_reg + DEVICE_PARAM_0);
+	denali->dev_info.bDeviceParam1 =
+		ioread32(denali->flash_reg + DEVICE_PARAM_1);
+	denali->dev_info.bDeviceParam2 =
+		ioread32(denali->flash_reg + DEVICE_PARAM_2);
 
-	denali->dev_info.MLCDevice = ioread32(denali->flash_reg + DEVICE_PARAM_0) & 0x0c;
+	denali->dev_info.MLCDevice =
+		ioread32(denali->flash_reg + DEVICE_PARAM_0) & 0x0c;
 
 	if (ioread32(denali->flash_reg + ONFI_DEVICE_NO_OF_LUNS) &
 		ONFI_DEVICE_NO_OF_LUNS__ONFI_DEVICE) { /* ONFI 1.0 NAND */
@@ -831,7 +872,8 @@ static uint16_t NAND_Read_Device_ID(struct denali_nand_info *denali)
 	denali->dev_info.wPageSpareSize =
 		ioread32(denali->flash_reg + LOGICAL_PAGE_SPARE_SIZE);
 
-	denali->dev_info.wPagesPerBlock = ioread32(denali->flash_reg + PAGES_PER_BLOCK);
+	denali->dev_info.wPagesPerBlock =
+		ioread32(denali->flash_reg + PAGES_PER_BLOCK);
 
 	denali->dev_info.wPageSize =
 	    denali->dev_info.wPageDataSize + denali->dev_info.wPageSpareSize;
@@ -840,11 +882,13 @@ static uint16_t NAND_Read_Device_ID(struct denali_nand_info *denali)
 	denali->dev_info.wBlockDataSize =
 	    denali->dev_info.wPagesPerBlock * denali->dev_info.wPageDataSize;
 
-	denali->dev_info.wDeviceWidth = ioread32(denali->flash_reg + DEVICE_WIDTH);
+	denali->dev_info.wDeviceWidth =
+		ioread32(denali->flash_reg + DEVICE_WIDTH);
 	denali->dev_info.wDeviceType =
 		((ioread32(denali->flash_reg + DEVICE_WIDTH) > 0) ? 16 : 8);
 
-	denali->dev_info.wDevicesConnected = ioread32(denali->flash_reg + DEVICES_CONNECTED);
+	denali->dev_info.wDevicesConnected =
+		ioread32(denali->flash_reg + DEVICES_CONNECTED);
 
 	denali->dev_info.wSpareSkipBytes =
 		ioread32(denali->flash_reg + SPARE_AREA_SKIP_BYTES) *
@@ -933,7 +977,8 @@ static void denali_irq_cleanup(int irqnum, struct denali_nand_info *denali)
 	free_irq(irqnum, denali);
 }
 
-static void denali_irq_enable(struct denali_nand_info *denali, uint32_t int_mask)
+static void denali_irq_enable(struct denali_nand_info *denali,
+							uint32_t int_mask)
 {
 	denali_write32(int_mask, denali->flash_reg + INTR_EN0);
 	denali_write32(int_mask, denali->flash_reg + INTR_EN1);
@@ -950,7 +995,8 @@ static inline uint32_t denali_irq_detected(struct denali_nand_info *denali)
 }
 
 /* Interrupts are cleared by writing a 1 to the appropriate status bit */
-static inline void clear_interrupt(struct denali_nand_info *denali, uint32_t irq_mask)
+static inline void clear_interrupt(struct denali_nand_info *denali,
+							uint32_t irq_mask)
 {
 	uint32_t intr_status_reg = 0;
 
@@ -1013,9 +1059,11 @@ static irqreturn_t denali_isr(int irq, void *dev_id)
 	if (is_flash_bank_valid(denali->flash_bank)) {
 		/* check to see if controller generated
 		 * the interrupt, since this is a shared interrupt */
-		if ((irq_status = denali_irq_detected(denali)) != 0) {
+		irq_status = denali_irq_detected(denali);
+		if (irq_status != 0) {
 #if DEBUG_DENALI
-			denali->irq_debug_array[denali->idx++] = 0x10000000 | irq_status;
+			denali->irq_debug_array[denali->idx++] =
+				0x10000000 | irq_status;
 			denali->idx %= 32;
 
 			printk(KERN_INFO "IRQ status = 0x%04x\n", irq_status);
@@ -1048,12 +1096,14 @@ static uint32_t wait_for_irq(struct denali_nand_info *denali, uint32_t irq_mask)
 #if DEBUG_DENALI
 		printk(KERN_INFO "waiting for 0x%x\n", irq_mask);
 #endif
-		comp_res = wait_for_completion_timeout(&denali->complete, timeout);
+		comp_res =
+			wait_for_completion_timeout(&denali->complete, timeout);
 		spin_lock_irq(&denali->irq_lock);
 		intr_status = denali->irq_status;
 
 #if DEBUG_DENALI
-		denali->irq_debug_array[denali->idx++] = 0x20000000 | (irq_mask << 16) | intr_status;
+		denali->irq_debug_array[denali->idx++] =
+			0x20000000 | (irq_mask << 16) | intr_status;
 		denali->idx %= 32;
 #endif
 
@@ -1061,7 +1111,9 @@ static uint32_t wait_for_irq(struct denali_nand_info *denali, uint32_t irq_mask)
 			denali->irq_status &= ~irq_mask;
 			spin_unlock_irq(&denali->irq_lock);
 #if DEBUG_DENALI
-			if (retry) printk(KERN_INFO "status on retry = 0x%x\n", intr_status);
+			if (retry)
+				printk(KERN_INFO "status on retry = 0x%x\n",
+						intr_status);
 #endif
 			/* our interrupt was detected */
 			break;
@@ -1071,8 +1123,10 @@ static uint32_t wait_for_irq(struct denali_nand_info *denali, uint32_t irq_mask)
 			spin_unlock_irq(&denali->irq_lock);
 #if DEBUG_DENALI
 			print_irq_log(denali);
-			printk(KERN_INFO "received irq nobody cared: irq_status = 0x%x,"
-				" irq_mask = 0x%x, timeout = %ld\n", intr_status, irq_mask, comp_res);
+			printk(KERN_INFO "received irq nobody cared:"
+					" irq_status = 0x%x, irq_mask = 0x%x,"
+					" timeout = %ld\n", intr_status,
+					irq_mask, comp_res);
 #endif
 			retry = true;
 		}
@@ -1101,15 +1155,18 @@ static void setup_ecc_for_xfer(struct denali_nand_info *denali, bool ecc_en,
 
 	/* Enable spare area/ECC per user's request. */
 	denali_write32(ecc_en_flag, denali->flash_reg + ECC_ENABLE);
-	denali_write32(transfer_spare_flag, denali->flash_reg + TRANSFER_SPARE_REG);
+	denali_write32(transfer_spare_flag,
+			denali->flash_reg + TRANSFER_SPARE_REG);
 }
 
 /* sends a pipeline command operation to the controller. See the Denali NAND
    controller's user guide for more information (section 4.2.3.6).
  */
-static int denali_send_pipeline_cmd(struct denali_nand_info *denali, bool ecc_en,
-					bool transfer_spare, int access_type,
-					int op)
+static int denali_send_pipeline_cmd(struct denali_nand_info *denali,
+							bool ecc_en,
+							bool transfer_spare,
+							int access_type,
+							int op)
 {
 	int status = PASS;
 	uint32_t addr = 0x0, cmd = 0x0, page_count = 1, irq_status = 0,
@@ -1123,7 +1180,9 @@ static int denali_send_pipeline_cmd(struct denali_nand_info *denali, bool ecc_en
 
 #if DEBUG_DENALI
 	spin_lock_irq(&denali->irq_lock);
-	denali->irq_debug_array[denali->idx++] = 0x40000000 | ioread32(denali->flash_reg + ECC_ENABLE) | (access_type << 4);
+	denali->irq_debug_array[denali->idx++] =
+		0x40000000 | ioread32(denali->flash_reg + ECC_ENABLE) |
+		(access_type << 4);
 	denali->idx %= 32;
 	spin_unlock_irq(&denali->irq_lock);
 #endif
@@ -1157,16 +1216,19 @@ static int denali_send_pipeline_cmd(struct denali_nand_info *denali, bool ecc_en
 			cmd = MODE_01 | addr;
 			denali_write32(cmd, denali->flash_mem);
 		} else {
-			index_addr(denali, (uint32_t)cmd, 0x2000 | op | page_count);
+			index_addr(denali, (uint32_t)cmd,
+					0x2000 | op | page_count);
 
 			/* wait for command to be accepted
-			 * can always use status0 bit as the mask is identical for each
+			 * can always use status0 bit as the
+			 * mask is identical for each
 			 * bank. */
 			irq_status = wait_for_irq(denali, irq_mask);
 
 			if (irq_status == 0) {
 				printk(KERN_ERR "cmd, page, addr on timeout "
-					"(0x%x, 0x%x, 0x%x)\n", cmd, denali->page, addr);
+					"(0x%x, 0x%x, 0x%x)\n", cmd,
+					denali->page, addr);
 				status = FAIL;
 			} else {
 				cmd = MODE_01 | addr;
@@ -1178,8 +1240,9 @@ static int denali_send_pipeline_cmd(struct denali_nand_info *denali, bool ecc_en
 }
 
 /* helper function that simply writes a buffer to the flash */
-static int write_data_to_flash_mem(struct denali_nand_info *denali, const uint8_t *buf,
-					int len)
+static int write_data_to_flash_mem(struct denali_nand_info *denali,
+							const uint8_t *buf,
+							int len)
 {
 	uint32_t i = 0, *buf32;
 
@@ -1195,8 +1258,9 @@ static int write_data_to_flash_mem(struct denali_nand_info *denali, const uint8_
 }
 
 /* helper function that simply reads a buffer from the flash */
-static int read_data_from_flash_mem(struct denali_nand_info *denali, uint8_t *buf,
-					int len)
+static int read_data_from_flash_mem(struct denali_nand_info *denali,
+								uint8_t *buf,
+								int len)
 {
 	uint32_t i = 0, *buf32;
 
@@ -1234,7 +1298,8 @@ static int write_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
 
 #if DEBUG_DENALI
 		spin_lock_irq(&denali->irq_lock);
-		denali->irq_debug_array[denali->idx++] = 0x80000000 | mtd->oobsize;
+		denali->irq_debug_array[denali->idx++] =
+			0x80000000 | mtd->oobsize;
 		denali->idx %= 32;
 		spin_unlock_irq(&denali->irq_lock);
 #endif
@@ -1258,7 +1323,8 @@ static int write_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
 static void read_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
-	uint32_t irq_mask = INTR_STATUS0__LOAD_COMP, irq_status = 0, addr = 0x0, cmd = 0x0;
+	uint32_t irq_mask = INTR_STATUS0__LOAD_COMP,
+			 irq_status = 0, addr = 0x0, cmd = 0x0;
 
 	denali->page = page;
 
@@ -1275,7 +1341,8 @@ static void read_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
 		irq_status = wait_for_irq(denali, irq_mask);
 
 		if (irq_status == 0)
-			printk(KERN_ERR "page on OOB timeout %d\n", denali->page);
+			printk(KERN_ERR "page on OOB timeout %d\n",
+					denali->page);
 
 		/* We set the device back to MAIN_ACCESS here as I observed
 		 * instability with the controller if you do a block erase
@@ -1289,7 +1356,8 @@ static void read_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
 
 #if DEBUG_DENALI
 		spin_lock_irq(&denali->irq_lock);
-		denali->irq_debug_array[denali->idx++] = 0x60000000 | mtd->oobsize;
+		denali->irq_debug_array[denali->idx++] =
+			0x60000000 | mtd->oobsize;
 		denali->idx %= 32;
 		spin_unlock_irq(&denali->irq_lock);
 #endif
@@ -1358,15 +1426,17 @@ static bool handle_ecc(struct denali_nand_info *denali, uint8_t *buf,
 				}
 			} else {
 				/* if the error is not correctable, need to
-				 * look at the page to see if it is an erased page.
-				 * if so, then it's not a real ECC error */
+				 * look at the page to see if it is an erased
+				 * page. if so, then it's not a real ECC error
+				 * */
 				check_erased_page = true;
 			}
 
 #if DEBUG_DENALI
-			printk(KERN_INFO "Detected ECC error in page %d: err_addr = 0x%08x,"
-				" info to fix is 0x%08x\n", denali->page, err_address,
-				err_correction_info);
+			printk(KERN_INFO "Detected ECC error in page %d:"
+					" err_addr = 0x%08x, info to fix is"
+					" 0x%08x\n", denali->page, err_address,
+					err_correction_info);
 #endif
 		} while (!ECC_LAST_ERR(err_correction_info));
 	}
@@ -1451,10 +1521,11 @@ static void write_page(struct mtd_info *mtd, struct nand_chip *chip,
 	irq_status = wait_for_irq(denali, irq_mask);
 
 	if (irq_status == 0) {
-		printk(KERN_ERR "timeout on write_page (type = %d)\n", raw_xfer);
+		printk(KERN_ERR "timeout on write_page"
+				" (type = %d)\n", raw_xfer);
 		denali->status =
-			(irq_status & INTR_STATUS0__PROGRAM_FAIL) ? NAND_STATUS_FAIL :
-														PASS;
+			(irq_status & INTR_STATUS0__PROGRAM_FAIL) ?
+			NAND_STATUS_FAIL : PASS;
 	}
 
 	denali_enable_dma(denali, false);
@@ -1637,8 +1708,8 @@ static void denali_erase(struct mtd_info *mtd, int page)
 	irq_status = wait_for_irq(denali, INTR_STATUS0__ERASE_COMP |
 					INTR_STATUS0__ERASE_FAIL);
 
-	denali->status = (irq_status & INTR_STATUS0__ERASE_FAIL) ? NAND_STATUS_FAIL :
-								 PASS;
+	denali->status = (irq_status & INTR_STATUS0__ERASE_FAIL) ?
+						NAND_STATUS_FAIL : PASS;
 }
 
 static void denali_cmdfunc(struct mtd_info *mtd, unsigned int cmd, int col,
@@ -1661,11 +1732,16 @@ static void denali_cmdfunc(struct mtd_info *mtd, unsigned int cmd, int col,
 				/* write manufacturer information into nand
 				   buffer for NAND subsystem to fetch.
 				   */
-				write_byte_to_buf(denali, denali->dev_info.wDeviceMaker);
-				write_byte_to_buf(denali, denali->dev_info.wDeviceID);
-				write_byte_to_buf(denali, denali->dev_info.bDeviceParam0);
-				write_byte_to_buf(denali, denali->dev_info.bDeviceParam1);
-				write_byte_to_buf(denali, denali->dev_info.bDeviceParam2);
+				write_byte_to_buf(denali,
+						denali->dev_info.wDeviceMaker);
+				write_byte_to_buf(denali,
+						denali->dev_info.wDeviceID);
+				write_byte_to_buf(denali,
+						denali->dev_info.bDeviceParam0);
+				write_byte_to_buf(denali,
+						denali->dev_info.bDeviceParam1);
+				write_byte_to_buf(denali,
+						denali->dev_info.bDeviceParam2);
 			} else {
 				int i;
 				for (i = 0; i < 5; i++)
@@ -1683,7 +1759,8 @@ static void denali_cmdfunc(struct mtd_info *mtd, unsigned int cmd, int col,
 			/* TODO: Read OOB data */
 			break;
 		default:
-			printk(KERN_ERR ": unsupported command received 0x%x\n", cmd);
+			printk(KERN_ERR ": unsupported command"
+					" received 0x%x\n", cmd);
 			break;
 	}
 }
@@ -1718,7 +1795,8 @@ static void denali_hw_init(struct denali_nand_info *denali)
 	denali_irq_init(denali);
 	NAND_Flash_Reset(denali);
 	denali_write32(0x0F, denali->flash_reg + RB_PIN_ENABLED);
-	denali_write32(CHIP_EN_DONT_CARE__FLAG, denali->flash_reg + CHIP_ENABLE_DONT_CARE);
+	denali_write32(CHIP_EN_DONT_CARE__FLAG,
+			denali->flash_reg + CHIP_ENABLE_DONT_CARE);
 
 	denali_write32(0x0, denali->flash_reg + SPARE_AREA_SKIP_BYTES);
 	denali_write32(0xffff, denali->flash_reg + SPARE_AREA_MARKER);
@@ -1824,8 +1902,8 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 		 * ONFI timing mode 1 and below.
 		 */
 		if (onfi_timing_mode < -1 || onfi_timing_mode > 1) {
-			printk(KERN_ERR "Intel CE4100 only supports ONFI timing mode 1 "
-				"or below\n");
+			printk(KERN_ERR "Intel CE4100 only supports"
+					" ONFI timing mode 1 or below\n");
 			ret = -EINVAL;
 			goto failed_enable;
 		}
@@ -1844,7 +1922,9 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 			mem_base = csr_base + csr_len;
 			mem_len = csr_len;
 			nand_dbg_print(NAND_DBG_WARN,
-				       "Spectra: No second BAR for PCI device; assuming %08Lx\n",
+				       "Spectra: No second"
+					   " BAR for PCI device;"
+					   " assuming %08Lx\n",
 				       (uint64_t)csr_base);
 		}
 	}
@@ -1856,8 +1936,10 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 		printk(KERN_ERR "Spectra: no usable DMA configuration\n");
 		goto failed_enable;
 	}
-	denali->buf.dma_buf = pci_map_single(dev, denali->buf.buf, DENALI_BUF_SIZE,
-					 PCI_DMA_BIDIRECTIONAL);
+	denali->buf.dma_buf =
+		pci_map_single(dev, denali->buf.buf,
+						DENALI_BUF_SIZE,
+						PCI_DMA_BIDIRECTIONAL);
 
 	if (pci_dma_mapping_error(dev, denali->buf.dma_buf)) {
 		printk(KERN_ERR "Spectra: failed to map DMA buffer\n");
@@ -1997,7 +2079,8 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 
 	ret = add_mtd_device(&denali->mtd);
 	if (ret) {
-		printk(KERN_ERR "Spectra: Failed to register MTD device: %d\n", ret);
+		printk(KERN_ERR "Spectra: Failed to register"
+				" MTD device: %d\n", ret);
 		goto failed_nand;
 	}
 	return 0;
@@ -2051,7 +2134,8 @@ static struct pci_driver denali_pci_driver = {
 
 static int __devinit denali_init(void)
 {
-	printk(KERN_INFO "Spectra MTD driver built on %s @ %s\n", __DATE__, __TIME__);
+	printk(KERN_INFO "Spectra MTD driver built on %s @ %s\n",
+			__DATE__, __TIME__);
 	return pci_register_driver(&denali_pci_driver);
 }
 
-- 
1.6.6.1
