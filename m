Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QIM20-0008OE-Bw
	for linux-mtd@lists.infradead.org; Fri, 06 May 2011 14:29:27 +0000
Received: by wwb39 with SMTP id 39so2593348wwb.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 06 May 2011 07:29:23 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [RFC PATCH 2/9] nand/denali: remove nearly-duplicated register
	definitions
Date: Fri,  6 May 2011 15:28:56 +0100
Message-Id: <1304692143-22432-3-git-send-email-jamie@jamieiles.com>
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

The controller has interrupt enable/status register pairs for each bank
(along with ECC and status registers) that differ only in address offset.
Rather than providing definitions for each register, make the address a
macro so that it scales for devices with different numbers of banks.

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Chuanxiao Dong <chuanxiao.dong@intel.com>
Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 drivers/mtd/nand/denali.c |  134 +++++++----------
 drivers/mtd/nand/denali.h |  371 +++++++--------------------------------------
 2 files changed, 110 insertions(+), 395 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 1cf7281..70a439c 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -45,16 +45,16 @@ MODULE_PARM_DESC(onfi_timing_mode, "Overrides default ONFI setting."
 
 /* We define a macro here that combines all interrupts this driver uses into
  * a single constant value, for convenience. */
-#define DENALI_IRQ_ALL	(INTR_STATUS0__DMA_CMD_COMP | \
-			INTR_STATUS0__ECC_TRANSACTION_DONE | \
-			INTR_STATUS0__ECC_ERR | \
-			INTR_STATUS0__PROGRAM_FAIL | \
-			INTR_STATUS0__LOAD_COMP | \
-			INTR_STATUS0__PROGRAM_COMP | \
-			INTR_STATUS0__TIME_OUT | \
-			INTR_STATUS0__ERASE_FAIL | \
-			INTR_STATUS0__RST_COMP | \
-			INTR_STATUS0__ERASE_COMP)
+#define DENALI_IRQ_ALL	(INTR_STATUS__DMA_CMD_COMP | \
+			INTR_STATUS__ECC_TRANSACTION_DONE | \
+			INTR_STATUS__ECC_ERR | \
+			INTR_STATUS__PROGRAM_FAIL | \
+			INTR_STATUS__LOAD_COMP | \
+			INTR_STATUS__PROGRAM_COMP | \
+			INTR_STATUS__TIME_OUT | \
+			INTR_STATUS__ERASE_FAIL | \
+			INTR_STATUS__RST_COMP | \
+			INTR_STATUS__ERASE_COMP)
 
 /* indicates whether or not the internal value for the flash bank is
  * valid or not */
@@ -96,30 +96,6 @@ static const struct pci_device_id denali_pci_ids[] = {
 	{ /* end: all zeroes */ }
 };
 
-
-/* these are static lookup tables that give us easy access to
- * registers in the NAND controller.
- */
-static const uint32_t intr_status_addresses[4] = {INTR_STATUS0,
-						  INTR_STATUS1,
-						  INTR_STATUS2,
-						  INTR_STATUS3};
-
-static const uint32_t device_reset_banks[4] = {DEVICE_RESET__BANK0,
-							DEVICE_RESET__BANK1,
-							DEVICE_RESET__BANK2,
-							DEVICE_RESET__BANK3};
-
-static const uint32_t operation_timeout[4] = {INTR_STATUS0__TIME_OUT,
-							INTR_STATUS1__TIME_OUT,
-							INTR_STATUS2__TIME_OUT,
-							INTR_STATUS3__TIME_OUT};
-
-static const uint32_t reset_complete[4] = {INTR_STATUS0__RST_COMP,
-							INTR_STATUS1__RST_COMP,
-							INTR_STATUS2__RST_COMP,
-							INTR_STATUS3__RST_COMP};
-
 /* forward declarations */
 static void clear_interrupts(struct denali_nand_info *denali);
 static uint32_t wait_for_irq(struct denali_nand_info *denali,
@@ -181,18 +157,16 @@ static void read_status(struct denali_nand_info *denali)
 static void reset_bank(struct denali_nand_info *denali)
 {
 	uint32_t irq_status = 0;
-	uint32_t irq_mask = reset_complete[denali->flash_bank] |
-			    operation_timeout[denali->flash_bank];
-	int bank = 0;
+	uint32_t irq_mask = INTR_STATUS__RST_COMP |
+			    INTR_STATUS__TIME_OUT;
 
 	clear_interrupts(denali);
 
-	bank = device_reset_banks[denali->flash_bank];
-	iowrite32(bank, denali->flash_reg + DEVICE_RESET);
+	iowrite32(1 << denali->flash_bank, denali->flash_reg + DEVICE_RESET);
 
 	irq_status = wait_for_irq(denali, irq_mask);
 
-	if (irq_status & operation_timeout[denali->flash_bank])
+	if (irq_status & INTR_STATUS__TIME_OUT)
 		dev_err(denali->dev, "reset bank failed.\n");
 }
 
@@ -205,25 +179,24 @@ static uint16_t denali_nand_reset(struct denali_nand_info *denali)
 		       __FILE__, __LINE__, __func__);
 
 	for (i = 0 ; i < LLD_MAX_FLASH_BANKS; i++)
