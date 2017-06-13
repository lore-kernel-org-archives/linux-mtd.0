Received: from conuserg-09.nifty.com ([210.131.2.76])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dKmA8-0006VQ-I8
 for linux-mtd@lists.infradead.org; Tue, 13 Jun 2017 13:47:19 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Enrico Jorns <ejo@pengutronix.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-kernel@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH v7 04/16] mtd: nand: denali: rework interrupt handling
Date: Tue, 13 Jun 2017 22:45:38 +0900
Message-Id: <1497361550-8115-5-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1497361550-8115-1-git-send-email-yamada.masahiro@socionext.com>
References: <1497361550-8115-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Simplify the interrupt handling and fix issues:

- The register field view of INTR_EN / INTR_STATUS is different
  among IP versions.  The global macro DENALI_IRQ_ALL is hard-coded
  for Intel platforms.  The interrupt mask should be determined at
  run-time depending on the running platform.

- wait_for_irq() loops do {} while() until interested flags are
  asserted.  The logic can be simplified.

- The spin_lock() guard seems too complex (and suspicious in a race
  condition if wait_for_completion_timeout() bails out by timeout).

- denali->complete is reused again and again, but reinit_completion()
  is missing.  Add it.

Re-work the code to make it more robust and easier to handle.

While we are here, also rename the jump label "failed_req_irq" to
more appropriate "disable_irq".

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v7:
  - Add comment "return immediately if the IRQ has already happened"

Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2:
  - Newly added

 drivers/mtd/nand/denali.c | 317 +++++++++++++++++-----------------------------
 drivers/mtd/nand/denali.h |   1 +
 2 files changed, 117 insertions(+), 201 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index ca2b6b8850ba..2acdc5f42a00 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -31,26 +31,13 @@ MODULE_LICENSE("GPL");
 #define DENALI_NAND_NAME    "denali-nand"
 
 /*
- * We define a macro here that combines all interrupts this driver uses into
- * a single constant value, for convenience.
- */
-#define DENALI_IRQ_ALL	(INTR__DMA_CMD_COMP | \
-			INTR__ECC_TRANSACTION_DONE | \
-			INTR__ECC_ERR | \
-			INTR__PROGRAM_FAIL | \
-			INTR__LOAD_COMP | \
-			INTR__PROGRAM_COMP | \
-			INTR__TIME_OUT | \
-			INTR__ERASE_FAIL | \
-			INTR__RST_COMP | \
-			INTR__ERASE_COMP)
-
-/*
  * indicates whether or not the internal value for the flash bank is
  * valid or not
  */
 #define CHIP_SELECT_INVALID	-1
 
+#define DENALI_NR_BANKS		4
+
 /*
  * The bus interface clock, clk_x, is phase aligned with the core clock.  The
  * clk_x is an integral multiple N of the core clk.  The value N is configured
@@ -85,14 +72,6 @@ static inline struct denali_nand_info *mtd_to_denali(struct mtd_info *mtd)
  */
 #define BANK(x) ((x) << 24)
 
-/* forward declarations */
-static void clear_interrupts(struct denali_nand_info *denali);
-static uint32_t wait_for_irq(struct denali_nand_info *denali,
-							uint32_t irq_mask);
-static void denali_irq_enable(struct denali_nand_info *denali,
-							uint32_t int_mask);
-static uint32_t read_interrupt_status(struct denali_nand_info *denali);
-
 /*
  * Certain operations for the denali NAND controller use an indexed mode to
  * read/write data. The operation is performed by writing the address value
@@ -143,22 +122,6 @@ static void read_status(struct denali_nand_info *denali)
 		write_byte_to_buf(denali, 0);
 }
 
-/* resets a specific device connected to the core */
-static void reset_bank(struct denali_nand_info *denali)
-{
-	uint32_t irq_status;
-	uint32_t irq_mask = INTR__RST_COMP | INTR__TIME_OUT;
-
-	clear_interrupts(denali);
-
-	iowrite32(1 << denali->flash_bank, denali->flash_reg + DEVICE_RESET);
-
-	irq_status = wait_for_irq(denali, irq_mask);
-
-	if (irq_status & INTR__TIME_OUT)
-		dev_err(denali->dev, "reset bank failed.\n");
-}
-
 /* Reset the flash controller */
 static uint16_t denali_nand_reset(struct denali_nand_info *denali)
 {
@@ -201,169 +164,124 @@ static void detect_max_banks(struct denali_nand_info *denali)
 		denali->max_banks <<= 1;
 }
 
