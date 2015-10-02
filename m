Received: from mo6-p05-ob.smtp.rzone.de ([2a01:238:20a:202:5305::2])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zhxlg-0000jh-1M
 for linux-mtd@lists.infradead.org; Fri, 02 Oct 2015 10:40:48 +0000
From: Stefan Roese <sr@denx.de>
To: linux-mtd@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 2/3] mtd: nand: fsmc: Remove BUG macros
Date: Fri,  2 Oct 2015 12:40:21 +0200
Message-Id: <1443782422-4515-2-git-send-email-sr@denx.de>
In-Reply-To: <1443782422-4515-1-git-send-email-sr@denx.de>
References: <1443782422-4515-1-git-send-email-sr@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Remove the BUG macros and return with error (if possible) instead.

Signed-off-by: Stefan Roese <sr@denx.de>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/fsmc_nand.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index dc94882..45948e8 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -348,7 +348,7 @@ static void fsmc_select_chip(struct mtd_info *mtd, int chipnr)
 		break;
 
 	default:
-		BUG();
+		dev_err(host->dev, "unsupported chip-select %d\n", chipnr);
 	}
 }
 
@@ -1111,7 +1111,8 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 		default:
 			dev_warn(&pdev->dev, "No oob scheme defined for oobsize %d\n",
 				 mtd->oobsize);
-			BUG();
+			ret = -EINVAL;
+			goto err_probe;
 		}
 	} else {
 		switch (host->mtd.oobsize) {
@@ -1127,7 +1128,8 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 		default:
 			dev_warn(&pdev->dev, "No oob scheme defined for oobsize %d\n",
 				 mtd->oobsize);
-			BUG();
+			ret = -EINVAL;
+			goto err_probe;
 		}
 	}
 
-- 
2.5.3
