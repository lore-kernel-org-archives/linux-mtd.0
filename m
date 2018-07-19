Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fgFqG-000884-Da
 for linux-mtd@lists.infradead.org; Thu, 19 Jul 2018 20:48:06 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH] mtd: rawnand: Remove unused caller_is_module() definition
Date: Thu, 19 Jul 2018 22:47:38 +0200
Message-Id: <20180719204738.9564-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit 260e89a6e0d6 ("mtd: core: tone down suggestion that dev.parent
should be set") removed the only user of caller_is_module() but forgot
to remove the definition itself. Let's remove it now.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 323a900f3697..99d67d7d2f94 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -6718,18 +6718,6 @@ int nand_scan_tail(struct mtd_info *mtd)
 }
 EXPORT_SYMBOL(nand_scan_tail);
 
-/*
- * is_module_text_address() isn't exported, and it's mostly a pointless
- * test if this is a module _anyway_ -- they'd have to try _really_ hard
- * to call us from in-kernel code if the core NAND support is modular.
- */
-#ifdef MODULE
-#define caller_is_module() (1)
-#else
-#define caller_is_module() \
-	is_module_text_address((unsigned long)__builtin_return_address(0))
-#endif
-
 /**
  * nand_scan_with_ids - [NAND Interface] Scan for the NAND device
  * @mtd: MTD device structure
-- 
2.14.1