-		iowrite32(reset_complete[i] | operation_timeout[i],
-		denali->flash_reg + intr_status_addresses[i]);
+		iowrite32(INTR_STATUS__RST_COMP | INTR_STATUS__TIME_OUT,
+		denali->flash_reg + INTR_STATUS(i));
 
 	for (i = 0 ; i < LLD_MAX_FLASH_BANKS; i++) {
-		iowrite32(device_reset_banks[i],
-				denali->flash_reg + DEVICE_RESET);
+		iowrite32(1 << i, denali->flash_reg + DEVICE_RESET);
 		while (!(ioread32(denali->flash_reg +
-				intr_status_addresses[i]) &
-			(reset_complete[i] | operation_timeout[i])))
+				INTR_STATUS(i)) &
+			(INTR_STATUS__RST_COMP | INTR_STATUS__TIME_OUT)))
 			cpu_relax();
-		if (ioread32(denali->flash_reg + intr_status_addresses[i]) &
-			operation_timeout[i])
+		if (ioread32(denali->flash_reg + INTR_STATUS(i)) &
+			INTR_STATUS__TIME_OUT)
 			dev_dbg(denali->dev,
 			"NAND Reset operation timed out on bank %d\n", i);
 	}
 
 	for (i = 0; i < LLD_MAX_FLASH_BANKS; i++)
-		iowrite32(reset_complete[i] | operation_timeout[i],
-			denali->flash_reg + intr_status_addresses[i]);
+		iowrite32(INTR_STATUS__RST_COMP | INTR_STATUS__TIME_OUT,
+			denali->flash_reg + INTR_STATUS(i));
 
 	return PASS;
 }
