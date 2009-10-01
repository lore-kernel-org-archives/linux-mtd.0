Received: from arroyo.ext.ti.com ([192.94.94.40])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MtMdV-0000EC-QI
	for linux-mtd@lists.infradead.org; Thu, 01 Oct 2009 14:28:06 +0000
From: Hemant Pedanekar <hemantp@ti.com>
To: dwmw2@infradead.org, dbrownell@users.sourceforge.net,
	akpm@linux-foundation.org, Artem.Bityutskiy@nokia.com,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: nand: davinci: fix to use mask_ale from pdata
Date: Thu,  1 Oct 2009 19:55:06 +0530
Message-Id: <1254407106-19390-1-git-send-email-hemantp@ti.com>
Cc: davinci-linux-open-source@linux.davincidsp.com, hemantp@ti.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Correct typo to use mask_ale from platform data when set to non-zero.

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
