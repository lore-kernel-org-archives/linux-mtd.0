Message-Id: <201007202224.o6KMO0ck021384@imap1.linux-foundation.org>
Subject: [patch 2/4] drivers/mtd/tests/mtd_pagetest.c: return -1 if verify
	failed
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Tue, 20 Jul 2010 15:24:00 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Cc: roel.kluin@gmail.com, akpm@linux-foundation.org,
	linux-mtd@lists.infradead.org, cbou@mail.ru
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Roel Kluin <roel.kluin@gmail.com>

It should return -1 if the verify failed.

Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Anton Vorontsov <cbou@mail.ru>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/mtd/tests/mtd_pagetest.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -puN drivers/mtd/tests/mtd_pagetest.c~mtd-return-1-if-verify-failed drivers/mtd/tests/mtd_pagetest.c
--- a/drivers/mtd/tests/mtd_pagetest.c~mtd-return-1-if-verify-failed
+++ a/drivers/mtd/tests/mtd_pagetest.c
@@ -358,7 +358,7 @@ static int erasecrosstest(void)
 		printk(PRINT_PREF "verify failed!\n");
 		errcnt += 1;
 		ok = 0;
-		return err;
+		return -1;
 	}
 
 	printk(PRINT_PREF "erasing block %d\n", ebnum);
_
