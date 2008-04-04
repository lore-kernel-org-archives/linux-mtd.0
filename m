Received: from de01egw02.freescale.net ([192.88.165.103])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jhu38-0006SS-DR
	for linux-mtd@lists.infradead.org; Fri, 04 Apr 2008 22:06:18 +0000
Date: Fri, 4 Apr 2008 17:06:05 -0500
From: Scott Wood <scottwood@freescale.com>
To: dwmw2@infradead.org
Subject: [PATCH] fsl_elbc_nand: Fix SEQIN handling for large pages.
Message-ID: <20080404220605.GB29959@ld0162-tx32.am.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Previously, a READ command was erroneously issued rather than SEQIN.

Signed-off-by: Scott Wood <scottwood@freescale.com>
---
 drivers/mtd/nand/fsl_elbc_nand.c |   11 ++++++-----
 1 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
index b025dfe..bc4ca57 100644
--- a/drivers/mtd/nand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/fsl_elbc_nand.c
@@ -541,19 +541,20 @@ static void fsl_elbc_cmdfunc(struct mtd_info *mtd, unsigned int command,
 		ctrl->column = column;
 		ctrl->oob = 0;
 
-		fcr = (NAND_CMD_PAGEPROG << FCR_CMD1_SHIFT) |
-		      (NAND_CMD_SEQIN << FCR_CMD2_SHIFT);
-
 		if (priv->page_size) {
+			fcr = (NAND_CMD_SEQIN << FCR_CMD0_SHIFT) |
+			      (NAND_CMD_PAGEPROG << FCR_CMD1_SHIFT);
+
 			out_be32(&lbc->fir,
 			         (FIR_OP_CW0 << FIR_OP0_SHIFT) |
 			         (FIR_OP_CA  << FIR_OP1_SHIFT) |
 			         (FIR_OP_PA  << FIR_OP2_SHIFT) |
 			         (FIR_OP_WB  << FIR_OP3_SHIFT) |
 			         (FIR_OP_CW1 << FIR_OP4_SHIFT));
-
-			fcr |= NAND_CMD_READ0 << FCR_CMD0_SHIFT;
 		} else {
+			fcr = (NAND_CMD_PAGEPROG << FCR_CMD1_SHIFT) |
+			      (NAND_CMD_SEQIN << FCR_CMD2_SHIFT);
+
 			out_be32(&lbc->fir,
 			         (FIR_OP_CW0 << FIR_OP0_SHIFT) |
 			         (FIR_OP_CM2 << FIR_OP1_SHIFT) |
-- 
1.5.3
