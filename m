MIME-Version: 1.0
Date: Wed, 18 Aug 2010 22:36:24 +0800
Message-ID: <AANLkTikngmRrF35E66NN2cOfgHf1kc0QY6h+40k9mUxT@mail.gmail.com>
Subject: [PATCH 5/5] pxa3xx_nand: set oob length in the runtime
From: Haojian Zhuang <haojian.zhuang@gmail.com>
To: Eric Miao <eric.y.miao@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From 85d8cdc6774445d3ec7842de5227e9798f13efa3 Mon Sep 17 00:00:00 2001
From: Lei Wen <leiwen@marvell.com>
Date: Tue, 17 Aug 2010 14:09:30 +0800
Subject: [PATCH 5/5] pxa3xx_nand: set oob length in the runtime

For different command need different oob requirement, set the proper
oob length by different cmd.

Signed-off-by: Lei Wen <leiwen@marvell.com>
---
 drivers/mtd/nand/pxa3xx_nand.c |   25 ++++++++++++++++++-------
 1 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index dce9407..5d24968 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -273,13 +273,20 @@ static int wait_for_event(struct
pxa3xx_nand_info *info, uint32_t event)

 static void pxa3xx_set_datasize(struct pxa3xx_nand_info *info)
 {
-	/* calculate data size */
+	int oob_enable = info->reg_ndcr & NDCR_SPARE_EN;
+
+	info->data_size = info->page_size;
+	if (!oob_enable) {
+		info->oob_size = 0;
+		return;
+	}
+
 	switch (info->page_size) {
 	case 2048:
-		info->data_size = (info->use_ecc) ? 2088 : 2112;
+		info->oob_size = (info->use_ecc) ? 40 : 64;
 		break;
 	case 512:
-		info->data_size = (info->use_ecc) ? 520 : 528;
+		info->oob_size = (info->use_ecc) ? 8 : 16;
 		break;
 	}
 }
@@ -333,6 +340,7 @@ static int prepare_other_cmd(struct
pxa3xx_nand_info *info, uint16_t cmd)
 	info->ndcb1 = 0;
 	info->ndcb2 = 0;

+	info->oob_size = 0;
 	if (cmd == cmdset->read_id) {
 		info->ndcb0 |= NDCB0_CMD_TYPE(3);
 		info->data_size = 8;
@@ -401,6 +409,9 @@ static int handle_data_pio(struct pxa3xx_nand_info *info)
 	case STATE_PIO_WRITING:
 		__raw_writesl(info->mmio_base + NDDB, info->data_buff,
 				DIV_ROUND_UP(info->data_size, 4));
+		if (info->oob_size > 0)
+			__raw_writesl(info->mmio_base + NDDB, info->oob_buff,
+					DIV_ROUND_UP(info->oob_size, 4));

 		enable_int(info, NDSR_CS0_BBD | NDSR_CS0_CMDD);

@@ -413,6 +424,9 @@ static int handle_data_pio(struct pxa3xx_nand_info *info)
 	case STATE_PIO_READING:
 		__raw_readsl(info->mmio_base + NDDB, info->data_buff,
 				DIV_ROUND_UP(info->data_size, 4));
+		if (info->oob_size > 0)
+			__raw_readsl(info->mmio_base + NDDB, info->oob_buff,
+					DIV_ROUND_UP(info->oob_size, 4));
 		break;
 	default:
 		printk(KERN_ERR "%s: invalid state %d\n", __func__,
@@ -427,7 +441,7 @@ static int handle_data_pio(struct pxa3xx_nand_info *info)
 static void start_data_dma(struct pxa3xx_nand_info *info, int dir_out)
 {
 	struct pxa_dma_desc *desc = info->data_desc;
-	int dma_len = ALIGN(info->data_size, 32);
+	int dma_len = ALIGN(info->data_size + info->oob_size, 32);

 	desc->ddadr = DDADR_STOP;
 	desc->dcmd = DCMD_ENDIRQEN | DCMD_WIDTH4 | DCMD_BURST32 | dma_len;
@@ -833,7 +847,6 @@ static int pxa3xx_nand_config_flash(struct
pxa3xx_nand_info *info,
 	info->cmdset = f->cmdset;
 	info->page_size = f->page_size;
 	info->oob_buff = info->data_buff + f->page_size;
-	info->oob_size = (f->page_size == 2048) ? 64 : 16;
 	info->read_id_bytes = (f->page_size == 2048) ? 4 : 2;

 	/* calculate addressing information */
@@ -892,8 +905,6 @@ static int pxa3xx_nand_detect_config(struct
pxa3xx_nand_info *info)
 	i = __ffs(page_per_block * info->page_size);
 	num_blocks = type->chipsize << (20 - i);

-	info->oob_size = (info->page_size == 2048) ? 64 : 16;
-
 	/* calculate addressing information */
 	info->col_addr_cycles = (info->page_size == 2048) ? 2 : 1;

-- 
1.7.0.4
