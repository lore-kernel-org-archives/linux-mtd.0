Received: from am1ehsobe001.messaging.microsoft.com ([213.199.154.204]
 helo=AM1EHSOBE001.bigfish.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rg85z-0004K2-F8
 for linux-mtd@lists.infradead.org; Thu, 29 Dec 2011 05:00:04 +0000
From: Prabhakar Kushwaha <prabhakar@freescale.com>
To: <linuxppc-dev@lists.ozlabs.org>, <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/2] mtd/nand: Fix IFC driver to support 2K NAND page
Date: Thu, 29 Dec 2011 10:29:39 +0530
Message-ID: <1325134779-3571-3-git-send-email-prabhakar@freescale.com>
In-Reply-To: <1325134779-3571-1-git-send-email-prabhakar@freescale.com>
References: <1325134779-3571-1-git-send-email-prabhakar@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: scottwood@freescale.com, Poonam Aggrwal <poonam.aggrwal@freescale.com>,
 Prabhakar Kushwaha <prabhakar@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

1) OOB area should be updated irrespective of NAND page size. Earlier it was
updated only for 512byte NAND page.

2) During OOB update fbcr should be equal to OOB size.

Signed-off-by: Poonam Aggrwal <poonam.aggrwal@freescale.com>
Signed-off-by: Prabhakar Kushwaha <prabhakar@freescale.com>
---
 git://git.kernel.org/pub/scm/linux/kernel/git/galak/powerpc.git (branch next)

 Tested on P1010RDB

 drivers/mtd/nand/fsl_ifc_nand.c |   20 ++++++++------------
 1 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
index 2df7206..2c02168 100644
--- a/drivers/mtd/nand/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/fsl_ifc_nand.c
@@ -439,20 +439,16 @@ static void fsl_ifc_cmdfunc(struct mtd_info *mtd, unsigned int command,
 			out_be32(&ifc->ifc_nand.nand_fir1,
 				 (IFC_FIR_OP_CW1 << IFC_NAND_FIR1_OP5_SHIFT));
 
-			if (column >= mtd->writesize) {
-				/* OOB area --> READOOB */
-				column -= mtd->writesize;
-				nand_fcr0 |= NAND_CMD_READOOB <<
-						IFC_NAND_FCR0_CMD0_SHIFT;
-				ifc_nand_ctrl->oob = 1;
-			} else if (column < 256)
+			if (column < 256)
 				/* First 256 bytes --> READ0 */
 				nand_fcr0 |=
 				NAND_CMD_READ0 << IFC_NAND_FCR0_CMD0_SHIFT;
-			else
-				/* Second 256 bytes --> READ1 */
-				nand_fcr0 |=
-				NAND_CMD_READ1 << IFC_NAND_FCR0_CMD0_SHIFT;
+		}
+
+		if (column >= mtd->writesize) {
+			/* OOB area --> READOOB */
+			column -= mtd->writesize;
+			ifc_nand_ctrl->oob = 1;
 		}
 
 		out_be32(&ifc->ifc_nand.nand_fcr0, nand_fcr0);
@@ -465,7 +461,7 @@ static void fsl_ifc_cmdfunc(struct mtd_info *mtd, unsigned int command,
 		int full_page;
 		if (ifc_nand_ctrl->oob) {
 			out_be32(&ifc->ifc_nand.nand_fbcr,
-					ifc_nand_ctrl->index);
+				ifc_nand_ctrl->index - ifc_nand_ctrl->column);
 			full_page = 0;
 		} else {
 			out_be32(&ifc->ifc_nand.nand_fbcr, 0);
-- 
1.7.5.4
