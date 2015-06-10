Received: from mail-wg0-f65.google.com ([74.125.82.65])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2mn1-0000Fp-U0
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 20:40:00 +0000
Received: by wggx12 with SMTP id x12so8980724wgg.1
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2015 13:39:42 -0700 (PDT)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2 31/60] mtd: nand: fsl_ifc_nand: show parent device in sysfs
Date: Wed, 10 Jun 2015 22:38:45 +0200
Message-Id: <1433968754-10651-32-git-send-email-fransklaver@gmail.com>
In-Reply-To: <1433968754-10651-1-git-send-email-fransklaver@gmail.com>
References: <1433968754-10651-1-git-send-email-fransklaver@gmail.com>
Cc: linux-mtd@lists.infradead.org, Frans Klaver <fransklaver@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix a bug where parent device symlinks aren't shown in sysfs.

While at it, make use of the default owner set by mtdcore.

Signed-off-by: Frans Klaver <fransklaver@gmail.com>
---
 drivers/mtd/nand/fsl_ifc_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
index 51394e5..c2a78fa 100644
--- a/drivers/mtd/nand/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/fsl_ifc_nand.c
@@ -880,7 +880,7 @@ static int fsl_ifc_chip_init(struct fsl_ifc_mtd *priv)
 
 	/* Fill in fsl_ifc_mtd structure */
 	priv->mtd.priv = chip;
-	priv->mtd.owner = THIS_MODULE;
+	priv->mtd.dev.parent = priv->dev;
 
 	/* fill in nand_chip structure */
 	/* set up function call table */
-- 
2.4.0
