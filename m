Received: from ti-out-0910.google.com ([209.85.142.190])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L2muu-0005Xr-Kt
	for linux-mtd@lists.infradead.org; Wed, 19 Nov 2008 13:16:25 +0000
Received: by ti-out-0910.google.com with SMTP id a21so2271159tia.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 19 Nov 2008 05:16:23 -0800 (PST)
From: Qinghuang Feng <qhfeng.kernel@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 1/4] drivers/mtd/nand/cafe_nand.c: mark {__init|__exit} for
	{init|exit} functions
Date: Wed, 19 Nov 2008 21:16:16 +0800
Message-ID: <492411a6.08486e0a.4d9d.ffffe118@mx.google.com>
Cc: Mike, linux-kernel@vger.kernel.org, David, linux-mtd@lists.infradead.org,
	Mike Lavender <mike@steroidmicros.com>, Rapoport <mike@compulab.co.il>,
	Hinds <dahinds@users.sourceforge.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Signed-off-by: Qinghuang Feng <qhfeng.kernel@gmail.com>
---
diff --git a/drivers/mtd/nand/cafe_nand.c b/drivers/mtd/nand/cafe_nand.c
index b8064bf..7d7a80b 100644
--- a/drivers/mtd/nand/cafe_nand.c
+++ b/drivers/mtd/nand/cafe_nand.c
@@ -899,12 +899,12 @@ static struct pci_driver cafe_nand_pci_driver = {
 	.resume = cafe_nand_resume,
 };
 
-static int cafe_nand_init(void)
+static int __init cafe_nand_init(void)
 {
 	return pci_register_driver(&cafe_nand_pci_driver);
 }
 
-static void cafe_nand_exit(void)
+static void __exit cafe_nand_exit(void)
 {
 	pci_unregister_driver(&cafe_nand_pci_driver);
 }
