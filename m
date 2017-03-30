Received: from conuserg-07.nifty.com ([210.131.2.74])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctTsh-0002KA-48
 for linux-mtd@lists.infradead.org; Thu, 30 Mar 2017 06:48:28 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Enrico Jorns <ejo@pengutronix.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH v3 28/37] mtd: nand: denali: propagate page to helpers via
 function argument
Date: Thu, 30 Mar 2017 15:46:14 +0900
Message-Id: <1490856383-31560-29-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1490856383-31560-1-git-send-email-yamada.masahiro@socionext.com>
References: <1490856383-31560-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This driver stores the currently addressed page into denali->page,
which is later read out by helper functions.  While I am tackling on
this driver, I often missed to insert "denali->page = page;" where
necessary.  This makes page_read/write callbacks to get access to a
wrong page, which is a bug hard to figure out.

Instead, I'd rather pass the page via function argument because the
compiler's prototype checks will help to detect bugs.

For the same reason, propagate dma_addr to the DMA helpers instead
of denali->buf.dma_buf .

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v3: None
Changes in v2:
  - Newly added

 drivers/mtd/nand/denali.c | 58 ++++++++++++++++++++---------------------------
 drivers/mtd/nand/denali.h |  1 -
 2 files changed, 24 insertions(+), 35 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 9dfed20..00d0e9d 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -282,7 +282,7 @@ static int denali_dev_ready(struct mtd_info *mtd)
  * sends a pipeline command operation to the controller. See the Denali NAND
  * controller's user guide for more information (section 4.2.3.6).
  */
