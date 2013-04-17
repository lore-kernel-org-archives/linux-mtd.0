Received: from mail.free-electrons.com ([94.23.35.102])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1USVNS-0000yW-NE
 for linux-mtd@lists.infradead.org; Wed, 17 Apr 2013 16:38:35 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 5/7] mtd: nand: pxa3xx: Use clk_prepare_enable and
 clk_disable_unprepare
Date: Wed, 17 Apr 2013 13:38:12 -0300
Message-Id: <1366216694-2365-6-git-send-email-ezequiel.garcia@free-electrons.com>
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

This patch converts the module to use clk_prepare_enable and
clk_disable_unprepare variants as required by common clock framework.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index b8af7b4..c047943 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1072,7 +1072,7 @@ static int alloc_nand_resource(struct platform_device *pdev)
 		dev_err(&pdev->dev, "failed to get nand clock\n");
 		return PTR_ERR(info->clk);
 	}
-	clk_enable(info->clk);
+	clk_prepare_enable(info->clk);
 
 	/*
 	 * This is a dirty hack to make this driver work from devicetree
@@ -1142,7 +1142,7 @@ fail_free_buf:
 	} else
 		kfree(info->data_buff);
 fail_disable_clk:
-	clk_disable(info->clk);
+	clk_disable_unprepare(info->clk);
 	return ret;
 }
 
@@ -1168,7 +1168,7 @@ static int pxa3xx_nand_remove(struct platform_device *pdev)
 	} else
 		kfree(info->data_buff);
 
-	clk_disable(info->clk);
+	clk_disable_unprepare(info->clk);
 
 	for (cs = 0; cs < pdata->num_cs; cs++)
 		nand_release(info->host[cs]->mtd);
-- 
1.8.1.5
