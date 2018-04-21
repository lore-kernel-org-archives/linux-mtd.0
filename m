Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f9woj-0007sv-4O
 for linux-mtd@lists.infradead.org; Sat, 21 Apr 2018 18:00:58 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org, Vladimir Zapolskiy <vz@mleia.com>,
 Sylvain Lemieux <slemieux.tyco@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 02/11] mtd: rawnand: fsl_elbc: fix probe function error path
Date: Sat, 21 Apr 2018 20:00:34 +0200
Message-Id: <20180421180043.18366-3-miquel.raynal@bootlin.com>
In-Reply-To: <20180421180043.18366-1-miquel.raynal@bootlin.com>
References: <20180421180043.18366-1-miquel.raynal@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

An error after nand_scan_tail() should trigger a nand_cleanup().
The helper mtd_device_parse_register() returns an error code that should
be checked and nand_cleanup() called accordingly.

However, in this driver, fsl_elbc_chip_remove() which is called upon
error already triggers a nand_release() which is wrong, because a
nand_release() should be triggered only if an mtd_register() succeeded.

Move the nand_release() call out of the fsl_elbc_chip_remove() and put
it back in the *_remove() hook.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/fsl_elbc_nand.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsl_elbc_nand.c b/drivers/mtd/nand/raw/fsl_elbc_nand.c
index d28df991c73c..51f0b340bc0d 100644
--- a/drivers/mtd/nand/raw/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_elbc_nand.c
@@ -813,8 +813,6 @@ static int fsl_elbc_chip_remove(struct fsl_elbc_mtd *priv)
 	struct fsl_elbc_fcm_ctrl *elbc_fcm_ctrl = priv->ctrl->nand;
 	struct mtd_info *mtd = nand_to_mtd(&priv->chip);
 
-	nand_release(mtd);
-
 	kfree(mtd->name);
 
 	if (priv->vbase)
@@ -926,15 +924,20 @@ static int fsl_elbc_nand_probe(struct platform_device *pdev)
 
 	/* First look for RedBoot table or partitions on the command
 	 * line, these take precedence over device tree information */
-	mtd_device_parse_register(mtd, part_probe_types, NULL,
-				  NULL, 0);
+	ret = mtd_device_parse_register(mtd, part_probe_types, NULL, NULL, 0);
+	if (ret)
+		goto cleanup_nand;
 
 	pr_info("eLBC NAND device at 0x%llx, bank %d\n",
 		(unsigned long long)res.start, priv->bank);
+
 	return 0;
 
+cleanup_nand:
+	nand_cleanup(&priv->chip);
 err:
 	fsl_elbc_chip_remove(priv);
+
 	return ret;
 }
 
@@ -942,7 +945,9 @@ static int fsl_elbc_nand_remove(struct platform_device *pdev)
 {
 	struct fsl_elbc_fcm_ctrl *elbc_fcm_ctrl = fsl_lbc_ctrl_dev->nand;
 	struct fsl_elbc_mtd *priv = dev_get_drvdata(&pdev->dev);
+	struct mtd_info *mtd = nand_to_mtd(&priv->chip);
 
+	nand_release(mtd);
 	fsl_elbc_chip_remove(priv);
 
 	mutex_lock(&fsl_elbc_nand_mutex);
-- 
2.14.1
