From: dave@lambsys.com (David Lambert)
Date: Mon, 7 Mar 2011 12:00:46 +0200
Subject: [PATCH] mtd: speedtest: fix integer overflow
Message-ID: <mailman.162.1299492669.1530.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

32-bit integers used in 'calc_speed()' may overflow and lead to
incorrect results. Use 64-bit integers instead.

Signed-off-by: David Lambert <dave@lambsys.com>
Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/tests/mtd_speedtest.c |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/tests/mtd_speedtest.c b/drivers/mtd/tests/mtd_speedtest.c
index 3ce6fce..22b51c1 100644
--- a/drivers/mtd/tests/mtd_speedtest.c
+++ b/drivers/mtd/tests/mtd_speedtest.c
@@ -314,16 +314,16 @@ static inline void stop_timing(void)
 
 static long calc_speed(void)
 {
-	long ms, k, speed;
+       uint64_t k;
+       long ms;
 
 	ms = (finish.tv_sec - start.tv_sec) * 1000 +
 	     (finish.tv_usec - start.tv_usec) / 1000;
-	k = goodebcnt * mtd->erasesize / 1024;
-	if (ms)
-		speed = (k * 1000) / ms;
-	else
-		speed = 0;
-	return speed;
+	if (ms == 0)
+		return 0;
+	k = goodebcnt * (mtd->erasesize / 1024) * 1000;
+	do_div(k, ms);
+	return k;
 }
 
 static int scan_for_bad_eraseblocks(void)
-- 
1.7.2.3

-- 
Best Regards,
Artem Bityutskiy (?????????? ????????????????)
