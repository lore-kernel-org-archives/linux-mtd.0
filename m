Received: from mailout4.samsung.com ([203.254.224.34])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDPaS-0002vV-03
 for linux-mtd@lists.infradead.org; Wed, 12 Feb 2014 02:30:09 +0000
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N0V00IEF2XJF210@mailout4.samsung.com> for
 linux-mtd@lists.infradead.org; Wed, 12 Feb 2014 11:29:43 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
Subject: [PATCH 1/2] mtd: denali_dt: Use devm_ioremap_resource()
Date: Wed, 12 Feb 2014 11:29:42 +0900
Message-id: <000201cf279a$49891080$dc9b3180$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: linux-mtd@lists.infradead.org, 'Jingoo Han' <jg1.han@samsung.com>,
 'David Woodhouse' <dwmw2@infradead.org>, 'Dinh Nguyen' <dinguyen@altera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use devm_ioremap_resource() in order to make the code
simpler, and remove redundant return value check of
platform_get_resource_byname() because the value is
checked by devm_ioremap_resource().

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/mtd/nand/denali_dt.c |   39 ++++++++-------------------------------
 1 file changed, 8 insertions(+), 31 deletions(-)

diff --git a/drivers/mtd/nand/denali_dt.c b/drivers/mtd/nand/denali_dt.c
index babb02c..35cb17f 100644
--- a/drivers/mtd/nand/denali_dt.c
+++ b/drivers/mtd/nand/denali_dt.c
@@ -30,24 +30,6 @@ struct denali_dt {
 	struct clk		*clk;
 };
 
-static void __iomem *request_and_map(struct device *dev,
-				     const struct resource *res)
-{
-	void __iomem *ptr;
-
-	if (!devm_request_mem_region(dev, res->start, resource_size(res),
-				     "denali-dt")) {
-		dev_err(dev, "unable to request %s\n", res->name);
-		return NULL;
-	}
-
-	ptr = devm_ioremap_nocache(dev, res->start, resource_size(res));
-	if (!ptr)
-		dev_err(dev, "ioremap_nocache of %s failed!", res->name);
-
-	return ptr;
-}
-
 static const struct of_device_id denali_nand_dt_ids[] = {
 		{ .compatible = "denali,denali-nand-dt" },
 		{ /* sentinel */ }
@@ -78,13 +60,6 @@ static int denali_dt_probe(struct platform_device *ofdev)
 		return -ENOMEM;
 	denali = &dt->denali;
 
-	denali_reg = platform_get_resource_byname(ofdev, IORESOURCE_MEM, "denali_reg");
-	nand_data = platform_get_resource_byname(ofdev, IORESOURCE_MEM, "nand_data");
-	if (!denali_reg || !nand_data) {
-		dev_err(&ofdev->dev, "resources not completely defined\n");
-		return -EINVAL;
-	}
-
 	denali->platform = DT;
 	denali->dev = &ofdev->dev;
 	denali->irq = platform_get_irq(ofdev, 0);
@@ -93,13 +68,15 @@ static int denali_dt_probe(struct platform_device *ofdev)
 		return denali->irq;
 	}
 
-	denali->flash_reg = request_and_map(&ofdev->dev, denali_reg);
-	if (!denali->flash_reg)
-		return -ENOMEM;
+	denali_reg = platform_get_resource_byname(ofdev, IORESOURCE_MEM, "denali_reg");
+	denali->flash_reg = devm_ioremap_resource(&ofdev->dev, denali_reg);
+	if (IS_ERR(denali->flash_reg))
+		return PTR_ERR(denali->flash_reg);
 
-	denali->flash_mem = request_and_map(&ofdev->dev, nand_data);
-	if (!denali->flash_mem)
-		return -ENOMEM;
+	nand_data = platform_get_resource_byname(ofdev, IORESOURCE_MEM, "nand_data");
+	denali->flash_mem = devm_ioremap_resource(&ofdev->dev, nand_data);
+	if (IS_ERR(denali->flash_mem))
+		return PTR_ERR(denali->flash_mem);
 
 	if (!of_property_read_u32(ofdev->dev.of_node,
 		"dma-mask", (u32 *)&denali_dma_mask)) {
-- 
1.7.10.4
