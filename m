Received: from mailout2.samsung.com ([203.254.224.25])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCjVH-0004F5-Er
 for linux-mtd@lists.infradead.org; Tue, 05 Mar 2013 04:29:28 +0000
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MJ6003NF751UUI0@mailout2.samsung.com> for
 linux-mtd@lists.infradead.org; Tue, 05 Mar 2013 13:29:25 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'David Woodhouse' <dwmw2@infradead.org>
References: <005c01ce1959$e5833c90$b089b5b0$%han@samsung.com>
In-reply-to: <005c01ce1959$e5833c90$b089b5b0$%han@samsung.com>
Subject: [PATCH 2/7] mtd: orion_nand: use module_platform_driver_probe()
Date: Tue, 05 Mar 2013 13:29:20 +0900
Message-id: <005d01ce195a$017b4550$0471cff0$%han@samsung.com>
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
 drivers/mtd/nand/orion_nand.c |   13 +------------
 1 files changed, 1 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
index cd72b92..8fbd002 100644
--- a/drivers/mtd/nand/orion_nand.c
+++ b/drivers/mtd/nand/orion_nand.c
@@ -231,18 +231,7 @@ static struct platform_driver orion_nand_driver = {
 	},
 };
 
-static int __init orion_nand_init(void)
-{
-	return platform_driver_probe(&orion_nand_driver, orion_nand_probe);
-}
-
-static void __exit orion_nand_exit(void)
-{
-	platform_driver_unregister(&orion_nand_driver);
-}
-
-module_init(orion_nand_init);
-module_exit(orion_nand_exit);
+module_platform_driver_probe(orion_nand_driver, orion_nand_probe);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Tzachi Perelstein");
-- 
1.7.2.5
