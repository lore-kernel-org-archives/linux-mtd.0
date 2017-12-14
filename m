Received: from smtp06.smtpout.orange.fr ([80.12.242.128]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ePMj1-0002BK-3W
 for linux-mtd@lists.infradead.org; Thu, 14 Dec 2017 06:11:00 +0000
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: kyungmin.park@samsung.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, boris.brezillon@free-electrons.com,
 marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 1/4 v3] mtd: onenand: samsung: use devm_ function to simplify
 code and fix some leaks
Date: Thu, 14 Dec 2017 07:03:49 +0100
Message-Id: <f223e9ea768198b70e37102fc369007d1482e802.1513230484.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <cover.1513230484.git.christophe.jaillet@wanadoo.fr>
References: <cover.1513230484.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <cover.1513230484.git.christophe.jaillet@wanadoo.fr>
References: <cover.1513230484.git.christophe.jaillet@wanadoo.fr>
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
resource-managed.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Cross-compiled tested-only

v2: use devm_ioremap_resource()
v3: fix a bug introduced in v2
---
 drivers/mtd/onenand/samsung.c | 164 ++++++++----------------------------------
 1 file changed, 29 insertions(+), 135 deletions(-)

diff --git a/drivers/mtd/onenand/samsung.c b/drivers/mtd/onenand/samsung.c
index af0ac1a7bf8f..b650290611d2 100644
--- a/drivers/mtd/onenand/samsung.c
+++ b/drivers/mtd/onenand/samsung.c
@@ -129,16 +129,13 @@ struct s3c_onenand {
 	struct platform_device	*pdev;
 	enum soc_type	type;
 	void __iomem	*base;
-	struct resource *base_res;
 	void __iomem	*ahb_addr;
-	struct resource *ahb_res;
 	int		bootram_command;
 	void __iomem	*page_buf;
 	void __iomem	*oob_buf;
 	unsigned int	(*mem_addr)(int fba, int fpa, int fsa);
 	unsigned int	(*cmd_map)(unsigned int type, unsigned int val);
 	void __iomem	*dma_addr;
-	struct resource *dma_res;
 	unsigned long	phys_base;
 	struct completion	complete;
 };
@@ -851,15 +848,13 @@ static int s3c_onenand_probe(struct platform_device *pdev)
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
+	onenand = devm_kzalloc(&pdev->dev, sizeof(struct s3c_onenand), GFP_KERNEL);
+	if (!onenand)
+		return -ENOMEM;
 
 	this = (struct onenand_chip *) &mtd[1];
 	mtd->priv = this;
@@ -870,26 +865,12 @@ static int s3c_onenand_probe(struct platform_device *pdev)
 	s3c_onenand_setup(mtd);
 
 	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!r) {
-		dev_err(&pdev->dev, "no memory resource defined\n");
-		return -ENOENT;
-		goto ahb_resource_failed;
-	}
+	onenand->base = devm_ioremap_resource(&pdev->dev, r);
+	if (IS_ERR(onenand->base))
+		return PTR_ERR(onenand->base);
 
-	onenand->base_res = request_mem_region(r->start, resource_size(r),
-					       pdev->name);
-	if (!onenand->base_res) {
-		dev_err(&pdev->dev, "failed to request memory resource\n");
-		err = -EBUSY;
-		goto resource_failed;
-	}
+	onenand->phys_base = r->start;
 
-	onenand->base = ioremap(r->start, resource_size(r));
-	if (!onenand->base) {
-		dev_err(&pdev->dev, "failed to map memory resource\n");
-		err = -EFAULT;
-		goto ioremap_failed;
-	}
 	/* Set onenand_chip also */
 	this->base = onenand->base;
 
@@ -898,40 +879,20 @@ static int s3c_onenand_probe(struct platform_device *pdev)
 
 	if (onenand->type != TYPE_S5PC110) {
 		r = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-		if (!r) {
-			dev_err(&pdev->dev, "no buffer memory resource defined\n");
-			err = -ENOENT;
-			goto ahb_resource_failed;
-		}
-
-		onenand->ahb_res = request_mem_region(r->start, resource_size(r),
-						      pdev->name);
-		if (!onenand->ahb_res) {
-			dev_err(&pdev->dev, "failed to request buffer memory resource\n");
-			err = -EBUSY;
-			goto ahb_resource_failed;
-		}
-
-		onenand->ahb_addr = ioremap(r->start, resource_size(r));
-		if (!onenand->ahb_addr) {
-			dev_err(&pdev->dev, "failed to map buffer memory resource\n");
-			err = -EINVAL;
-			goto ahb_ioremap_failed;
-		}
+		onenand->ahb_addr = devm_ioremap_resource(&pdev->dev, r);
+		if (IS_ERR(onenand->ahb_addr))
+			return PTR_ERR(onenand->ahb_addr);
 
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
@@ -939,28 +900,9 @@ static int s3c_onenand_probe(struct platform_device *pdev)
 
 	} else { /* S5PC110 */
 		r = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-		if (!r) {
-			dev_err(&pdev->dev, "no dma memory resource defined\n");
-			err = -ENOENT;
-			goto dma_resource_failed;
-		}
-
-		onenand->dma_res = request_mem_region(r->start, resource_size(r),
-						      pdev->name);
-		if (!onenand->dma_res) {
-			dev_err(&pdev->dev, "failed to request dma memory resource\n");
-			err = -EBUSY;
-			goto dma_resource_failed;
-		}
-
-		onenand->dma_addr = ioremap(r->start, resource_size(r));
-		if (!onenand->dma_addr) {
-			dev_err(&pdev->dev, "failed to map dma memory resource\n");
-			err = -EINVAL;
-			goto dma_ioremap_failed;
-		}
-
-		onenand->phys_base = onenand->base_res->start;
+		onenand->dma_addr = devm_ioremap_resource(&pdev->dev, r);
+		if (IS_ERR(onenand->dma_addr))
+			return PTR_ERR(onenand->dma_addr);
 
 		s5pc110_dma_ops = s5pc110_dma_poll;
 		/* Interrupt support */
@@ -968,19 +910,19 @@ static int s3c_onenand_probe(struct platform_device *pdev)
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
@@ -998,36 +940,6 @@ static int s3c_onenand_probe(struct platform_device *pdev)
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
@@ -1035,25 +947,7 @@ static int s3c_onenand_remove(struct platform_device *pdev)
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
