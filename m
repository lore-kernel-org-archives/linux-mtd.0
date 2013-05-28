Received: from va3ehsobe004.messaging.microsoft.com ([216.32.180.14]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UhTay-0000vz-O0
 for linux-mtd@lists.infradead.org; Tue, 28 May 2013 23:46:25 +0000
Date: Tue, 28 May 2013 18:45:34 -0500
From: Scott Wood <scottwood@freescale.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd: fsl_ifc_nand: fix eccstrength for ecc8
Message-ID: <20130528234534.GA22340@home.buserror.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, prabhakar@freescale.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit 44df4d11b8f573e9efcba94d63e6a1ad148c76d0 ("mtd: nand: fix
incorrect ecc strength values") set eccstrength to 4 for IFC, but it is
8 in one configuration.

Signed-off-by: Scott Wood <scottwood@freescale.com>
---
 drivers/mtd/nand/fsl_ifc_nand.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
index f1f7f12..3469e5d 100644
--- a/drivers/mtd/nand/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/fsl_ifc_nand.c
@@ -843,7 +843,6 @@ static int fsl_ifc_chip_init(struct fsl_ifc_mtd *priv)
 	/* Hardware generates ECC per 512 Bytes */
 	chip->ecc.size = 512;
 	chip->ecc.bytes = 8;
-	chip->ecc.strength = 4;
 
 	switch (csor & CSOR_NAND_PGS_MASK) {
 	case CSOR_NAND_PGS_512:
@@ -857,11 +856,13 @@ static int fsl_ifc_chip_init(struct fsl_ifc_mtd *priv)
 			bbt_mirror_descr.offs = 0;
 		}
 
+		chip->ecc.strength = 4;
 		priv->bufnum_mask = 15;
 		break;
 
 	case CSOR_NAND_PGS_2K:
 		layout = &oob_2048_ecc4;
+		chip->ecc.strength = 4;
 		priv->bufnum_mask = 3;
 		break;
 
@@ -869,8 +870,10 @@ static int fsl_ifc_chip_init(struct fsl_ifc_mtd *priv)
 		if ((csor & CSOR_NAND_ECC_MODE_MASK) ==
 		    CSOR_NAND_ECC_MODE_4) {
 			layout = &oob_4096_ecc4;
+			chip->ecc.strength = 4;
 		} else {
 			layout = &oob_4096_ecc8;
+			chip->ecc.strength = 8;
 			chip->ecc.bytes = 16;
 		}
 
-- 
1.7.10.4
