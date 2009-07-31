Received: from mail-ew0-f211.google.com ([209.85.219.211])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MWsvp-0001hw-FL
	for linux-mtd@lists.infradead.org; Fri, 31 Jul 2009 14:18:08 +0000
Received: by ewy7 with SMTP id 7so1119666ewy.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 31 Jul 2009 07:17:59 -0700 (PDT)
Message-ID: <4A72FDCD.1070109@gmail.com>
Date: Fri, 31 Jul 2009 16:21:01 +0200
From: Roel Kluin <roel.kluin@gmail.com>
MIME-Version: 1.0
To: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH] MTD: Read buffer overflow
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Check whether index is within bounds before testing the element.

Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
---
with `for (i = 0; bbt[i] && i < ebcnt; ++i)'
we test bbt[ebcnt] in the last iteration

with `for (i = 0; bbt[ebcnt - i - 1] && i < ebcnt; ++i)'
we test bbt[-1] in the last iteration

diff --git a/drivers/mtd/tests/mtd_oobtest.c b/drivers/mtd/tests/mtd_oobtest.c
index a18e8d2..5553cd4 100644
--- a/drivers/mtd/tests/mtd_oobtest.c
+++ b/drivers/mtd/tests/mtd_oobtest.c
@@ -512,7 +512,7 @@ static int __init mtd_oobtest_init(void)
 		goto out;
 
 	addr0 = 0;
-	for (i = 0; bbt[i] && i < ebcnt; ++i)
+	for (i = 0; i < ebcnt && bbt[i]; ++i)
 		addr0 += mtd->erasesize;
 
 	/* Attempt to write off end of OOB */
diff --git a/drivers/mtd/tests/mtd_pagetest.c b/drivers/mtd/tests/mtd_pagetest.c
index 9648818..103cac4 100644
--- a/drivers/mtd/tests/mtd_pagetest.c
+++ b/drivers/mtd/tests/mtd_pagetest.c
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
