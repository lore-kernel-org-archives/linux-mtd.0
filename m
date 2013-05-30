Received: from szxga01-in.huawei.com ([119.145.14.64])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UhsXY-0004c5-O9
 for linux-mtd@lists.infradead.org; Thu, 30 May 2013 02:24:34 +0000
Message-ID: <51A6B7D8.8090600@huawei.com>
Date: Thu, 30 May 2013 10:22:16 +0800
From: Libo Chen <clbchenlibo.chen@huawei.com>
MIME-Version: 1.0
To: <dwmw2@infradead.org>, Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH RESEND 2/2] mtd: bcm47: convert to module_platform_driver
 instead of init/exit
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: Li Zefan <lizefan@huawei.com>, artem.bityutskiy@linux.intel.com,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Bill Pemberton <wfp5p@virginia.edu>,
 linux-mtd@lists.infradead.org, hauke@hauke-m.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


convert to module_platform_driver instead of init/exit

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Libo chen <libo.chen@huawei.com>
---
 drivers/mtd/devices/bcm47xxsflash.c |   20 +-------------------
 1 files changed, 1 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/devices/bcm47xxsflash.c b/drivers/mtd/devices/bcm47xxsflash.c
index 2630d5c..54230cd 100644
--- a/drivers/mtd/devices/bcm47xxsflash.c
+++ b/drivers/mtd/devices/bcm47xxsflash.c
@@ -108,22 +108,4 @@ static struct platform_driver bcma_sflash_driver = {
  * Init
  **************************************************/

-static int __init bcm47xxsflash_init(void)
-{
-	int err;
-
-	err = platform_driver_register(&bcma_sflash_driver);
-	if (err)
-		pr_err("Failed to register BCMA serial flash driver: %d\n",
-		       err);
-
-	return err;
-}
-
-static void __exit bcm47xxsflash_exit(void)
-{
-	platform_driver_unregister(&bcma_sflash_driver);
-}
-
-module_init(bcm47xxsflash_init);
-module_exit(bcm47xxsflash_exit);
+module_platform_driver(bcma_sflash_driver);
-- 
1.7.1
