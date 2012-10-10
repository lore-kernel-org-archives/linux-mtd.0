Received: from mail-pa0-f49.google.com ([209.85.220.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TM0IF-0004lI-7w
 for linux-mtd@lists.infradead.org; Wed, 10 Oct 2012 17:42:04 +0000
Received: by mail-pa0-f49.google.com with SMTP id bi5so885909pad.36
 for <linux-mtd@lists.infradead.org>; Wed, 10 Oct 2012 10:42:02 -0700 (PDT)
Message-ID: <5075B351.4050309@gmail.com>
Date: Wed, 10 Oct 2012 23:11:37 +0530
From: Vikram Narayanan <vikram186@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH RESEND 8/9] mtd_tests/mtd_torturetest: Replace printk with
 pr_{info,crit}
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
 drivers/mtd/tests/mtd_torturetest.c |   73 ++++++++++++++++++-----------------
 1 files changed, 37 insertions(+), 36 deletions(-)

diff --git a/drivers/mtd/tests/mtd_torturetest.c b/drivers/mtd/tests/mtd_torturetest.c
index b65861b..98d2a82 100644
--- a/drivers/mtd/tests/mtd_torturetest.c
+++ b/drivers/mtd/tests/mtd_torturetest.c
@@ -23,6 +23,8 @@
  * damage caused by this program.
  */
 
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
@@ -31,7 +33,6 @@
 #include <linux/slab.h>
 #include <linux/sched.h>
 
-#define PRINT_PREF KERN_INFO "mtd_torturetest: "
 #define RETRIES 3
 
 static int eb = 8;
@@ -107,12 +108,12 @@ static inline int erase_eraseblock(int ebnum)
 
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
@@ -139,40 +140,40 @@ static inline int check_eraseblock(int ebnum, unsigned char *buf)
 retry:
 	err = mtd_read(mtd, addr, len, &read, check_buf);
 	if (mtd_is_bitflip(err))
-		printk(PRINT_PREF "single bit flip occurred at EB %d "
+		pr_err("single bit flip occurred at EB %d "
 		       "MTD reported that it was fixed.\n", ebnum);
 	else if (err) {
-		printk(PRINT_PREF "error %d while reading EB %d, "
+		pr_err("error %d while reading EB %d, "
 		       "read %zd\n", err, ebnum, read);
 		return err;
 	}
 
 	if (read != len) {
-		printk(PRINT_PREF "failed to read %zd bytes from EB %d, "
+		pr_err("failed to read %zd bytes from EB %d, "
 		       "read only %zd, but no error reported\n",
 		       len, ebnum, read);
 		return -EIO;
 	}
 
 	if (memcmp(buf, check_buf, len)) {
-		printk(PRINT_PREF "read wrong data from EB %d\n", ebnum);
+		pr_err("read wrong data from EB %d\n", ebnum);
 		report_corrupt(check_buf, buf);
 
 		if (retries++ < RETRIES) {
 			/* Try read again */
 			yield();
-			printk(PRINT_PREF "re-try reading data from EB %d\n",
+			pr_info("re-try reading data from EB %d\n",
 			       ebnum);
 			goto retry;
 		} else {
-			printk(PRINT_PREF "retried %d times, still errors, "
+			pr_info("retried %d times, still errors, "
 			       "give-up\n", RETRIES);
 			return -EINVAL;
 		}
 	}
 
 	if (retries != 0)
-		printk(PRINT_PREF "only attempt number %d was OK (!!!)\n",
+		pr_info("only attempt number %d was OK (!!!)\n",
 		       retries);
 
 	return 0;
@@ -191,12 +192,12 @@ static inline int write_pattern(int ebnum, void *buf)
 	}
 	err = mtd_write(mtd, addr, len, &written, buf);
 	if (err) {
-		printk(PRINT_PREF "error %d while writing EB %d, written %zd"
+		pr_err("error %d while writing EB %d, written %zd"
 		      " bytes\n", err, ebnum, written);
 		return err;
 	}
 	if (written != len) {
-		printk(PRINT_PREF "written only %zd bytes of %zd, but no error"
+		pr_info("written only %zd bytes of %zd, but no error"
 		       " reported\n", written, len);
 		return -EIO;
 	}
@@ -211,64 +212,64 @@ static int __init tort_init(void)
 
 	printk(KERN_INFO "\n");
 	printk(KERN_INFO "=================================================\n");
-	printk(PRINT_PREF "Warning: this program is trying to wear out your "
+	pr_info("Warning: this program is trying to wear out your "
 	       "flash, stop it if this is not wanted.\n");
 
 	if (dev < 0) {
-		printk(PRINT_PREF "Please specify a valid mtd-device via module paramter\n");
-		printk(KERN_CRIT "CAREFUL: This test wipes all data on the specified MTD device!\n");
+		pr_info("Please specify a valid mtd-device via module paramter\n");
+		pr_crit("CAREFUL: This test wipes all data on the specified MTD device!\n");
 		return -EINVAL;
 	}
 
-	printk(PRINT_PREF "MTD device: %d\n", dev);
-	printk(PRINT_PREF "torture %d eraseblocks (%d-%d) of mtd%d\n",
+	pr_info("MTD device: %d\n", dev);
+	pr_info("torture %d eraseblocks (%d-%d) of mtd%d\n",
 	       ebcnt, eb, eb + ebcnt - 1, dev);
 	if (pgcnt)
-		printk(PRINT_PREF "torturing just %d pages per eraseblock\n",
+		pr_info("torturing just %d pages per eraseblock\n",
 			pgcnt);
-	printk(PRINT_PREF "write verify %s\n", check ? "enabled" : "disabled");
+	pr_info("write verify %s\n", check ? "enabled" : "disabled");
 
 	mtd = get_mtd_device(NULL, dev);
 	if (IS_ERR(mtd)) {
 		err = PTR_ERR(mtd);
-		printk(PRINT_PREF "error: cannot get MTD device\n");
+		pr_err("error: cannot get MTD device\n");
 		return err;
 	}
 
 	if (mtd->writesize == 1) {
-		printk(PRINT_PREF "not NAND flash, assume page size is 512 "
+		pr_info("not NAND flash, assume page size is 512 "
 		       "bytes.\n");
 		pgsize = 512;
 	} else
 		pgsize = mtd->writesize;
 
 	if (pgcnt && (pgcnt > mtd->erasesize / pgsize || pgcnt < 0)) {
-		printk(PRINT_PREF "error: invalid pgcnt value %d\n", pgcnt);
+		pr_err("error: invalid pgcnt value %d\n", pgcnt);
 		goto out_mtd;
 	}
 
 	err = -ENOMEM;
 	patt_5A5 = kmalloc(mtd->erasesize, GFP_KERNEL);
 	if (!patt_5A5) {
-		printk(PRINT_PREF "error: cannot allocate memory\n");
+		pr_err("error: cannot allocate memory\n");
 		goto out_mtd;
 	}
 
 	patt_A5A = kmalloc(mtd->erasesize, GFP_KERNEL);
 	if (!patt_A5A) {
-		printk(PRINT_PREF "error: cannot allocate memory\n");
+		pr_err("error: cannot allocate memory\n");
 		goto out_patt_5A5;
 	}
 
 	patt_FF = kmalloc(mtd->erasesize, GFP_KERNEL);
 	if (!patt_FF) {
-		printk(PRINT_PREF "error: cannot allocate memory\n");
+		pr_err("error: cannot allocate memory\n");
 		goto out_patt_A5A;
 	}
 
 	check_buf = kmalloc(mtd->erasesize, GFP_KERNEL);
 	if (!check_buf) {
-		printk(PRINT_PREF "error: cannot allocate memory\n");
+		pr_err("error: cannot allocate memory\n");
 		goto out_patt_FF;
 	}
 
@@ -295,13 +296,13 @@ static int __init tort_init(void)
 			err = mtd_block_isbad(mtd, (loff_t)i * mtd->erasesize);
 
 			if (err < 0) {
-				printk(PRINT_PREF "block_isbad() returned %d "
+				pr_info("block_isbad() returned %d "
 				       "for EB %d\n", err, i);
 				goto out;
 			}
 
 			if (err) {
-				printk("EB %d is bad. Skip it.\n", i);
+				pr_err("EB %d is bad. Skip it.\n", i);
 				bad_ebs[i - eb] = 1;
 			}
 		}
@@ -329,7 +330,7 @@ static int __init tort_init(void)
 					continue;
 				err = check_eraseblock(i, patt_FF);
 				if (err) {
-					printk(PRINT_PREF "verify failed"
+					pr_info("verify failed"
 					       " for 0xFF... pattern\n");
 					goto out;
 				}
@@ -362,7 +363,7 @@ static int __init tort_init(void)
 					patt = patt_A5A;
 				err = check_eraseblock(i, patt);
 				if (err) {
-					printk(PRINT_PREF "verify failed for %s"
+					pr_info("verify failed for %s"
 					       " pattern\n",
 					       ((eb + erase_cycles) & 1) ?
 					       "0x55AA55..." : "0xAA55AA...");
@@ -380,7 +381,7 @@ static int __init tort_init(void)
 			stop_timing();
 			ms = (finish.tv_sec - start.tv_sec) * 1000 +
 			     (finish.tv_usec - start.tv_usec) / 1000;
-			printk(PRINT_PREF "%08u erase cycles done, took %lu "
+			pr_info("%08u erase cycles done, took %lu "
 			       "milliseconds (%lu seconds)\n",
 			       erase_cycles, ms, ms / 1000);
 			start_timing();
@@ -391,7 +392,7 @@ static int __init tort_init(void)
 	}
 out:
 
-	printk(PRINT_PREF "finished after %u erase cycles\n",
+	pr_info("finished after %u erase cycles\n",
 	       erase_cycles);
 	kfree(check_buf);
 out_patt_FF:
@@ -403,7 +404,7 @@ out_patt_5A5:
 out_mtd:
 	put_mtd_device(mtd);
 	if (err)
-		printk(PRINT_PREF "error %d occurred during torturing\n", err);
+		pr_info("error %d occurred during torturing\n", err);
 	printk(KERN_INFO "=================================================\n");
 	return err;
 }
@@ -441,9 +442,9 @@ static void report_corrupt(unsigned char *read, unsigned char *written)
 			       &bits) >= 0)
 			pages++;
 
-	printk(PRINT_PREF "verify fails on %d pages, %d bytes/%d bits\n",
+	pr_info("verify fails on %d pages, %d bytes/%d bits\n",
 	       pages, bytes, bits);
-	printk(PRINT_PREF "The following is a list of all differences between"
+	pr_info("The following is a list of all differences between"
 	       " what was read from flash and what was expected\n");
 
 	for (i = 0; i < check_len; i += pgsize) {
@@ -457,7 +458,7 @@ static void report_corrupt(unsigned char *read, unsigned char *written)
 		printk("-------------------------------------------------------"
 		       "----------------------------------\n");
 
-		printk(PRINT_PREF "Page %zd has %d bytes/%d bits failing verify,"
+		pr_info("Page %zd has %d bytes/%d bits failing verify,"
 		       " starting at offset 0x%x\n",
 		       (mtd->erasesize - check_len + i) / pgsize,
 		       bytes, bits, first);
-- 
1.7.4.1
