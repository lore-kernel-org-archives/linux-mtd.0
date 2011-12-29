Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RgIAk-0007xW-QS
 for linux-mtd@lists.infradead.org; Thu, 29 Dec 2011 15:45:40 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] mtd: remove extra retlen assignment
Date: Thu, 29 Dec 2011 17:47:33 +0200
Message-Id: <1325173653-6788-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1325173653-6788-1-git-send-email-dedekind1@gmail.com>
References: <1325173653-6788-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

MTD functions always assign the 'retlen' argument to 0 at the very
beginning - the callers do not have to do this.

I used the following semantic patch to find these places:

@@
identifier retlen;
expression a, b, c, d, e;
constant C;
type T;
@@
(
- retlen = C;
|
T
-retlen = C
+ retlen
;
)

... when != retlen
	when exists

(
mtd_read(a, b, c, &retlen, d)
|
mtd_write(a, b, c, &retlen, d)
|
mtd_panic_write(a, b, c, &retlen, d)
|
mtd_doint(a, b, c, &retlen, d, e)
|
mtd_read_fact_prot_reg(a, b, c, &retlen, d)
|
mtd_write_user_prot_reg(a, b, c, &retlen, d)
)

I ran it twice, because there were cases of double zero assigments
in mtd tests. Then I went through the patch to verify that spatch
did not find any false positives.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/mtdchar.c               |    2 +-
 drivers/mtd/tests/mtd_pagetest.c    |   17 +++++------------
 drivers/mtd/tests/mtd_readtest.c    |    2 +-
 drivers/mtd/tests/mtd_speedtest.c   |   12 ++++++------
 drivers/mtd/tests/mtd_stresstest.c  |    4 ++--
 drivers/mtd/tests/mtd_subpagetest.c |   14 +++++---------
 drivers/mtd/tests/mtd_torturetest.c |    4 ++--
 7 files changed, 22 insertions(+), 33 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 0a8bf82..e373e67 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -189,7 +189,7 @@ static ssize_t mtdchar_read(struct file *file, char __user *buf, size_t count,
 {
 	struct mtd_file_info *mfi = file->private_data;
 	struct mtd_info *mtd = mfi->mtd;
-	size_t retlen=0;
+	size_t retlen;
 	size_t total_retlen=0;
 	int ret=0;
 	int len;
diff --git a/drivers/mtd/tests/mtd_pagetest.c b/drivers/mtd/tests/mtd_pagetest.c
index 8024eaf..252ddb0 100644
--- a/drivers/mtd/tests/mtd_pagetest.c
+++ b/drivers/mtd/tests/mtd_pagetest.c
@@ -95,7 +95,7 @@ static int erase_eraseblock(int ebnum)
 static int write_eraseblock(int ebnum)
 {
 	int err = 0;
-	size_t written = 0;
+	size_t written;
 	loff_t addr = ebnum * mtd->erasesize;
 
 	set_random_data(writebuf, mtd->erasesize);
@@ -111,7 +111,7 @@ static int write_eraseblock(int ebnum)
 static int verify_eraseblock(int ebnum)
 {
 	uint32_t j;
-	size_t read = 0;
+	size_t read;
 	int err = 0, i;
 	loff_t addr0, addrn;
 	loff_t addr = ebnum * mtd->erasesize;
@@ -144,7 +144,6 @@ static int verify_eraseblock(int ebnum)
 			return err;
 		}
 		memset(twopages, 0, bufsize);
-		read = 0;
 		err = mtd_read(mtd, addr, bufsize, &read, twopages);
 		if (mtd_is_bitflip(err))
 			err = 0;
@@ -180,7 +179,6 @@ static int verify_eraseblock(int ebnum)
 			return err;
 		}
 		memset(twopages, 0, bufsize);
-		read = 0;
 		err = mtd_read(mtd, addr, bufsize, &read, twopages);
 		if (mtd_is_bitflip(err))
 			err = 0;
@@ -203,7 +201,7 @@ static int verify_eraseblock(int ebnum)
 
 static int crosstest(void)
 {
-	size_t read = 0;
+	size_t read;
 	int err = 0, i;
 	loff_t addr, addr0, addrn;
 	unsigned char *pp1, *pp2, *pp3, *pp4;
@@ -228,7 +226,6 @@ static int crosstest(void)
 		addrn -= mtd->erasesize;
 
 	/* Read 2nd-to-last page to pp1 */
-	read = 0;
 	addr = addrn - pgsize - pgsize;
 	err = mtd_read(mtd, addr, pgsize, &read, pp1);
 	if (mtd_is_bitflip(err))
@@ -241,7 +238,6 @@ static int crosstest(void)
 	}
 
 	/* Read 3rd-to-last page to pp1 */
-	read = 0;
 	addr = addrn - pgsize - pgsize - pgsize;
 	err = mtd_read(mtd, addr, pgsize, &read, pp1);
 	if (mtd_is_bitflip(err))
@@ -254,7 +250,6 @@ static int crosstest(void)
 	}
 
 	/* Read first page to pp2 */
-	read = 0;
 	addr = addr0;
 	printk(PRINT_PREF "reading page at %#llx\n", (long long)addr);
 	err = mtd_read(mtd, addr, pgsize, &read, pp2);
@@ -268,7 +263,6 @@ static int crosstest(void)
 	}
 
 	/* Read last page to pp3 */
