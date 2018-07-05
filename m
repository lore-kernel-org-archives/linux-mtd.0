Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fb0ps-0002II-7F
 for linux-mtd@lists.infradead.org; Thu, 05 Jul 2018 09:46:07 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-wireless@vger.kernel.org
Subject: [PATCH 06/27] mtd: rawnand: sharpsl: Remove inclusion of mach and asm
 headers
Date: Thu,  5 Jul 2018 11:45:01 +0200
Message-Id: <20180705094522.12138-7-boris.brezillon@bootlin.com>
In-Reply-To: <20180705094522.12138-1-boris.brezillon@bootlin.com>
References: <20180705094522.12138-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We don't need mach/hardware.h and sm/mach-types.h, and asm/io.h can be
replaced by linux/io.h.

Now that we removed those inclusions, we're ready to allow selection of
this driver when COMPILE_TEST=y.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/sharpsl.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/sharpsl.c b/drivers/mtd/nand/raw/sharpsl.c
index e93df02c825e..fc171b17a39b 100644
--- a/drivers/mtd/nand/raw/sharpsl.c
+++ b/drivers/mtd/nand/raw/sharpsl.c
@@ -21,10 +21,7 @@
 #include <linux/mtd/sharpsl.h>
 #include <linux/interrupt.h>
 #include <linux/platform_device.h>
-
-#include <asm/io.h>
-#include <mach/hardware.h>
-#include <asm/mach-types.h>
+#include <linux/io.h>
 
 struct sharpsl_nand {
 	struct nand_chip	chip;
-- 
2.14.1
