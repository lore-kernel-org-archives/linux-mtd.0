Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TJ3TE-0000s4-85
 for linux-mtd@lists.infradead.org; Tue, 02 Oct 2012 14:29:13 +0000
Received: by mail-pb0-f49.google.com with SMTP id xa7so8176486pbc.36
 for <linux-mtd@lists.infradead.org>; Tue, 02 Oct 2012 07:29:12 -0700 (PDT)
Message-ID: <506AFA1F.50206@gmail.com>
Date: Tue, 02 Oct 2012 19:58:47 +0530
From: Vikram Narayanan <vikram186@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/8] mtd_pagetest: Replace printk with pr_{info,crit}
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
 drivers/mtd/tests/mtd_pagetest.c |  152 +++++++++++++++++++-------------------
 1 files changed, 76 insertions(+), 76 deletions(-)

diff --git a/drivers/mtd/tests/mtd_pagetest.c b/drivers/mtd/tests/mtd_pagetest.c
index 2a09405..12f0a2e 100644
--- a/drivers/mtd/tests/mtd_pagetest.c
+++ b/drivers/mtd/tests/mtd_pagetest.c
@@ -19,6 +19,8 @@
  * Author: Adrian Hunter <ext-adrian.hunter@nokia.com>
  */
 
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
 #include <asm/div64.h>
 #include <linux/init.h>
 #include <linux/module.h>
@@ -29,8 +31,6 @@
 #include <linux/sched.h>
 #include "mtd_tests.h"
 
-#define PRINT_PREF KERN_INFO "mtd_pagetest: "
-
 static int dev = -EINVAL;
 module_param(dev, int, S_IRUGO);
 MODULE_PARM_DESC(dev, "MTD device number to use");
@@ -77,7 +77,7 @@ static int write_eraseblock(int ebnum)
 	cond_resched();
 	err = mtd_write(mtd, addr, mtd->erasesize, &written, writebuf);
 	if (err || written != mtd->erasesize)
