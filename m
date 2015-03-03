Received: from mail-wg0-x230.google.com ([2a00:1450:400c:c00::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSuac-0003S7-7P
 for linux-mtd@lists.infradead.org; Tue, 03 Mar 2015 21:42:55 +0000
Received: by wghl18 with SMTP id l18so42769240wgh.7
 for <linux-mtd@lists.infradead.org>; Tue, 03 Mar 2015 13:42:32 -0800 (PST)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 57/60] mtd: onenand: omap2: drop owner and name assignment
Date: Tue,  3 Mar 2015 22:40:41 +0100
Message-Id: <1425418844-25177-58-git-send-email-fransklaver@gmail.com>
In-Reply-To: <1425418844-25177-1-git-send-email-fransklaver@gmail.com>
References: <1425418844-25177-1-git-send-email-fransklaver@gmail.com>
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
2.2.2
