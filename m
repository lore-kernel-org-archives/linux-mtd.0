Received: from 89.6b.364a.static.theplanet.com ([74.54.107.137]
	helo=cathcart.site5.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LPB7U-0002Fy-6c
	for linux-mtd@lists.infradead.org; Tue, 20 Jan 2009 07:34:01 +0000
From: Mike Rapoport <mike@compulab.co.il>
To: eric.miao@marvell.com
Subject: [PATCH] MTD: NAND: pxa3xx_nand: add ability to keep controller
	settings defined by OBM/bootloader
Date: Tue, 20 Jan 2009 09:33:48 +0200
Message-Id: <1232436828-15176-4-git-send-email-mike@compulab.co.il>
In-Reply-To: <1232436828-15176-3-git-send-email-mike@compulab.co.il>
References: <f17812d70901191916u3891547ds393942a4e444a351@mail.gmail.com>
	<1232436828-15176-1-git-send-email-mike@compulab.co.il>
	<1232436828-15176-2-git-send-email-mike@compulab.co.il>
	<1232436828-15176-3-git-send-email-mike@compulab.co.il>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.arm.linux.org.uk,
	ben-linux@fluff.org, Mike Rapoport <mike@compulab.co.il>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Signed-off-by: Mike Rapoport <mike@compulab.co.il>
---
 arch/arm/mach-pxa/include/mach/pxa3xx_nand.h |    3 +
 drivers/mtd/nand/pxa3xx_nand.c               |  103 +++++++++++++++++++++++++-
 2 files changed, 105 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-pxa/include/mach/pxa3xx_nand.h b/arch/arm/mach-pxa/include/mach/pxa3xx_nand.h
index eb35fca..3478eae 100644
--- a/arch/arm/mach-pxa/include/mach/pxa3xx_nand.h
+++ b/arch/arm/mach-pxa/include/mach/pxa3xx_nand.h
@@ -49,6 +49,9 @@ struct pxa3xx_nand_platform_data {
 	 */
 	int	enable_arbiter;
 
+	/* allow platform code to keep OBM/bootloader defined NFC config */
+	int	keep_config;
+
 	const struct mtd_partition		*parts;
 	unsigned int				nr_parts;
 
diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index ead4a7a..2857a6a 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -171,7 +171,13 @@ static int use_dma = 1;
 module_param(use_dma, bool, 0444);
 MODULE_PARM_DESC(use_dma, "enable DMA for data transfering to/from NAND HW");
 
-#ifdef CONFIG_MTD_NAND_PXA3xx_BUILTIN
+/*
+ * Default NAND flash controller configuration setup by the
+ * bootloader. This configuration is used only when pdata->keep_config is set
+ */
+static struct pxa3xx_nand_timing default_timing;
+static struct pxa3xx_nand_flash default_flash;
+
 static struct pxa3xx_nand_cmdset smallpage_cmdset = {
 	.read1		= 0x0000,
 	.read2		= 0x0050,
@@ -198,6 +204,7 @@ static struct pxa3xx_nand_cmdset largepage_cmdset = {
 	.lock_status	= 0x007A,
 };
 
+#ifdef CONFIG_MTD_NAND_PXA3xx_BUILTIN
 static struct pxa3xx_nand_timing samsung512MbX16_timing = {
 	.tCH	= 10,
 	.tCS	= 0,
@@ -297,9 +304,23 @@ static struct pxa3xx_nand_flash *builtin_flash_types[] = {
 #define NDTR1_tWHR(c)	(min((c), 15) << 4)
 #define NDTR1_tAR(c)	(min((c), 15) << 0)
 
+#define tCH_NDTR0(r)	(((r) >> 19) & 0x7)
+#define tCS_NDTR0(r)	(((r) >> 16) & 0x7)
+#define tWH_NDTR0(r)	(((r) >> 11) & 0x7)
+#define tWP_NDTR0(r)	(((r) >> 8) & 0x7)
+#define tRH_NDTR0(r)	(((r) >> 3) & 0x7)
+#define tRP_NDTR0(r)	(((r) >> 0) & 0x7)
+
+#define tR_NDTR1(r)	(((r) >> 16) & 0xffff)
+#define tWHR_NDTR1(r)	(((r) >> 4) & 0xf)
+#define tAR_NDTR1(r)	(((r) >> 0) & 0xf)
+
 /* convert nano-seconds to nand flash controller clock cycles */
 #define ns2cycle(ns, clk)	(int)(((ns) * (clk / 1000000) / 1000) - 1)
 
+/* convert nand flash controller clock cycles to nano-seconds */
+#define cycle2ns(c, clk)	((((c) + 1) * 1000000 + clk / 500) / (clk / 1000))
+
 static void pxa3xx_nand_set_timing(struct pxa3xx_nand_info *info,
 				   const struct pxa3xx_nand_timing *t)
 {
@@ -921,6 +942,82 @@ static int pxa3xx_nand_config_flash(struct pxa3xx_nand_info *info,
 	return 0;
 }
 
+static void pxa3xx_nand_detect_timing(struct pxa3xx_nand_info *info,
+				      struct pxa3xx_nand_timing *t)
+{
+	unsigned long nand_clk = clk_get_rate(info->clk);
+	uint32_t ndtr0 = nand_readl(info, NDTR0CS0);
+	uint32_t ndtr1 = nand_readl(info, NDTR1CS0);
+
+	t->tCH = cycle2ns(tCH_NDTR0(ndtr0), nand_clk);
+	t->tCS = cycle2ns(tCS_NDTR0(ndtr0), nand_clk);
+	t->tWH = cycle2ns(tWH_NDTR0(ndtr0), nand_clk);
+	t->tWP = cycle2ns(tWP_NDTR0(ndtr0), nand_clk);
+	t->tRH = cycle2ns(tRH_NDTR0(ndtr0), nand_clk);
+	t->tRP = cycle2ns(tRP_NDTR0(ndtr0), nand_clk);
+
+	t->tR = cycle2ns(tR_NDTR1(ndtr1), nand_clk);
+	t->tWHR = cycle2ns(tWHR_NDTR1(ndtr1), nand_clk);
+	t->tAR = cycle2ns(tAR_NDTR1(ndtr1), nand_clk);
+}
+
+static int pxa3xx_nand_detect_config(struct pxa3xx_nand_info *info)
+{
+	uint32_t ndcr = nand_readl(info, NDCR);
+	struct nand_flash_dev *type = NULL;
+	uint32_t id = -1;
+	int i;
+
+	default_flash.page_per_block = ndcr & NDCR_PG_PER_BLK ? 64 : 32;
+	default_flash.page_size = ndcr & NDCR_PAGE_SZ ? 2048 : 512;
+	default_flash.flash_width = ndcr & NDCR_DWIDTH_M ? 16 : 8;
+	default_flash.dfc_width = ndcr & NDCR_DWIDTH_C ? 16 : 8;
+
+	if (default_flash.page_size == 2048)
+		default_flash.cmdset = &largepage_cmdset;
+	else
+		default_flash.cmdset = &smallpage_cmdset;
+
+	/* set info fields needed to __readid */
+	info->flash_info = &default_flash;
+	info->read_id_bytes = (default_flash.page_size == 2048) ? 4 : 2;
+	info->reg_ndcr = ndcr;
+
+	if (__readid(info, &id))
+		return -ENODEV;
+
+	/* Lookup the flash id */
+	id = (id >> 8) & 0xff;		/* device id is byte 2 */
+	for (i = 0; nand_flash_ids[i].name != NULL; i++) {
+		if (id == nand_flash_ids[i].id) {
+			type =  &nand_flash_ids[i];
+			break;
+		}
+	}
+
+	if (!type)
+		return -ENODEV;
+
+	/* fill the missing flash information */
+	i = __ffs(default_flash.page_per_block * default_flash.page_size);
+	default_flash.num_blocks = type->chipsize << (20 - i);
+
+	info->oob_size = (default_flash.page_size == 2048) ? 64 : 16;
+
+	/* calculate addressing information */
+	info->col_addr_cycles = (default_flash.page_size == 2048) ? 2 : 1;
+
+	if (default_flash.num_blocks * default_flash.page_per_block > 65536)
+		info->row_addr_cycles = 3;
+	else
+		info->row_addr_cycles = 2;
+
+	pxa3xx_nand_detect_timing(info, &default_timing);
+	default_flash.timing = &default_timing;
+
+	return 0;
+}
+
 static int pxa3xx_nand_detect_flash(struct pxa3xx_nand_info *info,
 				    const struct pxa3xx_nand_platform_data *pdata)
 {
@@ -928,6 +1025,10 @@ static int pxa3xx_nand_detect_flash(struct pxa3xx_nand_info *info,
 	uint32_t id = -1;
 	int i;
 
+	if (pdata->keep_config)
+		if (pxa3xx_nand_detect_config(info) == 0)
+			return 0;
+
 	for (i = 0; i<pdata->num_flash; ++i) {
 		f = pdata->flash + i;
 
-- 
1.5.6.4
