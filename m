Received: from mail-cys01nam02on0040.outbound.protection.outlook.com
 ([104.47.37.40] helo=NAM02-CY1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dJHd2-0004Pn-JN
 for linux-mtd@lists.infradead.org; Fri, 09 Jun 2017 10:58:58 +0000
From: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
To: <linux-mtd@lists.infradead.org>
CC: <dedekind1@gmail.com>, <oss@buserror.net>, <computersforpeace@gmail.com>,
 Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
Subject: [PATCH] driver: mtd: ifc: Initialize SRAM for all version >= 1.0
Date: Fri, 9 Jun 2017 16:27:21 +0530
Message-ID: <1497005841-7750-1-git-send-email-prabhakar.kushwaha@nxp.com>
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

All IFC version >= 1.0 use 28nm technology for SRAM. Here SRAM has
a requirement to initialize before any read operation performed for
avoiding ECC Error.

So update condition check to initialize SRAM for all IFC version >= 1.0.0

Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
---
 drivers/mtd/nand/fsl_ifc_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
index d1570f5..eca269d 100644
--- a/drivers/mtd/nand/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/fsl_ifc_nand.c
@@ -904,7 +904,7 @@ static int fsl_ifc_chip_init(struct fsl_ifc_mtd *priv)
 		chip->ecc.algo = NAND_ECC_HAMMING;
 	}
 
-	if (ctrl->version == FSL_IFC_VERSION_1_1_0)
+	if (ctrl->version >= FSL_IFC_VERSION_1_1_0)
 		fsl_ifc_sram_init(priv);
 
 	return 0;
-- 
2.7.4
