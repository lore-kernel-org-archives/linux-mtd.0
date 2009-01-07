Received: from vpn.static.83-173-204-231.cybernet.ch ([83.173.204.231]
	helo=localhost.localdomain)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LKOfL-0003mG-0j
	for linux-mtd@lists.infradead.org; Wed, 07 Jan 2009 03:01:07 +0000
From: Marcel Ziswiler <marcel@ziswiler.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/3] Coding style clean-up
Date: Wed,  7 Jan 2009 03:40:52 +0100
Message-Id: <1231296053-2378-3-git-send-email-marcel@ziswiler.com>
In-Reply-To: <1231296053-2378-2-git-send-email-marcel@ziswiler.com>
References: <1231296053-2378-1-git-send-email-marcel@ziswiler.com>
	<1231296053-2378-2-git-send-email-marcel@ziswiler.com>
Cc: eric.y.miao@gmail.com, Marcel Ziswiler <marcel@ziswiler.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Run it through checkpatch and cleaned up obvious style problems.

Signed-off-by: Marcel Ziswiler <marcel@ziswiler.com>
---
 drivers/mtd/nand/pxa3xx_nand.c |   26 ++++++++++++++------------
 1 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 761e43d..d2da717 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -362,7 +362,8 @@ static int prepare_read_prog_cmd(struct pxa3xx_nand_info *info,
 	info->ndcb0 = cmd | ((cmd & 0xff00) ? NDCB0_DBC : 0);
 	info->ndcb1 = 0;
 	info->ndcb2 = 0;
-	info->ndcb0 |= NDCB0_ADDR_CYC(info->row_addr_cycles + info->col_addr_cycles);
+	info->ndcb0 |= NDCB0_ADDR_CYC(info->row_addr_cycles +
+			info->col_addr_cycles);
 
 	if (info->col_addr_cycles == 2) {
 		/* large block, 2 cycles for column address
@@ -647,7 +648,8 @@ static void pxa3xx_nand_cmdfunc(struct mtd_info *mtd, unsigned command,
 		info->buf_count = mtd->writesize + mtd->oobsize;
 		info->buf_start = mtd->writesize + column;
 
-		if (prepare_read_prog_cmd(info, cmdset->read1, column, page_addr))
+		if (prepare_read_prog_cmd(info, cmdset->read1, column,
+				page_addr))
 			break;
 
 		pxa3xx_nand_do_cmd(info, NDSR_RDDREQ | NDSR_DBERR);
@@ -664,15 +666,16 @@ static void pxa3xx_nand_cmdfunc(struct mtd_info *mtd, unsigned command,
 		info->buf_count = mtd->writesize + mtd->oobsize;
 		memset(info->data_buff, 0xFF, info->buf_count);
 
-		if (prepare_read_prog_cmd(info, cmdset->read1, column, page_addr))
+		if (prepare_read_prog_cmd(info, cmdset->read1, column,
+				page_addr))
 			break;
 
 		pxa3xx_nand_do_cmd(info, NDSR_RDDREQ | NDSR_DBERR);
 
 		if (info->retcode == ERR_DBERR) {
-			/* for blank page (all 0xff), HW will calculate its ECC as
-			 * 0, which is different from the ECC information within
-			 * OOB, ignore such double bit errors
+			/* for blank page (all 0xff), HW will calculate its ECC
+			 * as 0, which is different from the ECC information
+			 * within OOB, ignore such double bit errors
 			 */
 			if (is_buf_blank(info->data_buff, mtd->writesize))
 				info->retcode = ERR_NONE;
@@ -922,13 +925,13 @@ static int pxa3xx_nand_config_flash(struct pxa3xx_nand_info *info,
 }
 
 static int pxa3xx_nand_detect_flash(struct pxa3xx_nand_info *info,
-				    const struct pxa3xx_nand_platform_data *pdata)
+		const struct pxa3xx_nand_platform_data *pdata)
 {
 	const struct pxa3xx_nand_flash *f;
 	uint32_t id = -1;
 	int i;
 
-	for (i = 0; i<pdata->num_flash; ++i) {
+	for (i = 0; i < pdata->num_flash; ++i) {
 		f = pdata->flash + i;
 
 		if (pxa3xx_nand_config_flash(info, f))
@@ -957,9 +960,8 @@ static int pxa3xx_nand_detect_flash(struct pxa3xx_nand_info *info,
 	}
 #endif
 
-	dev_warn(&info->pdev->dev,
-		 "failed to detect configured nand flash; found %04x instead of\n",
-		 id);
+	dev_warn(&info->pdev->dev, "failed to detect configured nand flash; "
+			"found %04x instead of\n", id);
 	return -ENODEV;
 }
 
@@ -1025,7 +1027,7 @@ static void pxa3xx_nand_init_mtd(struct mtd_info *mtd,
 	const struct pxa3xx_nand_flash *f = info->flash_info;
 	struct nand_chip *this = &info->nand_chip;
 
-	this->options = (f->flash_width == 16) ? NAND_BUSWIDTH_16: 0;
+	this->options = (f->flash_width == 16) ? NAND_BUSWIDTH_16 : 0;
 
 	this->waitfunc		= pxa3xx_nand_waitfunc;
 	this->select_chip	= pxa3xx_nand_select_chip;
-- 
1.6.0.6
