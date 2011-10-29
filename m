Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RKH8F-0008S9-MJ
	for linux-mtd@lists.infradead.org; Sat, 29 Oct 2011 22:12:05 +0000
From: Wolfram Sang <w.sang@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH V3 1/2] mtd: tests: don't use mtd0 as a default
Date: Sun, 30 Oct 2011 00:11:53 +0200
Message-Id: <1319926313-22738-1-git-send-email-w.sang@pengutronix.de>
In-Reply-To: <1319922741.2126.24.camel@koala>
References: <1319922741.2126.24.camel@koala>
Cc: Wolfram Sang <w.sang@pengutronix.de>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

mtd tests may erase the mtd device, so force the user to specify which
mtd device to test by using the module parameter. Disable the default
(using mtd0) since this may destroy a vital part of the flash if the
module is inserted accidently or carelessly.

Reported-by: Roland Kletzing <devzero@web.de>
Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
---
Like this?

changes since v2: use KERN_CRIT and update message accordingly

 drivers/mtd/tests/mtd_oobtest.c     |    9 ++++++++-
 drivers/mtd/tests/mtd_pagetest.c    |    9 ++++++++-
 drivers/mtd/tests/mtd_readtest.c    |    8 +++++++-
 drivers/mtd/tests/mtd_speedtest.c   |    9 ++++++++-
 drivers/mtd/tests/mtd_stresstest.c  |    9 ++++++++-
 drivers/mtd/tests/mtd_subpagetest.c |    9 ++++++++-
 drivers/mtd/tests/mtd_torturetest.c |    9 ++++++++-
 7 files changed, 55 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/tests/mtd_oobtest.c b/drivers/mtd/tests/mtd_oobtest.c
index dec92ae..7a861c3 100644
--- a/drivers/mtd/tests/mtd_oobtest.c
+++ b/drivers/mtd/tests/mtd_oobtest.c
@@ -30,7 +30,7 @@
 
 #define PRINT_PREF KERN_INFO "mtd_oobtest: "
 
-static int dev;
+static int dev = -EINVAL;
 module_param(dev, int, S_IRUGO);
 MODULE_PARM_DESC(dev, "MTD device number to use");
 
@@ -366,6 +366,13 @@ static int __init mtd_oobtest_init(void)
 
 	printk(KERN_INFO "\n");
 	printk(KERN_INFO "=================================================\n");
+
+	if (dev < 0) {
+		printk(PRINT_PREF "Please specify a valid mtd-device via module paramter\n");
+		printk(KERN_CRIT "CAREFUL: This test wipes all data on the specified MTD device!\n");
+		return -EINVAL;
+	}
+
 	printk(PRINT_PREF "MTD device: %d\n", dev);
 
 	mtd = get_mtd_device(NULL, dev);
diff --git a/drivers/mtd/tests/mtd_pagetest.c b/drivers/mtd/tests/mtd_pagetest.c
index 00b937e..2e4d183 100644
--- a/drivers/mtd/tests/mtd_pagetest.c
+++ b/drivers/mtd/tests/mtd_pagetest.c
@@ -30,7 +30,7 @@
 
 #define PRINT_PREF KERN_INFO "mtd_pagetest: "
 
-static int dev;
+static int dev = -EINVAL;
 module_param(dev, int, S_IRUGO);
 MODULE_PARM_DESC(dev, "MTD device number to use");
 
@@ -504,6 +504,13 @@ static int __init mtd_pagetest_init(void)
 
 	printk(KERN_INFO "\n");
 	printk(KERN_INFO "=================================================\n");
+
+	if (dev < 0) {
+		printk(PRINT_PREF "Please specify a valid mtd-device via module paramter\n");
+		printk(KERN_CRIT "CAREFUL: This test wipes all data on the specified MTD device!\n");
+		return -EINVAL;
+	}
+
 	printk(PRINT_PREF "MTD device: %d\n", dev);
 
 	mtd = get_mtd_device(NULL, dev);
diff --git a/drivers/mtd/tests/mtd_readtest.c b/drivers/mtd/tests/mtd_readtest.c
index afe71aa..ce7ba4d 100644
--- a/drivers/mtd/tests/mtd_readtest.c
+++ b/drivers/mtd/tests/mtd_readtest.c
@@ -29,7 +29,7 @@
 
 #define PRINT_PREF KERN_INFO "mtd_readtest: "
 
-static int dev;
+static int dev = -EINVAL;
 module_param(dev, int, S_IRUGO);
 MODULE_PARM_DESC(dev, "MTD device number to use");
 
@@ -169,6 +169,12 @@ static int __init mtd_readtest_init(void)
 
 	printk(KERN_INFO "\n");
 	printk(KERN_INFO "=================================================\n");
+
+	if (dev < 0) {
+		printk(PRINT_PREF "Please specify a valid mtd-device via module paramter\n");
+		return -EINVAL;
+	}
+
 	printk(PRINT_PREF "MTD device: %d\n", dev);
 
 	mtd = get_mtd_device(NULL, dev);
