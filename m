Received: from am1ehsobe005.messaging.microsoft.com ([213.199.154.208]
 helo=AM1EHSOBE005.bigfish.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RXWjE-00026o-F2
 for linux-mtd@lists.infradead.org; Mon, 05 Dec 2011 11:29:01 +0000
From: Shengzhou Liu <Shengzhou.Liu@freescale.com>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 1/2] mtd/nand: fixup for fmr initialization of Freescale NAND
 controller
Date: Mon, 5 Dec 2011 18:54:52 +0800
Message-ID: <1323082493-22617-1-git-send-email-Shengzhou.Liu@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: scottwood@freescale.com, dwmw2@infradead.org, kumar.gala@freescale.com,
 linux-mtd@lists.infradead.org, Shengzhou Liu <Shengzhou.Liu@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There was a bug for fmr initialization, which lead to  fmr was always 0x100
in fsl_elbc_chip_init() and caused FCM command timeout before calling
fsl_elbc_chip_init_tail().

Signed-off-by: Shengzhou Liu <Shengzhou.Liu@freescale.com>
---
 drivers/mtd/nand/fsl_elbc_nand.c |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
index eedd8ee..742bf73 100644
--- a/drivers/mtd/nand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/fsl_elbc_nand.c
@@ -659,9 +659,7 @@ static int fsl_elbc_chip_init_tail(struct mtd_info *mtd)
 	if (chip->pagemask & 0xff000000)
 		al++;
 
-	/* add to ECCM mode set in fsl_elbc_init */
-	priv->fmr |= (12 << FMR_CWTO_SHIFT) |  /* Timeout > 12 ms */
-	             (al << FMR_AL_SHIFT);
+	priv->fmr |= al << FMR_AL_SHIFT;
 
 	dev_dbg(priv->dev, "fsl_elbc_init: nand->numchips = %d\n",
 	        chip->numchips);
@@ -764,8 +762,8 @@ static int fsl_elbc_chip_init(struct fsl_elbc_mtd *priv)
 	priv->mtd.priv = chip;
 	priv->mtd.owner = THIS_MODULE;
 
-	/* Set the ECCM according to the settings in bootloader.*/
-	priv->fmr = in_be32(&lbc->fmr) & FMR_ECCM;
+	/* Set fmr according to the settings in bootloader.*/
+	priv->fmr = in_be32(&lbc->fmr);
 
 	/* fill in nand_chip structure */
 	/* set up function call table */
-- 
1.6.4
