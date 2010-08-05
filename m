Received: from mail-pw0-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oh21A-0006iE-AO
	for linux-mtd@lists.infradead.org; Thu, 05 Aug 2010 15:06:05 +0000
Received: by pwi9 with SMTP id 9so119833pwi.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 05 Aug 2010 08:05:58 -0700 (PDT)
Date: Thu, 5 Aug 2010 23:06:04 +0800
From: Chuanxiao <chuanxiao.dong@gmail.com>
To: linux-mtd@lists.infradead.org, dedekind1@gmail.com,
	david.woodhouse@intel.com
Subject: [PATCH V2 1/5]nand/denali Clean up all white spaces in code indent
Message-ID: <20100805150604.GA6589@infernal>
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

Hi,
I have changed the outlook mail cliet to be linux mutt client and use my
personal gmail to submit patches.
Here are 5 new patches to fix nand/denali check patch errors. The other
4 patches will be sent out after this mail.
Thanks for your review.

>From d125ad3f57bbf517131dccad6b5933edf8c2632a Mon Sep 17 00:00:00 2001
From: Chuanxiao Dong <chuanxiao.dong@intel.com>
Date: Tue, 3 Aug 2010 15:54:48 +0800
Subject: [PATCH 1/5] mtd: denali.c: clean up all whitespaces in code indent

Signed-off-by: Chuanxiao Dong <chuanxiao.dong@intel.com>
---
 drivers/mtd/nand/denali.c |  337 ++++++++++++++++++++++-----------------------
 1 files changed, 168 insertions(+), 169 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index ca03428..ca02838 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -29,7 +29,7 @@
 
 MODULE_LICENSE("GPL");
 
-/* We define a module parameter that allows the user to override 
+/* We define a module parameter that allows the user to override
  * the hardware and decide what timing mode should be used.
  */
 #define NAND_DEFAULT_TIMINGS	-1
@@ -54,13 +54,13 @@ MODULE_PARM_DESC(onfi_timing_mode, "Overrides default ONFI setting. -1 indicates
 			INTR_STATUS0__RST_COMP | \
 			INTR_STATUS0__ERASE_COMP)
 
-/* indicates whether or not the internal value for the flash bank is 
+/* indicates whether or not the internal value for the flash bank is
    valid or not */
-#define CHIP_SELECT_INVALID 	-1
+#define CHIP_SELECT_INVALID	-1
 
 #define SUPPORT_8BITECC		1
 
-/* This macro divides two integers and rounds fractional values up 
+/* This macro divides two integers and rounds fractional values up
  * to the nearest integer value. */
 #define CEIL_DIV(X, Y) (((X)%(Y)) ? ((X)/(Y)+1) : ((X)/(Y)))
 
@@ -83,7 +83,7 @@ MODULE_PARM_DESC(onfi_timing_mode, "Overrides default ONFI setting. -1 indicates
 #define ADDR_CYCLE	1
 #define STATUS_CYCLE	2
 
-/* this is a helper macro that allows us to 
+/* this is a helper macro that allows us to
  * format the bank into the proper bits for the controller */
 #define BANK(x) ((x) << 24)
 
@@ -95,28 +95,28 @@ static const struct pci_device_id denali_pci_ids[] = {
 };
 
 
-/* these are static lookup tables that give us easy access to 
-   registers in the NAND controller.  
+/* these are static lookup tables that give us easy access to
+   registers in the NAND controller.
  */
-static const uint32_t intr_status_addresses[4] = {INTR_STATUS0, 
-						  INTR_STATUS1, 
-					     	  INTR_STATUS2, 
+static const uint32_t intr_status_addresses[4] = {INTR_STATUS0,
+						  INTR_STATUS1,
+						  INTR_STATUS2,
 						  INTR_STATUS3};
 
 static const uint32_t device_reset_banks[4] = {DEVICE_RESET__BANK0,
-                                               DEVICE_RESET__BANK1,
-                                               DEVICE_RESET__BANK2,
-                                               DEVICE_RESET__BANK3};
+							DEVICE_RESET__BANK1,
+							DEVICE_RESET__BANK2,
+							DEVICE_RESET__BANK3};
 
 static const uint32_t operation_timeout[4] = {INTR_STATUS0__TIME_OUT,
-                        		      INTR_STATUS1__TIME_OUT,
-		                              INTR_STATUS2__TIME_OUT,
-		                              INTR_STATUS3__TIME_OUT};
+							INTR_STATUS1__TIME_OUT,
+							INTR_STATUS2__TIME_OUT,
+							INTR_STATUS3__TIME_OUT};
 
 static const uint32_t reset_complete[4] = {INTR_STATUS0__RST_COMP,
-                		           INTR_STATUS1__RST_COMP,
-		                           INTR_STATUS2__RST_COMP,
-		                           INTR_STATUS3__RST_COMP};
+							INTR_STATUS1__RST_COMP,
+							INTR_STATUS2__RST_COMP,
+							INTR_STATUS3__RST_COMP};
 
 /* specifies the debug level of the driver */
 static int nand_debug_level = 0;
