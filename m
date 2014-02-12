Received: from mailout2.samsung.com ([203.254.224.25])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDPfC-00033Y-4f
 for linux-mtd@lists.infradead.org; Wed, 12 Feb 2014 02:35:03 +0000
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N0V009T535QNP80@mailout2.samsung.com> for
 linux-mtd@lists.infradead.org; Wed, 12 Feb 2014 11:34:38 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
References: <000201cf279a$49891080$dc9b3180$%han@samsung.com>
In-reply-to: <000201cf279a$49891080$dc9b3180$%han@samsung.com>
Subject: [PATCH 2/2] mtd: omap2: Use devm_ioremap_resource()
Date: Wed, 12 Feb 2014 11:34:37 +0900
Message-id: <000301cf279a$f9722d10$ec568730$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: linux-mtd@lists.infradead.org, 'Jingoo Han' <jg1.han@samsung.com>,
 'David Woodhouse' <dwmw2@infradead.org>, "'Gupta, Pekon'" <pekon@ti.com>,
 'Ezequiel Garcia' <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use devm_ioremap_resource() in order to make the code simpler,
and remove redundant return value check of platform_get_resource()
because the value is checked by devm_ioremap_resource(). Also,
'unsigned long mem_size' is removed from 'struct omap_nand_info',
because the 'mem_size' variable is not necessary anymore.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/mtd/nand/omap2.c |   23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index ef4190a..2c44586 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -159,7 +159,6 @@ struct omap_nand_info {
 
 	int				gpmc_cs;
 	unsigned long			phys_base;
-	unsigned long			mem_size;
 	struct completion		comp;
 	struct dma_chan			*dma;
 	int				gpmc_irq_fifo;
@@ -1665,27 +1664,11 @@ static int omap_nand_probe(struct platform_device *pdev)
 	nand_chip->options	|= NAND_SKIP_BBTSCAN;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (res == NULL) {
-		err = -EINVAL;
-		dev_err(&pdev->dev, "error getting memory resource\n");
-		goto return_error;
-	}
+	nand_chip->IO_ADDR_R = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(nand_chip->IO_ADDR_R))
+		return PTR_ERR(nand_chip->IO_ADDR_R);
 
 	info->phys_base = res->start;
-	info->mem_size = resource_size(res);
-
-	if (!devm_request_mem_region(&pdev->dev, info->phys_base,
-				info->mem_size,	pdev->dev.driver->name)) {
-		err = -EBUSY;
-		goto return_error;
-	}
-
-	nand_chip->IO_ADDR_R = devm_ioremap(&pdev->dev, info->phys_base,
-						info->mem_size);
-	if (!nand_chip->IO_ADDR_R) {
-		err = -ENOMEM;
-		goto return_error;
-	}
 
 	nand_chip->controller = &info->controller;
 
-- 
1.7.10.4
