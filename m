Received: from h1446028.stratoserver.net ([85.214.92.142]
 helo=mail.ahsoftware.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wp3CL-0003vY-M2
 for linux-mtd@lists.infradead.org; Mon, 26 May 2014 22:16:50 +0000
Received: from eiche.ahsoftware (p57B20CCF.dip0.t-ipconnect.de [87.178.12.207])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.ahsoftware.de (Postfix) with ESMTPSA id 11602423C315
 for <linux-mtd@lists.infradead.org>; Tue, 27 May 2014 00:16:29 +0200 (CEST)
From: Alexander Holler <holler@ahsoftware.de>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 20/27] mtd: nand: fsl_elbc: show device structure in sysfs
Date: Tue, 27 May 2014 00:12:45 +0200
Message-Id: <1401142372-14148-21-git-send-email-holler@ahsoftware.de>
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
 drivers/mtd/nand/fsl_elbc_nand.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
index ec549cd..dd2df90 100644
--- a/drivers/mtd/nand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/fsl_elbc_nand.c
@@ -732,10 +732,6 @@ static int fsl_elbc_chip_init(struct fsl_elbc_mtd *priv)
 
 	dev_dbg(priv->dev, "eLBC Set Information for bank %d\n", priv->bank);
 
-	/* Fill in fsl_elbc_mtd structure */
-	priv->mtd.priv = chip;
-	priv->mtd.owner = THIS_MODULE;
-
 	/* set timeout to maximum */
 	priv->fmr = 15 << FMR_CWTO_SHIFT;
 	if (in_be32(&lbc->bank[priv->bank].or) & OR_FCM_PGS)
@@ -873,6 +869,7 @@ static int fsl_elbc_nand_probe(struct platform_device *pdev)
 		goto err;
 	}
 
+	mtd_setup_common_members(&priv->mtd, &priv->chip, pdev);
 	priv->mtd.name = kasprintf(GFP_KERNEL, "%llx.flash", (u64)res.start);
 	if (!priv->mtd.name) {
 		ret = -ENOMEM;
-- 
1.8.3.2
