Received: from mail-fx0-f214.google.com ([209.85.220.214])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Nsaxp-0003GQ-Hx
	for linux-mtd@lists.infradead.org; Fri, 19 Mar 2010 12:06:10 +0000
Received: by fxm6 with SMTP id 6so645496fxm.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 19 Mar 2010 05:06:03 -0700 (PDT)
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] MTD: SM_FTL: remove CONFIG_SM_FTL_MUSEUM and make it always on
Date: Fri, 19 Mar 2010 14:05:51 +0200
Message-Id: <1269000351-12023-1-git-send-email-maximlevitsky@gmail.com>
Cc: linux-mtd@lists.infradead.org, Maxim Levitsky <maximlevitsky@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The sole purpose of this settings was to avoid depedency
on MTD_NAND. It seems that such configuration isn't well
supported by Kconfig/is ugly to implement/I don't know how to do.

Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>
---
 drivers/mtd/Kconfig  |    9 ---------
 drivers/mtd/sm_ftl.c |    8 +-------
 2 files changed, 1 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index dbee14d..d90652f 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -316,15 +316,6 @@ config SM_FTL
 	  eat your card, so please don't use it together with valuable data.
 	  Use readonly driver (CONFIG_SSFDC) instead.
 
-config SM_FTL_MUSEUM
-	boolean "Additional Support for 1MiB and 2MiB SmartMedia cards"
-	depends on SM_FTL
-	select MTD_NAND_ECC_SMC
-	help
-	  Very old SmartMedia cards need ECC to be calculated in the FTL.
-	  Such cards are very rare, thus enabling this option is mostly useless.
-	  Also this support is completely UNTESTED.
-
 config MTD_OOPS
 	tristate "Log panic/oops to an MTD buffer"
 	depends on MTD
diff --git a/drivers/mtd/sm_ftl.c b/drivers/mtd/sm_ftl.c
index 9fb56c7..812e212 100644
--- a/drivers/mtd/sm_ftl.c
+++ b/drivers/mtd/sm_ftl.c
@@ -15,12 +15,10 @@
 #include <linux/freezer.h>
 #include <linux/sysfs.h>
 #include <linux/bitops.h>
+#include <linux/mtd/nand_ecc.h>
 #include "nand/sm_common.h"
 #include "sm_ftl.h"
 
-#ifdef CONFIG_SM_FTL_MUSEUM
-#include <linux/mtd/nand_ecc.h>
-#endif
 
 
 struct workqueue_struct *cache_flush_workqueue;
@@ -204,7 +202,6 @@ static void sm_break_offset(struct sm_ftl *ftl, loff_t offset,
 
 static int sm_correct_sector(uint8_t *buffer, struct sm_oob *oob)
 {
-#ifdef CONFIG_SM_FTL_MUSEUM
 	uint8_t ecc[3];
 
 	__nand_calculate_ecc(buffer, SM_SMALL_PAGE, ecc);
@@ -216,7 +213,6 @@ static int sm_correct_sector(uint8_t *buffer, struct sm_oob *oob)
 	__nand_calculate_ecc(buffer, SM_SMALL_PAGE, ecc);
 	if (__nand_correct_data(buffer, ecc, oob->ecc2, SM_SMALL_PAGE) < 0)
 		return -EIO;
-#endif
 	return 0;
 }
 
@@ -380,7 +376,6 @@ restart:
 			oob.data_status = 0;
 		}
 
-#ifdef CONFIG_SM_FTL_MUSEUM
 		if (ftl->smallpagenand) {
 			__nand_calculate_ecc(buf + boffset,
 						SM_SMALL_PAGE, oob.ecc1);
@@ -388,7 +383,6 @@ restart:
 			__nand_calculate_ecc(buf + boffset + SM_SMALL_PAGE,
 						SM_SMALL_PAGE, oob.ecc2);
 		}
-#endif
 		if (!sm_write_sector(ftl, zone, block, boffset,
 							buf + boffset, &oob))
 			continue;
-- 
1.6.3.3
