Received: from mail.cvg.de ([62.153.82.30])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KZ1hw-0004Sr-AE
	for linux-mtd@lists.infradead.org; Fri, 29 Aug 2008 11:00:12 +0000
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 5/6] pxa3xx_nand: moved some helper variables out from
	platform data
Date: Fri, 29 Aug 2008 12:59:51 +0200
Message-Id: <1220007592-26894-4-git-send-email-enrico.scholz@sigma-chemnitz.de>
In-Reply-To: <1220007448-26801-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1220007448-26801-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch moves some attributes out from the platform data into the
dynamically created nand device.   This results into a cleaner interface
and allows to use constant pxa3xx_nand_flash definitions.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 arch/arm/mach-pxa/include/mach/pxa3xx_nand.h |    9 +-----
 drivers/mtd/nand/pxa3xx_nand.c               |   43 +++++++++++++++-----------
 2 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/arch/arm/mach-pxa/include/mach/pxa3xx_nand.h b/arch/arm/mach-pxa/include/mach/pxa3xx_nand.h
index e2a1c8a..1e8bafc 100644
--- a/arch/arm/mach-pxa/include/mach/pxa3xx_nand.h
+++ b/arch/arm/mach-pxa/include/mach/pxa3xx_nand.h
@@ -39,13 +39,6 @@ struct pxa3xx_nand_flash {
 	uint32_t dfc_width;	/* Width of flash controller(DWIDTH_C) */
 	uint32_t num_blocks;	/* Number of physical blocks in Flash */
 	uint32_t chip_id;
-
-	/* NOTE: these are automatically calculated, do not define */
-	size_t		oob_size;
-	size_t		read_id_bytes;
-
-	unsigned int	col_addr_cycles;
-	unsigned int	row_addr_cycles;
 };
 
 struct pxa3xx_nand_platform_data {
@@ -59,7 +52,7 @@ struct pxa3xx_nand_platform_data {
 	struct mtd_partition const		*parts;
 	unsigned int				nr_parts;
 
-	struct pxa3xx_nand_flash * const	flash;
+	struct pxa3xx_nand_flash const 		*flash;
 	size_t					num_flash;
 };
 
diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 2be5116..45bb2ca 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -119,7 +119,7 @@ struct pxa3xx_nand_info {
 	struct nand_chip	nand_chip;
 
 	struct platform_device	 *pdev;
-	struct pxa3xx_nand_flash *flash_info;
+	struct pxa3xx_nand_flash const *flash_info;
 
 	struct clk		*clk;
 	void __iomem		*mmio_base;
@@ -158,6 +158,13 @@ struct pxa3xx_nand_info {
 	uint32_t		ndcb0;
 	uint32_t		ndcb1;
 	uint32_t		ndcb2;
+
+	/* calculated from pxa3xx_nand_flash data */
+	size_t		oob_size;
+	size_t		read_id_bytes;
+
+	unsigned int	col_addr_cycles;
+	unsigned int	row_addr_cycles;
 };
 
 static int use_dma = 1;
@@ -312,7 +319,7 @@ static int wait_for_event(struct pxa3xx_nand_info *info, uint32_t event)
 static int prepare_read_prog_cmd(struct pxa3xx_nand_info *info,
 			uint16_t cmd, int column, int page_addr)
 {
-	struct pxa3xx_nand_flash *f = info->flash_info;
+	struct pxa3xx_nand_flash const *f = info->flash_info;
 	struct pxa3xx_nand_cmdset const *cmdset = f->cmdset;
 
 	/* calculate data size */
@@ -331,14 +338,14 @@ static int prepare_read_prog_cmd(struct pxa3xx_nand_info *info,
 	info->ndcb0 = cmd | ((cmd & 0xff00) ? NDCB0_DBC : 0);
 	info->ndcb1 = 0;
 	info->ndcb2 = 0;
-	info->ndcb0 |= NDCB0_ADDR_CYC(f->row_addr_cycles + f->col_addr_cycles);
+	info->ndcb0 |= NDCB0_ADDR_CYC(info->row_addr_cycles + info->col_addr_cycles);
 
-	if (f->col_addr_cycles == 2) {
+	if (info->col_addr_cycles == 2) {
 		/* large block, 2 cycles for column address
 		 * row address starts from 3rd cycle
 		 */
 		info->ndcb1 |= (page_addr << 16) | (column & 0xffff);
-		if (f->row_addr_cycles == 3)
+		if (info->row_addr_cycles == 3)
 			info->ndcb2 = (page_addr >> 16) & 0xff;
 	} else
 		/* small block, 1 cycles for column address
@@ -599,7 +606,7 @@ static void pxa3xx_nand_cmdfunc(struct mtd_info *mtd, unsigned command,
 				int column, int page_addr)
 {
 	struct pxa3xx_nand_info *info = mtd->priv;
-	struct pxa3xx_nand_flash *flash_info = info->flash_info;
+	struct pxa3xx_nand_flash const *flash_info = info->flash_info;
 	struct pxa3xx_nand_cmdset const *cmdset = flash_info->cmdset;
 	int ret;
 
@@ -678,7 +685,7 @@ static void pxa3xx_nand_cmdfunc(struct mtd_info *mtd, unsigned command,
 		info->use_dma = 0;	/* force PIO read */
 		info->buf_start = 0;
 		info->buf_count = (command == NAND_CMD_READID) ?
-				flash_info->read_id_bytes : 1;
+				info->read_id_bytes : 1;
 
 		if (prepare_other_cmd(info, (command == NAND_CMD_READID) ?
 				cmdset->read_id : cmdset->read_status))
@@ -819,7 +826,7 @@ static int pxa3xx_nand_ecc_correct(struct mtd_info *mtd,
 
 static int __readid(struct pxa3xx_nand_info *info, uint32_t *id)
 {
-	struct pxa3xx_nand_flash *f = info->flash_info;
+	struct pxa3xx_nand_flash const *f = info->flash_info;
 	struct pxa3xx_nand_cmdset const *cmdset = f->cmdset;
 	uint32_t ndcr;
 	uint8_t  id_buff[8];
@@ -849,7 +856,7 @@ fail_timeout:
 }
 
 static int pxa3xx_nand_config_flash(struct pxa3xx_nand_info *info,
-				    struct pxa3xx_nand_flash *f)
+				    struct pxa3xx_nand_flash const *f)
 {
 	struct platform_device *pdev = info->pdev;
 	struct pxa3xx_nand_platform_data *pdata = pdev->dev.platform_data;
@@ -862,25 +869,25 @@ static int pxa3xx_nand_config_flash(struct pxa3xx_nand_info *info,
 		return -EINVAL;
 
 	/* calculate flash information */
-	f->oob_size = (f->page_size == 2048) ? 64 : 16;
-	f->read_id_bytes = (f->page_size == 2048) ? 4 : 2;
+	info->oob_size = (f->page_size == 2048) ? 64 : 16;
+	info->read_id_bytes = (f->page_size == 2048) ? 4 : 2;
 
 	/* calculate addressing information */
-	f->col_addr_cycles = (f->page_size == 2048) ? 2 : 1;
+	info->col_addr_cycles = (f->page_size == 2048) ? 2 : 1;
 
 	if (f->num_blocks * f->page_per_block > 65536)
-		f->row_addr_cycles = 3;
+		info->row_addr_cycles = 3;
 	else
-		f->row_addr_cycles = 2;
+		info->row_addr_cycles = 2;
 
 	ndcr |= (pdata->enable_arbiter) ? NDCR_ND_ARB_EN : 0;
-	ndcr |= (f->col_addr_cycles == 2) ? NDCR_RA_START : 0;
+	ndcr |= (info->col_addr_cycles == 2) ? NDCR_RA_START : 0;
 	ndcr |= (f->page_per_block == 64) ? NDCR_PG_PER_BLK : 0;
 	ndcr |= (f->page_size == 2048) ? NDCR_PAGE_SZ : 0;
 	ndcr |= (f->flash_width == 16) ? NDCR_DWIDTH_M : 0;
 	ndcr |= (f->dfc_width == 16) ? NDCR_DWIDTH_C : 0;
 
-	ndcr |= NDCR_RD_ID_CNT(f->read_id_bytes);
+	ndcr |= NDCR_RD_ID_CNT(info->read_id_bytes);
 	ndcr |= NDCR_SPARE_EN; /* enable spare by default */
 
 	info->reg_ndcr = ndcr;
@@ -893,7 +900,7 @@ static int pxa3xx_nand_config_flash(struct pxa3xx_nand_info *info,
 static int pxa3xx_nand_detect_flash(struct pxa3xx_nand_info *info,
 				    struct pxa3xx_nand_platform_data const *pdata)
 {
-	struct pxa3xx_nand_flash *f;
+	struct pxa3xx_nand_flash const *f;
 	uint32_t id;
 	int i;
 
@@ -988,7 +995,7 @@ static struct nand_ecclayout hw_largepage_ecclayout = {
 static void pxa3xx_nand_init_mtd(struct mtd_info *mtd,
 				 struct pxa3xx_nand_info *info)
 {
-	struct pxa3xx_nand_flash *f = info->flash_info;
+	struct pxa3xx_nand_flash const *f = info->flash_info;
 	struct nand_chip *this = &info->nand_chip;
 
 	this->options = (f->flash_width == 16) ? NAND_BUSWIDTH_16: 0;
-- 
1.5.5.1
