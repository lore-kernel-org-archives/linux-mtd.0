Received: from mail-pa0-f49.google.com ([209.85.220.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TJ3W9-0001Rz-OO
 for linux-mtd@lists.infradead.org; Tue, 02 Oct 2012 14:32:14 +0000
Received: by mail-pa0-f49.google.com with SMTP id bi5so5717913pad.36
 for <linux-mtd@lists.infradead.org>; Tue, 02 Oct 2012 07:32:13 -0700 (PDT)
Message-ID: <506AFAE1.40809@gmail.com>
Date: Tue, 02 Oct 2012 20:02:01 +0530
From: Vikram Narayanan <vikram186@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH 6/8] mtd_speedtest: Replace printk with pr_{info,crit}
References: <506AF985.30104@gmail.com>
In-Reply-To: <506AF985.30104@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>,
 Adrian Hunter <ext-adrian.hunter@nokia.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Remove PRINT_PREF macro and use pr_fmt to add the prefix

Signed-off-by: Vikram Narayanan <vikram186@gmail.com>
---
 drivers/mtd/tests/mtd_speedtest.c |   80 ++++++++++++++++++------------------
 1 files changed, 40 insertions(+), 40 deletions(-)

diff --git a/drivers/mtd/tests/mtd_speedtest.c b/drivers/mtd/tests/mtd_speedtest.c
index e3518b4..0ffa026 100644
--- a/drivers/mtd/tests/mtd_speedtest.c
+++ b/drivers/mtd/tests/mtd_speedtest.c
@@ -19,6 +19,8 @@
  * Author: Adrian Hunter <adrian.hunter@nokia.com>
  */
 
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
@@ -29,8 +31,6 @@
 #include <linux/random.h>
 #include "mtd_tests.h"
 
-#define PRINT_PREF KERN_INFO "mtd_speedtest: "
-
 static int dev = -EINVAL;
 module_param(dev, int, S_IRUGO);
 MODULE_PARM_DESC(dev, "MTD device number to use");
@@ -82,7 +82,7 @@ static int write_eraseblock(int ebnum)
 
 	err = mtd_write(mtd, addr, mtd->erasesize, &written, iobuf);
 	if (err || written != mtd->erasesize) {
-		printk(PRINT_PREF "error: write failed at %#llx\n", addr);
+		pr_info("error: write failed at %#llx\n", addr);
 		if (!err)
 			err = -EINVAL;
 	}
@@ -100,7 +100,7 @@ static int write_eraseblock_by_page(int ebnum)
 	for (i = 0; i < pgcnt; i++) {
 		err = mtd_write(mtd, addr, pgsize, &written, buf);
 		if (err || written != pgsize) {
-			printk(PRINT_PREF "error: write failed at %#llx\n",
+			pr_info("error: write failed at %#llx\n",
 			       addr);
 			if (!err)
 				err = -EINVAL;
@@ -123,7 +123,7 @@ static int write_eraseblock_by_2pages(int ebnum)
 	for (i = 0; i < n; i++) {
 		err = mtd_write(mtd, addr, sz, &written, buf);
 		if (err || written != sz) {
-			printk(PRINT_PREF "error: write failed at %#llx\n",
+			pr_info("error: write failed at %#llx\n",
 			       addr);
 			if (!err)
 				err = -EINVAL;
@@ -135,7 +135,7 @@ static int write_eraseblock_by_2pages(int ebnum)
 	if (pgcnt % 2) {
 		err = mtd_write(mtd, addr, pgsize, &written, buf);
 		if (err || written != pgsize) {
-			printk(PRINT_PREF "error: write failed at %#llx\n",
+			pr_info("error: write failed at %#llx\n",
 			       addr);
 			if (!err)
 				err = -EINVAL;
@@ -156,7 +156,7 @@ static int read_eraseblock(int ebnum)
 	if (mtd_is_bitflip(err))
 		err = 0;
 	if (err || read != mtd->erasesize) {
-		printk(PRINT_PREF "error: read failed at %#llx\n", addr);
+		pr_info("error: read failed at %#llx\n", addr);
 		if (!err)
 			err = -EINVAL;
 	}
@@ -177,7 +177,7 @@ static int read_eraseblock_by_page(int ebnum)
 		if (mtd_is_bitflip(err))
 			err = 0;
 		if (err || read != pgsize) {
-			printk(PRINT_PREF "error: read failed at %#llx\n",
+			pr_info("error: read failed at %#llx\n",
 			       addr);
 			if (!err)
 				err = -EINVAL;
@@ -203,7 +203,7 @@ static int read_eraseblock_by_2pages(int ebnum)
 		if (mtd_is_bitflip(err))
 			err = 0;
 		if (err || read != sz) {
-			printk(PRINT_PREF "error: read failed at %#llx\n",
+			pr_info("error: read failed at %#llx\n",
 			       addr);
 			if (!err)
 				err = -EINVAL;
@@ -218,7 +218,7 @@ static int read_eraseblock_by_2pages(int ebnum)
 		if (mtd_is_bitflip(err))
 			err = 0;
 		if (err || read != pgsize) {
-			printk(PRINT_PREF "error: read failed at %#llx\n",
+			pr_info("error: read failed at %#llx\n",
 			       addr);
 			if (!err)
 				err = -EINVAL;
@@ -235,7 +235,7 @@ static int is_block_bad(int ebnum)
 
 	ret = mtd_block_isbad(mtd, addr);
 	if (ret)
-		printk(PRINT_PREF "block %d is bad\n", ebnum);
+		pr_info("block %d is bad\n", ebnum);
 	return ret;
 }
 
@@ -269,21 +269,21 @@ static int scan_for_bad_eraseblocks(void)
 
 	bbt = kzalloc(ebcnt, GFP_KERNEL);
 	if (!bbt) {
-		printk(PRINT_PREF "error: cannot allocate memory\n");
+		pr_info("error: cannot allocate memory\n");
 		return -ENOMEM;
 	}
 
 	if (!mtd_can_have_bb(mtd))
 		goto out;
 
-	printk(PRINT_PREF "scanning for bad eraseblocks\n");
+	pr_info("scanning for bad eraseblocks\n");
 	for (i = 0; i < ebcnt; ++i) {
 		bbt[i] = is_block_bad(i) ? 1 : 0;
 		if (bbt[i])
 			bad += 1;
 		cond_resched();
 	}
-	printk(PRINT_PREF "scanned %d eraseblocks, %d are bad\n", i, bad);
+	pr_info("scanned %d eraseblocks, %d are bad\n", i, bad);
 out:
 	goodebcnt = ebcnt - bad;
 	return 0;
@@ -299,25 +299,25 @@ static int __init mtd_speedtest_init(void)
 	printk(KERN_INFO "=================================================\n");
 
 	if (dev < 0) {
-		printk(PRINT_PREF "Please specify a valid mtd-device via module paramter\n");
-		printk(KERN_CRIT "CAREFUL: This test wipes all data on the specified MTD device!\n");
+		pr_info("Please specify a valid mtd-device via module paramter\n");
+		pr_crit("CAREFUL: This test wipes all data on the specified MTD device!\n");
 		return -EINVAL;
 	}
 
 	if (count)
-		printk(PRINT_PREF "MTD device: %d    count: %d\n", dev, count);
+		pr_info("MTD device: %d    count: %d\n", dev, count);
 	else
-		printk(PRINT_PREF "MTD device: %d\n", dev);
+		pr_info("MTD device: %d\n", dev);
 
 	mtd = get_mtd_device(NULL, dev);
 	if (IS_ERR(mtd)) {
 		err = PTR_ERR(mtd);
-		printk(PRINT_PREF "error: cannot get MTD device\n");
+		pr_info("error: cannot get MTD device\n");
 		return err;
 	}
 
 	if (mtd->writesize == 1) {
-		printk(PRINT_PREF "not NAND flash, assume page size is 512 "
+		pr_info("not NAND flash, assume page size is 512 "
 		       "bytes.\n");
 		pgsize = 512;
 	} else
@@ -328,7 +328,7 @@ static int __init mtd_speedtest_init(void)
 	ebcnt = tmp;
 	pgcnt = mtd->erasesize / pgsize;
 
-	printk(PRINT_PREF "MTD device size %llu, eraseblock size %u, "
+	pr_info("MTD device size %llu, eraseblock size %u, "
 	       "page size %u, count of eraseblocks %u, pages per "
 	       "eraseblock %u, OOB size %u\n",
 	       (unsigned long long)mtd->size, mtd->erasesize,
@@ -340,7 +340,7 @@ static int __init mtd_speedtest_init(void)
 	err = -ENOMEM;
 	iobuf = kmalloc(mtd->erasesize, GFP_KERNEL);
 	if (!iobuf) {
-		printk(PRINT_PREF "error: cannot allocate memory\n");
+		pr_info("error: cannot allocate memory\n");
 		goto out;
 	}
 
@@ -355,7 +355,7 @@ static int __init mtd_speedtest_init(void)
 		goto out;
 
 	/* Write all eraseblocks, 1 eraseblock at a time */
-	printk(PRINT_PREF "testing eraseblock write speed\n");
+	pr_info("testing eraseblock write speed\n");
 	start_timing();
 	for (i = 0; i < ebcnt; ++i) {
 		if (bbt[i])
@@ -367,10 +367,10 @@ static int __init mtd_speedtest_init(void)
 	}
 	stop_timing();
 	speed = calc_speed();
-	printk(PRINT_PREF "eraseblock write speed is %ld KiB/s\n", speed);
+	pr_info("eraseblock write speed is %ld KiB/s\n", speed);
 
 	/* Read all eraseblocks, 1 eraseblock at a time */
-	printk(PRINT_PREF "testing eraseblock read speed\n");
+	pr_info("testing eraseblock read speed\n");
 	start_timing();
 	for (i = 0; i < ebcnt; ++i) {
 		if (bbt[i])
@@ -382,14 +382,14 @@ static int __init mtd_speedtest_init(void)
 	}
 	stop_timing();
 	speed = calc_speed();
-	printk(PRINT_PREF "eraseblock read speed is %ld KiB/s\n", speed);
+	pr_info("eraseblock read speed is %ld KiB/s\n", speed);
 
 	err = erase_whole_device();
 	if (err)
 		goto out;
 
 	/* Write all eraseblocks, 1 page at a time */
-	printk(PRINT_PREF "testing page write speed\n");
+	pr_info("testing page write speed\n");
 	start_timing();
 	for (i = 0; i < ebcnt; ++i) {
 		if (bbt[i])
@@ -401,10 +401,10 @@ static int __init mtd_speedtest_init(void)
 	}
 	stop_timing();
 	speed = calc_speed();
-	printk(PRINT_PREF "page write speed is %ld KiB/s\n", speed);
+	pr_info("page write speed is %ld KiB/s\n", speed);
 
 	/* Read all eraseblocks, 1 page at a time */
-	printk(PRINT_PREF "testing page read speed\n");
+	pr_info("testing page read speed\n");
 	start_timing();
 	for (i = 0; i < ebcnt; ++i) {
 		if (bbt[i])
@@ -416,14 +416,14 @@ static int __init mtd_speedtest_init(void)
 	}
 	stop_timing();
 	speed = calc_speed();
-	printk(PRINT_PREF "page read speed is %ld KiB/s\n", speed);
+	pr_info("page read speed is %ld KiB/s\n", speed);
 
 	err = erase_whole_device();
 	if (err)
 		goto out;
 
 	/* Write all eraseblocks, 2 pages at a time */
-	printk(PRINT_PREF "testing 2 page write speed\n");
+	pr_info("testing 2 page write speed\n");
 	start_timing();
 	for (i = 0; i < ebcnt; ++i) {
 		if (bbt[i])
@@ -435,10 +435,10 @@ static int __init mtd_speedtest_init(void)
 	}
 	stop_timing();
 	speed = calc_speed();
-	printk(PRINT_PREF "2 page write speed is %ld KiB/s\n", speed);
+	pr_info("2 page write speed is %ld KiB/s\n", speed);
 
 	/* Read all eraseblocks, 2 pages at a time */
-	printk(PRINT_PREF "testing 2 page read speed\n");
+	pr_info("testing 2 page read speed\n");
 	start_timing();
 	for (i = 0; i < ebcnt; ++i) {
 		if (bbt[i])
@@ -450,10 +450,10 @@ static int __init mtd_speedtest_init(void)
 	}
 	stop_timing();
 	speed = calc_speed();
-	printk(PRINT_PREF "2 page read speed is %ld KiB/s\n", speed);
+	pr_info("2 page read speed is %ld KiB/s\n", speed);
 
 	/* Erase all eraseblocks */
-	printk(PRINT_PREF "Testing erase speed\n");
+	pr_info("Testing erase speed\n");
 	start_timing();
 	for (i = 0; i < ebcnt; ++i) {
 		if (bbt[i])
@@ -465,12 +465,12 @@ static int __init mtd_speedtest_init(void)
 	}
 	stop_timing();
 	speed = calc_speed();
-	printk(PRINT_PREF "erase speed is %ld KiB/s\n", speed);
+	pr_info("erase speed is %ld KiB/s\n", speed);
 
 	/* Multi-block erase all eraseblocks */
 	for (k = 1; k < 7; k++) {
 		blocks = 1 << k;
-		printk(PRINT_PREF "Testing %dx multi-block erase speed\n",
+		pr_info("Testing %dx multi-block erase speed\n",
 		       blocks);
 		start_timing();
 		for (i = 0; i < ebcnt; ) {
@@ -489,16 +489,16 @@ static int __init mtd_speedtest_init(void)
 		}
 		stop_timing();
 		speed = calc_speed();
-		printk(PRINT_PREF "%dx multi-block erase speed is %ld KiB/s\n",
+		pr_info("%dx multi-block erase speed is %ld KiB/s\n",
 		       blocks, speed);
 	}
-	printk(PRINT_PREF "finished\n");
+	pr_info("finished\n");
 out:
 	kfree(iobuf);
 	kfree(bbt);
 	put_mtd_device(mtd);
 	if (err)
-		printk(PRINT_PREF "error %d occurred\n", err);
+		pr_info("error %d occurred\n", err);
 	printk(KERN_INFO "=================================================\n");
 	return err;
 }
-- 
1.7.4.1
