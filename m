Received: from mailout1.samsung.com ([203.254.224.24])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vw00v-0002HS-8t
 for linux-mtd@lists.infradead.org; Thu, 26 Dec 2013 01:45:30 +0000
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MYE000GK4V07V90@mailout1.samsung.com> for
 linux-mtd@lists.infradead.org; Thu, 26 Dec 2013 10:45:00 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
References: <007901cf01db$8362f580$8a28e080$%han@samsung.com>
In-reply-to: <007901cf01db$8362f580$8a28e080$%han@samsung.com>
Subject: [PATCH V3 6/8] mtd: nuc900_nand: Use devm_*() functions
Date: Thu, 26 Dec 2013 10:44:59 +0900
Message-id: <007e01cf01dc$16708720$43519560$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: linux-mtd@lists.infradead.org, 'Jingoo Han' <jg1.han@samsung.com>,
 'David Woodhouse' <dwmw2@infradead.org>, 'Wan ZongShun' <mcuos.com@gmail.com>
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
No change since v2.

 drivers/mtd/nand/nuc900_nand.c |   55 ++++++++++------------------------------
 1 file changed, 13 insertions(+), 42 deletions(-)

diff --git a/drivers/mtd/nand/nuc900_nand.c b/drivers/mtd/nand/nuc900_nand.c
index 5211515..661fd14 100644
--- a/drivers/mtd/nand/nuc900_nand.c
+++ b/drivers/mtd/nand/nuc900_nand.c
@@ -241,12 +241,10 @@ static int nuc900_nand_probe(struct platform_device *pdev)
 {
 	struct nuc900_nand *nuc900_nand;
 	struct nand_chip *chip;
-	int retval;
 	struct resource *res;
 
-	retval = 0;
-
-	nuc900_nand = kzalloc(sizeof(struct nuc900_nand), GFP_KERNEL);
+	nuc900_nand = devm_kzalloc(&pdev->dev, sizeof(struct nuc900_nand),
+				   GFP_KERNEL);
 	if (!nuc900_nand)
 		return -ENOMEM;
 	chip = &(nuc900_nand->chip);
@@ -255,11 +253,9 @@ static int nuc900_nand_probe(struct platform_device *pdev)
 	nuc900_nand->mtd.owner	= THIS_MODULE;
 	spin_lock_init(&nuc900_nand->lock);
 
-	nuc900_nand->clk = clk_get(&pdev->dev, NULL);
-	if (IS_ERR(nuc900_nand->clk)) {
-		retval = -ENOENT;
-		goto fail1;
-	}
+	nuc900_nand->clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(nuc900_nand->clk))
+		return -ENOENT;
 	clk_enable(nuc900_nand->clk);
 
 	chip->cmdfunc		= nuc900_nand_command_lp;
@@ -272,57 +268,32 @@ static int nuc900_nand_probe(struct platform_device *pdev)
 	chip->ecc.mode		= NAND_ECC_SOFT;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		retval = -ENXIO;
-		goto fail1;
-	}
+	if (!res)
+		return -ENXIO;
 
-	if (!request_mem_region(res->start, resource_size(res), pdev->name)) {
-		retval = -EBUSY;
-		goto fail1;
-	}
-
-	nuc900_nand->reg = ioremap(res->start, resource_size(res));
-	if (!nuc900_nand->reg) {
-		retval = -ENOMEM;
-		goto fail2;
-	}
+	nuc900_nand->reg = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(nuc900_nand->reg))
+		return PTR_ERR(nuc900_nand->reg);
 
 	nuc900_nand_enable(nuc900_nand);
 
-	if (nand_scan(&(nuc900_nand->mtd), 1)) {
-		retval = -ENXIO;
-		goto fail3;
-	}
+	if (nand_scan(&(nuc900_nand->mtd), 1))
+		return -ENXIO;
 
 	mtd_device_register(&(nuc900_nand->mtd), partitions,
 			    ARRAY_SIZE(partitions));
 
 	platform_set_drvdata(pdev, nuc900_nand);
 
-	return retval;
-
-fail3:	iounmap(nuc900_nand->reg);
-fail2:	release_mem_region(res->start, resource_size(res));
-fail1:	kfree(nuc900_nand);
-	return retval;
+	return 0;
 }
 
 static int nuc900_nand_remove(struct platform_device *pdev)
 {
 	struct nuc900_nand *nuc900_nand = platform_get_drvdata(pdev);
-	struct resource *res;
 
 	nand_release(&nuc900_nand->mtd);
-	iounmap(nuc900_nand->reg);
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	release_mem_region(res->start, resource_size(res));
-
 	clk_disable(nuc900_nand->clk);
-	clk_put(nuc900_nand->clk);
-
-	kfree(nuc900_nand);
 
 	return 0;
 }
-- 
1.7.10.4
