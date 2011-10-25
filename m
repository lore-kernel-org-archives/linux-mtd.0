Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RId1V-0004Cx-8X
	for linux-mtd@lists.infradead.org; Tue, 25 Oct 2011 09:10:20 +0000
From: Wolfram Sang <w.sang@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mtd: tests: don't use mtd0 as a default
Date: Tue, 25 Oct 2011 11:09:50 +0200
Message-Id: <1319533791-32605-1-git-send-email-w.sang@pengutronix.de>
Cc: Roland Kletzing <devzero@web.de>, Wolfram Sang <w.sang@pengutronix.de>,
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
 drivers/mtd/tests/mtd_oobtest.c     |    2 +-
 drivers/mtd/tests/mtd_pagetest.c    |    2 +-
 drivers/mtd/tests/mtd_readtest.c    |    2 +-
 drivers/mtd/tests/mtd_speedtest.c   |    2 +-
 drivers/mtd/tests/mtd_stresstest.c  |    2 +-
 drivers/mtd/tests/mtd_subpagetest.c |    2 +-
 drivers/mtd/tests/mtd_torturetest.c |    2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/tests/mtd_oobtest.c b/drivers/mtd/tests/mtd_oobtest.c
index dec92ae..ff77b8e 100644
--- a/drivers/mtd/tests/mtd_oobtest.c
+++ b/drivers/mtd/tests/mtd_oobtest.c
@@ -30,7 +30,7 @@
 
 #define PRINT_PREF KERN_INFO "mtd_oobtest: "
 
-static int dev;
+static int dev = -1;
 module_param(dev, int, S_IRUGO);
 MODULE_PARM_DESC(dev, "MTD device number to use");
 
diff --git a/drivers/mtd/tests/mtd_pagetest.c b/drivers/mtd/tests/mtd_pagetest.c
index 00b937e..0b4db4e 100644
--- a/drivers/mtd/tests/mtd_pagetest.c
+++ b/drivers/mtd/tests/mtd_pagetest.c
@@ -30,7 +30,7 @@
 
 #define PRINT_PREF KERN_INFO "mtd_pagetest: "
 
-static int dev;
+static int dev = -1;
 module_param(dev, int, S_IRUGO);
 MODULE_PARM_DESC(dev, "MTD device number to use");
 
diff --git a/drivers/mtd/tests/mtd_readtest.c b/drivers/mtd/tests/mtd_readtest.c
index afe71aa..1a285c4 100644
--- a/drivers/mtd/tests/mtd_readtest.c
+++ b/drivers/mtd/tests/mtd_readtest.c
@@ -29,7 +29,7 @@
 
 #define PRINT_PREF KERN_INFO "mtd_readtest: "
 
-static int dev;
+static int dev = -1;
 module_param(dev, int, S_IRUGO);
 MODULE_PARM_DESC(dev, "MTD device number to use");
 
diff --git a/drivers/mtd/tests/mtd_speedtest.c b/drivers/mtd/tests/mtd_speedtest.c
index 627d4e2..71c9457 100644
--- a/drivers/mtd/tests/mtd_speedtest.c
+++ b/drivers/mtd/tests/mtd_speedtest.c
@@ -29,7 +29,7 @@
 
 #define PRINT_PREF KERN_INFO "mtd_speedtest: "
 
-static int dev;
+static int dev = -1;
 module_param(dev, int, S_IRUGO);
 MODULE_PARM_DESC(dev, "MTD device number to use");
 
diff --git a/drivers/mtd/tests/mtd_stresstest.c b/drivers/mtd/tests/mtd_stresstest.c
index 531625f..38bba93 100644
--- a/drivers/mtd/tests/mtd_stresstest.c
+++ b/drivers/mtd/tests/mtd_stresstest.c
@@ -30,7 +30,7 @@
 
 #define PRINT_PREF KERN_INFO "mtd_stresstest: "
 
-static int dev;
+static int dev = -1;
 module_param(dev, int, S_IRUGO);
 MODULE_PARM_DESC(dev, "MTD device number to use");
 
diff --git a/drivers/mtd/tests/mtd_subpagetest.c b/drivers/mtd/tests/mtd_subpagetest.c
index 334eae5..6140be7 100644
--- a/drivers/mtd/tests/mtd_subpagetest.c
+++ b/drivers/mtd/tests/mtd_subpagetest.c
@@ -29,7 +29,7 @@
 
 #define PRINT_PREF KERN_INFO "mtd_subpagetest: "
 
-static int dev;
+static int dev = -1;
 module_param(dev, int, S_IRUGO);
 MODULE_PARM_DESC(dev, "MTD device number to use");
 
diff --git a/drivers/mtd/tests/mtd_torturetest.c b/drivers/mtd/tests/mtd_torturetest.c
index 5c6c3d2..f339185 100644
--- a/drivers/mtd/tests/mtd_torturetest.c
+++ b/drivers/mtd/tests/mtd_torturetest.c
@@ -46,7 +46,7 @@ static int pgcnt;
 module_param(pgcnt, int, S_IRUGO);
 MODULE_PARM_DESC(pgcnt, "number of pages per eraseblock to torture (0 => all)");
 
-static int dev;
+static int dev = -1;
 module_param(dev, int, S_IRUGO);
 MODULE_PARM_DESC(dev, "MTD device number to use");
 
-- 
1.7.6.3