-static int denali_send_pipeline_cmd(struct denali_nand_info *denali,
+static int denali_send_pipeline_cmd(struct denali_nand_info *denali, int page,
 				    bool ecc_en, bool transfer_spare,
 				    int access_type, int op)
 {
@@ -293,7 +293,7 @@ static int denali_send_pipeline_cmd(struct denali_nand_info *denali,
 
 	denali_reset_irq(denali);
 
-	addr = BANK(denali->flash_bank) | denali->page;
+	addr = BANK(denali->flash_bank) | page;
 
 	if (op == DENALI_WRITE && access_type != SPARE_ACCESS) {
 		cmd = MODE_01 | addr;
@@ -366,9 +366,7 @@ static int write_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
 	uint32_t irq_mask = INTR__PROGRAM_COMP | INTR__PROGRAM_FAIL;
 	int status = 0;
 
-	denali->page = page;
-
-	if (denali_send_pipeline_cmd(denali, false, false, SPARE_ACCESS,
+	if (denali_send_pipeline_cmd(denali, page, false, false, SPARE_ACCESS,
 							DENALI_WRITE) == PASS) {
 		write_data_to_flash_mem(denali, buf, mtd->oobsize);
 
@@ -393,9 +391,7 @@ static void read_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
 	uint32_t irq_mask = INTR__LOAD_COMP;
 	uint32_t irq_status, addr, cmd;
 
-	denali->page = page;
-
-	if (denali_send_pipeline_cmd(denali, false, true, SPARE_ACCESS,
+	if (denali_send_pipeline_cmd(denali, page, false, true, SPARE_ACCESS,
 							DENALI_READ) == PASS) {
 		read_data_from_flash_mem(denali, buf, mtd->oobsize);
 
@@ -407,8 +403,7 @@ static void read_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
 		irq_status = denali_wait_for_irq(denali, irq_mask);
 
 		if (!(irq_status & INTR__LOAD_COMP))
-			dev_err(denali->dev, "page on OOB timeout %d\n",
-					denali->page);
+			dev_err(denali->dev, "page on OOB timeout %d\n", page);
 
 		/*
 		 * We set the device back to MAIN_ACCESS here as I observed
@@ -417,7 +412,7 @@ static void read_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
 		 * is reliable (according to the MTD test infrastructure)
 		 * if you are in MAIN_ACCESS.
 		 */
-		addr = BANK(denali->flash_bank) | denali->page;
+		addr = BANK(denali->flash_bank) | page;
 		cmd = MODE_10 | addr;
 		index_addr(denali, cmd, MAIN_ACCESS);
 	}
@@ -582,13 +577,13 @@ static void denali_enable_dma(struct denali_nand_info *denali, bool en)
 	ioread32(denali->flash_reg + DMA_ENABLE);
 }
 
-static void denali_setup_dma64(struct denali_nand_info *denali, int op)
+static void denali_setup_dma64(struct denali_nand_info *denali,
+			       dma_addr_t dma_addr, int page, int op)
 {
 	uint32_t mode;
 	const int page_count = 1;
-	uint64_t addr = denali->buf.dma_buf;
 
-	mode = MODE_10 | BANK(denali->flash_bank) | denali->page;
+	mode = MODE_10 | BANK(denali->flash_bank) | page;
 
 	/* DMA is a three step process */
 
@@ -599,41 +594,42 @@ static void denali_setup_dma64(struct denali_nand_info *denali, int op)
 	index_addr(denali, mode, 0x01002000 | (64 << 16) | op | page_count);
 
 	/* 2. set memory low address */
-	index_addr(denali, mode, addr);
+	index_addr(denali, mode, dma_addr);
 
 	/* 3. set memory high address */
-	index_addr(denali, mode, addr >> 32);
+	index_addr(denali, mode, (uint64_t)dma_addr >> 32);
 }
 
-static void denali_setup_dma32(struct denali_nand_info *denali, int op)
+static void denali_setup_dma32(struct denali_nand_info *denali,
+			       dma_addr_t dma_addr, int page, int op)
 {
 	uint32_t mode;
 	const int page_count = 1;
-	uint32_t addr = denali->buf.dma_buf;
 
 	mode = MODE_10 | BANK(denali->flash_bank);
 
 	/* DMA is a four step process */
 
 	/* 1. setup transfer type and # of pages */
-	index_addr(denali, mode | denali->page, 0x2000 | op | page_count);
+	index_addr(denali, mode | page, 0x2000 | op | page_count);
 
 	/* 2. set memory high address bits 23:8 */
-	index_addr(denali, mode | ((addr >> 16) << 8), 0x2200);
+	index_addr(denali, mode | ((dma_addr >> 16) << 8), 0x2200);
 
 	/* 3. set memory low address bits 23:8 */
-	index_addr(denali, mode | ((addr & 0xffff) << 8), 0x2300);
+	index_addr(denali, mode | ((dma_addr & 0xffff) << 8), 0x2300);
 
 	/* 4. interrupt when complete, burst len = 64 bytes */
 	index_addr(denali, mode | 0x14000, 0x2400);
 }
 
-static void denali_setup_dma(struct denali_nand_info *denali, int op)
+static void denali_setup_dma(struct denali_nand_info *denali,
+			     dma_addr_t dma_addr, int page, int op)
 {
 	if (denali->caps & DENALI_CAP_DMA_64BIT)
-		denali_setup_dma64(denali, op);
+		denali_setup_dma64(denali, dma_addr, page, op);
 	else
-		denali_setup_dma32(denali, op);
+		denali_setup_dma32(denali, dma_addr, page, op);
 }
 
 /*
@@ -650,8 +646,6 @@ static int write_page(struct mtd_info *mtd, struct nand_chip *chip,
 	uint32_t irq_mask = INTR__DMA_CMD_COMP | INTR__PROGRAM_FAIL;
 	int ret = 0;
 
-	denali->page = page;
-
 	/*
 	 * if it is a raw xfer, we want to disable ecc and send the spare area.
 	 * !raw_xfer - enable ecc
@@ -674,7 +668,7 @@ static int write_page(struct mtd_info *mtd, struct nand_chip *chip,
 	denali_reset_irq(denali);
 	denali_enable_dma(denali, true);
 
-	denali_setup_dma(denali, DENALI_WRITE);
+	denali_setup_dma(denali, addr, page, DENALI_WRITE);
 
 	/* wait for operation to complete */
 	irq_status = denali_wait_for_irq(denali, irq_mask);
@@ -750,15 +744,13 @@ static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 	unsigned long uncor_ecc_flags = 0;
 	int stat = 0;
 
-	denali->page = page;
-
 	setup_ecc_for_xfer(denali, true, false);
 
 	denali_enable_dma(denali, true);
 	dma_sync_single_for_device(denali->dev, addr, size, DMA_FROM_DEVICE);
 
 	denali_reset_irq(denali);
-	denali_setup_dma(denali, DENALI_READ);
+	denali_setup_dma(denali, addr, page, DENALI_READ);
 
 	/* wait for operation to complete */
 	irq_status = denali_wait_for_irq(denali, irq_mask);
@@ -777,7 +769,7 @@ static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 		return stat;
 
 	if (uncor_ecc_flags) {
-		read_oob_data(mtd, chip->oob_poi, denali->page);
+		read_oob_data(mtd, chip->oob_poi, page);
 
 		stat = denali_check_erased_page(mtd, chip, buf,
 						uncor_ecc_flags, stat);
@@ -795,15 +787,13 @@ static int denali_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 	uint32_t irq_mask = INTR__DMA_CMD_COMP;
 	uint32_t irq_status;
 
-	denali->page = page;
-
 	setup_ecc_for_xfer(denali, false, true);
 	denali_enable_dma(denali, true);
 
 	dma_sync_single_for_device(denali->dev, addr, size, DMA_FROM_DEVICE);
 
 	denali_reset_irq(denali);
-	denali_setup_dma(denali, DENALI_READ);
+	denali_setup_dma(denali, addr, page, DENALI_READ);
 
 	/* wait for operation to complete */
 	irq_status = denali_wait_for_irq(denali, irq_mask);
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index 7d64167..5f917a0 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -317,7 +317,6 @@ struct denali_nand_info {
 	int flash_bank; /* currently selected chip */
 	struct nand_buf buf;
 	struct device *dev;
-	int page;
 	void __iomem *flash_reg;	/* Register Interface */
 	void __iomem *flash_mem;	/* Host Data/Command Interface */
 
-- 
2.7.4
