Received: from mailout2.samsung.com ([203.254.224.25])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vtubt-00017A-4m
 for linux-mtd@lists.infradead.org; Fri, 20 Dec 2013 07:35:02 +0000
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MY30016DH1L9810@mailout2.samsung.com> for
 linux-mtd@lists.infradead.org; Fri, 20 Dec 2013 16:34:33 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
References: <000d01cefd55$7e48a2a0$7ad9e7e0$%han@samsung.com>
In-reply-to: <000d01cefd55$7e48a2a0$7ad9e7e0$%han@samsung.com>
Subject: [PATCH V2 7/8] mtd: plat_nand: Use devm_*() functions
Date: Fri, 20 Dec 2013 16:34:32 +0900
Message-id: <001401cefd55$ecf96d60$c6ec4820$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: linux-mtd@lists.infradead.org, 'Jingoo Han' <jg1.han@samsung.com>,
 'David Woodhouse' <dwmw2@infradead.org>, 'Vitaly Wool' <vitalywool@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use devm_*() functions to make cleanup paths simpler.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
No change since v1.

 drivers/mtd/nand/plat_nand.c |   30 +++++-------------------------
 1 file changed, 5 insertions(+), 25 deletions(-)

diff --git a/drivers/mtd/nand/plat_nand.c b/drivers/mtd/nand/plat_nand.c
index cad4cdc..7734f0e 100644
--- a/drivers/mtd/nand/plat_nand.c
+++ b/drivers/mtd/nand/plat_nand.c
@@ -52,25 +52,16 @@ static int plat_nand_probe(struct platform_device *pdev)
 		return -ENXIO;
 
 	/* Allocate memory for the device structure (and zero it) */
-	data = kzalloc(sizeof(struct plat_nand_data), GFP_KERNEL);
+	data = devm_kzalloc(&pdev->dev, sizeof(struct plat_nand_data),
+			    GFP_KERNEL);
 	if (!data) {
 		dev_err(&pdev->dev, "failed to allocate device structure.\n");
 		return -ENOMEM;
 	}
 
-	if (!request_mem_region(res->start, resource_size(res),
-				dev_name(&pdev->dev))) {
-		dev_err(&pdev->dev, "request_mem_region failed\n");
-		err = -EBUSY;
-		goto out_free;
-	}
-
-	data->io_base = ioremap(res->start, resource_size(res));
-	if (data->io_base == NULL) {
-		dev_err(&pdev->dev, "ioremap failed\n");
-		err = -EIO;
-		goto out_release_io;
-	}
+	data->io_base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(data->io_base))
+		return PTR_ERR(data->io_base);
 
 	data->chip.priv = &data;
 	data->mtd.priv = &data->chip;
@@ -122,11 +113,6 @@ static int plat_nand_probe(struct platform_device *pdev)
 out:
 	if (pdata->ctrl.remove)
 		pdata->ctrl.remove(pdev);
-	iounmap(data->io_base);
-out_release_io:
-	release_mem_region(res->start, resource_size(res));
-out_free:
-	kfree(data);
 	return err;
 }
 
@@ -137,16 +123,10 @@ static int plat_nand_remove(struct platform_device *pdev)
 {
 	struct plat_nand_data *data = platform_get_drvdata(pdev);
 	struct platform_nand_data *pdata = dev_get_platdata(&pdev->dev);
-	struct resource *res;
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 
 	nand_release(&data->mtd);
 	if (pdata->ctrl.remove)
 		pdata->ctrl.remove(pdev);
-	iounmap(data->io_base);
-	release_mem_region(res->start, resource_size(res));
-	kfree(data);
 
 	return 0;
 }
-- 
1.7.10.4
