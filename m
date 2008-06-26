Received: from [85.21.88.6] (helo=buildserver.ru.mvista.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KBwXr-0004GQ-N6
	for linux-mtd@lists.infradead.org; Thu, 26 Jun 2008 18:50:12 +0000
Date: Thu, 26 Jun 2008 22:50:11 +0400
From: Anton Vorontsov <avorontsov@ru.mvista.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] MTD: NAND: fsl_elbc_nand: fix oobfree location for large
	page nands
Message-ID: <20080626185011.GA4447@polina.dev.rtsoft.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf8
Content-Disposition: inline
Cc: Scott Wood <scottwood@freescale.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

For large page chips, nand_bbt is looking into OOB area, and checking
for "0xff 0xff" pattern at OOB offset 0. That is, two bytes should be
reserved for bbt means.

But ELBC driver is specifying ecclayout so that oobfree area starts at
offset 1, so only one byte left for the bbt purposes.

This causes problems with any OOB users, namely JFFS2: after first mount
JFFS2 will fill all OOBs with "erased marker", so OOBs will contain:

  OOB Data: ff 19 85 20 03 00 ff ff ff 00 00 08 ff ff ff ff
  OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
  OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
  OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff

And on the next boot, NAND core will rescan for bad blocks, then will
see "0xff 0x19" pattern, and will mark all blocks as bad ones.

This patch fixes the issue by shrinking the first OOB free area by one
byte.

Without this patch, LP NANDs working through ELBC driver are nearly
unusable, thus we don't bother with implementing Kconfig option for the
compatibility with previous OOB layout (though, firmwares should be
fixed too!).

This patch also deletes oobavail assignments, they're calculated by the
nand core code in nand_scan_tail, plus current oobavail values are wrong
for the LP NANDs.

Also remove mtd->ecclayout and mtd->oobavail assignments, mtd core
handles this all by itself.

Signed-off-by: Anton Vorontsov <avorontsov@ru.mvista.com>
---

This and
MTD: NAND: fsl_elbc_nand: fix OOB workability for large page NAND chips

patches are mutually exclusive, they're fixing the same problem but
differently.

 drivers/mtd/nand/fsl_elbc_nand.c |   10 ++--------
 1 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
index 1b06d29..416a3eb 100644
--- a/drivers/mtd/nand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/fsl_elbc_nand.c
@@ -89,7 +89,6 @@ static struct nand_ecclayout fsl_elbc_oob_sp_eccm0 = {
 	.eccbytes = 3,
 	.eccpos = {6, 7, 8},
 	.oobfree = { {0, 5}, {9, 7} },
-	.oobavail = 12,
 };
 
 /* Small Page FLASH with FMR[ECCM] = 1 */
@@ -97,23 +96,20 @@ static struct nand_ecclayout fsl_elbc_oob_sp_eccm1 = {
 	.eccbytes = 3,
 	.eccpos = {8, 9, 10},
 	.oobfree = { {0, 5}, {6, 2}, {11, 5} },
-	.oobavail = 12,
 };
 
 /* Large Page FLASH with FMR[ECCM] = 0 */
 static struct nand_ecclayout fsl_elbc_oob_lp_eccm0 = {
 	.eccbytes = 12,
 	.eccpos = {6, 7, 8, 22, 23, 24, 38, 39, 40, 54, 55, 56},
-	.oobfree = { {1, 5}, {9, 13}, {25, 13}, {41, 13}, {57, 7} },
-	.oobavail = 48,
+	.oobfree = { {2, 4}, {9, 13}, {25, 13}, {41, 13}, {57, 7} },
 };
 
 /* Large Page FLASH with FMR[ECCM] = 1 */
 static struct nand_ecclayout fsl_elbc_oob_lp_eccm1 = {
 	.eccbytes = 12,
 	.eccpos = {8, 9, 10, 24, 25, 26, 40, 41, 42, 56, 57, 58},
-	.oobfree = { {1, 7}, {11, 13}, {27, 13}, {43, 13}, {59, 5} },
-	.oobavail = 48,
+	.oobfree = { {2, 6}, {11, 13}, {27, 13}, {43, 13}, {59, 5} },
 };
 
 /*=================================*/
@@ -687,8 +683,6 @@ static int fsl_elbc_chip_init_tail(struct mtd_info *mtd)
 			chip->ecc.layout = (priv->fmr & FMR_ECCM) ?
 			                   &fsl_elbc_oob_lp_eccm1 :
 			                   &fsl_elbc_oob_lp_eccm0;
-			mtd->ecclayout = chip->ecc.layout;
-			mtd->oobavail = chip->ecc.layout->oobavail;
 		}
 	} else {
 		dev_err(ctrl->dev,
-- 
1.5.5.4
