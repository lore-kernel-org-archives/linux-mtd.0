Received: from mail-pb0-f51.google.com ([209.85.160.51])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VQZyP-0005xR-Ic
 for linux-mtd@lists.infradead.org; Mon, 30 Sep 2013 09:41:03 +0000
Received: by mail-pb0-f51.google.com with SMTP id jt11so5329532pbb.38
 for <linux-mtd@lists.infradead.org>; Mon, 30 Sep 2013 02:40:40 -0700 (PDT)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/3] mtd: nand: lpc32xx_slc: Remove redundant of_match_ptr
Date: Mon, 30 Sep 2013 15:10:23 +0530
Message-Id: <1380534024-25052-2-git-send-email-sachin.kamat@linaro.org>
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
 drivers/mtd/nand/lpc32xx_slc.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/lpc32xx_slc.c b/drivers/mtd/nand/lpc32xx_slc.c
index 6d5f8c5..23e6974 100644
--- a/drivers/mtd/nand/lpc32xx_slc.c
+++ b/drivers/mtd/nand/lpc32xx_slc.c
@@ -1015,7 +1015,7 @@ static struct platform_driver lpc32xx_nand_driver = {
 	.driver		= {
 		.name	= LPC32XX_MODNAME,
 		.owner	= THIS_MODULE,
-		.of_match_table = of_match_ptr(lpc32xx_nand_match),
+		.of_match_table = lpc32xx_nand_match,
 	},
 };
 
-- 
1.7.9.5
