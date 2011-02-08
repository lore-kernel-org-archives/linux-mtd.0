Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PmkPh-0000H9-LZ
	for linux-mtd@lists.infradead.org; Tue, 08 Feb 2011 10:03:14 +0000
From: Adrian Hunter <adrian.hunter@nokia.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 3/5] mtd: tests: add multiblock erase test to the mtd_speedtest
Date: Tue,  8 Feb 2011 12:02:40 +0200
Message-Id: <1297159362-8407-4-git-send-email-adrian.hunter@nokia.com>
In-Reply-To: <1297159362-8407-1-git-send-email-adrian.hunter@nokia.com>
References: <1297159362-8407-1-git-send-email-adrian.hunter@nokia.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>,
	Adrian Hunter <adrian.hunter@nokia.com>,
	linux-mtd Mailing List <linux-mtd@lists.infradead.org>,
	Roman Tereshonkov <roman.tereshonkov@nokia.com>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Roman Tereshonkov <roman.tereshonkov@nokia.com>

New multiblock erase speed test is added to mtd_speedtest.
It consists of 2-, 4-, 8-, 16-, 32- and 64-blocks at once
multiblock erase tests.

Signed-off-by: Roman Tereshonkov <roman.tereshonkov@nokia.com>
---
 drivers/mtd/tests/mtd_speedtest.c |   59 +++++++++++++++++++++++++++++++++++-
 1 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/tests/mtd_speedtest.c b/drivers/mtd/tests/mtd_speedtest.c
index 9bd986e..3ce6fce 100644
--- a/drivers/mtd/tests/mtd_speedtest.c
+++ b/drivers/mtd/tests/mtd_speedtest.c
@@ -94,6 +94,33 @@ static int erase_eraseblock(int ebnum)
 	return 0;
 }
 
+static int multiblock_erase(int ebnum, int blocks)
+{
+	int err;
+	struct erase_info ei;
+	loff_t addr = ebnum * mtd->erasesize;
+
+	memset(&ei, 0, sizeof(struct erase_info));
+	ei.mtd  = mtd;
+	ei.addr = addr;
+	ei.len  = mtd->erasesize * blocks;
+
+	err = mtd->erase(mtd, &ei);
+	if (err) {
+		printk(PRINT_PREF "error %d while erasing EB %d, blocks %d\n",
+		       err, ebnum, blocks);
+		return err;
+	}
+
+	if (ei.state == MTD_ERASE_FAILED) {
+		printk(PRINT_PREF "some erase error occurred at EB %d,"
+		       "blocks %d\n", ebnum, blocks);
+		return -EIO;
+	}
+
+	return 0;
+}
+
 static int erase_whole_device(void)
 {
 	int err;
@@ -292,7 +319,10 @@ static long calc_speed(void)
 	ms = (finish.tv_sec - start.tv_sec) * 1000 +
 	     (finish.tv_usec - start.tv_usec) / 1000;
 	k = goodebcnt * mtd->erasesize / 1024;
-	speed = (k * 1000) / ms;
+	if (ms)
+		speed = (k * 1000) / ms;
+	else
+		speed = 0;
 	return speed;
 }
 
@@ -325,7 +355,7 @@ out:
 
 static int __init mtd_speedtest_init(void)
 {
-	int err, i;
+	int err, i, blocks, j, k;
 	long speed;
 	uint64_t tmp;
 
@@ -495,6 +525,31 @@ static int __init mtd_speedtest_init(void)
 	speed = calc_speed();
 	printk(PRINT_PREF "erase speed is %ld KiB/s\n", speed);
 
+	/* Multi-block erase all eraseblocks */
+	for (k = 1; k < 7; k++) {
+		blocks = 1 << k;
+		printk(PRINT_PREF "Testing %dx multi-block erase speed\n",
+		       blocks);
+		start_timing();
+		for (i = 0; i < ebcnt; ) {
+			for (j = 0; j < blocks && (i + j) < ebcnt; j++)
+				if (bbt[i + j])
+					break;
+			if (j < 1) {
+				i++;
+				continue;
+			}
+			err = multiblock_erase(i, j);
+			if (err)
+				goto out;
+			cond_resched();
+			i += j;
+		}
+		stop_timing();
+		speed = calc_speed();
+		printk(PRINT_PREF "%dx multi-block erase speed is %ld KiB/s\n",
+		       blocks, speed);
+	}
 	printk(PRINT_PREF "finished\n");
 out:
 	kfree(iobuf);
-- 
1.7.0.4
