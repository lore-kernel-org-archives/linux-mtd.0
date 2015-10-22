Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZpHLr-000498-H3
 for linux-mtd@lists.infradead.org; Thu, 22 Oct 2015 15:00:24 +0000
Received: by pasz6 with SMTP id z6so88856297pas.2
 for <linux-mtd@lists.infradead.org>; Thu, 22 Oct 2015 08:00:02 -0700 (PDT)
From: Shraddha Barke <shraddha.6596@gmail.com>
To: <outreachy-kernel@googlegroups.com>
Cc: y2038@lists.linaro.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Subject: [RESEND v2] mtd: tests: Replace timeval with ktime_t
Date: Thu, 22 Oct 2015 20:29:54 +0530
Message-Id: <1445525994-15331-1-git-send-email-shraddha.6596@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Changes the 32-bit time type timeval to the 64-bit time type
ktime_t, since 32-bit systems using struct timeval will break in the
year 2038. Correspondingly change do_gettimeofday() to ktime_get()
since ktime_get returns a ktime_t, but do_gettimeofday returns a
struct timeval.Here, ktime_get() is used instead of ktime_get_real()
since ktime_get() uses monotonic clock.

Signed-off-by: Shraddha Barke <shraddha.6596@gmail.com>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
---
Changes in v2-
 Make commit message clearer.

 drivers/mtd/tests/speedtest.c   | 10 +++++-----
 drivers/mtd/tests/torturetest.c | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/tests/speedtest.c b/drivers/mtd/tests/speedtest.c
index 5a6f31a..0b89418 100644
--- a/drivers/mtd/tests/speedtest.c
+++ b/drivers/mtd/tests/speedtest.c
@@ -22,6 +22,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/init.h>
+#include <linux/ktime.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/err.h>
@@ -49,7 +50,7 @@ static int pgsize;
 static int ebcnt;
 static int pgcnt;
 static int goodebcnt;
-static struct timeval start, finish;
+static ktime_t start, finish;
 
 static int multiblock_erase(int ebnum, int blocks)
 {
@@ -168,12 +169,12 @@ static int read_eraseblock_by_2pages(int ebnum)
 
 static inline void start_timing(void)
 {
-	do_gettimeofday(&start);
+	start = ktime_get();
 }
 
 static inline void stop_timing(void)
 {
-	do_gettimeofday(&finish);
+	finish = ktime_get();
 }
 
 static long calc_speed(void)
@@ -181,8 +182,7 @@ static long calc_speed(void)
 	uint64_t k;
 	long ms;
 
-	ms = (finish.tv_sec - start.tv_sec) * 1000 +
-	     (finish.tv_usec - start.tv_usec) / 1000;
+	ms = ktime_ms_delta(finish, start);
 	if (ms == 0)
 		return 0;
 	k = (uint64_t)goodebcnt * (mtd->erasesize / 1024) * 1000;
diff --git a/drivers/mtd/tests/torturetest.c b/drivers/mtd/tests/torturetest.c
index e5d6e6d..93c2729 100644
--- a/drivers/mtd/tests/torturetest.c
+++ b/drivers/mtd/tests/torturetest.c
@@ -26,6 +26,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/init.h>
+#include <linux/ktime.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/err.h>
@@ -79,18 +80,18 @@ static unsigned char *check_buf;
 static unsigned int erase_cycles;
 
 static int pgsize;
-static struct timeval start, finish;
+static ktime_t start, finish;
 
 static void report_corrupt(unsigned char *read, unsigned char *written);
 
 static inline void start_timing(void)
 {
-	do_gettimeofday(&start);
+	start = ktime_get();
 }
 
 static inline void stop_timing(void)
 {
-	do_gettimeofday(&finish);
+	finish = ktime_get();
 }
 
 /*
@@ -333,8 +334,7 @@ static int __init tort_init(void)
 			long ms;
 
 			stop_timing();
-			ms = (finish.tv_sec - start.tv_sec) * 1000 +
-			     (finish.tv_usec - start.tv_usec) / 1000;
+			ms = ktime_ms_delta(finish, start);
 			pr_info("%08u erase cycles done, took %lu "
 			       "milliseconds (%lu seconds)\n",
 			       erase_cycles, ms, ms / 1000);
-- 
2.1.4
