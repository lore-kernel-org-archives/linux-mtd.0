Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VHxDS-0008Rw-Sv
 for linux-mtd@lists.infradead.org; Fri, 06 Sep 2013 14:40:56 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [RFC/PATCH] mtd: nand: pxa3xx: Remove redundant device probing
Date: Fri,  6 Sep 2013 11:40:28 -0300
Message-Id: <1378478428-25280-2-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1378478428-25280-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1378478428-25280-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>,
 haojian.zhuang@gmail.com, Daniel Mack <zonque@gmail.com>, b32955@freescale.com,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There's no need to go through this internal probe/auto-detect
procedure, since the nand core code will take care of that.
This commit removes the configuration and detection functions,
together with the built-in flash device table.

Besides being unneeded, it's also wrong to take care of such details
wich rightfully belong to the NAND base code. Removing this wrong
code, prevents the proliferation of the same mistake in future drivers.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
This patch doesn't build, because it needs some other patches to be
applied first. It's not meant for inclusion, but to discuss about
the possibility of engaging such agressive cleanup on this driver.

 drivers/mtd/nand/pxa3xx_nand.c | 134 ++---------------------------------------
 1 file changed, 4 insertions(+), 130 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index a9cfd42..93fe056 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -237,25 +237,6 @@ static bool use_dma = 1;
 module_param(use_dma, bool, 0444);
 MODULE_PARM_DESC(use_dma, "enable DMA for data transferring to/from NAND HW");
 
-static struct pxa3xx_nand_timing timing[] = {
-	{ 40, 80, 60, 100, 80, 100, 90000, 400, 40, },
-	{ 10,  0, 20,  40, 30,  40, 11123, 110, 10, },
-	{ 10, 25, 15,  25, 15,  30, 25000,  60, 10, },
-	{ 10, 35, 15,  25, 15,  25, 25000,  60, 10, },
-};
-
-static struct pxa3xx_nand_flash builtin_flash_types[] = {
-{ "DEFAULT FLASH",      0,   0, 2048,  8,  8,    0, &timing[0] },
-{ "64MiB 16-bit",  0x46ec,  32,  512, 16, 16, 4096, &timing[1] },
-{ "256MiB 8-bit",  0xdaec,  64, 2048,  8,  8, 2048, &timing[1] },
-{ "4GiB 8-bit",    0xd7ec, 128, 4096,  8,  8, 8192, &timing[1] },
-{ "128MiB 8-bit",  0xa12c,  64, 2048,  8,  8, 1024, &timing[2] },
-{ "128MiB 16-bit", 0xb12c,  64, 2048, 16, 16, 1024, &timing[2] },
-{ "512MiB 8-bit",  0xdc2c,  64, 2048,  8,  8, 4096, &timing[2] },
-{ "512MiB 16-bit", 0xcc2c,  64, 2048, 16, 16, 4096, &timing[2] },
-{ "256MiB 16-bit", 0xba20,  64, 2048, 16, 16, 2048, &timing[3] },
-};
-
 static u8 bb_pattern[] = {'M', 'V', 'B', 'b', 't', '0' };
 static u8 bb_mirror_pattern[] = {'1', 't', 'b', 'B', 'V', 'M' };
 
@@ -287,8 +268,6 @@ static struct nand_bbt_descr bb_2k = {
 	.len = 2,
 	.pattern = bb_scan_pattern
 };
-/* Define a default flash type setting serve as flash detecting only */
-#define DEFAULT_FLASH_TYPE (&builtin_flash_types[0])
 
 #define NDTR0_tCH(c)	(min((c), 7) << 19)
 #define NDTR0_tCS(c)	(min((c), 7) << 16)
@@ -906,53 +885,7 @@ static int pxa3xx_nand_waitfunc(struct mtd_info *mtd, struct nand_chip *this)
 	return 0;
 }
 
