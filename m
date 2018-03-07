Received: from mail-eopbgr30050.outbound.protection.outlook.com ([40.107.3.50]
 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1etVCl-0003kk-Po
 for linux-mtd@lists.infradead.org; Wed, 07 Mar 2018 09:17:56 +0000
From: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
To: linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, computersforpeace@gmail.com,
 oss@buserror.net, leoyang.li@nxp.com,
 Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
Subject: [PATCH] driver: mtd: ifc: increase eccstat array size for ver >= 2.0.0
Date: Wed,  7 Mar 2018 14:46:56 +0530
Message-Id: <20180307091656.16378-1-prabhakar.kushwaha@nxp.com>
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

Number of ECC status registers i.e. (ECCSTATx) has been increased
in IFC version 2.0.0 due to increase in SRAM size.

Fix the resulting eccstat array overflow.

Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
---
 drivers/mtd/nand/fsl_ifc_nand.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
index 4872a7ba6503..612f0990fa90 100644
--- a/drivers/mtd/nand/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/fsl_ifc_nand.c
@@ -193,7 +193,7 @@ static void fsl_ifc_run_command(struct mtd_info *mtd)
 	struct fsl_ifc_ctrl *ctrl = priv->ctrl;
 	struct fsl_ifc_nand_ctrl *nctrl = ifc_nand_ctrl;
 	struct fsl_ifc_runtime __iomem *ifc = ctrl->rregs;
-	u32 eccstat[4];
+	u32 eccstat[8];
 	int i;
 
 	/* set the chip select for NAND Transaction */
@@ -237,8 +237,14 @@ static void fsl_ifc_run_command(struct mtd_info *mtd)
 		else
 			eccstat_regs = ifc->ifc_nand.v1_nand_eccstat;
 
-		for (i = sector / 4; i <= sector_end / 4; i++)
+		for (i = sector / 4; i <= sector_end / 4; i++) {
+			if (i >= ARRAY_SIZE(eccstat)) {
+				dev_err(priv->dev, "%s: eccstat small for %d\n",
+					__func__, i);
+				return;
+			}
 			eccstat[i] = ifc_in32(&eccstat_regs[i]);
+		}
 
 		for (i = sector; i <= sector_end; i++) {
 			errors = check_read_ecc(mtd, ctrl, eccstat, i);
-- 
2.14.1
