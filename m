Received: from smtp05.smtpout.orange.fr ([80.12.242.127]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eNPxC-0002AD-VF
 for linux-mtd@lists.infradead.org; Fri, 08 Dec 2017 21:13:09 +0000
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: kyungmin.park@samsung.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, boris.brezillon@free-electrons.com,
 marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 1/2] mtd: onenand: samsung: use devm_ function to simplify
 code and fix some leaks
Date: Fri,  8 Dec 2017 22:11:04 +0100
Message-Id: <6cde66a56d0228d3933cf0d92fdc725ccb880b4a.1512765898.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <cover.1512765898.git.christophe.jaillet@wanadoo.fr>
References: <cover.1512765898.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <cover.1512765898.git.christophe.jaillet@wanadoo.fr>
References: <cover.1512765898.git.christophe.jaillet@wanadoo.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Convert all error handling code in 's3c_onenand_probe()' to
resource-managed alternatives in order to simplify code.

This fixes a resource leak if 'platform_get_resource()' fails at line 872.

The 'request_irq()' at line 971 was also un-balanced. It is now
resource-managed

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested-only
---
 drivers/mtd/onenand/samsung.c | 141 +++++++++++++-----------------------------
 1 file changed, 43 insertions(+), 98 deletions(-)

diff --git a/drivers/mtd/onenand/samsung.c b/drivers/mtd/onenand/samsung.c
index af0ac1a7bf8f..04039b967d59 100644
--- a/drivers/mtd/onenand/samsung.c
+++ b/drivers/mtd/onenand/samsung.c
@@ -851,15 +851,14 @@ static int s3c_onenand_probe(struct platform_device *pdev)
 	/* No need to check pdata. the platform data is optional */
 
 	size = sizeof(struct mtd_info) + sizeof(struct onenand_chip);
-	mtd = kzalloc(size, GFP_KERNEL);
+	mtd = devm_kzalloc(&pdev->dev, size, GFP_KERNEL);
 	if (!mtd)
 		return -ENOMEM;
 
-	onenand = kzalloc(sizeof(struct s3c_onenand), GFP_KERNEL);
-	if (!onenand) {
-		err = -ENOMEM;
-		goto onenand_fail;
-	}
+	onenand = devm_kzalloc(&pdev->dev, sizeof(struct s3c_onenand),
+			       GFP_KERNEL);
+	if (!onenand)
+		return -ENOMEM;
 
 	this = (struct onenand_chip *) &mtd[1];
 	mtd->priv = this;
@@ -873,22 +872,20 @@ static int s3c_onenand_probe(struct platform_device *pdev)
 	if (!r) {
 		dev_err(&pdev->dev, "no memory resource defined\n");
 		return -ENOENT;
-		goto ahb_resource_failed;
 	}
 
-	onenand->base_res = request_mem_region(r->start, resource_size(r),
-					       pdev->name);
+	onenand->base_res = devm_request_mem_region(&pdev->dev, r->start,
+						    resource_size(r),
+						    pdev->name);
 	if (!onenand->base_res) {
 		dev_err(&pdev->dev, "failed to request memory resource\n");
-		err = -EBUSY;
-		goto resource_failed;
+		return -EBUSY;
 	}
 
-	onenand->base = ioremap(r->start, resource_size(r));
+	onenand->base = devm_ioremap(&pdev->dev, r->start, resource_size(r));
 	if (!onenand->base) {
 		dev_err(&pdev->dev, "failed to map memory resource\n");
-		err = -EFAULT;
-		goto ioremap_failed;
+		return -EFAULT;
 	}
 	/* Set onenand_chip also */
 	this->base = onenand->base;
@@ -900,38 +897,35 @@ static int s3c_onenand_probe(struct platform_device *pdev)
 		r = platform_get_resource(pdev, IORESOURCE_MEM, 1);
 		if (!r) {
 			dev_err(&pdev->dev, "no buffer memory resource defined\n");
-			err = -ENOENT;
-			goto ahb_resource_failed;
+			return -ENOENT;
 		}
 
-		onenand->ahb_res = request_mem_region(r->start, resource_size(r),
-						      pdev->name);
+		onenand->ahb_res = devm_request_mem_region(&pdev->dev,
+							   r->start,
+							   resource_size(r),
+							   pdev->name);
 		if (!onenand->ahb_res) {
 			dev_err(&pdev->dev, "failed to request buffer memory resource\n");
-			err = -EBUSY;
-			goto ahb_resource_failed;
+			return -EBUSY;
 		}
 
-		onenand->ahb_addr = ioremap(r->start, resource_size(r));
+		onenand->ahb_addr = devm_ioremap(&pdev->dev, r->start,
+						 resource_size(r));
 		if (!onenand->ahb_addr) {
 			dev_err(&pdev->dev, "failed to map buffer memory resource\n");
-			err = -EINVAL;
-			goto ahb_ioremap_failed;
+			return -EINVAL;
 		}
 
 		/* Allocate 4KiB BufferRAM */
-		onenand->page_buf = kzalloc(SZ_4K, GFP_KERNEL);
-		if (!onenand->page_buf) {
-			err = -ENOMEM;
-			goto page_buf_fail;
-		}
+		onenand->page_buf = devm_kzalloc(&pdev->dev, SZ_4K,
+						 GFP_KERNEL);
+		if (!onenand->page_buf)
+			return -ENOMEM;
 
 		/* Allocate 128 SpareRAM */
