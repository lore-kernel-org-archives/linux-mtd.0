Received: from mail-pb0-x233.google.com ([2607:f8b0:400e:c01::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V9y2M-0006w7-Hz
 for linux-mtd@lists.infradead.org; Thu, 15 Aug 2013 13:56:32 +0000
Received: by mail-pb0-f51.google.com with SMTP id jt11so736107pbb.24
 for <linux-mtd@lists.infradead.org>; Thu, 15 Aug 2013 06:56:06 -0700 (PDT)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH -next 3/4] mtd: tests: incorporate error message for
 mtdtest_read()
Date: Thu, 15 Aug 2013 22:55:08 +0900
Message-Id: <1376574909-7507-4-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <1376574909-7507-1-git-send-email-akinobu.mita@gmail.com>
References: <1376574909-7507-1-git-send-email-akinobu.mita@gmail.com>
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

All callers of mtdtest_read() print the same error message on failure.
This incorporates the error message to mtdtest_read() and removes them
from the callers.

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Vikram Narayanan <vikram186@gmail.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/tests/mtd_test.c   |  2 ++
 drivers/mtd/tests/pagetest.c   | 55 +++++++-----------------------------------
 drivers/mtd/tests/readtest.c   |  2 --
 drivers/mtd/tests/speedtest.c  | 24 +++---------------
 drivers/mtd/tests/stresstest.c | 10 ++------
 5 files changed, 17 insertions(+), 76 deletions(-)

diff --git a/drivers/mtd/tests/mtd_test.c b/drivers/mtd/tests/mtd_test.c
index bda8c4d..4c2e3f0 100644
--- a/drivers/mtd/tests/mtd_test.c
+++ b/drivers/mtd/tests/mtd_test.c
@@ -92,6 +92,8 @@ int mtdtest_read(struct mtd_info *mtd, loff_t addr, size_t size, void *buf)
 		err = 0;
 	if (!err && read != size)
 		err = -EIO;
+	if (err)
+		pr_err("error: read failed at %#llx\n", addr);
 
 	return err;
 }
