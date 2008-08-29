Received: from mail.cvg.de ([62.153.82.30])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KZ1hw-0004Sp-0D
	for linux-mtd@lists.infradead.org; Fri, 29 Aug 2008 11:00:00 +0000
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 4/6] pxa3xx_nand: added some 'const' annotations to the
	exported API
Date: Fri, 29 Aug 2008 12:59:50 +0200
Message-Id: <1220007592-26894-3-git-send-email-enrico.scholz@sigma-chemnitz.de>
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

This patch marks some attributes as 'const' which are set only once and
never be modified by the driver.  There are some changes in parameter
list and variable declarations too which mark them as 'const'.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 arch/arm/mach-pxa/include/mach/pxa3xx_nand.h |    8 ++++----
 drivers/mtd/nand/pxa3xx_nand.c               |   10 +++++-----
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm/mach-pxa/include/mach/pxa3xx_nand.h b/arch/arm/mach-pxa/include/mach/pxa3xx_nand.h
index 6ac9aea..e2a1c8a 100644
--- a/arch/arm/mach-pxa/include/mach/pxa3xx_nand.h
+++ b/arch/arm/mach-pxa/include/mach/pxa3xx_nand.h
@@ -30,8 +30,8 @@ struct pxa3xx_nand_cmdset {
 };
 
 struct pxa3xx_nand_flash {
-	struct pxa3xx_nand_timing *timing; /* NAND Flash timing */
-	struct pxa3xx_nand_cmdset *cmdset;
+	struct pxa3xx_nand_timing const	*timing; /* NAND Flash timing */
+	struct pxa3xx_nand_cmdset const	*cmdset;
 
 	uint32_t page_per_block;/* Pages per block (PG_PER_BLK) */
 	uint32_t page_size;	/* Page size in bytes (PAGE_SZ) */
@@ -56,8 +56,8 @@ struct pxa3xx_nand_platform_data {
 	 */
 	int	enable_arbiter;
 
-	struct mtd_partition *parts;
-	unsigned int	nr_parts;
+	struct mtd_partition const		*parts;
+	unsigned int				nr_parts;
 
 	struct pxa3xx_nand_flash * const	flash;
 	size_t					num_flash;
diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index bff2ac3..2be5116 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -270,7 +270,7 @@ static struct pxa3xx_nand_flash *builtin_flash_types[] = {
 #define ns2cycle(ns, clk)	(int)(((ns) * (clk / 1000000) / 1000) + 1)
 
 static void pxa3xx_nand_set_timing(struct pxa3xx_nand_info *info,
-				   struct pxa3xx_nand_timing *t)
+				   struct pxa3xx_nand_timing const *t)
 {
 	unsigned long nand_clk = clk_get_rate(info->clk);
 	uint32_t ndtr0, ndtr1;
@@ -313,7 +313,7 @@ static int prepare_read_prog_cmd(struct pxa3xx_nand_info *info,
 			uint16_t cmd, int column, int page_addr)
 {
 	struct pxa3xx_nand_flash *f = info->flash_info;
-	struct pxa3xx_nand_cmdset *cmdset = f->cmdset;
+	struct pxa3xx_nand_cmdset const *cmdset = f->cmdset;
 
 	/* calculate data size */
 	switch (f->page_size) {
@@ -364,7 +364,7 @@ static int prepare_erase_cmd(struct pxa3xx_nand_info *info,
 
 static int prepare_other_cmd(struct pxa3xx_nand_info *info, uint16_t cmd)
 {
-	struct pxa3xx_nand_cmdset *cmdset = info->flash_info->cmdset;
+	struct pxa3xx_nand_cmdset const *cmdset = info->flash_info->cmdset;
 
 	info->ndcb0 = cmd | ((cmd & 0xff00) ? NDCB0_DBC : 0);
 	info->ndcb1 = 0;
@@ -600,7 +600,7 @@ static void pxa3xx_nand_cmdfunc(struct mtd_info *mtd, unsigned command,
 {
 	struct pxa3xx_nand_info *info = mtd->priv;
 	struct pxa3xx_nand_flash *flash_info = info->flash_info;
-	struct pxa3xx_nand_cmdset *cmdset = flash_info->cmdset;
+	struct pxa3xx_nand_cmdset const *cmdset = flash_info->cmdset;
 	int ret;
 
 	info->use_dma = (use_dma) ? 1 : 0;
@@ -820,7 +820,7 @@ static int pxa3xx_nand_ecc_correct(struct mtd_info *mtd,
 static int __readid(struct pxa3xx_nand_info *info, uint32_t *id)
 {
 	struct pxa3xx_nand_flash *f = info->flash_info;
-	struct pxa3xx_nand_cmdset *cmdset = f->cmdset;
+	struct pxa3xx_nand_cmdset const *cmdset = f->cmdset;
 	uint32_t ndcr;
 	uint8_t  id_buff[8];
 
-- 
1.5.5.1
