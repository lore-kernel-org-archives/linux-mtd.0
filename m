Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V2u2c-0008Fg-UC
 for linux-mtd@lists.infradead.org; Sat, 27 Jul 2013 02:15:44 +0000
Received: by mail-pa0-f49.google.com with SMTP id bi5so3842400pad.8
 for <linux-mtd@lists.infradead.org>; Fri, 26 Jul 2013 19:15:09 -0700 (PDT)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH -next 5/7] mtd: mtd_speedtest: use mtd_test module
Date: Sat, 27 Jul 2013 11:14:14 +0900
Message-Id: <1374891256-20248-6-git-send-email-akinobu.mita@gmail.com>
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

Use mtdtest_write(), mtdtest_read(), mtdtest_scan_for_bad_eraseblocks(),
mtdtest_erase_whole_device() in mtd_test module.

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/tests/mtd_speedtest.c | 180 ++++++++------------------------------
 1 file changed, 36 insertions(+), 144 deletions(-)

diff --git a/drivers/mtd/tests/mtd_speedtest.c b/drivers/mtd/tests/mtd_speedtest.c
index 20b63d1..77ed5ba 100644
--- a/drivers/mtd/tests/mtd_speedtest.c
+++ b/drivers/mtd/tests/mtd_speedtest.c
@@ -30,6 +30,8 @@
 #include <linux/sched.h>
 #include <linux/random.h>
 
+#include "mtd_test.h"
+
 static int dev = -EINVAL;
 module_param(dev, int, S_IRUGO);
 MODULE_PARM_DESC(dev, "MTD device number to use");
@@ -49,33 +51,6 @@ static int pgcnt;
 static int goodebcnt;
 static struct timeval start, finish;
 
-
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
 static int multiblock_erase(int ebnum, int blocks)
 {
 	int err;
@@ -103,52 +78,29 @@ static int multiblock_erase(int ebnum, int blocks)
 	return 0;
 }
 
