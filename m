Received: from conuserg-07.nifty.com ([210.131.2.74])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqgxM-0007rP-I4
 for linux-mtd@lists.infradead.org; Wed, 22 Mar 2017 14:09:49 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: laurent.monat@idquantique.com, thorsten.christiansson@idquantique.com,
 Enrico Jorns <ejo@pengutronix.de>,
 Jason Roberts <jason.e.roberts@intel.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH v2 07/53] mtd: nand: denali: consolidate INTR_STATUS__* and
 INTR_EN__* macros
Date: Wed, 22 Mar 2017 23:07:14 +0900
Message-Id: <1490191680-14481-8-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1490191680-14481-1-git-send-email-yamada.masahiro@socionext.com>
References: <1490191680-14481-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The interrupts are enabled by INTR_EN register, then asserted
interrupts can be observed via INTR_STATUS register.

The bit fields are identical between INTR_EN and INTR_STATUS, so we
can merge the bit field macros.  Likewise for DATA_INTR.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Newly added

 drivers/mtd/nand/denali.c | 56 ++++++++++++++++++++-----------------------
 drivers/mtd/nand/denali.h | 61 ++++++++++++++---------------------------------
 2 files changed, 44 insertions(+), 73 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index c9806e6..2c59eb3 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -45,16 +45,16 @@ MODULE_PARM_DESC(onfi_timing_mode,
  * We define a macro here that combines all interrupts this driver uses into
  * a single constant value, for convenience.
  */
-#define DENALI_IRQ_ALL	(INTR_STATUS__DMA_CMD_COMP | \
-			INTR_STATUS__ECC_TRANSACTION_DONE | \
-			INTR_STATUS__ECC_ERR | \
-			INTR_STATUS__PROGRAM_FAIL | \
-			INTR_STATUS__LOAD_COMP | \
-			INTR_STATUS__PROGRAM_COMP | \
-			INTR_STATUS__TIME_OUT | \
-			INTR_STATUS__ERASE_FAIL | \
-			INTR_STATUS__RST_COMP | \
-			INTR_STATUS__ERASE_COMP)
+#define DENALI_IRQ_ALL	(INTR__DMA_CMD_COMP | \
+			INTR__ECC_TRANSACTION_DONE | \
+			INTR__ECC_ERR | \
+			INTR__PROGRAM_FAIL | \
+			INTR__LOAD_COMP | \
+			INTR__PROGRAM_COMP | \
+			INTR__TIME_OUT | \
+			INTR__ERASE_FAIL | \
+			INTR__RST_COMP | \
+			INTR__ERASE_COMP)
 
 /*
  * indicates whether or not the internal value for the flash bank is
@@ -159,7 +159,7 @@ static void read_status(struct denali_nand_info *denali)
 static void reset_bank(struct denali_nand_info *denali)
 {
 	uint32_t irq_status;
-	uint32_t irq_mask = INTR_STATUS__RST_COMP | INTR_STATUS__TIME_OUT;
+	uint32_t irq_mask = INTR__RST_COMP | INTR__TIME_OUT;
 
 	clear_interrupts(denali);
 
@@ -167,7 +167,7 @@ static void reset_bank(struct denali_nand_info *denali)
 
 	irq_status = wait_for_irq(denali, irq_mask);
 
-	if (irq_status & INTR_STATUS__TIME_OUT)
+	if (irq_status & INTR__TIME_OUT)
 		dev_err(denali->dev, "reset bank failed.\n");
 }
 
@@ -177,22 +177,22 @@ static uint16_t denali_nand_reset(struct denali_nand_info *denali)
 	int i;
 
 	for (i = 0; i < denali->max_banks; i++)
-		iowrite32(INTR_STATUS__RST_COMP | INTR_STATUS__TIME_OUT,
+		iowrite32(INTR__RST_COMP | INTR__TIME_OUT,
 		denali->flash_reg + INTR_STATUS(i));
 
 	for (i = 0; i < denali->max_banks; i++) {
 		iowrite32(1 << i, denali->flash_reg + DEVICE_RESET);
 		while (!(ioread32(denali->flash_reg + INTR_STATUS(i)) &
-			(INTR_STATUS__RST_COMP | INTR_STATUS__TIME_OUT)))
+			(INTR__RST_COMP | INTR__TIME_OUT)))
 			cpu_relax();
 		if (ioread32(denali->flash_reg + INTR_STATUS(i)) &
-			INTR_STATUS__TIME_OUT)
+			INTR__TIME_OUT)
 			dev_dbg(denali->dev,
 			"NAND Reset operation timed out on bank %d\n", i);
 	}
 
 	for (i = 0; i < denali->max_banks; i++)
-		iowrite32(INTR_STATUS__RST_COMP | INTR_STATUS__TIME_OUT,
+		iowrite32(INTR__RST_COMP | INTR__TIME_OUT,
 			  denali->flash_reg + INTR_STATUS(i));
 
 	return PASS;
@@ -716,7 +716,7 @@ static int denali_send_pipeline_cmd(struct denali_nand_info *denali,
 	uint32_t addr, cmd, irq_status, irq_mask;
 
 	if (op == DENALI_READ)
-		irq_mask = INTR_STATUS__LOAD_COMP;
+		irq_mask = INTR__LOAD_COMP;
 	else if (op == DENALI_WRITE)
 		irq_mask = 0;
 	else
@@ -823,8 +823,7 @@ static int write_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
 	uint32_t irq_status;
-	uint32_t irq_mask = INTR_STATUS__PROGRAM_COMP |
-						INTR_STATUS__PROGRAM_FAIL;
+	uint32_t irq_mask = INTR__PROGRAM_COMP | INTR__PROGRAM_FAIL;
 	int status = 0;
 
 	denali->page = page;
@@ -851,7 +850,7 @@ static int write_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
 static void read_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
-	uint32_t irq_mask = INTR_STATUS__LOAD_COMP;
+	uint32_t irq_mask = INTR__LOAD_COMP;
 	uint32_t irq_status, addr, cmd;
 
 	denali->page = page;
@@ -912,7 +911,7 @@ static bool handle_ecc(struct denali_nand_info *denali, uint8_t *buf,
 	bool check_erased_page = false;
 	unsigned int bitflips = 0;
 
-	if (irq_status & INTR_STATUS__ECC_ERR) {
+	if (irq_status & INTR__ECC_ERR) {
 		/* read the ECC errors. we'll ignore them for now */
 		uint32_t err_address, err_correction_info, err_byte,
 			 err_sector, err_device, err_correction_value;
