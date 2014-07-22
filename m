Received: from mail-pd0-x233.google.com ([2607:f8b0:400e:c02::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9PUV-0007Jm-75
 for linux-mtd@lists.infradead.org; Tue, 22 Jul 2014 02:07:44 +0000
Received: by mail-pd0-f179.google.com with SMTP id ft15so10150542pdb.24
 for <linux-mtd@lists.infradead.org>; Mon, 21 Jul 2014 19:07:22 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: tests: fix integer overflow issues
Date: Mon, 21 Jul 2014 19:07:12 -0700
Message-Id: <1405994832-19415-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Akinobu Mita <akinobu.mita@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

These multiplications are done with 32-bit arithmetic, then converted to
64-bit. We should widen the integers first to prevent overflow. This
could be a problem for large (>4GB) MTD's.

Detected by Coverity.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Akinobu Mita <akinobu.mita@gmail.com>
---
 drivers/mtd/tests/mtd_test.c    |  4 ++--
 drivers/mtd/tests/nandbiterrs.c |  2 +-
 drivers/mtd/tests/oobtest.c     |  8 ++++----
 drivers/mtd/tests/pagetest.c    |  4 ++--
 drivers/mtd/tests/readtest.c    |  2 +-
 drivers/mtd/tests/speedtest.c   | 14 +++++++-------
 drivers/mtd/tests/subpagetest.c | 10 +++++-----
 7 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/tests/mtd_test.c b/drivers/mtd/tests/mtd_test.c
index 111ee46a7428..34736bbcc07b 100644
--- a/drivers/mtd/tests/mtd_test.c
+++ b/drivers/mtd/tests/mtd_test.c
@@ -10,7 +10,7 @@ int mtdtest_erase_eraseblock(struct mtd_info *mtd, unsigned int ebnum)
 {
 	int err;
 	struct erase_info ei;
-	loff_t addr = ebnum * mtd->erasesize;
+	loff_t addr = (loff_t)ebnum * mtd->erasesize;
 
 	memset(&ei, 0, sizeof(struct erase_info));
 	ei.mtd  = mtd;
@@ -33,7 +33,7 @@ int mtdtest_erase_eraseblock(struct mtd_info *mtd, unsigned int ebnum)
 static int is_block_bad(struct mtd_info *mtd, unsigned int ebnum)
 {
 	int ret;
-	loff_t addr = ebnum * mtd->erasesize;
+	loff_t addr = (loff_t)ebnum * mtd->erasesize;
 
 	ret = mtd_block_isbad(mtd, addr);
 	if (ret)
diff --git a/drivers/mtd/tests/nandbiterrs.c b/drivers/mtd/tests/nandbiterrs.c
index 6f976159611f..273f7e553954 100644
--- a/drivers/mtd/tests/nandbiterrs.c
+++ b/drivers/mtd/tests/nandbiterrs.c
@@ -364,7 +364,7 @@ static int __init mtd_nandbiterrs_init(void)
 
 	pr_info("Device uses %d subpages of %d bytes\n", subcount, subsize);
 
-	offset     = page_offset * mtd->writesize;
+	offset     = (loff_t)page_offset * mtd->writesize;
 	eraseblock = mtd_div_by_eb(offset, mtd);
 
 	pr_info("Using page=%u, offset=%llu, eraseblock=%u\n",
diff --git a/drivers/mtd/tests/oobtest.c b/drivers/mtd/tests/oobtest.c
index f19ab1acde1f..dc4f9602b97e 100644
--- a/drivers/mtd/tests/oobtest.c
+++ b/drivers/mtd/tests/oobtest.c
@@ -120,7 +120,7 @@ static int verify_eraseblock(int ebnum)
 	int i;
 	struct mtd_oob_ops ops;
 	int err = 0;
-	loff_t addr = ebnum * mtd->erasesize;
+	loff_t addr = (loff_t)ebnum * mtd->erasesize;
 
 	prandom_bytes_state(&rnd_state, writebuf, use_len_max * pgcnt);
 	for (i = 0; i < pgcnt; ++i, addr += mtd->writesize) {
@@ -214,7 +214,7 @@ static int verify_eraseblock_in_one_go(int ebnum)
 {
 	struct mtd_oob_ops ops;
 	int err = 0;
-	loff_t addr = ebnum * mtd->erasesize;
+	loff_t addr = (loff_t)ebnum * mtd->erasesize;
 	size_t len = mtd->ecclayout->oobavail * pgcnt;
 
 	prandom_bytes_state(&rnd_state, writebuf, len);
@@ -568,7 +568,7 @@ static int __init mtd_oobtest_init(void)
 		size_t sz = mtd->ecclayout->oobavail;
 		if (bbt[i] || bbt[i + 1])
 			continue;
-		addr = (i + 1) * mtd->erasesize - mtd->writesize;
+		addr = (loff_t)(i + 1) * mtd->erasesize - mtd->writesize;
 		prandom_bytes_state(&rnd_state, writebuf, sz * cnt);
 		for (pg = 0; pg < cnt; ++pg) {
 			ops.mode      = MTD_OPS_AUTO_OOB;
@@ -598,7 +598,7 @@ static int __init mtd_oobtest_init(void)
 			continue;
 		prandom_bytes_state(&rnd_state, writebuf,
 					mtd->ecclayout->oobavail * 2);
-		addr = (i + 1) * mtd->erasesize - mtd->writesize;
+		addr = (loff_t)(i + 1) * mtd->erasesize - mtd->writesize;
 		ops.mode      = MTD_OPS_AUTO_OOB;
 		ops.len       = 0;
 		ops.retlen    = 0;
diff --git a/drivers/mtd/tests/pagetest.c b/drivers/mtd/tests/pagetest.c
index ed2d3f656fd2..88296e888e9d 100644
--- a/drivers/mtd/tests/pagetest.c
+++ b/drivers/mtd/tests/pagetest.c
@@ -52,7 +52,7 @@ static struct rnd_state rnd_state;
 
 static int write_eraseblock(int ebnum)
 {
-	loff_t addr = ebnum * mtd->erasesize;
+	loff_t addr = (loff_t)ebnum * mtd->erasesize;
 
 	prandom_bytes_state(&rnd_state, writebuf, mtd->erasesize);
 	cond_resched();
@@ -64,7 +64,7 @@ static int verify_eraseblock(int ebnum)
 	uint32_t j;
 	int err = 0, i;
 	loff_t addr0, addrn;
-	loff_t addr = ebnum * mtd->erasesize;
+	loff_t addr = (loff_t)ebnum * mtd->erasesize;
 
 	addr0 = 0;
 	for (i = 0; i < ebcnt && bbt[i]; ++i)
diff --git a/drivers/mtd/tests/readtest.c b/drivers/mtd/tests/readtest.c
index 626e66d0f7e7..a54cf1511114 100644
--- a/drivers/mtd/tests/readtest.c
+++ b/drivers/mtd/tests/readtest.c
@@ -47,7 +47,7 @@ static int pgcnt;
 static int read_eraseblock_by_page(int ebnum)
 {
 	int i, ret, err = 0;
-	loff_t addr = ebnum * mtd->erasesize;
+	loff_t addr = (loff_t)ebnum * mtd->erasesize;
 	void *buf = iobuf;
 	void *oobbuf = iobuf1;
 
diff --git a/drivers/mtd/tests/speedtest.c b/drivers/mtd/tests/speedtest.c
index 87ff6a29f84e..5ee9f7021020 100644
--- a/drivers/mtd/tests/speedtest.c
+++ b/drivers/mtd/tests/speedtest.c
@@ -55,7 +55,7 @@ static int multiblock_erase(int ebnum, int blocks)
 {
 	int err;
 	struct erase_info ei;
-	loff_t addr = ebnum * mtd->erasesize;
+	loff_t addr = (loff_t)ebnum * mtd->erasesize;
 
 	memset(&ei, 0, sizeof(struct erase_info));
 	ei.mtd  = mtd;
@@ -80,7 +80,7 @@ static int multiblock_erase(int ebnum, int blocks)
 
 static int write_eraseblock(int ebnum)
 {
-	loff_t addr = ebnum * mtd->erasesize;
+	loff_t addr = (loff_t)ebnum * mtd->erasesize;
 
 	return mtdtest_write(mtd, addr, mtd->erasesize, iobuf);
 }
@@ -88,7 +88,7 @@ static int write_eraseblock(int ebnum)
 static int write_eraseblock_by_page(int ebnum)
 {
 	int i, err = 0;
-	loff_t addr = ebnum * mtd->erasesize;
+	loff_t addr = (loff_t)ebnum * mtd->erasesize;
 	void *buf = iobuf;
 
 	for (i = 0; i < pgcnt; i++) {
@@ -106,7 +106,7 @@ static int write_eraseblock_by_2pages(int ebnum)
 {
 	size_t sz = pgsize * 2;
 	int i, n = pgcnt / 2, err = 0;
-	loff_t addr = ebnum * mtd->erasesize;
+	loff_t addr = (loff_t)ebnum * mtd->erasesize;
 	void *buf = iobuf;
 
 	for (i = 0; i < n; i++) {
@@ -124,7 +124,7 @@ static int write_eraseblock_by_2pages(int ebnum)
 
 static int read_eraseblock(int ebnum)
 {
-	loff_t addr = ebnum * mtd->erasesize;
+	loff_t addr = (loff_t)ebnum * mtd->erasesize;
 
 	return mtdtest_read(mtd, addr, mtd->erasesize, iobuf);
 }
@@ -132,7 +132,7 @@ static int read_eraseblock(int ebnum)
 static int read_eraseblock_by_page(int ebnum)
 {
 	int i, err = 0;
-	loff_t addr = ebnum * mtd->erasesize;
+	loff_t addr = (loff_t)ebnum * mtd->erasesize;
 	void *buf = iobuf;
 
 	for (i = 0; i < pgcnt; i++) {
@@ -150,7 +150,7 @@ static int read_eraseblock_by_2pages(int ebnum)
 {
 	size_t sz = pgsize * 2;
 	int i, n = pgcnt / 2, err = 0;
-	loff_t addr = ebnum * mtd->erasesize;
+	loff_t addr = (loff_t)ebnum * mtd->erasesize;
 	void *buf = iobuf;
 
 	for (i = 0; i < n; i++) {
diff --git a/drivers/mtd/tests/subpagetest.c b/drivers/mtd/tests/subpagetest.c
index a876371ad410..7b59ef522d5e 100644
--- a/drivers/mtd/tests/subpagetest.c
+++ b/drivers/mtd/tests/subpagetest.c
@@ -57,7 +57,7 @@ static int write_eraseblock(int ebnum)
 {
 	size_t written;
 	int err = 0;
-	loff_t addr = ebnum * mtd->erasesize;
+	loff_t addr = (loff_t)ebnum * mtd->erasesize;
 
 	prandom_bytes_state(&rnd_state, writebuf, subpgsize);
 	err = mtd_write(mtd, addr, subpgsize, &written, writebuf);
@@ -92,7 +92,7 @@ static int write_eraseblock2(int ebnum)
 {
 	size_t written;
 	int err = 0, k;
-	loff_t addr = ebnum * mtd->erasesize;
+	loff_t addr = (loff_t)ebnum * mtd->erasesize;
 
 	for (k = 1; k < 33; ++k) {
 		if (addr + (subpgsize * k) > (ebnum + 1) * mtd->erasesize)
@@ -131,7 +131,7 @@ static int verify_eraseblock(int ebnum)
 {
 	size_t read;
 	int err = 0;
-	loff_t addr = ebnum * mtd->erasesize;
+	loff_t addr = (loff_t)ebnum * mtd->erasesize;
 
 	prandom_bytes_state(&rnd_state, writebuf, subpgsize);
 	clear_data(readbuf, subpgsize);
@@ -192,7 +192,7 @@ static int verify_eraseblock2(int ebnum)
 {
 	size_t read;
 	int err = 0, k;
-	loff_t addr = ebnum * mtd->erasesize;
+	loff_t addr = (loff_t)ebnum * mtd->erasesize;
 
 	for (k = 1; k < 33; ++k) {
 		if (addr + (subpgsize * k) > (ebnum + 1) * mtd->erasesize)
@@ -227,7 +227,7 @@ static int verify_eraseblock_ff(int ebnum)
 	uint32_t j;
 	size_t read;
 	int err = 0;
-	loff_t addr = ebnum * mtd->erasesize;
+	loff_t addr = (loff_t)ebnum * mtd->erasesize;
 
 	memset(writebuf, 0xff, subpgsize);
 	for (j = 0; j < mtd->erasesize / subpgsize; ++j) {
-- 
1.9.1
