Received: from dakia2.marvell.com ([65.219.4.35])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTt62-0005s2-Ig
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 10:01:16 +0000
From: Lei Wen <leiwen@marvell.com>
To: Artem Bityutskiy <dedekind1@gmail.com>, Daniel Mack <zonque@gmail.com>,
	Haojian Zhuang <haojian.zhuang@marvell.com>,
	linux-arm-kernel@lists.infradead.org,
	David Woodhouse <David.Woodhouse@intel.com>,
	linux-mtd@lists.infradead.org, adrian.wenl@gmail.com
Subject: [PATCH 1/2] MTD: pxa3xx_nand: fix nand detection issue
Date: Tue,  7 Jun 2011 03:01:06 -0700
Message-Id: <1307440867-18993-1-git-send-email-leiwen@marvell.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When keep_config is set, the detection would goes different routine.
That the driver would read out the setting which is set previously
by bootloader. While most bootloader keep the irq mask as off, and
current driver need all irq default open, keep_config behavior would
lead to no irq at all.

Signed-off-by: Lei Wen <leiwen@marvell.com>
Tested-by: Daniel Mack <zonque@gmail.com>
Cc: stable@kernel.org
---
 drivers/mtd/nand/pxa3xx_nand.c |   12 +++++++-----
 1 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 1fb3b3a..faa0edd 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -813,7 +813,7 @@ static int pxa3xx_nand_detect_config(struct pxa3xx_nand_info *info)
 	info->page_size = ndcr & NDCR_PAGE_SZ ? 2048 : 512;
 	/* set info fields needed to read id */
 	info->read_id_bytes = (info->page_size == 2048) ? 4 : 2;
-	info->reg_ndcr = ndcr;
+	info->reg_ndcr = ndcr & ~NDCR_INT_MASK;
 	info->cmdset = &default_cmdset;
 
 	info->ndtr0cs0 = nand_readl(info, NDTR0CS0);
@@ -882,7 +882,7 @@ static int pxa3xx_nand_scan(struct mtd_info *mtd)
 	struct pxa3xx_nand_info *info = mtd->priv;
 	struct platform_device *pdev = info->pdev;
 	struct pxa3xx_nand_platform_data *pdata = pdev->dev.platform_data;
-	struct nand_flash_dev pxa3xx_flash_ids[2] = { {NULL,}, {NULL,} };
+	struct nand_flash_dev pxa3xx_flash_ids[2], *def = NULL;
 	const struct pxa3xx_nand_flash *f = NULL;
 	struct nand_chip *chip = mtd->priv;
 	uint32_t id = -1;
@@ -942,8 +942,10 @@ static int pxa3xx_nand_scan(struct mtd_info *mtd)
 	pxa3xx_flash_ids[0].erasesize = f->page_size * f->page_per_block;
 	if (f->flash_width == 16)
 		pxa3xx_flash_ids[0].options = NAND_BUSWIDTH_16;
+	pxa3xx_flash_ids[1].name = NULL;
+	def = pxa3xx_flash_ids;
 KEEP_CONFIG:
-	if (nand_scan_ident(mtd, 1, pxa3xx_flash_ids))
+	if (nand_scan_ident(mtd, 1, def))
 		return -ENODEV;
 	/* calculate addressing information */
 	info->col_addr_cycles = (mtd->writesize >= 2048) ? 2 : 1;
@@ -954,9 +956,9 @@ KEEP_CONFIG:
 		info->row_addr_cycles = 2;
 	mtd->name = mtd_names[0];
 	chip->ecc.mode = NAND_ECC_HW;
-	chip->ecc.size = f->page_size;
+	chip->ecc.size = info->page_size;
 
-	chip->options = (f->flash_width == 16) ? NAND_BUSWIDTH_16 : 0;
+	chip->options = (info->reg_ndcr & NDCR_DWIDTH_M) ? NAND_BUSWIDTH_16 : 0;
 	chip->options |= NAND_NO_AUTOINCR;
 	chip->options |= NAND_NO_READRDY;
 
-- 
1.7.0.4
