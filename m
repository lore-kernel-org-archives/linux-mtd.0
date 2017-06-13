Received: from conuserg-09.nifty.com ([210.131.2.76])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dKe1N-0007E1-QC
 for linux-mtd@lists.infradead.org; Tue, 13 Jun 2017 05:05:49 +0000
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
Subject: [PATCH v6 18/18] mtd: nand: denali: avoid magic numbers and rename
 for clarification
Date: Tue, 13 Jun 2017 14:04:10 +0900
Message-Id: <1497330250-17348-19-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1497330250-17348-1-git-send-email-yamada.masahiro@socionext.com>
References: <1497330250-17348-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Introduce some macros and helpers to avoid magic numbers and
rename macros/functions for clarification.

- We see '| 2' in several places.  This means Data Cycle in MAP11 mode.
  The Denali User's Guide says bit[1:0] of MAP11 is like follows:

  b'00 = Command Cycle
  b'01 = Address Cycle
  b'10 = Data Cycle

  So, this commit added DENALI_MAP11_{CMD,ADDR,DATA} macros.

- We see 'denali->flash_mem + 0x10' in several places, but 0x10 is a
  magic number.  Actually, this accesses the data port of the Host
  Data/Command Interface.  So, this commit added DENALI_HOST_DATA.
  On the other hand, 'denali->flash_mem' gets access to the address
  port, so DENALI_HOST_ADDR was also added.

- We see 'index_addr(denali, cmd, 0x1)' in denali_erase(), but 0x1
  is a magic number.  0x1 means the erase operation.  Replace 0x1
  with DENALI_ERASE.

- Rename index_addr() to denali_host_write() for clarification and
  add denali_host_read() as a helper.

- Denali User's Guide says MAP{00,01,10,11} for access mode.  Match
  the macros with terminology in the IP document.

- Rename struct members as follows:
  flash_bank   -> active_bank    (currently selected bank)
  flash_reg    -> reg            (base address of registers)
  flash_mem    -> host           (base address of host interface)
  devnum       -> devs_per_cs    (devices connected in parallel)
  bbtskipbytes -> oob_skip_bytes (number of bytes to skip in OOB)

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v6:
  - Newly added

Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 drivers/mtd/nand/denali.c     | 259 ++++++++++++++++++++++--------------------
 drivers/mtd/nand/denali.h     |  15 +--
 drivers/mtd/nand/denali_dt.c  |  12 +-
 drivers/mtd/nand/denali_pci.c |  16 +--
 4 files changed, 153 insertions(+), 149 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 3bcc886579c8..6aa78ca2439b 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -31,12 +31,26 @@ MODULE_LICENSE("GPL");
 
 #define DENALI_NAND_NAME    "denali-nand"
 
-/*
- * indicates whether or not the internal value for the flash bank is
- * valid or not
- */
-#define CHIP_SELECT_INVALID	-1
+/* Host Data/Command Interface */
+#define DENALI_HOST_ADDR	0x00
+#define DENALI_HOST_DATA	0x10
+
+#define DENALI_MAP00		(0 << 26)	/* direct access to buffer */
+#define DENALI_MAP01		(1 << 26)	/* read/write pages in PIO */
+#define DENALI_MAP10		(2 << 26)	/* higher-level control plane */
+#define DENALI_MAP11		(3 << 26)	/* direct controller access */
+
+/* MAP11 access cycle type */
+#define DENALI_MAP11_CMD	((DENALI_MAP11) | 0)	/* command cycle */
+#define DENALI_MAP11_ADDR	((DENALI_MAP11) | 1)	/* address cycle */
+#define DENALI_MAP11_DATA	((DENALI_MAP11) | 2)	/* data cycle */
 
+/* MAP11 commands */
+#define DENALI_ERASE		0x01
+
+#define DENALI_BANK(denali)	((denali)->active_bank << 24)
+
+#define DENALI_INVALID_BANK	-1
 #define DENALI_NR_BANKS		4
 
 /*
@@ -56,23 +70,17 @@ static inline struct denali_nand_info *mtd_to_denali(struct mtd_info *mtd)
 	return container_of(mtd_to_nand(mtd), struct denali_nand_info, nand);
 }
 
-/*
- * this is a helper macro that allows us to
- * format the bank into the proper bits for the controller
- */
-#define BANK(x) ((x) << 24)
+static uint32_t denali_host_read(struct denali_nand_info *denali, uint32_t addr)
+{
+	iowrite32(addr, denali->host + DENALI_HOST_ADDR);
+	return ioread32(denali->host + DENALI_HOST_DATA);
+}
 
