Received: from mail-pg0-f68.google.com ([74.125.83.68])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eGt8N-0005w8-TW
 for linux-mtd@lists.infradead.org; Mon, 20 Nov 2017 20:57:41 +0000
Received: by mail-pg0-f68.google.com with SMTP id k190so3676382pga.3
 for <linux-mtd@lists.infradead.org>; Mon, 20 Nov 2017 12:57:19 -0800 (PST)
From: Jesse Chan <jc@linux.com>
To: 
Cc: Jesse Chan <jc@linux.com>, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: nand: denali_pci: add missing
 MODULE_DESCRIPTION/AUTHOR/LICENSE
Date: Mon, 20 Nov 2017 12:57:13 -0800
Message-Id: <20171120205713.86952-1-jc@linux.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This change resolves a new compile-time warning
when built as a loadable module:

WARNING: modpost: missing MODULE_LICENSE() in drivers/mtd/nand/denali_pci.o
see include/linux/module.h for more information

This adds the license as "GPL v2", which matches the header of the file.

MODULE_DESCRIPTION and MODULE_AUTHOR are also added.

Signed-off-by: Jesse Chan <jc@linux.com>
---
 drivers/mtd/nand/denali_pci.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/nand/denali_pci.c b/drivers/mtd/nand/denali_pci.c
index 81370c79aa48..7ad0db65a6fa 100644
--- a/drivers/mtd/nand/denali_pci.c
+++ b/drivers/mtd/nand/denali_pci.c
@@ -124,3 +124,7 @@ static struct pci_driver denali_pci_driver = {
 };
 
 module_pci_driver(denali_pci_driver);
+
+MODULE_DESCRIPTION("PCI driver for Denali NAND controller");
+MODULE_AUTHOR("Intel Corporation and its suppliers");
+MODULE_LICENSE("GPL v2");
-- 
2.14.1
