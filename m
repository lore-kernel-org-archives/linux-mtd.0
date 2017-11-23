Received: from mail-cys01nam02on0629.outbound.protection.outlook.com
 ([2a01:111:f400:fe45::629]
 helo=NAM02-CY1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eHpnc-0003OP-Kv
 for linux-mtd@lists.infradead.org; Thu, 23 Nov 2017 11:36:14 +0000
From: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
To: <linux-mtd@lists.infradead.org>
CC: <dedekind1@gmail.com>, <oss@buserror.net>, <computersforpeace@gmail.com>,
 Jagdish Gediya <jagdish.gediya@nxp.com>, Prabhakar Kushwaha
 <prabhakar.kushwaha@nxp.com>
Subject: [PATCH][v2] mtd: nand: ifc: update bufnum mask for ver >= 2.0.0
Date: Thu, 23 Nov 2017 17:04:31 +0530
Message-ID: <1511436871-15346-1-git-send-email-prabhakar.kushwaha@nxp.com>
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

From: Jagdish Gediya <jagdish.gediya@nxp.com>

Bufnum mask is used to calculate page position in the internal SRAM.

As IFC version 2.0.0 has 16KB of internal SRAM as compared to older
versions which had 8KB. Hence bufnum mask needs to be updated.

Signed-off-by: Jagdish Gediya <jagdish.gediya@nxp.com>
Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
---
Changes for v2: Incorporated review comments from Boris Brezillon
http://patchwork.ozlabs.org/patch/773799/

 drivers/mtd/nand/fsl_ifc_nand.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
index 9e03bac..bbdd68a5 100644
--- a/drivers/mtd/nand/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/fsl_ifc_nand.c
@@ -916,6 +916,13 @@ static int fsl_ifc_chip_init(struct fsl_ifc_mtd *priv)
 	if (ctrl->version >= FSL_IFC_VERSION_1_1_0)
 		fsl_ifc_sram_init(priv);
 
+	/*
+	 * As IFC version 2.0.0 has 16KB of internal SRAM as compared to older
+	 * versions which had 8KB. Hence bufnum mask needs to be updated.
+	 */
+	if (ctrl->version >= FSL_IFC_VERSION_2_0_0)
+		priv->bufnum_mask = (priv->bufnum_mask * 2) + 1;
+
 	return 0;
 }
 
-- 
1.9.1
