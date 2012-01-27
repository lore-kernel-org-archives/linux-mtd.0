Received: from mail-pw0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rqmji-0007KX-Jr
 for linux-mtd@lists.infradead.org; Fri, 27 Jan 2012 14:25:07 +0000
Received: by mail-pw0-f49.google.com with SMTP id x9so2050943pbd.36
 for <linux-mtd@lists.infradead.org>; Fri, 27 Jan 2012 06:25:06 -0800 (PST)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org
Subject: [PATCH] mtd/tests: use memchr_inv
Date: Fri, 27 Jan 2012 23:24:54 +0900
Message-Id: <1327674295-3700-7-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <1327674295-3700-1-git-send-email-akinobu.mita@gmail.com>
References: <1327674295-3700-1-git-send-email-akinobu.mita@gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Akinobu Mita <akinobu.mita@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use memchr_inv to check if the data contains all 0xFF bytes.  It is
faster than looping for each byte.

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/tests/mtd_pagetest.c |   16 ++++++++--------
 1 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/tests/mtd_pagetest.c b/drivers/mtd/tests/mtd_pagetest.c
index 252ddb0..08847cf 100644
--- a/drivers/mtd/tests/mtd_pagetest.c
+++ b/drivers/mtd/tests/mtd_pagetest.c
@@ -401,6 +401,7 @@ static int erasetest(void)
 	size_t read, written;
 	int err = 0, i, ebnum, ok = 1;
 	loff_t addr0;
+	unsigned char *p;
 
 	printk(PRINT_PREF "erasetest\n");
 
@@ -442,14 +443,13 @@ static int erasetest(void)
 
 	printk(PRINT_PREF "verifying 1st page of block %d is all 0xff\n",
 	       ebnum);
-	for (i = 0; i < pgsize; ++i)
-		if (twopages[i] != 0xff) {
-			printk(PRINT_PREF "verifying all 0xff failed at %d\n",
-			       i);
-			errcnt += 1;
-			ok = 0;
-			break;
-		}
+	p = memchr_inv(twopages, 0xff, pgsize);
+	if (p) {
+		printk(PRINT_PREF "verifying all 0xff failed at %d\n",
+			       p - twopages);
+		errcnt += 1;
+		ok = 0;
+	}
 
 	if (ok && !err)
 		printk(PRINT_PREF "erasetest ok\n");
-- 
1.7.4.4
