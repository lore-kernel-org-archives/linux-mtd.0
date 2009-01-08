Received: from vpn.static.83-173-204-231.cybernet.ch ([83.173.204.231]
	helo=localhost.localdomain)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LKibW-00087o-1v
	for linux-mtd@lists.infradead.org; Thu, 08 Jan 2009 00:18:30 +0000
From: Marcel Ziswiler <marcel@ziswiler.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/3 v2] [MTD] [NAND] pxa3xx_nand.c: Coding style clean-up
Date: Thu,  8 Jan 2009 01:06:39 +0100
Message-Id: <1231373200-19248-3-git-send-email-marcel@ziswiler.com>
In-Reply-To: <1231373200-19248-2-git-send-email-marcel@ziswiler.com>
References: <1231373200-19248-1-git-send-email-marcel@ziswiler.com>
	<1231373200-19248-2-git-send-email-marcel@ziswiler.com>
Cc: Marcel Ziswiler <marcel.ziswiler@noser.com>, eric.y.miao@gmail.com,
	Marcel Ziswiler <marcel@ziswiler.com>, LW@KARO-electronics.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Run it through checkpatch and cleaned up obvious style problems.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@noser.com>
---
 drivers/mtd/nand/pxa3xx_nand.c |   17 +++++++++--------
 1 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index dc1cc76..45122ab 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -362,7 +362,8 @@ static int prepare_read_prog_cmd(struct pxa3xx_nand_info *info,
 	info->ndcb0 = cmd | ((cmd & 0xff00) ? NDCB0_DBC : 0);
 	info->ndcb1 = 0;
 	info->ndcb2 = 0;
-	info->ndcb0 |= NDCB0_ADDR_CYC(info->row_addr_cycles + info->col_addr_cycles);
+	info->ndcb0 |= NDCB0_ADDR_CYC(info->row_addr_cycles +
+				      info->col_addr_cycles);
 
 	if (info->col_addr_cycles == 2) {
 		/* large block, 2 cycles for column address
@@ -670,9 +671,9 @@ static void pxa3xx_nand_cmdfunc(struct mtd_info *mtd, unsigned command,
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
@@ -922,13 +923,13 @@ static int pxa3xx_nand_config_flash(struct pxa3xx_nand_info *info,
 }
 
 static int pxa3xx_nand_detect_flash(struct pxa3xx_nand_info *info,
-				    const struct pxa3xx_nand_platform_data *pdata)
+		const struct pxa3xx_nand_platform_data *pdata)
 {
 	const struct pxa3xx_nand_flash *f;
 	uint32_t id = -1;
 	int i;
 
-	for (i = 0; i<pdata->num_flash; ++i) {
+	for (i = 0; i < pdata->num_flash; i++) {
 		f = pdata->flash + i;
 
 		if (pxa3xx_nand_config_flash(info, f))
@@ -958,7 +959,7 @@ static int pxa3xx_nand_detect_flash(struct pxa3xx_nand_info *info,
 #endif
 
 	dev_warn(&info->pdev->dev,
-		 "failed to detect configured nand flash; found %04x instead of\n",
+		 "failed to detect configured NAND flash; found id %04x\n",
 		 id);
 	return -ENODEV;
 }
@@ -1025,7 +1026,7 @@ static void pxa3xx_nand_init_mtd(struct mtd_info *mtd,
 	const struct pxa3xx_nand_flash *f = info->flash_info;
 	struct nand_chip *this = &info->nand_chip;
 
-	this->options = (f->flash_width == 16) ? NAND_BUSWIDTH_16: 0;
+	this->options = (f->flash_width == 16) ? NAND_BUSWIDTH_16 : 0;
 
 	this->waitfunc		= pxa3xx_nand_waitfunc;
 	this->select_chip	= pxa3xx_nand_select_chip;
-- 
1.6.0.6
