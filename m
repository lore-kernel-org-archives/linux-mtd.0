Received: from mailout1.samsung.com ([203.254.224.24])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vw1TD-0003VW-Hh
 for linux-mtd@lists.infradead.org; Thu, 26 Dec 2013 03:18:48 +0000
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MYE008E196O3X30@mailout1.samsung.com> for
 linux-mtd@lists.infradead.org; Thu, 26 Dec 2013 12:18:25 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
References: <008201cf01e6$6b894da0$429be8e0$%han@samsung.com>
In-reply-to: <008201cf01e6$6b894da0$429be8e0$%han@samsung.com>
Subject: [PATCH 18/23] mtd: lpc32xx_mlc: Remove unnecessary OOM messages
Date: Thu, 26 Dec 2013 12:18:24 +0900
Message-id: <009501cf01e9$231fad40$695f07c0$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: 'Roland Stigge' <stigge@antcom.de>, linux-mtd@lists.infradead.org,
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
 drivers/mtd/nand/lpc32xx_mlc.c |   10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/lpc32xx_mlc.c b/drivers/mtd/nand/lpc32xx_mlc.c
index 48be850..687478c 100644
--- a/drivers/mtd/nand/lpc32xx_mlc.c
+++ b/drivers/mtd/nand/lpc32xx_mlc.c
@@ -613,10 +613,8 @@ static struct lpc32xx_nand_cfg_mlc *lpc32xx_parse_dt(struct device *dev)
 	struct device_node *np = dev->of_node;
 
 	ncfg = devm_kzalloc(dev, sizeof(*ncfg), GFP_KERNEL);
-	if (!ncfg) {
-		dev_err(dev, "could not allocate memory for platform data\n");
+	if (!ncfg)
 		return NULL;
-	}
 
 	of_property_read_u32(np, "nxp,tcea-delay", &ncfg->tcea_delay);
 	of_property_read_u32(np, "nxp,busy-delay", &ncfg->busy_delay);
@@ -652,10 +650,8 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 
 	/* Allocate memory for the device structure (and zero it) */
 	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
-	if (!host) {
-		dev_err(&pdev->dev, "failed to allocate device structure.\n");
+	if (!host)
 		return -ENOMEM;
-	}
 
 	rc = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	host->io_base = devm_ioremap_resource(&pdev->dev, rc);
@@ -750,14 +746,12 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 
 	host->dma_buf = devm_kzalloc(&pdev->dev, mtd->writesize, GFP_KERNEL);
 	if (!host->dma_buf) {
-		dev_err(&pdev->dev, "Error allocating dma_buf memory\n");
 		res = -ENOMEM;
 		goto err_exit3;
 	}
 
 	host->dummy_buf = devm_kzalloc(&pdev->dev, mtd->writesize, GFP_KERNEL);
 	if (!host->dummy_buf) {
-		dev_err(&pdev->dev, "Error allocating dummy_buf memory\n");
 		res = -ENOMEM;
 		goto err_exit3;
 	}
-- 
1.7.10.4
