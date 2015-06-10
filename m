Received: from mail-wi0-x242.google.com ([2a00:1450:400c:c05::242])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2mnF-0003oO-Pm
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 20:40:14 +0000
Received: by wivr20 with SMTP id r20so11951122wiv.1
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2015 13:39:55 -0700 (PDT)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2 43/60] mtd: nand: omap2: show parent device structure in
 sysfs
Date: Wed, 10 Jun 2015 22:38:57 +0200
Message-Id: <1433968754-10651-44-git-send-email-fransklaver@gmail.com>
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

Make sure the device structure is properly shown in sysfs by properly
filling in dev.parent.

While at it, make use of the default owner and name values set by
mtdcore.

Signed-off-by: Frans Klaver <fransklaver@gmail.com>
---
 drivers/mtd/nand/omap2.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 60fa899..7fbf009 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1684,8 +1684,7 @@ static int omap_nand_probe(struct platform_device *pdev)
 	info->ecc_opt		= pdata->ecc_opt;
 	mtd			= &info->mtd;
 	mtd->priv		= &info->nand;
-	mtd->name		= dev_name(&pdev->dev);
-	mtd->owner		= THIS_MODULE;
+	mtd->dev.parent		= &pdev->dev;
 	nand_chip		= &info->nand;
 	nand_chip->ecc.priv	= NULL;
 
-- 
2.4.0
