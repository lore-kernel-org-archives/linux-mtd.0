Message-Id: <200908062305.n76N5bPB004977@imap1.linux-foundation.org>
Subject: [patch 7/8] mtd: fix read buffer overflow
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Thu, 06 Aug 2009 16:05:36 -0700
Cc: roel.kluin@gmail.com, akpm@linux-foundation.org,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Roel Kluin <roel.kluin@gmail.com>

Check whether index is within bounds before testing the element.

with `for (i = 0; bbt[i] && i < ebcnt; ++i)'
we test bbt[ebcnt] in the last iteration

with `for (i = 0; bbt[ebcnt - i - 1] && i < ebcnt; ++i)'
we test bbt[-1] in the last iteration

Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/mtd/tests/mtd_oobtest.c  |    2 +-
 drivers/mtd/tests/mtd_pagetest.c |   12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff -puN drivers/mtd/tests/mtd_oobtest.c~mtd-fix-read-buffer-overflow drivers/mtd/tests/mtd_oobtest.c
--- a/drivers/mtd/tests/mtd_oobtest.c~mtd-fix-read-buffer-overflow
+++ a/drivers/mtd/tests/mtd_oobtest.c
@@ -512,7 +512,7 @@ static int __init mtd_oobtest_init(void)
 		goto out;
 
 	addr0 = 0;
-	for (i = 0; bbt[i] && i < ebcnt; ++i)
+	for (i = 0; i < ebcnt && bbt[i]; ++i)
 		addr0 += mtd->erasesize;
 
 	/* Attempt to write off end of OOB */
diff -puN drivers/mtd/tests/mtd_pagetest.c~mtd-fix-read-buffer-overflow drivers/mtd/tests/mtd_pagetest.c
--- a/drivers/mtd/tests/mtd_pagetest.c~mtd-fix-read-buffer-overflow
+++ a/drivers/mtd/tests/mtd_pagetest.c
@@ -116,11 +116,11 @@ static int verify_eraseblock(int ebnum)
 	loff_t addr = ebnum * mtd->erasesize;
 
 	addr0 = 0;
-	for (i = 0; bbt[i] && i < ebcnt; ++i)
+	for (i = 0; i < ebcnt && bbt[i]; ++i)
 		addr0 += mtd->erasesize;
 
 	addrn = mtd->size;
-	for (i = 0; bbt[ebcnt - i - 1] && i < ebcnt; ++i)
+	for (i = 0; i < ebcnt && bbt[ebcnt - i - 1]; ++i)
 		addrn -= mtd->erasesize;
 
 	set_random_data(writebuf, mtd->erasesize);
@@ -219,11 +219,11 @@ static int crosstest(void)
 	memset(pp1, 0, pgsize * 4);
 
 	addr0 = 0;
-	for (i = 0; bbt[i] && i < ebcnt; ++i)
+	for (i = 0; i < ebcnt && bbt[i]; ++i)
 		addr0 += mtd->erasesize;
 
 	addrn = mtd->size;
-	for (i = 0; bbt[ebcnt - i - 1] && i < ebcnt; ++i)
+	for (i = 0; i < ebcnt && bbt[ebcnt - i - 1]; ++i)
 		addrn -= mtd->erasesize;
 
 	/* Read 2nd-to-last page to pp1 */
@@ -317,7 +317,7 @@ static int erasecrosstest(void)
 
 	ebnum = 0;
 	addr0 = 0;
-	for (i = 0; bbt[i] && i < ebcnt; ++i) {
+	for (i = 0; i < ebcnt && bbt[i]; ++i) {
 		addr0 += mtd->erasesize;
 		ebnum += 1;
 	}
@@ -413,7 +413,7 @@ static int erasetest(void)
 
 	ebnum = 0;
 	addr0 = 0;
-	for (i = 0; bbt[i] && i < ebcnt; ++i) {
+	for (i = 0; i < ebcnt && bbt[i]; ++i) {
 		addr0 += mtd->erasesize;
 		ebnum += 1;
 	}
_
