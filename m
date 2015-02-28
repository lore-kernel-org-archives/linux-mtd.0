Received: from mail-pd0-x22e.google.com ([2607:f8b0:400e:c02::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YReEw-00007w-FR
 for linux-mtd@lists.infradead.org; Sat, 28 Feb 2015 10:03:19 +0000
Received: by pdbnh10 with SMTP id nh10so3381297pdb.3
 for <linux-mtd@lists.infradead.org>; Sat, 28 Feb 2015 02:02:56 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 3/7] mtd: tests: fix more potential integer overflows
Date: Sat, 28 Feb 2015 02:02:26 -0800
Message-Id: <1425117750-22298-4-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1425117750-22298-1-git-send-email-computersforpeace@gmail.com>
References: <1425117750-22298-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Akinobu Mita <akinobu.mita@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Caught by Coverity (CID #200625 and others)

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Akinobu Mita <akinobu.mita@gmail.com>
---
 drivers/mtd/tests/oobtest.c     | 2 +-
 drivers/mtd/tests/speedtest.c   | 2 +-
 drivers/mtd/tests/stresstest.c  | 4 ++--
 drivers/mtd/tests/subpagetest.c | 4 ++--
 drivers/mtd/tests/torturetest.c | 8 ++++----
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/tests/oobtest.c b/drivers/mtd/tests/oobtest.c
index 5e061186eab1..64390ab88a80 100644
--- a/drivers/mtd/tests/oobtest.c
+++ b/drivers/mtd/tests/oobtest.c
@@ -70,7 +70,7 @@ static int write_eraseblock(int ebnum)
 	int i;
 	struct mtd_oob_ops ops;
 	int err = 0;
-	loff_t addr = ebnum * mtd->erasesize;
+	loff_t addr = (loff_t)ebnum * mtd->erasesize;
 
 	prandom_bytes_state(&rnd_state, writebuf, use_len_max * pgcnt);
 	for (i = 0; i < pgcnt; ++i, addr += mtd->writesize) {
diff --git a/drivers/mtd/tests/speedtest.c b/drivers/mtd/tests/speedtest.c
index 5ee9f7021020..a77019cb5510 100644
--- a/drivers/mtd/tests/speedtest.c
+++ b/drivers/mtd/tests/speedtest.c
@@ -185,7 +185,7 @@ static long calc_speed(void)
 	     (finish.tv_usec - start.tv_usec) / 1000;
 	if (ms == 0)
 		return 0;
-	k = goodebcnt * (mtd->erasesize / 1024) * 1000;
+	k = (uint64_t)goodebcnt * (mtd->erasesize / 1024) * 1000;
 	do_div(k, ms);
 	return k;
 }
diff --git a/drivers/mtd/tests/stresstest.c b/drivers/mtd/tests/stresstest.c
index c9d42cc2df1b..d90c1c01dac6 100644
--- a/drivers/mtd/tests/stresstest.c
+++ b/drivers/mtd/tests/stresstest.c
@@ -96,7 +96,7 @@ static int do_read(void)
 		if (offs + len > mtd->erasesize)
 			len = mtd->erasesize - offs;
 	}
-	addr = eb * mtd->erasesize + offs;
+	addr = (loff_t)eb * mtd->erasesize + offs;
 	return mtdtest_read(mtd, addr, len, readbuf);
 }
 
@@ -124,7 +124,7 @@ static int do_write(void)
 			offsets[eb + 1] = 0;
 		}
 	}
-	addr = eb * mtd->erasesize + offs;
+	addr = (loff_t)eb * mtd->erasesize + offs;
 	err = mtdtest_write(mtd, addr, len, writebuf);
 	if (unlikely(err))
 		return err;
diff --git a/drivers/mtd/tests/subpagetest.c b/drivers/mtd/tests/subpagetest.c
index 7b59ef522d5e..0b835c631f91 100644
--- a/drivers/mtd/tests/subpagetest.c
+++ b/drivers/mtd/tests/subpagetest.c
@@ -95,7 +95,7 @@ static int write_eraseblock2(int ebnum)
 	loff_t addr = (loff_t)ebnum * mtd->erasesize;
 
 	for (k = 1; k < 33; ++k) {
-		if (addr + (subpgsize * k) > (ebnum + 1) * mtd->erasesize)
+		if (addr + (subpgsize * k) > (loff_t)(ebnum + 1) * mtd->erasesize)
 			break;
 		prandom_bytes_state(&rnd_state, writebuf, subpgsize * k);
 		err = mtd_write(mtd, addr, subpgsize * k, &written, writebuf);
@@ -195,7 +195,7 @@ static int verify_eraseblock2(int ebnum)
 	loff_t addr = (loff_t)ebnum * mtd->erasesize;
 
 	for (k = 1; k < 33; ++k) {
-		if (addr + (subpgsize * k) > (ebnum + 1) * mtd->erasesize)
+		if (addr + (subpgsize * k) > (loff_t)(ebnum + 1) * mtd->erasesize)
 			break;
 		prandom_bytes_state(&rnd_state, writebuf, subpgsize * k);
 		clear_data(readbuf, subpgsize * k);
diff --git a/drivers/mtd/tests/torturetest.c b/drivers/mtd/tests/torturetest.c
index b55bc52a1340..5045cf1b3160 100644
--- a/drivers/mtd/tests/torturetest.c
+++ b/drivers/mtd/tests/torturetest.c
@@ -101,11 +101,11 @@ static inline int check_eraseblock(int ebnum, unsigned char *buf)
 {
 	int err, retries = 0;
 	size_t read;
-	loff_t addr = ebnum * mtd->erasesize;
+	loff_t addr = (loff_t)ebnum * mtd->erasesize;
 	size_t len = mtd->erasesize;
 
 	if (pgcnt) {
-		addr = (ebnum + 1) * mtd->erasesize - pgcnt * pgsize;
+		addr = (loff_t)(ebnum + 1) * mtd->erasesize - pgcnt * pgsize;
 		len = pgcnt * pgsize;
 	}
 
@@ -155,11 +155,11 @@ static inline int write_pattern(int ebnum, void *buf)
 {
 	int err;
 	size_t written;
-	loff_t addr = ebnum * mtd->erasesize;
+	loff_t addr = (loff_t)ebnum * mtd->erasesize;
 	size_t len = mtd->erasesize;
 
 	if (pgcnt) {
-		addr = (ebnum + 1) * mtd->erasesize - pgcnt * pgsize;
+		addr = (loff_t)(ebnum + 1) * mtd->erasesize - pgcnt * pgsize;
 		len = pgcnt * pgsize;
 	}
 	err = mtd_write(mtd, addr, len, &written, buf);
-- 
2.1.0
