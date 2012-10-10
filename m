Received: from mail-da0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TM0EE-0003jS-RX
 for linux-mtd@lists.infradead.org; Wed, 10 Oct 2012 17:37:56 +0000
Received: by mail-da0-f49.google.com with SMTP id q27so298164daj.36
 for <linux-mtd@lists.infradead.org>; Wed, 10 Oct 2012 10:37:53 -0700 (PDT)
Message-ID: <5075B264.4000009@gmail.com>
Date: Wed, 10 Oct 2012 23:07:40 +0530
From: Vikram Narayanan <vikram186@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH RESEND 3/9] mtd_tests/mtd_pagetest: Replace printk with
 pr_{info, crit, err}
References: <5075B105.4080701@gmail.com>
In-Reply-To: <5075B105.4080701@gmail.com>
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

Use pr_fmt instead of PRINT_PREF macro

Signed-off-by: Vikram Narayanan <vikram186@gmail.com>
---
 drivers/mtd/tests/mtd_pagetest.c |  152 +++++++++++++++++++-------------------
 1 files changed, 76 insertions(+), 76 deletions(-)

diff --git a/drivers/mtd/tests/mtd_pagetest.c b/drivers/mtd/tests/mtd_pagetest.c
index 252ddb0..3ba2a77 100644
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
@@ -28,8 +30,6 @@
 #include <linux/slab.h>
 #include <linux/sched.h>
 
-#define PRINT_PREF KERN_INFO "mtd_pagetest: "
-
 static int dev = -EINVAL;
 module_param(dev, int, S_IRUGO);
 MODULE_PARM_DESC(dev, "MTD device number to use");
