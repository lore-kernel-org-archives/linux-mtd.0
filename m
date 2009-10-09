Received: from mail-vw0-f187.google.com ([209.85.212.187])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MwC11-0001vT-FL
	for linux-mtd@lists.infradead.org; Fri, 09 Oct 2009 09:44:04 +0000
Received: by vws17 with SMTP id 17so451147vws.24
	for <linux-mtd@lists.infradead.org>;
	Fri, 09 Oct 2009 02:43:57 -0700 (PDT)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: cleanup mtd_oobtest
Date: Fri,  9 Oct 2009 18:43:52 +0900
Message-Id: <1255081432-22080-1-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <>
References: <>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Akinobu Mita <akinobu.mita@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

- Remove unnecessary memset for bbt

  All entries will be initialized at a few lines below

- Remove unnecessary initialization for mtd->erasesize

- Use write_whole_device()

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
---
 drivers/mtd/tests/mtd_oobtest.c |   18 ++++--------------
 1 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/tests/mtd_oobtest.c b/drivers/mtd/tests/mtd_oobtest.c
index 5553cd4..5813920 100644
--- a/drivers/mtd/tests/mtd_oobtest.c
+++ b/drivers/mtd/tests/mtd_oobtest.c
@@ -343,7 +343,6 @@ static int scan_for_bad_eraseblocks(void)
 		printk(PRINT_PREF "error: cannot allocate memory\n");
 		return -ENOMEM;
 	}
-	memset(bbt, 0 , ebcnt);
 
 	printk(PRINT_PREF "scanning for bad eraseblocks\n");
 	for (i = 0; i < ebcnt; ++i) {
@@ -392,7 +391,6 @@ static int __init mtd_oobtest_init(void)
 	       mtd->writesize, ebcnt, pgcnt, mtd->oobsize);
 
 	err = -ENOMEM;
-	mtd->erasesize = mtd->erasesize;
 	readbuf = kmalloc(mtd->erasesize, GFP_KERNEL);
 	if (!readbuf) {
 		printk(PRINT_PREF "error: cannot allocate memory\n");
@@ -476,18 +474,10 @@ static int __init mtd_oobtest_init(void)
 	use_len_max = mtd->ecclayout->oobavail;
 	vary_offset = 1;
 	simple_srand(5);
-	printk(PRINT_PREF "writing OOBs of whole device\n");
-	for (i = 0; i < ebcnt; ++i) {
-		if (bbt[i])
-			continue;
-		err = write_eraseblock(i);
-		if (err)
-			goto out;
-		if (i % 256 == 0)
-			printk(PRINT_PREF "written up to eraseblock %u\n", i);
-		cond_resched();
-	}
-	printk(PRINT_PREF "written %u eraseblocks\n", i);
+
+	err = write_whole_device();
+	if (err)
+		goto out;
 
 	/* Check all eraseblocks */
 	use_offset = 0;
-- 
1.5.4.3