-/*
- * Certain operations for the denali NAND controller use an indexed mode to
- * read/write data. The operation is performed by writing the address value
- * of the command to the device memory followed by the data. This function
- * abstracts this common operation.
- */
-static void index_addr(struct denali_nand_info *denali,
-				uint32_t address, uint32_t data)
+static void denali_host_write(struct denali_nand_info *denali,
+			      uint32_t addr, uint32_t data)
 {
-	iowrite32(address, denali->flash_mem);
-	iowrite32(data, denali->flash_mem + 0x10);
+	iowrite32(addr, denali->host + DENALI_HOST_ADDR);
+	iowrite32(data, denali->host + DENALI_HOST_DATA);
 }
 
 /*
@@ -81,7 +89,7 @@ static void index_addr(struct denali_nand_info *denali,
  */
 static void detect_max_banks(struct denali_nand_info *denali)
 {
-	uint32_t features = ioread32(denali->flash_reg + FEATURES);
+	uint32_t features = ioread32(denali->reg + FEATURES);
 
 	denali->max_banks = 1 << (features & FEATURES__N_BANKS);
 
@@ -95,8 +103,8 @@ static void denali_enable_irq(struct denali_nand_info *denali)
 	int i;
 
 	for (i = 0; i < DENALI_NR_BANKS; i++)
-		iowrite32(U32_MAX, denali->flash_reg + INTR_EN(i));
-	iowrite32(GLOBAL_INT_EN_FLAG, denali->flash_reg + GLOBAL_INT_ENABLE);
+		iowrite32(U32_MAX, denali->reg + INTR_EN(i));
+	iowrite32(GLOBAL_INT_EN_FLAG, denali->reg + GLOBAL_INT_ENABLE);
 }
 
 static void denali_disable_irq(struct denali_nand_info *denali)
@@ -104,15 +112,15 @@ static void denali_disable_irq(struct denali_nand_info *denali)
 	int i;
 
 	for (i = 0; i < DENALI_NR_BANKS; i++)
-		iowrite32(0, denali->flash_reg + INTR_EN(i));
-	iowrite32(0, denali->flash_reg + GLOBAL_INT_ENABLE);
+		iowrite32(0, denali->reg + INTR_EN(i));
+	iowrite32(0, denali->reg + GLOBAL_INT_ENABLE);
 }
 
 static void denali_clear_irq(struct denali_nand_info *denali,
 			     int bank, uint32_t irq_status)
 {
 	/* write one to clear bits */
-	iowrite32(irq_status, denali->flash_reg + INTR_STATUS(bank));
+	iowrite32(irq_status, denali->reg + INTR_STATUS(bank));
 }
 
 static void denali_clear_irq_all(struct denali_nand_info *denali)
@@ -133,13 +141,13 @@ static irqreturn_t denali_isr(int irq, void *dev_id)
 	spin_lock(&denali->irq_lock);
 
 	for (i = 0; i < DENALI_NR_BANKS; i++) {
-		irq_status = ioread32(denali->flash_reg + INTR_STATUS(i));
+		irq_status = ioread32(denali->reg + INTR_STATUS(i));
 		if (irq_status)
 			ret = IRQ_HANDLED;
 
 		denali_clear_irq(denali, i, irq_status);
 
-		if (i != denali->flash_bank)
+		if (i != denali->active_bank)
 			continue;
 
 		denali->irq_status |= irq_status;
@@ -219,24 +227,24 @@ static void setup_ecc_for_xfer(struct denali_nand_info *denali, bool ecc_en,
 	transfer_spare_flag = transfer_spare ? TRANSFER_SPARE_REG__FLAG : 0;
 
 	/* Enable spare area/ECC per user's request. */
-	iowrite32(ecc_en_flag, denali->flash_reg + ECC_ENABLE);
-	iowrite32(transfer_spare_flag, denali->flash_reg + TRANSFER_SPARE_REG);
+	iowrite32(ecc_en_flag, denali->reg + ECC_ENABLE);
+	iowrite32(transfer_spare_flag, denali->reg + TRANSFER_SPARE_REG);
 }
 
 static uint8_t denali_read_byte(struct mtd_info *mtd)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
 
-	iowrite32(MODE_11 | BANK(denali->flash_bank) | 2, denali->flash_mem);
-
-	return ioread32(denali->flash_mem + 0x10);
+	return denali_host_read(denali,
+				DENALI_MAP11_DATA | DENALI_BANK(denali));
 }
 
 static void denali_write_byte(struct mtd_info *mtd, uint8_t byte)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
 
-	index_addr(denali, MODE_11 | BANK(denali->flash_bank) | 2, byte);
+	denali_host_write(denali, DENALI_MAP11_DATA | DENALI_BANK(denali),
+			  byte);
 }
 
 static void denali_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
@@ -244,10 +252,11 @@ static void denali_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
 	int i;
 
-	iowrite32(MODE_11 | BANK(denali->flash_bank) | 2, denali->flash_mem);
+	iowrite32(DENALI_MAP11_DATA | DENALI_BANK(denali),
+		  denali->host + DENALI_HOST_ADDR);
 
 	for (i = 0; i < len; i++)
-		buf[i] = ioread32(denali->flash_mem + 0x10);
+		buf[i] = ioread32(denali->host + DENALI_HOST_DATA);
 }
 
 static void denali_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
@@ -255,10 +264,11 @@ static void denali_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
 	int i;
 
-	iowrite32(MODE_11 | BANK(denali->flash_bank) | 2, denali->flash_mem);
+	iowrite32(DENALI_MAP11_DATA | DENALI_BANK(denali),
+		  denali->host + DENALI_HOST_ADDR);
 
 	for (i = 0; i < len; i++)
