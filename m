Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TWpSE-0003pk-CR
 for linux-mtd@lists.infradead.org; Fri, 09 Nov 2012 14:21:07 +0000
Received: by mail-pb0-f49.google.com with SMTP id xa7so2657897pbc.36
 for <linux-mtd@lists.infradead.org>; Fri, 09 Nov 2012 06:21:04 -0800 (PST)
From: Masanari Iida <standby24x7@gmail.com>
To: dwmw2@infradead.org, linux-mtd@lists.infradead.org, trivial@kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] [trivial] mtd: Fix typo mtd/tests
Date: Fri,  9 Nov 2012 23:20:58 +0900
Message-Id: <1352470858-12121-1-git-send-email-standby24x7@gmail.com>
Cc: Masanari Iida <standby24x7@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Correct spelling typo in printk within drivers/mtd/tests.

Signed-off-by: Masanari Iida <standby24x7@gmail.com>
---
 drivers/mtd/nand/nand_base.c        | 2 +-
 drivers/mtd/tests/mtd_oobtest.c     | 4 ++--
 drivers/mtd/tests/mtd_pagetest.c    | 2 +-
 drivers/mtd/tests/mtd_readtest.c    | 2 +-
 drivers/mtd/tests/mtd_speedtest.c   | 2 +-
 drivers/mtd/tests/mtd_stresstest.c  | 2 +-
 drivers/mtd/tests/mtd_subpagetest.c | 2 +-
 drivers/mtd/tests/mtd_torturetest.c | 2 +-
 8 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index d5ece6e..5732e2d 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -160,7 +160,7 @@ static uint8_t nand_read_byte(struct mtd_info *mtd)
 }
 
 /**
- * nand_read_byte16 - [DEFAULT] read one byte endianess aware from the chip
+ * nand_read_byte16 - [DEFAULT] read one byte endianness aware from the chip
  * nand_read_byte16 - [DEFAULT] read one byte endianness aware from the chip
  * @mtd: MTD device structure
  *
diff --git a/drivers/mtd/tests/mtd_oobtest.c b/drivers/mtd/tests/mtd_oobtest.c
index e86bb29..e827fa8 100644
--- a/drivers/mtd/tests/mtd_oobtest.c
+++ b/drivers/mtd/tests/mtd_oobtest.c
@@ -366,8 +366,8 @@ static int __init mtd_oobtest_init(void)
 	printk(KERN_INFO "=================================================\n");
 
 	if (dev < 0) {
-		pr_info("Please specify a valid mtd-device via module paramter\n");
-		pr_crit(KERN_CRIT "CAREFUL: This test wipes all data on the specified MTD device!\n");
+		pr_info("Please specify a valid mtd-device via module parameter\n");
+		pr_crit("CAREFUL: This test wipes all data on the specified MTD device!\n");
 		return -EINVAL;
 	}
 
diff --git a/drivers/mtd/tests/mtd_pagetest.c b/drivers/mtd/tests/mtd_pagetest.c
index 3ba2a77..f93a76f 100644
--- a/drivers/mtd/tests/mtd_pagetest.c
+++ b/drivers/mtd/tests/mtd_pagetest.c
@@ -499,7 +499,7 @@ static int __init mtd_pagetest_init(void)
 	printk(KERN_INFO "=================================================\n");
 
 	if (dev < 0) {
-		pr_info("Please specify a valid mtd-device via module paramter\n");
+		pr_info("Please specify a valid mtd-device via module parameter\n");
 		pr_crit("CAREFUL: This test wipes all data on the specified MTD device!\n");
 		return -EINVAL;
 	}
diff --git a/drivers/mtd/tests/mtd_readtest.c b/drivers/mtd/tests/mtd_readtest.c
index ec3efb5..31f505c 100644
--- a/drivers/mtd/tests/mtd_readtest.c
+++ b/drivers/mtd/tests/mtd_readtest.c
@@ -171,7 +171,7 @@ static int __init mtd_readtest_init(void)
 	printk(KERN_INFO "=================================================\n");
 
 	if (dev < 0) {
-		pr_info("Please specify a valid mtd-device via module paramter\n");
+		pr_info("Please specify a valid mtd-device via module parameter\n");
 		return -EINVAL;
 	}
 
diff --git a/drivers/mtd/tests/mtd_speedtest.c b/drivers/mtd/tests/mtd_speedtest.c
index 8a5803b..596cbea 100644
--- a/drivers/mtd/tests/mtd_speedtest.c
+++ b/drivers/mtd/tests/mtd_speedtest.c
@@ -351,7 +351,7 @@ static int __init mtd_speedtest_init(void)
 	printk(KERN_INFO "=================================================\n");
 
 	if (dev < 0) {
-		pr_info("Please specify a valid mtd-device via module paramter\n");
+		pr_info("Please specify a valid mtd-device via module parameter\n");
 		pr_crit("CAREFUL: This test wipes all data on the specified MTD device!\n");
 		return -EINVAL;
 	}
diff --git a/drivers/mtd/tests/mtd_stresstest.c b/drivers/mtd/tests/mtd_stresstest.c
index fea1dd7..3729f67 100644
--- a/drivers/mtd/tests/mtd_stresstest.c
+++ b/drivers/mtd/tests/mtd_stresstest.c
@@ -231,7 +231,7 @@ static int __init mtd_stresstest_init(void)
 	printk(KERN_INFO "=================================================\n");
 
 	if (dev < 0) {
-		pr_info("Please specify a valid mtd-device via module paramter\n");
+		pr_info("Please specify a valid mtd-device via module parameter\n");
 		pr_crit("CAREFUL: This test wipes all data on the specified MTD device!\n");
 		return -EINVAL;
 	}
diff --git a/drivers/mtd/tests/mtd_subpagetest.c b/drivers/mtd/tests/mtd_subpagetest.c
index 8813b0e..c880c22 100644
--- a/drivers/mtd/tests/mtd_subpagetest.c
+++ b/drivers/mtd/tests/mtd_subpagetest.c
@@ -377,7 +377,7 @@ static int __init mtd_subpagetest_init(void)
 	printk(KERN_INFO "=================================================\n");
 
 	if (dev < 0) {
-		pr_info("Please specify a valid mtd-device via module paramter\n");
+		pr_info("Please specify a valid mtd-device via module parameter\n");
 		pr_crit("CAREFUL: This test wipes all data on the specified MTD device!\n");
 		return -EINVAL;
 	}
diff --git a/drivers/mtd/tests/mtd_torturetest.c b/drivers/mtd/tests/mtd_torturetest.c
index 98d2a82..c4cde1e 100644
--- a/drivers/mtd/tests/mtd_torturetest.c
+++ b/drivers/mtd/tests/mtd_torturetest.c
@@ -216,7 +216,7 @@ static int __init tort_init(void)
 	       "flash, stop it if this is not wanted.\n");
 
 	if (dev < 0) {
-		pr_info("Please specify a valid mtd-device via module paramter\n");
+		pr_info("Please specify a valid mtd-device via module parameter\n");
 		pr_crit("CAREFUL: This test wipes all data on the specified MTD device!\n");
 		return -EINVAL;
 	}
-- 
1.8.0.rc3.16.g8ead1bf
