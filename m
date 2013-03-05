Received: from mailout2.samsung.com ([203.254.224.25])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCjWj-0004cZ-8L
 for linux-mtd@lists.infradead.org; Tue, 05 Mar 2013 04:30:58 +0000
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MJ6004UK77G4VK0@mailout2.samsung.com> for
 linux-mtd@lists.infradead.org; Tue, 05 Mar 2013 13:30:56 +0900 (KST)
Received: from DOJG1HAN02 ([12.23.120.99])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MJ600H5R77K3230@mmp1.samsung.com> for
 linux-mtd@lists.infradead.org; Tue, 05 Mar 2013 13:30:56 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'David Woodhouse' <dwmw2@infradead.org>
References: <005c01ce1959$e5833c90$b089b5b0$%han@samsung.com>
In-reply-to: <005c01ce1959$e5833c90$b089b5b0$%han@samsung.com>
Subject: [PATCH 5/7] mtd: sh_flctl: use module_platform_driver_probe()
Date: Tue, 05 Mar 2013 13:30:56 +0900
Message-id: <006001ce195a$3a9e5890$afdb09b0$%han@samsung.com>
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
1.7.2.5
