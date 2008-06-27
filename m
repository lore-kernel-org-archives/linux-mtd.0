Received: from [85.21.88.6] (helo=buildserver.ru.mvista.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KCJF6-0001CO-Ge
	for linux-mtd@lists.infradead.org; Fri, 27 Jun 2008 19:04:20 +0000
Date: Fri, 27 Jun 2008 23:04:20 +0400
From: Anton Vorontsov <avorontsov@ru.mvista.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 3/3] MTD: NAND: fsl_elbc_nand: ecclayout cleanups
Message-ID: <20080627190420.GC16901@polina.dev.rtsoft.ru>
References: <20080627190243.GA4713@polina.dev.rtsoft.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf8
Content-Disposition: inline
In-Reply-To: <20080627190243.GA4713@polina.dev.rtsoft.ru>
Cc: Scott Wood <scottwood@freescale.com>, linux-mtd@lists.infradead.org,
	Iwo Mergler <iwo@call-direct.com.au>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch deletes oobavail assignments, they're calculated by the nand
core code in nand_scan_tail, plus current oobavail values are wrong for
the LP NANDs.

Also remove mtd->ecclayout and mtd->oobavail assignments, mtd core
handles this all by itself.

Signed-off-by: Anton Vorontsov <avorontsov@ru.mvista.com>
---
 drivers/mtd/nand/fsl_elbc_nand.c |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
index 5f1bc5e..d6d1ff5 100644
--- a/drivers/mtd/nand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/fsl_elbc_nand.c
@@ -89,7 +89,6 @@ static struct nand_ecclayout fsl_elbc_oob_sp_eccm0 = {
 	.eccbytes = 3,
 	.eccpos = {6, 7, 8},
 	.oobfree = { {0, 5}, {9, 7} },
-	.oobavail = 12,
 };
 
 /* Small Page FLASH with FMR[ECCM] = 1 */
@@ -97,7 +96,6 @@ static struct nand_ecclayout fsl_elbc_oob_sp_eccm1 = {
 	.eccbytes = 3,
 	.eccpos = {8, 9, 10},
 	.oobfree = { {0, 5}, {6, 2}, {11, 5} },
-	.oobavail = 12,
 };
 
 /* Large Page FLASH with FMR[ECCM] = 0 */
@@ -105,7 +103,6 @@ static struct nand_ecclayout fsl_elbc_oob_lp_eccm0 = {
 	.eccbytes = 12,
 	.eccpos = {6, 7, 8, 22, 23, 24, 38, 39, 40, 54, 55, 56},
 	.oobfree = { {1, 5}, {9, 13}, {25, 13}, {41, 13}, {57, 7} },
-	.oobavail = 48,
 };
 
 /* Large Page FLASH with FMR[ECCM] = 1 */
@@ -113,7 +110,6 @@ static struct nand_ecclayout fsl_elbc_oob_lp_eccm1 = {
 	.eccbytes = 12,
 	.eccpos = {8, 9, 10, 24, 25, 26, 40, 41, 42, 56, 57, 58},
 	.oobfree = { {1, 7}, {11, 13}, {27, 13}, {43, 13}, {59, 5} },
-	.oobavail = 48,
 };
 
 /*
@@ -730,8 +726,6 @@ static int fsl_elbc_chip_init_tail(struct mtd_info *mtd)
 			                   &fsl_elbc_oob_lp_eccm1 :
 			                   &fsl_elbc_oob_lp_eccm0;
 			chip->badblock_pattern = &largepage_memorybased;
-			mtd->ecclayout = chip->ecc.layout;
-			mtd->oobavail = chip->ecc.layout->oobavail;
 		}
 	} else {
 		dev_err(ctrl->dev,
-- 
1.5.5.4
