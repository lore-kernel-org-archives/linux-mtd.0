Received: from mail.free-electrons.com ([94.23.35.102])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1USVNI-0000wo-RV
 for linux-mtd@lists.infradead.org; Wed, 17 Apr 2013 16:38:25 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/7] mtd: nand: pxa3xx: Use devm_kzalloc
Date: Wed, 17 Apr 2013 13:38:09 -0300
Message-Id: <1366216694-2365-3-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1366216694-2365-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1366216694-2365-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Lei Wen <leiwen@marvell.com>,
 Eric Miao <eric.miao@linaro.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Zhangfei Gao <zhangfei.gao@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Replace regular kzalloc with managed devm_kzalloc
which simplifies the error path.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 37ee75c..2f698e7 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1035,12 +1035,10 @@ static int alloc_nand_resource(struct platform_device *pdev)
 	int ret, irq, cs;
 
 	pdata = pdev->dev.platform_data;
-	info = kzalloc(sizeof(*info) + (sizeof(*mtd) +
-		       sizeof(*host)) * pdata->num_cs, GFP_KERNEL);
-	if (!info) {
-		dev_err(&pdev->dev, "failed to allocate memory\n");
+	info = devm_kzalloc(&pdev->dev, sizeof(*info) + (sizeof(*mtd) +
+			    sizeof(*host)) * pdata->num_cs, GFP_KERNEL);
+	if (!info)
 		return -ENOMEM;
-	}
 
 	info->pdev = pdev;
 	for (cs = 0; cs < pdata->num_cs; cs++) {
@@ -1072,8 +1070,7 @@ static int alloc_nand_resource(struct platform_device *pdev)
 	info->clk = clk_get(&pdev->dev, NULL);
 	if (IS_ERR(info->clk)) {
 		dev_err(&pdev->dev, "failed to get nand clock\n");
-		ret = PTR_ERR(info->clk);
-		goto fail_free_mtd;
+		return PTR_ERR(info->clk);
 	}
 	clk_enable(info->clk);
 
@@ -1165,8 +1162,6 @@ fail_free_res:
 fail_put_clk:
 	clk_disable(info->clk);
 	clk_put(info->clk);
-fail_free_mtd:
-	kfree(info);
 	return ret;
 }
 
@@ -1202,7 +1197,6 @@ static int pxa3xx_nand_remove(struct platform_device *pdev)
 
 	for (cs = 0; cs < pdata->num_cs; cs++)
 		nand_release(info->host[cs]->mtd);
-	kfree(info);
 	return 0;
 }
 
-- 
1.8.1.5