-static void denali_set_intr_modes(struct denali_nand_info *denali,
-					uint16_t INT_ENABLE)
+static void denali_enable_irq(struct denali_nand_info *denali)
 {
-	if (INT_ENABLE)
-		iowrite32(1, denali->flash_reg + GLOBAL_INT_ENABLE);
-	else
-		iowrite32(0, denali->flash_reg + GLOBAL_INT_ENABLE);
-}
+	int i;
 
-/*
- * validation function to verify that the controlling software is making
- * a valid request
- */
-static inline bool is_flash_bank_valid(int flash_bank)
-{
-	return flash_bank >= 0 && flash_bank < 4;
+	for (i = 0; i < DENALI_NR_BANKS; i++)
+		iowrite32(U32_MAX, denali->flash_reg + INTR_EN(i));
+	iowrite32(GLOBAL_INT_EN_FLAG, denali->flash_reg + GLOBAL_INT_ENABLE);
 }
 
-static void denali_irq_init(struct denali_nand_info *denali)
+static void denali_disable_irq(struct denali_nand_info *denali)
 {
-	uint32_t int_mask;
 	int i;
 
-	/* Disable global interrupts */
-	denali_set_intr_modes(denali, false);
-
-	int_mask = DENALI_IRQ_ALL;
-
-	/* Clear all status bits */
-	for (i = 0; i < denali->max_banks; ++i)
-		iowrite32(0xFFFF, denali->flash_reg + INTR_STATUS(i));
-
-	denali_irq_enable(denali, int_mask);
+	for (i = 0; i < DENALI_NR_BANKS; i++)
+		iowrite32(0, denali->flash_reg + INTR_EN(i));
+	iowrite32(0, denali->flash_reg + GLOBAL_INT_ENABLE);
 }
 
-static void denali_irq_cleanup(int irqnum, struct denali_nand_info *denali)
+static void denali_clear_irq(struct denali_nand_info *denali,
+			     int bank, uint32_t irq_status)
 {
-	denali_set_intr_modes(denali, false);
+	/* write one to clear bits */
+	iowrite32(irq_status, denali->flash_reg + INTR_STATUS(bank));
 }
 
-static void denali_irq_enable(struct denali_nand_info *denali,
-							uint32_t int_mask)
+static void denali_clear_irq_all(struct denali_nand_info *denali)
 {
 	int i;
 
-	for (i = 0; i < denali->max_banks; ++i)
-		iowrite32(int_mask, denali->flash_reg + INTR_EN(i));
+	for (i = 0; i < DENALI_NR_BANKS; i++)
+		denali_clear_irq(denali, i, U32_MAX);
 }
 
-/*
- * This function only returns when an interrupt that this driver cares about
- * occurs. This is to reduce the overhead of servicing interrupts
- */
-static inline uint32_t denali_irq_detected(struct denali_nand_info *denali)
+static irqreturn_t denali_isr(int irq, void *dev_id)
 {
-	return read_interrupt_status(denali) & DENALI_IRQ_ALL;
-}
+	struct denali_nand_info *denali = dev_id;
+	irqreturn_t ret = IRQ_NONE;
+	uint32_t irq_status;
+	int i;
 
