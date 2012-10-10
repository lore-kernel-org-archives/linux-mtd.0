Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TM0FD-0003vz-91
 for linux-mtd@lists.infradead.org; Wed, 10 Oct 2012 17:38:56 +0000
Received: by mail-pb0-f49.google.com with SMTP id xa7so994531pbc.36
 for <linux-mtd@lists.infradead.org>; Wed, 10 Oct 2012 10:38:54 -0700 (PDT)
Message-ID: <5075B279.40407@gmail.com>
Date: Wed, 10 Oct 2012 23:08:01 +0530
From: Vikram Narayanan <vikram186@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH RESEND 4/9] mtd_tests/mtd_readtest: Replace printk with
 pr_{info, err}
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
 drivers/mtd/tests/mtd_readtest.c |   42 +++++++++++++++++++-------------------
 1 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/tests/mtd_readtest.c b/drivers/mtd/tests/mtd_readtest.c
index 121aba1..ec3efb5 100644
--- a/drivers/mtd/tests/mtd_readtest.c
+++ b/drivers/mtd/tests/mtd_readtest.c
@@ -19,6 +19,8 @@
  * Author: Adrian Hunter <ext-adrian.hunter@nokia.com>
  */
 
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
@@ -27,8 +29,6 @@
 #include <linux/slab.h>
 #include <linux/sched.h>
 
-#define PRINT_PREF KERN_INFO "mtd_readtest: "
-
 static int dev = -EINVAL;
 module_param(dev, int, S_IRUGO);
 MODULE_PARM_DESC(dev, "MTD device number to use");
@@ -56,7 +56,7 @@ static int read_eraseblock_by_page(int ebnum)
 		if (ret == -EUCLEAN)
 			ret = 0;
 		if (ret || read != pgsize) {
-			printk(PRINT_PREF "error: read failed at %#llx\n",
+			pr_err("error: read failed at %#llx\n",
 			       (long long)addr);
 			if (!err)
 				err = ret;
@@ -77,7 +77,7 @@ static int read_eraseblock_by_page(int ebnum)
 			ret = mtd_read_oob(mtd, addr, &ops);
 			if ((ret && !mtd_is_bitflip(ret)) ||
 					ops.oobretlen != mtd->oobsize) {
-				printk(PRINT_PREF "error: read oob failed at "
+				pr_err("error: read oob failed at "
 						  "%#llx\n", (long long)addr);
 				if (!err)
 					err = ret;
@@ -99,7 +99,7 @@ static void dump_eraseblock(int ebnum)
 	char line[128];
 	int pg, oob;
 
-	printk(PRINT_PREF "dumping eraseblock %d\n", ebnum);
+	pr_info("dumping eraseblock %d\n", ebnum);
 	n = mtd->erasesize;
 	for (i = 0; i < n;) {
 		char *p = line;
@@ -112,7 +112,7 @@ static void dump_eraseblock(int ebnum)
 	}
 	if (!mtd->oobsize)
 		return;
-	printk(PRINT_PREF "dumping oob from eraseblock %d\n", ebnum);
+	pr_info("dumping oob from eraseblock %d\n", ebnum);
 	n = mtd->oobsize;
 	for (pg = 0, i = 0; pg < pgcnt; pg++)
 		for (oob = 0; oob < n;) {
@@ -134,7 +134,7 @@ static int is_block_bad(int ebnum)
 
 	ret = mtd_block_isbad(mtd, addr);
 	if (ret)
-		printk(PRINT_PREF "block %d is bad\n", ebnum);
+		pr_info("block %d is bad\n", ebnum);
 	return ret;
 }
 
@@ -144,21 +144,21 @@ static int scan_for_bad_eraseblocks(void)
 
 	bbt = kzalloc(ebcnt, GFP_KERNEL);
 	if (!bbt) {
-		printk(PRINT_PREF "error: cannot allocate memory\n");
+		pr_err("error: cannot allocate memory\n");
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
 
@@ -171,21 +171,21 @@ static int __init mtd_readtest_init(void)
 	printk(KERN_INFO "=================================================\n");
 
 	if (dev < 0) {
-		printk(PRINT_PREF "Please specify a valid mtd-device via module paramter\n");
+		pr_info("Please specify a valid mtd-device via module paramter\n");
 		return -EINVAL;
 	}
 
-	printk(PRINT_PREF "MTD device: %d\n", dev);
+	pr_info("MTD device: %d\n", dev);
 
 	mtd = get_mtd_device(NULL, dev);
 	if (IS_ERR(mtd)) {
 		err = PTR_ERR(mtd);
-		printk(PRINT_PREF "error: Cannot get MTD device\n");
+		pr_err("error: Cannot get MTD device\n");
 		return err;
 	}
 
 	if (mtd->writesize == 1) {
-		printk(PRINT_PREF "not NAND flash, assume page size is 512 "
+		pr_info("not NAND flash, assume page size is 512 "
 		       "bytes.\n");
 		pgsize = 512;
 	} else
@@ -196,7 +196,7 @@ static int __init mtd_readtest_init(void)
 	ebcnt = tmp;
 	pgcnt = mtd->erasesize / pgsize;
 
-	printk(PRINT_PREF "MTD device size %llu, eraseblock size %u, "
+	pr_info("MTD device size %llu, eraseblock size %u, "
 	       "page size %u, count of eraseblocks %u, pages per "
 	       "eraseblock %u, OOB size %u\n",
 	       (unsigned long long)mtd->size, mtd->erasesize,
@@ -205,12 +205,12 @@ static int __init mtd_readtest_init(void)
 	err = -ENOMEM;
 	iobuf = kmalloc(mtd->erasesize, GFP_KERNEL);
 	if (!iobuf) {
-		printk(PRINT_PREF "error: cannot allocate memory\n");
+		pr_err("error: cannot allocate memory\n");
 		goto out;
 	}
 	iobuf1 = kmalloc(mtd->erasesize, GFP_KERNEL);
 	if (!iobuf1) {
-		printk(PRINT_PREF "error: cannot allocate memory\n");
+		pr_err("error: cannot allocate memory\n");
 		goto out;
 	}
 
@@ -219,7 +219,7 @@ static int __init mtd_readtest_init(void)
 		goto out;
 
 	/* Read all eraseblocks 1 page at a time */
-	printk(PRINT_PREF "testing page read\n");
+	pr_info("testing page read\n");
 	for (i = 0; i < ebcnt; ++i) {
 		int ret;
 
@@ -235,9 +235,9 @@ static int __init mtd_readtest_init(void)
 	}
 
 	if (err)
-		printk(PRINT_PREF "finished with errors\n");
+		pr_info("finished with errors\n");
 	else
-		printk(PRINT_PREF "finished\n");
+		pr_info("finished\n");
 
 out:
 
@@ -246,7 +246,7 @@ out:
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
