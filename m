Received: from cathcart.site5.com ([74.54.107.137])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LZOXT-0005OE-2o
	for linux-mtd@lists.infradead.org; Tue, 17 Feb 2009 11:55:01 +0000
From: Mike Rapoport <mike@compulab.co.il>
To: dwmw2@infradead.org
Subject: [PATCH] MTD: NAND: pxa3xx_nand: use resource_size instead of 'r->end
	- r->start + 1'
Date: Tue, 17 Feb 2009 13:54:45 +0200
Message-Id: <f76eba282e26517c4030b4e539681ca3094092ef.1234871317.git.mike@compulab.co.il>
In-Reply-To: <cover.1234871317.git.mike@compulab.co.il>
References: <cover.1234871317.git.mike@compulab.co.il>
Cc: eric.miao@marvell.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Signed-off-by: Mike Rapoport <mike@compulab.co.il>
---
 drivers/mtd/nand/pxa3xx_nand.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index cc55cbc..ffa960b 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1118,14 +1118,14 @@ static int pxa3xx_nand_probe(struct platform_device *pdev)
 		goto fail_put_clk;
 	}
 
-	r = request_mem_region(r->start, r->end - r->start + 1, pdev->name);
+	r = request_mem_region(r->start, resource_size(r), pdev->name);
 	if (r == NULL) {
 		dev_err(&pdev->dev, "failed to request memory resource\n");
 		ret = -EBUSY;
 		goto fail_put_clk;
 	}
 
-	info->mmio_base = ioremap(r->start, r->end - r->start + 1);
+	info->mmio_base = ioremap(r->start, resource_size(r));
 	if (info->mmio_base == NULL) {
 		dev_err(&pdev->dev, "ioremap() failed\n");
 		ret = -ENODEV;
@@ -1174,7 +1174,7 @@ fail_free_buf:
 fail_free_io:
 	iounmap(info->mmio_base);
 fail_free_res:
-	release_mem_region(r->start, r->end - r->start + 1);
+	release_mem_region(r->start, resource_size(r));
 fail_put_clk:
 	clk_disable(info->clk);
 	clk_put(info->clk);
-- 
1.5.6.4
