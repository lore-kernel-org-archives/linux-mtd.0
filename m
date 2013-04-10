Received: from va3ehsobe005.messaging.microsoft.com ([216.32.180.31]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UQ3bS-0000Yx-N9
 for linux-mtd@lists.infradead.org; Wed, 10 Apr 2013 22:34:55 +0000
Date: Wed, 10 Apr 2013 17:34:37 -0500
From: Scott Wood <scottwood@freescale.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd: fsl_ifc_nand: set NAND_NO_SUBPAGE_WRITE
Message-ID: <20130410223437.GA26900@home.buserror.net>
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

This controller only does ECC on full-page accesses, even though the
ECC consists of multiple steps.  fsl_elbc_nand can get away with this
because the ECC of an all-0xff region will be all-0xff, but this is not
true with the ECC algorithms used by IFC.

Signed-off-by: Scott Wood <scottwood@freescale.com>
---
 drivers/mtd/nand/fsl_ifc_nand.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
index f1f7f12..4e1fc4d 100644
--- a/drivers/mtd/nand/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/fsl_ifc_nand.c
@@ -823,7 +823,7 @@ static int fsl_ifc_chip_init(struct fsl_ifc_mtd *priv)
 
 	/* set up nand options */
 	chip->bbt_options = NAND_BBT_USE_FLASH;
-
+	chip->options = NAND_NO_SUBPAGE_WRITE;
 
 	if (ioread32be(&ifc->cspr_cs[priv->bank].cspr) & CSPR_PORT_SIZE_16) {
 		chip->read_byte = fsl_ifc_read_byte16;
-- 
1.7.9.5
