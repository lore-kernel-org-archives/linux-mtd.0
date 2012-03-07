Received: from eu1sys200aog117.obsmtp.com ([207.126.144.143])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S5F6R-0006el-Od
 for linux-mtd@lists.infradead.org; Wed, 07 Mar 2012 11:32:21 +0000
From: Vipin Kumar <vipin.kumar@st.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 15/18] fsmc/nand: Use devm routines
Date: Wed, 7 Mar 2012 17:01:03 +0530
Message-ID: <13308836dd35bfdda2c30d0fb748d2fd1e6c8ddc.1331119143.git.vipin.kumar@st.com>
In-Reply-To: <cover.1331119143.git.vipin.kumar@st.com>
References: <cover.1331119143.git.vipin.kumar@st.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Vipin Kumar <vipin.kumar@st.com>, Artem.Bityutskiy@nokia.com,
 linus.walleij@linaro.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

fsmc_nand driver currently uses normal kzalloc, request_mem etc routines. This
patch replaces these routines with devm_kzalloc and devm_request_mem_region etc.
Consequently, the error and driver removal scenarios are curtailed.

Signed-off-by: Vipin Kumar <vipin.kumar@st.com>
Reviewed-by: Viresh Kumar <viresh.kumar@st.com>
---
 drivers/mtd/nand/fsmc_nand.c |  134 +++++++++++++----------------------------
 1 files changed, 43 insertions(+), 91 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index 7b2e66c..08aa93e 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -466,11 +466,6 @@ struct fsmc_nand_data {
 	unsigned int		bank;
 	struct clk		*clk;
 
-	struct resource		*resregs;
-	struct resource		*rescmd;
-	struct resource		*resaddr;
-	struct resource		*resdata;
-
 	struct fsmc_nand_timings *dev_timings;
 
 	void __iomem		*data_va;
@@ -876,88 +871,81 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	}
 
 	/* Allocate memory for the device structure (and zero it) */
-	host = kzalloc(sizeof(*host), GFP_KERNEL);
+	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
 	if (!host) {
 		dev_err(&pdev->dev, "failed to allocate device structure\n");
 		return -ENOMEM;
 	}
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "nand_data");
-	if (!res) {
-		ret = -EIO;
-		goto err_probe1;
-	}
+	if (!res)
+		return -EINVAL;
 
