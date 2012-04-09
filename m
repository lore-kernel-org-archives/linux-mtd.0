Received: from va3ehsobe005.messaging.microsoft.com ([216.32.180.31]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SH76k-0001u6-9M
 for linux-mtd@lists.infradead.org; Mon, 09 Apr 2012 05:25:42 +0000
From: Prabhakar Kushwaha <prabhakar@freescale.com>
To: <linuxppc-dev@lists.ozlabs.org>, <linux-mtd@lists.infradead.org>
Subject: [PATCH] driver/mtd: IFC NAND: Add support of ONFI NAND flash
Date: Mon, 9 Apr 2012 10:55:22 +0530
Message-ID: <1333949122-10401-1-git-send-email-prabhakar@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: scottwood@freescale.com, Prabhakar Kushwaha <prabhakar@freescale.com>,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

  - Fix NAND_CMD_READID command for ONFI detect.
  - Add NAND_CMD_PARAM command to read the ONFI parameter page.

Signed-off-by: Prabhakar Kushwaha <prabhakar@freescale.com>
Acked-by: Scott Wood <scottwood@freescale.com>
---
 Based upon git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git 
 Branch master

 drivers/mtd/nand/fsl_ifc_nand.c |   22 ++++++++++++++++------
 1 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
index c30ac7b..4e7f31e 100644
--- a/drivers/mtd/nand/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/fsl_ifc_nand.c
@@ -375,21 +375,31 @@ static void fsl_ifc_cmdfunc(struct mtd_info *mtd, unsigned int command,
 
 		return;
 
-	/* READID must read all 8 possible bytes */
 	case NAND_CMD_READID:
+	case NAND_CMD_PARAM: {
+		int timing = IFC_FIR_OP_RB;
+		if (command == NAND_CMD_PARAM)
+			timing = IFC_FIR_OP_RBCD;
+
 		out_be32(&ifc->ifc_nand.nand_fir0,
 				(IFC_FIR_OP_CMD0 << IFC_NAND_FIR0_OP0_SHIFT) |
 				(IFC_FIR_OP_UA  << IFC_NAND_FIR0_OP1_SHIFT) |
-				(IFC_FIR_OP_RB << IFC_NAND_FIR0_OP2_SHIFT));
+				(timing << IFC_NAND_FIR0_OP2_SHIFT));
 		out_be32(&ifc->ifc_nand.nand_fcr0,
-				NAND_CMD_READID << IFC_NAND_FCR0_CMD0_SHIFT);
-		/* 8 bytes for manuf, device and exts */
-		out_be32(&ifc->ifc_nand.nand_fbcr, 8);
-		ifc_nand_ctrl->read_bytes = 8;
+				command << IFC_NAND_FCR0_CMD0_SHIFT);
+		out_be32(&ifc->ifc_nand.row3, column);
+
+		/*
+		 * although currently it's 8 bytes for READID, we always read
+		 * the maximum 256 bytes(for PARAM)
+		 */
+		out_be32(&ifc->ifc_nand.nand_fbcr, 256);
+		ifc_nand_ctrl->read_bytes = 256;
 
 		set_addr(mtd, 0, 0, 0);
 		fsl_ifc_run_command(mtd);
 		return;
+	}
 
 	/* ERASE1 stores the block and page address */
 	case NAND_CMD_ERASE1:
-- 
1.7.5.4
