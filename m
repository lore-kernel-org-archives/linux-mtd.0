Received: from mail-eopbgr30046.outbound.protection.outlook.com ([40.107.3.46]
 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1eyEte-0001Os-Mm
 for linux-mtd@lists.infradead.org; Tue, 20 Mar 2018 10:53:40 +0000
From: Jagdish Gediya <jagdish.gediya@nxp.com>
To: linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, computersforpeace@gmail.com,
 oss@buserror.net, leoyang.li@nxp.com,
 Jagdish Gediya <jagdish.gediya@nxp.com>, stable@vger.kernel.org
Subject: [PATCH][v3] mtd: rawnand: fsl_ifc: Fix nand waitfunc return value
Date: Wed, 21 Mar 2018 04:31:36 +0530
Message-Id: <1521586908-7667-1-git-send-email-jagdish.gediya@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As per the IFC hardware manual, Most significant 2 bytes in
nand_fsr register are the outcome of NAND READ STATUS command.

So status value need to be shifted and aligned as per the nand
framework requirement.

Fixes: 82771882d960 ("NAND Machine support for Integrated Flash Controller")
Cc: stable@vger.kernel.org # v3.18+
Signed-off-by: Jagdish Gediya <jagdish.gediya@nxp.com>
Reviewed-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
---
Changes for v2: Incorporated comments from Boris Brezillon
        - Added fixes tag

Changes for v3: Incorporated comments from Boris Brezillon

 drivers/mtd/nand/fsl_ifc_nand.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
index 9390cbd..16104ca 100644
--- a/drivers/mtd/nand/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/fsl_ifc_nand.c
@@ -629,6 +629,7 @@ static int fsl_ifc_wait(struct mtd_info *mtd, struct nand_chip *chip)
 	struct fsl_ifc_ctrl *ctrl = priv->ctrl;
 	struct fsl_ifc_runtime __iomem *ifc = ctrl->rregs;
 	u32 nand_fsr;
+	int status;
 
 	/* Use READ_STATUS command, but wait for the device to be ready */
 	ifc_out32((IFC_FIR_OP_CW0 << IFC_NAND_FIR0_OP0_SHIFT) |
@@ -643,12 +644,12 @@ static int fsl_ifc_wait(struct mtd_info *mtd, struct nand_chip *chip)
 	fsl_ifc_run_command(mtd);
 
 	nand_fsr = ifc_in32(&ifc->ifc_nand.nand_fsr);
-
+	status = nand_fsr >> 24;
 	/*
 	 * The chip always seems to report that it is
 	 * write-protected, even when it is not.
 	 */
-	return nand_fsr | NAND_STATUS_WP;
+	return status | NAND_STATUS_WP;
 }
 
 /*
-- 
1.9.1
