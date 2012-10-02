Received: from mail-pa0-f49.google.com ([209.85.220.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TJ3VL-0001MC-1o
 for linux-mtd@lists.infradead.org; Tue, 02 Oct 2012 14:31:24 +0000
Received: by padbi5 with SMTP id bi5so5717395pad.36
 for <linux-mtd@lists.infradead.org>; Tue, 02 Oct 2012 07:31:22 -0700 (PDT)
Message-ID: <506AFA99.7000106@gmail.com>
Date: Tue, 02 Oct 2012 20:00:49 +0530
From: Vikram Narayanan <vikram186@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH 4/8] mtd_subpagetest: Replace printk with pr_info
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
 drivers/mtd/tests/mtd_subpagetest.c |  118 +++++++++++++++++-----------------
 1 files changed, 59 insertions(+), 59 deletions(-)

diff --git a/drivers/mtd/tests/mtd_subpagetest.c b/drivers/mtd/tests/mtd_subpagetest.c
index 642f958..06df151 100644
--- a/drivers/mtd/tests/mtd_subpagetest.c
+++ b/drivers/mtd/tests/mtd_subpagetest.c
@@ -19,6 +19,8 @@
  *
  */
 
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
@@ -28,8 +30,6 @@
 #include <linux/sched.h>
 #include "mtd_tests.h"
 
-#define PRINT_PREF KERN_INFO "mtd_subpagetest: "
-
 static int dev = -EINVAL;
 module_param(dev, int, S_IRUGO);
 MODULE_PARM_DESC(dev, "MTD device number to use");
@@ -75,7 +75,7 @@ static int erase_whole_device(void)
 	int err;
 	unsigned int i;
 
-	printk(PRINT_PREF "erasing whole device\n");
+	pr_info("erasing whole device\n");
 	for (i = 0; i < ebcnt; ++i) {
 		if (bbt[i])
 			continue;
@@ -84,7 +84,7 @@ static int erase_whole_device(void)
 			return err;
 		cond_resched();
 	}
-	printk(PRINT_PREF "erased %u eraseblocks\n", i);
+	pr_info("erased %u eraseblocks\n", i);
 	return 0;
 }
 
