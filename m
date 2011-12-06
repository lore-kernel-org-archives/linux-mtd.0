Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]
 helo=TX2EHSOBE009.bigfish.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RXrK8-0004hI-8F
 for linux-mtd@lists.infradead.org; Tue, 06 Dec 2011 09:28:28 +0000
From: Shengzhou Liu <Shengzhou.Liu@freescale.com>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 1/2 v2] mtd/nand: fixup for fmr initialization of Freescale
 NAND controller
Date: Tue, 6 Dec 2011 16:54:14 +0800
Message-ID: <1323161655-19050-1-git-send-email-Shengzhou.Liu@freescale.com>
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
fsl_elbc_chip_init_tail(), now we initialize CWTO to maximum timeout value
and not relying on the setting of bootloader.

Signed-off-by: Shengzhou Liu <Shengzhou.Liu@freescale.com>
---
v2: make fmr not relying on the setting of bootloader.

 drivers/mtd/nand/fsl_elbc_nand.c |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
index eedd8ee..4f405a0 100644
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
@@ -764,8 +762,10 @@ static int fsl_elbc_chip_init(struct fsl_elbc_mtd *priv)
 	priv->mtd.priv = chip;
 	priv->mtd.owner = THIS_MODULE;
 
-	/* Set the ECCM according to the settings in bootloader.*/
-	priv->fmr = in_be32(&lbc->fmr) & FMR_ECCM;
+	/* set timeout to maximum */
+	priv->fmr = 15 << FMR_CWTO_SHIFT;
+	if (in_be32(&lbc->bank[priv->bank].or) & OR_FCM_PGS)
+		priv->fmr |= FMR_ECCM;
 
 	/* fill in nand_chip structure */
 	/* set up function call table */
-- 
1.6.4
