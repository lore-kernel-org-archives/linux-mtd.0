Received: from conuserg-11.nifty.com ([210.131.2.78])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cAhNm-00050z-QV
 for linux-mtd@lists.infradead.org; Sat, 26 Nov 2016 18:07:33 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH 14/39] mtd: nand: denali: replace uint{8/16/32}_t with
 u{8/16/32}
Date: Sun, 27 Nov 2016 03:06:00 +0900
Message-Id: <1480183585-592-15-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This will make the code shorter and avoid 80 columns wrap-around
in some places.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/denali.c | 188 ++++++++++++++++++++++------------------------
 drivers/mtd/nand/denali.h |  12 +--
 2 files changed, 95 insertions(+), 105 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 4cc8945..a7dc692 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -104,11 +104,9 @@ static inline struct denali_nand_info *mtd_to_denali(struct mtd_info *mtd)
 
 /* forward declarations */
 static void clear_interrupts(struct denali_nand_info *denali);
-static uint32_t wait_for_irq(struct denali_nand_info *denali,
-							uint32_t irq_mask);
-static void denali_irq_enable(struct denali_nand_info *denali,
-							uint32_t int_mask);
-static uint32_t read_interrupt_status(struct denali_nand_info *denali);
+static u32 wait_for_irq(struct denali_nand_info *denali, u32 irq_mask);
+static void denali_irq_enable(struct denali_nand_info *denali, u32 int_mask);
+static u32 read_interrupt_status(struct denali_nand_info *denali);
 
 /*
  * Certain operations for the denali NAND controller use an indexed mode to
@@ -116,8 +114,7 @@ static uint32_t read_interrupt_status(struct denali_nand_info *denali);
  * of the command to the device memory followed by the data. This function
  * abstracts this common operation.
  */