@@ -79,12 +79,12 @@ static int erase_eraseblock(int ebnum)
 
 	err = mtd_erase(mtd, &ei);
 	if (err) {
-		printk(PRINT_PREF "error %d while erasing EB %d\n", err, ebnum);
+		pr_err("error %d while erasing EB %d\n", err, ebnum);
 		return err;
 	}
 
 	if (ei.state == MTD_ERASE_FAILED) {
-		printk(PRINT_PREF "some erase error occurred at EB %d\n",
+		pr_err("some erase error occurred at EB %d\n",
 		       ebnum);
 		return -EIO;
 	}
@@ -102,7 +102,7 @@ static int write_eraseblock(int ebnum)
 	cond_resched();
 	err = mtd_write(mtd, addr, mtd->erasesize, &written, writebuf);
 	if (err || written != mtd->erasesize)
-		printk(PRINT_PREF "error: write failed at %#llx\n",
+		pr_err("error: write failed at %#llx\n",
 		       (long long)addr);
 
 	return err;
@@ -131,7 +131,7 @@ static int verify_eraseblock(int ebnum)
 		if (mtd_is_bitflip(err))
 			err = 0;
 		if (err || read != bufsize) {
-			printk(PRINT_PREF "error: read failed at %#llx\n",
+			pr_err("error: read failed at %#llx\n",
 			       (long long)addr0);
 			return err;
 		}
@@ -139,7 +139,7 @@ static int verify_eraseblock(int ebnum)
 		if (mtd_is_bitflip(err))
 			err = 0;
 		if (err || read != bufsize) {
-			printk(PRINT_PREF "error: read failed at %#llx\n",
+			pr_err("error: read failed at %#llx\n",
 			       (long long)(addrn - bufsize));
 			return err;
 		}
@@ -148,12 +148,12 @@ static int verify_eraseblock(int ebnum)
 		if (mtd_is_bitflip(err))
 			err = 0;
 		if (err || read != bufsize) {
-			printk(PRINT_PREF "error: read failed at %#llx\n",
+			pr_err("error: read failed at %#llx\n",
 			       (long long)addr);
 			break;
 		}
 		if (memcmp(twopages, writebuf + (j * pgsize), bufsize)) {
-			printk(PRINT_PREF "error: verify failed at %#llx\n",
+			pr_err("error: verify failed at %#llx\n",
 			       (long long)addr);
 			errcnt += 1;
 		}
@@ -166,7 +166,7 @@ static int verify_eraseblock(int ebnum)
 		if (mtd_is_bitflip(err))
 			err = 0;
 		if (err || read != bufsize) {
-			printk(PRINT_PREF "error: read failed at %#llx\n",
+			pr_err("error: read failed at %#llx\n",
 			       (long long)addr0);
 			return err;
 		}
@@ -174,7 +174,7 @@ static int verify_eraseblock(int ebnum)
 		if (mtd_is_bitflip(err))
 			err = 0;
 		if (err || read != bufsize) {
-			printk(PRINT_PREF "error: read failed at %#llx\n",
+			pr_err("error: read failed at %#llx\n",
 			       (long long)(addrn - bufsize));
 			return err;
 		}
@@ -183,14 +183,14 @@ static int verify_eraseblock(int ebnum)
 		if (mtd_is_bitflip(err))
 			err = 0;
 		if (err || read != bufsize) {
-			printk(PRINT_PREF "error: read failed at %#llx\n",
+			pr_err("error: read failed at %#llx\n",
 			       (long long)addr);
 			return err;
 		}
 		memcpy(boundary, writebuf + mtd->erasesize - pgsize, pgsize);
 		set_random_data(boundary + pgsize, pgsize);
 		if (memcmp(twopages, boundary, bufsize)) {
-			printk(PRINT_PREF "error: verify failed at %#llx\n",
+			pr_err("error: verify failed at %#llx\n",
 			       (long long)addr);
 			errcnt += 1;
 		}
@@ -206,10 +206,10 @@ static int crosstest(void)
 	loff_t addr, addr0, addrn;
 	unsigned char *pp1, *pp2, *pp3, *pp4;
 
-	printk(PRINT_PREF "crosstest\n");
+	pr_info("crosstest\n");
 	pp1 = kmalloc(pgsize * 4, GFP_KERNEL);
 	if (!pp1) {
-		printk(PRINT_PREF "error: cannot allocate memory\n");
+		pr_err("error: cannot allocate memory\n");
 		return -ENOMEM;
 	}
 	pp2 = pp1 + pgsize;
@@ -231,7 +231,7 @@ static int crosstest(void)
 	if (mtd_is_bitflip(err))
 		err = 0;
 	if (err || read != pgsize) {
-		printk(PRINT_PREF "error: read failed at %#llx\n",
+		pr_err("error: read failed at %#llx\n",
 		       (long long)addr);
 		kfree(pp1);
 		return err;
@@ -243,7 +243,7 @@ static int crosstest(void)
 	if (mtd_is_bitflip(err))
 		err = 0;
 	if (err || read != pgsize) {
-		printk(PRINT_PREF "error: read failed at %#llx\n",
+		pr_err("error: read failed at %#llx\n",
 		       (long long)addr);
 		kfree(pp1);
 		return err;
@@ -251,12 +251,12 @@ static int crosstest(void)
 
 	/* Read first page to pp2 */
 	addr = addr0;
-	printk(PRINT_PREF "reading page at %#llx\n", (long long)addr);
+	pr_info("reading page at %#llx\n", (long long)addr);
 	err = mtd_read(mtd, addr, pgsize, &read, pp2);
 	if (mtd_is_bitflip(err))
 		err = 0;
 	if (err || read != pgsize) {
-		printk(PRINT_PREF "error: read failed at %#llx\n",
+		pr_err("error: read failed at %#llx\n",
 		       (long long)addr);
 		kfree(pp1);
 		return err;
@@ -264,12 +264,12 @@ static int crosstest(void)
 
 	/* Read last page to pp3 */
 	addr = addrn - pgsize;
-	printk(PRINT_PREF "reading page at %#llx\n", (long long)addr);
+	pr_info("reading page at %#llx\n", (long long)addr);
 	err = mtd_read(mtd, addr, pgsize, &read, pp3);
 	if (mtd_is_bitflip(err))
 		err = 0;
 	if (err || read != pgsize) {
-		printk(PRINT_PREF "error: read failed at %#llx\n",
+		pr_err("error: read failed at %#llx\n",
 		       (long long)addr);
 		kfree(pp1);
 		return err;
@@ -277,25 +277,25 @@ static int crosstest(void)
 
 	/* Read first page again to pp4 */
 	addr = addr0;
-	printk(PRINT_PREF "reading page at %#llx\n", (long long)addr);
+	pr_info("reading page at %#llx\n", (long long)addr);
 	err = mtd_read(mtd, addr, pgsize, &read, pp4);
 	if (mtd_is_bitflip(err))
 		err = 0;
 	if (err || read != pgsize) {
-		printk(PRINT_PREF "error: read failed at %#llx\n",
+		pr_err("error: read failed at %#llx\n",
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
+		pr_err("verify failed!\n");
 		errcnt += 1;
 	} else if (!err)
-		printk(PRINT_PREF "crosstest ok\n");
+		pr_info("crosstest ok\n");
 	kfree(pp1);
 	return err;
 }
@@ -307,7 +307,7 @@ static int erasecrosstest(void)
 	loff_t addr0;
 	char *readbuf = twopages;
 
-	printk(PRINT_PREF "erasecrosstest\n");
+	pr_info("erasecrosstest\n");
 
 	ebnum = 0;
 	addr0 = 0;
@@ -320,79 +320,79 @@ static int erasecrosstest(void)
 	while (ebnum2 && bbt[ebnum2])
 		ebnum2 -= 1;
 
-	printk(PRINT_PREF "erasing block %d\n", ebnum);
+	pr_info("erasing block %d\n", ebnum);
 	err = erase_eraseblock(ebnum);
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
+		pr_err("error: read failed at %#llx\n",
 		       (long long)addr0);
 		return err ? err : -1;
 	}
 
-	printk(PRINT_PREF "verifying 1st page of block %d\n", ebnum);
+	pr_info("verifying 1st page of block %d\n", ebnum);
 	if (memcmp(writebuf, readbuf, pgsize)) {
-		printk(PRINT_PREF "verify failed!\n");
+		pr_err("verify failed!\n");
 		errcnt += 1;
 		return -1;
 	}
 
-	printk(PRINT_PREF "erasing block %d\n", ebnum);
+	pr_info("erasing block %d\n", ebnum);
 	err = erase_eraseblock(ebnum);
 	if (err)
 		return err;
 
-	printk(PRINT_PREF "writing 1st page of block %d\n", ebnum);
+	pr_info("writing 1st page of block %d\n", ebnum);
 	set_random_data(writebuf, pgsize);
 	strcpy(writebuf, "There is no data like this!");
 	err = mtd_write(mtd, addr0, pgsize, &written, writebuf);
 	if (err || written != pgsize) {
-		printk(PRINT_PREF "error: write failed at %#llx\n",
+		pr_err("error: write failed at %#llx\n",
 		       (long long)addr0);
 		return err ? err : -1;
 	}
 
-	printk(PRINT_PREF "erasing block %d\n", ebnum2);
+	pr_info("erasing block %d\n", ebnum2);
 	err = erase_eraseblock(ebnum2);
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
+		pr_err("error: read failed at %#llx\n",
 		       (long long)addr0);
 		return err ? err : -1;
 	}
 
-	printk(PRINT_PREF "verifying 1st page of block %d\n", ebnum);
+	pr_info("verifying 1st page of block %d\n", ebnum);
 	if (memcmp(writebuf, readbuf, pgsize)) {
-		printk(PRINT_PREF "verify failed!\n");
+		pr_err("verify failed!\n");
 		errcnt += 1;
 		return -1;
 	}
 
 	if (!err)
-		printk(PRINT_PREF "erasecrosstest ok\n");
+		pr_info("erasecrosstest ok\n");
 	return err;
 }
 
@@ -402,7 +402,7 @@ static int erasetest(void)
 	int err = 0, i, ebnum, ok = 1;
 	loff_t addr0;
 
-	printk(PRINT_PREF "erasetest\n");
+	pr_info("erasetest\n");
 
 	ebnum = 0;
 	addr0 = 0;
@@ -411,40 +411,40 @@ static int erasetest(void)
 		ebnum += 1;
 	}
 
-	printk(PRINT_PREF "erasing block %d\n", ebnum);
+	pr_info("erasing block %d\n", ebnum);
 	err = erase_eraseblock(ebnum);
 	if (err)
 		return err;
 
-	printk(PRINT_PREF "writing 1st page of block %d\n", ebnum);
+	pr_info("writing 1st page of block %d\n", ebnum);
 	set_random_data(writebuf, pgsize);
 	err = mtd_write(mtd, addr0, pgsize, &written, writebuf);
 	if (err || written != pgsize) {
-		printk(PRINT_PREF "error: write failed at %#llx\n",
+		pr_err("error: write failed at %#llx\n",
 		       (long long)addr0);
 		return err ? err : -1;
 	}
 
-	printk(PRINT_PREF "erasing block %d\n", ebnum);
+	pr_info("erasing block %d\n", ebnum);
 	err = erase_eraseblock(ebnum);
 	if (err)
 		return err;
 
-	printk(PRINT_PREF "reading 1st page of block %d\n", ebnum);
+	pr_info("reading 1st page of block %d\n", ebnum);
 	err = mtd_read(mtd, addr0, pgsize, &read, twopages);
 	if (mtd_is_bitflip(err))
 		err = 0;
 	if (err || read != pgsize) {
-		printk(PRINT_PREF "error: read failed at %#llx\n",
+		pr_err("error: read failed at %#llx\n",
 		       (long long)addr0);
 		return err ? err : -1;
 	}
 
-	printk(PRINT_PREF "verifying 1st page of block %d is all 0xff\n",
+	pr_info("verifying 1st page of block %d is all 0xff\n",
 	       ebnum);
 	for (i = 0; i < pgsize; ++i)
 		if (twopages[i] != 0xff) {
-			printk(PRINT_PREF "verifying all 0xff failed at %d\n",
+			pr_err("verifying all 0xff failed at %d\n",
 			       i);
 			errcnt += 1;
 			ok = 0;
@@ -452,7 +452,7 @@ static int erasetest(void)
 		}
 
 	if (ok && !err)
-		printk(PRINT_PREF "erasetest ok\n");
+		pr_info("erasetest ok\n");
 
 	return err;
 }
@@ -464,7 +464,7 @@ static int is_block_bad(int ebnum)
 
 	ret = mtd_block_isbad(mtd, addr);
 	if (ret)
-		printk(PRINT_PREF "block %d is bad\n", ebnum);
+		pr_info("block %d is bad\n", ebnum);
 	return ret;
 }
 
@@ -474,18 +474,18 @@ static int scan_for_bad_eraseblocks(void)
 
 	bbt = kzalloc(ebcnt, GFP_KERNEL);
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
 
@@ -499,22 +499,22 @@ static int __init mtd_pagetest_init(void)
 	printk(KERN_INFO "=================================================\n");
 
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
+		pr_err("error: cannot get MTD device\n");
 		return err;
 	}
 
 	if (mtd->type != MTD_NANDFLASH) {
-		printk(PRINT_PREF "this test requires NAND flash\n");
+		pr_info("this test requires NAND flash\n");
 		goto out;
 	}
 
@@ -524,7 +524,7 @@ static int __init mtd_pagetest_init(void)
 	pgcnt = mtd->erasesize / mtd->writesize;
 	pgsize = mtd->writesize;
 
-	printk(PRINT_PREF "MTD device size %llu, eraseblock size %u, "
+	pr_info("MTD device size %llu, eraseblock size %u, "
 	       "page size %u, count of eraseblocks %u, pages per "
 	       "eraseblock %u, OOB size %u\n",
 	       (unsigned long long)mtd->size, mtd->erasesize,
@@ -534,17 +534,17 @@ static int __init mtd_pagetest_init(void)
 	bufsize = pgsize * 2;
 	writebuf = kmalloc(mtd->erasesize, GFP_KERNEL);
 	if (!writebuf) {
-		printk(PRINT_PREF "error: cannot allocate memory\n");
+		pr_err("error: cannot allocate memory\n");
 		goto out;
 	}
 	twopages = kmalloc(bufsize, GFP_KERNEL);
 	if (!twopages) {
-		printk(PRINT_PREF "error: cannot allocate memory\n");
+		pr_err("error: cannot allocate memory\n");
 		goto out;
 	}
 	boundary = kmalloc(bufsize, GFP_KERNEL);
 	if (!boundary) {
-		printk(PRINT_PREF "error: cannot allocate memory\n");
+		pr_err("error: cannot allocate memory\n");
 		goto out;
 	}
 
@@ -553,7 +553,7 @@ static int __init mtd_pagetest_init(void)
 		goto out;
 
 	/* Erase all eraseblocks */
-	printk(PRINT_PREF "erasing whole device\n");
+	pr_info("erasing whole device\n");
 	for (i = 0; i < ebcnt; ++i) {
 		if (bbt[i])
 			continue;
@@ -562,11 +562,11 @@ static int __init mtd_pagetest_init(void)
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
@@ -574,14 +574,14 @@ static int __init mtd_pagetest_init(void)
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
@@ -589,10 +589,10 @@ static int __init mtd_pagetest_init(void)
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
@@ -606,7 +606,7 @@ static int __init mtd_pagetest_init(void)
 	if (err)
 		goto out;
 
-	printk(PRINT_PREF "finished with %d errors\n", errcnt);
+	pr_info("finished with %d errors\n", errcnt);
 out:
 
 	kfree(bbt);
@@ -615,7 +615,7 @@ out:
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
