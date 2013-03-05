Received: from mailout2.samsung.com ([203.254.224.25])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCjWV-0004ZS-6o
 for linux-mtd@lists.infradead.org; Tue, 05 Mar 2013 04:30:43 +0000
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MJ600EE4770E2J0@mailout2.samsung.com> for
 linux-mtd@lists.infradead.org; Tue, 05 Mar 2013 13:30:36 +0900 (KST)
Received: from DOJG1HAN02 ([12.23.120.99])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MJ600H007703230@mmp1.samsung.com> for
 linux-mtd@lists.infradead.org; Tue, 05 Mar 2013 13:30:36 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'David Woodhouse' <dwmw2@infradead.org>
References: <005c01ce1959$e5833c90$b089b5b0$%han@samsung.com>
In-reply-to: <005c01ce1959$e5833c90$b089b5b0$%han@samsung.com>
Subject: [PATCH 4/7] mtd: fsmc_nand: use module_platform_driver_probe()
Date: Tue, 05 Mar 2013 13:30:36 +0900
Message-id: <005f01ce195a$2f04d540$8d0e7fc0$%han@samsung.com>
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
 drivers/mtd/nand/fsmc_nand.c |   13 +------------
 1 files changed, 1 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index 05ba3f0..911e243 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -1235,18 +1235,7 @@ static struct platform_driver fsmc_nand_driver = {
 	},
 };
 
-static int __init fsmc_nand_init(void)
-{
-	return platform_driver_probe(&fsmc_nand_driver,
-				     fsmc_nand_probe);
-}
-module_init(fsmc_nand_init);
-
-static void __exit fsmc_nand_exit(void)
-{
-	platform_driver_unregister(&fsmc_nand_driver);
-}
-module_exit(fsmc_nand_exit);
+module_platform_driver_probe(fsmc_nand_driver, fsmc_nand_probe);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Vipin Kumar <vipin.kumar@st.com>, Ashish Priyadarshi");
-- 
1.7.2.5
