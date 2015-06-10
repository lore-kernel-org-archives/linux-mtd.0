Received: from mail-wi0-x243.google.com ([2a00:1450:400c:c05::243])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2mn8-0005Eh-2P
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 20:40:06 +0000
Received: by wivz2 with SMTP id z2so11958082wiv.0
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2015 13:39:49 -0700 (PDT)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2 37/60] mtd: nand: jz4740_nand: show parent device in sysfs
Date: Wed, 10 Jun 2015 22:38:51 +0200
Message-Id: <1433968754-10651-38-git-send-email-fransklaver@gmail.com>
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

While at it, make use of the default owner value set by mtdcore.

Signed-off-by: Frans Klaver <fransklaver@gmail.com>
---
 drivers/mtd/nand/jz4740_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/jz4740_nand.c b/drivers/mtd/nand/jz4740_nand.c
index ebf2cce..dc4e844 100644
--- a/drivers/mtd/nand/jz4740_nand.c
+++ b/drivers/mtd/nand/jz4740_nand.c
@@ -434,7 +434,7 @@ static int jz_nand_probe(struct platform_device *pdev)
 	mtd		= &nand->mtd;
 	chip		= &nand->chip;
 	mtd->priv	= chip;
-	mtd->owner	= THIS_MODULE;
+	mtd->dev.parent = &pdev->dev;
 	mtd->name	= "jz4740-nand";
 
 	chip->ecc.hwctl		= jz_nand_hwctl;
-- 
2.4.0
