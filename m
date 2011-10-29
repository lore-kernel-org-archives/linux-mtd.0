From: Artem.Bityutskiy@intel.com (Artem Bityutskiy)
Date: Sat, 29 Oct 2011 23:20:34 +0300
Subject: [PATCH] mtd: add a scary warning
Message-ID: <mailman.200.1319920106.20020.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

The MTD tests require mtd device number to be specified. If the user
does not specify it, print a message and warn that the tests are
destructive and will wipe whole MTD device. This is a measure to make
sure we do not have more reports from unhappy users accidentally losing
their data.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@intel.com>
---
 drivers/mtd/tests/mtd_oobtest.c     |    6 ++++++
 drivers/mtd/tests/mtd_pagetest.c    |    6 ++++++
 drivers/mtd/tests/mtd_readtest.c    |    5 +++++
 drivers/mtd/tests/mtd_speedtest.c   |    6 ++++++
 drivers/mtd/tests/mtd_stresstest.c  |    6 ++++++
 drivers/mtd/tests/mtd_subpagetest.c |    6 ++++++
 drivers/mtd/tests/mtd_torturetest.c |    6 ++++++
 7 files changed, 41 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/tests/mtd_oobtest.c b/drivers/mtd/tests/mtd_oobtest.c
index f253acb..673f3d1 100644
--- a/drivers/mtd/tests/mtd_oobtest.c
+++ b/drivers/mtd/tests/mtd_oobtest.c
@@ -364,6 +364,12 @@ static int __init mtd_oobtest_init(void)
 	struct mtd_oob_ops ops;
 	loff_t addr = 0, addr0;
 
+	if (dev == -1) {
+		printk(KERN_ERR "Please, specify the MTD device\n");
+		printk(KERN_ALERT "Careful! This test will wipe the MTD device!\n");
+		return -EINVAL;
+	}
+
 	printk(KERN_INFO "\n");
 	printk(KERN_INFO "=================================================\n");
 	printk(PRINT_PREF "MTD device: %d\n", dev);
diff --git a/drivers/mtd/tests/mtd_pagetest.c b/drivers/mtd/tests/mtd_pagetest.c
index f27b196..e4c263d 100644
--- a/drivers/mtd/tests/mtd_pagetest.c
+++ b/drivers/mtd/tests/mtd_pagetest.c
@@ -502,6 +502,12 @@ static int __init mtd_pagetest_init(void)
 	uint64_t tmp;
 	uint32_t i;
 
+	if (dev == -1) {
+		printk(KERN_ERR "Please, specify the MTD device\n");
+		printk(KERN_ALERT "Careful! This test will wipe the MTD device!\n");
+		return -EINVAL;
+	}
+
 	printk(KERN_INFO "\n");
 	printk(KERN_INFO "=================================================\n");
 	printk(PRINT_PREF "MTD device: %d\n", dev);
diff --git a/drivers/mtd/tests/mtd_readtest.c b/drivers/mtd/tests/mtd_readtest.c
index a40d860..7b44d57 100644
--- a/drivers/mtd/tests/mtd_readtest.c
+++ b/drivers/mtd/tests/mtd_readtest.c
@@ -168,6 +168,11 @@ static int __init mtd_readtest_init(void)
 	uint64_t tmp;
 	int err, i;
 
+	if (dev == -1) {
+		printk(KERN_ERR "Please, specify the MTD device\n");
+		return -EINVAL;
+	}
+
 	printk(KERN_INFO "\n");
 	printk(KERN_INFO "=================================================\n");
 	printk(PRINT_PREF "MTD device: %d\n", dev);
diff --git a/drivers/mtd/tests/mtd_speedtest.c b/drivers/mtd/tests/mtd_speedtest.c
index 7ce07f9..a82ac11 100644
--- a/drivers/mtd/tests/mtd_speedtest.c
+++ b/drivers/mtd/tests/mtd_speedtest.c
@@ -359,6 +359,12 @@ static int __init mtd_speedtest_init(void)
 	long speed;
 	uint64_t tmp;
 
+	if (dev == -1) {
+		printk(KERN_ERR "Please, specify the MTD device\n");
+		printk(KERN_ALERT "Careful! This test will wipe the MTD device!\n");
+		return -EINVAL;
+	}
+
 	printk(KERN_INFO "\n");
 	printk(KERN_INFO "=================================================\n");
 	if (count)
diff --git a/drivers/mtd/tests/mtd_stresstest.c b/drivers/mtd/tests/mtd_stresstest.c
index b4f8879..376fd16 100644
--- a/drivers/mtd/tests/mtd_stresstest.c
+++ b/drivers/mtd/tests/mtd_stresstest.c
@@ -248,6 +248,12 @@ static int __init mtd_stresstest_init(void)
 	int i, op;
 	uint64_t tmp;
 
+	if (dev == -1) {
+		printk(KERN_ERR "Please, specify the MTD device\n");
+		printk(KERN_ALERT "Careful! This test will wipe the MTD device!\n");
+		return -EINVAL;
+	}
+
 	printk(KERN_INFO "\n");
 	printk(KERN_INFO "=================================================\n");
 	printk(PRINT_PREF "MTD device: %d\n", dev);
diff --git a/drivers/mtd/tests/mtd_subpagetest.c b/drivers/mtd/tests/mtd_subpagetest.c
index 85a86a7..d6f983f 100644
--- a/drivers/mtd/tests/mtd_subpagetest.c
+++ b/drivers/mtd/tests/mtd_subpagetest.c
@@ -377,6 +377,12 @@ static int __init mtd_subpagetest_init(void)
 	uint32_t i;
 	uint64_t tmp;
 
+	if (dev == -1) {
+		printk(KERN_ERR "Please, specify the MTD device\n");
+		printk(KERN_ALERT "Careful! This test will wipe the MTD device!\n");
+		return -EINVAL;
+	}
+
 	printk(KERN_INFO "\n");
 	printk(KERN_INFO "=================================================\n");
 	printk(PRINT_PREF "MTD device: %d\n", dev);
diff --git a/drivers/mtd/tests/mtd_torturetest.c b/drivers/mtd/tests/mtd_torturetest.c
index fb3b903..a08c3cd 100644
--- a/drivers/mtd/tests/mtd_torturetest.c
+++ b/drivers/mtd/tests/mtd_torturetest.c
@@ -209,6 +209,12 @@ static int __init tort_init(void)
 	int err = 0, i, infinite = !cycles_count;
 	int bad_ebs[ebcnt];
 
+	if (dev == -1) {
+		printk(KERN_ERR "Please, specify the MTD device\n");
+		printk(KERN_ALERT "Careful! This test will wipe the MTD device!\n");
+		return -EINVAL;
+	}
+
 	printk(KERN_INFO "\n");
 	printk(KERN_INFO "=================================================\n");
 	printk(PRINT_PREF "Warning: this program is trying to wear out your "
-- 
1.7.6