-/* Interrupts are cleared by writing a 1 to the appropriate status bit */
-static inline void clear_interrupt(struct denali_nand_info *denali,
-							uint32_t irq_mask)
-{
-	uint32_t intr_status_reg;
+	spin_lock(&denali->irq_lock);
 
-	intr_status_reg = INTR_STATUS(denali->flash_bank);
+	for (i = 0; i < DENALI_NR_BANKS; i++) {
+		irq_status = ioread32(denali->flash_reg + INTR_STATUS(i));
+		if (irq_status)
+			ret = IRQ_HANDLED;
 
-	iowrite32(irq_mask, denali->flash_reg + intr_status_reg);
-}
+		denali_clear_irq(denali, i, irq_status);
 
-static void clear_interrupts(struct denali_nand_info *denali)
-{
-	uint32_t status;
+		if (i != denali->flash_bank)
+			continue;
+
+		denali->irq_status |= irq_status;
 
-	spin_lock_irq(&denali->irq_lock);
+		if (denali->irq_status & denali->irq_mask)
+			complete(&denali->complete);
+	}
 
-	status = read_interrupt_status(denali);
-	clear_interrupt(denali, status);
+	spin_unlock(&denali->irq_lock);
 
-	denali->irq_status = 0x0;
-	spin_unlock_irq(&denali->irq_lock);
+	return ret;
 }
 
-static uint32_t read_interrupt_status(struct denali_nand_info *denali)
+static void denali_reset_irq(struct denali_nand_info *denali)
 {
-	uint32_t intr_status_reg;
-
-	intr_status_reg = INTR_STATUS(denali->flash_bank);
+	unsigned long flags;
 
-	return ioread32(denali->flash_reg + intr_status_reg);
+	spin_lock_irqsave(&denali->irq_lock, flags);
+	denali->irq_status = 0;
+	denali->irq_mask = 0;
+	spin_unlock_irqrestore(&denali->irq_lock, flags);
 }
 
