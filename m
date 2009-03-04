Message-Id: <200903042001.n24K1d6N028791@imap1.linux-foundation.org>
Subject: [patch 12/15] mtd: nand: drop usage of cpu_is_* macro
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Wed, 04 Mar 2009 12:01:39 -0800
Cc: khilman@deeprootsystems.com, david-b@pacbell.net, akpm@linux-foundation.org,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Kevin Hilman <khilman@deeprootsystems.com>

Usage of davinci-specific cpu_is macros is not allowed in drivers. 
These options should be passed in through platform_data.

Signed-off-by: Kevin Hilman <khilman@deeprootsystems.com>
Cc: David Brownell <david-b@pacbell.net>
Cc: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/mtd/nand/davinci_nand.c |    3 ---
 1 file changed, 3 deletions(-)

diff -puN drivers/mtd/nand/davinci_nand.c~mtd-nand-drop-usage-of-cpu_is_-macro drivers/mtd/nand/davinci_nand.c
--- a/drivers/mtd/nand/davinci_nand.c~mtd-nand-drop-usage-of-cpu_is_-macro
+++ a/drivers/mtd/nand/davinci_nand.c
@@ -33,7 +33,6 @@
 #include <linux/mtd/nand.h>
 #include <linux/mtd/partitions.h>
 
-#include <mach/cpu.h>
 #include <mach/nand.h>
 
 #include <asm/mach-types.h>
@@ -392,8 +391,6 @@ static int __init nand_davinci_probe(str
 	/* use board-specific ECC config; else, the best available */
 	if (pdata)
 		ecc_mode = pdata->ecc_mode;
-	else if (cpu_is_davinci_dm355())
-		ecc_mode = NAND_ECC_HW_SYNDROME;
 	else
 		ecc_mode = NAND_ECC_HW;
 
_
