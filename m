Received: from mail-wg0-f46.google.com ([74.125.82.46])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XuJN8-00089z-P5
 for linux-mtd@lists.infradead.org; Fri, 28 Nov 2014 11:05:59 +0000
Received: by mail-wg0-f46.google.com with SMTP id a1so305562wgh.5
 for <linux-mtd@lists.infradead.org>; Fri, 28 Nov 2014 03:05:34 -0800 (PST)
MIME-Version: 1.0
Date: Fri, 28 Nov 2014 19:05:33 +0800
Message-ID: <CAG2=9p9mthUqE1QwnKxhdrqK61h5JCsFv3k5HLS_+TrCVBSx5Q@mail.gmail.com>
Subject: [PATCH] mtd: test: Replace timeval with ktime_t in speedtest.c and
 torturetest.c
From: Chunyan Zhang <zhang.chunyan@linaro.org>
To: dwmw2@infradead.org, computersforpeace@gmail.com
Content-Type: text/plain; charset=UTF-8
Cc: john.stultz@linaro.org, linux-mtd@lists.infradead.org,
 Arnd Bergmann <arnd@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch changes the 32-bit time type (timeval) to 64-bit
(ktime_t), since 32-bit time types will break in the year 2038.

I use ktime_t instead of timeval to define 'start' and 'finish'
which are used to get the time for tow points.

This patch also changes do_gettimeofday() to ktime_get() accordingly, since
ktime_get returns a ktime_t, but do_gettimeofday returns a struct timeval,
and the other reason is that ktime_get() uses the monotonic clock.

Signed-off-by: Chunyan Zhang <zhang.chunyan@linaro.org>
---
 drivers/mtd/tests/speedtest.c   |   10 +++++-----
 drivers/mtd/tests/torturetest.c |    9 ++++-----
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/tests/speedtest.c b/drivers/mtd/tests/speedtest.c
index 5ee9f70..73e26d6 100644
--- a/drivers/mtd/tests/speedtest.c
+++ b/drivers/mtd/tests/speedtest.c
@@ -29,6 +29,7 @@
 #include <linux/slab.h>
 #include <linux/sched.h>
 #include <linux/random.h>
+#include <linux/ktime.h>

 #include "mtd_test.h"

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
-       do_gettimeofday(&start);
+       start = ktime_get();
 }

 static inline void stop_timing(void)
 {
-       do_gettimeofday(&finish);
+       finish = ktime_get();
 }

 static long calc_speed(void)
@@ -181,8 +182,7 @@ static long calc_speed(void)
        uint64_t k;
        long ms;

-       ms = (finish.tv_sec - start.tv_sec) * 1000 +
-            (finish.tv_usec - start.tv_usec) / 1000;
+       ms = ktime_to_ms(ktime_sub(finish, start));
        if (ms == 0)
                return 0;
        k = goodebcnt * (mtd->erasesize / 1024) * 1000;
diff --git a/drivers/mtd/tests/torturetest.c b/drivers/mtd/tests/torturetest.c
index eeab969..620fff6 100644
--- a/drivers/mtd/tests/torturetest.c
+++ b/drivers/mtd/tests/torturetest.c
@@ -79,18 +79,18 @@ static unsigned char *check_buf;
 static unsigned int erase_cycles;

 static int pgsize;
-static struct timeval start, finish;
+static ktime_t start, finish;

 static void report_corrupt(unsigned char *read, unsigned char *written);

 static inline void start_timing(void)
 {
-       do_gettimeofday(&start);
+       start = ktime_get();
 }

 static inline void stop_timing(void)
 {
-       do_gettimeofday(&finish);
+       finish = ktime_get();
 }

 /*
@@ -322,8 +322,7 @@ static int __init tort_init(void)
                        long ms;

                        stop_timing();
-                       ms = (finish.tv_sec - start.tv_sec) * 1000 +
-                            (finish.tv_usec - start.tv_usec) / 1000;
+                       ms = ktime_to_ms(ktime_sub(finish, start));
                        pr_info("%08u erase cycles done, took %lu "
                               "milliseconds (%lu seconds)\n",
                               erase_cycles, ms, ms / 1000);
--
1.7.9.5