-static int pxa3xx_nand_config_flash(struct pxa3xx_nand_info *info,
-				    const struct pxa3xx_nand_flash *f)
-{
-	struct platform_device *pdev = info->pdev;
-	struct pxa3xx_nand_platform_data *pdata = dev_get_platdata(&pdev->dev);
-	struct pxa3xx_nand_host *host = info->host[info->cs];
-	uint32_t ndcr = 0x0; /* enable all interrupts */
-
-	if (f->page_size != 2048 && f->page_size != 512) {
-		dev_err(&pdev->dev, "Current only support 2048 and 512 size\n");
-		return -EINVAL;
-	}
-
-	if (f->flash_width != 16 && f->flash_width != 8) {
-		dev_err(&pdev->dev, "Only support 8bit and 16 bit!\n");
-		return -EINVAL;
-	}
-
-	/* calculate flash information */
-	host->page_size = f->page_size;
-	host->read_id_bytes = (f->page_size == 2048) ? 4 : 2;
-
-	/* calculate addressing information */
-	host->col_addr_cycles = (f->page_size == 2048) ? 2 : 1;
-
-	if (f->num_blocks * f->page_per_block > 65536)
-		host->row_addr_cycles = 3;
-	else
-		host->row_addr_cycles = 2;
-
-	ndcr |= (pdata->enable_arbiter) ? NDCR_ND_ARB_EN : 0;
-	ndcr |= (host->col_addr_cycles == 2) ? NDCR_RA_START : 0;
-	ndcr |= (f->page_per_block == 64) ? NDCR_PG_PER_BLK : 0;
-	ndcr |= (f->page_size == 2048) ? NDCR_PAGE_SZ : 0;
-	ndcr |= (f->flash_width == 16) ? NDCR_DWIDTH_M : 0;
-	ndcr |= (f->dfc_width == 16) ? NDCR_DWIDTH_C : 0;
-
-	ndcr |= NDCR_RD_ID_CNT(host->read_id_bytes);
-	ndcr |= NDCR_SPARE_EN; /* enable spare by default */
-
-	info->reg_ndcr = ndcr;
-
-	pxa3xx_nand_set_timing(host, f->timing);
-	return 0;
-}
-
-static int pxa3xx_nand_detect_config(struct pxa3xx_nand_info *info)
+static void pxa3xx_nand_detect_config(struct pxa3xx_nand_info *info)
 {
 	/*
 	 * We set 0 by hard coding here, for we don't support keep_config
@@ -973,7 +906,6 @@ static int pxa3xx_nand_detect_config(struct pxa3xx_nand_info *info)
 	info->reg_ndcr = ndcr & ~NDCR_INT_MASK;
 	info->ndtr0cs0 = nand_readl(info, NDTR0CS0);
 	info->ndtr1cs0 = nand_readl(info, NDTR1CS0);
-	return 0;
 }
 
 /* the maximum possible buffer size for large page with OOB data
@@ -1046,17 +978,10 @@ static void pxa3xx_nand_free_buff(struct pxa3xx_nand_info *info)
 static int pxa3xx_nand_sensing(struct pxa3xx_nand_info *info)
 {
 	struct mtd_info *mtd;
-	int ret;
 	mtd = info->host[info->cs]->mtd;
-	/* use the common timing to make a try */
-	ret = pxa3xx_nand_config_flash(info, &builtin_flash_types[0]);
-	if (ret)
-		return ret;
-
 	pxa3xx_nand_cmdfunc(mtd, NAND_CMD_RESET, 0, 0);
 	if (info->is_ready)
 		return 0;
-
 	return -ENODEV;
 }
 
@@ -1064,69 +989,18 @@ static int pxa3xx_nand_scan(struct mtd_info *mtd)
 {
 	struct pxa3xx_nand_host *host = mtd->priv;
 	struct pxa3xx_nand_info *info = host->info_data;
-	struct platform_device *pdev = info->pdev;
-	struct pxa3xx_nand_platform_data *pdata = dev_get_platdata(&pdev->dev);
-	struct nand_flash_dev pxa3xx_flash_ids[2], *def = NULL;
-	const struct pxa3xx_nand_flash *f = NULL;
 	struct nand_chip *chip = mtd->priv;
-	uint32_t id = -1;
-	uint64_t chipsize;
-	int i, ret, num;
+	int ret;
 
-	if (pdata->keep_config && !pxa3xx_nand_detect_config(info))
-		goto KEEP_CONFIG;
+	pxa3xx_nand_detect_config(info);
 
 	ret = pxa3xx_nand_sensing(info);
 	if (ret) {
 		dev_info(&info->pdev->dev, "There is no chip on cs %d!\n",
 			 info->cs);
-
-		return ret;
-	}
-
-	chip->cmdfunc(mtd, NAND_CMD_READID, 0, 0);
-	id = *((uint16_t *)(info->data_buff));
-	if (id != 0)
-		dev_info(&info->pdev->dev, "Detect a flash id %x\n", id);
-	else {
-		dev_warn(&info->pdev->dev,
-			 "Read out ID 0, potential timing set wrong!!\n");
-
-		return -EINVAL;
-	}
-
-	num = ARRAY_SIZE(builtin_flash_types) - 1;
-	for (i = 0; i < num; i++) {
-		f = &builtin_flash_types[i + 1];
-
-		/* find the chip in default list */
-		if (f->chip_id == id)
-			break;
-	}
-
-	if (i >= (ARRAY_SIZE(builtin_flash_types) - 1)) {
-		dev_err(&info->pdev->dev, "ERROR!! flash not defined!!!\n");
-
-		return -EINVAL;
-	}
-
-	ret = pxa3xx_nand_config_flash(info, f);
-	if (ret) {
-		dev_err(&info->pdev->dev, "ERROR! Configure failed\n");
 		return ret;
 	}
 
-	pxa3xx_flash_ids[0].name = f->name;
-	pxa3xx_flash_ids[0].dev_id = (f->chip_id >> 8) & 0xffff;
-	pxa3xx_flash_ids[0].pagesize = f->page_size;
-	chipsize = (uint64_t)f->num_blocks * f->page_per_block * f->page_size;
-	pxa3xx_flash_ids[0].chipsize = chipsize >> 20;
-	pxa3xx_flash_ids[0].erasesize = f->page_size * f->page_per_block;
-	if (f->flash_width == 16)
-		pxa3xx_flash_ids[0].options = NAND_BUSWIDTH_16;
-	pxa3xx_flash_ids[1].name = NULL;
-	def = pxa3xx_flash_ids;
-KEEP_CONFIG:
 	chip->ecc.mode = NAND_ECC_HW;
 	chip->ecc.size = info->fifo_size;
 	chip->ecc.strength = 1;
@@ -1134,7 +1008,7 @@ KEEP_CONFIG:
 	if (info->reg_ndcr & NDCR_DWIDTH_M)
 		chip->options |= NAND_BUSWIDTH_16;
 
-	if (nand_scan_ident(mtd, 1, def))
+	if (nand_scan_ident(mtd, 1, NULL))
 		return -ENODEV;
 	/* calculate addressing information */
 	if (mtd->writesize >= 2048)
-- 
1.8.1.5
