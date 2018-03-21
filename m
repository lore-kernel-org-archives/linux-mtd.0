Received: from mail-ve1eur01on0057.outbound.protection.outlook.com
 ([104.47.1.57] helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1eyYCE-0002wA-N5
 for linux-mtd@lists.infradead.org; Wed, 21 Mar 2018 07:30:09 +0000
From: Jagdish Gediya <jagdish.gediya@nxp.com>
To: linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, computersforpeace@gmail.com,
 oss@buserror.net, leoyang.li@nxp.com,
 Jagdish Gediya <jagdish.gediya@nxp.com>, stable@vger.kernel.org
Subject: [PATCH] mtd: rawnand: fsl_ifc: Read ECCSTAT0 and ECCSTAT1 registers
 for IFC 2.0
Date: Thu, 22 Mar 2018 01:08:10 +0530
Message-Id: <1521661101-26911-1-git-send-email-jagdish.gediya@nxp.com>
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

Due to missing information in Hardware manual, current
implementation doesn't read ECCSTAT0 and ECCSTAT1 registers
for IFC 2.0.

Add support to read ECCSTAT0 and ECCSTAT1 registers during
ecccheck for IFC 2.0.

Fixes: 656441478ed5 ("mtd: nand: ifc: Fix location of eccstat
registers for IFC V1.0")
Cc: stable@vger.kernel.org # v3.18+
Signed-off-by: Jagdish Gediya <jagdish.gediya@nxp.com>
Reviewed-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
---
 drivers/mtd/nand/fsl_ifc_nand.c | 6 +-----
 include/linux/fsl_ifc.h         | 6 +-----
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
index ed64759..1513298 100644
--- a/drivers/mtd/nand/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/fsl_ifc_nand.c
@@ -227,11 +227,7 @@ static void fsl_ifc_run_command(struct mtd_info *mtd)
 		int sector_end = sector_start + chip->ecc.steps - 1;
 		__be32 *eccstat_regs;
 
-		if (ctrl->version >= FSL_IFC_VERSION_2_0_0)
-			eccstat_regs = ifc->ifc_nand.v2_nand_eccstat;
-		else
-			eccstat_regs = ifc->ifc_nand.v1_nand_eccstat;
-
+		eccstat_regs = ifc->ifc_nand.nand_eccstat;
 		eccstat = ifc_in32(&eccstat_regs[sector_start / 4]);
 
 		for (i = sector_start; i <= sector_end; i++) {
diff --git a/include/linux/fsl_ifc.h b/include/linux/fsl_ifc.h
index c332f0a..3fdfede 100644
--- a/include/linux/fsl_ifc.h
+++ b/include/linux/fsl_ifc.h
@@ -734,11 +734,7 @@ struct fsl_ifc_nand {
 	u32 res19[0x10];
 	__be32 nand_fsr;
 	u32 res20;
-	/* The V1 nand_eccstat is actually 4 words that overlaps the
-	 * V2 nand_eccstat.
-	 */
-	__be32 v1_nand_eccstat[2];
-	__be32 v2_nand_eccstat[6];
+	__be32 nand_eccstat[8];
 	u32 res21[0x1c];
 	__be32 nanndcr;
 	u32 res22[0x2];
-- 
1.9.1
