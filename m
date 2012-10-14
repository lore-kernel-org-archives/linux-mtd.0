Received: from mail-pa0-f49.google.com ([209.85.220.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TNKEA-0005RI-5C
 for linux-mtd@lists.infradead.org; Sun, 14 Oct 2012 09:11:19 +0000
Received: by mail-pa0-f49.google.com with SMTP id bi5so4186780pad.36
 for <linux-mtd@lists.infradead.org>; Sun, 14 Oct 2012 02:11:15 -0700 (PDT)
Message-ID: <507A8182.8070003@gmail.com>
Date: Sun, 14 Oct 2012 14:40:26 +0530
From: Vikram Narayanan <vikram186@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH RESEND 9/9] mtd: mtd_oobtest: printk -> pr_{info, err,
 crit}
References: <5075B105.4080701@gmail.com> <5075B36A.3050009@gmail.com>
In-Reply-To: <5075B36A.3050009@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From a1969e36d924285da0200c8b932b79165ff7df87 Mon Sep 17 00:00:00 2001
From: Brian Norris <computersforpeace@gmail.com>
Date: Wed, 26 Sep 2012 16:37:02 +0000
Subject: [PATCH RESEND 9/9] mtd: mtd_oobtest: printk -> pr_{info,err,crit}

Use pr_info() and pr_err() while defining pr_fmt(). This saves a few
characters, joins a few lines, and makes the code a little more readable
(and grep-able).

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Signed-off-by: Vikram Narayanan <vikram186@gmail.com>
---
Posting this patch with the headers, as Brian is the original author.
Please take this one and discard the previously posted patch.

 drivers/mtd/tests/mtd_oobtest.c |  171 +++++++++++++++++++--------------------
 1 files changed, 84 insertions(+), 87 deletions(-)

diff --git a/drivers/mtd/tests/mtd_oobtest.c b/drivers/mtd/tests/mtd_oobtest.c
index ed9b628..e86bb29 100644
--- a/drivers/mtd/tests/mtd_oobtest.c
+++ b/drivers/mtd/tests/mtd_oobtest.c
@@ -19,6 +19,8 @@
  * Author: Adrian Hunter <ext-adrian.hunter@nokia.com>
  */
 
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
 #include <asm/div64.h>
 #include <linux/init.h>
 #include <linux/module.h>
@@ -28,8 +30,6 @@
 #include <linux/slab.h>
 #include <linux/sched.h>
 
-#define PRINT_PREF KERN_INFO "mtd_oobtest: "
-
 static int dev = -EINVAL;
 module_param(dev, int, S_IRUGO);
 MODULE_PARM_DESC(dev, "MTD device number to use");
@@ -80,13 +80,12 @@ static int erase_eraseblock(int ebnum)
 
 	err = mtd_erase(mtd, &ei);
 	if (err) {
-		printk(PRINT_PREF "error %d while erasing EB %d\n", err, ebnum);
+		pr_err("error %d while erasing EB %d\n", err, ebnum);
 		return err;
 	}
 
 	if (ei.state == MTD_ERASE_FAILED) {
-		printk(PRINT_PREF "some erase error occurred at EB %d\n",
-		       ebnum);
+		pr_err("some erase error occurred at EB %d\n", ebnum);
 		return -EIO;
 	}
 
@@ -98,7 +97,7 @@ static int erase_whole_device(void)
 	int err;
 	unsigned int i;
 
-	printk(PRINT_PREF "erasing whole device\n");
+	pr_info("erasing whole device\n");
 	for (i = 0; i < ebcnt; ++i) {
 		if (bbt[i])
 			continue;
@@ -107,7 +106,7 @@ static int erase_whole_device(void)
 			return err;
 		cond_resched();
 	}
-	printk(PRINT_PREF "erased %u eraseblocks\n", i);
+	pr_info("erased %u eraseblocks\n", i);
 	return 0;
 }
 
