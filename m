Received: from mail-pd0-x22f.google.com ([2607:f8b0:400e:c02::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V5YWi-0006Y2-Dv
 for linux-mtd@lists.infradead.org; Sat, 03 Aug 2013 09:53:51 +0000
Received: by mail-pd0-f175.google.com with SMTP id 5so1496406pdd.6
 for <linux-mtd@lists.infradead.org>; Sat, 03 Aug 2013 02:53:11 -0700 (PDT)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH -next v2 04/10] mtd: mtd_pagetest: use mtd_test helpers
Date: Sat,  3 Aug 2013 18:52:10 +0900
Message-Id: <1375523536-32671-5-git-send-email-akinobu.mita@gmail.com>
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

Use mtdtest_write(), mtdtest_read(), mtdtest_erase_eraseblock(),
mtdtest_scan_for_bad_eraseblocks(), and mtdtest_erase_good_eraseblocks()
in mtd_test helpers.

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

 drivers/mtd/tests/pagetest.c | 199 ++++++++++++-------------------------------
 1 file changed, 55 insertions(+), 144 deletions(-)

diff --git a/drivers/mtd/tests/pagetest.c b/drivers/mtd/tests/pagetest.c
index acd991f..22cc38c 100644
--- a/drivers/mtd/tests/pagetest.c
+++ b/drivers/mtd/tests/pagetest.c
@@ -31,6 +31,8 @@
 #include <linux/sched.h>
 #include <linux/random.h>
 
+#include "mtd_test.h"
+
 static int dev = -EINVAL;
 module_param(dev, int, S_IRUGO);
 MODULE_PARM_DESC(dev, "MTD device number to use");
@@ -48,42 +50,15 @@ static int pgcnt;
 static int errcnt;
 static struct rnd_state rnd_state;
 
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
 static int write_eraseblock(int ebnum)
 {
-	int err = 0;
-	size_t written;
+	int err;
 	loff_t addr = ebnum * mtd->erasesize;
 
 	prandom_bytes_state(&rnd_state, writebuf, mtd->erasesize);
 	cond_resched();
-	err = mtd_write(mtd, addr, mtd->erasesize, &written, writebuf);
-	if (err || written != mtd->erasesize)
+	err = mtdtest_write(mtd, addr, mtd->erasesize, writebuf);
+	if (err)
 		pr_err("error: write failed at %#llx\n",
 		       (long long)addr);
 
@@ -93,7 +68,6 @@ static int write_eraseblock(int ebnum)
 static int verify_eraseblock(int ebnum)
 {
 	uint32_t j;
-	size_t read;
 	int err = 0, i;
 	loff_t addr0, addrn;
 	loff_t addr = ebnum * mtd->erasesize;
@@ -109,27 +83,21 @@ static int verify_eraseblock(int ebnum)
 	prandom_bytes_state(&rnd_state, writebuf, mtd->erasesize);
 	for (j = 0; j < pgcnt - 1; ++j, addr += pgsize) {
 		/* Do a read to set the internal dataRAMs to different data */
-		err = mtd_read(mtd, addr0, bufsize, &read, twopages);
-		if (mtd_is_bitflip(err))
-			err = 0;
-		if (err || read != bufsize) {
+		err = mtdtest_read(mtd, addr0, bufsize, twopages);
+		if (err) {
 			pr_err("error: read failed at %#llx\n",
 			       (long long)addr0);
 			return err;
 		}
-		err = mtd_read(mtd, addrn - bufsize, bufsize, &read, twopages);
-		if (mtd_is_bitflip(err))
-			err = 0;
-		if (err || read != bufsize) {
+		err = mtdtest_read(mtd, addrn - bufsize, bufsize, twopages);
+		if (err) {
 			pr_err("error: read failed at %#llx\n",
 			       (long long)(addrn - bufsize));
 			return err;
 		}
 		memset(twopages, 0, bufsize);
-		err = mtd_read(mtd, addr, bufsize, &read, twopages);
-		if (mtd_is_bitflip(err))
-			err = 0;
-		if (err || read != bufsize) {
+		err = mtdtest_read(mtd, addr, bufsize, twopages);
+		if (err) {
 			pr_err("error: read failed at %#llx\n",
 			       (long long)addr);
 			break;
@@ -145,27 +113,21 @@ static int verify_eraseblock(int ebnum)
 		struct rnd_state old_state = rnd_state;
 
 		/* Do a read to set the internal dataRAMs to different data */
-		err = mtd_read(mtd, addr0, bufsize, &read, twopages);
-		if (mtd_is_bitflip(err))
-			err = 0;
-		if (err || read != bufsize) {
+		err = mtdtest_read(mtd, addr0, bufsize, twopages);
+		if (err) {
 			pr_err("error: read failed at %#llx\n",
 			       (long long)addr0);
 			return err;
 		}
-		err = mtd_read(mtd, addrn - bufsize, bufsize, &read, twopages);
-		if (mtd_is_bitflip(err))
-			err = 0;
-		if (err || read != bufsize) {
+		err = mtdtest_read(mtd, addrn - bufsize, bufsize, twopages);
+		if (err) {
 			pr_err("error: read failed at %#llx\n",
 			       (long long)(addrn - bufsize));
 			return err;
 		}
 		memset(twopages, 0, bufsize);
-		err = mtd_read(mtd, addr, bufsize, &read, twopages);
-		if (mtd_is_bitflip(err))
-			err = 0;
-		if (err || read != bufsize) {
+		err = mtdtest_read(mtd, addr, bufsize, twopages);
+		if (err) {
 			pr_err("error: read failed at %#llx\n",
 			       (long long)addr);
 			return err;
@@ -184,7 +146,6 @@ static int verify_eraseblock(int ebnum)
 
 static int crosstest(void)
 {
-	size_t read;
 	int err = 0, i;
 	loff_t addr, addr0, addrn;
 	unsigned char *pp1, *pp2, *pp3, *pp4;
@@ -208,10 +169,8 @@ static int crosstest(void)
 
 	/* Read 2nd-to-last page to pp1 */
 	addr = addrn - pgsize - pgsize;
-	err = mtd_read(mtd, addr, pgsize, &read, pp1);
-	if (mtd_is_bitflip(err))
-		err = 0;
-	if (err || read != pgsize) {
+	err = mtdtest_read(mtd, addr, pgsize, pp1);
+	if (err) {
 		pr_err("error: read failed at %#llx\n",
 		       (long long)addr);
 		kfree(pp1);
@@ -220,10 +179,8 @@ static int crosstest(void)
 
 	/* Read 3rd-to-last page to pp1 */
 	addr = addrn - pgsize - pgsize - pgsize;
-	err = mtd_read(mtd, addr, pgsize, &read, pp1);
-	if (mtd_is_bitflip(err))
-		err = 0;
-	if (err || read != pgsize) {
+	err = mtdtest_read(mtd, addr, pgsize, pp1);
+	if (err) {
 		pr_err("error: read failed at %#llx\n",
 		       (long long)addr);
 		kfree(pp1);
@@ -233,10 +190,8 @@ static int crosstest(void)
 	/* Read first page to pp2 */
 	addr = addr0;
 	pr_info("reading page at %#llx\n", (long long)addr);
-	err = mtd_read(mtd, addr, pgsize, &read, pp2);
-	if (mtd_is_bitflip(err))
-		err = 0;
-	if (err || read != pgsize) {
+	err = mtdtest_read(mtd, addr, pgsize, pp2);
+	if (err) {
 		pr_err("error: read failed at %#llx\n",
 		       (long long)addr);
 		kfree(pp1);
@@ -246,10 +201,8 @@ static int crosstest(void)
 	/* Read last page to pp3 */
 	addr = addrn - pgsize;
 	pr_info("reading page at %#llx\n", (long long)addr);
-	err = mtd_read(mtd, addr, pgsize, &read, pp3);
-	if (mtd_is_bitflip(err))
-		err = 0;
-	if (err || read != pgsize) {
+	err = mtdtest_read(mtd, addr, pgsize, pp3);
+	if (err) {
 		pr_err("error: read failed at %#llx\n",
 		       (long long)addr);
 		kfree(pp1);
@@ -259,10 +212,8 @@ static int crosstest(void)
 	/* Read first page again to pp4 */
 	addr = addr0;
 	pr_info("reading page at %#llx\n", (long long)addr);
-	err = mtd_read(mtd, addr, pgsize, &read, pp4);
-	if (mtd_is_bitflip(err))
-		err = 0;
-	if (err || read != pgsize) {
+	err = mtdtest_read(mtd, addr, pgsize, pp4);
+	if (err) {
 		pr_err("error: read failed at %#llx\n",
 		       (long long)addr);
 		kfree(pp1);
@@ -283,7 +234,6 @@ static int crosstest(void)
 
 static int erasecrosstest(void)
 {
-	size_t read, written;
 	int err = 0, i, ebnum, ebnum2;
 	loff_t addr0;
 	char *readbuf = twopages;
@@ -302,26 +252,24 @@ static int erasecrosstest(void)
 		ebnum2 -= 1;
 
 	pr_info("erasing block %d\n", ebnum);
-	err = erase_eraseblock(ebnum);
+	err = mtdtest_erase_eraseblock(mtd, ebnum);
 	if (err)
 		return err;
 
 	pr_info("writing 1st page of block %d\n", ebnum);
 	prandom_bytes_state(&rnd_state, writebuf, pgsize);
 	strcpy(writebuf, "There is no data like this!");
-	err = mtd_write(mtd, addr0, pgsize, &written, writebuf);
-	if (err || written != pgsize) {
+	err = mtdtest_write(mtd, addr0, pgsize, writebuf);
+	if (err) {
 		pr_info("error: write failed at %#llx\n",
 		       (long long)addr0);
-		return err ? err : -1;
+		return err;
 	}
 
 	pr_info("reading 1st page of block %d\n", ebnum);
 	memset(readbuf, 0, pgsize);
-	err = mtd_read(mtd, addr0, pgsize, &read, readbuf);
-	if (mtd_is_bitflip(err))
-		err = 0;
-	if (err || read != pgsize) {
+	err = mtdtest_read(mtd, addr0, pgsize, readbuf);
+	if (err) {
 		pr_err("error: read failed at %#llx\n",
 		       (long long)addr0);
 		return err ? err : -1;
@@ -335,31 +283,29 @@ static int erasecrosstest(void)
 	}
 
 	pr_info("erasing block %d\n", ebnum);
-	err = erase_eraseblock(ebnum);
+	err = mtdtest_erase_eraseblock(mtd, ebnum);
 	if (err)
 		return err;
 
 	pr_info("writing 1st page of block %d\n", ebnum);
 	prandom_bytes_state(&rnd_state, writebuf, pgsize);
 	strcpy(writebuf, "There is no data like this!");
-	err = mtd_write(mtd, addr0, pgsize, &written, writebuf);
-	if (err || written != pgsize) {
+	err = mtdtest_write(mtd, addr0, pgsize, writebuf);
+	if (err) {
 		pr_err("error: write failed at %#llx\n",
 		       (long long)addr0);
-		return err ? err : -1;
+		return err;
 	}
 
 	pr_info("erasing block %d\n", ebnum2);
-	err = erase_eraseblock(ebnum2);
+	err = mtdtest_erase_eraseblock(mtd, ebnum2);
 	if (err)
 		return err;
 
 	pr_info("reading 1st page of block %d\n", ebnum);
 	memset(readbuf, 0, pgsize);
-	err = mtd_read(mtd, addr0, pgsize, &read, readbuf);
-	if (mtd_is_bitflip(err))
-		err = 0;
-	if (err || read != pgsize) {
+	err = mtdtest_read(mtd, addr0, pgsize, readbuf);
+	if (err) {
 		pr_err("error: read failed at %#llx\n",
 		       (long long)addr0);
 		return err ? err : -1;
@@ -379,7 +325,6 @@ static int erasecrosstest(void)
 
 static int erasetest(void)
 {
-	size_t read, written;
 	int err = 0, i, ebnum, ok = 1;
 	loff_t addr0;
 
@@ -393,29 +338,27 @@ static int erasetest(void)
 	}
 
 	pr_info("erasing block %d\n", ebnum);
-	err = erase_eraseblock(ebnum);
+	err = mtdtest_erase_eraseblock(mtd, ebnum);
 	if (err)
 		return err;
 
 	pr_info("writing 1st page of block %d\n", ebnum);
 	prandom_bytes_state(&rnd_state, writebuf, pgsize);
-	err = mtd_write(mtd, addr0, pgsize, &written, writebuf);
-	if (err || written != pgsize) {
+	err = mtdtest_write(mtd, addr0, pgsize, writebuf);
+	if (err) {
 		pr_err("error: write failed at %#llx\n",
 		       (long long)addr0);
-		return err ? err : -1;
+		return err;
 	}
 
 	pr_info("erasing block %d\n", ebnum);
-	err = erase_eraseblock(ebnum);
+	err = mtdtest_erase_eraseblock(mtd, ebnum);
 	if (err)
 		return err;
 
 	pr_info("reading 1st page of block %d\n", ebnum);
-	err = mtd_read(mtd, addr0, pgsize, &read, twopages);
-	if (mtd_is_bitflip(err))
-		err = 0;
-	if (err || read != pgsize) {
+	err = mtdtest_read(mtd, addr0, pgsize, twopages);
+	if (err) {
 		pr_err("error: read failed at %#llx\n",
 		       (long long)addr0);
 		return err ? err : -1;
@@ -438,36 +381,6 @@ static int erasetest(void)
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
-static int scan_for_bad_eraseblocks(void)
-{
-	int i, bad = 0;
-
-	bbt = kzalloc(ebcnt, GFP_KERNEL);
-	if (!bbt)
-		return -ENOMEM;
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
 static int __init mtd_pagetest_init(void)
 {
 	int err = 0;
@@ -521,21 +434,19 @@ static int __init mtd_pagetest_init(void)
 	if (!boundary)
 		goto out;
 
-	err = scan_for_bad_eraseblocks();
+	bbt = kzalloc(ebcnt, GFP_KERNEL);
+	if (!bbt)
+		goto out;
+	err = mtdtest_scan_for_bad_eraseblocks(mtd, bbt, 0, ebcnt);
 	if (err)
 		goto out;
 
 	/* Erase all eraseblocks */
 	pr_info("erasing whole device\n");
-	for (i = 0; i < ebcnt; ++i) {
-		if (bbt[i])
-			continue;
-		err = erase_eraseblock(i);
-		if (err)
-			goto out;
-		cond_resched();
-	}
-	pr_info("erased %u eraseblocks\n", i);
+	err = mtdtest_erase_good_eraseblocks(mtd, bbt, 0, ebcnt);
+	if (err)
+		goto out;
+	pr_info("erased %u eraseblocks\n", ebcnt);
 
 	/* Write all eraseblocks */
 	prandom_seed_state(&rnd_state, 1);
-- 
1.8.3.1