@@ -131,21 +131,21 @@ static uint32_t read_interrupt_status(struct denali_nand_info *denali);
 
 /* This is a wrapper for writing to the denali registers.
  * this allows us to create debug information so we can
- * observe how the driver is programming the device. 
+ * observe how the driver is programming the device.
  * it uses standard linux convention for (val, addr) */
 static void denali_write32(uint32_t value, void *addr)
 {
-	iowrite32(value, addr);	
+	iowrite32(value, addr);
 
 #if DEBUG_DENALI
 	printk(KERN_ERR "wrote: 0x%x -> 0x%x\n", value, (uint32_t)((uint32_t)addr & 0x1fff));
 #endif
-} 
+}
 
-/* Certain operations for the denali NAND controller use an indexed mode to read/write 
-   data. The operation is performed by writing the address value of the command to 
-   the device memory followed by the data. This function abstracts this common 
-   operation. 
+/* Certain operations for the denali NAND controller use an indexed mode to read/write
+   data. The operation is performed by writing the address value of the command to
+   the device memory followed by the data. This function abstracts this common
+   operation.
 */
 static void index_addr(struct denali_nand_info *denali, uint32_t address, uint32_t data)
 {
@@ -161,7 +161,7 @@ static void index_addr_read_data(struct denali_nand_info *denali,
 	*pdata = ioread32(denali->flash_mem + 0x10);
 }
 
-/* We need to buffer some data for some of the NAND core routines. 
+/* We need to buffer some data for some of the NAND core routines.
  * The operations manage buffering that data. */
 static void reset_buf(struct denali_nand_info *denali)
 {
@@ -183,7 +183,7 @@ static void read_status(struct denali_nand_info *denali)
 	reset_buf(denali);
 
 	/* initiate a device status read */
-	cmd = MODE_11 | BANK(denali->flash_bank); 
+	cmd = MODE_11 | BANK(denali->flash_bank);
 	index_addr(denali, cmd | COMMAND_CYCLE, 0x70);
 	denali_write32(cmd | STATUS_CYCLE, denali->flash_mem);
 
@@ -199,7 +199,7 @@ static void read_status(struct denali_nand_info *denali)
 static void reset_bank(struct denali_nand_info *denali)
 {
 	uint32_t irq_status = 0;
-	uint32_t irq_mask = reset_complete[denali->flash_bank] | 
+	uint32_t irq_mask = reset_complete[denali->flash_bank] |
 			    operation_timeout[denali->flash_bank];
 	int bank = 0;
 
@@ -209,7 +209,7 @@ static void reset_bank(struct denali_nand_info *denali)
 	denali_write32(bank, denali->flash_reg + DEVICE_RESET);
 
 	irq_status = wait_for_irq(denali, irq_mask);
-	
+
 	if (irq_status & operation_timeout[denali->flash_bank])
 	{
 		printk(KERN_ERR "reset bank failed.\n");
@@ -610,7 +610,7 @@ static void get_hynix_nand_para(struct denali_nand_info *denali)
 }
 
 /* determines how many NAND chips are connected to the controller. Note for
-   Intel CE4100 devices we don't support more than one device. 
+   Intel CE4100 devices we don't support more than one device.
  */
 static void find_valid_banks(struct denali_nand_info *denali)
 {
@@ -641,8 +641,8 @@ static void find_valid_banks(struct denali_nand_info *denali)
 	{
 		/* Platform limitations of the CE4100 device limit
 		 * users to a single chip solution for NAND.
-                 * Multichip support is not enabled. 
-		 */ 
+		 * Multichip support is not enabled.
+		 */
 		if (denali->total_used_banks != 1)
 		{
 			printk(KERN_ERR "Sorry, Intel CE4100 only supports "
@@ -885,7 +885,7 @@ static uint16_t NAND_Read_Device_ID(struct denali_nand_info *denali)
 	dump_device_info(denali);
 
 	/* If the user specified to override the default timings
-	 * with a specific ONFI mode, we apply those changes here. 
+	 * with a specific ONFI mode, we apply those changes here.
 	 */
 	if (onfi_timing_mode != NAND_DEFAULT_TIMINGS)
 	{
@@ -912,7 +912,7 @@ static void NAND_LLD_Enable_Disable_Interrupts(struct denali_nand_info *denali,
  */
 static inline bool is_flash_bank_valid(int flash_bank)
 {
-	return (flash_bank >= 0 && flash_bank < 4); 
+	return (flash_bank >= 0 && flash_bank < 4);
 }
 
 static void denali_irq_init(struct denali_nand_info *denali)
@@ -948,7 +948,7 @@ static void denali_irq_enable(struct denali_nand_info *denali, uint32_t int_mask
 }
 
 /* This function only returns when an interrupt that this driver cares about
- * occurs. This is to reduce the overhead of servicing interrupts 
+ * occurs. This is to reduce the overhead of servicing interrupts
  */
 static inline uint32_t denali_irq_detected(struct denali_nand_info *denali)
 {
@@ -1003,9 +1003,9 @@ static void print_irq_log(struct denali_nand_info *denali)
 }
 #endif
 
-/* This is the interrupt service routine. It handles all interrupts 
- * sent to this device. Note that on CE4100, this is a shared 
- * interrupt. 
+/* This is the interrupt service routine. It handles all interrupts
+ * sent to this device. Note that on CE4100, this is a shared
+ * interrupt.
  */
 static irqreturn_t denali_isr(int irq, void *dev_id)
 {
@@ -1015,12 +1015,12 @@ static irqreturn_t denali_isr(int irq, void *dev_id)
 
 	spin_lock(&denali->irq_lock);
 
-	/* check to see if a valid NAND chip has 
-         * been selected. 
+	/* check to see if a valid NAND chip has
+	 * been selected.
 	 */
 	if (is_flash_bank_valid(denali->flash_bank))
 	{
-		/* check to see if controller generated 
+		/* check to see if controller generated
 		 * the interrupt, since this is a shared interrupt */
 		if ((irq_status = denali_irq_detected(denali)) != 0)
 		{
@@ -1078,10 +1078,10 @@ static uint32_t wait_for_irq(struct denali_nand_info *denali, uint32_t irq_mask)
 			/* our interrupt was detected */
 			break;
 		}
-		else 
+		else
 		{
-			/* these are not the interrupts you are looking for - 
-		           need to wait again */
+			/* these are not the interrupts you are looking for -
+			 * need to wait again */
 			spin_unlock_irq(&denali->irq_lock);
 #if DEBUG_DENALI
 			print_irq_log(denali);
@@ -1095,20 +1095,20 @@ static uint32_t wait_for_irq(struct denali_nand_info *denali, uint32_t irq_mask)
 	if (comp_res == 0)
 	{
 		/* timeout */
-		printk(KERN_ERR "timeout occurred, status = 0x%x, mask = 0x%x\n", 
-	       			intr_status, irq_mask);
+		printk(KERN_ERR "timeout occurred, status = 0x%x, mask = 0x%x\n",
+				intr_status, irq_mask);
 
 		intr_status = 0;
 	}
 	return intr_status;
 }
 
-/* This helper function setups the registers for ECC and whether or not 
+/* This helper function setups the registers for ECC and whether or not
    the spare area will be transfered. */
-static void setup_ecc_for_xfer(struct denali_nand_info *denali, bool ecc_en, 
+static void setup_ecc_for_xfer(struct denali_nand_info *denali, bool ecc_en,
 				bool transfer_spare)
 {
-	int ecc_en_flag = 0, transfer_spare_flag = 0; 
+	int ecc_en_flag = 0, transfer_spare_flag = 0;
 
 	/* set ECC, transfer spare bits if needed */
 	ecc_en_flag = ecc_en ? ECC_ENABLE__FLAG : 0;
@@ -1119,15 +1119,15 @@ static void setup_ecc_for_xfer(struct denali_nand_info *denali, bool ecc_en,
 	denali_write32(transfer_spare_flag, denali->flash_reg + TRANSFER_SPARE_REG);
 }
 
-/* sends a pipeline command operation to the controller. See the Denali NAND 
-   controller's user guide for more information (section 4.2.3.6). 
+/* sends a pipeline command operation to the controller. See the Denali NAND
+   controller's user guide for more information (section 4.2.3.6).
  */
-static int denali_send_pipeline_cmd(struct denali_nand_info *denali, bool ecc_en, 
-					bool transfer_spare, int access_type, 
+static int denali_send_pipeline_cmd(struct denali_nand_info *denali, bool ecc_en,
+					bool transfer_spare, int access_type,
 					int op)
 {
 	int status = PASS;
-	uint32_t addr = 0x0, cmd = 0x0, page_count = 1, irq_status = 0, 
+	uint32_t addr = 0x0, cmd = 0x0, page_count = 1, irq_status = 0,
 		 irq_mask = 0;
 
 	if (op == DENALI_READ) irq_mask = INTR_STATUS0__LOAD_COMP;
@@ -1145,32 +1145,32 @@ static int denali_send_pipeline_cmd(struct denali_nand_info *denali, bool ecc_en
 
 
 	/* clear interrupts */
-	clear_interrupts(denali);	
+	clear_interrupts(denali);
 
 	addr = BANK(denali->flash_bank) | denali->page;
 
 	if (op == DENALI_WRITE && access_type != SPARE_ACCESS)
 	{
-		cmd = MODE_01 | addr; 
+		cmd = MODE_01 | addr;
 		denali_write32(cmd, denali->flash_mem);
 	}
 	else if (op == DENALI_WRITE && access_type == SPARE_ACCESS)
 	{
 		/* read spare area */
-		cmd = MODE_10 | addr; 
+		cmd = MODE_10 | addr;
 		index_addr(denali, (uint32_t)cmd, access_type);
 
-		cmd = MODE_01 | addr; 
+		cmd = MODE_01 | addr;
 		denali_write32(cmd, denali->flash_mem);
 	}
 	else if (op == DENALI_READ)
 	{
 		/* setup page read request for access type */
-		cmd = MODE_10 | addr; 
+		cmd = MODE_10 | addr;
 		index_addr(denali, (uint32_t)cmd, access_type);
 
 		/* page 33 of the NAND controller spec indicates we should not
-		   use the pipeline commands in Spare area only mode. So we 
+		   use the pipeline commands in Spare area only mode. So we
 		   don't.
 		 */
 		if (access_type == SPARE_ACCESS)
@@ -1181,8 +1181,8 @@ static int denali_send_pipeline_cmd(struct denali_nand_info *denali, bool ecc_en
 		else
 		{
 			index_addr(denali, (uint32_t)cmd, 0x2000 | op | page_count);
-	
-			/* wait for command to be accepted  
+
+			/* wait for command to be accepted
 			 * can always use status0 bit as the mask is identical for each
 			 * bank. */
 			irq_status = wait_for_irq(denali, irq_mask);
@@ -1204,13 +1204,13 @@ static int denali_send_pipeline_cmd(struct denali_nand_info *denali, bool ecc_en
 }
 
 /* helper function that simply writes a buffer to the flash */
-static int write_data_to_flash_mem(struct denali_nand_info *denali, const uint8_t *buf, 
-					int len) 
+static int write_data_to_flash_mem(struct denali_nand_info *denali, const uint8_t *buf,
+					int len)
 {
 	uint32_t i = 0, *buf32;
 
-	/* verify that the len is a multiple of 4. see comment in 
-	 * read_data_from_flash_mem() */	
+	/* verify that the len is a multiple of 4. see comment in
+	 * read_data_from_flash_mem() */
 	BUG_ON((len % 4) != 0);
 
 	/* write the data to the flash memory */
@@ -1219,21 +1219,20 @@ static int write_data_to_flash_mem(struct denali_nand_info *denali, const uint8_
 	{
 		denali_write32(*buf32++, denali->flash_mem + 0x10);
 	}
-	return i*4; /* intent is to return the number of bytes read */ 
+	return i*4; /* intent is to return the number of bytes read */
 }
 
 /* helper function that simply reads a buffer from the flash */
-static int read_data_from_flash_mem(struct denali_nand_info *denali, uint8_t *buf, 
+static int read_data_from_flash_mem(struct denali_nand_info *denali, uint8_t *buf,
 					int len)
 {
 	uint32_t i = 0, *buf32;
 
 	/* we assume that len will be a multiple of 4, if not
 	 * it would be nice to know about it ASAP rather than
-	 * have random failures... 
-         *	
-	 * This assumption is based on the fact that this 
-	 * function is designed to be used to read flash pages, 
+	 * have random failures...
+	 * This assumption is based on the fact that this
+	 * function is designed to be used to read flash pages,
 	 * which are typically multiples of 4...
 	 */
 
@@ -1245,7 +1244,7 @@ static int read_data_from_flash_mem(struct denali_nand_info *denali, uint8_t *bu
 	{
 		*buf32++ = ioread32(denali->flash_mem + 0x10);
 	}
-	return i*4; /* intent is to return the number of bytes read */ 
+	return i*4; /* intent is to return the number of bytes read */
 }
 
 /* writes OOB data to the device */
@@ -1253,14 +1252,14 @@ static int write_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
 	uint32_t irq_status = 0;
-	uint32_t irq_mask = INTR_STATUS0__PROGRAM_COMP | 
+	uint32_t irq_mask = INTR_STATUS0__PROGRAM_COMP |
 						INTR_STATUS0__PROGRAM_FAIL;
 	int status = 0;
 
 	denali->page = page;
 
-	if (denali_send_pipeline_cmd(denali, false, false, SPARE_ACCESS, 
-							DENALI_WRITE) == PASS) 
+	if (denali_send_pipeline_cmd(denali, false, false, SPARE_ACCESS,
+							DENALI_WRITE) == PASS)
 	{
 		write_data_to_flash_mem(denali, buf, mtd->oobsize);
 
@@ -1271,7 +1270,7 @@ static int write_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
 		spin_unlock_irq(&denali->irq_lock);
 #endif
 
-	
+
 		/* wait for operation to complete */
 		irq_status = wait_for_irq(denali, irq_mask);
 
@@ -1281,10 +1280,10 @@ static int write_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
 			status = -EIO;
 		}
 	}
-	else 
-	{ 	
+	else
+	{
 		printk(KERN_ERR "unable to send pipeline command\n");
-		status = -EIO; 
+		status = -EIO;
 	}
 	return status;
 }
@@ -1300,12 +1299,12 @@ static void read_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
 #if DEBUG_DENALI
 	printk("read_oob %d\n", page);
 #endif
-	if (denali_send_pipeline_cmd(denali, false, true, SPARE_ACCESS, 
-							DENALI_READ) == PASS) 
+	if (denali_send_pipeline_cmd(denali, false, true, SPARE_ACCESS,
+							DENALI_READ) == PASS)
 	{
-		read_data_from_flash_mem(denali, buf, mtd->oobsize);	
+		read_data_from_flash_mem(denali, buf, mtd->oobsize);
 
-		/* wait for command to be accepted  
+		/* wait for command to be accepted
 		 * can always use status0 bit as the mask is identical for each
 		 * bank. */
 		irq_status = wait_for_irq(denali, irq_mask);
@@ -1319,10 +1318,10 @@ static void read_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
 		 * instability with the controller if you do a block erase
 		 * and the last transaction was a SPARE_ACCESS. Block erase
 		 * is reliable (according to the MTD test infrastructure)
-		 * if you are in MAIN_ACCESS. 
+		 * if you are in MAIN_ACCESS.
 		 */
 		addr = BANK(denali->flash_bank) | denali->page;
-		cmd = MODE_10 | addr; 
+		cmd = MODE_10 | addr;
 		index_addr(denali, (uint32_t)cmd, MAIN_ACCESS);
 
 #if DEBUG_DENALI
@@ -1334,14 +1333,14 @@ static void read_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
 	}
 }
 
-/* this function examines buffers to see if they contain data that 
+/* this function examines buffers to see if they contain data that
  * indicate that the buffer is part of an erased region of flash.
  */
 bool is_erased(uint8_t *buf, int len)
 {
 	int i = 0;
 	for (i = 0; i < len; i++)
-	{	
+	{
 		if (buf[i] != 0xFF)
 		{
 			return false;
@@ -1358,7 +1357,7 @@ bool is_erased(uint8_t *buf, int len)
 #define ECC_ERR_DEVICE(x)	((x) & ERR_CORRECTION_INFO__DEVICE_NR >> 8)
 #define ECC_LAST_ERR(x)		((x) & ERR_CORRECTION_INFO__LAST_ERR_INFO)
 
-static bool handle_ecc(struct denali_nand_info *denali, uint8_t *buf, 
+static bool handle_ecc(struct denali_nand_info *denali, uint8_t *buf,
 			uint8_t *oobbuf, uint32_t irq_status)
 {
 	bool check_erased_page = false;
@@ -1370,27 +1369,27 @@ static bool handle_ecc(struct denali_nand_info *denali, uint8_t *buf,
 		uint32_t err_byte = 0, err_sector = 0, err_device = 0;
 		uint32_t err_correction_value = 0;
 
-		do 
+		do
 		{
-			err_address = ioread32(denali->flash_reg + 
+			err_address = ioread32(denali->flash_reg +
 						ECC_ERROR_ADDRESS);
 			err_sector = ECC_SECTOR(err_address);
 			err_byte = ECC_BYTE(err_address);
 
 
-			err_correction_info = ioread32(denali->flash_reg + 
+			err_correction_info = ioread32(denali->flash_reg +
 						ERR_CORRECTION_INFO);
-			err_correction_value = 
+			err_correction_value =
 				ECC_CORRECTION_VALUE(err_correction_info);
 			err_device = ECC_ERR_DEVICE(err_correction_info);
 
 			if (ECC_ERROR_CORRECTABLE(err_correction_info))
 			{
 				/* offset in our buffer is computed as:
-				   sector number * sector size + offset in 
+				   sector number * sector size + offset in
 				   sector
 				 */
-				int offset = err_sector * ECC_SECTOR_SIZE + 
+				int offset = err_sector * ECC_SECTOR_SIZE +
 								err_byte;
 				if (offset < denali->mtd.writesize)
 				{
@@ -1407,15 +1406,15 @@ static bool handle_ecc(struct denali_nand_info *denali, uint8_t *buf,
 			}
 			else
 			{
-				/* if the error is not correctable, need to 
+				/* if the error is not correctable, need to
 				 * look at the page to see if it is an erased page.
-				 * if so, then it's not a real ECC error */	
+				 * if so, then it's not a real ECC error */
 				check_erased_page = true;
 			}
 
-#if DEBUG_DENALI 
+#if DEBUG_DENALI
 			printk("Detected ECC error in page %d: err_addr = 0x%08x,"
-				" info to fix is 0x%08x\n", denali->page, err_address, 
+				" info to fix is 0x%08x\n", denali->page, err_address,
 				err_correction_info);
 #endif
 		} while (!ECC_LAST_ERR(err_correction_info));
@@ -1458,9 +1457,9 @@ static void denali_setup_dma(struct denali_nand_info *denali, int op)
 	index_addr(denali, mode | 0x14000, 0x2400);
 }
 
-/* writes a page. user specifies type, and this function handles the 
+/* writes a page. user specifies type, and this function handles the
    configuration details. */
-static void write_page(struct mtd_info *mtd, struct nand_chip *chip, 
+static void write_page(struct mtd_info *mtd, struct nand_chip *chip,
 			const uint8_t *buf, bool raw_xfer)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
@@ -1470,7 +1469,7 @@ static void write_page(struct mtd_info *mtd, struct nand_chip *chip,
 	size_t size = denali->mtd.writesize + denali->mtd.oobsize;
 
 	uint32_t irq_status = 0;
-	uint32_t irq_mask = INTR_STATUS0__DMA_CMD_COMP | 
+	uint32_t irq_mask = INTR_STATUS0__DMA_CMD_COMP |
 						INTR_STATUS0__PROGRAM_FAIL;
 
 	/* if it is a raw xfer, we want to disable ecc, and send
@@ -1486,15 +1485,15 @@ static void write_page(struct mtd_info *mtd, struct nand_chip *chip,
 	if (raw_xfer)
 	{
 		/* transfer the data to the spare area */
-		memcpy(denali->buf.buf + mtd->writesize, 
-			chip->oob_poi, 
-			mtd->oobsize); 
+		memcpy(denali->buf.buf + mtd->writesize,
+			chip->oob_poi,
+			mtd->oobsize);
 	}
 
 	pci_dma_sync_single_for_device(pci_dev, addr, size, PCI_DMA_TODEVICE);
 
 	clear_interrupts(denali);
-	denali_enable_dma(denali, true);	
+	denali_enable_dma(denali, true);
 
 	denali_setup_dma(denali, DENALI_WRITE);
 
@@ -1504,53 +1503,53 @@ static void write_page(struct mtd_info *mtd, struct nand_chip *chip,
 	if (irq_status == 0)
 	{
 		printk(KERN_ERR "timeout on write_page (type = %d)\n", raw_xfer);
-		denali->status = 
-	   	   (irq_status & INTR_STATUS0__PROGRAM_FAIL) ? NAND_STATUS_FAIL : 
-						   	     PASS;
+		denali->status =
+			(irq_status & INTR_STATUS0__PROGRAM_FAIL) ? NAND_STATUS_FAIL :
+														PASS;
 	}
 
-	denali_enable_dma(denali, false);	
+	denali_enable_dma(denali, false);
 	pci_dma_sync_single_for_cpu(pci_dev, addr, size, PCI_DMA_TODEVICE);
 }
 
 /* NAND core entry points */
 
-/* this is the callback that the NAND core calls to write a page. Since 
-   writing a page with ECC or without is similar, all the work is done 
+/* this is the callback that the NAND core calls to write a page. Since
+   writing a page with ECC or without is similar, all the work is done
    by write_page above.   */
-static void denali_write_page(struct mtd_info *mtd, struct nand_chip *chip, 
+static void denali_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 				const uint8_t *buf)
 {
 	/* for regular page writes, we let HW handle all the ECC
-         * data written to the device. */
+	 * data written to the device. */
 	write_page(mtd, chip, buf, false);
 }
 
-/* This is the callback that the NAND core calls to write a page without ECC. 
+/* This is the callback that the NAND core calls to write a page without ECC.
    raw access is similiar to ECC page writes, so all the work is done in the
-   write_page() function above. 
+   write_page() function above.
  */
-static void denali_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip, 
+static void denali_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 					const uint8_t *buf)
 {
-	/* for raw page writes, we want to disable ECC and simply write 
+	/* for raw page writes, we want to disable ECC and simply write
 	   whatever data is in the buffer. */
 	write_page(mtd, chip, buf, true);
 }
 
-static int denali_write_oob(struct mtd_info *mtd, struct nand_chip *chip, 
+static int denali_write_oob(struct mtd_info *mtd, struct nand_chip *chip,
 			    int page)
 {
-	return write_oob_data(mtd, chip->oob_poi, page);	
+	return write_oob_data(mtd, chip->oob_poi, page);
 }
 
-static int denali_read_oob(struct mtd_info *mtd, struct nand_chip *chip, 
+static int denali_read_oob(struct mtd_info *mtd, struct nand_chip *chip,
 			   int page, int sndcmd)
 {
 	read_oob_data(mtd, chip->oob_poi, page);
 
-	return 0; /* notify NAND core to send command to 
-                   * NAND device. */
+	return 0; /* notify NAND core to send command to
+			   NAND device. */
 }
 
 static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
@@ -1563,7 +1562,7 @@ static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 	size_t size = denali->mtd.writesize + denali->mtd.oobsize;
 
 	uint32_t irq_status = 0;
-	uint32_t irq_mask = INTR_STATUS0__ECC_TRANSACTION_DONE | 
+	uint32_t irq_mask = INTR_STATUS0__ECC_TRANSACTION_DONE |
 			    INTR_STATUS0__ECC_ERR;
 	bool check_erased_page = false;
 
@@ -1581,7 +1580,7 @@ static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 	pci_dma_sync_single_for_cpu(pci_dev, addr, size, PCI_DMA_FROMDEVICE);
 
 	memcpy(buf, denali->buf.buf, mtd->writesize);
-	
+
 	check_erased_page = handle_ecc(denali, buf, chip->oob_poi, irq_status);
 	denali_enable_dma(denali, false);
 
@@ -1600,7 +1599,7 @@ static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 			{
 				denali->mtd.ecc_stats.failed++;
 			}
-		}	
+		}
 	}
 	return 0;
 }
@@ -1616,7 +1615,7 @@ static int denali_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 
 	uint32_t irq_status = 0;
 	uint32_t irq_mask = INTR_STATUS0__DMA_CMD_COMP;
-						
+
 	setup_ecc_for_xfer(denali, false, true);
 	denali_enable_dma(denali, true);
 
@@ -1687,21 +1686,21 @@ static void denali_erase(struct mtd_info *mtd, int page)
 	printk("erase page: %d\n", page);
 #endif
 	/* clear interrupts */
-	clear_interrupts(denali);	
+	clear_interrupts(denali);
 
 	/* setup page read request for access type */
 	cmd = MODE_10 | BANK(denali->flash_bank) | page;
 	index_addr(denali, (uint32_t)cmd, 0x1);
 
 	/* wait for erase to complete or failure to occur */
-	irq_status = wait_for_irq(denali, INTR_STATUS0__ERASE_COMP | 
+	irq_status = wait_for_irq(denali, INTR_STATUS0__ERASE_COMP |
 					INTR_STATUS0__ERASE_FAIL);
 
-	denali->status = (irq_status & INTR_STATUS0__ERASE_FAIL) ? NAND_STATUS_FAIL : 
+	denali->status = (irq_status & INTR_STATUS0__ERASE_FAIL) ? NAND_STATUS_FAIL :
 								 PASS;
 }
 
-static void denali_cmdfunc(struct mtd_info *mtd, unsigned int cmd, int col, 
+static void denali_cmdfunc(struct mtd_info *mtd, unsigned int cmd, int col,
 			   int page)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
@@ -1710,7 +1709,7 @@ static void denali_cmdfunc(struct mtd_info *mtd, unsigned int cmd, int col,
 	printk("cmdfunc: 0x%x %d %d\n", cmd, col, page);
 #endif
 	switch (cmd)
-	{ 
+	{
 		case NAND_CMD_PAGEPROG:
 			break;
 		case NAND_CMD_STATUS:
@@ -1720,19 +1719,19 @@ static void denali_cmdfunc(struct mtd_info *mtd, unsigned int cmd, int col,
 			reset_buf(denali);
 			if (denali->flash_bank < denali->total_used_banks)
 			{
-				/* write manufacturer information into nand 
+				/* write manufacturer information into nand
 				   buffer for NAND subsystem to fetch.
-  			         */ 
-	                        write_byte_to_buf(denali, denali->dev_info.wDeviceMaker);
-	                        write_byte_to_buf(denali, denali->dev_info.wDeviceID);
-	                        write_byte_to_buf(denali, denali->dev_info.bDeviceParam0);
-	                        write_byte_to_buf(denali, denali->dev_info.bDeviceParam1);
-	                        write_byte_to_buf(denali, denali->dev_info.bDeviceParam2);
+				   */
+				write_byte_to_buf(denali, denali->dev_info.wDeviceMaker);
+				write_byte_to_buf(denali, denali->dev_info.wDeviceID);
+				write_byte_to_buf(denali, denali->dev_info.bDeviceParam0);
+				write_byte_to_buf(denali, denali->dev_info.bDeviceParam1);
+				write_byte_to_buf(denali, denali->dev_info.bDeviceParam2);
 			}
-			else 
+			else
 			{
 				int i;
-				for (i = 0; i < 5; i++) 
+				for (i = 0; i < 5; i++)
 					write_byte_to_buf(denali, 0xff);
 			}
 			break;
@@ -1753,7 +1752,7 @@ static void denali_cmdfunc(struct mtd_info *mtd, unsigned int cmd, int col,
 }
 
 /* stubs for ECC functions not used by the NAND core */
-static int denali_ecc_calculate(struct mtd_info *mtd, const uint8_t *data, 
+static int denali_ecc_calculate(struct mtd_info *mtd, const uint8_t *data,
 				uint8_t *ecc_code)
 {
 	printk(KERN_ERR "denali_ecc_calculate called unexpectedly\n");
@@ -1761,7 +1760,7 @@ static int denali_ecc_calculate(struct mtd_info *mtd, const uint8_t *data,
 	return -EIO;
 }
 
-static int denali_ecc_correct(struct mtd_info *mtd, uint8_t *data, 
+static int denali_ecc_correct(struct mtd_info *mtd, uint8_t *data,
 				uint8_t *read_ecc, uint8_t *calc_ecc)
 {
 	printk(KERN_ERR "denali_ecc_correct called unexpectedly\n");
@@ -1797,9 +1796,9 @@ static void denali_hw_init(struct denali_nand_info *denali)
 static struct nand_ecclayout nand_oob_slc = {
 	.eccbytes = 4,
 	.eccpos = { 0, 1, 2, 3 }, /* not used */
-	.oobfree = {{ 
-			.offset = ECC_BYTES_SLC, 
-			.length = 64 - ECC_BYTES_SLC  
+	.oobfree = {{
+			.offset = ECC_BYTES_SLC,
+			.length = 64 - ECC_BYTES_SLC
 		   }}
 };
 
@@ -1807,9 +1806,9 @@ static struct nand_ecclayout nand_oob_slc = {
 static struct nand_ecclayout nand_oob_mlc_14bit = {
 	.eccbytes = 14,
 	.eccpos = { 0, 1, 2, 3, 5, 6, 7, 8, 9, 10, 11, 12, 13 }, /* not used */
-	.oobfree = {{ 
-			.offset = ECC_BYTES_MLC, 
-			.length = 64 - ECC_BYTES_MLC  
+	.oobfree = {{
+			.offset = ECC_BYTES_MLC,
+			.length = 64 - ECC_BYTES_MLC
 		   }}
 };
 
@@ -1842,12 +1841,12 @@ void denali_drv_init(struct denali_nand_info *denali)
 	denali->idx = 0;
 
 	/* setup interrupt handler */
-	/* the completion object will be used to notify 
+	/* the completion object will be used to notify
 	 * the callee that the interrupt is done */
 	init_completion(&denali->complete);
 
 	/* the spinlock will be used to synchronize the ISR
-	 * with any element that might be access shared 
+	 * with any element that might be access shared
 	 * data (interrupt status) */
 	spin_lock_init(&denali->irq_lock);
 
@@ -1880,9 +1879,9 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	}
 
 	if (id->driver_data == INTEL_CE4100) {
-		/* Due to a silicon limitation, we can only support 
-		 * ONFI timing mode 1 and below. 
-		 */ 
+		/* Due to a silicon limitation, we can only support
+		 * ONFI timing mode 1 and below.
+		 */
 		if (onfi_timing_mode < -1 || onfi_timing_mode > 1)
 		{
 			printk("Intel CE4100 only supports ONFI timing mode 1 "
@@ -1918,7 +1917,7 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 		printk(KERN_ERR "Spectra: no usable DMA configuration\n");
 		goto failed_enable;
 	}
-	denali->buf.dma_buf = pci_map_single(dev, denali->buf.buf, DENALI_BUF_SIZE, 
+	denali->buf.dma_buf = pci_map_single(dev, denali->buf.buf, DENALI_BUF_SIZE,
 					 PCI_DMA_BIDIRECTIONAL);
 
 	if (pci_dma_mapping_error(dev, denali->buf.dma_buf))
@@ -1976,8 +1975,8 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 
 	NAND_Read_Device_ID(denali);
 
-	/* MTD supported page sizes vary by kernel. We validate our 
-           kernel supports the device here.
+	/* MTD supported page sizes vary by kernel. We validate our
+	 * kernel supports the device here.
 	 */
 	if (denali->dev_info.wPageSize > NAND_MAX_PAGESIZE + NAND_MAX_OOBSIZE)
 	{
@@ -2009,18 +2008,18 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	denali->nand.read_byte = denali_read_byte;
 	denali->nand.waitfunc = denali_waitfunc;
 
-	/* scan for NAND devices attached to the controller 
+	/* scan for NAND devices attached to the controller
 	 * this is the first stage in a two step process to register
-	 * with the nand subsystem */	
+	 * with the nand subsystem */
 	if (nand_scan_ident(&denali->mtd, LLD_MAX_FLASH_BANKS, NULL))
 	{
 		ret = -ENXIO;
 		goto failed_nand;
 	}
-	
-	/* second stage of the NAND scan 
-	 * this stage requires information regarding ECC and 
-         * bad block management. */
+
+	/* second stage of the NAND scan
+	 * this stage requires information regarding ECC and
+	 * bad block management. */
 
 	/* Bad block management */
 	denali->nand.bbt_td = &bbt_main_descr;
@@ -2041,9 +2040,9 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 		denali->nand.ecc.bytes = ECC_BYTES_SLC;
 	}
 
-	/* These functions are required by the NAND core framework, otherwise, 
-           the NAND core will assert. However, we don't need them, so we'll stub 
-           them out. */
+	/* These functions are required by the NAND core framework, otherwise,
+	 * the NAND core will assert. However, we don't need them, so we'll stub
+	 * them out. */
 	denali->nand.ecc.calculate = denali_ecc_calculate;
 	denali->nand.ecc.correct = denali_ecc_correct;
 	denali->nand.ecc.hwctl = denali_ecc_hwctl;
@@ -2079,7 +2078,7 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
  failed_remap_csr:
 	pci_release_regions(dev);
  failed_req_csr:
-	pci_unmap_single(dev, denali->buf.dma_buf, DENALI_BUF_SIZE, 
+	pci_unmap_single(dev, denali->buf.dma_buf, DENALI_BUF_SIZE,
 							PCI_DMA_BIDIRECTIONAL);
  failed_enable:
 	kfree(denali);
@@ -2103,7 +2102,7 @@ static void denali_pci_remove(struct pci_dev *dev)
 	iounmap(denali->flash_mem);
 	pci_release_regions(dev);
 	pci_disable_device(dev);
-	pci_unmap_single(dev, denali->buf.dma_buf, DENALI_BUF_SIZE, 
+	pci_unmap_single(dev, denali->buf.dma_buf, DENALI_BUF_SIZE,
 							PCI_DMA_BIDIRECTIONAL);
 	pci_set_drvdata(dev, NULL);
 	kfree(denali);
-- 
1.6.6.1
