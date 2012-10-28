Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TSNA0-0001Km-3B
 for linux-mtd@lists.infradead.org; Sun, 28 Oct 2012 07:19:53 +0000
Received: by mail-pb0-f49.google.com with SMTP id xa7so3292853pbc.36
 for <linux-mtd@lists.infradead.org>; Sun, 28 Oct 2012 00:19:50 -0700 (PDT)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org
Subject: [PATCH 9/9] mtd: mtd_subpagetest: convert to use prandom32_get_bytes()
Date: Sun, 28 Oct 2012 16:19:06 +0900
Message-Id: <1351408746-8623-9-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <1351408746-8623-1-git-send-email-akinobu.mita@gmail.com>
References: <1351408746-8623-1-git-send-email-akinobu.mita@gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Akinobu Mita <akinobu.mita@gmail.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This removes home-brewed pseudo-random number generator and use
prandom32_get_bytes().

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/tests/mtd_subpagetest.c | 42 +++++++++++--------------------------
 1 file changed, 12 insertions(+), 30 deletions(-)

diff --git a/drivers/mtd/tests/mtd_subpagetest.c b/drivers/mtd/tests/mtd_subpagetest.c
index 9667bf5..86a7140 100644
--- a/drivers/mtd/tests/mtd_subpagetest.c
+++ b/drivers/mtd/tests/mtd_subpagetest.c
@@ -26,6 +26,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/slab.h>
 #include <linux/sched.h>
+#include <linux/random.h>
 
 #define PRINT_PREF KERN_INFO "mtd_subpagetest: "
 
@@ -43,26 +44,7 @@ static int bufsize;
 static int ebcnt;
 static int pgcnt;
 static int errcnt;
-static unsigned long next = 1;
-
-static inline unsigned int simple_rand(void)
-{
-	next = next * 1103515245 + 12345;
-	return (unsigned int)((next / 65536) % 32768);
-}
-
-static inline void simple_srand(unsigned long seed)
-{
-	next = seed;
-}
-
-static void set_random_data(unsigned char *buf, size_t len)
-{
-	size_t i;
-
-	for (i = 0; i < len; ++i)
-		buf[i] = simple_rand();
-}
+static struct rnd_state rnd_state;
 
 static inline void clear_data(unsigned char *buf, size_t len)
 {
@@ -119,7 +101,7 @@ static int write_eraseblock(int ebnum)
 	int err = 0;
 	loff_t addr = ebnum * mtd->erasesize;
 
-	set_random_data(writebuf, subpgsize);
+	prandom32_get_bytes(&rnd_state, writebuf, subpgsize);
 	err = mtd_write(mtd, addr, subpgsize, &written, writebuf);
 	if (unlikely(err || written != subpgsize)) {
 		printk(PRINT_PREF "error: write failed at %#llx\n",
@@ -133,7 +115,7 @@ static int write_eraseblock(int ebnum)
 
 	addr += subpgsize;
 
-	set_random_data(writebuf, subpgsize);
+	prandom32_get_bytes(&rnd_state, writebuf, subpgsize);
 	err = mtd_write(mtd, addr, subpgsize, &written, writebuf);
 	if (unlikely(err || written != subpgsize)) {
 		printk(PRINT_PREF "error: write failed at %#llx\n",
@@ -157,7 +139,7 @@ static int write_eraseblock2(int ebnum)
 	for (k = 1; k < 33; ++k) {
 		if (addr + (subpgsize * k) > (ebnum + 1) * mtd->erasesize)
 			break;
-		set_random_data(writebuf, subpgsize * k);
+		prandom32_get_bytes(&rnd_state, writebuf, subpgsize * k);
 		err = mtd_write(mtd, addr, subpgsize * k, &written, writebuf);
 		if (unlikely(err || written != subpgsize * k)) {
 			printk(PRINT_PREF "error: write failed at %#llx\n",
@@ -193,7 +175,7 @@ static int verify_eraseblock(int ebnum)
 	int err = 0;
 	loff_t addr = ebnum * mtd->erasesize;
 
-	set_random_data(writebuf, subpgsize);
+	prandom32_get_bytes(&rnd_state, writebuf, subpgsize);
 	clear_data(readbuf, subpgsize);
 	err = mtd_read(mtd, addr, subpgsize, &read, readbuf);
 	if (unlikely(err || read != subpgsize)) {
@@ -220,7 +202,7 @@ static int verify_eraseblock(int ebnum)
 
 	addr += subpgsize;
 
-	set_random_data(writebuf, subpgsize);
+	prandom32_get_bytes(&rnd_state, writebuf, subpgsize);
 	clear_data(readbuf, subpgsize);
 	err = mtd_read(mtd, addr, subpgsize, &read, readbuf);
 	if (unlikely(err || read != subpgsize)) {
@@ -257,7 +239,7 @@ static int verify_eraseblock2(int ebnum)
 	for (k = 1; k < 33; ++k) {
 		if (addr + (subpgsize * k) > (ebnum + 1) * mtd->erasesize)
 			break;
-		set_random_data(writebuf, subpgsize * k);
+		prandom32_get_bytes(&rnd_state, writebuf, subpgsize * k);
 		clear_data(readbuf, subpgsize * k);
 		err = mtd_read(mtd, addr, subpgsize * k, &read, readbuf);
 		if (unlikely(err || read != subpgsize * k)) {
@@ -430,7 +412,7 @@ static int __init mtd_subpagetest_init(void)
 		goto out;
 
 	printk(PRINT_PREF "writing whole device\n");
-	simple_srand(1);
+	prandom32_seed(&rnd_state, 1);
 	for (i = 0; i < ebcnt; ++i) {
 		if (bbt[i])
 			continue;
@@ -443,7 +425,7 @@ static int __init mtd_subpagetest_init(void)
 	}
 	printk(PRINT_PREF "written %u eraseblocks\n", i);
 
-	simple_srand(1);
+	prandom32_seed(&rnd_state, 1);
 	printk(PRINT_PREF "verifying all eraseblocks\n");
 	for (i = 0; i < ebcnt; ++i) {
 		if (bbt[i])
@@ -466,7 +448,7 @@ static int __init mtd_subpagetest_init(void)
 		goto out;
 
 	/* Write all eraseblocks */
-	simple_srand(3);
+	prandom32_seed(&rnd_state, 3);
 	printk(PRINT_PREF "writing whole device\n");
 	for (i = 0; i < ebcnt; ++i) {
 		if (bbt[i])
@@ -481,7 +463,7 @@ static int __init mtd_subpagetest_init(void)
 	printk(PRINT_PREF "written %u eraseblocks\n", i);
 
 	/* Check all eraseblocks */
-	simple_srand(3);
+	prandom32_seed(&rnd_state, 3);
 	printk(PRINT_PREF "verifying all eraseblocks\n");
 	for (i = 0; i < ebcnt; ++i) {
 		if (bbt[i])
-- 
1.7.11.7
