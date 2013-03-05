Received: from mail-pb0-f51.google.com ([209.85.160.51])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCnff-0008Fk-9O
 for linux-mtd@lists.infradead.org; Tue, 05 Mar 2013 08:56:28 +0000
Received: by mail-pb0-f51.google.com with SMTP id un15so4133497pbc.38
 for <linux-mtd@lists.infradead.org>; Tue, 05 Mar 2013 00:56:25 -0800 (PST)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/8] mtd: sh_flctl: Use module_platform_driver_probe macro
Date: Tue,  5 Mar 2013 14:15:47 +0530
Message-Id: <1362473153-23515-2-git-send-email-sachin.kamat@linaro.org>
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
 drivers/mtd/nand/sh_flctl.c |   13 +------------
 1 files changed, 1 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
index 57b3971..5899738 100644
--- a/drivers/mtd/nand/sh_flctl.c
+++ b/drivers/mtd/nand/sh_flctl.c
@@ -1223,18 +1223,7 @@ static struct platform_driver flctl_driver = {
 	},
 };
 
-static int __init flctl_nand_init(void)
-{
-	return platform_driver_probe(&flctl_driver, flctl_probe);
-}
-
-static void __exit flctl_nand_cleanup(void)
-{
-	platform_driver_unregister(&flctl_driver);
-}
-
-module_init(flctl_nand_init);
-module_exit(flctl_nand_cleanup);
+module_platform_driver_probe(flctl_driver, flctl_probe);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Yoshihiro Shimoda");
-- 
1.7.4.1
