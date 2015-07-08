Received: from mail-ig0-x230.google.com ([2607:f8b0:4001:c05::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZCiJn-0001SV-2k
 for linux-mtd@lists.infradead.org; Wed, 08 Jul 2015 05:54:51 +0000
Received: by igau2 with SMTP id u2so54762352iga.0
 for <linux-mtd@lists.infradead.org>; Tue, 07 Jul 2015 22:54:27 -0700 (PDT)
From: Rajat Jain <rajatja@google.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Rajat Jain <rajatja@google.com>,
 Rajat Jain <rajatxjain@gmail.com>
Subject: [PATCH] mtd: denali: Use module_pci_driver()
Date: Tue,  7 Jul 2015 22:54:03 -0700
Message-Id: <1436334843-27480-1-git-send-email-rajatja@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use module_pci_driver, since init and exit functions only register
and unregister the pci driver, respectively.

Signed-off-by: Rajat Jain <rajatja@google.com>
Signed-off-by: Rajat Jain <rajatxjain@gmail.com>
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
2.4.3.573.g4eafbef
