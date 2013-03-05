Received: from mail-pb0-f53.google.com ([209.85.160.53])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCnfx-0008MS-38
 for linux-mtd@lists.infradead.org; Tue, 05 Mar 2013 08:56:45 +0000
Received: by mail-pb0-f53.google.com with SMTP id un1so4141448pbc.12
 for <linux-mtd@lists.infradead.org>; Tue, 05 Mar 2013 00:56:44 -0800 (PST)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 8/8] mtd: docg3: Use module_platform_driver_probe macro
Date: Tue,  5 Mar 2013 14:15:53 +0530
Message-Id: <1362473153-23515-8-git-send-email-sachin.kamat@linaro.org>
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
 drivers/mtd/devices/docg3.c |   13 +------------
 1 files changed, 1 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index 8510ccb..a0cfa89 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -2144,18 +2144,7 @@ static struct platform_driver g3_driver = {
 	.remove		= __exit_p(docg3_release),
 };
 
-static int __init docg3_init(void)
-{
-	return platform_driver_probe(&g3_driver, docg3_probe);
-}
-module_init(docg3_init);
-
-
-static void __exit docg3_exit(void)
-{
-	platform_driver_unregister(&g3_driver);
-}
-module_exit(docg3_exit);
+module_platform_driver_probe(g3_driver, docg3_probe);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Robert Jarzmik <robert.jarzmik@free.fr>");
-- 
1.7.4.1