@@ -141,9 +140,9 @@ static int write_eraseblock(int ebnum)
 		ops.oobbuf    = writebuf;
 		err = mtd_write_oob(mtd, addr, &ops);
 		if (err || ops.oobretlen != use_len) {
-			printk(PRINT_PREF "error: writeoob failed at %#llx\n",
+			pr_err("error: writeoob failed at %#llx\n",
 			       (long long)addr);
-			printk(PRINT_PREF "error: use_len %d, use_offset %d\n",
+			pr_err("error: use_len %d, use_offset %d\n",
 			       use_len, use_offset);
 			errcnt += 1;
 			return err ? err : -1;
@@ -160,7 +159,7 @@ static int write_whole_device(void)
 	int err;
 	unsigned int i;
 
-	printk(PRINT_PREF "writing OOBs of whole device\n");
+	pr_info("writing OOBs of whole device\n");
 	for (i = 0; i < ebcnt; ++i) {
 		if (bbt[i])
 			continue;
@@ -168,10 +167,10 @@ static int write_whole_device(void)
 		if (err)
 			return err;
 		if (i % 256 == 0)
-			printk(PRINT_PREF "written up to eraseblock %u\n", i);
+			pr_info("written up to eraseblock %u\n", i);
 		cond_resched();
 	}
-	printk(PRINT_PREF "written %u eraseblocks\n", i);
+	pr_info("written %u eraseblocks\n", i);
 	return 0;
 }
 
@@ -194,17 +193,17 @@ static int verify_eraseblock(int ebnum)
 		ops.oobbuf    = readbuf;
 		err = mtd_read_oob(mtd, addr, &ops);
 		if (err || ops.oobretlen != use_len) {
-			printk(PRINT_PREF "error: readoob failed at %#llx\n",
+			pr_err("error: readoob failed at %#llx\n",
 			       (long long)addr);
 			errcnt += 1;
 			return err ? err : -1;
 		}
 		if (memcmp(readbuf, writebuf, use_len)) {
-			printk(PRINT_PREF "error: verify failed at %#llx\n",
+			pr_err("error: verify failed at %#llx\n",
 			       (long long)addr);
 			errcnt += 1;
 			if (errcnt > 1000) {
-				printk(PRINT_PREF "error: too many errors\n");
+				pr_err("error: too many errors\n");
 				return -1;
 			}
 		}
@@ -221,29 +220,28 @@ static int verify_eraseblock(int ebnum)
 			ops.oobbuf    = readbuf;
 			err = mtd_read_oob(mtd, addr, &ops);
 			if (err || ops.oobretlen != mtd->ecclayout->oobavail) {
-				printk(PRINT_PREF "error: readoob failed at "
-				       "%#llx\n", (long long)addr);
+				pr_err("error: readoob failed at %#llx\n",
+						(long long)addr);
 				errcnt += 1;
 				return err ? err : -1;
 			}
 			if (memcmp(readbuf + use_offset, writebuf, use_len)) {
-				printk(PRINT_PREF "error: verify failed at "
-				       "%#llx\n", (long long)addr);
+				pr_err("error: verify failed at %#llx\n",
+						(long long)addr);
 				errcnt += 1;
 				if (errcnt > 1000) {
-					printk(PRINT_PREF "error: too many "
-					       "errors\n");
+					pr_err("error: too many errors\n");
 					return -1;
 				}
 			}
 			for (k = 0; k < use_offset; ++k)
 				if (readbuf[k] != 0xff) {
-					printk(PRINT_PREF "error: verify 0xff "
+					pr_err("error: verify 0xff "
 					       "failed at %#llx\n",
 					       (long long)addr);
 					errcnt += 1;
 					if (errcnt > 1000) {
-						printk(PRINT_PREF "error: too "
+						pr_err("error: too "
 						       "many errors\n");
 						return -1;
 					}
@@ -251,12 +249,12 @@ static int verify_eraseblock(int ebnum)
 			for (k = use_offset + use_len;
 			     k < mtd->ecclayout->oobavail; ++k)
 				if (readbuf[k] != 0xff) {
-					printk(PRINT_PREF "error: verify 0xff "
+					pr_err("error: verify 0xff "
 					       "failed at %#llx\n",
 					       (long long)addr);
 					errcnt += 1;
 					if (errcnt > 1000) {
-						printk(PRINT_PREF "error: too "
+						pr_err("error: too "
 						       "many errors\n");
 						return -1;
 					}
@@ -286,17 +284,17 @@ static int verify_eraseblock_in_one_go(int ebnum)
 	ops.oobbuf    = readbuf;
 	err = mtd_read_oob(mtd, addr, &ops);
 	if (err || ops.oobretlen != len) {
-		printk(PRINT_PREF "error: readoob failed at %#llx\n",
+		pr_err("error: readoob failed at %#llx\n",
 		       (long long)addr);
 		errcnt += 1;
 		return err ? err : -1;
 	}
 	if (memcmp(readbuf, writebuf, len)) {
-		printk(PRINT_PREF "error: verify failed at %#llx\n",
+		pr_err("error: verify failed at %#llx\n",
 		       (long long)addr);
 		errcnt += 1;
 		if (errcnt > 1000) {
-			printk(PRINT_PREF "error: too many errors\n");
+			pr_err("error: too many errors\n");
 			return -1;
 		}
 	}
@@ -309,7 +307,7 @@ static int verify_all_eraseblocks(void)
 	int err;
 	unsigned int i;
 
-	printk(PRINT_PREF "verifying all eraseblocks\n");
+	pr_info("verifying all eraseblocks\n");
 	for (i = 0; i < ebcnt; ++i) {
 		if (bbt[i])
 			continue;
@@ -317,10 +315,10 @@ static int verify_all_eraseblocks(void)
 		if (err)
 			return err;
 		if (i % 256 == 0)
-			printk(PRINT_PREF "verified up to eraseblock %u\n", i);
+			pr_info("verified up to eraseblock %u\n", i);
 		cond_resched();
 	}
-	printk(PRINT_PREF "verified %u eraseblocks\n", i);
+	pr_info("verified %u eraseblocks\n", i);
 	return 0;
 }
 
@@ -331,7 +329,7 @@ static int is_block_bad(int ebnum)
 
 	ret = mtd_block_isbad(mtd, addr);
 	if (ret)
-		printk(PRINT_PREF "block %d is bad\n", ebnum);
+		pr_info("block %d is bad\n", ebnum);
 	return ret;
 }
 
@@ -341,18 +339,18 @@ static int scan_for_bad_eraseblocks(void)
 
 	bbt = kmalloc(ebcnt, GFP_KERNEL);
 	if (!bbt) {
-		printk(PRINT_PREF "error: cannot allocate memory\n");
+		pr_err("error: cannot allocate memory\n");
 		return -ENOMEM;
 	}
 
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
 	return 0;
 }
 
@@ -368,22 +366,22 @@ static int __init mtd_oobtest_init(void)
 	printk(KERN_INFO "=================================================\n");
 
 	if (dev < 0) {
-		printk(PRINT_PREF "Please specify a valid mtd-device via module paramter\n");
-		printk(KERN_CRIT "CAREFUL: This test wipes all data on the specified MTD device!\n");
+		pr_info("Please specify a valid mtd-device via module paramter\n");
+		pr_crit(KERN_CRIT "CAREFUL: This test wipes all data on the specified MTD device!\n");
 		return -EINVAL;
 	}
 
-	printk(PRINT_PREF "MTD device: %d\n", dev);
+	pr_info("MTD device: %d\n", dev);
 
 	mtd = get_mtd_device(NULL, dev);
 	if (IS_ERR(mtd)) {
 		err = PTR_ERR(mtd);
-		printk(PRINT_PREF "error: cannot get MTD device\n");
+		pr_err("error: cannot get MTD device\n");
 		return err;
 	}
 
 	if (mtd->type != MTD_NANDFLASH) {
-		printk(PRINT_PREF "this test requires NAND flash\n");
+		pr_info("this test requires NAND flash\n");
 		goto out;
 	}
 
@@ -392,7 +390,7 @@ static int __init mtd_oobtest_init(void)
 	ebcnt = tmp;
 	pgcnt = mtd->erasesize / mtd->writesize;
 
-	printk(PRINT_PREF "MTD device size %llu, eraseblock size %u, "
+	pr_info("MTD device size %llu, eraseblock size %u, "
 	       "page size %u, count of eraseblocks %u, pages per "
 	       "eraseblock %u, OOB size %u\n",
 	       (unsigned long long)mtd->size, mtd->erasesize,
@@ -401,12 +399,12 @@ static int __init mtd_oobtest_init(void)
 	err = -ENOMEM;
 	readbuf = kmalloc(mtd->erasesize, GFP_KERNEL);
 	if (!readbuf) {
-		printk(PRINT_PREF "error: cannot allocate memory\n");
+		pr_err("error: cannot allocate memory\n");
 		goto out;
 	}
 	writebuf = kmalloc(mtd->erasesize, GFP_KERNEL);
 	if (!writebuf) {
-		printk(PRINT_PREF "error: cannot allocate memory\n");
+		pr_err("error: cannot allocate memory\n");
 		goto out;
 	}
 
@@ -420,7 +418,7 @@ static int __init mtd_oobtest_init(void)
 	vary_offset = 0;
 
 	/* First test: write all OOB, read it back and verify */
-	printk(PRINT_PREF "test 1 of 5\n");
+	pr_info("test 1 of 5\n");
 
 	err = erase_whole_device();
 	if (err)
@@ -440,7 +438,7 @@ static int __init mtd_oobtest_init(void)
 	 * Second test: write all OOB, a block at a time, read it back and
 	 * verify.
 	 */
-	printk(PRINT_PREF "test 2 of 5\n");
+	pr_info("test 2 of 5\n");
 
 	err = erase_whole_device();
 	if (err)
@@ -453,7 +451,7 @@ static int __init mtd_oobtest_init(void)
 
 	/* Check all eraseblocks */
 	simple_srand(3);
-	printk(PRINT_PREF "verifying all eraseblocks\n");
+	pr_info("verifying all eraseblocks\n");
 	for (i = 0; i < ebcnt; ++i) {
 		if (bbt[i])
 			continue;
@@ -461,16 +459,16 @@ static int __init mtd_oobtest_init(void)
 		if (err)
 			goto out;
 		if (i % 256 == 0)
-			printk(PRINT_PREF "verified up to eraseblock %u\n", i);
+			pr_info("verified up to eraseblock %u\n", i);
 		cond_resched();
 	}
-	printk(PRINT_PREF "verified %u eraseblocks\n", i);
+	pr_info("verified %u eraseblocks\n", i);
 
 	/*
 	 * Third test: write OOB at varying offsets and lengths, read it back
 	 * and verify.
 	 */
-	printk(PRINT_PREF "test 3 of 5\n");
+	pr_info("test 3 of 5\n");
 
 	err = erase_whole_device();
 	if (err)
@@ -503,7 +501,7 @@ static int __init mtd_oobtest_init(void)
 	vary_offset = 0;
 
 	/* Fourth test: try to write off end of device */
-	printk(PRINT_PREF "test 4 of 5\n");
+	pr_info("test 4 of 5\n");
 
 	err = erase_whole_device();
 	if (err)
@@ -522,14 +520,14 @@ static int __init mtd_oobtest_init(void)
 	ops.ooboffs   = mtd->ecclayout->oobavail;
 	ops.datbuf    = NULL;
 	ops.oobbuf    = writebuf;
-	printk(PRINT_PREF "attempting to start write past end of OOB\n");
-	printk(PRINT_PREF "an error is expected...\n");
+	pr_info("attempting to start write past end of OOB\n");
+	pr_info("an error is expected...\n");
 	err = mtd_write_oob(mtd, addr0, &ops);
 	if (err) {
-		printk(PRINT_PREF "error occurred as expected\n");
+		pr_info("error occurred as expected\n");
 		err = 0;
 	} else {
-		printk(PRINT_PREF "error: can write past end of OOB\n");
+		pr_err("error: can write past end of OOB\n");
 		errcnt += 1;
 	}
 
@@ -542,19 +540,19 @@ static int __init mtd_oobtest_init(void)
 	ops.ooboffs   = mtd->ecclayout->oobavail;
 	ops.datbuf    = NULL;
 	ops.oobbuf    = readbuf;
-	printk(PRINT_PREF "attempting to start read past end of OOB\n");
-	printk(PRINT_PREF "an error is expected...\n");
+	pr_info("attempting to start read past end of OOB\n");
+	pr_info("an error is expected...\n");
 	err = mtd_read_oob(mtd, addr0, &ops);
 	if (err) {
-		printk(PRINT_PREF "error occurred as expected\n");
+		pr_info("error occurred as expected\n");
 		err = 0;
 	} else {
-		printk(PRINT_PREF "error: can read past end of OOB\n");
+		pr_err("error: can read past end of OOB\n");
 		errcnt += 1;
 	}
 
 	if (bbt[ebcnt - 1])
-		printk(PRINT_PREF "skipping end of device tests because last "
+		pr_info("skipping end of device tests because last "
 		       "block is bad\n");
 	else {
 		/* Attempt to write off end of device */
@@ -566,14 +564,14 @@ static int __init mtd_oobtest_init(void)
 		ops.ooboffs   = 0;
 		ops.datbuf    = NULL;
 		ops.oobbuf    = writebuf;
-		printk(PRINT_PREF "attempting to write past end of device\n");
-		printk(PRINT_PREF "an error is expected...\n");
+		pr_info("attempting to write past end of device\n");
+		pr_info("an error is expected...\n");
 		err = mtd_write_oob(mtd, mtd->size - mtd->writesize, &ops);
 		if (err) {
-			printk(PRINT_PREF "error occurred as expected\n");
+			pr_info("error occurred as expected\n");
 			err = 0;
 		} else {
-			printk(PRINT_PREF "error: wrote past end of device\n");
+			pr_err("error: wrote past end of device\n");
 			errcnt += 1;
 		}
 
@@ -586,14 +584,14 @@ static int __init mtd_oobtest_init(void)
 		ops.ooboffs   = 0;
 		ops.datbuf    = NULL;
 		ops.oobbuf    = readbuf;
-		printk(PRINT_PREF "attempting to read past end of device\n");
-		printk(PRINT_PREF "an error is expected...\n");
+		pr_info("attempting to read past end of device\n");
+		pr_info("an error is expected...\n");
 		err = mtd_read_oob(mtd, mtd->size - mtd->writesize, &ops);
 		if (err) {
-			printk(PRINT_PREF "error occurred as expected\n");
+			pr_info("error occurred as expected\n");
 			err = 0;
 		} else {
-			printk(PRINT_PREF "error: read past end of device\n");
+			pr_err("error: read past end of device\n");
 			errcnt += 1;
 		}
 
@@ -610,14 +608,14 @@ static int __init mtd_oobtest_init(void)
 		ops.ooboffs   = 1;
 		ops.datbuf    = NULL;
 		ops.oobbuf    = writebuf;
-		printk(PRINT_PREF "attempting to write past end of device\n");
-		printk(PRINT_PREF "an error is expected...\n");
+		pr_info("attempting to write past end of device\n");
+		pr_info("an error is expected...\n");
 		err = mtd_write_oob(mtd, mtd->size - mtd->writesize, &ops);
 		if (err) {
-			printk(PRINT_PREF "error occurred as expected\n");
+			pr_info("error occurred as expected\n");
 			err = 0;
 		} else {
-			printk(PRINT_PREF "error: wrote past end of device\n");
+			pr_err("error: wrote past end of device\n");
 			errcnt += 1;
 		}
 
@@ -630,20 +628,20 @@ static int __init mtd_oobtest_init(void)
 		ops.ooboffs   = 1;
 		ops.datbuf    = NULL;
 		ops.oobbuf    = readbuf;
-		printk(PRINT_PREF "attempting to read past end of device\n");
-		printk(PRINT_PREF "an error is expected...\n");
+		pr_info("attempting to read past end of device\n");
+		pr_info("an error is expected...\n");
 		err = mtd_read_oob(mtd, mtd->size - mtd->writesize, &ops);
 		if (err) {
-			printk(PRINT_PREF "error occurred as expected\n");
+			pr_info("error occurred as expected\n");
 			err = 0;
 		} else {
-			printk(PRINT_PREF "error: read past end of device\n");
+			pr_err("error: read past end of device\n");
 			errcnt += 1;
 		}
 	}
 
 	/* Fifth test: write / read across block boundaries */
-	printk(PRINT_PREF "test 5 of 5\n");
+	pr_info("test 5 of 5\n");
 
 	/* Erase all eraseblocks */
 	err = erase_whole_device();
@@ -652,7 +650,7 @@ static int __init mtd_oobtest_init(void)
 
 	/* Write all eraseblocks */
 	simple_srand(11);
-	printk(PRINT_PREF "writing OOBs of whole device\n");
+	pr_info("writing OOBs of whole device\n");
 	for (i = 0; i < ebcnt - 1; ++i) {
 		int cnt = 2;
 		int pg;
@@ -674,17 +672,16 @@ static int __init mtd_oobtest_init(void)
 			if (err)
 				goto out;
 			if (i % 256 == 0)
-				printk(PRINT_PREF "written up to eraseblock "
-				       "%u\n", i);
+				pr_info("written up to eraseblock %u\n", i);
 			cond_resched();
 			addr += mtd->writesize;
 		}
 	}
-	printk(PRINT_PREF "written %u eraseblocks\n", i);
+	pr_info("written %u eraseblocks\n", i);
 
 	/* Check all eraseblocks */
 	simple_srand(11);
-	printk(PRINT_PREF "verifying all eraseblocks\n");
+	pr_info("verifying all eraseblocks\n");
 	for (i = 0; i < ebcnt - 1; ++i) {
 		if (bbt[i] || bbt[i + 1])
 			continue;
@@ -702,28 +699,28 @@ static int __init mtd_oobtest_init(void)
 		if (err)
 			goto out;
 		if (memcmp(readbuf, writebuf, mtd->ecclayout->oobavail * 2)) {
-			printk(PRINT_PREF "error: verify failed at %#llx\n",
+			pr_err("error: verify failed at %#llx\n",
 			       (long long)addr);
 			errcnt += 1;
 			if (errcnt > 1000) {
-				printk(PRINT_PREF "error: too many errors\n");
+				pr_err("error: too many errors\n");
 				goto out;
 			}
 		}
 		if (i % 256 == 0)
-			printk(PRINT_PREF "verified up to eraseblock %u\n", i);
+			pr_info("verified up to eraseblock %u\n", i);
 		cond_resched();
 	}
-	printk(PRINT_PREF "verified %u eraseblocks\n", i);
+	pr_info("verified %u eraseblocks\n", i);
 
-	printk(PRINT_PREF "finished with %d errors\n", errcnt);
+	pr_info("finished with %d errors\n", errcnt);
 out:
 	kfree(bbt);
 	kfree(writebuf);
 	kfree(readbuf);
 	put_mtd_device(mtd);
 	if (err)
-		printk(PRINT_PREF "error %d occurred\n", err);
+		pr_info("error %d occurred\n", err);
 	printk(KERN_INFO "=================================================\n");
 	return err;
 }
-- 
1.7.4.1