@@ -97,11 +97,11 @@ static int write_eraseblock(int ebnum)
 	set_random_data(writebuf, subpgsize);
 	err = mtd_write(mtd, addr, subpgsize, &written, writebuf);
 	if (unlikely(err || written != subpgsize)) {
-		printk(PRINT_PREF "error: write failed at %#llx\n",
+		pr_info("error: write failed at %#llx\n",
 		       (long long)addr);
 		if (written != subpgsize) {
-			printk(PRINT_PREF "  write size: %#x\n", subpgsize);
-			printk(PRINT_PREF "  written: %#zx\n", written);
+			pr_info("  write size: %#x\n", subpgsize);
+			pr_info("  written: %#zx\n", written);
 		}
 		return err ? err : -1;
 	}
@@ -111,11 +111,11 @@ static int write_eraseblock(int ebnum)
 	set_random_data(writebuf, subpgsize);
 	err = mtd_write(mtd, addr, subpgsize, &written, writebuf);
 	if (unlikely(err || written != subpgsize)) {
-		printk(PRINT_PREF "error: write failed at %#llx\n",
+		pr_info("error: write failed at %#llx\n",
 		       (long long)addr);
 		if (written != subpgsize) {
-			printk(PRINT_PREF "  write size: %#x\n", subpgsize);
-			printk(PRINT_PREF "  written: %#zx\n", written);
+			pr_info("  write size: %#x\n", subpgsize);
+			pr_info("  written: %#zx\n", written);
 		}
 		return err ? err : -1;
 	}
@@ -135,12 +135,12 @@ static int write_eraseblock2(int ebnum)
 		set_random_data(writebuf, subpgsize * k);
 		err = mtd_write(mtd, addr, subpgsize * k, &written, writebuf);
 		if (unlikely(err || written != subpgsize * k)) {
-			printk(PRINT_PREF "error: write failed at %#llx\n",
+			pr_info("error: write failed at %#llx\n",
 			       (long long)addr);
 			if (written != subpgsize) {
-				printk(PRINT_PREF "  write size: %#x\n",
+				pr_info("  write size: %#x\n",
 				       subpgsize * k);
-				printk(PRINT_PREF "  written: %#08zx\n",
+				pr_info("  written: %#08zx\n",
 				       written);
 			}
 			return err ? err : -1;
@@ -173,23 +173,23 @@ static int verify_eraseblock(int ebnum)
 	err = mtd_read(mtd, addr, subpgsize, &read, readbuf);
 	if (unlikely(err || read != subpgsize)) {
 		if (mtd_is_bitflip(err) && read == subpgsize) {
-			printk(PRINT_PREF "ECC correction at %#llx\n",
+			pr_info("ECC correction at %#llx\n",
 			       (long long)addr);
 			err = 0;
 		} else {
-			printk(PRINT_PREF "error: read failed at %#llx\n",
+			pr_info("error: read failed at %#llx\n",
 			       (long long)addr);
 			return err ? err : -1;
 		}
 	}
 	if (unlikely(memcmp(readbuf, writebuf, subpgsize))) {
-		printk(PRINT_PREF "error: verify failed at %#llx\n",
+		pr_info("error: verify failed at %#llx\n",
 		       (long long)addr);
-		printk(PRINT_PREF "------------- written----------------\n");
+		pr_info("------------- written----------------\n");
 		print_subpage(writebuf);
-		printk(PRINT_PREF "------------- read ------------------\n");
+		pr_info("------------- read ------------------\n");
 		print_subpage(readbuf);
-		printk(PRINT_PREF "-------------------------------------\n");
+		pr_info("-------------------------------------\n");
 		errcnt += 1;
 	}
 
@@ -200,23 +200,23 @@ static int verify_eraseblock(int ebnum)
 	err = mtd_read(mtd, addr, subpgsize, &read, readbuf);
 	if (unlikely(err || read != subpgsize)) {
 		if (mtd_is_bitflip(err) && read == subpgsize) {
-			printk(PRINT_PREF "ECC correction at %#llx\n",
+			pr_info("ECC correction at %#llx\n",
 			       (long long)addr);
 			err = 0;
 		} else {
-			printk(PRINT_PREF "error: read failed at %#llx\n",
+			pr_info("error: read failed at %#llx\n",
 			       (long long)addr);
 			return err ? err : -1;
 		}
 	}
 	if (unlikely(memcmp(readbuf, writebuf, subpgsize))) {
-		printk(PRINT_PREF "error: verify failed at %#llx\n",
+		pr_info("error: verify failed at %#llx\n",
 		       (long long)addr);
-		printk(PRINT_PREF "------------- written----------------\n");
+		pr_info("------------- written----------------\n");
 		print_subpage(writebuf);
-		printk(PRINT_PREF "------------- read ------------------\n");
+		pr_info("------------- read ------------------\n");
 		print_subpage(readbuf);
-		printk(PRINT_PREF "-------------------------------------\n");
+		pr_info("-------------------------------------\n");
 		errcnt += 1;
 	}
 
@@ -237,17 +237,17 @@ static int verify_eraseblock2(int ebnum)
 		err = mtd_read(mtd, addr, subpgsize * k, &read, readbuf);
 		if (unlikely(err || read != subpgsize * k)) {
 			if (mtd_is_bitflip(err) && read == subpgsize * k) {
-				printk(PRINT_PREF "ECC correction at %#llx\n",
+				pr_info("ECC correction at %#llx\n",
 				       (long long)addr);
 				err = 0;
 			} else {
-				printk(PRINT_PREF "error: read failed at "
+				pr_info("error: read failed at "
 				       "%#llx\n", (long long)addr);
 				return err ? err : -1;
 			}
 		}
 		if (unlikely(memcmp(readbuf, writebuf, subpgsize * k))) {
-			printk(PRINT_PREF "error: verify failed at %#llx\n",
+			pr_info("error: verify failed at %#llx\n",
 			       (long long)addr);
 			errcnt += 1;
 		}
@@ -270,17 +270,17 @@ static int verify_eraseblock_ff(int ebnum)
 		err = mtd_read(mtd, addr, subpgsize, &read, readbuf);
 		if (unlikely(err || read != subpgsize)) {
 			if (mtd_is_bitflip(err) && read == subpgsize) {
-				printk(PRINT_PREF "ECC correction at %#llx\n",
+				pr_info("ECC correction at %#llx\n",
 				       (long long)addr);
 				err = 0;
 			} else {
-				printk(PRINT_PREF "error: read failed at "
+				pr_info("error: read failed at "
 				       "%#llx\n", (long long)addr);
 				return err ? err : -1;
 			}
 		}
 		if (unlikely(memcmp(readbuf, writebuf, subpgsize))) {
-			printk(PRINT_PREF "error: verify 0xff failed at "
+			pr_info("error: verify 0xff failed at "
 			       "%#llx\n", (long long)addr);
 			errcnt += 1;
 		}
@@ -295,7 +295,7 @@ static int verify_all_eraseblocks_ff(void)
 	int err;
 	unsigned int i;
 
-	printk(PRINT_PREF "verifying all eraseblocks for 0xff\n");
+	pr_info("verifying all eraseblocks for 0xff\n");
 	for (i = 0; i < ebcnt; ++i) {
 		if (bbt[i])
 			continue;
@@ -303,10 +303,10 @@ static int verify_all_eraseblocks_ff(void)
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
 
@@ -317,7 +317,7 @@ static int is_block_bad(int ebnum)
 
 	ret = mtd_block_isbad(mtd, addr);
 	if (ret)
-		printk(PRINT_PREF "block %d is bad\n", ebnum);
+		pr_info("block %d is bad\n", ebnum);
 	return ret;
 }
 
@@ -327,18 +327,18 @@ static int scan_for_bad_eraseblocks(void)
 
 	bbt = kzalloc(ebcnt, GFP_KERNEL);
 	if (!bbt) {
-		printk(PRINT_PREF "error: cannot allocate memory\n");
+		pr_info("error: cannot allocate memory\n");
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
 
@@ -352,22 +352,22 @@ static int __init mtd_subpagetest_init(void)
 	printk(KERN_INFO "=================================================\n");
 
 	if (dev < 0) {
-		printk(PRINT_PREF "Please specify a valid mtd-device via module paramter\n");
+		pr_info("Please specify a valid mtd-device via module paramter\n");
 		printk(KERN_CRIT "CAREFUL: This test wipes all data on the specified MTD device!\n");
 		return -EINVAL;
 	}
 
-	printk(PRINT_PREF "MTD device: %d\n", dev);
+	pr_info("MTD device: %d\n", dev);
 
 	mtd = get_mtd_device(NULL, dev);
 	if (IS_ERR(mtd)) {
 		err = PTR_ERR(mtd);
-		printk(PRINT_PREF "error: cannot get MTD device\n");
+		pr_info("error: cannot get MTD device\n");
 		return err;
 	}
 
 	if (mtd->type != MTD_NANDFLASH) {
-		printk(PRINT_PREF "this test requires NAND flash\n");
+		pr_info("this test requires NAND flash\n");
 		goto out;
 	}
 
@@ -377,7 +377,7 @@ static int __init mtd_subpagetest_init(void)
 	ebcnt = tmp;
 	pgcnt = mtd->erasesize / mtd->writesize;
 
-	printk(PRINT_PREF "MTD device size %llu, eraseblock size %u, "
+	pr_info("MTD device size %llu, eraseblock size %u, "
 	       "page size %u, subpage size %u, count of eraseblocks %u, "
 	       "pages per eraseblock %u, OOB size %u\n",
 	       (unsigned long long)mtd->size, mtd->erasesize,
@@ -387,12 +387,12 @@ static int __init mtd_subpagetest_init(void)
 	bufsize = subpgsize * 32;
 	writebuf = kmalloc(bufsize, GFP_KERNEL);
 	if (!writebuf) {
-		printk(PRINT_PREF "error: cannot allocate memory\n");
+		pr_info("error: cannot allocate memory\n");
 		goto out;
 	}
 	readbuf = kmalloc(bufsize, GFP_KERNEL);
 	if (!readbuf) {
-		printk(PRINT_PREF "error: cannot allocate memory\n");
+		pr_info("error: cannot allocate memory\n");
 		goto out;
 	}
 
@@ -404,7 +404,7 @@ static int __init mtd_subpagetest_init(void)
 	if (err)
 		goto out;
 
-	printk(PRINT_PREF "writing whole device\n");
+	pr_info("writing whole device\n");
 	simple_srand(1);
 	for (i = 0; i < ebcnt; ++i) {
 		if (bbt[i])
@@ -413,13 +413,13 @@ static int __init mtd_subpagetest_init(void)
 		if (unlikely(err))
 			goto out;
 		if (i % 256 == 0)
-			printk(PRINT_PREF "written up to eraseblock %u\n", i);
+			pr_info("written up to eraseblock %u\n", i);
 		cond_resched();
 	}
-	printk(PRINT_PREF "written %u eraseblocks\n", i);
+	pr_info("written %u eraseblocks\n", i);
 
 	simple_srand(1);
-	printk(PRINT_PREF "verifying all eraseblocks\n");
+	pr_info("verifying all eraseblocks\n");
 	for (i = 0; i < ebcnt; ++i) {
 		if (bbt[i])
 			continue;
@@ -427,10 +427,10 @@ static int __init mtd_subpagetest_init(void)
 		if (unlikely(err))
 			goto out;
 		if (i % 256 == 0)
-			printk(PRINT_PREF "verified up to eraseblock %u\n", i);
+			pr_info("verified up to eraseblock %u\n", i);
 		cond_resched();
 	}
-	printk(PRINT_PREF "verified %u eraseblocks\n", i);
+	pr_info("verified %u eraseblocks\n", i);
 
 	err = erase_whole_device();
 	if (err)
@@ -442,7 +442,7 @@ static int __init mtd_subpagetest_init(void)
 
 	/* Write all eraseblocks */
 	simple_srand(3);
-	printk(PRINT_PREF "writing whole device\n");
+	pr_info("writing whole device\n");
 	for (i = 0; i < ebcnt; ++i) {
 		if (bbt[i])
 			continue;
@@ -450,14 +450,14 @@ static int __init mtd_subpagetest_init(void)
 		if (unlikely(err))
 			goto out;
 		if (i % 256 == 0)
-			printk(PRINT_PREF "written up to eraseblock %u\n", i);
+			pr_info("written up to eraseblock %u\n", i);
 		cond_resched();
 	}
-	printk(PRINT_PREF "written %u eraseblocks\n", i);
+	pr_info("written %u eraseblocks\n", i);
 
 	/* Check all eraseblocks */
 	simple_srand(3);
-	printk(PRINT_PREF "verifying all eraseblocks\n");
+	pr_info("verifying all eraseblocks\n");
 	for (i = 0; i < ebcnt; ++i) {
 		if (bbt[i])
 			continue;
@@ -465,10 +465,10 @@ static int __init mtd_subpagetest_init(void)
 		if (unlikely(err))
 			goto out;
 		if (i % 256 == 0)
-			printk(PRINT_PREF "verified up to eraseblock %u\n", i);
+			pr_info("verified up to eraseblock %u\n", i);
 		cond_resched();
 	}
-	printk(PRINT_PREF "verified %u eraseblocks\n", i);
+	pr_info("verified %u eraseblocks\n", i);
 
 	err = erase_whole_device();
 	if (err)
@@ -478,7 +478,7 @@ static int __init mtd_subpagetest_init(void)
 	if (err)
 		goto out;
 
-	printk(PRINT_PREF "finished with %d errors\n", errcnt);
+	pr_info("finished with %d errors\n", errcnt);
 
 out:
 	kfree(bbt);
@@ -486,7 +486,7 @@ out:
 	kfree(writebuf);
 	put_mtd_device(mtd);
 	if (err)
-		printk(PRINT_PREF "error %d occurred\n", err);
+		pr_info("error %d occurred\n", err);
 	printk(KERN_INFO "=================================================\n");
 	return err;
 }
-- 
1.7.4.1