-		printk(PRINT_PREF "error: write failed at %#llx\n",
+		pr_info("error: write failed at %#llx\n",
 		       (long long)addr);
 
 	return err;
@@ -106,7 +106,7 @@ static int verify_eraseblock(int ebnum)
 		if (mtd_is_bitflip(err))
 			err = 0;
 		if (err || read != bufsize) {
-			printk(PRINT_PREF "error: read failed at %#llx\n",
+			pr_info("error: read failed at %#llx\n",
 			       (long long)addr0);
 			return err;
 		}
@@ -114,7 +114,7 @@ static int verify_eraseblock(int ebnum)
 		if (mtd_is_bitflip(err))
 			err = 0;
 		if (err || read != bufsize) {
-			printk(PRINT_PREF "error: read failed at %#llx\n",
+			pr_info("error: read failed at %#llx\n",
 			       (long long)(addrn - bufsize));
 			return err;
 		}
@@ -123,12 +123,12 @@ static int verify_eraseblock(int ebnum)
 		if (mtd_is_bitflip(err))
 			err = 0;
 		if (err || read != bufsize) {
-			printk(PRINT_PREF "error: read failed at %#llx\n",
+			pr_info("error: read failed at %#llx\n",
 			       (long long)addr);
 			break;
 		}
 		if (memcmp(twopages, writebuf + (j * pgsize), bufsize)) {
-			printk(PRINT_PREF "error: verify failed at %#llx\n",
+			pr_info("error: verify failed at %#llx\n",
 			       (long long)addr);
 			errcnt += 1;
 		}
@@ -141,7 +141,7 @@ static int verify_eraseblock(int ebnum)
 		if (mtd_is_bitflip(err))
 			err = 0;
 		if (err || read != bufsize) {
-			printk(PRINT_PREF "error: read failed at %#llx\n",
+			pr_info("error: read failed at %#llx\n",
 			       (long long)addr0);
 			return err;
 		}
@@ -149,7 +149,7 @@ static int verify_eraseblock(int ebnum)
 		if (mtd_is_bitflip(err))
 			err = 0;
 		if (err || read != bufsize) {
-			printk(PRINT_PREF "error: read failed at %#llx\n",
+			pr_info("error: read failed at %#llx\n",
 			       (long long)(addrn - bufsize));
 			return err;
 		}
@@ -158,14 +158,14 @@ static int verify_eraseblock(int ebnum)
 		if (mtd_is_bitflip(err))
 			err = 0;
 		if (err || read != bufsize) {
-			printk(PRINT_PREF "error: read failed at %#llx\n",
+			pr_info("error: read failed at %#llx\n",
 			       (long long)addr);
 			return err;
 		}
 		memcpy(boundary, writebuf + mtd->erasesize - pgsize, pgsize);
 		set_random_data(boundary + pgsize, pgsize);
 		if (memcmp(twopages, boundary, bufsize)) {
-			printk(PRINT_PREF "error: verify failed at %#llx\n",
+			pr_info("error: verify failed at %#llx\n",
 			       (long long)addr);
 			errcnt += 1;
 		}
@@ -181,10 +181,10 @@ static int crosstest(void)
 	loff_t addr, addr0, addrn;
 	unsigned char *pp1, *pp2, *pp3, *pp4;
 
-	printk(PRINT_PREF "crosstest\n");
+	pr_info("crosstest\n");
 	pp1 = kmalloc(pgsize * 4, GFP_KERNEL);
 	if (!pp1) {
-		printk(PRINT_PREF "error: cannot allocate memory\n");
+		pr_info("error: cannot allocate memory\n");
 		return -ENOMEM;
 	}
 	pp2 = pp1 + pgsize;
@@ -206,7 +206,7 @@ static int crosstest(void)
 	if (mtd_is_bitflip(err))
 		err = 0;
 	if (err || read != pgsize) {
-		printk(PRINT_PREF "error: read failed at %#llx\n",
+		pr_info("error: read failed at %#llx\n",
 		       (long long)addr);
 		kfree(pp1);
 		return err;
@@ -218,7 +218,7 @@ static int crosstest(void)
 	if (mtd_is_bitflip(err))
 		err = 0;
 	if (err || read != pgsize) {
-		printk(PRINT_PREF "error: read failed at %#llx\n",
+		pr_info("error: read failed at %#llx\n",
 		       (long long)addr);
 		kfree(pp1);
 		return err;
@@ -226,12 +226,12 @@ static int crosstest(void)
 
 	/* Read first page to pp2 */
 	addr = addr0;
-	printk(PRINT_PREF "reading page at %#llx\n", (long long)addr);
+	pr_info("reading page at %#llx\n", (long long)addr);
 	err = mtd_read(mtd, addr, pgsize, &read, pp2);
 	if (mtd_is_bitflip(err))
 		err = 0;
 	if (err || read != pgsize) {
-		printk(PRINT_PREF "error: read failed at %#llx\n",
+		pr_info("error: read failed at %#llx\n",
 		       (long long)addr);
 		kfree(pp1);
 		return err;
@@ -239,12 +239,12 @@ static int crosstest(void)
 
 	/* Read last page to pp3 */
 	addr = addrn - pgsize;
-	printk(PRINT_PREF "reading page at %#llx\n", (long long)addr);
+	pr_info("reading page at %#llx\n", (long long)addr);
 	err = mtd_read(mtd, addr, pgsize, &read, pp3);
 	if (mtd_is_bitflip(err))
 		err = 0;
 	if (err || read != pgsize) {
-		printk(PRINT_PREF "error: read failed at %#llx\n",
+		pr_info("error: read failed at %#llx\n",
 		       (long long)addr);
 		kfree(pp1);
 		return err;
@@ -252,25 +252,25 @@ static int crosstest(void)
 
 	/* Read first page again to pp4 */
 	addr = addr0;
-	printk(PRINT_PREF "reading page at %#llx\n", (long long)addr);
+	pr_info("reading page at %#llx\n", (long long)addr);
 	err = mtd_read(mtd, addr, pgsize, &read, pp4);
 	if (mtd_is_bitflip(err))
 		err = 0;
 	if (err || read != pgsize) {
-		printk(PRINT_PREF "error: read failed at %#llx\n",
+		pr_info("error: read failed at %#llx\n",
 		       (long long)addr);
 		kfree(pp1);
 		return err;
 	}
 
 	/* pp2 and pp4 should be the same */
-	printk(PRINT_PREF "verifying pages read at %#llx match\n",
+	pr_info("verifying pages read at %#llx match\n",
 	       (long long)addr0);
 	if (memcmp(pp2, pp4, pgsize)) {
-		printk(PRINT_PREF "verify failed!\n");
+		pr_info("verify failed!\n");
 		errcnt += 1;
 	} else if (!err)
-		printk(PRINT_PREF "crosstest ok\n");
+		pr_info("crosstest ok\n");
 	kfree(pp1);
 	return err;
 }
@@ -282,7 +282,7 @@ static int erasecrosstest(void)
 	loff_t addr0;
 	char *readbuf = twopages;
 
-	printk(PRINT_PREF "erasecrosstest\n");
+	pr_info("erasecrosstest\n");
 
 	ebnum = 0;
 	addr0 = 0;
@@ -295,79 +295,79 @@ static int erasecrosstest(void)
 	while (ebnum2 && bbt[ebnum2])
 		ebnum2 -= 1;
 
-	printk(PRINT_PREF "erasing block %d\n", ebnum);
+	pr_info("erasing block %d\n", ebnum);
 	err = erase_eraseblock(mtd, ebnum);
 	if (err)
 		return err;
 
-	printk(PRINT_PREF "writing 1st page of block %d\n", ebnum);
+	pr_info("writing 1st page of block %d\n", ebnum);
 	set_random_data(writebuf, pgsize);
 	strcpy(writebuf, "There is no data like this!");
 	err = mtd_write(mtd, addr0, pgsize, &written, writebuf);
 	if (err || written != pgsize) {
-		printk(PRINT_PREF "error: write failed at %#llx\n",
+		pr_info("error: write failed at %#llx\n",
 		       (long long)addr0);
 		return err ? err : -1;
 	}
 
-	printk(PRINT_PREF "reading 1st page of block %d\n", ebnum);
+	pr_info("reading 1st page of block %d\n", ebnum);
 	memset(readbuf, 0, pgsize);
 	err = mtd_read(mtd, addr0, pgsize, &read, readbuf);
 	if (mtd_is_bitflip(err))
 		err = 0;
 	if (err || read != pgsize) {
-		printk(PRINT_PREF "error: read failed at %#llx\n",
+		pr_info("error: read failed at %#llx\n",
 		       (long long)addr0);
 		return err ? err : -1;
 	}
 
-	printk(PRINT_PREF "verifying 1st page of block %d\n", ebnum);
+	pr_info("verifying 1st page of block %d\n", ebnum);
 	if (memcmp(writebuf, readbuf, pgsize)) {
-		printk(PRINT_PREF "verify failed!\n");
+		pr_info("verify failed!\n");
 		errcnt += 1;
 		return -1;
 	}
 
-	printk(PRINT_PREF "erasing block %d\n", ebnum);
+	pr_info("erasing block %d\n", ebnum);
 	err = erase_eraseblock(mtd, ebnum);
 	if (err)
 		return err;
 
-	printk(PRINT_PREF "writing 1st page of block %d\n", ebnum);
+	pr_info("writing 1st page of block %d\n", ebnum);
 	set_random_data(writebuf, pgsize);
 	strcpy(writebuf, "There is no data like this!");
 	err = mtd_write(mtd, addr0, pgsize, &written, writebuf);
 	if (err || written != pgsize) {
-		printk(PRINT_PREF "error: write failed at %#llx\n",
+		pr_info("error: write failed at %#llx\n",
 		       (long long)addr0);
 		return err ? err : -1;
 	}
 
-	printk(PRINT_PREF "erasing block %d\n", ebnum2);
+	pr_info("erasing block %d\n", ebnum2);
 	err = erase_eraseblock(mtd, ebnum2);
 	if (err)
 		return err;
 
-	printk(PRINT_PREF "reading 1st page of block %d\n", ebnum);
+	pr_info("reading 1st page of block %d\n", ebnum);
 	memset(readbuf, 0, pgsize);
 	err = mtd_read(mtd, addr0, pgsize, &read, readbuf);
 	if (mtd_is_bitflip(err))
 		err = 0;
 	if (err || read != pgsize) {
-		printk(PRINT_PREF "error: read failed at %#llx\n",
+		pr_info("error: read failed at %#llx\n",
 		       (long long)addr0);
 		return err ? err : -1;
 	}
 
-	printk(PRINT_PREF "verifying 1st page of block %d\n", ebnum);
+	pr_info("verifying 1st page of block %d\n", ebnum);
 	if (memcmp(writebuf, readbuf, pgsize)) {
-		printk(PRINT_PREF "verify failed!\n");
+		pr_info("verify failed!\n");
 		errcnt += 1;
 		return -1;
 	}
 
 	if (!err)
-		printk(PRINT_PREF "erasecrosstest ok\n");
+		pr_info("erasecrosstest ok\n");
 	return err;
 }
 
@@ -377,7 +377,7 @@ static int erasetest(void)
 	int err = 0, i, ebnum, ok = 1;
 	loff_t addr0;
 
-	printk(PRINT_PREF "erasetest\n");
+	pr_info("erasetest\n");
 
 	ebnum = 0;
 	addr0 = 0;
@@ -386,40 +386,40 @@ static int erasetest(void)
 		ebnum += 1;
 	}
 
-	printk(PRINT_PREF "erasing block %d\n", ebnum);
+	pr_info("erasing block %d\n", ebnum);
 	err = erase_eraseblock(mtd, ebnum);
 	if (err)
 		return err;
 
-	printk(PRINT_PREF "writing 1st page of block %d\n", ebnum);
+	pr_info("writing 1st page of block %d\n", ebnum);
 	set_random_data(writebuf, pgsize);
 	err = mtd_write(mtd, addr0, pgsize, &written, writebuf);
 	if (err || written != pgsize) {
-		printk(PRINT_PREF "error: write failed at %#llx\n",
+		pr_info("error: write failed at %#llx\n",
 		       (long long)addr0);
 		return err ? err : -1;
 	}
 
-	printk(PRINT_PREF "erasing block %d\n", ebnum);
+	pr_info("erasing block %d\n", ebnum);
 	err = erase_eraseblock(mtd, ebnum);
 	if (err)
 		return err;
 
-	printk(PRINT_PREF "reading 1st page of block %d\n", ebnum);
+	pr_info("reading 1st page of block %d\n", ebnum);
 	err = mtd_read(mtd, addr0, pgsize, &read, twopages);
 	if (mtd_is_bitflip(err))
 		err = 0;
 	if (err || read != pgsize) {
-		printk(PRINT_PREF "error: read failed at %#llx\n",
+		pr_info("error: read failed at %#llx\n",
 		       (long long)addr0);
 		return err ? err : -1;
 	}
 
-	printk(PRINT_PREF "verifying 1st page of block %d is all 0xff\n",
+	pr_info("verifying 1st page of block %d is all 0xff\n",
 	       ebnum);
 	for (i = 0; i < pgsize; ++i)
 		if (twopages[i] != 0xff) {
-			printk(PRINT_PREF "verifying all 0xff failed at %d\n",
+			pr_info("verifying all 0xff failed at %d\n",
 			       i);
 			errcnt += 1;
 			ok = 0;
@@ -427,7 +427,7 @@ static int erasetest(void)
 		}
 
 	if (ok && !err)
-		printk(PRINT_PREF "erasetest ok\n");
+		pr_info("erasetest ok\n");
 
 	return err;
 }
@@ -439,7 +439,7 @@ static int is_block_bad(int ebnum)
 
 	ret = mtd_block_isbad(mtd, addr);
 	if (ret)
-		printk(PRINT_PREF "block %d is bad\n", ebnum);
+		pr_info("block %d is bad\n", ebnum);
 	return ret;
 }
 
@@ -449,18 +449,18 @@ static int scan_for_bad_eraseblocks(void)
 
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
 
@@ -470,26 +470,26 @@ static int __init mtd_pagetest_init(void)
 	uint64_t tmp;
 	uint32_t i;
 
-	printk(KERN_INFO "\n");
-	printk(KERN_INFO "=================================================\n");
+
+	printk(KERN_INFO "\n=================================================\n");
 
 	if (dev < 0) {
-		printk(PRINT_PREF "Please specify a valid mtd-device via module paramter\n");
-		printk(KERN_CRIT "CAREFUL: This test wipes all data on the specified MTD device!\n");
+		pr_info("Please specify a valid mtd-device via module paramter\n");
+		pr_crit("CAREFUL: This test wipes all data on the specified MTD device!\n");
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
 
@@ -499,7 +499,7 @@ static int __init mtd_pagetest_init(void)
 	pgcnt = mtd->erasesize / mtd->writesize;
 	pgsize = mtd->writesize;
 
-	printk(PRINT_PREF "MTD device size %llu, eraseblock size %u, "
+	pr_info("MTD device size %llu, eraseblock size %u, "
 	       "page size %u, count of eraseblocks %u, pages per "
 	       "eraseblock %u, OOB size %u\n",
 	       (unsigned long long)mtd->size, mtd->erasesize,
@@ -509,17 +509,17 @@ static int __init mtd_pagetest_init(void)
 	bufsize = pgsize * 2;
 	writebuf = kmalloc(mtd->erasesize, GFP_KERNEL);
 	if (!writebuf) {
-		printk(PRINT_PREF "error: cannot allocate memory\n");
+		pr_info("error: cannot allocate memory\n");
 		goto out;
 	}
 	twopages = kmalloc(bufsize, GFP_KERNEL);
 	if (!twopages) {
-		printk(PRINT_PREF "error: cannot allocate memory\n");
+		pr_info("error: cannot allocate memory\n");
 		goto out;
 	}
 	boundary = kmalloc(bufsize, GFP_KERNEL);
 	if (!boundary) {
-		printk(PRINT_PREF "error: cannot allocate memory\n");
+		pr_info("error: cannot allocate memory\n");
 		goto out;
 	}
 
@@ -528,7 +528,7 @@ static int __init mtd_pagetest_init(void)
 		goto out;
 
 	/* Erase all eraseblocks */
-	printk(PRINT_PREF "erasing whole device\n");
+	pr_info("erasing whole device\n");
 	for (i = 0; i < ebcnt; ++i) {
 		if (bbt[i])
 			continue;
@@ -537,11 +537,11 @@ static int __init mtd_pagetest_init(void)
 			goto out;
 		cond_resched();
 	}
-	printk(PRINT_PREF "erased %u eraseblocks\n", i);
+	pr_info("erased %u eraseblocks\n", i);
 
 	/* Write all eraseblocks */
 	simple_srand(1);
-	printk(PRINT_PREF "writing whole device\n");
+	pr_info("writing whole device\n");
 	for (i = 0; i < ebcnt; ++i) {
 		if (bbt[i])
 			continue;
@@ -549,14 +549,14 @@ static int __init mtd_pagetest_init(void)
 		if (err)
 			goto out;
 		if (i % 256 == 0)
-			printk(PRINT_PREF "written up to eraseblock %u\n", i);
+			pr_info("written up to eraseblock %u\n", i);
 		cond_resched();
 	}
-	printk(PRINT_PREF "written %u eraseblocks\n", i);
+	pr_info("written %u eraseblocks\n", i);
 
 	/* Check all eraseblocks */
 	simple_srand(1);
-	printk(PRINT_PREF "verifying all eraseblocks\n");
+	pr_info("verifying all eraseblocks\n");
 	for (i = 0; i < ebcnt; ++i) {
 		if (bbt[i])
 			continue;
@@ -564,10 +564,10 @@ static int __init mtd_pagetest_init(void)
 		if (err)
 			goto out;
 		if (i % 256 == 0)
-			printk(PRINT_PREF "verified up to eraseblock %u\n", i);
+			pr_info("verified up to eraseblock %u\n", i);
 		cond_resched();
 	}
-	printk(PRINT_PREF "verified %u eraseblocks\n", i);
+	pr_info("verified %u eraseblocks\n", i);
 
 	err = crosstest();
 	if (err)
@@ -581,7 +581,7 @@ static int __init mtd_pagetest_init(void)
 	if (err)
 		goto out;
 
-	printk(PRINT_PREF "finished with %d errors\n", errcnt);
+	pr_info("finished with %d errors\n", errcnt);
 out:
 
 	kfree(bbt);
@@ -590,7 +590,7 @@ out:
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
