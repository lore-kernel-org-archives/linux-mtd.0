Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZCNEi-0002QW-DM
 for linux-mtd@lists.infradead.org; Tue, 07 Jul 2015 07:24:12 +0000
Received: by pactm7 with SMTP id tm7so108721620pac.2
 for <linux-mtd@lists.infradead.org>; Tue, 07 Jul 2015 00:23:51 -0700 (PDT)
Date: Tue, 7 Jul 2015 12:53:45 +0530
From: Vaishali Thakkar <vthakkar1994@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: denali: Use module_pci_driver
Message-ID: <20150707072345.GA20060@vaishali-Ideapad-Z570>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use module_pci_driver for drivers whose init and exit functions
only register and unregister, respectively.

A simplified version of the Coccinelle semantic patch that performs
this transformation is as follows:

@a@
identifier f, x;
@@
-static f(...) { return pci_register_driver(&x); }

@b depends on a@
identifier e, a.x;
@@
-static e(...) { pci_unregister_driver(&x); }

@c depends on a && b@
identifier a.f;
declarer name module_init;
@@
-module_init(f);

@d depends on a && b && c@
identifier b.e, a.x;
declarer name module_exit;
declarer name module_pci_driver;
@@
-module_exit(e);
+module_pci_driver(x);

Signed-off-by: Vaishali Thakkar <vthakkar1994@gmail.com>
---
 drivers/mtd/nand/denali_pci.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/denali_pci.c b/drivers/mtd/nand/denali_pci.c
index 6e2f387..a47a14c 100644
--- a/drivers/mtd/nand/denali_pci.c
+++ b/drivers/mtd/nand/denali_pci.c
@@ -128,15 +128,4 @@ static struct pci_driver denali_pci_driver = {
 	.probe = denali_pci_probe,
 	.remove = denali_pci_remove,
 };
-
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
1.9.1
