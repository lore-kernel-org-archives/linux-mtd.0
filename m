Received: from h1446028.stratoserver.net ([85.214.92.142]
 helo=mail.ahsoftware.de)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wp3Cv-0007UF-4Q
 for linux-mtd@lists.infradead.org; Mon, 26 May 2014 22:17:26 +0000
Received: from eiche.ahsoftware (p57B20CCF.dip0.t-ipconnect.de [87.178.12.207])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.ahsoftware.de (Postfix) with ESMTPSA id 17734423C318
 for <linux-mtd@lists.infradead.org>; Tue, 27 May 2014 00:16:43 +0200 (CEST)
From: Alexander Holler <holler@ahsoftware.de>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 22/27] mtd: nand: fsl_ifc: show device structure in sysfs
Date: Tue, 27 May 2014 00:12:47 +0200
Message-Id: <1401142372-14148-23-git-send-email-holler@ahsoftware.de>
In-Reply-To: <1401142372-14148-1-git-send-email-holler@ahsoftware.de>
References: <1401142372-14148-1-git-send-email-holler@ahsoftware.de>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Alexander Holler <holler@ahsoftware.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix a common error in nand-drivers which do not set up a parent device for
the mtd-device by using a new inline function.

Signed-off-by: Alexander Holler <holler@ahsoftware.de>
---
 drivers/mtd/nand/fsl_ifc_nand.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
index cb45d2f..c1aaccb 100644
--- a/drivers/mtd/nand/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/fsl_ifc_nand.c
@@ -874,10 +874,6 @@ static int fsl_ifc_chip_init(struct fsl_ifc_mtd *priv)
 	struct nand_ecclayout *layout;
 	u32 csor, ver;
 
-	/* Fill in fsl_ifc_mtd structure */
-	priv->mtd.priv = chip;
-	priv->mtd.owner = THIS_MODULE;
-
 	/* fill in nand_chip structure */
 	/* set up function call table */
 	if ((ioread32be(&ifc->cspr_cs[priv->bank].cspr)) & CSPR_PORT_SIZE_16)
@@ -1099,6 +1095,7 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 		    IFC_NAND_EVTER_INTR_FTOERIR_EN |
 		    IFC_NAND_EVTER_INTR_WPERIR_EN,
 		    &ifc->ifc_nand.nand_evter_intr_en);
+	mtd_setup_common_members(&priv->mtd, &priv->chip, dev);
 	priv->mtd.name = kasprintf(GFP_KERNEL, "%llx.flash", (u64)res.start);
 	if (!priv->mtd.name) {
 		ret = -ENOMEM;
-- 
1.8.3.2
