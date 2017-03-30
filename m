Received: from conuserg-07.nifty.com ([210.131.2.74])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctTsh-0002K8-47
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
Subject: [PATCH v3 30/37] mtd: nand: denali: use flag instead of register
 macro for direction
Date: Thu, 30 Mar 2017 15:46:16 +0900
Message-Id: <1490856383-31560-31-git-send-email-yamada.masahiro@socionext.com>
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

It is not a good idea to re-use macros that represent a specific
register bit field for the transfer direction.

It is true that bit 8 indicates the direction for the MAP10 pipeline
operation and the data DMA operation, but this is not valid across
the IP.

Use a simple flag (write: 1, read: 0) for the direction.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v3: None
Changes in v2:
  - Newly added

 drivers/mtd/nand/denali.c | 36 +++++++++++++++++-------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 5feeaf5..6843cfc 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -53,9 +53,6 @@ static inline struct denali_nand_info *mtd_to_denali(struct mtd_info *mtd)
 #define MAIN_ACCESS		0x42
 #define MAIN_SPARE_ACCESS	0x43
 
-#define DENALI_READ	0
-#define DENALI_WRITE	0x100
-
 #define DENALI_NR_BANKS		4
 
 /*
@@ -284,7 +281,7 @@ static int denali_dev_ready(struct mtd_info *mtd)
  */
 static int denali_send_pipeline_cmd(struct denali_nand_info *denali, int page,
 				    bool ecc_en, bool transfer_spare,
-				    int access_type, int op)
+				    int access_type, int write)
 {
 	int status = PASS;
 	uint32_t addr, cmd;
@@ -295,17 +292,17 @@ static int denali_send_pipeline_cmd(struct denali_nand_info *denali, int page,
 
 	addr = BANK(denali->flash_bank) | page;
 
-	if (op == DENALI_WRITE && access_type != SPARE_ACCESS) {
+	if (write && access_type != SPARE_ACCESS) {
 		cmd = MODE_01 | addr;
 		iowrite32(cmd, denali->flash_mem);
-	} else if (op == DENALI_WRITE && access_type == SPARE_ACCESS) {
+	} else if (write && access_type == SPARE_ACCESS) {
 		/* read spare area */
 		cmd = MODE_10 | addr;
 		index_addr(denali, cmd, access_type);
 
 		cmd = MODE_01 | addr;
 		iowrite32(cmd, denali->flash_mem);
-	} else if (op == DENALI_READ) {
+	} else {
 		/* setup page read request for access type */
 		cmd = MODE_10 | addr;
 		index_addr(denali, cmd, access_type);
@@ -367,7 +364,7 @@ static int write_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
 	int status = 0;
 
 	if (denali_send_pipeline_cmd(denali, page, false, false, SPARE_ACCESS,
-							DENALI_WRITE) == PASS) {
+							1) == PASS) {
 		write_data_to_flash_mem(denali, buf, mtd->oobsize);
 
 		/* wait for operation to complete */
@@ -392,7 +389,7 @@ static void read_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
 	uint32_t irq_status, addr, cmd;
 
 	if (denali_send_pipeline_cmd(denali, page, false, true, SPARE_ACCESS,
-							DENALI_READ) == PASS) {
+							0) == PASS) {
 		read_data_from_flash_mem(denali, buf, mtd->oobsize);
 
 		/*
@@ -578,7 +575,7 @@ static void denali_enable_dma(struct denali_nand_info *denali, bool en)
 }
 
 static void denali_setup_dma64(struct denali_nand_info *denali,
-			       dma_addr_t dma_addr, int page, int op)
+			       dma_addr_t dma_addr, int page, int write)
 {
 	uint32_t mode;
 	const int page_count = 1;
@@ -591,7 +588,8 @@ static void denali_setup_dma64(struct denali_nand_info *denali,
 	 * 1. setup transfer type, interrupt when complete,
 	 *    burst len = 64 bytes, the number of pages
 	 */
-	index_addr(denali, mode, 0x01002000 | (64 << 16) | op | page_count);
+	index_addr(denali, mode,
+		   0x01002000 | (64 << 16) | (write << 8) | page_count);
 
 	/* 2. set memory low address */
 	index_addr(denali, mode, dma_addr);
@@ -601,7 +599,7 @@ static void denali_setup_dma64(struct denali_nand_info *denali,
 }
 
 static void denali_setup_dma32(struct denali_nand_info *denali,
-			       dma_addr_t dma_addr, int page, int op)
+			       dma_addr_t dma_addr, int page, int write)
 {
 	uint32_t mode;
 	const int page_count = 1;
@@ -611,7 +609,7 @@ static void denali_setup_dma32(struct denali_nand_info *denali,
 	/* DMA is a four step process */
 
 	/* 1. setup transfer type and # of pages */
-	index_addr(denali, mode | page, 0x2000 | op | page_count);
+	index_addr(denali, mode | page, 0x2000 | (write << 8) | page_count);
 
 	/* 2. set memory high address bits 23:8 */
 	index_addr(denali, mode | ((dma_addr >> 16) << 8), 0x2200);
@@ -624,12 +622,12 @@ static void denali_setup_dma32(struct denali_nand_info *denali,
 }
 
 static void denali_setup_dma(struct denali_nand_info *denali,
-			     dma_addr_t dma_addr, int page, int op)
+			     dma_addr_t dma_addr, int page, int write)
 {
 	if (denali->caps & DENALI_CAP_DMA_64BIT)
-		denali_setup_dma64(denali, dma_addr, page, op);
+		denali_setup_dma64(denali, dma_addr, page, write);
 	else
-		denali_setup_dma32(denali, dma_addr, page, op);
+		denali_setup_dma32(denali, dma_addr, page, write);
 }
 
 /*
@@ -668,7 +666,7 @@ static int write_page(struct mtd_info *mtd, struct nand_chip *chip,
 	denali_reset_irq(denali);
 	denali_enable_dma(denali, true);
 
-	denali_setup_dma(denali, addr, page, DENALI_WRITE);
+	denali_setup_dma(denali, addr, page, 1);
 
 	/* wait for operation to complete */
 	irq_status = denali_wait_for_irq(denali, irq_mask);
@@ -750,7 +748,7 @@ static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 	dma_sync_single_for_device(denali->dev, addr, size, DMA_FROM_DEVICE);
 
 	denali_reset_irq(denali);
-	denali_setup_dma(denali, addr, page, DENALI_READ);
+	denali_setup_dma(denali, addr, page, 0);
 
 	/* wait for operation to complete */
 	irq_status = denali_wait_for_irq(denali, irq_mask);
@@ -793,7 +791,7 @@ static int denali_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 	dma_sync_single_for_device(denali->dev, addr, size, DMA_FROM_DEVICE);
 
 	denali_reset_irq(denali);
-	denali_setup_dma(denali, addr, page, DENALI_READ);
+	denali_setup_dma(denali, addr, page, 0);
 
 	/* wait for operation to complete */
 	irq_status = denali_wait_for_irq(denali, irq_mask);
-- 
2.7.4
