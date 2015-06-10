Received: from mail-wi0-x244.google.com ([2a00:1450:400c:c05::244])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2mnW-0003rO-Cq
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 20:40:30 +0000
Received: by wivr20 with SMTP id r20so11925384wiv.3
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2015 13:40:10 -0700 (PDT)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2 57/60] mtd: onenand: omap2: drop owner and name assignment
Date: Wed, 10 Jun 2015 22:39:11 +0200
Message-Id: <1433968754-10651-58-git-send-email-fransklaver@gmail.com>
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

Owner and name are automatically set by mtdcore. Make use of that.

Signed-off-by: Frans Klaver <fransklaver@gmail.com>
---
 drivers/mtd/onenand/omap2.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
index 646ddd6..3e02856 100644
--- a/drivers/mtd/onenand/omap2.c
+++ b/drivers/mtd/onenand/omap2.c
@@ -710,9 +710,7 @@ static int omap2_onenand_probe(struct platform_device *pdev)
 		 c->onenand.base, c->freq);
 
 	c->pdev = pdev;
-	c->mtd.name = dev_name(&pdev->dev);
 	c->mtd.priv = &c->onenand;
-	c->mtd.owner = THIS_MODULE;
 
 	c->mtd.dev.parent = &pdev->dev;
 
-- 
2.4.0
