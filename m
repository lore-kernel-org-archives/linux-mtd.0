Received: from mail-wi0-x242.google.com ([2a00:1450:400c:c05::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2mnG-0000Kb-4o
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 20:40:14 +0000
Received: by wivr20 with SMTP id r20so11922022wiv.3
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2015 13:39:52 -0700 (PDT)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2 40/60] mtd: nand: mxc_nand: drop owner assignment
Date: Wed, 10 Jun 2015 22:38:54 +0200
Message-Id: <1433968754-10651-41-git-send-email-fransklaver@gmail.com>
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

Owner is automatically set by mtdcore. Make use of that.

Signed-off-by: Frans Klaver <fransklaver@gmail.com>
---
 drivers/mtd/nand/mxc_nand.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 372e0e3..dca63a7 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -1450,7 +1450,6 @@ static int mxcnd_probe(struct platform_device *pdev)
 	this = &host->nand;
 	mtd = &host->mtd;
 	mtd->priv = this;
-	mtd->owner = THIS_MODULE;
 	mtd->dev.parent = &pdev->dev;
 	mtd->name = DRIVER_NAME;
 
-- 
2.4.0
