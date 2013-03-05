Received: from mail-pb0-f52.google.com ([209.85.160.52])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCnfo-0008Ik-Hq
 for linux-mtd@lists.infradead.org; Tue, 05 Mar 2013 08:56:37 +0000
Received: by mail-pb0-f52.google.com with SMTP id ma3so4146161pbc.11
 for <linux-mtd@lists.infradead.org>; Tue, 05 Mar 2013 00:56:34 -0800 (PST)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 5/8] mtd: docg4: Use module_platform_driver_probe macro
Date: Tue,  5 Mar 2013 14:15:50 +0530
Message-Id: <1362473153-23515-5-git-send-email-sachin.kamat@linaro.org>
In-Reply-To: <1362473153-23515-1-git-send-email-sachin.kamat@linaro.org>
References: <1362473153-23515-1-git-send-email-sachin.kamat@linaro.org>
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

module_platform_driver_probe() eliminates the boilerplate and simplifies
the code.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/mtd/nand/docg4.c |   13 +------------
 1 files changed, 1 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/docg4.c b/drivers/mtd/nand/docg4.c
index 18fa448..fa25e7a 100644
--- a/drivers/mtd/nand/docg4.c
+++ b/drivers/mtd/nand/docg4.c
@@ -1397,18 +1397,7 @@ static struct platform_driver docg4_driver = {
 	.remove		= __exit_p(cleanup_docg4),
 };
 
-static int __init docg4_init(void)
-{
-	return platform_driver_probe(&docg4_driver, probe_docg4);
-}
-
-static void __exit docg4_exit(void)
-{
-	platform_driver_unregister(&docg4_driver);
-}
-
-module_init(docg4_init);
-module_exit(docg4_exit);
+module_platform_driver_probe(docg4_driver, probe_docg4);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mike Dunn");
-- 
1.7.4.1
