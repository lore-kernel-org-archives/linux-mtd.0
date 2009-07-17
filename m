Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MRpet-0001JR-UK
	for linux-mtd@lists.infradead.org; Fri, 17 Jul 2009 15:47:40 +0000
From: Wolfram Sang <w.sang@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] mtd/plat-ram: use resource_size()
Date: Fri, 17 Jul 2009 17:47:37 +0200
Message-Id: <1247845657-23426-1-git-send-email-w.sang@pengutronix.de>
Cc: Wolfram Sang <w.sang@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
---
 drivers/mtd/maps/plat-ram.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/maps/plat-ram.c b/drivers/mtd/maps/plat-ram.c
index 49c9ece..dafb919 100644
--- a/drivers/mtd/maps/plat-ram.c
+++ b/drivers/mtd/maps/plat-ram.c
@@ -175,7 +175,7 @@ static int platram_probe(struct platform_device *pdev)
 	/* setup map parameters */
 
 	info->map.phys = res->start;
-	info->map.size = (res->end - res->start) + 1;
+	info->map.size = resource_size(res);
 	info->map.name = pdata->mapname != NULL ?
 			(char *)pdata->mapname : (char *)pdev->name;
 	info->map.bankwidth = pdata->bankwidth;
-- 
1.6.3.1
