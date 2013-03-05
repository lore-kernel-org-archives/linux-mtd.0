Received: from mailout4.samsung.com ([203.254.224.34])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCjUT-0004Cj-EV
 for linux-mtd@lists.infradead.org; Tue, 05 Mar 2013 04:28:39 +0000
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MJ600MCW72C7ML0@mailout4.samsung.com> for
 linux-mtd@lists.infradead.org; Tue, 05 Mar 2013 13:28:33 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'David Woodhouse' <dwmw2@infradead.org>
Subject: [PATCH 1/7] mtd: docg3: use module_platform_driver_probe()
Date: Tue, 05 Mar 2013 13:28:33 +0900
Message-id: <005c01ce1959$e5833c90$b089b5b0$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7bit
Content-language: ko
Cc: 'Jingoo Han' <jg1.han@samsung.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch uses module_platform_driver_probe() macro which makes
the code smaller and simpler.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/mtd/devices/docg3.c |   13 +------------
 drivers/mtd/nand/docg4.c    |   13 +------------
 2 files changed, 2 insertions(+), 24 deletions(-)

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
1.7.2.5
