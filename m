Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SVPUu-0003zy-PK
 for linux-mtd@lists.infradead.org; Fri, 18 May 2012 15:53:46 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: tests: use random32 instead of home-brewed generator
Date: Fri, 18 May 2012 18:54:47 +0300
Message-Id: <1337356487-29986-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

This is a clean-up patch which removes the own pseudo-random numbers generator
from the speed- and stress-tests and makes them use the 'random32()' generator
instead.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/tests/mtd_speedtest.c  |   16 ++--------------
 drivers/mtd/tests/mtd_stresstest.c |   33 ++++++---------------------------
 2 files changed, 8 insertions(+), 41 deletions(-)

diff --git a/drivers/mtd/tests/mtd_speedtest.c b/drivers/mtd/tests/mtd_speedtest.c
index 2aec4f3..42b0f74 100644
--- a/drivers/mtd/tests/mtd_speedtest.c
+++ b/drivers/mtd/tests/mtd_speedtest.c
@@ -26,6 +26,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/slab.h>
 #include <linux/sched.h>
+#include <linux/random.h>
 
 #define PRINT_PREF KERN_INFO "mtd_speedtest: "
 
@@ -47,25 +48,13 @@ static int ebcnt;
 static int pgcnt;
 static int goodebcnt;
 static struct timeval start, finish;
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
 
 static void set_random_data(unsigned char *buf, size_t len)
 {
 	size_t i;
 
 	for (i = 0; i < len; ++i)
-		buf[i] = simple_rand();
+		buf[i] = random32();
 }
 
 static int erase_eraseblock(int ebnum)
@@ -407,7 +396,6 @@ static int __init mtd_speedtest_init(void)
 		goto out;
 	}
 
-	simple_srand(1);
 	set_random_data(iobuf, mtd->erasesize);
 
 	err = scan_for_bad_eraseblocks();
diff --git a/drivers/mtd/tests/mtd_stresstest.c b/drivers/mtd/tests/mtd_stresstest.c
index 7b33f22..52ea178 100644
--- a/drivers/mtd/tests/mtd_stresstest.c
+++ b/drivers/mtd/tests/mtd_stresstest.c
@@ -27,6 +27,7 @@
 #include <linux/slab.h>
 #include <linux/sched.h>
 #include <linux/vmalloc.h>
+#include <linux/random.h>
 
 #define PRINT_PREF KERN_INFO "mtd_stresstest: "
 
@@ -48,28 +49,13 @@ static int pgsize;
 static int bufsize;
 static int ebcnt;
 static int pgcnt;
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
 
 static int rand_eb(void)
 {
 	int eb;
 
 again:
-	if (ebcnt < 32768)
-		eb = simple_rand();
-	else
-		eb = (simple_rand() << 15) | simple_rand();
+	eb = random32();
 	/* Read or write up 2 eraseblocks at a time - hence 'ebcnt - 1' */
 	eb %= (ebcnt - 1);
 	if (bbt[eb])
@@ -81,10 +67,7 @@ static int rand_offs(void)
 {
 	int offs;
 
-	if (bufsize < 32768)
-		offs = simple_rand();
-	else
-		offs = (simple_rand() << 15) | simple_rand();
+	offs = random32();
 	offs %= bufsize;
 	return offs;
 }
@@ -93,10 +76,7 @@ static int rand_len(int offs)
 {
 	int len;
 
-	if (bufsize < 32768)
-		len = simple_rand();
-	else
-		len = (simple_rand() << 15) | simple_rand();
+	len = random32();
 	len %= (bufsize - offs);
 	return len;
 }
@@ -211,7 +191,7 @@ static int do_write(void)
 
 static int do_operation(void)
 {
-	if (simple_rand() & 1)
+	if (random32() & 1)
 		return do_read();
 	else
 		return do_write();
@@ -302,9 +282,8 @@ static int __init mtd_stresstest_init(void)
 	}
 	for (i = 0; i < ebcnt; i++)
 		offsets[i] = mtd->erasesize;
-	simple_srand(current->pid);
 	for (i = 0; i < bufsize; i++)
-		writebuf[i] = simple_rand();
+		writebuf[i] = random32();
 
 	err = scan_for_bad_eraseblocks();
 	if (err)
-- 
1.7.10
