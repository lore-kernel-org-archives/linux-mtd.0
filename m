Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffiGs-00082b-FX
 for linux-mtd@lists.infradead.org; Wed, 18 Jul 2018 08:57:20 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v3 2/4] mtd: rawnand: orion: Avoid direct inclusion of asm
 headers
Date: Wed, 18 Jul 2018 10:56:50 +0200
Message-Id: <20180718085652.30391-3-boris.brezillon@bootlin.com>
In-Reply-To: <20180718085652.30391-1-boris.brezillon@bootlin.com>
References: <20180718085652.30391-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Include linux/sizes.h instead of asm/sizes.h to make code completely
arch independent.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/orion_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/orion_nand.c b/drivers/mtd/nand/raw/orion_nand.c
index 1a4828442675..27cc902545f3 100644
--- a/drivers/mtd/nand/raw/orion_nand.c
+++ b/drivers/mtd/nand/raw/orion_nand.c
@@ -18,7 +18,7 @@
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/io.h>
-#include <asm/sizes.h>
+#include <linux/sizes.h>
 #include <linux/platform_data/mtd-orion_nand.h>
 
 struct orion_nand_info {
-- 
2.14.1
