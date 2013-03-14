Received: from mail-pb0-f46.google.com ([209.85.160.46])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UG5EW-0003Gh-J9
 for linux-mtd@lists.infradead.org; Thu, 14 Mar 2013 10:18:05 +0000
Received: by mail-pb0-f46.google.com with SMTP id uo15so1981664pbc.5
 for <linux-mtd@lists.infradead.org>; Thu, 14 Mar 2013 03:17:58 -0700 (PDT)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/5] mtd: davinci_nand: Use of_match_ptr()
Date: Thu, 14 Mar 2013 15:37:01 +0530
Message-Id: <1363255624-20885-2-git-send-email-sachin.kamat@linaro.org>
In-Reply-To: <1363255624-20885-1-git-send-email-sachin.kamat@linaro.org>
References: <1363255624-20885-1-git-send-email-sachin.kamat@linaro.org>
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

This eliminates having an #ifdef returning NULL for the case
when OF is disabled.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/mtd/nand/davinci_nand.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index 864717b..c3e15a5 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -34,6 +34,7 @@
 #include <linux/mtd/partitions.h>
 #include <linux/slab.h>
 #include <linux/of_device.h>
+#include <linux/of.h>
 
 #include <linux/platform_data/mtd-davinci.h>
 #include <linux/platform_data/mtd-davinci-aemif.h>
@@ -577,7 +578,6 @@ static struct davinci_nand_pdata
 	return pdev->dev.platform_data;
 }
 #else
-#define davinci_nand_of_match NULL
 static struct davinci_nand_pdata
 	*nand_davinci_get_pdata(struct platform_device *pdev)
 {
@@ -878,7 +878,7 @@ static struct platform_driver nand_davinci_driver = {
 	.driver		= {
 		.name	= "davinci_nand",
 		.owner	= THIS_MODULE,
-		.of_match_table = davinci_nand_of_match,
+		.of_match_table = of_match_ptr(davinci_nand_of_match),
 	},
 };
 MODULE_ALIAS("platform:davinci_nand");
-- 
1.7.4.1
