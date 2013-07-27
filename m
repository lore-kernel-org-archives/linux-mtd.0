Received: from mail-pb0-x233.google.com ([2607:f8b0:400e:c01::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V2u2Y-0008FY-JF
 for linux-mtd@lists.infradead.org; Sat, 27 Jul 2013 02:15:35 +0000
Received: by mail-pb0-f51.google.com with SMTP id um15so2652681pbc.24
 for <linux-mtd@lists.infradead.org>; Fri, 26 Jul 2013 19:15:03 -0700 (PDT)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH -next 2/7] mtd: mtd_oobtest: use mtd_test module
Date: Sat, 27 Jul 2013 11:14:11 +0900
Message-Id: <1374891256-20248-3-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <1374891256-20248-1-git-send-email-akinobu.mita@gmail.com>
References: <1374891256-20248-1-git-send-email-akinobu.mita@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Akinobu Mita <akinobu.mita@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use mtdtest_scan_for_bad_eraseblocks(), mtdtest_erase_whole_device(),
and mtdtest_erase_eraseblock() in mtd_test module.

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/tests/mtd_oobtest.c | 92 ++++++-----------------------------------
 1 file changed, 12 insertions(+), 80 deletions(-)

diff --git a/drivers/mtd/tests/mtd_oobtest.c b/drivers/mtd/tests/mtd_oobtest.c
index ab81e9a..8d5e35c 100644
--- a/drivers/mtd/tests/mtd_oobtest.c
+++ b/drivers/mtd/tests/mtd_oobtest.c
@@ -31,6 +31,8 @@
 #include <linux/sched.h>
 #include <linux/random.h>
 
+#include "mtd_test.h"
+
 static int dev = -EINVAL;
 module_param(dev, int, S_IRUGO);
 MODULE_PARM_DESC(dev, "MTD device number to use");
@@ -49,49 +51,6 @@ static int use_len_max;
 static int vary_offset;
 static struct rnd_state rnd_state;
 
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
-		pr_err("some erase error occurred at EB %d\n", ebnum);
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
 static void do_vary_offset(void)
 {
 	use_len -= 1;
@@ -304,36 +263,6 @@ static int verify_all_eraseblocks(void)
 	return 0;
 }
 
-static int is_block_bad(int ebnum)
-{
-	int ret;
-	loff_t addr = ebnum * mtd->erasesize;
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
-	bbt = kmalloc(ebcnt, GFP_KERNEL);
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
 static int __init mtd_oobtest_init(void)
 {
 	int err = 0;
@@ -383,8 +312,11 @@ static int __init mtd_oobtest_init(void)
 	writebuf = kmalloc(mtd->erasesize, GFP_KERNEL);
 	if (!writebuf)
 		goto out;
+	bbt = kzalloc(ebcnt, GFP_KERNEL);
+	if (!bbt)
+		goto out;
 
-	err = scan_for_bad_eraseblocks();
+	err = mtdtest_scan_for_bad_eraseblocks(mtd, bbt, ebcnt);
 	if (err)
 		goto out;
 
@@ -396,7 +328,7 @@ static int __init mtd_oobtest_init(void)
 	/* First test: write all OOB, read it back and verify */
 	pr_info("test 1 of 5\n");
 
-	err = erase_whole_device();
+	err = mtdtest_erase_whole_device(mtd, bbt, ebcnt);
 	if (err)
 		goto out;
 
@@ -416,7 +348,7 @@ static int __init mtd_oobtest_init(void)
 	 */
 	pr_info("test 2 of 5\n");
 
-	err = erase_whole_device();
+	err = mtdtest_erase_whole_device(mtd, bbt, ebcnt);
 	if (err)
 		goto out;
 
@@ -446,7 +378,7 @@ static int __init mtd_oobtest_init(void)
 	 */
 	pr_info("test 3 of 5\n");
 
-	err = erase_whole_device();
+	err = mtdtest_erase_whole_device(mtd, bbt, ebcnt);
 	if (err)
 		goto out;
 
@@ -479,7 +411,7 @@ static int __init mtd_oobtest_init(void)
 	/* Fourth test: try to write off end of device */
 	pr_info("test 4 of 5\n");
 
-	err = erase_whole_device();
+	err = mtdtest_erase_whole_device(mtd, bbt, ebcnt);
 	if (err)
 		goto out;
 
@@ -571,7 +503,7 @@ static int __init mtd_oobtest_init(void)
 			errcnt += 1;
 		}
 
-		err = erase_eraseblock(ebcnt - 1);
+		err = mtdtest_erase_eraseblock(mtd, ebcnt - 1);
 		if (err)
 			goto out;
 
@@ -620,7 +552,7 @@ static int __init mtd_oobtest_init(void)
 	pr_info("test 5 of 5\n");
 
 	/* Erase all eraseblocks */
-	err = erase_whole_device();
+	err = mtdtest_erase_whole_device(mtd, bbt, ebcnt);
 	if (err)
 		goto out;
 
-- 
1.8.3.1
