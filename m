Received: from mail-qw0-f49.google.com ([209.85.216.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RW7FK-000498-Px
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2011 14:04:19 +0000
Received: by qabj40 with SMTP id j40so1357670qab.15
 for <linux-mtd@lists.infradead.org>; Thu, 01 Dec 2011 06:04:17 -0800 (PST)
Message-ID: <1322748247.31743.1.camel@phoenix>
Subject: [PATCH] MTD: nand: Convert au1550nd to use module_platform_driver()
From: Axel Lin <axel.lin@gmail.com>
To: linux-mips@linux-mips.org
Date: Thu, 01 Dec 2011 22:04:07 +0800
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Cc: Manuel Lauss <manuel.lauss@googlemail.com>, linux-mtd@lists.infradead.org,
 Ralf Baechle <ralf@linux-mips.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Cc: Manuel Lauss <manuel.lauss@googlemail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Signed-off-by: Axel Lin <axel.lin@gmail.com>
---
Hi Ralf,
This patch converts au1550nd to use module_platform_driver().
You have committed a5bd32fd "MTD: nand: make au1550nd.c a platform_driver".
Currently this patch can only apply to either your tree or linux-next.
Could you help to take it.
( committed a5bd32fd does not exist in l2-mtd-2.6.git,
so Artem cannot apply it.)

Thanks,
Axel

 drivers/mtd/nand/au1550nd.c |   12 +-----------
 1 files changed, 1 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/au1550nd.c b/drivers/mtd/nand/au1550nd.c
index 77fb4e6..73abbc3 100644
--- a/drivers/mtd/nand/au1550nd.c
+++ b/drivers/mtd/nand/au1550nd.c
@@ -560,17 +560,7 @@ static struct platform_driver au1550nd_driver = {
 	.remove		= __devexit_p(au1550nd_remove),
 };
 
-static int __init au1550nd_load(void)
-{
-	return platform_driver_register(&au1550nd_driver);
-};
-
-static void __exit au1550nd_exit(void)
-{
-	platform_driver_unregister(&au1550nd_driver);
-};
-module_init(au1550nd_load);
-module_exit(au1550nd_exit);
+module_platform_driver(au1550nd_driver);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Embedded Edge, LLC");
-- 
1.7.5.4