-	host->resdata = request_mem_region(res->start, resource_size(res),
-			pdev->name);
-	if (!host->resdata) {
-		ret = -EIO;
-		goto err_probe1;
+	if (!devm_request_mem_region(&pdev->dev, res->start, resource_size(res),
+				pdev->name)) {
+		dev_err(&pdev->dev, "Failed to get memory data resourse\n");
+		return -ENOENT;
 	}
 
-	host->data_va = ioremap(res->start, resource_size(res));
+	host->data_va = devm_ioremap(&pdev->dev, res->start,
+			resource_size(res));
 	if (!host->data_va) {
-		ret = -EIO;
-		goto err_probe1;
+		dev_err(&pdev->dev, "data ioremap failed\n");
+		return -ENOMEM;
 	}
 
-	host->resaddr = request_mem_region(res->start + pdata->ale_off,
-			resource_size(res), pdev->name);
-	if (!host->resaddr) {
-		ret = -EIO;
-		goto err_probe1;
+	if (!devm_request_mem_region(&pdev->dev, res->start + pdata->ale_off,
+			resource_size(res), pdev->name)) {
+		dev_err(&pdev->dev, "Failed to get memory ale resourse\n");
+		return -ENOENT;
 	}
 
-	host->addr_va = ioremap(res->start + pdata->ale_off,
+	host->addr_va = devm_ioremap(&pdev->dev, res->start + pdata->ale_off,
 			resource_size(res));
 	if (!host->addr_va) {
-		ret = -EIO;
-		goto err_probe1;
+		dev_err(&pdev->dev, "ale ioremap failed\n");
+		return -ENOMEM;
 	}
 
-	host->rescmd = request_mem_region(res->start + pdata->cle_off,
-			resource_size(res), pdev->name);
-	if (!host->rescmd) {
-		ret = -EIO;
-		goto err_probe1;
+	if (!devm_request_mem_region(&pdev->dev, res->start + pdata->cle_off,
+			resource_size(res), pdev->name)) {
+		dev_err(&pdev->dev, "Failed to get memory cle resourse\n");
+		return -ENOENT;
 	}
 
-	host->cmd_va = ioremap(res->start + pdata->cle_off, resource_size(res));
+	host->cmd_va = devm_ioremap(&pdev->dev, res->start + pdata->cle_off,
+			resource_size(res));
 	if (!host->cmd_va) {
-		ret = -EIO;
-		goto err_probe1;
+		dev_err(&pdev->dev, "ale ioremap failed\n");
+		return -ENOMEM;
 	}
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "fsmc_regs");
-	if (!res) {
-		ret = -EIO;
-		goto err_probe1;
-	}
+	if (!res)
+		return -EINVAL;
 
-	host->resregs = request_mem_region(res->start, resource_size(res),
-			pdev->name);
-	if (!host->resregs) {
-		ret = -EIO;
-		goto err_probe1;
+	if (!devm_request_mem_region(&pdev->dev, res->start, resource_size(res),
+			pdev->name)) {
+		dev_err(&pdev->dev, "Failed to get memory regs resourse\n");
+		return -ENOENT;
 	}
 
-	host->regs_va = ioremap(res->start, resource_size(res));
+	host->regs_va = devm_ioremap(&pdev->dev, res->start,
+			resource_size(res));
 	if (!host->regs_va) {
-		ret = -EIO;
-		goto err_probe1;
+		dev_err(&pdev->dev, "regs ioremap failed\n");
+		return -ENOMEM;
 	}
 
 	host->clk = clk_get(&pdev->dev, NULL);
 	if (IS_ERR(host->clk)) {
 		dev_err(&pdev->dev, "failed to fetch block clock\n");
-		ret = PTR_ERR(host->clk);
-		host->clk = NULL;
-		goto err_probe1;
+		return PTR_ERR(host->clk);
 	}
 
 	ret = clk_enable(host->clk);
 	if (ret)
-		goto err_probe1;
+		goto err_clk_enable;
 
 	/*
 	 * This device ID is actually a common AMBA ID as used on the
@@ -1018,7 +1006,7 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	if (nand_scan_ident(&host->mtd, 1, NULL)) {
 		ret = -ENXIO;
 		dev_err(&pdev->dev, "No NAND Device found!\n");
-		goto err_probe;
+		goto err_scan_ident;
 	}
 
 	if (AMBA_REV_BITS(host->pid) >= 8) {
@@ -1126,32 +1114,10 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	return 0;
 
 err_probe:
+err_scan_ident:
 	clk_disable(host->clk);
-err_probe1:
-	if (host->clk)
-		clk_put(host->clk);
-	if (host->regs_va)
-		iounmap(host->regs_va);
-	if (host->resregs)
-		release_mem_region(host->resregs->start,
-				resource_size(host->resregs));
-	if (host->cmd_va)
-		iounmap(host->cmd_va);
-	if (host->rescmd)
-		release_mem_region(host->rescmd->start,
-				resource_size(host->rescmd));
-	if (host->addr_va)
-		iounmap(host->addr_va);
-	if (host->resaddr)
-		release_mem_region(host->resaddr->start,
-				resource_size(host->resaddr));
-	if (host->data_va)
-		iounmap(host->data_va);
-	if (host->resdata)
-		release_mem_region(host->resdata->start,
-				resource_size(host->resdata));
-
-	kfree(host);
+err_clk_enable:
+	clk_put(host->clk);
 	return ret;
 }
 
@@ -1168,22 +1134,8 @@ static int fsmc_nand_remove(struct platform_device *pdev)
 		nand_release(&host->mtd);
 		clk_disable(host->clk);
 		clk_put(host->clk);
-
-		iounmap(host->regs_va);
-		release_mem_region(host->resregs->start,
-				resource_size(host->resregs));
-		iounmap(host->cmd_va);
-		release_mem_region(host->rescmd->start,
-				resource_size(host->rescmd));
-		iounmap(host->addr_va);
-		release_mem_region(host->resaddr->start,
-				resource_size(host->resaddr));
-		iounmap(host->data_va);
-		release_mem_region(host->resdata->start,
-				resource_size(host->resdata));
-
-		kfree(host);
 	}
+
 	return 0;
 }
 
-- 
1.7.0.4