-		iowrite32(buf[i], denali->flash_mem + 0x10);
+		iowrite32(buf[i], denali->host + DENALI_HOST_DATA);
 }
 
 static void denali_read_buf16(struct mtd_info *mtd, uint8_t *buf, int len)
@@ -267,10 +277,11 @@ static void denali_read_buf16(struct mtd_info *mtd, uint8_t *buf, int len)
 	uint16_t *buf16 = (uint16_t *)buf;
 	int i;
 
-	iowrite32(MODE_11 | BANK(denali->flash_bank) | 2, denali->flash_mem);
+	iowrite32(DENALI_MAP11_DATA | DENALI_BANK(denali),
+		  denali->host + DENALI_HOST_ADDR);
 
 	for (i = 0; i < len / 2; i++)
-		buf16[i] = ioread32(denali->flash_mem + 0x10);
+		buf16[i] = ioread32(denali->host + DENALI_HOST_DATA);
 }
 
 static void denali_write_buf16(struct mtd_info *mtd, const uint8_t *buf,
@@ -280,10 +291,11 @@ static void denali_write_buf16(struct mtd_info *mtd, const uint8_t *buf,
 	const uint16_t *buf16 = (const uint16_t *)buf;
 	int i;
 
-	iowrite32(MODE_11 | BANK(denali->flash_bank) | 2, denali->flash_mem);
+	iowrite32(DENALI_MAP11_DATA | DENALI_BANK(denali),
+		  denali->host + DENALI_HOST_ADDR);
 
 	for (i = 0; i < len / 2; i++)
-		iowrite32(buf16[i], denali->flash_mem + 0x10);
+		iowrite32(buf16[i], denali->host + DENALI_HOST_DATA);
 }
 
 static void denali_cmd_ctrl(struct mtd_info *mtd, int dat, unsigned int ctrl)
@@ -292,9 +304,9 @@ static void denali_cmd_ctrl(struct mtd_info *mtd, int dat, unsigned int ctrl)
 	uint32_t type;
 
 	if (ctrl & NAND_CLE)
-		type = 0;
+		type = DENALI_MAP11_CMD;
 	else if (ctrl & NAND_ALE)
-		type = 1;
+		type = DENALI_MAP11_ADDR;
 	else
 		return;
 
@@ -305,7 +317,7 @@ static void denali_cmd_ctrl(struct mtd_info *mtd, int dat, unsigned int ctrl)
 	if (ctrl & NAND_CTRL_CHANGE)
 		denali_reset_irq(denali);
 
-	index_addr(denali, MODE_11 | BANK(denali->flash_bank) | type, dat);
+	denali_host_write(denali, DENALI_BANK(denali) | type, dat);
 }
 
 static int denali_dev_ready(struct mtd_info *mtd)
@@ -358,11 +370,11 @@ static int denali_hw_ecc_fixup(struct mtd_info *mtd,
 			       unsigned long *uncor_ecc_flags)
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
-	int bank = denali->flash_bank;
+	int bank = denali->active_bank;
 	uint32_t ecc_cor;
 	unsigned int max_bitflips;
 
