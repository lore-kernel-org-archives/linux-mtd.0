Received: from mail-pd0-x22f.google.com ([2607:f8b0:400e:c02::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VGUU5-0007nA-5n
 for linux-mtd@lists.infradead.org; Mon, 02 Sep 2013 13:48:02 +0000
Received: by mail-pd0-f175.google.com with SMTP id q10so4743909pdj.6
 for <linux-mtd@lists.infradead.org>; Mon, 02 Sep 2013 06:47:39 -0700 (PDT)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: tests: make a separate mtd_test.ko module
Date: Mon,  2 Sep 2013 22:46:15 +0900
Message-Id: <1378129575-4434-1-git-send-email-akinobu.mita@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Vikram Narayanan <vikram186@gmail.com>, Akinobu Mita <akinobu.mita@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Instead of linking a separate copy into every test module, this makes
a separate mtd_test.ko module and have it exported the symbols.

The mtd tests are often edited, compiled and run by hand, so it is
worth avoiding the extra step of inserting another module.  That is
the reason why it was linked in that way in the first place.

If we want to restore the previous behaviour temporarily in a custom
mtd test module, we can build it by adding the following lines in
Makefile, though you need to ignore the warnings like "'mtdtest_write'
exported twice".

	obj-$(CONFIG_MTD_TESTS) += mtd_mytest.o
	mtd_mytest-objs := mytest.o mtd_test.o

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Vikram Narayanan <vikram186@gmail.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/tests/Makefile   | 17 +++++++++--------
 drivers/mtd/tests/mtd_test.c | 10 +++++++++-
 2 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/tests/Makefile b/drivers/mtd/tests/Makefile
index 937a829..1912c5d 100644
--- a/drivers/mtd/tests/Makefile
+++ b/drivers/mtd/tests/Makefile
@@ -1,3 +1,4 @@
+obj-$(CONFIG_MTD_TESTS) += mtd_test.o
 obj-$(CONFIG_MTD_TESTS) += mtd_oobtest.o
 obj-$(CONFIG_MTD_TESTS) += mtd_pagetest.o
 obj-$(CONFIG_MTD_TESTS) += mtd_readtest.o
@@ -8,11 +9,11 @@ obj-$(CONFIG_MTD_TESTS) += mtd_torturetest.o
 obj-$(CONFIG_MTD_TESTS) += mtd_nandecctest.o
 obj-$(CONFIG_MTD_TESTS) += mtd_nandbiterrs.o
 
-mtd_oobtest-objs := oobtest.o mtd_test.o
-mtd_pagetest-objs := pagetest.o mtd_test.o
-mtd_readtest-objs := readtest.o mtd_test.o
-mtd_speedtest-objs := speedtest.o mtd_test.o
-mtd_stresstest-objs := stresstest.o mtd_test.o
-mtd_subpagetest-objs := subpagetest.o mtd_test.o
-mtd_torturetest-objs := torturetest.o mtd_test.o
-mtd_nandbiterrs-objs := nandbiterrs.o mtd_test.o
+mtd_oobtest-objs := oobtest.o
+mtd_pagetest-objs := pagetest.o
+mtd_readtest-objs := readtest.o
+mtd_speedtest-objs := speedtest.o
+mtd_stresstest-objs := stresstest.o
+mtd_subpagetest-objs := subpagetest.o
+mtd_torturetest-objs := torturetest.o
+mtd_nandbiterrs-objs := nandbiterrs.o
diff --git a/drivers/mtd/tests/mtd_test.c b/drivers/mtd/tests/mtd_test.c
index 943e510..f42922e 100644
--- a/drivers/mtd/tests/mtd_test.c
+++ b/drivers/mtd/tests/mtd_test.c
@@ -1,4 +1,4 @@
-#define pr_fmt(fmt) "mtd_test: " fmt
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/init.h>
 #include <linux/module.h>
@@ -30,6 +30,7 @@ int mtdtest_erase_eraseblock(struct mtd_info *mtd, unsigned int ebnum)
 	}
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtdtest_erase_eraseblock);
 
 static int is_block_bad(struct mtd_info *mtd, unsigned int ebnum)
 {
@@ -63,6 +64,7 @@ int mtdtest_scan_for_bad_eraseblocks(struct mtd_info *mtd, unsigned long *bbt,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtdtest_scan_for_bad_eraseblocks);
 
 int mtdtest_erase_good_eraseblocks(struct mtd_info *mtd, unsigned long *bbt,
 				unsigned int eb, int ebcnt)
@@ -79,6 +81,7 @@ int mtdtest_erase_good_eraseblocks(struct mtd_info *mtd, unsigned long *bbt,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtdtest_erase_good_eraseblocks);
 
 int mtdtest_read(struct mtd_info *mtd, loff_t addr, size_t size, void *buf)
 {
@@ -96,6 +99,7 @@ int mtdtest_read(struct mtd_info *mtd, loff_t addr, size_t size, void *buf)
 
 	return err;
 }
+EXPORT_SYMBOL_GPL(mtdtest_read);
 
 int mtdtest_write(struct mtd_info *mtd, loff_t addr, size_t size,
 		const void *buf)
@@ -111,3 +115,7 @@ int mtdtest_write(struct mtd_info *mtd, loff_t addr, size_t size,
 
 	return err;
 }
+EXPORT_SYMBOL_GPL(mtdtest_write);
+
+MODULE_DESCRIPTION("NAND test library");
+MODULE_LICENSE("GPL");
-- 
1.8.3.1
