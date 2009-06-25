Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MJo85-0006yf-PH
	for linux-mtd@lists.infradead.org; Thu, 25 Jun 2009 12:32:44 +0000
Received: from vaebh105.NOE.Nokia.com (vaebh105.europe.nokia.com
	[10.160.244.31])
	by mgw-mx03.nokia.com (Switch-3.3.3/Switch-3.3.3) with ESMTP id
	n5PCWPEi009833
	for <linux-mtd@lists.infradead.org>; Thu, 25 Jun 2009 15:32:28 +0300
From: Mika Korhonen <ext-mika.2.korhonen@nokia.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] MTD: OneNAND OMAP2/3: Free GPMC CS on module removal
Date: Thu, 25 Jun 2009 15:32:19 +0300
Message-Id: <1245933139-6658-1-git-send-email-ext-mika.2.korhonen@nokia.com>
Cc: Mika Korhonen <ext-mika.2.korhonen@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

GPMC CS was not freed in omap2_onenand_remove() preventing the module
from reloading after removal.

Signed-off-by: Mika Korhonen <ext-mika.2.korhonen@nokia.com>
---
 drivers/mtd/onenand/omap2.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
index 38d656b..352fcc2 100644
--- a/drivers/mtd/onenand/omap2.c
+++ b/drivers/mtd/onenand/omap2.c
@@ -770,6 +770,7 @@ static int __devexit omap2_onenand_remove(struct platform_device *pdev)
 	}
 	iounmap(c->onenand.base);
 	release_mem_region(c->phys_base, ONENAND_IO_SIZE);
+	gpmc_cs_free(c->gpmc_cs);
 	kfree(c);
 
 	return 0;
-- 
1.5.6.5
