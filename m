Received: from mailout1.samsung.com ([203.254.224.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCjVu-0004LS-VB
 for linux-mtd@lists.infradead.org; Tue, 05 Mar 2013 04:30:08 +0000
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MJ6004ST75KADF0@mailout1.samsung.com> for
 linux-mtd@lists.infradead.org; Tue, 05 Mar 2013 13:30:04 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'David Woodhouse' <dwmw2@infradead.org>
References: <005c01ce1959$e5833c90$b089b5b0$%han@samsung.com>
In-reply-to: <005c01ce1959$e5833c90$b089b5b0$%han@samsung.com>
Subject: [PATCH 3/7] mtd: atmel_nand: use module_platform_driver_probe()
Date: Tue, 05 Mar 2013 13:30:04 +0900
Message-id: <005e01ce195a$1bdd6bd0$53984370$%han@samsung.com>
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
 drivers/mtd/nand/atmel_nand.c |   15 +--------------
 1 files changed, 1 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index ffcbcca..2d23d29 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -1737,20 +1737,7 @@ static struct platform_driver atmel_nand_driver = {
 	},
 };
 
-static int __init atmel_nand_init(void)
-{
-	return platform_driver_probe(&atmel_nand_driver, atmel_nand_probe);
-}
-
-
-static void __exit atmel_nand_exit(void)
-{
-	platform_driver_unregister(&atmel_nand_driver);
-}
-
-
-module_init(atmel_nand_init);
-module_exit(atmel_nand_exit);
+module_platform_driver_probe(atmel_nand_driver, atmel_nand_probe);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Rick Bronson");
-- 
1.7.2.5