-/*
- * This is the interrupt service routine. It handles all interrupts
- * sent to this device. Note that on CE4100, this is a shared interrupt.
- */
-static irqreturn_t denali_isr(int irq, void *dev_id)
+static uint32_t denali_wait_for_irq(struct denali_nand_info *denali,
+				    uint32_t irq_mask)
 {
-	struct denali_nand_info *denali = dev_id;
+	unsigned long time_left, flags;
 	uint32_t irq_status;
-	irqreturn_t result = IRQ_NONE;
 
-	spin_lock(&denali->irq_lock);
+	spin_lock_irqsave(&denali->irq_lock, flags);
 
-	/* check to see if a valid NAND chip has been selected. */
-	if (is_flash_bank_valid(denali->flash_bank)) {
-		/*
-		 * check to see if controller generated the interrupt,
-		 * since this is a shared interrupt
-		 */
-		irq_status = denali_irq_detected(denali);
-		if (irq_status != 0) {
-			/* handle interrupt */
-			/* first acknowledge it */
-			clear_interrupt(denali, irq_status);
-			/*
-			 * store the status in the device context for someone
-			 * to read
-			 */
-			denali->irq_status |= irq_status;
-			/* notify anyone who cares that it happened */
-			complete(&denali->complete);
-			/* tell the OS that we've handled this */
-			result = IRQ_HANDLED;
-		}
+	irq_status = denali->irq_status;
+
+	if (irq_mask & irq_status) {
+		/* return immediately if the IRQ has already happened. */
+		spin_unlock_irqrestore(&denali->irq_lock, flags);
+		return irq_status;
 	}
-	spin_unlock(&denali->irq_lock);
-	return result;
+
+	denali->irq_mask = irq_mask;
+	reinit_completion(&denali->complete);
+	spin_unlock_irqrestore(&denali->irq_lock, flags);
+
+	time_left = wait_for_completion_timeout(&denali->complete,
+						msecs_to_jiffies(1000));
+	if (!time_left) {
+		dev_err(denali->dev, "timeout while waiting for irq 0x%x\n",
+			denali->irq_mask);
+		return 0;
+	}
+
+	return denali->irq_status;
 }
 
-static uint32_t wait_for_irq(struct denali_nand_info *denali, uint32_t irq_mask)
+/* resets a specific device connected to the core */
+static void reset_bank(struct denali_nand_info *denali)
 {
-	unsigned long comp_res;
-	uint32_t intr_status;
-	unsigned long timeout = msecs_to_jiffies(1000);
+	uint32_t irq_status;
 
-	do {
-		comp_res =
-			wait_for_completion_timeout(&denali->complete, timeout);
-		spin_lock_irq(&denali->irq_lock);
-		intr_status = denali->irq_status;
-
-		if (intr_status & irq_mask) {
-			denali->irq_status &= ~irq_mask;
-			spin_unlock_irq(&denali->irq_lock);
-			/* our interrupt was detected */
-			break;
-		}
+	denali_reset_irq(denali);
 
-		/*
-		 * these are not the interrupts you are looking for -
-		 * need to wait again
-		 */
-		spin_unlock_irq(&denali->irq_lock);
-	} while (comp_res != 0);
+	iowrite32(1 << denali->flash_bank, denali->flash_reg + DEVICE_RESET);
 
-	if (comp_res == 0) {
-		/* timeout */
-		pr_err("timeout occurred, status = 0x%x, mask = 0x%x\n",
-				intr_status, irq_mask);
+	irq_status = denali_wait_for_irq(denali,
+					 INTR__RST_COMP | INTR__TIME_OUT);
 
-		intr_status = 0;
-	}
-	return intr_status;
+	if (!(irq_status & INTR__RST_COMP))
+		dev_err(denali->dev, "reset bank failed.\n");
 }
 
 /*
@@ -397,7 +315,7 @@ static int denali_send_pipeline_cmd(struct denali_nand_info *denali,
 
 	setup_ecc_for_xfer(denali, ecc_en, transfer_spare);
 
-	clear_interrupts(denali);
+	denali_reset_irq(denali);
 
 	addr = BANK(denali->flash_bank) | denali->page;
 
@@ -479,9 +397,9 @@ static int write_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
 		write_data_to_flash_mem(denali, buf, mtd->oobsize);
 
 		/* wait for operation to complete */
-		irq_status = wait_for_irq(denali, irq_mask);
+		irq_status = denali_wait_for_irq(denali, irq_mask);
 
-		if (irq_status == 0) {
+		if (!(irq_status & INTR__PROGRAM_COMP)) {
 			dev_err(denali->dev, "OOB write failed\n");
 			status = -EIO;
 		}
@@ -510,9 +428,9 @@ static void read_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
 		 * can always use status0 bit as the
 		 * mask is identical for each bank.
 		 */
-		irq_status = wait_for_irq(denali, irq_mask);
+		irq_status = denali_wait_for_irq(denali, irq_mask);
 
-		if (irq_status == 0)
+		if (!(irq_status & INTR__LOAD_COMP))
 			dev_err(denali->dev, "page on OOB timeout %d\n",
 					denali->page);
 
@@ -620,9 +538,9 @@ static int denali_sw_ecc_fixup(struct mtd_info *mtd,
 	unsigned int err_byte, err_sector, err_device;
 	uint8_t err_cor_value;
 	unsigned int prev_sector = 0;
+	uint32_t irq_status;
 
-	/* read the ECC errors. we'll ignore them for now */
-	denali_set_intr_modes(denali, false);
+	denali_reset_irq(denali);
 
 	do {
 		err_addr = ioread32(denali->flash_reg + ECC_ERROR_ADDRESS);
@@ -674,10 +592,9 @@ static int denali_sw_ecc_fixup(struct mtd_info *mtd,
 	 * ECC_TRANSACTION_DONE interrupt, so here just wait for
 	 * a while for this interrupt
 	 */
-	while (!(read_interrupt_status(denali) & INTR__ECC_TRANSACTION_DONE))
-		cpu_relax();
-	clear_interrupts(denali);
-	denali_set_intr_modes(denali, true);
+	irq_status = denali_wait_for_irq(denali, INTR__ECC_TRANSACTION_DONE);
+	if (!(irq_status & INTR__ECC_TRANSACTION_DONE))
+		return -EIO;
 
 	return max_bitflips;
 }
@@ -778,15 +695,14 @@ static int write_page(struct mtd_info *mtd, struct nand_chip *chip,
 
 	dma_sync_single_for_device(denali->dev, addr, size, DMA_TO_DEVICE);
 
-	clear_interrupts(denali);
+	denali_reset_irq(denali);
 	denali_enable_dma(denali, true);
 
 	denali_setup_dma(denali, DENALI_WRITE);
 
 	/* wait for operation to complete */
-	irq_status = wait_for_irq(denali, irq_mask);
-
-	if (irq_status == 0) {
+	irq_status = denali_wait_for_irq(denali, irq_mask);
+	if (!(irq_status & INTR__DMA_CMD_COMP)) {
 		dev_err(denali->dev, "timeout on write_page (type = %d)\n",
 			raw_xfer);
 		ret = -EIO;
@@ -865,11 +781,11 @@ static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 	denali_enable_dma(denali, true);
 	dma_sync_single_for_device(denali->dev, addr, size, DMA_FROM_DEVICE);
 
-	clear_interrupts(denali);
+	denali_reset_irq(denali);
 	denali_setup_dma(denali, DENALI_READ);
 
 	/* wait for operation to complete */
-	irq_status = wait_for_irq(denali, irq_mask);
+	irq_status = denali_wait_for_irq(denali, irq_mask);
 
 	dma_sync_single_for_cpu(denali->dev, addr, size, DMA_FROM_DEVICE);
 
@@ -901,6 +817,7 @@ static int denali_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 	dma_addr_t addr = denali->buf.dma_buf;
 	size_t size = mtd->writesize + mtd->oobsize;
 	uint32_t irq_mask = INTR__DMA_CMD_COMP;
+	uint32_t irq_status;
 
 	denali->page = page;
 
@@ -909,11 +826,13 @@ static int denali_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 
 	dma_sync_single_for_device(denali->dev, addr, size, DMA_FROM_DEVICE);
 
-	clear_interrupts(denali);
+	denali_reset_irq(denali);
 	denali_setup_dma(denali, DENALI_READ);
 
 	/* wait for operation to complete */
-	wait_for_irq(denali, irq_mask);
+	irq_status = denali_wait_for_irq(denali, irq_mask);
+	if (irq_status & INTR__DMA_CMD_COMP)
+		return -ETIMEDOUT;
 
 	dma_sync_single_for_cpu(denali->dev, addr, size, DMA_FROM_DEVICE);
 
@@ -940,9 +859,7 @@ static void denali_select_chip(struct mtd_info *mtd, int chip)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
 
-	spin_lock_irq(&denali->irq_lock);
 	denali->flash_bank = chip;
-	spin_unlock_irq(&denali->irq_lock);
 }
 
 static int denali_waitfunc(struct mtd_info *mtd, struct nand_chip *chip)
@@ -953,19 +870,19 @@ static int denali_waitfunc(struct mtd_info *mtd, struct nand_chip *chip)
 static int denali_erase(struct mtd_info *mtd, int page)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
-
 	uint32_t cmd, irq_status;
 
-	clear_interrupts(denali);
+	denali_reset_irq(denali);
 
 	/* setup page read request for access type */
 	cmd = MODE_10 | BANK(denali->flash_bank) | page;
 	index_addr(denali, cmd, 0x1);
 
 	/* wait for erase to complete or failure to occur */
-	irq_status = wait_for_irq(denali, INTR__ERASE_COMP | INTR__ERASE_FAIL);
+	irq_status = denali_wait_for_irq(denali,
+					 INTR__ERASE_COMP | INTR__ERASE_FAIL);
 
-	return irq_status & INTR__ERASE_FAIL ? NAND_STATUS_FAIL : PASS;
+	return irq_status & INTR__ERASE_COMP ? 0 : NAND_STATUS_FAIL;
 }
 
 static void denali_cmdfunc(struct mtd_info *mtd, unsigned int cmd, int col,
@@ -1152,7 +1069,6 @@ static void denali_hw_init(struct denali_nand_info *denali)
 	/* Should set value for these registers when init */
 	iowrite32(0, denali->flash_reg + TWO_ROW_ADDR_CYCLES);
 	iowrite32(1, denali->flash_reg + ECC_ENABLE);
-	denali_irq_init(denali);
 }
 
 int denali_calc_ecc_bytes(int step_size, int strength)
@@ -1264,9 +1180,6 @@ static void denali_drv_init(struct denali_nand_info *denali)
 
 	/* indicate that MTD has not selected a valid bank yet */
 	denali->flash_bank = CHIP_SELECT_INVALID;
-
-	/* initialize our irq_status variable to indicate no interrupts */
-	denali->irq_status = 0;
 }
 
 static int denali_multidev_fixup(struct denali_nand_info *denali)
@@ -1336,6 +1249,8 @@ int denali_init(struct denali_nand_info *denali)
 	denali_hw_init(denali);
 	denali_drv_init(denali);
 
+	denali_clear_irq_all(denali);
+
 	/* Request IRQ after all the hardware initialization is finished */
 	ret = devm_request_irq(denali->dev, denali->irq, denali_isr,
 			       IRQF_SHARED, DENALI_NAND_NAME, denali);
@@ -1344,8 +1259,8 @@ int denali_init(struct denali_nand_info *denali)
 		return ret;
 	}
 
-	/* now that our ISR is registered, we can enable interrupts */
-	denali_set_intr_modes(denali, true);
+	denali_enable_irq(denali);
+
 	nand_set_flash_node(chip, denali->dev->of_node);
 	/* Fallback to the default name if DT did not give "label" property */
 	if (!mtd->name)
@@ -1370,7 +1285,7 @@ int denali_init(struct denali_nand_info *denali)
 	 */
 	ret = nand_scan_ident(mtd, denali->max_banks, NULL);
 	if (ret)
-		goto failed_req_irq;
+		goto disable_irq;
 
 	/* allocate the right size buffer now */
 	devm_kfree(denali->dev, denali->buf.buf);
@@ -1379,7 +1294,7 @@ int denali_init(struct denali_nand_info *denali)
 			     GFP_KERNEL);
 	if (!denali->buf.buf) {
 		ret = -ENOMEM;
-		goto failed_req_irq;
+		goto disable_irq;
 	}
 
 	ret = dma_set_mask(denali->dev,
@@ -1387,7 +1302,7 @@ int denali_init(struct denali_nand_info *denali)
 					64 : 32));
 	if (ret) {
 		dev_err(denali->dev, "No usable DMA configuration\n");
-		goto failed_req_irq;
+		goto disable_irq;
 	}
 
 	denali->buf.dma_buf = dma_map_single(denali->dev, denali->buf.buf,
@@ -1396,7 +1311,7 @@ int denali_init(struct denali_nand_info *denali)
 	if (dma_mapping_error(denali->dev, denali->buf.dma_buf)) {
 		dev_err(denali->dev, "Failed to map DMA buffer\n");
 		ret = -EIO;
-		goto failed_req_irq;
+		goto disable_irq;
 	}
 
 	/*
@@ -1420,7 +1335,7 @@ int denali_init(struct denali_nand_info *denali)
 	ret = denali_ecc_setup(mtd, chip, denali);
 	if (ret) {
 		dev_err(denali->dev, "Failed to setup ECC settings.\n");
-		goto failed_req_irq;
+		goto disable_irq;
 	}
 
 	dev_dbg(denali->dev,
@@ -1454,21 +1369,21 @@ int denali_init(struct denali_nand_info *denali)
 
 	ret = denali_multidev_fixup(denali);
 	if (ret)
-		goto failed_req_irq;
+		goto disable_irq;
 
 	ret = nand_scan_tail(mtd);
 	if (ret)
-		goto failed_req_irq;
+		goto disable_irq;
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(denali->dev, "Failed to register MTD: %d\n", ret);
-		goto failed_req_irq;
+		goto disable_irq;
 	}
 	return 0;
 
-failed_req_irq:
-	denali_irq_cleanup(denali->irq, denali);
+disable_irq:
+	denali_disable_irq(denali);
 
 	return ret;
 }
@@ -1486,7 +1401,7 @@ void denali_remove(struct denali_nand_info *denali)
 	int bufsize = mtd->writesize + mtd->oobsize;
 
 	nand_release(mtd);
-	denali_irq_cleanup(denali->irq, denali);
+	denali_disable_irq(denali);
 	dma_unmap_single(denali->dev, denali->buf.dma_buf, bufsize,
 			 DMA_BIDIRECTIONAL);
 }
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index fb473895a79d..a0ac0f84f8b5 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -325,6 +325,7 @@ struct denali_nand_info {
 	/* elements used by ISR */
 	struct completion complete;
 	spinlock_t irq_lock;
+	uint32_t irq_mask;
 	uint32_t irq_status;
 	int irq;
 
-- 
2.7.4
