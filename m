Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T3kG1-0008L9-Bf
 for linux-mtd@lists.infradead.org; Tue, 21 Aug 2012 08:56:18 +0000
Received: by pbbrq8 with SMTP id rq8so8744594pbb.36
 for <linux-mtd@lists.infradead.org>; Tue, 21 Aug 2012 01:56:14 -0700 (PDT)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mtd: s3c2410: Use devm_* functions
Date: Tue, 21 Aug 2012 14:24:09 +0530
Message-Id: <1345539250-4509-1-git-send-email-sachin.kamat@linaro.org>
Cc: sachin.kamat@linaro.org, patches@linaro.org, dwmw2@infradead.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

devm_* functions are device managed functions and make cleanup code
simpler and smaller.
devm_kzalloc, devm_clk_get and devm_request_and_ioremap functions
are used.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
Compile tested using s3c6400_defconfig and s3c2410_defconfig on the
latest linux-next tree.
---
 drivers/mtd/nand/s3c2410.c |   47 +++++++++----------------------------------
 1 files changed, 10 insertions(+), 37 deletions(-)

diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index e71f7a9..b8a556e 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -97,9 +97,8 @@ enum s3c_nand_clk_state {
  * @mtds: An array of MTD instances on this controoler.
  * @platform: The platform data for this board.
  * @device: The platform device we bound to.
- * @area: The IO area resource that came from request_mem_region().
  * @clk: The clock resource for this controller.
- * @regs: The area mapped for the hardware registers described by @area.
+ * @regs: The area mapped for the hardware registers.
  * @sel_reg: Pointer to the register controlling the NAND selection.
  * @sel_bit: The bit in @sel_reg to select the NAND chip.
  * @mtd_count: The number of MTDs created from this controller.
@@ -116,7 +115,6 @@ struct s3c2410_nand_info {
 
 	/* device info */
 	struct device			*device;
-	struct resource			*area;
 	struct clk			*clk;
 	void __iomem			*regs;
 	void __iomem			*sel_reg;
@@ -720,29 +718,12 @@ static int s3c24xx_nand_remove(struct platform_device *pdev)
 			pr_debug("releasing mtd %d (%p)\n", mtdno, ptr);
 			nand_release(&ptr->mtd);
 		}
-
-		kfree(info->mtds);
 	}
 
 	/* free the common resources */
 
-	if (!IS_ERR(info->clk)) {
+	if (!IS_ERR(info->clk))
 		s3c2410_nand_clk_set_state(info, CLOCK_DISABLE);
-		clk_put(info->clk);
-	}
-
-	if (info->regs != NULL) {
-		iounmap(info->regs);
-		info->regs = NULL;
-	}
-
-	if (info->area != NULL) {
-		release_resource(info->area);
-		kfree(info->area);
-		info->area = NULL;
-	}
-
-	kfree(info);
 
 	return 0;
 }
@@ -937,7 +918,7 @@ static int s3c24xx_nand_probe(struct platform_device *pdev)
 
 	pr_debug("s3c2410_nand_probe(%p)\n", pdev);
 
-	info = kzalloc(sizeof(*info), GFP_KERNEL);
+	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
 	if (info == NULL) {
 		dev_err(&pdev->dev, "no memory for flash info\n");
 		err = -ENOMEM;
@@ -951,7 +932,7 @@ static int s3c24xx_nand_probe(struct platform_device *pdev)
 
 	/* get the clock source and enable it */
 
-	info->clk = clk_get(&pdev->dev, "nand");
+	info->clk = devm_clk_get(&pdev->dev, "nand");
 	if (IS_ERR(info->clk)) {
 		dev_err(&pdev->dev, "failed to get clock\n");
 		err = -ENOENT;
@@ -963,22 +944,14 @@ static int s3c24xx_nand_probe(struct platform_device *pdev)
 	/* allocate and map the resource */
 
 	/* currently we assume we have the one resource */
-	res  = pdev->resource;
+	res = pdev->resource;
 	size = resource_size(res);
 
-	info->area = request_mem_region(res->start, size, pdev->name);
-
-	if (info->area == NULL) {
-		dev_err(&pdev->dev, "cannot reserve register region\n");
-		err = -ENOENT;
-		goto exit_error;
-	}
-
-	info->device     = &pdev->dev;
-	info->platform   = plat;
-	info->regs       = ioremap(res->start, size);
-	info->cpu_type   = cpu_type;
+	info->device	= &pdev->dev;
+	info->platform	= plat;
+	info->cpu_type	= cpu_type;
 
+	info->regs	= devm_request_and_ioremap(&pdev->dev, res);
 	if (info->regs == NULL) {
 		dev_err(&pdev->dev, "cannot reserve register region\n");
 		err = -EIO;
@@ -1001,7 +974,7 @@ static int s3c24xx_nand_probe(struct platform_device *pdev)
 	/* allocate our information */
 
 	size = nr_sets * sizeof(*info->mtds);
-	info->mtds = kzalloc(size, GFP_KERNEL);
+	info->mtds = devm_kzalloc(&pdev->dev, size, GFP_KERNEL);
 	if (info->mtds == NULL) {
 		dev_err(&pdev->dev, "failed to allocate mtd storage\n");
 		err = -ENOMEM;
-- 
1.7.4.1