-static void index_addr(struct denali_nand_info *denali,
-				uint32_t address, uint32_t data)
+static void index_addr(struct denali_nand_info *denali, u32 address, u32 data)
 {
 	iowrite32(address, denali->flash_mem);
 	iowrite32(data, denali->flash_mem + 0x10);
@@ -125,7 +122,7 @@ static void index_addr(struct denali_nand_info *denali,
 
 /* Perform an indexed read of the device */
 static void index_addr_read_data(struct denali_nand_info *denali,
-				 uint32_t address, uint32_t *pdata)
+				 u32 address, u32 *pdata)
 {
 	iowrite32(address, denali->flash_mem);
 	*pdata = ioread32(denali->flash_mem + 0x10);
@@ -140,7 +137,7 @@ static void reset_buf(struct denali_nand_info *denali)
 	denali->buf.head = denali->buf.tail = 0;
 }
 
-static void write_byte_to_buf(struct denali_nand_info *denali, uint8_t byte)
+static void write_byte_to_buf(struct denali_nand_info *denali, u8 byte)
 {
 	denali->buf.buf[denali->buf.tail++] = byte;
 }
@@ -148,7 +145,7 @@ static void write_byte_to_buf(struct denali_nand_info *denali, uint8_t byte)
 /* reads the status of the device */
 static void read_status(struct denali_nand_info *denali)
 {
-	uint32_t cmd;
+	u32 cmd;
 
 	/* initialize the data buffer to store status */
 	reset_buf(denali);
@@ -163,8 +160,8 @@ static void read_status(struct denali_nand_info *denali)
 /* resets a specific device connected to the core */
 static void reset_bank(struct denali_nand_info *denali)
 {
-	uint32_t irq_status;
-	uint32_t irq_mask = INTR_STATUS__RST_COMP | INTR_STATUS__TIME_OUT;
+	u32 irq_status;
+	u32 irq_mask = INTR_STATUS__RST_COMP | INTR_STATUS__TIME_OUT;
 
 	clear_interrupts(denali);
 
@@ -177,7 +174,7 @@ static void reset_bank(struct denali_nand_info *denali)
 }
 
 /* Reset the flash controller */
-static uint16_t denali_nand_reset(struct denali_nand_info *denali)
+static u16 denali_nand_reset(struct denali_nand_info *denali)
 {
 	int i;
 
@@ -208,27 +205,26 @@ static uint16_t denali_nand_reset(struct denali_nand_info *denali)
  * programs the clocking register accordingly. The mode is determined by
  * the get_onfi_nand_para routine.
  */
-static void nand_onfi_timing_set(struct denali_nand_info *denali,
-								uint16_t mode)
+static void nand_onfi_timing_set(struct denali_nand_info *denali, u16 mode)
 {
-	uint16_t Trea[6] = {40, 30, 25, 20, 20, 16};
-	uint16_t Trp[6] = {50, 25, 17, 15, 12, 10};
-	uint16_t Treh[6] = {30, 15, 15, 10, 10, 7};
-	uint16_t Trc[6] = {100, 50, 35, 30, 25, 20};
-	uint16_t Trhoh[6] = {0, 15, 15, 15, 15, 15};
-	uint16_t Trloh[6] = {0, 0, 0, 0, 5, 5};
-	uint16_t Tcea[6] = {100, 45, 30, 25, 25, 25};
-	uint16_t Tadl[6] = {200, 100, 100, 100, 70, 70};
-	uint16_t Trhw[6] = {200, 100, 100, 100, 100, 100};
-	uint16_t Trhz[6] = {200, 100, 100, 100, 100, 100};
-	uint16_t Twhr[6] = {120, 80, 80, 60, 60, 60};
-	uint16_t Tcs[6] = {70, 35, 25, 25, 20, 15};
-
-	uint16_t data_invalid_rhoh, data_invalid_rloh, data_invalid;
-	uint16_t dv_window = 0;
-	uint16_t en_lo, en_hi;
-	uint16_t acc_clks;
-	uint16_t addr_2_data, re_2_we, re_2_re, we_2_re, cs_cnt;
+	u16 Trea[6] = {40, 30, 25, 20, 20, 16};
+	u16 Trp[6] = {50, 25, 17, 15, 12, 10};
+	u16 Treh[6] = {30, 15, 15, 10, 10, 7};
+	u16 Trc[6] = {100, 50, 35, 30, 25, 20};
+	u16 Trhoh[6] = {0, 15, 15, 15, 15, 15};
+	u16 Trloh[6] = {0, 0, 0, 0, 5, 5};
+	u16 Tcea[6] = {100, 45, 30, 25, 25, 25};
+	u16 Tadl[6] = {200, 100, 100, 100, 70, 70};
+	u16 Trhw[6] = {200, 100, 100, 100, 100, 100};
+	u16 Trhz[6] = {200, 100, 100, 100, 100, 100};
+	u16 Twhr[6] = {120, 80, 80, 60, 60, 60};
+	u16 Tcs[6] = {70, 35, 25, 25, 20, 15};
+
+	u16 data_invalid_rhoh, data_invalid_rloh, data_invalid;
+	u16 dv_window = 0;
+	u16 en_lo, en_hi;
+	u16 acc_clks;
+	u16 addr_2_data, re_2_we, re_2_re, we_2_re, cs_cnt;
 
 	en_lo = CEIL_DIV(Trp[mode], CLK_X);
 	en_hi = CEIL_DIV(Treh[mode], CLK_X);
@@ -300,7 +296,7 @@ static void nand_onfi_timing_set(struct denali_nand_info *denali,
 }
 
 /* queries the NAND device to see what ONFI modes it supports. */
-static uint16_t get_onfi_nand_para(struct denali_nand_info *denali)
+static u16 get_onfi_nand_para(struct denali_nand_info *denali)
 {
 	int i;
 
@@ -330,8 +326,7 @@ static uint16_t get_onfi_nand_para(struct denali_nand_info *denali)
 	return PASS;
 }
 
-static void get_samsung_nand_para(struct denali_nand_info *denali,
-							uint8_t device_id)
+static void get_samsung_nand_para(struct denali_nand_info *denali, u8 device_id)
 {
 	if (device_id == 0xd3) { /* Samsung K9WAG08U1A */
 		/* Set timing register values according to datasheet */
@@ -347,7 +342,7 @@ static void get_samsung_nand_para(struct denali_nand_info *denali,
 
 static void get_toshiba_nand_para(struct denali_nand_info *denali)
 {
-	uint32_t tmp;
+	u32 tmp;
 
 	/*
 	 * Workaround to fix a controller bug which reports a wrong
@@ -368,10 +363,9 @@ static void get_toshiba_nand_para(struct denali_nand_info *denali)
 	}
 }
 
-static void get_hynix_nand_para(struct denali_nand_info *denali,
-							uint8_t device_id)
+static void get_hynix_nand_para(struct denali_nand_info *denali, u8 device_id)
 {
-	uint32_t main_size, spare_size;
+	u32 main_size, spare_size;
 
 	switch (device_id) {
 	case 0xD5: /* Hynix H27UAG8T2A, H27UBG8U5A or H27UCG8VFA */
@@ -408,7 +402,7 @@ static void get_hynix_nand_para(struct denali_nand_info *denali,
  */
 static void find_valid_banks(struct denali_nand_info *denali)
 {
-	uint32_t id[denali->max_banks];
+	u32 id[denali->max_banks];
 	int i;
 
 	denali->total_used_banks = 1;
@@ -453,7 +447,7 @@ static void find_valid_banks(struct denali_nand_info *denali)
  */
 static void detect_max_banks(struct denali_nand_info *denali)
 {
-	uint32_t features = ioread32(denali->flash_reg + FEATURES);
+	u32 features = ioread32(denali->flash_reg + FEATURES);
 	/*
 	 * Read the revision register, so we can calculate the max_banks
 	 * properly: the encoding changed from rev 5.0 to 5.1
@@ -467,11 +461,11 @@ static void detect_max_banks(struct denali_nand_info *denali)
 		denali->max_banks = 1 << (features & FEATURES__N_BANKS);
 }
 
-static uint16_t denali_nand_timing_set(struct denali_nand_info *denali)
+static u16 denali_nand_timing_set(struct denali_nand_info *denali)
 {
-	uint16_t status = PASS;
-	uint32_t id_bytes[8], addr;
-	uint8_t maf_id, device_id;
+	u16 status = PASS;
+	u32 id_bytes[8], addr;
+	u8 maf_id, device_id;
 	int i;
 
 	/*
@@ -526,7 +520,7 @@ static uint16_t denali_nand_timing_set(struct denali_nand_info *denali)
 }
 
 static void denali_set_intr_modes(struct denali_nand_info *denali,
-					uint16_t INT_ENABLE)
+				  u16 INT_ENABLE)
 {
 	if (INT_ENABLE)
 		iowrite32(1, denali->flash_reg + GLOBAL_INT_ENABLE);
@@ -545,7 +539,7 @@ static inline bool is_flash_bank_valid(int flash_bank)
 
 static void denali_irq_init(struct denali_nand_info *denali)
 {
-	uint32_t int_mask;
+	u32 int_mask;
 	int i;
 
 	/* Disable global interrupts */
@@ -565,8 +559,7 @@ static void denali_irq_cleanup(int irqnum, struct denali_nand_info *denali)
 	denali_set_intr_modes(denali, false);
 }
 
-static void denali_irq_enable(struct denali_nand_info *denali,
-							uint32_t int_mask)
+static void denali_irq_enable(struct denali_nand_info *denali, u32 int_mask)
 {
 	int i;
 
@@ -578,16 +571,16 @@ static void denali_irq_enable(struct denali_nand_info *denali,
  * This function only returns when an interrupt that this driver cares about
  * occurs. This is to reduce the overhead of servicing interrupts
  */
-static inline uint32_t denali_irq_detected(struct denali_nand_info *denali)
+static inline u32 denali_irq_detected(struct denali_nand_info *denali)
 {
 	return read_interrupt_status(denali) & DENALI_IRQ_ALL;
 }
 
 /* Interrupts are cleared by writing a 1 to the appropriate status bit */
 static inline void clear_interrupt(struct denali_nand_info *denali,
-							uint32_t irq_mask)
+				   u32 irq_mask)
 {
-	uint32_t intr_status_reg;
+	u32 intr_status_reg;
 
 	intr_status_reg = INTR_STATUS(denali->flash_bank);
 
@@ -596,7 +589,7 @@ static inline void clear_interrupt(struct denali_nand_info *denali,
 
 static void clear_interrupts(struct denali_nand_info *denali)
 {
-	uint32_t status;
+	u32 status;
 
 	spin_lock_irq(&denali->irq_lock);
 
@@ -607,9 +600,9 @@ static void clear_interrupts(struct denali_nand_info *denali)
 	spin_unlock_irq(&denali->irq_lock);
 }
 
-static uint32_t read_interrupt_status(struct denali_nand_info *denali)
+static u32 read_interrupt_status(struct denali_nand_info *denali)
 {
-	uint32_t intr_status_reg;
+	u32 intr_status_reg;
 
 	intr_status_reg = INTR_STATUS(denali->flash_bank);
 
@@ -623,7 +616,7 @@ static uint32_t read_interrupt_status(struct denali_nand_info *denali)
 static irqreturn_t denali_isr(int irq, void *dev_id)
 {
 	struct denali_nand_info *denali = dev_id;
-	uint32_t irq_status;
+	u32 irq_status;
 	irqreturn_t result = IRQ_NONE;
 
 	spin_lock(&denali->irq_lock);
@@ -654,10 +647,10 @@ static irqreturn_t denali_isr(int irq, void *dev_id)
 	return result;
 }
 
-static uint32_t wait_for_irq(struct denali_nand_info *denali, uint32_t irq_mask)
+static u32 wait_for_irq(struct denali_nand_info *denali, u32 irq_mask)
 {
 	unsigned long comp_res;
-	uint32_t intr_status;
+	u32 intr_status;
 	unsigned long timeout = msecs_to_jiffies(1000);
 
 	do {
@@ -717,8 +710,8 @@ static int denali_send_pipeline_cmd(struct denali_nand_info *denali,
 				    int access_type, int op)
 {
 	int status = PASS;
-	uint32_t page_count = 1;
-	uint32_t addr, cmd, irq_status, irq_mask;
+	u32 page_count = 1;
+	u32 addr, cmd, irq_status, irq_mask;
 
 	if (op == DENALI_READ)
 		irq_mask = INTR_STATUS__LOAD_COMP;
@@ -783,9 +776,9 @@ static int denali_send_pipeline_cmd(struct denali_nand_info *denali,
 
 /* helper function that simply writes a buffer to the flash */
 static int write_data_to_flash_mem(struct denali_nand_info *denali,
-				   const uint8_t *buf, int len)
+				   const u8 *buf, int len)
 {
-	uint32_t *buf32;
+	u32 *buf32;
 	int i;
 
 	/*
@@ -795,7 +788,7 @@ static int write_data_to_flash_mem(struct denali_nand_info *denali,
 	BUG_ON((len % 4) != 0);
 
 	/* write the data to the flash memory */
-	buf32 = (uint32_t *)buf;
+	buf32 = (u32 *)buf;
 	for (i = 0; i < len / 4; i++)
 		iowrite32(*buf32++, denali->flash_mem + 0x10);
 	return i * 4; /* intent is to return the number of bytes read */
@@ -803,9 +796,9 @@ static int write_data_to_flash_mem(struct denali_nand_info *denali,
 
 /* helper function that simply reads a buffer from the flash */
 static int read_data_from_flash_mem(struct denali_nand_info *denali,
-				    uint8_t *buf, int len)
+				    u8 *buf, int len)
 {
-	uint32_t *buf32;
+	u32 *buf32;
 	int i;
 
 	/*
@@ -817,19 +810,18 @@ static int read_data_from_flash_mem(struct denali_nand_info *denali,
 	BUG_ON((len % 4) != 0);
 
 	/* transfer the data from the flash */
-	buf32 = (uint32_t *)buf;
+	buf32 = (u32 *)buf;
 	for (i = 0; i < len / 4; i++)
 		*buf32++ = ioread32(denali->flash_mem + 0x10);
 	return i * 4; /* intent is to return the number of bytes read */
 }
 
 /* writes OOB data to the device */
-static int write_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
+static int write_oob_data(struct mtd_info *mtd, u8 *buf, int page)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
-	uint32_t irq_status;
-	uint32_t irq_mask = INTR_STATUS__PROGRAM_COMP |
-						INTR_STATUS__PROGRAM_FAIL;
+	u32 irq_status;
+	u32 irq_mask = INTR_STATUS__PROGRAM_COMP | INTR_STATUS__PROGRAM_FAIL;
 	int status = 0;
 
 	denali->page = page;
@@ -853,11 +845,11 @@ static int write_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
 }
 
 /* reads OOB data from the device */
-static void read_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
+static void read_oob_data(struct mtd_info *mtd, u8 *buf, int page)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
-	uint32_t irq_mask = INTR_STATUS__LOAD_COMP;
-	uint32_t irq_status, addr, cmd;
+	u32 irq_mask = INTR_STATUS__LOAD_COMP;
+	u32 irq_status, addr, cmd;
 
 	denali->page = page;
 
@@ -893,7 +885,7 @@ static void read_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
  * this function examines buffers to see if they contain data that
  * indicate that the buffer is part of an erased region of flash.
  */
-static bool is_erased(uint8_t *buf, int len)
+static bool is_erased(u8 *buf, int len)
 {
 	int i;
 
@@ -911,16 +903,16 @@ static bool is_erased(uint8_t *buf, int len)
 #define ECC_ERR_DEVICE(x)	(((x) & ERR_CORRECTION_INFO__DEVICE_NR) >> 8)
 #define ECC_LAST_ERR(x)		((x) & ERR_CORRECTION_INFO__LAST_ERR_INFO)
 
-static bool handle_ecc(struct denali_nand_info *denali, uint8_t *buf,
-		       uint32_t irq_status, unsigned int *max_bitflips)
+static bool handle_ecc(struct denali_nand_info *denali, u8 *buf,
+		       u32 irq_status, unsigned int *max_bitflips)
 {
 	bool check_erased_page = false;
 	unsigned int bitflips = 0;
 
 	if (irq_status & INTR_STATUS__ECC_ERR) {
 		/* read the ECC errors. we'll ignore them for now */
-		uint32_t err_address, err_correction_info, err_byte,
-			 err_sector, err_device, err_correction_value;
+		u32 err_address, err_correction_info, err_byte,
+			err_sector, err_device, err_correction_value;
 		denali_set_intr_modes(denali, false);
 
 		do {
@@ -993,9 +985,9 @@ static void denali_enable_dma(struct denali_nand_info *denali, bool en)
 /* setups the HW to perform the data DMA */
 static void denali_setup_dma(struct denali_nand_info *denali, int op)
 {
-	uint32_t mode;
+	u32 mode;
 	const int page_count = 1;
-	uint32_t addr = denali->buf.dma_buf;
+	u32 addr = denali->buf.dma_buf;
 
 	mode = MODE_10 | BANK(denali->flash_bank);
 
@@ -1019,14 +1011,13 @@ static void denali_setup_dma(struct denali_nand_info *denali, int op)
  * configuration details.
  */
 static int write_page(struct mtd_info *mtd, struct nand_chip *chip,
-			const uint8_t *buf, bool raw_xfer)
+			const u8 *buf, bool raw_xfer)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
 	dma_addr_t addr = denali->buf.dma_buf;
 	size_t size = mtd->writesize + mtd->oobsize;
-	uint32_t irq_status;
-	uint32_t irq_mask = INTR_STATUS__DMA_CMD_COMP |
-						INTR_STATUS__PROGRAM_FAIL;
+	u32 irq_status;
+	u32 irq_mask = INTR_STATUS__DMA_CMD_COMP | INTR_STATUS__PROGRAM_FAIL;
 
 	/*
 	 * if it is a raw xfer, we want to disable ecc and send the spare area.
@@ -1075,7 +1066,7 @@ static int write_page(struct mtd_info *mtd, struct nand_chip *chip,
  * by write_page above.
  */
 static int denali_write_page(struct mtd_info *mtd, struct nand_chip *chip,
-				const uint8_t *buf, int oob_required, int page)
+				const u8 *buf, int oob_required, int page)
 {
 	/*
 	 * for regular page writes, we let HW handle all the ECC
@@ -1090,7 +1081,7 @@ static int denali_write_page(struct mtd_info *mtd, struct nand_chip *chip,
  * write_page() function above.
  */
 static int denali_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
-				 const uint8_t *buf, int oob_required,
+				 const u8 *buf, int oob_required,
 				 int page)
 {
 	/*
@@ -1115,7 +1106,7 @@ static int denali_read_oob(struct mtd_info *mtd, struct nand_chip *chip,
 }
 
 static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
-			    uint8_t *buf, int oob_required, int page)
+			    u8 *buf, int oob_required, int page)
 {
 	unsigned int max_bitflips;
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
@@ -1123,9 +1114,8 @@ static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 	dma_addr_t addr = denali->buf.dma_buf;
 	size_t size = mtd->writesize + mtd->oobsize;
 
-	uint32_t irq_status;
-	uint32_t irq_mask = INTR_STATUS__ECC_TRANSACTION_DONE |
-			    INTR_STATUS__ECC_ERR;
+	u32 irq_status;
+	u32 irq_mask = INTR_STATUS__ECC_TRANSACTION_DONE | INTR_STATUS__ECC_ERR;
 	bool check_erased_page = false;
 
 	if (page != denali->page) {
@@ -1169,12 +1159,12 @@ static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 }
 
 static int denali_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
-				uint8_t *buf, int oob_required, int page)
+				u8 *buf, int oob_required, int page)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
 	dma_addr_t addr = denali->buf.dma_buf;
 	size_t size = mtd->writesize + mtd->oobsize;
-	uint32_t irq_mask = INTR_STATUS__DMA_CMD_COMP;
+	u32 irq_mask = INTR_STATUS__DMA_CMD_COMP;
 
 	if (page != denali->page) {
 		dev_err(denali->dev,
@@ -1206,10 +1196,10 @@ static int denali_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 	return 0;
 }
 
-static uint8_t denali_read_byte(struct mtd_info *mtd)
+static u8 denali_read_byte(struct mtd_info *mtd)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
-	uint8_t result = 0xff;
+	u8 result = 0xff;
 
 	if (denali->buf.head < denali->buf.tail)
 		result = denali->buf.buf[denali->buf.head++];
@@ -1240,7 +1230,7 @@ static int denali_erase(struct mtd_info *mtd, int page)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
 
-	uint32_t cmd, irq_status;
+	u32 cmd, irq_status;
 
 	clear_interrupts(denali);
 
@@ -1259,7 +1249,7 @@ static void denali_cmdfunc(struct mtd_info *mtd, unsigned int cmd, int col,
 			   int page)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
-	uint32_t addr, id;
+	u32 addr, id;
 	int i;
 
 	switch (cmd) {
@@ -1370,8 +1360,8 @@ static const struct mtd_ooblayout_ops denali_ooblayout_ops = {
 	.free = denali_ooblayout_free,
 };
 
-static uint8_t bbt_pattern[] = {'B', 'b', 't', '0' };
-static uint8_t mirror_pattern[] = {'1', 't', 'b', 'B' };
+static u8 bbt_pattern[] = {'B', 'b', 't', '0' };
+static u8 mirror_pattern[] = {'1', 't', 'b', 'B' };
 
 static struct nand_bbt_descr bbt_main_descr = {
 	.options = NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index 95ed32e..69314d0 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -391,7 +391,7 @@
 struct nand_buf {
 	int head;
 	int tail;
-	uint8_t *buf;
+	u8 *buf;
 	dma_addr_t dma_buf;
 };
 
@@ -407,19 +407,19 @@ struct denali_nand_info {
 	struct nand_buf buf;
 	struct device *dev;
 	int total_used_banks;
-	uint16_t page;
+	u16 page;
 	void __iomem *flash_reg;	/* Register Interface */
 	void __iomem *flash_mem;	/* Host Data/Command Interface */
 
 	/* elements used by ISR */
 	struct completion complete;
 	spinlock_t irq_lock;
-	uint32_t irq_status;
+	u32 irq_status;
 	int irq;
 
-	uint32_t devnum;	/* represent how many nands connected */
-	uint32_t bbtskipbytes;
-	uint32_t max_banks;
+	u32 devnum;	/* represent how many nands connected */
+	u32 bbtskipbytes;
+	u32 max_banks;
 	unsigned int caps;
 };
 
-- 
2.7.4