-	read = 0;
 	addr = addrn - pgsize;
 	printk(PRINT_PREF "reading page at %#llx\n", (long long)addr);
 	err = mtd_read(mtd, addr, pgsize, &read, pp3);
@@ -282,7 +276,6 @@ static int crosstest(void)
 	}
 
 	/* Read first page again to pp4 */
-	read = 0;
 	addr = addr0;
 	printk(PRINT_PREF "reading page at %#llx\n", (long long)addr);
 	err = mtd_read(mtd, addr, pgsize, &read, pp4);
@@ -309,7 +302,7 @@ static int crosstest(void)
 
 static int erasecrosstest(void)
 {
-	size_t read = 0, written = 0;
+	size_t read, written;
 	int err = 0, i, ebnum, ebnum2;
 	loff_t addr0;
 	char *readbuf = twopages;
@@ -405,7 +398,7 @@ static int erasecrosstest(void)
 
 static int erasetest(void)
 {
-	size_t read = 0, written = 0;
+	size_t read, written;
 	int err = 0, i, ebnum, ok = 1;
 	loff_t addr0;
 
diff --git a/drivers/mtd/tests/mtd_readtest.c b/drivers/mtd/tests/mtd_readtest.c
index ad5fd0d..4228eb4 100644
--- a/drivers/mtd/tests/mtd_readtest.c
+++ b/drivers/mtd/tests/mtd_readtest.c
@@ -44,7 +44,7 @@ static int pgcnt;
 
 static int read_eraseblock_by_page(int ebnum)
 {
-	size_t read = 0;
+	size_t read;
 	int i, ret, err = 0;
 	loff_t addr = ebnum * mtd->erasesize;
 	void *buf = iobuf;
diff --git a/drivers/mtd/tests/mtd_speedtest.c b/drivers/mtd/tests/mtd_speedtest.c
index ecb2878..4d2ed5c 100644
--- a/drivers/mtd/tests/mtd_speedtest.c
+++ b/drivers/mtd/tests/mtd_speedtest.c
@@ -139,7 +139,7 @@ static int erase_whole_device(void)
 
 static int write_eraseblock(int ebnum)
 {
-	size_t written = 0;
+	size_t written;
 	int err = 0;
 	loff_t addr = ebnum * mtd->erasesize;
 
@@ -155,7 +155,7 @@ static int write_eraseblock(int ebnum)
 
 static int write_eraseblock_by_page(int ebnum)
 {
-	size_t written = 0;
+	size_t written;
 	int i, err = 0;
 	loff_t addr = ebnum * mtd->erasesize;
 	void *buf = iobuf;
@@ -178,7 +178,7 @@ static int write_eraseblock_by_page(int ebnum)
 
 static int write_eraseblock_by_2pages(int ebnum)
 {
-	size_t written = 0, sz = pgsize * 2;
+	size_t written, sz = pgsize * 2;
 	int i, n = pgcnt / 2, err = 0;
 	loff_t addr = ebnum * mtd->erasesize;
 	void *buf = iobuf;
@@ -210,7 +210,7 @@ static int write_eraseblock_by_2pages(int ebnum)
 
 static int read_eraseblock(int ebnum)
 {
-	size_t read = 0;
+	size_t read;
 	int err = 0;
 	loff_t addr = ebnum * mtd->erasesize;
 
@@ -229,7 +229,7 @@ static int read_eraseblock(int ebnum)
 
 static int read_eraseblock_by_page(int ebnum)
 {
-	size_t read = 0;
+	size_t read;
 	int i, err = 0;
 	loff_t addr = ebnum * mtd->erasesize;
 	void *buf = iobuf;
@@ -255,7 +255,7 @@ static int read_eraseblock_by_page(int ebnum)
 
 static int read_eraseblock_by_2pages(int ebnum)
 {
-	size_t read = 0, sz = pgsize * 2;
+	size_t read, sz = pgsize * 2;
 	int i, n = pgcnt / 2, err = 0;
 	loff_t addr = ebnum * mtd->erasesize;
 	void *buf = iobuf;
diff --git a/drivers/mtd/tests/mtd_stresstest.c b/drivers/mtd/tests/mtd_stresstest.c
index 4789c0e..399aa2b 100644
--- a/drivers/mtd/tests/mtd_stresstest.c
+++ b/drivers/mtd/tests/mtd_stresstest.c
@@ -140,7 +140,7 @@ static int is_block_bad(int ebnum)
 
 static int do_read(void)
 {
-	size_t read = 0;
+	size_t read;
 	int eb = rand_eb();
 	int offs = rand_offs();
 	int len = rand_len(offs), err;
@@ -169,7 +169,7 @@ static int do_read(void)
 static int do_write(void)
 {
 	int eb = rand_eb(), offs, err, len;
-	size_t written = 0;
+	size_t written;
 	loff_t addr;
 
 	offs = offsets[eb];
diff --git a/drivers/mtd/tests/mtd_subpagetest.c b/drivers/mtd/tests/mtd_subpagetest.c
index 4b873d4..9667bf5 100644
--- a/drivers/mtd/tests/mtd_subpagetest.c
+++ b/drivers/mtd/tests/mtd_subpagetest.c
@@ -115,7 +115,7 @@ static int erase_whole_device(void)
 
 static int write_eraseblock(int ebnum)
 {
-	size_t written = 0;
+	size_t written;
 	int err = 0;
 	loff_t addr = ebnum * mtd->erasesize;
 
@@ -150,7 +150,7 @@ static int write_eraseblock(int ebnum)
 
 static int write_eraseblock2(int ebnum)
 {
-	size_t written = 0;
+	size_t written;
 	int err = 0, k;
 	loff_t addr = ebnum * mtd->erasesize;
 
@@ -189,13 +189,12 @@ static void print_subpage(unsigned char *p)
 
 static int verify_eraseblock(int ebnum)
 {
-	size_t read = 0;
+	size_t read;
 	int err = 0;
 	loff_t addr = ebnum * mtd->erasesize;
 
 	set_random_data(writebuf, subpgsize);
 	clear_data(readbuf, subpgsize);
-	read = 0;
 	err = mtd_read(mtd, addr, subpgsize, &read, readbuf);
 	if (unlikely(err || read != subpgsize)) {
 		if (mtd_is_bitflip(err) && read == subpgsize) {
@@ -223,7 +222,6 @@ static int verify_eraseblock(int ebnum)
 
 	set_random_data(writebuf, subpgsize);
 	clear_data(readbuf, subpgsize);
-	read = 0;
 	err = mtd_read(mtd, addr, subpgsize, &read, readbuf);
 	if (unlikely(err || read != subpgsize)) {
 		if (mtd_is_bitflip(err) && read == subpgsize) {
@@ -252,7 +250,7 @@ static int verify_eraseblock(int ebnum)
 
 static int verify_eraseblock2(int ebnum)
 {
-	size_t read = 0;
+	size_t read;
 	int err = 0, k;
 	loff_t addr = ebnum * mtd->erasesize;
 
@@ -261,7 +259,6 @@ static int verify_eraseblock2(int ebnum)
 			break;
 		set_random_data(writebuf, subpgsize * k);
 		clear_data(readbuf, subpgsize * k);
-		read = 0;
 		err = mtd_read(mtd, addr, subpgsize * k, &read, readbuf);
 		if (unlikely(err || read != subpgsize * k)) {
 			if (mtd_is_bitflip(err) && read == subpgsize * k) {
@@ -288,14 +285,13 @@ static int verify_eraseblock2(int ebnum)
 static int verify_eraseblock_ff(int ebnum)
 {
 	uint32_t j;
-	size_t read = 0;
+	size_t read;
 	int err = 0;
 	loff_t addr = ebnum * mtd->erasesize;
 
 	memset(writebuf, 0xff, subpgsize);
 	for (j = 0; j < mtd->erasesize / subpgsize; ++j) {
 		clear_data(readbuf, subpgsize);
-		read = 0;
 		err = mtd_read(mtd, addr, subpgsize, &read, readbuf);
 		if (unlikely(err || read != subpgsize)) {
 			if (mtd_is_bitflip(err) && read == subpgsize) {
diff --git a/drivers/mtd/tests/mtd_torturetest.c b/drivers/mtd/tests/mtd_torturetest.c
index 30c4ed9..557105f 100644
--- a/drivers/mtd/tests/mtd_torturetest.c
+++ b/drivers/mtd/tests/mtd_torturetest.c
@@ -127,7 +127,7 @@ static inline int erase_eraseblock(int ebnum)
 static inline int check_eraseblock(int ebnum, unsigned char *buf)
 {
 	int err, retries = 0;
-	size_t read = 0;
+	size_t read;
 	loff_t addr = ebnum * mtd->erasesize;
 	size_t len = mtd->erasesize;
 
@@ -181,7 +181,7 @@ retry:
 static inline int write_pattern(int ebnum, void *buf)
 {
 	int err;
-	size_t written = 0;
+	size_t written;
 	loff_t addr = ebnum * mtd->erasesize;
 	size_t len = mtd->erasesize;
 
-- 
1.7.7.3
