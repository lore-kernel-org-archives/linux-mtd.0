Received: from mailout2.samsung.com ([203.254.224.25])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UZbYn-0004Qu-AW
 for linux-mtd@lists.infradead.org; Tue, 07 May 2013 06:39:37 +0000
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MMF00J7D14UZ8C0@mailout2.samsung.com> for
 linux-mtd@lists.infradead.org; Tue, 07 May 2013 15:39:16 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Artem Bityutskiy' <artem.bityutskiy@linux.intel.com>
Subject: [PATCH 17/26] mtd: nand: lpc32xx: remove unnecessary
 platform_set_drvdata()
Date: Tue, 07 May 2013 15:39:15 +0900
Message-id: <005501ce4aed$981487f0$c83d97d0$@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: Roland Stigge <stigge@antcom.de>, linux-mtd@lists.infradead.org,
 Jingoo Han <jg1.han@samsung.com>, 'David Woodhouse' <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The driver core clears the driver data to NULL after device_release
or on probe failure, since commit 0998d0631001288a5974afc0b2a5f568bcdecb4d
(device-core: Ensure drvdata = NULL when no driver is bound).
Thus, it is not needed to manually clear the device driver data to NULL.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/mtd/nand/lpc32xx_mlc.c |    2 --
 drivers/mtd/nand/lpc32xx_slc.c |    2 --
 2 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/lpc32xx_mlc.c b/drivers/mtd/nand/lpc32xx_mlc.c
index a94facb..5a5cfbc 100644
--- a/drivers/mtd/nand/lpc32xx_mlc.c
+++ b/drivers/mtd/nand/lpc32xx_mlc.c
@@ -833,7 +833,6 @@ err_exit3:
 err_exit2:
 	clk_disable(host->clk);
 	clk_put(host->clk);
-	platform_set_drvdata(pdev, NULL);
 err_exit1:
 	lpc32xx_wp_enable(host);
 	gpio_free(host->ncfg->wp_gpio);
@@ -856,7 +855,6 @@ static int lpc32xx_nand_remove(struct platform_device *pdev)
 
 	clk_disable(host->clk);
 	clk_put(host->clk);
-	platform_set_drvdata(pdev, NULL);
 
 	lpc32xx_wp_enable(host);
 	gpio_free(host->ncfg->wp_gpio);
diff --git a/drivers/mtd/nand/lpc32xx_slc.c b/drivers/mtd/nand/lpc32xx_slc.c
index be94ed5..a66f33f 100644
--- a/drivers/mtd/nand/lpc32xx_slc.c
+++ b/drivers/mtd/nand/lpc32xx_slc.c
@@ -936,7 +936,6 @@ err_exit3:
 err_exit2:
 	clk_disable(host->clk);
 	clk_put(host->clk);
-	platform_set_drvdata(pdev, NULL);
 err_exit1:
 	lpc32xx_wp_enable(host);
 	gpio_free(host->ncfg->wp_gpio);
@@ -963,7 +962,6 @@ static int lpc32xx_nand_remove(struct platform_device *pdev)
 
 	clk_disable(host->clk);
 	clk_put(host->clk);
-	platform_set_drvdata(pdev, NULL);
 	lpc32xx_wp_enable(host);
 	gpio_free(host->ncfg->wp_gpio);
 
-- 
1.7.2.5
