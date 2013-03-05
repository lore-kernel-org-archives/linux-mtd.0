Received: from mailout2.samsung.com ([203.254.224.25])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCjXY-0004t2-Ae
 for linux-mtd@lists.infradead.org; Tue, 05 Mar 2013 04:31:49 +0000
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MJ6004VB78V4VK0@mailout2.samsung.com> for
 linux-mtd@lists.infradead.org; Tue, 05 Mar 2013 13:31:47 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'David Woodhouse' <dwmw2@infradead.org>
References: <005c01ce1959$e5833c90$b089b5b0$%han@samsung.com>
In-reply-to: <005c01ce1959$e5833c90$b089b5b0$%han@samsung.com>
Subject: [PATCH 7/7] mtd: davinci_nand: use module_platform_driver_probe()
Date: Tue, 05 Mar 2013 13:31:47 +0900
Message-id: <006201ce195a$59064fe0$0b12efa0$%han@samsung.com>
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
 drivers/mtd/nand/davinci_nand.c |   12 +-----------
 1 files changed, 1 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index 94e17af..864717b 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -883,17 +883,7 @@ static struct platform_driver nand_davinci_driver = {
 };
 MODULE_ALIAS("platform:davinci_nand");
 
-static int __init nand_davinci_init(void)
-{
-	return platform_driver_probe(&nand_davinci_driver, nand_davinci_probe);
-}
-module_init(nand_davinci_init);
-
-static void __exit nand_davinci_exit(void)
-{
-	platform_driver_unregister(&nand_davinci_driver);
-}
-module_exit(nand_davinci_exit);
+module_platform_driver_probe(nand_davinci_driver, nand_davinci_probe);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Texas Instruments");
-- 
1.7.2.5
