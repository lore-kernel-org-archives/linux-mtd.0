Received: from mailout3.samsung.com ([203.254.224.33])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vw1RV-0003T1-DK
 for linux-mtd@lists.infradead.org; Thu, 26 Dec 2013 03:17:02 +0000
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MYE0022093Q9I50@mailout3.samsung.com> for
 linux-mtd@lists.infradead.org; Thu, 26 Dec 2013 12:16:38 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
References: <008201cf01e6$6b894da0$429be8e0$%han@samsung.com>
In-reply-to: <008201cf01e6$6b894da0$429be8e0$%han@samsung.com>
Subject: [PATCH 16/23] mtd: fsmc_nand: Remove unnecessary OOM messages
Date: Thu, 26 Dec 2013 12:16:38 +0900
Message-id: <009301cf01e8$e3eec430$abcc4c90$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: linux-mtd@lists.infradead.org, 'Linus Walleij' <linus.walleij@linaro.org>,
 'Jingoo Han' <jg1.han@samsung.com>, 'David Woodhouse' <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The site-specific OOM messages are unnecessary, because they
duplicate the MM subsystem generic OOM message.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/mtd/nand/fsmc_nand.c |    8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index 8b27522..a5915f1 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -889,10 +889,8 @@ static int fsmc_nand_probe_config_dt(struct platform_device *pdev,
 
 	pdata->nand_timings = devm_kzalloc(&pdev->dev,
 				sizeof(*pdata->nand_timings), GFP_KERNEL);
-	if (!pdata->nand_timings) {
-		dev_err(&pdev->dev, "no memory for nand_timing\n");
+	if (!pdata->nand_timings)
 		return -ENOMEM;
-	}
 	of_property_read_u8_array(np, "timings", (u8 *)pdata->nand_timings,
 						sizeof(*pdata->nand_timings));
 
@@ -950,10 +948,8 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 
 	/* Allocate memory for the device structure (and zero it) */
 	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
-	if (!host) {
-		dev_err(&pdev->dev, "failed to allocate device structure\n");
+	if (!host)
 		return -ENOMEM;
-	}
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "nand_data");
 	host->data_va = devm_ioremap_resource(&pdev->dev, res);
-- 
1.7.10.4
