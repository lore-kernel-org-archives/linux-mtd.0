Received: from mailout1.samsung.com ([203.254.224.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCjXB-0004kN-G2
 for linux-mtd@lists.infradead.org; Tue, 05 Mar 2013 04:31:26 +0000
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MJ6003WI77YCAF0@mailout1.samsung.com> for
 linux-mtd@lists.infradead.org; Tue, 05 Mar 2013 13:31:24 +0900 (KST)
Received: from DOJG1HAN02 ([12.23.120.99])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MJ600GY878CZC30@mmp1.samsung.com> for
 linux-mtd@lists.infradead.org; Tue, 05 Mar 2013 13:31:24 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'David Woodhouse' <dwmw2@infradead.org>
References: <005c01ce1959$e5833c90$b089b5b0$%han@samsung.com>
In-reply-to: <005c01ce1959$e5833c90$b089b5b0$%han@samsung.com>
Subject: [PATCH 6/7] mtd: txx9ndfmc: use module_platform_driver_probe()
Date: Tue, 05 Mar 2013 13:31:24 +0900
Message-id: <006101ce195a$4b52c630$e1f85290$%han@samsung.com>
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
 drivers/mtd/nand/txx9ndfmc.c |   13 +------------
 1 files changed, 1 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/txx9ndfmc.c b/drivers/mtd/nand/txx9ndfmc.c
index e1e8748..7ed654c 100644
--- a/drivers/mtd/nand/txx9ndfmc.c
+++ b/drivers/mtd/nand/txx9ndfmc.c
@@ -427,18 +427,7 @@ static struct platform_driver txx9ndfmc_driver = {
 	},
 };
 
-static int __init txx9ndfmc_init(void)
-{
-	return platform_driver_probe(&txx9ndfmc_driver, txx9ndfmc_probe);
-}
-
-static void __exit txx9ndfmc_exit(void)
-{
-	platform_driver_unregister(&txx9ndfmc_driver);
-}
-
-module_init(txx9ndfmc_init);
-module_exit(txx9ndfmc_exit);
+module_platform_driver_probe(txx9ndfmc_driver, txx9ndfmc_probe);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("TXx9 SoC NAND flash controller driver");
-- 
1.7.2.5