@@ -969,7 +968,7 @@ static bool handle_ecc(struct denali_nand_info *denali, uint8_t *buf,
 		 * for a while for this interrupt
 		 */
 		while (!(read_interrupt_status(denali) &
-				INTR_STATUS__ECC_TRANSACTION_DONE))
+				INTR__ECC_TRANSACTION_DONE))
 			cpu_relax();
 		clear_interrupts(denali);
 		denali_set_intr_modes(denali, true);
@@ -1020,8 +1019,7 @@ static int write_page(struct mtd_info *mtd, struct nand_chip *chip,
 	dma_addr_t addr = denali->buf.dma_buf;
 	size_t size = mtd->writesize + mtd->oobsize;
 	uint32_t irq_status;
-	uint32_t irq_mask = INTR_STATUS__DMA_CMD_COMP |
-						INTR_STATUS__PROGRAM_FAIL;
+	uint32_t irq_mask = INTR__DMA_CMD_COMP | INTR__PROGRAM_FAIL;
 
 	/*
 	 * if it is a raw xfer, we want to disable ecc and send the spare area.
@@ -1119,8 +1117,7 @@ static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 	size_t size = mtd->writesize + mtd->oobsize;
 
 	uint32_t irq_status;
-	uint32_t irq_mask = INTR_STATUS__ECC_TRANSACTION_DONE |
-			    INTR_STATUS__ECC_ERR;
+	uint32_t irq_mask = INTR__ECC_TRANSACTION_DONE | INTR__ECC_ERR;
 	bool check_erased_page = false;
 
 	if (page != denali->page) {
@@ -1168,7 +1165,7 @@ static int denali_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
 	dma_addr_t addr = denali->buf.dma_buf;
 	size_t size = mtd->writesize + mtd->oobsize;
-	uint32_t irq_mask = INTR_STATUS__DMA_CMD_COMP;
+	uint32_t irq_mask = INTR__DMA_CMD_COMP;
 
 	if (page != denali->page) {
 		dev_err(denali->dev,
@@ -1241,10 +1238,9 @@ static int denali_erase(struct mtd_info *mtd, int page)
 	index_addr(denali, cmd, 0x1);
 
 	/* wait for erase to complete or failure to occur */
-	irq_status = wait_for_irq(denali, INTR_STATUS__ERASE_COMP |
-					INTR_STATUS__ERASE_FAIL);
+	irq_status = wait_for_irq(denali, INTR__ERASE_COMP | INTR__ERASE_FAIL);
 
-	return irq_status & INTR_STATUS__ERASE_FAIL ? NAND_STATUS_FAIL : PASS;
+	return irq_status & INTR__ERASE_FAIL ? NAND_STATUS_FAIL : PASS;
 }
 
 static void denali_cmdfunc(struct mtd_info *mtd, unsigned int cmd, int col,
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index 403a7c8..8df2285 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -218,40 +218,22 @@
 
 #define INTR_STATUS(__bank)	(0x410 + ((__bank) * 0x50))
 #define INTR_EN(__bank)		(0x420 + ((__bank) * 0x50))
-
-#define     INTR_STATUS__ECC_TRANSACTION_DONE		0x0001
-#define     INTR_STATUS__ECC_ERR			0x0002
-#define     INTR_STATUS__DMA_CMD_COMP			0x0004
-#define     INTR_STATUS__TIME_OUT			0x0008
-#define     INTR_STATUS__PROGRAM_FAIL			0x0010
-#define     INTR_STATUS__ERASE_FAIL			0x0020
-#define     INTR_STATUS__LOAD_COMP			0x0040
-#define     INTR_STATUS__PROGRAM_COMP			0x0080
-#define     INTR_STATUS__ERASE_COMP			0x0100
-#define     INTR_STATUS__PIPE_CPYBCK_CMD_COMP		0x0200
-#define     INTR_STATUS__LOCKED_BLK			0x0400
-#define     INTR_STATUS__UNSUP_CMD			0x0800
-#define     INTR_STATUS__INT_ACT			0x1000
-#define     INTR_STATUS__RST_COMP			0x2000
-#define     INTR_STATUS__PIPE_CMD_ERR			0x4000
-#define     INTR_STATUS__PAGE_XFER_INC			0x8000
-
-#define     INTR_EN__ECC_TRANSACTION_DONE		0x0001
-#define     INTR_EN__ECC_ERR				0x0002
-#define     INTR_EN__DMA_CMD_COMP			0x0004
-#define     INTR_EN__TIME_OUT				0x0008
-#define     INTR_EN__PROGRAM_FAIL			0x0010
-#define     INTR_EN__ERASE_FAIL				0x0020
-#define     INTR_EN__LOAD_COMP				0x0040
-#define     INTR_EN__PROGRAM_COMP			0x0080
-#define     INTR_EN__ERASE_COMP				0x0100
-#define     INTR_EN__PIPE_CPYBCK_CMD_COMP		0x0200
-#define     INTR_EN__LOCKED_BLK				0x0400
-#define     INTR_EN__UNSUP_CMD				0x0800
-#define     INTR_EN__INT_ACT				0x1000
-#define     INTR_EN__RST_COMP				0x2000
-#define     INTR_EN__PIPE_CMD_ERR			0x4000
-#define     INTR_EN__PAGE_XFER_INC			0x8000
+#define     INTR__ECC_TRANSACTION_DONE			0x0001
+#define     INTR__ECC_ERR				0x0002
+#define     INTR__DMA_CMD_COMP				0x0004
+#define     INTR__TIME_OUT				0x0008
+#define     INTR__PROGRAM_FAIL				0x0010
+#define     INTR__ERASE_FAIL				0x0020
+#define     INTR__LOAD_COMP				0x0040
+#define     INTR__PROGRAM_COMP				0x0080
+#define     INTR__ERASE_COMP				0x0100
+#define     INTR__PIPE_CPYBCK_CMD_COMP			0x0200
+#define     INTR__LOCKED_BLK				0x0400
+#define     INTR__UNSUP_CMD				0x0800
+#define     INTR__INT_ACT				0x1000
+#define     INTR__RST_COMP				0x2000
+#define     INTR__PIPE_CMD_ERR				0x4000
+#define     INTR__PAGE_XFER_INC				0x8000
 
 #define PAGE_CNT(__bank)	(0x430 + ((__bank) * 0x50))
 #define ERR_PAGE_ADDR(__bank)	(0x440 + ((__bank) * 0x50))
@@ -284,20 +266,13 @@
 #define     IGNORE_ECC_DONE__FLAG			0x0001
 
 #define DMA_INTR				0x720
+#define DMA_INTR_EN				0x730
 #define     DMA_INTR__TARGET_ERROR			0x0001
 #define     DMA_INTR__DESC_COMP_CHANNEL0		0x0002
 #define     DMA_INTR__DESC_COMP_CHANNEL1		0x0004
 #define     DMA_INTR__DESC_COMP_CHANNEL2		0x0008
 #define     DMA_INTR__DESC_COMP_CHANNEL3		0x0010
-#define     DMA_INTR__MEMCOPY_DESC_COMP		0x0020
-
-#define DMA_INTR_EN				0x730
-#define     DMA_INTR_EN__TARGET_ERROR			0x0001
-#define     DMA_INTR_EN__DESC_COMP_CHANNEL0		0x0002
-#define     DMA_INTR_EN__DESC_COMP_CHANNEL1		0x0004
-#define     DMA_INTR_EN__DESC_COMP_CHANNEL2		0x0008
-#define     DMA_INTR_EN__DESC_COMP_CHANNEL3		0x0010
-#define     DMA_INTR_EN__MEMCOPY_DESC_COMP		0x0020
+#define     DMA_INTR__MEMCOPY_DESC_COMP			0x0020
 
 #define TARGET_ERR_ADDR_LO			0x740
 #define     TARGET_ERR_ADDR_LO__VALUE			0xffff
-- 
2.7.4
