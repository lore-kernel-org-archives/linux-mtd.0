Received: from ch3vs02.rockwellcollins.com ([205.175.226.29])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bhLoo-00037j-4M
 for linux-mtd@lists.infradead.org; Tue, 06 Sep 2016 19:14:03 +0000
From: Matt Weber <matthew.weber@rockwellcollins.com>
To: linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, Dipen.Dudhat@freescale.com,
 Matt Weber <matthew.weber@rockwellcollins.com>,
 Ronak Desai <ronak.desai@rockwellcollins.com>
Subject: [PATCH] fsl_ifc_nand: Added random output enable cmd
Date: Tue,  6 Sep 2016 14:13:17 -0500
Message-Id: <1473189197-45191-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds random output enable command support in IFC nand
controller driver. This command implements change read
column (05h-E0h).

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Ronak Desai <ronak.desai@rockwellcollins.com>
---
 drivers/mtd/nand/fsl_ifc_nand.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
index 4e9e5fd..230919f 100644
--- a/drivers/mtd/nand/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/fsl_ifc_nand.c
@@ -387,10 +387,11 @@ static void fsl_ifc_cmdfunc(struct mtd_info *mtd, unsigned int command,
 
 		/*
 		 * although currently it's 8 bytes for READID, we always read
-		 * the maximum 256 bytes(for PARAM)
+		 * the maximum 8192 bytes(for PARAM) supported by IFC controller
+		 * as extended page may be available for some NAND devices.
 		 */
-		ifc_out32(256, &ifc->ifc_nand.nand_fbcr);
-		ifc_nand_ctrl->read_bytes = 256;
+		ifc_out32(0, &ifc->ifc_nand.nand_fbcr); /* Read whole page */
+		ifc_nand_ctrl->read_bytes = 8192; /* Maximum supported page by IFC */
 
 		set_addr(mtd, 0, 0, 0);
 		fsl_ifc_run_command(mtd);
@@ -530,6 +531,29 @@ static void fsl_ifc_cmdfunc(struct mtd_info *mtd, unsigned int command,
 		fsl_ifc_run_command(mtd);
 		return;
 
+	case NAND_CMD_RNDOUT: {
+		__le16 Tccs = 0;
+		chip->onfi_version ? (Tccs = chip->onfi_params.t_ccs)
+					: (Tccs = chip->jedec_params.t_ccs);
+		ifc_out32((IFC_FIR_OP_CW0 << IFC_NAND_FIR0_OP0_SHIFT) |
+				(IFC_FIR_OP_CA0 << IFC_NAND_FIR0_OP1_SHIFT) |
+				(IFC_FIR_OP_CMD1 << IFC_NAND_FIR0_OP2_SHIFT) |
+				(IFC_FIR_OP_NWAIT << IFC_NAND_FIR0_OP3_SHIFT),
+				&ifc->ifc_nand.nand_fir0);
+
+		ifc_out32((NAND_CMD_RNDOUT << IFC_NAND_FCR0_CMD0_SHIFT) |
+				(NAND_CMD_RNDOUTSTART << IFC_NAND_FCR0_CMD1_SHIFT),
+				&ifc->ifc_nand.nand_fcr0);
+
+		/* Wait for minimum change column set-up time. But it does not harm
+		 * to wait more time, so calculated based on 333.3 MHz input IFC clock
+		 */
+		ifc_out32((0xFF & (le16_to_cpu(Tccs)/3)), &ifc->ifc_nand.ncfgr);
+		set_addr(mtd, column, 0, 0);
+		fsl_ifc_run_command(mtd);
+		return;
+	}
+
 	default:
 		dev_err(priv->dev, "%s: error, unsupported command 0x%x.\n",
 					__func__, command);
-- 
1.9.1
