Received: from wf-out-1314.google.com ([209.85.200.170])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MAC3m-00063S-G5
	for linux-mtd@lists.infradead.org; Sat, 30 May 2009 00:04:33 +0000
Received: by wf-out-1314.google.com with SMTP id 23so1882651wfg.24
	for <linux-mtd@lists.infradead.org>;
	Fri, 29 May 2009 17:04:24 -0700 (PDT)
From: Kevin Hilman <khilman@deeprootsystems.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] NAND: davinci: update clock naming
Date: Fri, 29 May 2009 17:04:22 -0700
Message-Id: <1243641862-1404-1-git-send-email-khilman@deeprootsystems.com>
Cc: Kevin Hilman <khilman@deeprootsystems.com>,
	davinci-linux-open-source@linux.davincidsp.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

DaVinci clock support has been updated in mainline.
Update clock names accordingly.

Signed-off-by: Kevin Hilman <khilman@deeprootsystems.com>
---
 drivers/mtd/nand/davinci_nand.c |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index 0119220..02700f7 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -407,16 +407,17 @@ static int __init nand_davinci_probe(struct platform_device *pdev)
 	}
 	info->chip.ecc.mode = ecc_mode;
 
-	info->clk = clk_get(&pdev->dev, "AEMIFCLK");
+	info->clk = clk_get(&pdev->dev, "aemif");
 	if (IS_ERR(info->clk)) {
 		ret = PTR_ERR(info->clk);
-		dev_dbg(&pdev->dev, "unable to get AEMIFCLK, err %d\n", ret);
+		dev_dbg(&pdev->dev, "unable to get AEMIF clock, err %d\n", ret);
 		goto err_clk;
 	}
 
 	ret = clk_enable(info->clk);
 	if (ret < 0) {
-		dev_dbg(&pdev->dev, "unable to enable AEMIFCLK, err %d\n", ret);
+		dev_dbg(&pdev->dev, "unable to enable AEMIF clock, err %d\n",
+			ret);
 		goto err_clk_enable;
 	}
 
-- 
1.6.2.2
