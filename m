Received: from az33egw02.freescale.net ([192.88.158.103])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L9wEi-0005sc-Ie
	for linux-mtd@lists.infradead.org; Tue, 09 Dec 2008 06:38:24 +0000
Received: from az33smr01.freescale.net (az33smr01.freescale.net [10.64.34.199])
	by az33egw02.freescale.net (8.14.3/az33egw02) with ESMTP id
	mB96aLu1010842 for <linux-mtd@lists.infradead.org>;
	Mon, 8 Dec 2008 23:36:22 -0700 (MST)
Received: from zch01exm21.fsl.freescale.net (zch01exm21.ap.freescale.net
	[10.192.129.205])
	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id mB96aKvA018853
	for <linux-mtd@lists.infradead.org>;
	Tue, 9 Dec 2008 00:36:21 -0600 (CST)
From: Jason Jin <Jason.jin@freescale.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] Set the fsl elbc ECCM according the settings in bootloader.
Date: Tue,  9 Dec 2008 14:32:31 +0800
Message-Id: <1228804351-20463-1-git-send-email-Jason.jin@freescale.com>
Cc: scottwood@freescale.com, dwmw2@infradead.org,
	Jason Jin <Jason.jin@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The ECCM maybe set in bootloader, Get ECCM settings from the bootloader,
can avoid the image written by bootloader cannot read out by kernel.

But the limitation of doing it this way is that, it could break large page
NAND if it is written with NAND disabled in u-boot and read with NAND
enabled, or vice versa.

Signed-off-by: Jason Jin <Jason.jin@freescale.com>
Acked-by: Scott Wood <scottwood@freescale.com>
---
 drivers/mtd/nand/fsl_elbc_nand.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
index 4aa5bd6..65929db 100644
--- a/drivers/mtd/nand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/fsl_elbc_nand.c
@@ -777,7 +777,9 @@ static int fsl_elbc_chip_init(struct fsl_elbc_mtd *priv)
 	/* Fill in fsl_elbc_mtd structure */
 	priv->mtd.priv = chip;
 	priv->mtd.owner = THIS_MODULE;
-	priv->fmr = 0; /* rest filled in later */
+
+	/* Set the ECCM according to the settings in bootloader.*/
+	priv->fmr = in_be32(&lbc->fmr) & FMR_ECCM;
 
 	/* fill in nand_chip structure */
 	/* set up function call table */
-- 
1.5.4
