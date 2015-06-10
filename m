Received: from mail-wi0-x242.google.com ([2a00:1450:400c:c05::242])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2mnK-0003pC-PZ
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 20:40:19 +0000
Received: by wivr20 with SMTP id r20so11923473wiv.3
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2015 13:40:00 -0700 (PDT)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2 47/60] mtd: nand: pxa3xx_nand: show parent device in sysfs
Date: Wed, 10 Jun 2015 22:39:01 +0200
Message-Id: <1433968754-10651-48-git-send-email-fransklaver@gmail.com>
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
 drivers/mtd/nand/pxa3xx_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index a4615fc..ea06f5b 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1639,7 +1639,7 @@ static int alloc_nand_resource(struct platform_device *pdev)
 		host->cs = cs;
 		host->info_data = info;
 		mtd->priv = host;
-		mtd->owner = THIS_MODULE;
+		mtd->dev.parent = &pdev->dev;
 
 		chip->ecc.read_page	= pxa3xx_nand_read_page_hwecc;
 		chip->ecc.write_page	= pxa3xx_nand_write_page_hwecc;
-- 
2.4.0
