Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V5YWr-0006Y9-7s
 for linux-mtd@lists.infradead.org; Sat, 03 Aug 2013 09:53:59 +0000
Received: by mail-pa0-f46.google.com with SMTP id fa1so1528898pad.19
 for <linux-mtd@lists.infradead.org>; Sat, 03 Aug 2013 02:53:19 -0700 (PDT)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH -next v2 08/10] mtd: mtd_subpagetest: use mtd_test helpers
Date: Sat,  3 Aug 2013 18:52:14 +0900
Message-Id: <1375523536-32671-9-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <1375523536-32671-1-git-send-email-akinobu.mita@gmail.com>
References: <1375523536-32671-1-git-send-email-akinobu.mita@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Vikram Narayanan <vikram186@gmail.com>, Akinobu Mita <akinobu.mita@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
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

Use mtdtest_scan_for_bad_eraseblocks() and mtdtest_erase_good_eraseblocks()
in mtd_test helpers.

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Vikram Narayanan <vikram186@gmail.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
---
* Changes from v1
- follow the changes of helper functions

 drivers/mtd/tests/subpagetest.c | 87 +++++------------------------------------
 1 file changed, 9 insertions(+), 78 deletions(-)

diff --git a/drivers/mtd/tests/subpagetest.c b/drivers/mtd/tests/subpagetest.c
index e41a04f..e2c0adf 100644
--- a/drivers/mtd/tests/subpagetest.c
+++ b/drivers/mtd/tests/subpagetest.c
@@ -30,6 +30,8 @@
 #include <linux/sched.h>
 #include <linux/random.h>
 
+#include "mtd_test.h"
+
 static int dev = -EINVAL;
 module_param(dev, int, S_IRUGO);
 MODULE_PARM_DESC(dev, "MTD device number to use");
@@ -51,50 +53,6 @@ static inline void clear_data(unsigned char *buf, size_t len)
 	memset(buf, 0, len);
 }
 
-static int erase_eraseblock(int ebnum)
-{
-	int err;
-	struct erase_info ei;
-	loff_t addr = ebnum * mtd->erasesize;
-
-	memset(&ei, 0, sizeof(struct erase_info));
-	ei.mtd  = mtd;
-	ei.addr = addr;
-	ei.len  = mtd->erasesize;
-
-	err = mtd_erase(mtd, &ei);
-	if (err) {
-		pr_err("error %d while erasing EB %d\n", err, ebnum);
-		return err;
-	}
-
-	if (ei.state == MTD_ERASE_FAILED) {
-		pr_err("some erase error occurred at EB %d\n",
-		       ebnum);
-		return -EIO;
-	}
-
-	return 0;
-}
-
-static int erase_whole_device(void)
-{
-	int err;
-	unsigned int i;
-
-	pr_info("erasing whole device\n");
-	for (i = 0; i < ebcnt; ++i) {
-		if (bbt[i])
-			continue;
-		err = erase_eraseblock(i);
-		if (err)
-			return err;
-		cond_resched();
-	}
-	pr_info("erased %u eraseblocks\n", i);
-	return 0;
-}
-
 static int write_eraseblock(int ebnum)
 {
 	size_t written;
@@ -317,36 +275,6 @@ static int verify_all_eraseblocks_ff(void)
 	return 0;
 }
 
-static int is_block_bad(int ebnum)
-{
-	loff_t addr = ebnum * mtd->erasesize;
-	int ret;
-
-	ret = mtd_block_isbad(mtd, addr);
-	if (ret)
-		pr_info("block %d is bad\n", ebnum);
-	return ret;
-}
-
-static int scan_for_bad_eraseblocks(void)
-{
-	int i, bad = 0;
-
-	bbt = kzalloc(ebcnt, GFP_KERNEL);
-	if (!bbt)
-		return -ENOMEM;
-
-	pr_info("scanning for bad eraseblocks\n");
-	for (i = 0; i < ebcnt; ++i) {
-		bbt[i] = is_block_bad(i) ? 1 : 0;
-		if (bbt[i])
-			bad += 1;
-		cond_resched();
-	}
-	pr_info("scanned %d eraseblocks, %d are bad\n", i, bad);
-	return 0;
-}
-
 static int __init mtd_subpagetest_init(void)
 {
 	int err = 0;
@@ -396,12 +324,15 @@ static int __init mtd_subpagetest_init(void)
 	readbuf = kmalloc(bufsize, GFP_KERNEL);
 	if (!readbuf)
 		goto out;
+	bbt = kzalloc(ebcnt, GFP_KERNEL);
+	if (!bbt)
+		goto out;
 
-	err = scan_for_bad_eraseblocks();
+	err = mtdtest_scan_for_bad_eraseblocks(mtd, bbt, 0, ebcnt);
 	if (err)
 		goto out;
 
-	err = erase_whole_device();
+	err = mtdtest_erase_good_eraseblocks(mtd, bbt, 0, ebcnt);
 	if (err)
 		goto out;
 
@@ -433,7 +364,7 @@ static int __init mtd_subpagetest_init(void)
 	}
 	pr_info("verified %u eraseblocks\n", i);
 
-	err = erase_whole_device();
+	err = mtdtest_erase_good_eraseblocks(mtd, bbt, 0, ebcnt);
 	if (err)
 		goto out;
 
@@ -471,7 +402,7 @@ static int __init mtd_subpagetest_init(void)
 	}
 	pr_info("verified %u eraseblocks\n", i);
 
-	err = erase_whole_device();
+	err = mtdtest_erase_good_eraseblocks(mtd, bbt, 0, ebcnt);
 	if (err)
 		goto out;
 
-- 
1.8.3.1
