Received: from mail-wg0-x242.google.com ([2a00:1450:400c:c00::242])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2mn0-0003k9-2k
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 20:39:58 +0000
Received: by wggx12 with SMTP id x12so8980576wgg.1
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2015 13:39:41 -0700 (PDT)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2 30/60] mtd: nand: fsl_elbc_nand: show parent device in sysfs
Date: Wed, 10 Jun 2015 22:38:44 +0200
Message-Id: <1433968754-10651-31-git-send-email-fransklaver@gmail.com>
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

Fix a bug where mtd parent device symlinks aren't shown in sysfs.

While at it, make use of the default owner value set by mtdcore.

Signed-off-by: Frans Klaver <fransklaver@gmail.com>

--
v1..v2
  - fix build error
---
 drivers/mtd/nand/fsl_elbc_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
index 04b22fd..d50c345 100644
--- a/drivers/mtd/nand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/fsl_elbc_nand.c
@@ -747,7 +747,7 @@ static int fsl_elbc_chip_init(struct fsl_elbc_mtd *priv)
 
 	/* Fill in fsl_elbc_mtd structure */
 	priv->mtd.priv = chip;
-	priv->mtd.owner = THIS_MODULE;
+	priv->mtd.dev.parent = priv->dev;
 
 	/* set timeout to maximum */
 	priv->fmr = 15 << FMR_CWTO_SHIFT;
-- 
2.4.0
