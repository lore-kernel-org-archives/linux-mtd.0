Received: from mail-pa0-x22c.google.com ([2607:f8b0:400e:c03::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V9y2P-0006w9-J8
 for linux-mtd@lists.infradead.org; Thu, 15 Aug 2013 13:56:38 +0000
Received: by mail-pa0-f44.google.com with SMTP id fz6so776738pac.17
 for <linux-mtd@lists.infradead.org>; Thu, 15 Aug 2013 06:56:08 -0700 (PDT)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH -next 4/4] mtd: tests: incorporate error message for
 mtdtest_write()
Date: Thu, 15 Aug 2013 22:55:09 +0900
Message-Id: <1376574909-7507-5-git-send-email-akinobu.mita@gmail.com>
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

All callers of mtdtest_write() print the same error message on failure.
This incorporates the error message to mtdtest_write() and removes them
from the callers.

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Vikram Narayanan <vikram186@gmail.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/tests/mtd_test.c    |  2 ++
 drivers/mtd/tests/nandbiterrs.c |  8 +-------
 drivers/mtd/tests/pagetest.c    | 23 ++++-------------------
 drivers/mtd/tests/speedtest.c   | 24 ++++--------------------
 drivers/mtd/tests/stresstest.c  |  5 +----
 5 files changed, 12 insertions(+), 50 deletions(-)

diff --git a/drivers/mtd/tests/mtd_test.c b/drivers/mtd/tests/mtd_test.c
index 4c2e3f0..c818a63 100644
--- a/drivers/mtd/tests/mtd_test.c
+++ b/drivers/mtd/tests/mtd_test.c
@@ -107,6 +107,8 @@ int mtdtest_write(struct mtd_info *mtd, loff_t addr, size_t size,
 	err = mtd_write(mtd, addr, size, &written, buf);
 	if (!err && written != size)
 		err = -EIO;
+	if (err)
+		pr_err("error: write failed at %#llx\n", addr);
 
 	return err;
 }
diff --git a/drivers/mtd/tests/nandbiterrs.c b/drivers/mtd/tests/nandbiterrs.c
index 5a8c858..3cd3aab 100644
--- a/drivers/mtd/tests/nandbiterrs.c
+++ b/drivers/mtd/tests/nandbiterrs.c
@@ -102,16 +102,10 @@ static uint8_t hash(unsigned offset)
 /* Writes wbuffer to page */
 static int write_page(int log)
 {
-	int err;
-
 	if (log)
 		pr_info("write_page\n");
 
-	err = mtdtest_write(mtd, offset, mtd->writesize, wbuffer);
-	if (err)
-		pr_err("error: write failed at %#llx\n", (long long)offset);
-
-	return err;
+	return mtdtest_write(mtd, offset, mtd->writesize, wbuffer);
 }
 
 /* Re-writes the data area while leaving the OOB alone. */
diff --git a/drivers/mtd/tests/pagetest.c b/drivers/mtd/tests/pagetest.c
index 9e8329c..44b96e9 100644
--- a/drivers/mtd/tests/pagetest.c
+++ b/drivers/mtd/tests/pagetest.c
@@ -52,17 +52,11 @@ static struct rnd_state rnd_state;
 
 static int write_eraseblock(int ebnum)
 {
-	int err;
 	loff_t addr = ebnum * mtd->erasesize;
 
 	prandom_bytes_state(&rnd_state, writebuf, mtd->erasesize);
 	cond_resched();
-	err = mtdtest_write(mtd, addr, mtd->erasesize, writebuf);
-	if (err)
-		pr_err("error: write failed at %#llx\n",
-		       (long long)addr);
-
-	return err;
+	return mtdtest_write(mtd, addr, mtd->erasesize, writebuf);
 }
 
 static int verify_eraseblock(int ebnum)
@@ -232,11 +226,8 @@ static int erasecrosstest(void)
 	prandom_bytes_state(&rnd_state, writebuf, pgsize);
 	strcpy(writebuf, "There is no data like this!");
 	err = mtdtest_write(mtd, addr0, pgsize, writebuf);
-	if (err) {
-		pr_info("error: write failed at %#llx\n",
-		       (long long)addr0);
+	if (err)
 		return err;
-	}
 
 	pr_info("reading 1st page of block %d\n", ebnum);
 	memset(readbuf, 0, pgsize);
@@ -260,11 +251,8 @@ static int erasecrosstest(void)
 	prandom_bytes_state(&rnd_state, writebuf, pgsize);
 	strcpy(writebuf, "There is no data like this!");
 	err = mtdtest_write(mtd, addr0, pgsize, writebuf);
-	if (err) {
-		pr_err("error: write failed at %#llx\n",
-		       (long long)addr0);
+	if (err)
 		return err;
-	}
 
 	pr_info("erasing block %d\n", ebnum2);
 	err = mtdtest_erase_eraseblock(mtd, ebnum2);
@@ -311,11 +299,8 @@ static int erasetest(void)
 	pr_info("writing 1st page of block %d\n", ebnum);
 	prandom_bytes_state(&rnd_state, writebuf, pgsize);
 	err = mtdtest_write(mtd, addr0, pgsize, writebuf);
-	if (err) {
-		pr_err("error: write failed at %#llx\n",
-		       (long long)addr0);
+	if (err)
 		return err;
-	}
 
 	pr_info("erasing block %d\n", ebnum);
 	err = mtdtest_erase_eraseblock(mtd, ebnum);
diff --git a/drivers/mtd/tests/speedtest.c b/drivers/mtd/tests/speedtest.c
index d1a3853..87ff6a2 100644
--- a/drivers/mtd/tests/speedtest.c
+++ b/drivers/mtd/tests/speedtest.c
@@ -80,14 +80,9 @@ static int multiblock_erase(int ebnum, int blocks)
 
 static int write_eraseblock(int ebnum)
 {
-	int err;
 	loff_t addr = ebnum * mtd->erasesize;
 
-	err = mtdtest_write(mtd, addr, mtd->erasesize, iobuf);
-	if (err)
-		pr_err("error: write failed at %#llx\n", addr);
-
-	return err;
+	return mtdtest_write(mtd, addr, mtd->erasesize, iobuf);
 }
 
 static int write_eraseblock_by_page(int ebnum)
@@ -98,11 +93,8 @@ static int write_eraseblock_by_page(int ebnum)
 
 	for (i = 0; i < pgcnt; i++) {
 		err = mtdtest_write(mtd, addr, pgsize, buf);
-		if (err) {
-			pr_err("error: write failed at %#llx\n",
-			       addr);
+		if (err)
 			break;
-		}
 		addr += pgsize;
 		buf += pgsize;
 	}
@@ -119,21 +111,13 @@ static int write_eraseblock_by_2pages(int ebnum)
 
 	for (i = 0; i < n; i++) {
 		err = mtdtest_write(mtd, addr, sz, buf);
-		if (err) {
-			pr_err("error: write failed at %#llx\n",
-			       addr);
+		if (err)
 			return err;
-		}
 		addr += sz;
 		buf += sz;
 	}
-	if (pgcnt % 2) {
+	if (pgcnt % 2)
 		err = mtdtest_write(mtd, addr, pgsize, buf);
-		if (err) {
-			pr_err("error: write failed at %#llx\n",
-			       addr);
-		}
-	}
 
 	return err;
 }
diff --git a/drivers/mtd/tests/stresstest.c b/drivers/mtd/tests/stresstest.c
index 6c9e23f..c9d42cc 100644
--- a/drivers/mtd/tests/stresstest.c
+++ b/drivers/mtd/tests/stresstest.c
@@ -126,11 +126,8 @@ static int do_write(void)
 	}
 	addr = eb * mtd->erasesize + offs;
 	err = mtdtest_write(mtd, addr, len, writebuf);
-	if (unlikely(err)) {
-		pr_err("error: write failed at 0x%llx\n",
-		       (long long)addr);
+	if (unlikely(err))
 		return err;
-	}
 	offs += len;
 	while (offs > mtd->erasesize) {
 		offsets[eb++] = mtd->erasesize;
-- 
1.8.3.1
