Received: from conuserg-10.nifty.com ([210.131.2.77])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1euHhF-0005h2-BH
 for linux-mtd@lists.infradead.org; Fri, 09 Mar 2018 13:04:31 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Peter Pan <peterpandong@micron.com>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Tony Lindgren <tony@atomide.com>
Subject: [PATCH] mtd: nand: remove STANDALONE compile mode of nand_ecc
Date: Fri,  9 Mar 2018 22:03:52 +0900
Message-Id: <1520600632-24955-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This file can not be built independently any more.  We would have to
bring in more to resolve mtd_to_nand(mtd)->ecc.size, for example.

It is difficult to notice a breakage since nobody compiles this mode.
It is not worth fixing or maintaining in my opinion.  Remove.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/raw/nand_ecc.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_ecc.c b/drivers/mtd/nand/raw/nand_ecc.c
index 3630f0f..8e132ed 100644
--- a/drivers/mtd/nand/raw/nand_ecc.c
+++ b/drivers/mtd/nand/raw/nand_ecc.c
@@ -28,15 +28,6 @@
  *
  */
 
-/*
- * The STANDALONE macro is useful when running the code outside the kernel
- * e.g. when running the code in a testbed or a benchmark program.
- * When STANDALONE is used, the module related macros are commented out
- * as well as the linux include files.
- * Instead a private definition of mtd_info is given to satisfy the compiler
- * (the code does not use mtd_info, so the code does not care)
- */
-#ifndef STANDALONE
 #include <linux/types.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -44,17 +35,6 @@
 #include <linux/mtd/rawnand.h>
 #include <linux/mtd/nand_ecc.h>
 #include <asm/byteorder.h>
-#else
-#include <stdint.h>
-struct mtd_info;
-#define EXPORT_SYMBOL(x)  /* x */
-
-#define MODULE_LICENSE(x)	/* x */
-#define MODULE_AUTHOR(x)	/* x */
-#define MODULE_DESCRIPTION(x)	/* x */
-
-#define pr_err printf
-#endif
 
 /*
  * invparity is a 256 byte table that contains the odd parity
-- 
2.7.4
