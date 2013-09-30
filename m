Received: from mail-pd0-f172.google.com ([209.85.192.172])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VQZyS-0005xU-Fy
 for linux-mtd@lists.infradead.org; Mon, 30 Sep 2013 09:41:06 +0000
Received: by mail-pd0-f172.google.com with SMTP id z10so5435334pdj.31
 for <linux-mtd@lists.infradead.org>; Mon, 30 Sep 2013 02:40:43 -0700 (PDT)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/3] mtd: nand: pxa3xx_nand: Remove redundant of_match_ptr
Date: Mon, 30 Sep 2013 15:10:24 +0530
Message-Id: <1380534024-25052-3-git-send-email-sachin.kamat@linaro.org>
In-Reply-To: <1380534024-25052-1-git-send-email-sachin.kamat@linaro.org>
References: <1380534024-25052-1-git-send-email-sachin.kamat@linaro.org>
Cc: sachin.kamat@linaro.org, artem.bityutskiy@linux.intel.com,
 dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The data structure of_match_ptr() protects is always compiled in.
Hence of_match_ptr() is not needed.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/mtd/nand/pxa3xx_nand.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index dd03dfd..b7c80e1 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1407,7 +1407,7 @@ static int pxa3xx_nand_resume(struct platform_device *pdev)
 static struct platform_driver pxa3xx_nand_driver = {
 	.driver = {
 		.name	= "pxa3xx-nand",
-		.of_match_table = of_match_ptr(pxa3xx_nand_dt_ids),
+		.of_match_table = pxa3xx_nand_dt_ids,
 	},
 	.probe		= pxa3xx_nand_probe,
 	.remove		= pxa3xx_nand_remove,
-- 
1.7.9.5
