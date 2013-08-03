Received: from mail-pd0-x22c.google.com ([2607:f8b0:400e:c02::22c])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V5YWx-0002af-9A
 for linux-mtd@lists.infradead.org; Sat, 03 Aug 2013 09:53:48 +0000
Received: by mail-pd0-f172.google.com with SMTP id z11so1501297pdj.3
 for <linux-mtd@lists.infradead.org>; Sat, 03 Aug 2013 02:53:23 -0700 (PDT)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH -next v2 10/10] mtd: mtd_nandbiterrs: use mtd_test helpers
Date: Sat,  3 Aug 2013 18:52:16 +0900
Message-Id: <1375523536-32671-11-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <1375523536-32671-1-git-send-email-akinobu.mita@gmail.com>
References: <1375523536-32671-1-git-send-email-akinobu.mita@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Iwo Mergler <Iwo.Mergler@netcommwireless.com.au>,
 Adrian Hunter <adrian.hunter@intel.com>, Akinobu Mita <akinobu.mita@gmail.com>,
 Vikram Narayanan <vikram186@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use mtdtest_write() and mtdtest_erase_eraseblock() in mtd_test helpers.

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: Iwo Mergler <Iwo.Mergler@netcommwireless.com.au>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Vikram Narayanan <vikram186@gmail.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
---
* Newly added patch from v2

 drivers/mtd/tests/nandbiterrs.c | 39 ++++++---------------------------------
 1 file changed, 6 insertions(+), 33 deletions(-)

diff --git a/drivers/mtd/tests/nandbiterrs.c b/drivers/mtd/tests/nandbiterrs.c
index 207bf9a..5a8c858 100644
--- a/drivers/mtd/tests/nandbiterrs.c
+++ b/drivers/mtd/tests/nandbiterrs.c
@@ -49,6 +49,7 @@
 #include <linux/err.h>
 #include <linux/mtd/nand.h>
 #include <linux/slab.h>
+#include "mtd_test.h"
 
 static int dev;
 module_param(dev, int, S_IRUGO);
@@ -98,45 +99,17 @@ static uint8_t hash(unsigned offset)
 	return c;
 }
 
-static int erase_block(void)
-{
-	int err;
-	struct erase_info ei;
-	loff_t addr = eraseblock * mtd->erasesize;
-
-	pr_info("erase_block\n");
-
-	memset(&ei, 0, sizeof(struct erase_info));
-	ei.mtd  = mtd;
-	ei.addr = addr;
-	ei.len  = mtd->erasesize;
-
-	err = mtd_erase(mtd, &ei);
-	if (err || ei.state == MTD_ERASE_FAILED) {
-		pr_err("error %d while erasing\n", err);
-		if (!err)
-			err = -EIO;
-		return err;
-	}
-
-	return 0;
-}
-
 /* Writes wbuffer to page */
 static int write_page(int log)
 {
-	int err = 0;
-	size_t written;
+	int err;
 
 	if (log)
 		pr_info("write_page\n");
 
-	err = mtd_write(mtd, offset, mtd->writesize, &written, wbuffer);
-	if (err || written != mtd->writesize) {
+	err = mtdtest_write(mtd, offset, mtd->writesize, wbuffer);
+	if (err)
 		pr_err("error: write failed at %#llx\n", (long long)offset);
-		if (!err)
-			err = -EIO;
-	}
 
 	return err;
 }
@@ -415,7 +388,7 @@ static int __init mtd_nandbiterrs_init(void)
 		goto exit_rbuffer;
 	}
 
-	err = erase_block();
+	err = mtdtest_erase_eraseblock(mtd, eraseblock);
 	if (err)
 		goto exit_error;
 
@@ -428,7 +401,7 @@ static int __init mtd_nandbiterrs_init(void)
 		goto exit_error;
 
 	/* We leave the block un-erased in case of test failure. */
-	err = erase_block();
+	err = mtdtest_erase_eraseblock(mtd, eraseblock);
 	if (err)
 		goto exit_error;
 
-- 
1.8.3.1