-		onenand->oob_buf = kzalloc(128, GFP_KERNEL);
-		if (!onenand->oob_buf) {
-			err = -ENOMEM;
-			goto oob_buf_fail;
-		}
+		onenand->oob_buf = devm_kzalloc(&pdev->dev, 128, GFP_KERNEL);
+		if (!onenand->oob_buf)
+			return -ENOMEM;
 
 		/* S3C doesn't handle subpage write */
 		mtd->subpage_sft = 0;
@@ -941,23 +935,23 @@ static int s3c_onenand_probe(struct platform_device *pdev)
 		r = platform_get_resource(pdev, IORESOURCE_MEM, 1);
 		if (!r) {
 			dev_err(&pdev->dev, "no dma memory resource defined\n");
-			err = -ENOENT;
-			goto dma_resource_failed;
+			return -ENOENT;
 		}
 
-		onenand->dma_res = request_mem_region(r->start, resource_size(r),
-						      pdev->name);
+		onenand->dma_res = devm_request_mem_region(&pdev->dev,
+							   r->start,
+							   resource_size(r),
+							   pdev->name);
 		if (!onenand->dma_res) {
 			dev_err(&pdev->dev, "failed to request dma memory resource\n");
-			err = -EBUSY;
-			goto dma_resource_failed;
+			return -EBUSY;
 		}
 
-		onenand->dma_addr = ioremap(r->start, resource_size(r));
+		onenand->dma_addr = devm_ioremap(&pdev->dev, r->start,
+						 resource_size(r));
 		if (!onenand->dma_addr) {
 			dev_err(&pdev->dev, "failed to map dma memory resource\n");
-			err = -EINVAL;
-			goto dma_ioremap_failed;
+			return -EINVAL;
 		}
 
 		onenand->phys_base = onenand->base_res->start;
@@ -968,19 +962,19 @@ static int s3c_onenand_probe(struct platform_device *pdev)
 		if (r) {
 			init_completion(&onenand->complete);
 			s5pc110_dma_ops = s5pc110_dma_irq;
-			err = request_irq(r->start, s5pc110_onenand_irq,
-					IRQF_SHARED, "onenand", &onenand);
+			err = devm_request_irq(&pdev->dev, r->start,
+					       s5pc110_onenand_irq,
+					       IRQF_SHARED, "onenand",
+					       &onenand);
 			if (err) {
 				dev_err(&pdev->dev, "failed to get irq\n");
-				goto scan_failed;
+				return err;
 			}
 		}
 	}
 
-	if (onenand_scan(mtd, 1)) {
-		err = -EFAULT;
-		goto scan_failed;
-	}
+	if (onenand_scan(mtd, 1))
+		return -EFAULT;
 
 	if (onenand->type != TYPE_S5PC110) {
 		/* S3C doesn't handle subpage write */
@@ -998,36 +992,6 @@ static int s3c_onenand_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, mtd);
 
 	return 0;
-
-scan_failed:
-	if (onenand->dma_addr)
-		iounmap(onenand->dma_addr);
-dma_ioremap_failed:
-	if (onenand->dma_res)
-		release_mem_region(onenand->dma_res->start,
-				   resource_size(onenand->dma_res));
-	kfree(onenand->oob_buf);
-oob_buf_fail:
-	kfree(onenand->page_buf);
-page_buf_fail:
-	if (onenand->ahb_addr)
-		iounmap(onenand->ahb_addr);
-ahb_ioremap_failed:
-	if (onenand->ahb_res)
-		release_mem_region(onenand->ahb_res->start,
-				   resource_size(onenand->ahb_res));
-dma_resource_failed:
-ahb_resource_failed:
-	iounmap(onenand->base);
-ioremap_failed:
-	if (onenand->base_res)
-		release_mem_region(onenand->base_res->start,
-				   resource_size(onenand->base_res));
-resource_failed:
-	kfree(onenand);
-onenand_fail:
-	kfree(mtd);
-	return err;
 }
 
 static int s3c_onenand_remove(struct platform_device *pdev)
@@ -1035,25 +999,7 @@ static int s3c_onenand_remove(struct platform_device *pdev)
 	struct mtd_info *mtd = platform_get_drvdata(pdev);
 
 	onenand_release(mtd);
-	if (onenand->ahb_addr)
-		iounmap(onenand->ahb_addr);
-	if (onenand->ahb_res)
-		release_mem_region(onenand->ahb_res->start,
-				   resource_size(onenand->ahb_res));
-	if (onenand->dma_addr)
-		iounmap(onenand->dma_addr);
-	if (onenand->dma_res)
-		release_mem_region(onenand->dma_res->start,
-				   resource_size(onenand->dma_res));
-
-	iounmap(onenand->base);
-	release_mem_region(onenand->base_res->start,
-			   resource_size(onenand->base_res));
-
-	kfree(onenand->oob_buf);
-	kfree(onenand->page_buf);
-	kfree(onenand);
-	kfree(mtd);
+
 	return 0;
 }
 
-- 
2.14.1
