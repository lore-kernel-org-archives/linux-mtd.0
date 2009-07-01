Received: from legaljet.webserversystems.com ([67.18.134.218]
	helo=compulab.site5.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MM1TJ-0000vU-Gp
	for linux-mtd@lists.infradead.org; Wed, 01 Jul 2009 15:11:48 +0000
From: Mike Rapoport <mike@compulab.co.il>
To: dwmw2@infradead.org
Subject: [PATCH] [MTD] [NAND] pxa3xx_nand: add single-bit error corrections
	reporting
Date: Wed,  1 Jul 2009 18:11:35 +0300
Message-Id: <1246461095-13590-1-git-send-email-mike@compulab.co.il>
Cc: linux-mtd@lists.infradead.org, Yeasah Pell <yeasah@comrex.com>,
	eric.y.miao@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Yeasah Pell <yeasah@comrex.com>

Signed-off-by: Yeasah Pell <yeasah@comrex.com>
Signed-off-by: Mike Rapoport <mike@compulab.co.il>
---
 drivers/mtd/nand/pxa3xx_nand.c |   17 ++++++++++++-----
 1 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 30a8ce6..6ea520a 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -102,6 +102,7 @@ enum {
 	ERR_SENDCMD	= -2,
 	ERR_DBERR	= -3,
 	ERR_BBERR	= -4,
+	ERR_SBERR	= -5,
 };
 
 enum {
@@ -564,11 +565,13 @@ static irqreturn_t pxa3xx_nand_irq(int irq, void *devid)
 
 	status = nand_readl(info, NDSR);
 
-	if (status & (NDSR_RDDREQ | NDSR_DBERR)) {
+	if (status & (NDSR_RDDREQ | NDSR_DBERR | NDSR_SBERR)) {
 		if (status & NDSR_DBERR)
 			info->retcode = ERR_DBERR;
+		else if (status & NDSR_SBERR)
+			info->retcode = ERR_SBERR;
 
-		disable_int(info, NDSR_RDDREQ | NDSR_DBERR);
+		disable_int(info, NDSR_RDDREQ | NDSR_DBERR | NDSR_SBERR);
 
 		if (info->use_dma) {
 			info->state = STATE_DMA_READING;
@@ -670,7 +673,7 @@ static void pxa3xx_nand_cmdfunc(struct mtd_info *mtd, unsigned command,
 		if (prepare_read_prog_cmd(info, cmdset->read1, column, page_addr))
 			break;
 
-		pxa3xx_nand_do_cmd(info, NDSR_RDDREQ | NDSR_DBERR);
+		pxa3xx_nand_do_cmd(info, NDSR_RDDREQ | NDSR_DBERR | NDSR_SBERR);
 
 		/* We only are OOB, so if the data has error, does not matter */
 		if (info->retcode == ERR_DBERR)
@@ -687,7 +690,7 @@ static void pxa3xx_nand_cmdfunc(struct mtd_info *mtd, unsigned command,
 		if (prepare_read_prog_cmd(info, cmdset->read1, column, page_addr))
 			break;
 
-		pxa3xx_nand_do_cmd(info, NDSR_RDDREQ | NDSR_DBERR);
+		pxa3xx_nand_do_cmd(info, NDSR_RDDREQ | NDSR_DBERR | NDSR_SBERR);
 
 		if (info->retcode == ERR_DBERR) {
 			/* for blank page (all 0xff), HW will calculate its ECC as
@@ -861,8 +864,12 @@ static int pxa3xx_nand_ecc_correct(struct mtd_info *mtd,
 	 * consider it as a ecc error which will tell the caller the
 	 * read fail We have distinguish all the errors, but the
 	 * nand_read_ecc only check this function return value
+	 *
+	 * Corrected (single-bit) errors must also be noted.
 	 */
-	if (info->retcode != ERR_NONE)
+	if (info->retcode == ERR_SBERR)
+		return 1;
+	else if (info->retcode != ERR_NONE)
 		return -1;
 
 	return 0;
-- 
1.6.0.6
