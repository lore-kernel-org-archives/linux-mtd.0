Received: from mail.free-electrons.com ([94.23.35.102])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1USVNW-0000zF-NE
 for linux-mtd@lists.infradead.org; Wed, 17 Apr 2013 16:38:39 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 6/7] mtd: nand: pxa3xx: Check for clk_prepare_enable() return
 value
Date: Wed, 17 Apr 2013 13:38:13 -0300
Message-Id: <1366216694-2365-7-git-send-email-ezequiel.garcia@free-electrons.com>
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

clk_prepare_enable() can fail due to unknown reason.
Add a check for this and return the error code if it fails.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index c047943..c1b8ec6 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1072,7 +1072,9 @@ static int alloc_nand_resource(struct platform_device *pdev)
 		dev_err(&pdev->dev, "failed to get nand clock\n");
 		return PTR_ERR(info->clk);
 	}
-	clk_prepare_enable(info->clk);
+	ret = clk_prepare_enable(info->clk);
+	if (ret < 0)
+		return ret;
 
 	/*
 	 * This is a dirty hack to make this driver work from devicetree
-- 
1.8.1.5