@@ -481,15 +454,15 @@ static void detect_partition_feature(struct denali_nand_info *denali)
 	 * blocks it can't touch.
 	 * */
 	if (ioread32(denali->flash_reg + FEATURES) & FEATURES__PARTITION) {
-		if ((ioread32(denali->flash_reg + PERM_SRC_ID_1) &
-			PERM_SRC_ID_1__SRCID) == SPECTRA_PARTITION_ID) {
+		if ((ioread32(denali->flash_reg + PERM_SRC_ID(1)) &
+			PERM_SRC_ID__SRCID) == SPECTRA_PARTITION_ID) {
 			denali->fwblks =
-			    ((ioread32(denali->flash_reg + MIN_MAX_BANK_1) &
-			      MIN_MAX_BANK_1__MIN_VALUE) *
+			    ((ioread32(denali->flash_reg + MIN_MAX_BANK(1)) &
+			      MIN_MAX_BANK__MIN_VALUE) *
 			     denali->blksperchip)
 			    +
-			    (ioread32(denali->flash_reg + MIN_BLK_ADDR_1) &
-			    MIN_BLK_ADDR_1__VALUE);
+			    (ioread32(denali->flash_reg + MIN_BLK_ADDR(1)) &
+			    MIN_BLK_ADDR__VALUE);
 		} else
 			denali->fwblks = SPECTRA_START_BLOCK;
 	} else
@@ -581,6 +554,7 @@ static inline bool is_flash_bank_valid(int flash_bank)
 static void denali_irq_init(struct denali_nand_info *denali)
 {
 	uint32_t int_mask = 0;
+	int i;
 
 	/* Disable global interrupts */
 	denali_set_intr_modes(denali, false);
@@ -588,10 +562,8 @@ static void denali_irq_init(struct denali_nand_info *denali)
 	int_mask = DENALI_IRQ_ALL;
 
 	/* Clear all status bits */
-	iowrite32(0xFFFF, denali->flash_reg + INTR_STATUS0);
-	iowrite32(0xFFFF, denali->flash_reg + INTR_STATUS1);
-	iowrite32(0xFFFF, denali->flash_reg + INTR_STATUS2);
-	iowrite32(0xFFFF, denali->flash_reg + INTR_STATUS3);
+	for (i = 0; i < LLD_MAX_FLASH_BANKS; ++i)
+		iowrite32(0xFFFF, denali->flash_reg + INTR_STATUS(i));
 
 	denali_irq_enable(denali, int_mask);
 }
@@ -605,10 +577,10 @@ static void denali_irq_cleanup(int irqnum, struct denali_nand_info *denali)
 static void denali_irq_enable(struct denali_nand_info *denali,
 							uint32_t int_mask)
 {
-	iowrite32(int_mask, denali->flash_reg + INTR_EN0);
-	iowrite32(int_mask, denali->flash_reg + INTR_EN1);
-	iowrite32(int_mask, denali->flash_reg + INTR_EN2);
-	iowrite32(int_mask, denali->flash_reg + INTR_EN3);
+	int i;
+
+	for (i = 0; i < LLD_MAX_FLASH_BANKS; ++i)
+		iowrite32(int_mask, denali->flash_reg + INTR_EN(i));
 }
 
 /* This function only returns when an interrupt that this driver cares about
@@ -625,7 +597,7 @@ static inline void clear_interrupt(struct denali_nand_info *denali,
 {
 	uint32_t intr_status_reg = 0;
 
-	intr_status_reg = intr_status_addresses[denali->flash_bank];
+	intr_status_reg = INTR_STATUS(denali->flash_bank);
 
 	iowrite32(irq_mask, denali->flash_reg + intr_status_reg);
 }
@@ -646,7 +618,7 @@ static uint32_t read_interrupt_status(struct denali_nand_info *denali)
 {
 	uint32_t intr_status_reg = 0;
 
-	intr_status_reg = intr_status_addresses[denali->flash_bank];
+	intr_status_reg = INTR_STATUS(denali->flash_bank);
 
 	return ioread32(denali->flash_reg + intr_status_reg);
 }
@@ -755,7 +727,7 @@ static int denali_send_pipeline_cmd(struct denali_nand_info *denali,
 		 irq_mask = 0;
 
 	if (op == DENALI_READ)
-		irq_mask = INTR_STATUS0__LOAD_COMP;
+		irq_mask = INTR_STATUS__LOAD_COMP;
 	else if (op == DENALI_WRITE)
 		irq_mask = 0;
 	else
@@ -862,8 +834,8 @@ static int write_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
 	uint32_t irq_status = 0;
-	uint32_t irq_mask = INTR_STATUS0__PROGRAM_COMP |
-						INTR_STATUS0__PROGRAM_FAIL;
+	uint32_t irq_mask = INTR_STATUS__PROGRAM_COMP |
+						INTR_STATUS__PROGRAM_FAIL;
 	int status = 0;
 
 	denali->page = page;
@@ -890,7 +862,7 @@ static int write_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
 static void read_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
-	uint32_t irq_mask = INTR_STATUS0__LOAD_COMP,
+	uint32_t irq_mask = INTR_STATUS__LOAD_COMP,
 			 irq_status = 0, addr = 0x0, cmd = 0x0;
 
 	denali->page = page;
@@ -945,7 +917,7 @@ static bool handle_ecc(struct denali_nand_info *denali, uint8_t *buf,
 {
 	bool check_erased_page = false;
 
-	if (irq_status & INTR_STATUS0__ECC_ERR) {
+	if (irq_status & INTR_STATUS__ECC_ERR) {
 		/* read the ECC errors. we'll ignore them for now */
 		uint32_t err_address = 0, err_correction_info = 0;
 		uint32_t err_byte = 0, err_sector = 0, err_device = 0;
@@ -996,7 +968,7 @@ static bool handle_ecc(struct denali_nand_info *denali, uint8_t *buf,
 		 * for a while for this interrupt
 		 * */
 		while (!(read_interrupt_status(denali) &
-				INTR_STATUS0__ECC_TRANSACTION_DONE))
+				INTR_STATUS__ECC_TRANSACTION_DONE))
 			cpu_relax();
 		clear_interrupts(denali);
 		denali_set_intr_modes(denali, true);
@@ -1051,8 +1023,8 @@ static void write_page(struct mtd_info *mtd, struct nand_chip *chip,
 	size_t size = denali->mtd.writesize + denali->mtd.oobsize;
 
 	uint32_t irq_status = 0;
-	uint32_t irq_mask = INTR_STATUS0__DMA_CMD_COMP |
-						INTR_STATUS0__PROGRAM_FAIL;
+	uint32_t irq_mask = INTR_STATUS__DMA_CMD_COMP |
+						INTR_STATUS__PROGRAM_FAIL;
 
 	/* if it is a raw xfer, we want to disable ecc, and send
 	 * the spare area.
@@ -1086,7 +1058,7 @@ static void write_page(struct mtd_info *mtd, struct nand_chip *chip,
 				"timeout on write_page (type = %d)\n",
 				raw_xfer);
 		denali->status =
-			(irq_status & INTR_STATUS0__PROGRAM_FAIL) ?
+			(irq_status & INTR_STATUS__PROGRAM_FAIL) ?
 			NAND_STATUS_FAIL : PASS;
 	}
 
@@ -1144,8 +1116,8 @@ static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 	size_t size = denali->mtd.writesize + denali->mtd.oobsize;
 
 	uint32_t irq_status = 0;
-	uint32_t irq_mask = INTR_STATUS0__ECC_TRANSACTION_DONE |
-			    INTR_STATUS0__ECC_ERR;
+	uint32_t irq_mask = INTR_STATUS__ECC_TRANSACTION_DONE |
+			    INTR_STATUS__ECC_ERR;
 	bool check_erased_page = false;
 
 	if (page != denali->page) {
@@ -1196,7 +1168,7 @@ static int denali_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 	size_t size = denali->mtd.writesize + denali->mtd.oobsize;
 
 	uint32_t irq_status = 0;
-	uint32_t irq_mask = INTR_STATUS0__DMA_CMD_COMP;
+	uint32_t irq_mask = INTR_STATUS__DMA_CMD_COMP;
 
 	if (page != denali->page) {
 		dev_err(denali->dev, "IN %s: page %d is not"
@@ -1269,10 +1241,10 @@ static void denali_erase(struct mtd_info *mtd, int page)
 	index_addr(denali, (uint32_t)cmd, 0x1);
 
 	/* wait for erase to complete or failure to occur */
-	irq_status = wait_for_irq(denali, INTR_STATUS0__ERASE_COMP |
-					INTR_STATUS0__ERASE_FAIL);
+	irq_status = wait_for_irq(denali, INTR_STATUS__ERASE_COMP |
+					INTR_STATUS__ERASE_FAIL);
 
-	denali->status = (irq_status & INTR_STATUS0__ERASE_FAIL) ?
+	denali->status = (irq_status & INTR_STATUS__ERASE_FAIL) ?
 						NAND_STATUS_FAIL : PASS;
 }
 
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index 9b875fd..638668c 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -211,185 +211,46 @@
 #define TRANSFER_MODE				0x400
 #define     TRANSFER_MODE__VALUE			0x0003
 
-#define INTR_STATUS0				0x410
-#define     INTR_STATUS0__ECC_TRANSACTION_DONE		0x0001
-#define     INTR_STATUS0__ECC_ERR			0x0002
-#define     INTR_STATUS0__DMA_CMD_COMP			0x0004
-#define     INTR_STATUS0__TIME_OUT			0x0008
-#define     INTR_STATUS0__PROGRAM_FAIL			0x0010
-#define     INTR_STATUS0__ERASE_FAIL			0x0020
-#define     INTR_STATUS0__LOAD_COMP			0x0040
-#define     INTR_STATUS0__PROGRAM_COMP			0x0080
-#define     INTR_STATUS0__ERASE_COMP			0x0100
-#define     INTR_STATUS0__PIPE_CPYBCK_CMD_COMP		0x0200
-#define     INTR_STATUS0__LOCKED_BLK			0x0400
-#define     INTR_STATUS0__UNSUP_CMD			0x0800
-#define     INTR_STATUS0__INT_ACT			0x1000
-#define     INTR_STATUS0__RST_COMP			0x2000
-#define     INTR_STATUS0__PIPE_CMD_ERR			0x4000
-#define     INTR_STATUS0__PAGE_XFER_INC			0x8000
-
-#define INTR_EN0					0x420
-#define     INTR_EN0__ECC_TRANSACTION_DONE		0x0001
-#define     INTR_EN0__ECC_ERR				0x0002
-#define     INTR_EN0__DMA_CMD_COMP			0x0004
-#define     INTR_EN0__TIME_OUT				0x0008
-#define     INTR_EN0__PROGRAM_FAIL			0x0010
-#define     INTR_EN0__ERASE_FAIL			0x0020
-#define     INTR_EN0__LOAD_COMP				0x0040
-#define     INTR_EN0__PROGRAM_COMP			0x0080
-#define     INTR_EN0__ERASE_COMP			0x0100
-#define     INTR_EN0__PIPE_CPYBCK_CMD_COMP		0x0200
-#define     INTR_EN0__LOCKED_BLK			0x0400
-#define     INTR_EN0__UNSUP_CMD				0x0800
-#define     INTR_EN0__INT_ACT				0x1000
-#define     INTR_EN0__RST_COMP				0x2000
-#define     INTR_EN0__PIPE_CMD_ERR			0x4000
-#define     INTR_EN0__PAGE_XFER_INC			0x8000
-
-#define PAGE_CNT0				0x430
-#define     PAGE_CNT0__VALUE				0x00ff
-
-#define ERR_PAGE_ADDR0				0x440
-#define     ERR_PAGE_ADDR0__VALUE			0xffff
-
-#define ERR_BLOCK_ADDR0				0x450
-#define     ERR_BLOCK_ADDR0__VALUE			0xffff
-
-#define INTR_STATUS1				0x460
-#define     INTR_STATUS1__ECC_TRANSACTION_DONE		0x0001
-#define     INTR_STATUS1__ECC_ERR			0x0002
-#define     INTR_STATUS1__DMA_CMD_COMP			0x0004
-#define     INTR_STATUS1__TIME_OUT			0x0008
-#define     INTR_STATUS1__PROGRAM_FAIL			0x0010
-#define     INTR_STATUS1__ERASE_FAIL			0x0020
-#define     INTR_STATUS1__LOAD_COMP			0x0040
-#define     INTR_STATUS1__PROGRAM_COMP			0x0080
-#define     INTR_STATUS1__ERASE_COMP			0x0100
-#define     INTR_STATUS1__PIPE_CPYBCK_CMD_COMP		0x0200
-#define     INTR_STATUS1__LOCKED_BLK			0x0400
-#define     INTR_STATUS1__UNSUP_CMD			0x0800
-#define     INTR_STATUS1__INT_ACT			0x1000
-#define     INTR_STATUS1__RST_COMP			0x2000
-#define     INTR_STATUS1__PIPE_CMD_ERR			0x4000
-#define     INTR_STATUS1__PAGE_XFER_INC			0x8000
-
-#define INTR_EN1					0x470
-#define     INTR_EN1__ECC_TRANSACTION_DONE		0x0001
-#define     INTR_EN1__ECC_ERR				0x0002
-#define     INTR_EN1__DMA_CMD_COMP			0x0004
-#define     INTR_EN1__TIME_OUT				0x0008
-#define     INTR_EN1__PROGRAM_FAIL			0x0010
-#define     INTR_EN1__ERASE_FAIL			0x0020
-#define     INTR_EN1__LOAD_COMP				0x0040
-#define     INTR_EN1__PROGRAM_COMP			0x0080
-#define     INTR_EN1__ERASE_COMP			0x0100
-#define     INTR_EN1__PIPE_CPYBCK_CMD_COMP		0x0200
-#define     INTR_EN1__LOCKED_BLK			0x0400
-#define     INTR_EN1__UNSUP_CMD				0x0800
-#define     INTR_EN1__INT_ACT				0x1000
-#define     INTR_EN1__RST_COMP				0x2000
-#define     INTR_EN1__PIPE_CMD_ERR			0x4000
-#define     INTR_EN1__PAGE_XFER_INC			0x8000
-
-#define PAGE_CNT1				0x480
-#define     PAGE_CNT1__VALUE				0x00ff
-
-#define ERR_PAGE_ADDR1				0x490
-#define     ERR_PAGE_ADDR1__VALUE			0xffff
-
-#define ERR_BLOCK_ADDR1				0x4a0
-#define     ERR_BLOCK_ADDR1__VALUE			0xffff
-
-#define INTR_STATUS2				0x4b0
-#define     INTR_STATUS2__ECC_TRANSACTION_DONE		0x0001
-#define     INTR_STATUS2__ECC_ERR			0x0002
-#define     INTR_STATUS2__DMA_CMD_COMP			0x0004
-#define     INTR_STATUS2__TIME_OUT			0x0008
-#define     INTR_STATUS2__PROGRAM_FAIL			0x0010
-#define     INTR_STATUS2__ERASE_FAIL			0x0020
-#define     INTR_STATUS2__LOAD_COMP			0x0040
-#define     INTR_STATUS2__PROGRAM_COMP			0x0080
-#define     INTR_STATUS2__ERASE_COMP			0x0100
-#define     INTR_STATUS2__PIPE_CPYBCK_CMD_COMP		0x0200
-#define     INTR_STATUS2__LOCKED_BLK			0x0400
-#define     INTR_STATUS2__UNSUP_CMD			0x0800
-#define     INTR_STATUS2__INT_ACT			0x1000
-#define     INTR_STATUS2__RST_COMP			0x2000
-#define     INTR_STATUS2__PIPE_CMD_ERR			0x4000
-#define     INTR_STATUS2__PAGE_XFER_INC			0x8000
-
-#define INTR_EN2					0x4c0
-#define     INTR_EN2__ECC_TRANSACTION_DONE		0x0001
-#define     INTR_EN2__ECC_ERR				0x0002
-#define     INTR_EN2__DMA_CMD_COMP			0x0004
-#define     INTR_EN2__TIME_OUT				0x0008
-#define     INTR_EN2__PROGRAM_FAIL			0x0010
-#define     INTR_EN2__ERASE_FAIL			0x0020
-#define     INTR_EN2__LOAD_COMP				0x0040
-#define     INTR_EN2__PROGRAM_COMP			0x0080
-#define     INTR_EN2__ERASE_COMP			0x0100
-#define     INTR_EN2__PIPE_CPYBCK_CMD_COMP		0x0200
-#define     INTR_EN2__LOCKED_BLK			0x0400
-#define     INTR_EN2__UNSUP_CMD				0x0800
-#define     INTR_EN2__INT_ACT				0x1000
-#define     INTR_EN2__RST_COMP				0x2000
-#define     INTR_EN2__PIPE_CMD_ERR			0x4000
-#define     INTR_EN2__PAGE_XFER_INC			0x8000
-
-#define PAGE_CNT2				0x4d0
-#define     PAGE_CNT2__VALUE				0x00ff
-
-#define ERR_PAGE_ADDR2				0x4e0
-#define     ERR_PAGE_ADDR2__VALUE			0xffff
-
-#define ERR_BLOCK_ADDR2				0x4f0
-#define     ERR_BLOCK_ADDR2__VALUE			0xffff
-
-#define INTR_STATUS3				0x500
-#define     INTR_STATUS3__ECC_TRANSACTION_DONE		0x0001
-#define     INTR_STATUS3__ECC_ERR			0x0002
-#define     INTR_STATUS3__DMA_CMD_COMP			0x0004
-#define     INTR_STATUS3__TIME_OUT			0x0008
-#define     INTR_STATUS3__PROGRAM_FAIL			0x0010
-#define     INTR_STATUS3__ERASE_FAIL			0x0020
-#define     INTR_STATUS3__LOAD_COMP			0x0040
-#define     INTR_STATUS3__PROGRAM_COMP			0x0080
-#define     INTR_STATUS3__ERASE_COMP			0x0100
-#define     INTR_STATUS3__PIPE_CPYBCK_CMD_COMP		0x0200
-#define     INTR_STATUS3__LOCKED_BLK			0x0400
-#define     INTR_STATUS3__UNSUP_CMD			0x0800
-#define     INTR_STATUS3__INT_ACT			0x1000
-#define     INTR_STATUS3__RST_COMP			0x2000
-#define     INTR_STATUS3__PIPE_CMD_ERR			0x4000
-#define     INTR_STATUS3__PAGE_XFER_INC			0x8000
-
-#define INTR_EN3					0x510
-#define     INTR_EN3__ECC_TRANSACTION_DONE		0x0001
-#define     INTR_EN3__ECC_ERR				0x0002
-#define     INTR_EN3__DMA_CMD_COMP			0x0004
-#define     INTR_EN3__TIME_OUT				0x0008
-#define     INTR_EN3__PROGRAM_FAIL			0x0010
-#define     INTR_EN3__ERASE_FAIL			0x0020
-#define     INTR_EN3__LOAD_COMP				0x0040
-#define     INTR_EN3__PROGRAM_COMP			0x0080
-#define     INTR_EN3__ERASE_COMP			0x0100
-#define     INTR_EN3__PIPE_CPYBCK_CMD_COMP		0x0200
-#define     INTR_EN3__LOCKED_BLK			0x0400
-#define     INTR_EN3__UNSUP_CMD				0x0800
-#define     INTR_EN3__INT_ACT				0x1000
-#define     INTR_EN3__RST_COMP				0x2000
-#define     INTR_EN3__PIPE_CMD_ERR			0x4000
-#define     INTR_EN3__PAGE_XFER_INC			0x8000
-
-#define PAGE_CNT3				0x520
-#define     PAGE_CNT3__VALUE				0x00ff
-
-#define ERR_PAGE_ADDR3				0x530
-#define     ERR_PAGE_ADDR3__VALUE			0xffff
-
-#define ERR_BLOCK_ADDR3				0x540
-#define     ERR_BLOCK_ADDR3__VALUE			0xffff
+#define INTR_STATUS(__bank)	(0x410 + ((__bank) * 0x50))
+#define INTR_EN(__bank)		(0x420 + ((__bank) * 0x50))
+
+#define     INTR_STATUS__ECC_TRANSACTION_DONE		0x0001
+#define     INTR_STATUS__ECC_ERR			0x0002
+#define     INTR_STATUS__DMA_CMD_COMP			0x0004
+#define     INTR_STATUS__TIME_OUT			0x0008
+#define     INTR_STATUS__PROGRAM_FAIL			0x0010
+#define     INTR_STATUS__ERASE_FAIL			0x0020
+#define     INTR_STATUS__LOAD_COMP			0x0040
+#define     INTR_STATUS__PROGRAM_COMP			0x0080
+#define     INTR_STATUS__ERASE_COMP			0x0100
+#define     INTR_STATUS__PIPE_CPYBCK_CMD_COMP		0x0200
+#define     INTR_STATUS__LOCKED_BLK			0x0400
+#define     INTR_STATUS__UNSUP_CMD			0x0800
+#define     INTR_STATUS__INT_ACT			0x1000
+#define     INTR_STATUS__RST_COMP			0x2000
+#define     INTR_STATUS__PIPE_CMD_ERR			0x4000
+#define     INTR_STATUS__PAGE_XFER_INC			0x8000
+
+#define     INTR_EN__ECC_TRANSACTION_DONE		0x0001
+#define     INTR_EN__ECC_ERR				0x0002
+#define     INTR_EN__DMA_CMD_COMP			0x0004
+#define     INTR_EN__TIME_OUT				0x0008
+#define     INTR_EN__PROGRAM_FAIL			0x0010
+#define     INTR_EN__ERASE_FAIL				0x0020
+#define     INTR_EN__LOAD_COMP				0x0040
+#define     INTR_EN__PROGRAM_COMP			0x0080
+#define     INTR_EN__ERASE_COMP				0x0100
+#define     INTR_EN__PIPE_CPYBCK_CMD_COMP		0x0200
+#define     INTR_EN__LOCKED_BLK				0x0400
+#define     INTR_EN__UNSUP_CMD				0x0800
+#define     INTR_EN__INT_ACT				0x1000
+#define     INTR_EN__RST_COMP				0x2000
+#define     INTR_EN__PIPE_CMD_ERR			0x4000
+#define     INTR_EN__PAGE_XFER_INC			0x8000
+
+#define PAGE_CNT(__bank)	(0x430 + ((__bank) * 0x50))
+#define ERR_PAGE_ADDR(__bank)	(0x440 + ((__bank) * 0x50))
+#define ERR_BLOCK_ADDR(__bank)	(0x450 + ((__bank) * 0x50))
 
 #define DATA_INTR				0x550
 #define     DATA_INTR__WRITE_SPACE_AV			0x0001
@@ -484,141 +345,23 @@
 #define     PTN_INTR_EN__ACCESS_ERROR_BANK3		0x0010
 #define     PTN_INTR_EN__REG_ACCESS_ERROR		0x0020
 
-#define PERM_SRC_ID_0				0x830
-#define     PERM_SRC_ID_0__SRCID			0x00ff
-#define     PERM_SRC_ID_0__DIRECT_ACCESS_ACTIVE		0x0800
-#define     PERM_SRC_ID_0__WRITE_ACTIVE			0x2000
-#define     PERM_SRC_ID_0__READ_ACTIVE			0x4000
-#define     PERM_SRC_ID_0__PARTITION_VALID		0x8000
-
-#define MIN_BLK_ADDR_0				0x840
-#define     MIN_BLK_ADDR_0__VALUE			0xffff
-
-#define MAX_BLK_ADDR_0				0x850
-#define     MAX_BLK_ADDR_0__VALUE			0xffff
-
-#define MIN_MAX_BANK_0				0x860
-#define     MIN_MAX_BANK_0__MIN_VALUE			0x0003
-#define     MIN_MAX_BANK_0__MAX_VALUE			0x000c
-
-#define PERM_SRC_ID_1				0x870
-#define     PERM_SRC_ID_1__SRCID			0x00ff
-#define     PERM_SRC_ID_1__DIRECT_ACCESS_ACTIVE		0x0800
-#define     PERM_SRC_ID_1__WRITE_ACTIVE			0x2000
-#define     PERM_SRC_ID_1__READ_ACTIVE			0x4000
-#define     PERM_SRC_ID_1__PARTITION_VALID		0x8000
-
-#define MIN_BLK_ADDR_1				0x880
-#define     MIN_BLK_ADDR_1__VALUE			0xffff
-
-#define MAX_BLK_ADDR_1				0x890
-#define     MAX_BLK_ADDR_1__VALUE			0xffff
-
-#define MIN_MAX_BANK_1				0x8a0
-#define     MIN_MAX_BANK_1__MIN_VALUE			0x0003
-#define     MIN_MAX_BANK_1__MAX_VALUE			0x000c
-
-#define PERM_SRC_ID_2				0x8b0
-#define     PERM_SRC_ID_2__SRCID			0x00ff
-#define     PERM_SRC_ID_2__DIRECT_ACCESS_ACTIVE		0x0800
-#define     PERM_SRC_ID_2__WRITE_ACTIVE			0x2000
-#define     PERM_SRC_ID_2__READ_ACTIVE			0x4000
-#define     PERM_SRC_ID_2__PARTITION_VALID		0x8000
-
-#define MIN_BLK_ADDR_2				0x8c0
-#define     MIN_BLK_ADDR_2__VALUE			0xffff
-
-#define MAX_BLK_ADDR_2				0x8d0
-#define     MAX_BLK_ADDR_2__VALUE			0xffff
-
-#define MIN_MAX_BANK_2				0x8e0
-#define     MIN_MAX_BANK_2__MIN_VALUE			0x0003
-#define     MIN_MAX_BANK_2__MAX_VALUE			0x000c
-
-#define PERM_SRC_ID_3				0x8f0
-#define     PERM_SRC_ID_3__SRCID			0x00ff
-#define     PERM_SRC_ID_3__DIRECT_ACCESS_ACTIVE		0x0800
-#define     PERM_SRC_ID_3__WRITE_ACTIVE			0x2000
-#define     PERM_SRC_ID_3__READ_ACTIVE			0x4000
-#define     PERM_SRC_ID_3__PARTITION_VALID		0x8000
-
-#define MIN_BLK_ADDR_3				0x900
-#define     MIN_BLK_ADDR_3__VALUE			0xffff
-
-#define MAX_BLK_ADDR_3				0x910
-#define     MAX_BLK_ADDR_3__VALUE			0xffff
-
-#define MIN_MAX_BANK_3				0x920
-#define     MIN_MAX_BANK_3__MIN_VALUE			0x0003
-#define     MIN_MAX_BANK_3__MAX_VALUE			0x000c
-
-#define PERM_SRC_ID_4				0x930
-#define     PERM_SRC_ID_4__SRCID			0x00ff
-#define     PERM_SRC_ID_4__DIRECT_ACCESS_ACTIVE		0x0800
-#define     PERM_SRC_ID_4__WRITE_ACTIVE			0x2000
-#define     PERM_SRC_ID_4__READ_ACTIVE			0x4000
-#define     PERM_SRC_ID_4__PARTITION_VALID		0x8000
-
-#define MIN_BLK_ADDR_4				0x940
-#define     MIN_BLK_ADDR_4__VALUE			0xffff
-
-#define MAX_BLK_ADDR_4				0x950
-#define     MAX_BLK_ADDR_4__VALUE			0xffff
-
-#define MIN_MAX_BANK_4				0x960
-#define     MIN_MAX_BANK_4__MIN_VALUE			0x0003
-#define     MIN_MAX_BANK_4__MAX_VALUE			0x000c
-
-#define PERM_SRC_ID_5				0x970
-#define     PERM_SRC_ID_5__SRCID			0x00ff
-#define     PERM_SRC_ID_5__DIRECT_ACCESS_ACTIVE		0x0800
-#define     PERM_SRC_ID_5__WRITE_ACTIVE			0x2000
-#define     PERM_SRC_ID_5__READ_ACTIVE			0x4000
-#define     PERM_SRC_ID_5__PARTITION_VALID		0x8000
-
-#define MIN_BLK_ADDR_5				0x980
-#define     MIN_BLK_ADDR_5__VALUE			0xffff
-
-#define MAX_BLK_ADDR_5				0x990
-#define     MAX_BLK_ADDR_5__VALUE			0xffff
-
-#define MIN_MAX_BANK_5				0x9a0
-#define     MIN_MAX_BANK_5__MIN_VALUE			0x0003
-#define     MIN_MAX_BANK_5__MAX_VALUE			0x000c
-
-#define PERM_SRC_ID_6				0x9b0
-#define     PERM_SRC_ID_6__SRCID			0x00ff
-#define     PERM_SRC_ID_6__DIRECT_ACCESS_ACTIVE		0x0800
-#define     PERM_SRC_ID_6__WRITE_ACTIVE			0x2000
-#define     PERM_SRC_ID_6__READ_ACTIVE			0x4000
-#define     PERM_SRC_ID_6__PARTITION_VALID		0x8000
-
-#define MIN_BLK_ADDR_6				0x9c0
-#define     MIN_BLK_ADDR_6__VALUE			0xffff
-
-#define MAX_BLK_ADDR_6				0x9d0
-#define     MAX_BLK_ADDR_6__VALUE			0xffff
-
-#define MIN_MAX_BANK_6				0x9e0
-#define     MIN_MAX_BANK_6__MIN_VALUE			0x0003
-#define     MIN_MAX_BANK_6__MAX_VALUE			0x000c
-
-#define PERM_SRC_ID_7				0x9f0
-#define     PERM_SRC_ID_7__SRCID			0x00ff
-#define     PERM_SRC_ID_7__DIRECT_ACCESS_ACTIVE		0x0800
-#define     PERM_SRC_ID_7__WRITE_ACTIVE			0x2000
-#define     PERM_SRC_ID_7__READ_ACTIVE			0x4000
-#define     PERM_SRC_ID_7__PARTITION_VALID		0x8000
-
-#define MIN_BLK_ADDR_7				0xa00
-#define     MIN_BLK_ADDR_7__VALUE			0xffff
-
-#define MAX_BLK_ADDR_7				0xa10
-#define     MAX_BLK_ADDR_7__VALUE			0xffff
-
-#define MIN_MAX_BANK_7				0xa20
-#define     MIN_MAX_BANK_7__MIN_VALUE			0x0003
-#define     MIN_MAX_BANK_7__MAX_VALUE			0x000c
+#define PERM_SRC_ID(__bank)	(0x830 + ((__bank) * 0x40))
+#define     PERM_SRC_ID__SRCID				0x00ff
+#define     PERM_SRC_ID__DIRECT_ACCESS_ACTIVE		0x0800
+#define     PERM_SRC_ID__WRITE_ACTIVE			0x2000
+#define     PERM_SRC_ID__READ_ACTIVE			0x4000
+#define     PERM_SRC_ID__PARTITION_VALID		0x8000
+
+#define MIN_BLK_ADDR(__bank)	(0x840 + ((__bank) * 0x40))
+#define     MIN_BLK_ADDR__VALUE				0xffff
+
+#define MAX_BLK_ADDR(__bank)	(0x850 + ((__bank) * 0x40))
+#define     MAX_BLK_ADDR__VALUE				0xffff
+
+#define MIN_MAX_BANK(__bank)	(0x860 + ((__bank) * 0x40))
+#define     MIN_MAX_BANK__MIN_VALUE			0x0003
+#define     MIN_MAX_BANK__MAX_VALUE			0x000c
+
 
 /* ffsdefs.h */
 #define CLEAR 0                 /*use this to clear a field instead of "fail"*/
-- 
1.7.4.4
