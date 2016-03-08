Received: from comal.ext.ti.com ([198.47.26.152])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1adDde-0001Sn-96
 for linux-mtd@lists.infradead.org; Tue, 08 Mar 2016 09:09:10 +0000
From: Sushaanth Srirangapathi <sushaanth.s@ti.com>
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>
CC: Sekhar Nori <nsekhar@ti.com>, <linux-omap@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Sushaanth
 Srirangapathi <sushaanth.s@ti.com>
Subject: [PATCH] mtd: davinci-nand: disable subpage write for davinci-nand
Date: Tue, 8 Mar 2016 14:38:15 +0530
Message-ID: <1457428095-2801-1-git-send-email-sushaanth.s@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit 28c015a9daabe4e ("mtd: davinci-nand: disable subpage write for
keystone-nand") disables subpage write for Keystone SOCs due to hw
issues.

But subpage writes doesn't work even for DaVinci SOCs due to hw issues.
So set NAND_NO_SUBPAGE_WRITE option for all devices compatible to
this driver.

I tested this patch using DA850 board.

Signed-off-by: Sushaanth Srirangapathi <sushaanth.s@ti.com>
---
 drivers/mtd/nand/davinci_nand.c |    6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index 8cb821b..466439c 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -601,11 +601,7 @@ static struct davinci_nand_pdata
 		    of_property_read_bool(pdev->dev.of_node,
 			"ti,davinci-nand-use-bbt"))
 			pdata->bbt_options = NAND_BBT_USE_FLASH;
-
-		if (of_device_is_compatible(pdev->dev.of_node,
-					    "ti,keystone-nand")) {
-			pdata->options |= NAND_NO_SUBPAGE_WRITE;
-		}
+		pdata->options |= NAND_NO_SUBPAGE_WRITE;
 	}
 
 	return dev_get_platdata(&pdev->dev);
-- 
1.7.9.5