diff --git a/drivers/mtd/tests/pagetest.c b/drivers/mtd/tests/pagetest.c
index 8318976..9e8329c 100644
--- a/drivers/mtd/tests/pagetest.c
+++ b/drivers/mtd/tests/pagetest.c
@@ -84,24 +84,15 @@ static int verify_eraseblock(int ebnum)
 	for (j = 0; j < pgcnt - 1; ++j, addr += pgsize) {
 		/* Do a read to set the internal dataRAMs to different data */
 		err = mtdtest_read(mtd, addr0, bufsize, twopages);
-		if (err) {
-			pr_err("error: read failed at %#llx\n",
-			       (long long)addr0);
+		if (err)
 			return err;
-		}
 		err = mtdtest_read(mtd, addrn - bufsize, bufsize, twopages);
-		if (err) {
-			pr_err("error: read failed at %#llx\n",
-			       (long long)(addrn - bufsize));
+		if (err)
 			return err;
-		}
 		memset(twopages, 0, bufsize);
 		err = mtdtest_read(mtd, addr, bufsize, twopages);
-		if (err) {
-			pr_err("error: read failed at %#llx\n",
-			       (long long)addr);
+		if (err)
 			break;
-		}
 		if (memcmp(twopages, writebuf + (j * pgsize), bufsize)) {
 			pr_err("error: verify failed at %#llx\n",
 			       (long long)addr);
@@ -114,24 +105,15 @@ static int verify_eraseblock(int ebnum)
 
 		/* Do a read to set the internal dataRAMs to different data */
 		err = mtdtest_read(mtd, addr0, bufsize, twopages);
-		if (err) {
-			pr_err("error: read failed at %#llx\n",
-			       (long long)addr0);
+		if (err)
 			return err;
-		}
 		err = mtdtest_read(mtd, addrn - bufsize, bufsize, twopages);
-		if (err) {
-			pr_err("error: read failed at %#llx\n",
-			       (long long)(addrn - bufsize));
+		if (err)
 			return err;
-		}
 		memset(twopages, 0, bufsize);
 		err = mtdtest_read(mtd, addr, bufsize, twopages);
-		if (err) {
-			pr_err("error: read failed at %#llx\n",
-			       (long long)addr);
+		if (err)
 			return err;
-		}
 		memcpy(boundary, writebuf + mtd->erasesize - pgsize, pgsize);
 		prandom_bytes_state(&rnd_state, boundary + pgsize, pgsize);
 		if (memcmp(twopages, boundary, bufsize)) {
@@ -171,8 +153,6 @@ static int crosstest(void)
 	addr = addrn - pgsize - pgsize;
 	err = mtdtest_read(mtd, addr, pgsize, pp1);
 	if (err) {
-		pr_err("error: read failed at %#llx\n",
-		       (long long)addr);
 		kfree(pp1);
 		return err;
 	}
@@ -181,8 +161,6 @@ static int crosstest(void)
 	addr = addrn - pgsize - pgsize - pgsize;
 	err = mtdtest_read(mtd, addr, pgsize, pp1);
 	if (err) {
-		pr_err("error: read failed at %#llx\n",
-		       (long long)addr);
 		kfree(pp1);
 		return err;
 	}
@@ -192,8 +170,6 @@ static int crosstest(void)
 	pr_info("reading page at %#llx\n", (long long)addr);
 	err = mtdtest_read(mtd, addr, pgsize, pp2);
 	if (err) {
-		pr_err("error: read failed at %#llx\n",
-		       (long long)addr);
 		kfree(pp1);
 		return err;
 	}
@@ -203,8 +179,6 @@ static int crosstest(void)
 	pr_info("reading page at %#llx\n", (long long)addr);
 	err = mtdtest_read(mtd, addr, pgsize, pp3);
 	if (err) {
-		pr_err("error: read failed at %#llx\n",
-		       (long long)addr);
 		kfree(pp1);
 		return err;
 	}
@@ -214,8 +188,6 @@ static int crosstest(void)
 	pr_info("reading page at %#llx\n", (long long)addr);
 	err = mtdtest_read(mtd, addr, pgsize, pp4);
 	if (err) {
-		pr_err("error: read failed at %#llx\n",
-		       (long long)addr);
 		kfree(pp1);
 		return err;
 	}
@@ -269,11 +241,8 @@ static int erasecrosstest(void)
 	pr_info("reading 1st page of block %d\n", ebnum);
 	memset(readbuf, 0, pgsize);
 	err = mtdtest_read(mtd, addr0, pgsize, readbuf);
-	if (err) {
-		pr_err("error: read failed at %#llx\n",
-		       (long long)addr0);
+	if (err)
 		return err;
-	}
 
 	pr_info("verifying 1st page of block %d\n", ebnum);
 	if (memcmp(writebuf, readbuf, pgsize)) {
@@ -305,11 +274,8 @@ static int erasecrosstest(void)
 	pr_info("reading 1st page of block %d\n", ebnum);
 	memset(readbuf, 0, pgsize);
 	err = mtdtest_read(mtd, addr0, pgsize, readbuf);
-	if (err) {
-		pr_err("error: read failed at %#llx\n",
-		       (long long)addr0);
+	if (err)
 		return err;
-	}
 
 	pr_info("verifying 1st page of block %d\n", ebnum);
 	if (memcmp(writebuf, readbuf, pgsize)) {
@@ -358,11 +324,8 @@ static int erasetest(void)
 
 	pr_info("reading 1st page of block %d\n", ebnum);
 	err = mtdtest_read(mtd, addr0, pgsize, twopages);
-	if (err) {
-		pr_err("error: read failed at %#llx\n",
-		       (long long)addr0);
+	if (err)
 		return err;
-	}
 
 	pr_info("verifying 1st page of block %d is all 0xff\n",
 	       ebnum);
diff --git a/drivers/mtd/tests/readtest.c b/drivers/mtd/tests/readtest.c
index ffd50d6..626e66d 100644
--- a/drivers/mtd/tests/readtest.c
+++ b/drivers/mtd/tests/readtest.c
@@ -55,8 +55,6 @@ static int read_eraseblock_by_page(int ebnum)
 		memset(buf, 0 , pgsize);
 		ret = mtdtest_read(mtd, addr, pgsize, buf);
 		if (ret) {
-			pr_err("error: read failed at %#llx\n",
-			       (long long)addr);
 			if (!err)
 				err = ret;
 		}
diff --git a/drivers/mtd/tests/speedtest.c b/drivers/mtd/tests/speedtest.c
index 457c45c..d1a3853 100644
--- a/drivers/mtd/tests/speedtest.c
+++ b/drivers/mtd/tests/speedtest.c
@@ -140,14 +140,9 @@ static int write_eraseblock_by_2pages(int ebnum)
 
 static int read_eraseblock(int ebnum)
 {
-	int err;
 	loff_t addr = ebnum * mtd->erasesize;
 
-	err = mtdtest_read(mtd, addr, mtd->erasesize, iobuf);
-	if (err)
-		pr_err("error: read failed at %#llx\n", addr);
-
-	return err;
+	return mtdtest_read(mtd, addr, mtd->erasesize, iobuf);
 }
 
 static int read_eraseblock_by_page(int ebnum)
@@ -158,11 +153,8 @@ static int read_eraseblock_by_page(int ebnum)
 
 	for (i = 0; i < pgcnt; i++) {
 		err = mtdtest_read(mtd, addr, pgsize, buf);
-		if (err) {
-			pr_err("error: read failed at %#llx\n",
-			       addr);
+		if (err)
 			break;
-		}
 		addr += pgsize;
 		buf += pgsize;
 	}
@@ -179,21 +171,13 @@ static int read_eraseblock_by_2pages(int ebnum)
 
 	for (i = 0; i < n; i++) {
 		err = mtdtest_read(mtd, addr, sz, buf);
-		if (err) {
-			pr_err("error: read failed at %#llx\n",
-			       addr);
+		if (err)
 			return err;
-		}
 		addr += sz;
 		buf += sz;
 	}
-	if (pgcnt % 2) {
+	if (pgcnt % 2)
 		err = mtdtest_read(mtd, addr, pgsize, buf);
-		if (err) {
-			pr_err("error: read failed at %#llx\n",
-			       addr);
-		}
-	}
 
 	return err;
 }
diff --git a/drivers/mtd/tests/stresstest.c b/drivers/mtd/tests/stresstest.c
index 1695248..6c9e23f 100644
--- a/drivers/mtd/tests/stresstest.c
+++ b/drivers/mtd/tests/stresstest.c
@@ -87,7 +87,7 @@ static int do_read(void)
 {
 	int eb = rand_eb();
 	int offs = rand_offs();
-	int len = rand_len(offs), err;
+	int len = rand_len(offs);
 	loff_t addr;
 
 	if (bbt[eb + 1]) {
@@ -97,13 +97,7 @@ static int do_read(void)
 			len = mtd->erasesize - offs;
 	}
 	addr = eb * mtd->erasesize + offs;
-	err = mtdtest_read(mtd, addr, len, readbuf);
-	if (unlikely(err)) {
-		pr_err("error: read failed at 0x%llx\n",
-		       (long long)addr);
-		return err;
-	}
-	return 0;
+	return mtdtest_read(mtd, addr, len, readbuf);
 }
 
 static int do_write(void)
-- 
1.8.3.1
