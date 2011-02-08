Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PmkPy-0000Ip-Oj
	for linux-mtd@lists.infradead.org; Tue, 08 Feb 2011 10:03:31 +0000
From: Adrian Hunter <adrian.hunter@nokia.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 2/5] mtd: tests: add count parameter to mtd_speedtest
Date: Tue,  8 Feb 2011 12:02:39 +0200
Message-Id: <1297159362-8407-3-git-send-email-adrian.hunter@nokia.com>
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

By default mtd_speedtest uses all the eraseblocks of the
MTD partition being tested.  For large partitions a
smaller number is sufficient and makes running the test
quicker.  For that reason, add a parameter 'count' to
specify the maximum number of eraseblocks to use for
testing.

Signed-off-by: Adrian Hunter <adrian.hunter@nokia.com>
---
 drivers/mtd/tests/mtd_speedtest.c |   15 +++++++++++++--
 1 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/tests/mtd_speedtest.c b/drivers/mtd/tests/mtd_speedtest.c
index 161feeb..9bd986e 100644
--- a/drivers/mtd/tests/mtd_speedtest.c
+++ b/drivers/mtd/tests/mtd_speedtest.c
@@ -16,7 +16,7 @@
  *
  * Test read and write speed of a MTD device.
  *
- * Author: Adrian Hunter <ext-adrian.hunter@nokia.com>
+ * Author: Adrian Hunter <adrian.hunter@nokia.com>
  */
 
 #include <linux/init.h>
@@ -33,6 +33,11 @@ static int dev;
 module_param(dev, int, S_IRUGO);
 MODULE_PARM_DESC(dev, "MTD device number to use");
 
+static int count;
+module_param(count, int, S_IRUGO);
+MODULE_PARM_DESC(count, "Maximum number of eraseblocks to use "
+			"(0 means use all)");
+
 static struct mtd_info *mtd;
 static unsigned char *iobuf;
 static unsigned char *bbt;
@@ -326,7 +331,10 @@ static int __init mtd_speedtest_init(void)
 
 	printk(KERN_INFO "\n");
 	printk(KERN_INFO "=================================================\n");
-	printk(PRINT_PREF "MTD device: %d\n", dev);
+	if (count)
+		printk(PRINT_PREF "MTD device: %d    count: %d\n", dev, count);
+	else
+		printk(PRINT_PREF "MTD device: %d\n", dev);
 
 	mtd = get_mtd_device(NULL, dev);
 	if (IS_ERR(mtd)) {
@@ -353,6 +361,9 @@ static int __init mtd_speedtest_init(void)
 	       (unsigned long long)mtd->size, mtd->erasesize,
 	       pgsize, ebcnt, pgcnt, mtd->oobsize);
 
+	if (count > 0 && count < ebcnt)
+		ebcnt = count;
+
 	err = -ENOMEM;
 	iobuf = kmalloc(mtd->erasesize, GFP_KERNEL);
 	if (!iobuf) {
-- 
1.7.0.4