diff --git a/drivers/mtd/tests/mtd_speedtest.c b/drivers/mtd/tests/mtd_speedtest.c
index 627d4e2..612c87e 100644
--- a/drivers/mtd/tests/mtd_speedtest.c
+++ b/drivers/mtd/tests/mtd_speedtest.c
@@ -29,7 +29,7 @@
 
 #define PRINT_PREF KERN_INFO "mtd_speedtest: "
 
-static int dev;
+static int dev = -EINVAL;
 module_param(dev, int, S_IRUGO);
 MODULE_PARM_DESC(dev, "MTD device number to use");
 
@@ -361,6 +361,13 @@ static int __init mtd_speedtest_init(void)
 
 	printk(KERN_INFO "\n");
 	printk(KERN_INFO "=================================================\n");
+
+	if (dev < 0) {
+		printk(PRINT_PREF "Please specify a valid mtd-device via module paramter\n");
+		printk(KERN_CRIT "CAREFUL: This test wipes all data on the specified MTD device!\n");
+		return -EINVAL;
+	}
+
 	if (count)
 		printk(PRINT_PREF "MTD device: %d    count: %d\n", dev, count);
 	else
diff --git a/drivers/mtd/tests/mtd_stresstest.c b/drivers/mtd/tests/mtd_stresstest.c
index 531625f..d48a39c 100644
--- a/drivers/mtd/tests/mtd_stresstest.c
+++ b/drivers/mtd/tests/mtd_stresstest.c
@@ -30,7 +30,7 @@
 
 #define PRINT_PREF KERN_INFO "mtd_stresstest: "
 
-static int dev;
+static int dev = -EINVAL;
 module_param(dev, int, S_IRUGO);
 MODULE_PARM_DESC(dev, "MTD device number to use");
 
@@ -250,6 +250,13 @@ static int __init mtd_stresstest_init(void)
 
 	printk(KERN_INFO "\n");
 	printk(KERN_INFO "=================================================\n");
+
+	if (dev < 0) {
+		printk(PRINT_PREF "Please specify a valid mtd-device via module paramter\n");
+		printk(KERN_CRIT "CAREFUL: This test wipes all data on the specified MTD device!\n");
+		return -EINVAL;
+	}
+
 	printk(PRINT_PREF "MTD device: %d\n", dev);
 
 	mtd = get_mtd_device(NULL, dev);
diff --git a/drivers/mtd/tests/mtd_subpagetest.c b/drivers/mtd/tests/mtd_subpagetest.c
index 334eae5..f43b909 100644
--- a/drivers/mtd/tests/mtd_subpagetest.c
+++ b/drivers/mtd/tests/mtd_subpagetest.c
@@ -29,7 +29,7 @@
 
 #define PRINT_PREF KERN_INFO "mtd_subpagetest: "
 
-static int dev;
+static int dev = -EINVAL;
 module_param(dev, int, S_IRUGO);
 MODULE_PARM_DESC(dev, "MTD device number to use");
 
@@ -379,6 +379,13 @@ static int __init mtd_subpagetest_init(void)
 
 	printk(KERN_INFO "\n");
 	printk(KERN_INFO "=================================================\n");
+
+	if (dev < 0) {
+		printk(PRINT_PREF "Please specify a valid mtd-device via module paramter\n");
+		printk(KERN_CRIT "CAREFUL: This test wipes all data on the specified MTD device!\n");
+		return -EINVAL;
+	}
+
 	printk(PRINT_PREF "MTD device: %d\n", dev);
 
 	mtd = get_mtd_device(NULL, dev);
diff --git a/drivers/mtd/tests/mtd_torturetest.c b/drivers/mtd/tests/mtd_torturetest.c
index 5c6c3d2..65debad 100644
--- a/drivers/mtd/tests/mtd_torturetest.c
+++ b/drivers/mtd/tests/mtd_torturetest.c
@@ -46,7 +46,7 @@ static int pgcnt;
 module_param(pgcnt, int, S_IRUGO);
 MODULE_PARM_DESC(pgcnt, "number of pages per eraseblock to torture (0 => all)");
 
-static int dev;
+static int dev = -EINVAL;
 module_param(dev, int, S_IRUGO);
 MODULE_PARM_DESC(dev, "MTD device number to use");
 
@@ -213,6 +213,13 @@ static int __init tort_init(void)
 	printk(KERN_INFO "=================================================\n");
 	printk(PRINT_PREF "Warning: this program is trying to wear out your "
 	       "flash, stop it if this is not wanted.\n");
+
+	if (dev < 0) {
+		printk(PRINT_PREF "Please specify a valid mtd-device via module paramter\n");
+		printk(KERN_CRIT "CAREFUL: This test wipes all data on the specified MTD device!\n");
+		return -EINVAL;
+	}
+
 	printk(PRINT_PREF "MTD device: %d\n", dev);
 	printk(PRINT_PREF "torture %d eraseblocks (%d-%d) of mtd%d\n",
 	       ebcnt, eb, eb + ebcnt - 1, dev);
-- 
1.7.6.3