-static int erase_whole_device(void)
-{
-	int err;
-	unsigned int i;
-
-	for (i = 0; i < ebcnt; ++i) {
-		if (bbt[i])
-			continue;
-		err = erase_eraseblock(i);
-		if (err)
-			return err;
-		cond_resched();
-	}
-	return 0;
-}
-
 static int write_eraseblock(int ebnum)
 {
-	size_t written;
-	int err = 0;
+	int err;
 	loff_t addr = ebnum * mtd->erasesize;
 
-	err = mtd_write(mtd, addr, mtd->erasesize, &written, iobuf);
-	if (err || written != mtd->erasesize) {
+	err = mtdtest_write(mtd, addr, mtd->erasesize, iobuf);
+	if (err)
 		pr_err("error: write failed at %#llx\n", addr);
-		if (!err)
-			err = -EINVAL;
-	}
 
 	return err;
 }
 
 static int write_eraseblock_by_page(int ebnum)
 {
-	size_t written;
 	int i, err = 0;
 	loff_t addr = ebnum * mtd->erasesize;
 	void *buf = iobuf;
 
 	for (i = 0; i < pgcnt; i++) {
-		err = mtd_write(mtd, addr, pgsize, &written, buf);
-		if (err || written != pgsize) {
+		err = mtdtest_write(mtd, addr, pgsize, buf);
+		if (err) {
 			pr_err("error: write failed at %#llx\n",
 			       addr);
-			if (!err)
-				err = -EINVAL;
 			break;
 		}
 		addr += pgsize;
@@ -160,30 +112,26 @@ static int write_eraseblock_by_page(int ebnum)
 
 static int write_eraseblock_by_2pages(int ebnum)
 {
-	size_t written, sz = pgsize * 2;
+	size_t sz = pgsize * 2;
 	int i, n = pgcnt / 2, err = 0;
 	loff_t addr = ebnum * mtd->erasesize;
 	void *buf = iobuf;
 
 	for (i = 0; i < n; i++) {
-		err = mtd_write(mtd, addr, sz, &written, buf);
-		if (err || written != sz) {
+		err = mtdtest_write(mtd, addr, sz, buf);
+		if (err) {
 			pr_err("error: write failed at %#llx\n",
 			       addr);
-			if (!err)
-				err = -EINVAL;
 			return err;
 		}
 		addr += sz;
 		buf += sz;
 	}
 	if (pgcnt % 2) {
-		err = mtd_write(mtd, addr, pgsize, &written, buf);
-		if (err || written != pgsize) {
+		err = mtdtest_write(mtd, addr, pgsize, buf);
+		if (err) {
 			pr_err("error: write failed at %#llx\n",
 			       addr);
-			if (!err)
-				err = -EINVAL;
 		}
 	}
 
@@ -192,40 +140,27 @@ static int write_eraseblock_by_2pages(int ebnum)
 
 static int read_eraseblock(int ebnum)
 {
-	size_t read;
-	int err = 0;
+	int err;
 	loff_t addr = ebnum * mtd->erasesize;
 
-	err = mtd_read(mtd, addr, mtd->erasesize, &read, iobuf);
-	/* Ignore corrected ECC errors */
-	if (mtd_is_bitflip(err))
-		err = 0;
-	if (err || read != mtd->erasesize) {
+	err = mtdtest_read(mtd, addr, mtd->erasesize, iobuf);
+	if (err)
 		pr_err("error: read failed at %#llx\n", addr);
-		if (!err)
-			err = -EINVAL;
-	}
 
 	return err;
 }
 
 static int read_eraseblock_by_page(int ebnum)
 {
-	size_t read;
 	int i, err = 0;
 	loff_t addr = ebnum * mtd->erasesize;
 	void *buf = iobuf;
 
 	for (i = 0; i < pgcnt; i++) {
-		err = mtd_read(mtd, addr, pgsize, &read, buf);
-		/* Ignore corrected ECC errors */
-		if (mtd_is_bitflip(err))
-			err = 0;
-		if (err || read != pgsize) {
+		err = mtdtest_read(mtd, addr, pgsize, buf);
+		if (err) {
 			pr_err("error: read failed at %#llx\n",
 			       addr);
-			if (!err)
-				err = -EINVAL;
 			break;
 		}
 		addr += pgsize;
@@ -237,53 +172,32 @@ static int read_eraseblock_by_page(int ebnum)
 
 static int read_eraseblock_by_2pages(int ebnum)
 {
-	size_t read, sz = pgsize * 2;
+	size_t sz = pgsize * 2;
 	int i, n = pgcnt / 2, err = 0;
 	loff_t addr = ebnum * mtd->erasesize;
 	void *buf = iobuf;
 
 	for (i = 0; i < n; i++) {
-		err = mtd_read(mtd, addr, sz, &read, buf);
-		/* Ignore corrected ECC errors */
-		if (mtd_is_bitflip(err))
-			err = 0;
-		if (err || read != sz) {
+		err = mtdtest_read(mtd, addr, sz, buf);
+		if (err) {
 			pr_err("error: read failed at %#llx\n",
 			       addr);
-			if (!err)
-				err = -EINVAL;
 			return err;
 		}
 		addr += sz;
 		buf += sz;
 	}
 	if (pgcnt % 2) {
-		err = mtd_read(mtd, addr, pgsize, &read, buf);
-		/* Ignore corrected ECC errors */
-		if (mtd_is_bitflip(err))
-			err = 0;
-		if (err || read != pgsize) {
+		err = mtdtest_read(mtd, addr, pgsize, buf);
+		if (err) {
 			pr_err("error: read failed at %#llx\n",
 			       addr);
-			if (!err)
-				err = -EINVAL;
 		}
 	}
 
 	return err;
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
 static inline void start_timing(void)
 {
 	do_gettimeofday(&start);
@@ -308,30 +222,6 @@ static long calc_speed(void)
 	return k;
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
-		goto out;
-
-	pr_info("scanning for bad eraseblocks\n");
-	for (i = 0; i < ebcnt; ++i) {
-		bbt[i] = is_block_bad(i) ? 1 : 0;
-		if (bbt[i])
-			bad += 1;
-		cond_resched();
-	}
-	pr_info("scanned %d eraseblocks, %d are bad\n", i, bad);
-out:
-	goodebcnt = ebcnt - bad;
-	return 0;
-}
-
 static int __init mtd_speedtest_init(void)
 {
 	int err, i, blocks, j, k;
@@ -387,11 +277,18 @@ static int __init mtd_speedtest_init(void)
 
 	prandom_bytes(iobuf, mtd->erasesize);
 
-	err = scan_for_bad_eraseblocks();
+	bbt = kzalloc(ebcnt, GFP_KERNEL);
+	if (!bbt)
+		goto out;
+	err = mtdtest_scan_for_bad_eraseblocks(mtd, bbt, ebcnt);
 	if (err)
 		goto out;
+	for (i = 0; i < ebcnt; i++) {
+		if (!bbt[i])
+			goodebcnt++;
+	}
 
-	err = erase_whole_device();
+	err = mtdtest_erase_whole_device(mtd, bbt, ebcnt);
 	if (err)
 		goto out;
 
@@ -425,7 +322,7 @@ static int __init mtd_speedtest_init(void)
 	speed = calc_speed();
 	pr_info("eraseblock read speed is %ld KiB/s\n", speed);
 
-	err = erase_whole_device();
+	err = mtdtest_erase_whole_device(mtd, bbt, ebcnt);
 	if (err)
 		goto out;
 
@@ -459,7 +356,7 @@ static int __init mtd_speedtest_init(void)
 	speed = calc_speed();
 	pr_info("page read speed is %ld KiB/s\n", speed);
 
-	err = erase_whole_device();
+	err = mtdtest_erase_whole_device(mtd, bbt, ebcnt);
 	if (err)
 		goto out;
 
@@ -496,14 +393,9 @@ static int __init mtd_speedtest_init(void)
 	/* Erase all eraseblocks */
 	pr_info("Testing erase speed\n");
 	start_timing();
-	for (i = 0; i < ebcnt; ++i) {
-		if (bbt[i])
-			continue;
-		err = erase_eraseblock(i);
-		if (err)
-			goto out;
-		cond_resched();
-	}
+	err = mtdtest_erase_whole_device(mtd, bbt, ebcnt);
+	if (err)
+		goto out;
 	stop_timing();
 	speed = calc_speed();
 	pr_info("erase speed is %ld KiB/s\n", speed);
-- 
1.8.3.1
