Received: from mail-pa0-f54.google.com ([209.85.220.54])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VQZyO-0005xP-NH
 for linux-mtd@lists.infradead.org; Mon, 30 Sep 2013 09:41:01 +0000
Received: by mail-pa0-f54.google.com with SMTP id kx10so5689954pab.27
 for <linux-mtd@lists.infradead.org>; Mon, 30 Sep 2013 02:40:37 -0700 (PDT)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/3] mtd: nand: lpc32xx_mlc: Remove redundant of_match_ptr
Date: Mon, 30 Sep 2013 15:10:22 +0530
Message-Id: <1380534024-25052-1-git-send-email-sachin.kamat@linaro.org>
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
 drivers/mtd/nand/lpc32xx_mlc.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/lpc32xx_mlc.c b/drivers/mtd/nand/lpc32xx_mlc.c
index f4dd2a8..327d96c 100644
--- a/drivers/mtd/nand/lpc32xx_mlc.c
+++ b/drivers/mtd/nand/lpc32xx_mlc.c
@@ -905,7 +905,7 @@ static struct platform_driver lpc32xx_nand_driver = {
 	.driver		= {
 		.name	= DRV_NAME,
 		.owner	= THIS_MODULE,
-		.of_match_table = of_match_ptr(lpc32xx_nand_match),
+		.of_match_table = lpc32xx_nand_match,
 	},
 };
 
-- 
1.7.9.5
