Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]
 helo=tx2outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vwngh-00024x-Tc
 for linux-mtd@lists.infradead.org; Sat, 28 Dec 2013 06:47:56 +0000
From: Prabhakar Kushwaha <prabhakar@freescale.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd/nand:Update mtd.name assignment type to u64 for IFC, eLBC
Date: Sat, 28 Dec 2013 12:17:35 +0530
Message-ID: <1388213255-30342-1-git-send-email-prabhakar@freescale.com>
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

mtd.name is assigned to IFC NAND physical address. Assignment type is u32.
It is not providing correct physical address of IFC NAND.

Update assignment type to u64.

Signed-off-by: Prabhakar Kushwaha <prabhakar@freescale.com>
---
 drivers/mtd/nand/fsl_elbc_nand.c |    2 +-
 drivers/mtd/nand/fsl_ifc_nand.c  |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
index c966fc7..defd72e 100644
--- a/drivers/mtd/nand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/fsl_elbc_nand.c
@@ -875,7 +875,7 @@ static int fsl_elbc_nand_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	priv->mtd.name = kasprintf(GFP_KERNEL, "%x.flash", (unsigned)res.start);
+	priv->mtd.name = kasprintf(GFP_KERNEL, "%llx.flash", (u64)res.start);
 	if (!priv->mtd.name) {
 		ret = -ENOMEM;
 		goto err;
diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
index 4335577..f56e574 100644
--- a/drivers/mtd/nand/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/fsl_ifc_nand.c
@@ -1101,7 +1101,7 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 		    IFC_NAND_EVTER_INTR_FTOERIR_EN |
 		    IFC_NAND_EVTER_INTR_WPERIR_EN,
 		    &ifc->ifc_nand.nand_evter_intr_en);
-	priv->mtd.name = kasprintf(GFP_KERNEL, "%x.flash", (unsigned)res.start);
+	priv->mtd.name = kasprintf(GFP_KERNEL, "%llx.flash", (u64)res.start);
 	if (!priv->mtd.name) {
 		ret = -ENOMEM;
 		goto err;
-- 
1.7.9.5
