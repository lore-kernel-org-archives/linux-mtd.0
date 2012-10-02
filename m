Received: from mail-pa0-f49.google.com ([209.85.220.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TJ3Vr-0001Rz-Lb
 for linux-mtd@lists.infradead.org; Tue, 02 Oct 2012 14:31:56 +0000
Received: by padbi5 with SMTP id bi5so5717913pad.36
 for <linux-mtd@lists.infradead.org>; Tue, 02 Oct 2012 07:31:54 -0700 (PDT)
Message-ID: <506AFAC0.80100@gmail.com>
Date: Tue, 02 Oct 2012 20:01:28 +0530
From: Vikram Narayanan <vikram186@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH 5/8] mtd_stresstest: Replace printk with pr_{info,crit}
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
 drivers/mtd/tests/mtd_stresstest.c |   40 ++++++++++++++++++------------------
 1 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/tests/mtd_stresstest.c b/drivers/mtd/tests/mtd_stresstest.c
index 87e2e05..1ceacfa 100644
--- a/drivers/mtd/tests/mtd_stresstest.c
+++ b/drivers/mtd/tests/mtd_stresstest.c
@@ -19,6 +19,8 @@
  * Author: Adrian Hunter <ext-adrian.hunter@nokia.com>
  */
 
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
@@ -30,8 +32,6 @@
 #include <linux/random.h>
 #include "mtd_tests.h"
 
-#define PRINT_PREF KERN_INFO "mtd_stresstest: "
-
 static int dev = -EINVAL;
 module_param(dev, int, S_IRUGO);
 MODULE_PARM_DESC(dev, "MTD device number to use");
@@ -89,7 +89,7 @@ static int is_block_bad(int ebnum)
 
 	ret = mtd_block_isbad(mtd, addr);
 	if (ret)
-		printk(PRINT_PREF "block %d is bad\n", ebnum);
+		pr_info("block %d is bad\n", ebnum);
 	return ret;
 }
 
@@ -112,7 +112,7 @@ static int do_read(void)
 	if (mtd_is_bitflip(err))
 		err = 0;
 	if (unlikely(err || read != len)) {
-		printk(PRINT_PREF "error: read failed at 0x%llx\n",
+		pr_info("error: read failed at 0x%llx\n",
 		       (long long)addr);
 		if (!err)
 			err = -EINVAL;
@@ -149,7 +149,7 @@ static int do_write(void)
 	addr = eb * mtd->erasesize + offs;
 	err = mtd_write(mtd, addr, len, &written, writebuf);
 	if (unlikely(err || written != len)) {
-		printk(PRINT_PREF "error: write failed at 0x%llx\n",
+		pr_info("error: write failed at 0x%llx\n",
 		       (long long)addr);
 		if (!err)
 			err = -EINVAL;
@@ -178,21 +178,21 @@ static int scan_for_bad_eraseblocks(void)
 
 	bbt = kzalloc(ebcnt, GFP_KERNEL);
 	if (!bbt) {
-		printk(PRINT_PREF "error: cannot allocate memory\n");
+		pr_info("error: cannot allocate memory\n");
 		return -ENOMEM;
 	}
 
 	if (!mtd_can_have_bb(mtd))
 		return 0;
 
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
 
@@ -206,22 +206,22 @@ static int __init mtd_stresstest_init(void)
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
+		pr_info("error: cannot get MTD device\n");
 		return err;
 	}
 
 	if (mtd->writesize == 1) {
-		printk(PRINT_PREF "not NAND flash, assume page size is 512 "
+		pr_info("not NAND flash, assume page size is 512 "
 		       "bytes.\n");
 		pgsize = 512;
 	} else
@@ -232,14 +232,14 @@ static int __init mtd_stresstest_init(void)
 	ebcnt = tmp;
 	pgcnt = mtd->erasesize / pgsize;
 
-	printk(PRINT_PREF "MTD device size %llu, eraseblock size %u, "
+	pr_info("MTD device size %llu, eraseblock size %u, "
 	       "page size %u, count of eraseblocks %u, pages per "
 	       "eraseblock %u, OOB size %u\n",
 	       (unsigned long long)mtd->size, mtd->erasesize,
 	       pgsize, ebcnt, pgcnt, mtd->oobsize);
 
 	if (ebcnt < 2) {
-		printk(PRINT_PREF "error: need at least 2 eraseblocks\n");
+		pr_info("error: need at least 2 eraseblocks\n");
 		err = -ENOSPC;
 		goto out_put_mtd;
 	}
@@ -252,7 +252,7 @@ static int __init mtd_stresstest_init(void)
 	writebuf = vmalloc(bufsize);
 	offsets = kmalloc(ebcnt * sizeof(int), GFP_KERNEL);
 	if (!readbuf || !writebuf || !offsets) {
-		printk(PRINT_PREF "error: cannot allocate memory\n");
+		pr_info("error: cannot allocate memory\n");
 		goto out;
 	}
 	for (i = 0; i < ebcnt; i++)
@@ -265,16 +265,16 @@ static int __init mtd_stresstest_init(void)
 		goto out;
 
 	/* Do operations */
-	printk(PRINT_PREF "doing operations\n");
+	pr_info("doing operations\n");
 	for (op = 0; op < count; op++) {
 		if ((op & 1023) == 0)
-			printk(PRINT_PREF "%d operations done\n", op);
+			pr_info("%d operations done\n", op);
 		err = do_operation();
 		if (err)
 			goto out;
 		cond_resched();
 	}
-	printk(PRINT_PREF "finished, %d operations done\n", op);
+	pr_info("finished, %d operations done\n", op);
 
 out:
 	kfree(offsets);
@@ -284,7 +284,7 @@ out:
 out_put_mtd:
 	put_mtd_device(mtd);
 	if (err)
-		printk(PRINT_PREF "error %d occurred\n", err);
+		pr_info("error %d occurred\n", err);
 	printk(KERN_INFO "=================================================\n");
 	return err;
 }
-- 
1.7.4.1
