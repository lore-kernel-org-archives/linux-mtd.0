Received: from arroyo.ext.ti.com ([192.94.94.40])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MfdCA-0006vf-2Q
	for linux-mtd@lists.infradead.org; Mon, 24 Aug 2009 17:19:06 +0000
Received: from dbdp31.itg.ti.com ([172.24.170.98])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id n7OHIsH6002728
	for <linux-mtd@lists.infradead.org>; Mon, 24 Aug 2009 12:19:00 -0500
From: Hemant Pedanekar <hemantp@ti.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD] [NAND] davinci: fix to use mask_ale from pdata
Date: Mon, 24 Aug 2009 22:48:49 +0530
Message-Id: <1251134329-21780-1-git-send-email-hemantp@ti.com>
Cc: davinci-linux-open-source@linux.davincidsp.com, hemantp@ti.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Corrected typo to use mask_ale from platform data when set to non-zero.

Signed-off-by: Hemant Pedanekar <hemantp@ti.com>
---
 drivers/mtd/nand/davinci_nand.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index 0fad648..20b04a2 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -571,7 +571,7 @@ static int __init nand_davinci_probe(struct platform_device *pdev)
 	info->mask_chipsel	= pdata->mask_chipsel;
 
 	/* use nandboot-capable ALE/CLE masks by default */
-	info->mask_ale		= pdata->mask_cle ? : MASK_ALE;
+	info->mask_ale		= pdata->mask_ale ? : MASK_ALE;
 	info->mask_cle		= pdata->mask_cle ? : MASK_CLE;
 
 	/* Set address of hardware control function */
-- 
1.6.2.4