-	ecc_cor = ioread32(denali->flash_reg + ECC_COR_INFO(bank));
+	ecc_cor = ioread32(denali->reg + ECC_COR_INFO(bank));
 	ecc_cor >>= ECC_COR_INFO__SHIFT(bank);
 
 	if (ecc_cor & ECC_COR_INFO__UNCOR_ERR) {
@@ -411,11 +423,11 @@ static int denali_sw_ecc_fixup(struct mtd_info *mtd,
 	denali_reset_irq(denali);
 
 	do {
-		err_addr = ioread32(denali->flash_reg + ECC_ERROR_ADDRESS);
+		err_addr = ioread32(denali->reg + ECC_ERROR_ADDRESS);
 		err_sector = ECC_SECTOR(err_addr);
 		err_byte = ECC_BYTE(err_addr);
 
-		err_cor_info = ioread32(denali->flash_reg + ERR_CORRECTION_INFO);
+		err_cor_info = ioread32(denali->reg + ERR_CORRECTION_INFO);
 		err_cor_value = ECC_CORRECTION_VALUE(err_cor_info);
 		err_device = ECC_ERR_DEVICE(err_cor_info);
 
@@ -441,7 +453,7 @@ static int denali_sw_ecc_fixup(struct mtd_info *mtd,
 			unsigned int flips_in_byte;
 
 			offset = (err_sector * ecc_size + err_byte) *
-						denali->devnum + err_device;
+					denali->devs_per_cs + err_device;
 
 			/* correct the ECC error */
 			flips_in_byte = hweight8(buf[offset] ^ err_cor_value);
@@ -470,8 +482,8 @@ static int denali_sw_ecc_fixup(struct mtd_info *mtd,
 /* programs the controller to either enable/disable DMA transfers */
 static void denali_enable_dma(struct denali_nand_info *denali, bool en)
 {
-	iowrite32(en ? DMA_ENABLE__FLAG : 0, denali->flash_reg + DMA_ENABLE);
-	ioread32(denali->flash_reg + DMA_ENABLE);
+	iowrite32(en ? DMA_ENABLE__FLAG : 0, denali->reg + DMA_ENABLE);
+	ioread32(denali->reg + DMA_ENABLE);
 }
 
 static void denali_setup_dma64(struct denali_nand_info *denali,
@@ -480,7 +492,7 @@ static void denali_setup_dma64(struct denali_nand_info *denali,
 	uint32_t mode;
 	const int page_count = 1;
 
-	mode = MODE_10 | BANK(denali->flash_bank) | page;
+	mode = DENALI_MAP10 | DENALI_BANK(denali) | page;
 
 	/* DMA is a three step process */
 
@@ -488,14 +500,14 @@ static void denali_setup_dma64(struct denali_nand_info *denali,
 	 * 1. setup transfer type, interrupt when complete,
 	 *    burst len = 64 bytes, the number of pages
 	 */
-	index_addr(denali, mode,
-		   0x01002000 | (64 << 16) | (write << 8) | page_count);
+	denali_host_write(denali, mode,
+			  0x01002000 | (64 << 16) | (write << 8) | page_count);
 
 	/* 2. set memory low address */
-	index_addr(denali, mode, dma_addr);
+	denali_host_write(denali, mode, dma_addr);
 
 	/* 3. set memory high address */
-	index_addr(denali, mode, (uint64_t)dma_addr >> 32);
+	denali_host_write(denali, mode, (uint64_t)dma_addr >> 32);
 }
 
 static void denali_setup_dma32(struct denali_nand_info *denali,
@@ -504,21 +516,22 @@ static void denali_setup_dma32(struct denali_nand_info *denali,
 	uint32_t mode;
 	const int page_count = 1;
 
-	mode = MODE_10 | BANK(denali->flash_bank);
+	mode = DENALI_MAP10 | DENALI_BANK(denali);
 
 	/* DMA is a four step process */
 
 	/* 1. setup transfer type and # of pages */
-	index_addr(denali, mode | page, 0x2000 | (write << 8) | page_count);
+	denali_host_write(denali, mode | page,
+			  0x2000 | (write << 8) | page_count);
 
 	/* 2. set memory high address bits 23:8 */
-	index_addr(denali, mode | ((dma_addr >> 16) << 8), 0x2200);
+	denali_host_write(denali, mode | ((dma_addr >> 16) << 8), 0x2200);
 
 	/* 3. set memory low address bits 23:8 */
-	index_addr(denali, mode | ((dma_addr & 0xffff) << 8), 0x2300);
+	denali_host_write(denali, mode | ((dma_addr & 0xffff) << 8), 0x2300);
 
 	/* 4. interrupt when complete, burst len = 64 bytes */
-	index_addr(denali, mode | 0x14000, 0x2400);
+	denali_host_write(denali, mode | 0x14000, 0x2400);
 }
 
 static void denali_setup_dma(struct denali_nand_info *denali,
@@ -533,7 +546,7 @@ static void denali_setup_dma(struct denali_nand_info *denali,
 static int denali_pio_read(struct denali_nand_info *denali, void *buf,
 			   size_t size, int page, int raw)
 {
-	uint32_t addr = BANK(denali->flash_bank) | page;
+	uint32_t addr = DENALI_BANK(denali) | page;
 	uint32_t *buf32 = (uint32_t *)buf;
 	uint32_t irq_status, ecc_err_mask;
 	int i;
@@ -545,9 +558,9 @@ static int denali_pio_read(struct denali_nand_info *denali, void *buf,
 
 	denali_reset_irq(denali);
 
-	iowrite32(MODE_01 | addr, denali->flash_mem);
+	iowrite32(DENALI_MAP01 | addr, denali->host + DENALI_HOST_ADDR);
 	for (i = 0; i < size / 4; i++)
-		*buf32++ = ioread32(denali->flash_mem + 0x10);
+		*buf32++ = ioread32(denali->host + DENALI_HOST_DATA);
 
 	irq_status = denali_wait_for_irq(denali, INTR__PAGE_XFER_INC);
 	if (!(irq_status & INTR__PAGE_XFER_INC))
@@ -562,16 +575,16 @@ static int denali_pio_read(struct denali_nand_info *denali, void *buf,
 static int denali_pio_write(struct denali_nand_info *denali,
 			    const void *buf, size_t size, int page, int raw)
 {
-	uint32_t addr = BANK(denali->flash_bank) | page;
+	uint32_t addr = DENALI_BANK(denali) | page;
 	const uint32_t *buf32 = (uint32_t *)buf;
 	uint32_t irq_status;
 	int i;
 
 	denali_reset_irq(denali);
 
-	iowrite32(MODE_01 | addr, denali->flash_mem);
+	iowrite32(DENALI_MAP01 | addr, denali->host + DENALI_HOST_ADDR);
 	for (i = 0; i < size / 4; i++)
-		iowrite32(*buf32++, denali->flash_mem + 0x10);
+		iowrite32(*buf32++, denali->host + DENALI_HOST_DATA);
 
 	irq_status = denali_wait_for_irq(denali,
 				INTR__PROGRAM_COMP | INTR__PROGRAM_FAIL);
@@ -664,7 +677,7 @@ static void denali_oob_xfer(struct mtd_info *mtd, struct nand_chip *chip,
 	int ecc_steps = chip->ecc.steps;
 	int ecc_size = chip->ecc.size;
 	int ecc_bytes = chip->ecc.bytes;
-	int oob_skip = denali->bbtskipbytes;
+	int oob_skip = denali->oob_skip_bytes;
 	size_t size = writesize + oobsize;
 	int i, pos, len;
 
@@ -722,7 +735,7 @@ static int denali_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 	int ecc_size = chip->ecc.size;
 	int ecc_bytes = chip->ecc.bytes;
 	void *dma_buf = denali->buf;
-	int oob_skip = denali->bbtskipbytes;
+	int oob_skip = denali->oob_skip_bytes;
 	size_t size = writesize + oobsize;
 	int ret, i, pos, len;
 
@@ -853,7 +866,7 @@ static int denali_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 	int ecc_size = chip->ecc.size;
 	int ecc_bytes = chip->ecc.bytes;
 	void *dma_buf = denali->buf;
-	int oob_skip = denali->bbtskipbytes;
+	int oob_skip = denali->oob_skip_bytes;
 	size_t size = writesize + oobsize;
 	int i, pos, len;
 
@@ -934,7 +947,7 @@ static void denali_select_chip(struct mtd_info *mtd, int chip)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
 
-	denali->flash_bank = chip;
+	denali->active_bank = chip;
 }
 
 static int denali_waitfunc(struct mtd_info *mtd, struct nand_chip *chip)
@@ -951,13 +964,12 @@ static int denali_waitfunc(struct mtd_info *mtd, struct nand_chip *chip)
 static int denali_erase(struct mtd_info *mtd, int page)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
-	uint32_t cmd, irq_status;
+	uint32_t irq_status;
 
 	denali_reset_irq(denali);
 
-	/* setup page read request for access type */
-	cmd = MODE_10 | BANK(denali->flash_bank) | page;
-	index_addr(denali, cmd, 0x1);
+	denali_host_write(denali, DENALI_MAP10 | DENALI_BANK(denali) | page,
+			  DENALI_ERASE);
 
 	/* wait for erase to complete or failure to occur */
 	irq_status = denali_wait_for_irq(denali,
@@ -996,37 +1008,37 @@ static int denali_setup_data_interface(struct mtd_info *mtd, int chipnr,
 	acc_clks = DIV_ROUND_UP(timings->tREA_max, t_clk);
 	acc_clks = min_t(int, acc_clks, ACC_CLKS__VALUE);
 
-	tmp = ioread32(denali->flash_reg + ACC_CLKS);
+	tmp = ioread32(denali->reg + ACC_CLKS);
 	tmp &= ~ACC_CLKS__VALUE;
 	tmp |= acc_clks;
-	iowrite32(tmp, denali->flash_reg + ACC_CLKS);
+	iowrite32(tmp, denali->reg + ACC_CLKS);
 
 	/* tRWH -> RE_2_WE */
 	re_2_we = DIV_ROUND_UP(timings->tRHW_min, t_clk);
 	re_2_we = min_t(int, re_2_we, RE_2_WE__VALUE);
 
-	tmp = ioread32(denali->flash_reg + RE_2_WE);
+	tmp = ioread32(denali->reg + RE_2_WE);
 	tmp &= ~RE_2_WE__VALUE;
 	tmp |= re_2_we;
-	iowrite32(tmp, denali->flash_reg + RE_2_WE);
+	iowrite32(tmp, denali->reg + RE_2_WE);
 
 	/* tRHZ -> RE_2_RE */
 	re_2_re = DIV_ROUND_UP(timings->tRHZ_max, t_clk);
 	re_2_re = min_t(int, re_2_re, RE_2_RE__VALUE);
 
-	tmp = ioread32(denali->flash_reg + RE_2_RE);
+	tmp = ioread32(denali->reg + RE_2_RE);
 	tmp &= ~RE_2_RE__VALUE;
 	tmp |= re_2_re;
-	iowrite32(tmp, denali->flash_reg + RE_2_RE);
+	iowrite32(tmp, denali->reg + RE_2_RE);
 
 	/* tWHR -> WE_2_RE */
 	we_2_re = DIV_ROUND_UP(timings->tWHR_min, t_clk);
 	we_2_re = min_t(int, we_2_re, TWHR2_AND_WE_2_RE__WE_2_RE);
 
-	tmp = ioread32(denali->flash_reg + TWHR2_AND_WE_2_RE);
+	tmp = ioread32(denali->reg + TWHR2_AND_WE_2_RE);
 	tmp &= ~TWHR2_AND_WE_2_RE__WE_2_RE;
 	tmp |= we_2_re;
-	iowrite32(tmp, denali->flash_reg + TWHR2_AND_WE_2_RE);
+	iowrite32(tmp, denali->reg + TWHR2_AND_WE_2_RE);
 
 	/* tADL -> ADDR_2_DATA */
 
@@ -1038,20 +1050,20 @@ static int denali_setup_data_interface(struct mtd_info *mtd, int chipnr,
 	addr_2_data = DIV_ROUND_UP(timings->tADL_min, t_clk);
 	addr_2_data = min_t(int, addr_2_data, addr_2_data_mask);
 
-	tmp = ioread32(denali->flash_reg + TCWAW_AND_ADDR_2_DATA);
+	tmp = ioread32(denali->reg + TCWAW_AND_ADDR_2_DATA);
 	tmp &= ~addr_2_data_mask;
 	tmp |= addr_2_data;
-	iowrite32(tmp, denali->flash_reg + TCWAW_AND_ADDR_2_DATA);
+	iowrite32(tmp, denali->reg + TCWAW_AND_ADDR_2_DATA);
 
 	/* tREH, tWH -> RDWR_EN_HI_CNT */
 	rdwr_en_hi = DIV_ROUND_UP(max(timings->tREH_min, timings->tWH_min),
 				  t_clk);
 	rdwr_en_hi = min_t(int, rdwr_en_hi, RDWR_EN_HI_CNT__VALUE);
 
-	tmp = ioread32(denali->flash_reg + RDWR_EN_HI_CNT);
+	tmp = ioread32(denali->reg + RDWR_EN_HI_CNT);
 	tmp &= ~RDWR_EN_HI_CNT__VALUE;
 	tmp |= rdwr_en_hi;
-	iowrite32(tmp, denali->flash_reg + RDWR_EN_HI_CNT);
+	iowrite32(tmp, denali->reg + RDWR_EN_HI_CNT);
 
 	/* tRP, tWP -> RDWR_EN_LO_CNT */
 	rdwr_en_lo = DIV_ROUND_UP(max(timings->tRP_min, timings->tWP_min),
@@ -1062,10 +1074,10 @@ static int denali_setup_data_interface(struct mtd_info *mtd, int chipnr,
 	rdwr_en_lo = max(rdwr_en_lo, rdwr_en_lo_hi - rdwr_en_hi);
 	rdwr_en_lo = min_t(int, rdwr_en_lo, RDWR_EN_LO_CNT__VALUE);
 
-	tmp = ioread32(denali->flash_reg + RDWR_EN_LO_CNT);
+	tmp = ioread32(denali->reg + RDWR_EN_LO_CNT);
 	tmp &= ~RDWR_EN_LO_CNT__VALUE;
 	tmp |= rdwr_en_lo;
-	iowrite32(tmp, denali->flash_reg + RDWR_EN_LO_CNT);
+	iowrite32(tmp, denali->reg + RDWR_EN_LO_CNT);
 
 	/* tCS, tCEA -> CS_SETUP_CNT */
 	cs_setup = max3((int)DIV_ROUND_UP(timings->tCS_min, t_clk) - rdwr_en_lo,
@@ -1073,10 +1085,10 @@ static int denali_setup_data_interface(struct mtd_info *mtd, int chipnr,
 			0);
 	cs_setup = min_t(int, cs_setup, CS_SETUP_CNT__VALUE);
 
-	tmp = ioread32(denali->flash_reg + CS_SETUP_CNT);
+	tmp = ioread32(denali->reg + CS_SETUP_CNT);
 	tmp &= ~CS_SETUP_CNT__VALUE;
 	tmp |= cs_setup;
-	iowrite32(tmp, denali->flash_reg + CS_SETUP_CNT);
+	iowrite32(tmp, denali->reg + CS_SETUP_CNT);
 
 	return 0;
 }
@@ -1087,12 +1099,12 @@ static void denali_reset_banks(struct denali_nand_info *denali)
 	int i;
 
 	for (i = 0; i < denali->max_banks; i++) {
-		denali->flash_bank = i;
+		denali->active_bank = i;
 
 		denali_reset_irq(denali);
 
 		iowrite32(DEVICE_RESET__BANK(i),
-			  denali->flash_reg + DEVICE_RESET);
+			  denali->reg + DEVICE_RESET);
 
 		irq_status = denali_wait_for_irq(denali,
 			INTR__RST_COMP | INTR__INT_ACT | INTR__TIME_OUT);
@@ -1111,8 +1123,7 @@ static void denali_hw_init(struct denali_nand_info *denali)
 	 * override it.
 	 */
 	if (!denali->revision)
-		denali->revision =
-				swab16(ioread32(denali->flash_reg + REVISION));
+		denali->revision = swab16(ioread32(denali->reg + REVISION));
 
 	/*
 	 * tell driver how many bit controller will skip before
@@ -1120,18 +1131,16 @@ static void denali_hw_init(struct denali_nand_info *denali)
 	 * set by firmware. So we read this value out.
 	 * if this value is 0, just let it be.
 	 */
-	denali->bbtskipbytes = ioread32(denali->flash_reg +
-						SPARE_AREA_SKIP_BYTES);
+	denali->oob_skip_bytes = ioread32(denali->reg + SPARE_AREA_SKIP_BYTES);
 	detect_max_banks(denali);
-	iowrite32(0x0F, denali->flash_reg + RB_PIN_ENABLED);
-	iowrite32(CHIP_EN_DONT_CARE__FLAG,
-			denali->flash_reg + CHIP_ENABLE_DONT_CARE);
+	iowrite32(0x0F, denali->reg + RB_PIN_ENABLED);
+	iowrite32(CHIP_EN_DONT_CARE__FLAG, denali->reg + CHIP_ENABLE_DONT_CARE);
 
-	iowrite32(0xffff, denali->flash_reg + SPARE_AREA_MARKER);
+	iowrite32(0xffff, denali->reg + SPARE_AREA_MARKER);
 
 	/* Should set value for these registers when init */
-	iowrite32(0, denali->flash_reg + TWO_ROW_ADDR_CYCLES);
-	iowrite32(1, denali->flash_reg + ECC_ENABLE);
+	iowrite32(0, denali->reg + TWO_ROW_ADDR_CYCLES);
+	iowrite32(1, denali->reg + ECC_ENABLE);
 }
 
 int denali_calc_ecc_bytes(int step_size, int strength)
@@ -1144,7 +1153,7 @@ EXPORT_SYMBOL(denali_calc_ecc_bytes);
 static int denali_ecc_setup(struct mtd_info *mtd, struct nand_chip *chip,
 			    struct denali_nand_info *denali)
 {
-	int oobavail = mtd->oobsize - denali->bbtskipbytes;
+	int oobavail = mtd->oobsize - denali->oob_skip_bytes;
 	int ret;
 
 	/*
@@ -1177,7 +1186,7 @@ static int denali_ooblayout_ecc(struct mtd_info *mtd, int section,
 	if (section)
 		return -ERANGE;
 
-	oobregion->offset = denali->bbtskipbytes;
+	oobregion->offset = denali->oob_skip_bytes;
 	oobregion->length = chip->ecc.total;
 
 	return 0;
@@ -1192,7 +1201,7 @@ static int denali_ooblayout_free(struct mtd_info *mtd, int section,
 	if (section)
 		return -ERANGE;
 
-	oobregion->offset = chip->ecc.total + denali->bbtskipbytes;
+	oobregion->offset = chip->ecc.total + denali->oob_skip_bytes;
 	oobregion->length = mtd->oobsize - oobregion->offset;
 
 	return 0;
@@ -1231,23 +1240,23 @@ static int denali_multidev_fixup(struct denali_nand_info *denali)
 	 * In this case, the core framework knows nothing about this fact,
 	 * so we should tell it the _logical_ pagesize and anything necessary.
 	 */
-	denali->devnum = ioread32(denali->flash_reg + DEVICES_CONNECTED);
+	denali->devs_per_cs = ioread32(denali->reg + DEVICES_CONNECTED);
 
 	/*
 	 * On some SoCs, DEVICES_CONNECTED is not auto-detected.
 	 * For those, DEVICES_CONNECTED is left to 0.  Set 1 if it is the case.
 	 */
-	if (denali->devnum == 0) {
-		denali->devnum = 1;
-		iowrite32(1, denali->flash_reg + DEVICES_CONNECTED);
+	if (denali->devs_per_cs == 0) {
+		denali->devs_per_cs = 1;
+		iowrite32(1, denali->reg + DEVICES_CONNECTED);
 	}
 
-	if (denali->devnum == 1)
+	if (denali->devs_per_cs == 1)
 		return 0;
 
-	if (denali->devnum != 2) {
+	if (denali->devs_per_cs != 2) {
 		dev_err(denali->dev, "unsupported number of devices %d\n",
-			denali->devnum);
+			denali->devs_per_cs);
 		return -EINVAL;
 	}
 
@@ -1265,7 +1274,7 @@ static int denali_multidev_fixup(struct denali_nand_info *denali)
 	chip->ecc.size <<= 1;
 	chip->ecc.bytes <<= 1;
 	chip->ecc.strength <<= 1;
-	denali->bbtskipbytes <<= 1;
+	denali->oob_skip_bytes <<= 1;
 
 	return 0;
 }
@@ -1293,7 +1302,7 @@ int denali_init(struct denali_nand_info *denali)
 	denali_enable_irq(denali);
 	denali_reset_banks(denali);
 
-	denali->flash_bank = CHIP_SELECT_INVALID;
+	denali->active_bank = DENALI_INVALID_BANK;
 
 	nand_set_flash_node(chip, denali->dev->of_node);
 	/* Fallback to the default name if DT did not give "label" property */
@@ -1321,7 +1330,7 @@ int denali_init(struct denali_nand_info *denali)
 	if (ret)
 		goto disable_irq;
 
-	if (ioread32(denali->flash_reg + FEATURES) & FEATURES__DMA)
+	if (ioread32(denali->reg + FEATURES) & FEATURES__DMA)
 		denali->dma_avail = 1;
 
 	if (denali->dma_avail) {
@@ -1365,19 +1374,19 @@ int denali_init(struct denali_nand_info *denali)
 		chip->ecc.size, chip->ecc.strength, chip->ecc.bytes);
 
 	iowrite32(MAKE_ECC_CORRECTION(chip->ecc.strength, 1),
-		  denali->flash_reg + ECC_CORRECTION);
+		  denali->reg + ECC_CORRECTION);
 	iowrite32(mtd->erasesize / mtd->writesize,
-		  denali->flash_reg + PAGES_PER_BLOCK);
+		  denali->reg + PAGES_PER_BLOCK);
 	iowrite32(chip->options & NAND_BUSWIDTH_16 ? 1 : 0,
-		  denali->flash_reg + DEVICE_WIDTH);
-	iowrite32(mtd->writesize, denali->flash_reg + DEVICE_MAIN_AREA_SIZE);
-	iowrite32(mtd->oobsize, denali->flash_reg + DEVICE_SPARE_AREA_SIZE);
+		  denali->reg + DEVICE_WIDTH);
+	iowrite32(mtd->writesize, denali->reg + DEVICE_MAIN_AREA_SIZE);
+	iowrite32(mtd->oobsize, denali->reg + DEVICE_SPARE_AREA_SIZE);
 
-	iowrite32(chip->ecc.size, denali->flash_reg + CFG_DATA_BLOCK_SIZE);
-	iowrite32(chip->ecc.size, denali->flash_reg + CFG_LAST_DATA_BLOCK_SIZE);
+	iowrite32(chip->ecc.size, denali->reg + CFG_DATA_BLOCK_SIZE);
+	iowrite32(chip->ecc.size, denali->reg + CFG_LAST_DATA_BLOCK_SIZE);
 	/* chip->ecc.steps is set by nand_scan_tail(); not available here */
 	iowrite32(mtd->writesize / chip->ecc.size,
-		  denali->flash_reg + CFG_NUM_DATA_BLOCKS);
+		  denali->reg + CFG_NUM_DATA_BLOCKS);
 
 	mtd_set_ooblayout(mtd, &denali_ooblayout_ops);
 
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index 657a794af695..237cc706b0fb 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -303,18 +303,13 @@
 #define     CHNL_ACTIVE__CHANNEL2			BIT(2)
 #define     CHNL_ACTIVE__CHANNEL3			BIT(3)
 
-#define MODE_00    0x00000000
-#define MODE_01    0x04000000
-#define MODE_10    0x08000000
-#define MODE_11    0x0C000000
-
 struct denali_nand_info {
 	struct nand_chip nand;
 	unsigned long clk_x_rate;	/* bus interface clock rate */
-	int flash_bank; /* currently selected chip */
+	int active_bank;		/* currently selected bank */
 	struct device *dev;
-	void __iomem *flash_reg;	/* Register Interface */
-	void __iomem *flash_mem;	/* Host Data/Command Interface */
+	void __iomem *reg;		/* Register Interface */
+	void __iomem *host;		/* Host Data/Command Interface */
 
 	/* elements used by ISR */
 	struct completion complete;
@@ -326,8 +321,8 @@ struct denali_nand_info {
 	void *buf;
 	dma_addr_t dma_addr;
 	int dma_avail;
-	int devnum;	/* represent how many nands connected */
-	int bbtskipbytes;
+	int devs_per_cs;		/* devices connected in parallel */
+	int oob_skip_bytes;
 	int max_banks;
 	unsigned int revision;
 	unsigned int caps;
diff --git a/drivers/mtd/nand/denali_dt.c b/drivers/mtd/nand/denali_dt.c
index ebcce50f4005..47f398edf18f 100644
--- a/drivers/mtd/nand/denali_dt.c
+++ b/drivers/mtd/nand/denali_dt.c
@@ -104,14 +104,14 @@ static int denali_dt_probe(struct platform_device *pdev)
 	}
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "denali_reg");
-	denali->flash_reg = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(denali->flash_reg))
-		return PTR_ERR(denali->flash_reg);
+	denali->reg = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(denali->reg))
+		return PTR_ERR(denali->reg);
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "nand_data");
-	denali->flash_mem = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(denali->flash_mem))
-		return PTR_ERR(denali->flash_mem);
+	denali->host = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(denali->host))
+		return PTR_ERR(denali->host);
 
 	dt->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(dt->clk)) {
diff --git a/drivers/mtd/nand/denali_pci.c b/drivers/mtd/nand/denali_pci.c
index 6217525c1000..81370c79aa48 100644
--- a/drivers/mtd/nand/denali_pci.c
+++ b/drivers/mtd/nand/denali_pci.c
@@ -78,14 +78,14 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 		return ret;
 	}
 
-	denali->flash_reg = ioremap_nocache(csr_base, csr_len);
-	if (!denali->flash_reg) {
+	denali->reg = ioremap_nocache(csr_base, csr_len);
+	if (!denali->reg) {
 		dev_err(&dev->dev, "Spectra: Unable to remap memory region\n");
 		return -ENOMEM;
 	}
 
-	denali->flash_mem = ioremap_nocache(mem_base, mem_len);
-	if (!denali->flash_mem) {
+	denali->host = ioremap_nocache(mem_base, mem_len);
+	if (!denali->host) {
 		dev_err(&dev->dev, "Spectra: ioremap_nocache failed!");
 		ret = -ENOMEM;
 		goto failed_remap_reg;
@@ -100,9 +100,9 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	return 0;
 
 failed_remap_mem:
-	iounmap(denali->flash_mem);
+	iounmap(denali->host);
 failed_remap_reg:
-	iounmap(denali->flash_reg);
+	iounmap(denali->reg);
 	return ret;
 }
 
@@ -112,8 +112,8 @@ static void denali_pci_remove(struct pci_dev *dev)
 	struct denali_nand_info *denali = pci_get_drvdata(dev);
 
 	denali_remove(denali);
-	iounmap(denali->flash_reg);
-	iounmap(denali->flash_mem);
+	iounmap(denali->reg);
+	iounmap(denali->host);
 }
 
 static struct pci_driver denali_pci_driver = {
-- 
2.7.4
