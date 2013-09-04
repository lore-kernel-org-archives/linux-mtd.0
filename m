Received: from mail-ie0-x22e.google.com ([2607:f8b0:4001:c03::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VHHmG-0004mT-TV
 for linux-mtd@lists.infradead.org; Wed, 04 Sep 2013 18:26:05 +0000
Received: by mail-ie0-f174.google.com with SMTP id k14so1459908iea.33
 for <linux-mtd@lists.infradead.org>; Wed, 04 Sep 2013 11:25:45 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 02/12] mtd: nand: lpc32xx_slc: don't call nand_default_bbt
 directly
Date: Wed,  4 Sep 2013 11:25:16 -0700
Message-Id: <1378319126-24473-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1378319126-24473-1-git-send-email-computersforpeace@gmail.com>
References: <1378319126-24473-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This driver is doing some strange logic here. If it doesn't have
flash-based BBT enabled, it allows nand_scan_tail() to scan the BBT. But
if it is using flash-based BBT, it tells nand_scan_tail() to skip
scanning, then it immediately calls the default BBT scanning function
itself.

As I read it, this logic is equivalent to the default nand_scan_tail()
behavior without interfering with NAND_SKIP_BBTSCAN or calling
nand_default_bbt() directly at all.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/lpc32xx_slc.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/mtd/nand/lpc32xx_slc.c b/drivers/mtd/nand/lpc32xx_slc.c
index add7570..6d5f8c5 100644
--- a/drivers/mtd/nand/lpc32xx_slc.c
+++ b/drivers/mtd/nand/lpc32xx_slc.c
@@ -893,7 +893,6 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 
 	/* Avoid extra scan if using BBT, setup BBT support */
 	if (host->ncfg->use_bbt) {
-		chip->options |= NAND_SKIP_BBTSCAN;
 		chip->bbt_options |= NAND_BBT_USE_FLASH;
 
 		/*
@@ -915,13 +914,6 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 		goto err_exit3;
 	}
 
-	/* Standard layout in FLASH for bad block tables */
-	if (host->ncfg->use_bbt) {
-		if (nand_default_bbt(mtd) < 0)
-			dev_err(&pdev->dev,
-			       "Error initializing default bad block tables\n");
-	}
-
 	mtd->name = "nxp_lpc3220_slc";
 	ppdata.of_node = pdev->dev.of_node;
 	res = mtd_device_parse_register(mtd, NULL, &ppdata, host->ncfg->parts,
-- 
1.8.4
