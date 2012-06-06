Received: from db3ehsobe005.messaging.microsoft.com ([213.199.154.143]
 helo=db3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1ScPmT-0001FM-OY
 for linux-mtd@lists.infradead.org; Wed, 06 Jun 2012 23:36:50 +0000
Date: Wed, 6 Jun 2012 18:36:39 -0500
From: Scott Wood <scottwood@freescale.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd: elbc nand: use drvdata to only remove the relevant chip
Message-ID: <20120606233639.GA13977@tyr.buserror.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Previously the remove method was looping and removing all chips,
which is obviously not the right thing to do -- left over from when
the driver was organized differently and that was the remove method for
the entire controller.  This would result in bad things happening if
you have more than one NAND chip, and remove the module.

This also fixes priv->dev to properly point to the chip's device rather than
the controller's.  Until now priv->dev was only used for error/debug prints
(and it's an improvement there), so this shouldn't break anything.

Signed-off-by: Scott Wood <scottwood@freescale.com>
---
 drivers/mtd/nand/fsl_elbc_nand.c |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
index 7842938..a3c5578 100644
--- a/drivers/mtd/nand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/fsl_elbc_nand.c
@@ -916,7 +916,8 @@ static int __devinit fsl_elbc_nand_probe(struct platform_device *pdev)
 	elbc_fcm_ctrl->chips[bank] = priv;
 	priv->bank = bank;
 	priv->ctrl = fsl_lbc_ctrl_dev;
-	priv->dev = dev;
+	priv->dev = &pdev->dev;
+	dev_set_drvdata(priv->dev, priv);
 
 	priv->vbase = ioremap(res.start, resource_size(&res));
 	if (!priv->vbase) {
@@ -963,11 +964,10 @@ err:
 
 static int fsl_elbc_nand_remove(struct platform_device *pdev)
 {
-	int i;
 	struct fsl_elbc_fcm_ctrl *elbc_fcm_ctrl = fsl_lbc_ctrl_dev->nand;
-	for (i = 0; i < MAX_BANKS; i++)
-		if (elbc_fcm_ctrl->chips[i])
-			fsl_elbc_chip_remove(elbc_fcm_ctrl->chips[i]);
+	struct fsl_elbc_mtd *priv = dev_get_drvdata(&pdev->dev);
+
+	fsl_elbc_chip_remove(priv);
 
 	mutex_lock(&fsl_elbc_nand_mutex);
 	elbc_fcm_ctrl->counter--;
-- 
1.7.5.4
