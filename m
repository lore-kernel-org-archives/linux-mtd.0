Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZNKqn-0005Nk-61
 for linux-mtd@lists.infradead.org; Thu, 06 Aug 2015 13:04:53 +0000
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH 2/4] mtd: denali_pci: use module_pci_driver() macro
Date: Thu,  6 Aug 2015 16:04:22 +0300
Message-Id: <1438866264-11091-2-git-send-email-andriy.shevchenko@linux.intel.com>
In-Reply-To: <1438866264-11091-1-git-send-email-andriy.shevchenko@linux.intel.com>
References: <1438866264-11091-1-git-send-email-andriy.shevchenko@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Let's use module_pci_driver() macro to reduce code base of the driver.

There is no functional change.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/mtd/nand/denali_pci.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/denali_pci.c b/drivers/mtd/nand/denali_pci.c
index 6e2f387..29e5d0c 100644
--- a/drivers/mtd/nand/denali_pci.c
+++ b/drivers/mtd/nand/denali_pci.c
@@ -129,14 +129,4 @@ static struct pci_driver denali_pci_driver = {
 	.remove = denali_pci_remove,
 };
 
-static int denali_init_pci(void)
-{
-	return pci_register_driver(&denali_pci_driver);
-}
-module_init(denali_init_pci);
-
-static void denali_exit_pci(void)
-{
-	pci_unregister_driver(&denali_pci_driver);
-}
-module_exit(denali_exit_pci);
+module_pci_driver(denali_pci_driver);
-- 
2.4.6
