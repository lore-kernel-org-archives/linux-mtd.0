Received: from mail-pd0-x22a.google.com ([2607:f8b0:400e:c02::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V5YWo-0006Y7-LS
 for linux-mtd@lists.infradead.org; Sat, 03 Aug 2013 09:53:58 +0000
Received: by mail-pd0-f170.google.com with SMTP id x10so1510452pdj.1
 for <linux-mtd@lists.infradead.org>; Sat, 03 Aug 2013 02:53:17 -0700 (PDT)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH -next v2 07/10] mtd: mtd_stresstest: use mtd_test helpers
Date: Sat,  3 Aug 2013 18:52:13 +0900
Message-Id: <1375523536-32671-8-git-send-email-akinobu.mita@gmail.com>
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

Use mtdtest_read(), mtdtest_write(), mtdtest_erase_eraseblock(), and
mtdtest_scan_for_bad_eraseblocks() in mtd_test helpers.

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

 drivers/mtd/tests/stresstest.c | 86 ++++++------------------------------------
 1 file changed, 12 insertions(+), 74 deletions(-)

diff --git a/drivers/mtd/tests/stresstest.c b/drivers/mtd/tests/stresstest.c
index 3a95e61..1695248 100644
--- a/drivers/mtd/tests/stresstest.c
+++ b/drivers/mtd/tests/stresstest.c
@@ -31,6 +31,8 @@
 #include <linux/vmalloc.h>
 #include <linux/random.h>
 
+#include "mtd_test.h"
+
 static int dev = -EINVAL;
 module_param(dev, int, S_IRUGO);
 MODULE_PARM_DESC(dev, "MTD device number to use");
@@ -81,46 +83,8 @@ static int rand_len(int offs)
 	return len;
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
-	if (unlikely(err)) {
-		pr_err("error %d while erasing EB %d\n", err, ebnum);
-		return err;
-	}
-
-	if (unlikely(ei.state == MTD_ERASE_FAILED)) {
-		pr_err("some erase error occurred at EB %d\n",
-		       ebnum);
-		return -EIO;
-	}
-
-	return 0;
-}
-
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
 static int do_read(void)
 {
-	size_t read;
 	int eb = rand_eb();
 	int offs = rand_offs();
 	int len = rand_len(offs), err;
@@ -133,14 +97,10 @@ static int do_read(void)
 			len = mtd->erasesize - offs;
 	}
 	addr = eb * mtd->erasesize + offs;
-	err = mtd_read(mtd, addr, len, &read, readbuf);
-	if (mtd_is_bitflip(err))
-		err = 0;
-	if (unlikely(err || read != len)) {
+	err = mtdtest_read(mtd, addr, len, readbuf);
+	if (unlikely(err)) {
 		pr_err("error: read failed at 0x%llx\n",
 		       (long long)addr);
-		if (!err)
-			err = -EINVAL;
 		return err;
 	}
 	return 0;
@@ -149,12 +109,11 @@ static int do_read(void)
 static int do_write(void)
 {
 	int eb = rand_eb(), offs, err, len;
-	size_t written;
 	loff_t addr;
 
 	offs = offsets[eb];
 	if (offs >= mtd->erasesize) {
-		err = erase_eraseblock(eb);
+		err = mtdtest_erase_eraseblock(mtd, eb);
 		if (err)
 			return err;
 		offs = offsets[eb] = 0;
@@ -165,19 +124,17 @@ static int do_write(void)
 		if (bbt[eb + 1])
 			len = mtd->erasesize - offs;
 		else {
-			err = erase_eraseblock(eb + 1);
+			err = mtdtest_erase_eraseblock(mtd, eb + 1);
 			if (err)
 				return err;
 			offsets[eb + 1] = 0;
 		}
 	}
 	addr = eb * mtd->erasesize + offs;
-	err = mtd_write(mtd, addr, len, &written, writebuf);
-	if (unlikely(err || written != len)) {
+	err = mtdtest_write(mtd, addr, len, writebuf);
+	if (unlikely(err)) {
 		pr_err("error: write failed at 0x%llx\n",
 		       (long long)addr);
-		if (!err)
-			err = -EINVAL;
 		return err;
 	}
 	offs += len;
@@ -197,28 +154,6 @@ static int do_operation(void)
 		return do_write();
 }
 
-static int scan_for_bad_eraseblocks(void)
-{
-	int i, bad = 0;
-
-	bbt = kzalloc(ebcnt, GFP_KERNEL);
-	if (!bbt)
-		return -ENOMEM;
-
-	if (!mtd_can_have_bb(mtd))
-		return 0;
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
 static int __init mtd_stresstest_init(void)
 {
 	int err;
@@ -280,7 +215,10 @@ static int __init mtd_stresstest_init(void)
 		offsets[i] = mtd->erasesize;
 	prandom_bytes(writebuf, bufsize);
 
-	err = scan_for_bad_eraseblocks();
+	bbt = kzalloc(ebcnt, GFP_KERNEL);
+	if (!bbt)
+		goto out;
+	err = mtdtest_scan_for_bad_eraseblocks(mtd, bbt, 0, ebcnt);
 	if (err)
 		goto out;
 
-- 
1.8.3.1
