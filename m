Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TJ3Sl-0000s4-4k
 for linux-mtd@lists.infradead.org; Tue, 02 Oct 2012 14:28:44 +0000
Received: by pbcxa7 with SMTP id xa7so8176486pbc.36
 for <linux-mtd@lists.infradead.org>; Tue, 02 Oct 2012 07:28:42 -0700 (PDT)
Message-ID: <506AF9F0.7010903@gmail.com>
Date: Tue, 02 Oct 2012 19:58:00 +0530
From: Vikram Narayanan <vikram186@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/8] mtd_tests: Refactor duplicate code
References: <506AF985.30104@gmail.com>
In-Reply-To: <506AF985.30104@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>,
 Adrian Hunter <ext-adrian.hunter@nokia.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Move the duplicate code from all the tests to a common header.

Signed-off-by: Vikram Narayanan <vikram186@gmail.com>
---
 drivers/mtd/tests/mtd_nandbiterrs.c |   29 ++---------------
 drivers/mtd/tests/mtd_oobtest.c     |   31 ++----------------
 drivers/mtd/tests/mtd_pagetest.c    |   39 ++++------------------
 drivers/mtd/tests/mtd_speedtest.c   |   60 ++--------------------------------
 drivers/mtd/tests/mtd_stresstest.c  |   31 ++----------------
 drivers/mtd/tests/mtd_subpagetest.c |   29 +---------------
 drivers/mtd/tests/mtd_tests.h       |   60 +++++++++++++++++++++++++++++++++++
 drivers/mtd/tests/mtd_torturetest.c |   33 +------------------
 8 files changed, 84 insertions(+), 228 deletions(-)
 create mode 100644 drivers/mtd/tests/mtd_tests.h

diff --git a/drivers/mtd/tests/mtd_nandbiterrs.c b/drivers/mtd/tests/mtd_nandbiterrs.c
index cc8d62c..072fc43 100644
--- a/drivers/mtd/tests/mtd_nandbiterrs.c
+++ b/drivers/mtd/tests/mtd_nandbiterrs.c
@@ -46,6 +46,7 @@
 #include <linux/err.h>
 #include <linux/mtd/nand.h>
 #include <linux/slab.h>
+#include "mtd_tests.h"
 
 #define msg(FMT, VA...) pr_info("mtd_nandbiterrs: "FMT, ##VA)
 
@@ -97,30 +98,6 @@ static uint8_t hash(unsigned offset)
 	return c;
 }
 
-static int erase_block(void)
-{
-	int err;
-	struct erase_info ei;
-	loff_t addr = eraseblock * mtd->erasesize;
-
-	msg("erase_block\n");
-
-	memset(&ei, 0, sizeof(struct erase_info));
-	ei.mtd  = mtd;
-	ei.addr = addr;
-	ei.len  = mtd->erasesize;
-
-	err = mtd_erase(mtd, &ei);
-	if (err || ei.state == MTD_ERASE_FAILED) {
-		msg("error %d while erasing\n", err);
-		if (!err)
-			err = -EIO;
-		return err;
-	}
-
-	return 0;
-}
-
 /* Writes wbuffer to page */
 static int write_page(int log)
 {
@@ -414,7 +391,7 @@ static int __init mtd_nandbiterrs_init(void)
 		goto exit_rbuffer;
 	}
 
-	err = erase_block();
+	err = erase_eraseblock(mtd, eraseblock);
 	if (err)
 		goto exit_error;
 
@@ -427,7 +404,7 @@ static int __init mtd_nandbiterrs_init(void)
 		goto exit_error;
 
 	/* We leave the block un-erased in case of test failure. */
-	err = erase_block();
+	err = erase_eraseblock(mtd, eraseblock);
 	if (err)
 		goto exit_error;
 
diff --git a/drivers/mtd/tests/mtd_oobtest.c b/drivers/mtd/tests/mtd_oobtest.c
index ed9b628..6714985 100644
--- a/drivers/mtd/tests/mtd_oobtest.c
+++ b/drivers/mtd/tests/mtd_oobtest.c
@@ -27,6 +27,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/slab.h>
 #include <linux/sched.h>
+#include "mtd_tests.h"
 
 #define PRINT_PREF KERN_INFO "mtd_oobtest: "
 
@@ -67,32 +68,6 @@ static void set_random_data(unsigned char *buf, size_t len)
 		buf[i] = simple_rand();
 }
 
-static int erase_eraseblock(int ebnum)
-{
-	int err;
-	struct erase_info ei;
-	loff_t addr = ebnum * mtd->erasesize;
-
-	memset(&ei, 0, sizeof(struct erase_info));
-	ei.mtd  = mtd;
-	ei.addr = addr;
-	ei.len  = mtd->erasesize;
-
-	err = mtd_erase(mtd, &ei);
-	if (err) {
-		printk(PRINT_PREF "error %d while erasing EB %d\n", err, ebnum);
-		return err;
-	}
-
-	if (ei.state == MTD_ERASE_FAILED) {
-		printk(PRINT_PREF "some erase error occurred at EB %d\n",
-		       ebnum);
-		return -EIO;
-	}
-
-	return 0;
-}
-
 static int erase_whole_device(void)
 {
 	int err;
@@ -102,7 +77,7 @@ static int erase_whole_device(void)
 	for (i = 0; i < ebcnt; ++i) {
 		if (bbt[i])
 			continue;
-		err = erase_eraseblock(i);
+		err = erase_eraseblock(mtd, i);
 		if (err)
 			return err;
 		cond_resched();
@@ -597,7 +572,7 @@ static int __init mtd_oobtest_init(void)
 			errcnt += 1;
 		}
 
-		err = erase_eraseblock(ebcnt - 1);
+		err = erase_eraseblock(mtd, ebcnt - 1);
 		if (err)
 			goto out;
 
diff --git a/drivers/mtd/tests/mtd_pagetest.c b/drivers/mtd/tests/mtd_pagetest.c
index 252ddb0..2a09405 100644
--- a/drivers/mtd/tests/mtd_pagetest.c
+++ b/drivers/mtd/tests/mtd_pagetest.c
@@ -27,6 +27,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/slab.h>
 #include <linux/sched.h>
+#include "mtd_tests.h"
 
 #define PRINT_PREF KERN_INFO "mtd_pagetest: "
 
@@ -66,32 +67,6 @@ static void set_random_data(unsigned char *buf, size_t len)
 		buf[i] = simple_rand();
 }
 
-static int erase_eraseblock(int ebnum)
-{
-	int err;
-	struct erase_info ei;
-	loff_t addr = ebnum * mtd->erasesize;
-
-	memset(&ei, 0, sizeof(struct erase_info));
-	ei.mtd  = mtd;
-	ei.addr = addr;
-	ei.len  = mtd->erasesize;
-
-	err = mtd_erase(mtd, &ei);
-	if (err) {
-		printk(PRINT_PREF "error %d while erasing EB %d\n", err, ebnum);
-		return err;
-	}
-
-	if (ei.state == MTD_ERASE_FAILED) {
-		printk(PRINT_PREF "some erase error occurred at EB %d\n",
-		       ebnum);
-		return -EIO;
-	}
-
-	return 0;
-}
-
 static int write_eraseblock(int ebnum)
 {
 	int err = 0;
@@ -321,7 +296,7 @@ static int erasecrosstest(void)
 		ebnum2 -= 1;
 
 	printk(PRINT_PREF "erasing block %d\n", ebnum);
-	err = erase_eraseblock(ebnum);
+	err = erase_eraseblock(mtd, ebnum);
 	if (err)
 		return err;
 
@@ -354,7 +329,7 @@ static int erasecrosstest(void)
 	}
 
 	printk(PRINT_PREF "erasing block %d\n", ebnum);
-	err = erase_eraseblock(ebnum);
+	err = erase_eraseblock(mtd, ebnum);
 	if (err)
 		return err;
 
@@ -369,7 +344,7 @@ static int erasecrosstest(void)
 	}
 
 	printk(PRINT_PREF "erasing block %d\n", ebnum2);
-	err = erase_eraseblock(ebnum2);
+	err = erase_eraseblock(mtd, ebnum2);
 	if (err)
 		return err;
 
@@ -412,7 +387,7 @@ static int erasetest(void)
 	}
 
 	printk(PRINT_PREF "erasing block %d\n", ebnum);
-	err = erase_eraseblock(ebnum);
+	err = erase_eraseblock(mtd, ebnum);
 	if (err)
 		return err;
 
@@ -426,7 +401,7 @@ static int erasetest(void)
 	}
 
 	printk(PRINT_PREF "erasing block %d\n", ebnum);
-	err = erase_eraseblock(ebnum);
+	err = erase_eraseblock(mtd, ebnum);
 	if (err)
 		return err;
 
@@ -557,7 +532,7 @@ static int __init mtd_pagetest_init(void)
 	for (i = 0; i < ebcnt; ++i) {
 		if (bbt[i])
 			continue;
-		err = erase_eraseblock(i);
+		err = erase_eraseblock(mtd, i);
 		if (err)
 			goto out;
 		cond_resched();
diff --git a/drivers/mtd/tests/mtd_speedtest.c b/drivers/mtd/tests/mtd_speedtest.c
index 42b0f74..e3518b4 100644
--- a/drivers/mtd/tests/mtd_speedtest.c
+++ b/drivers/mtd/tests/mtd_speedtest.c
@@ -27,6 +27,7 @@
 #include <linux/slab.h>
 #include <linux/sched.h>
 #include <linux/random.h>
+#include "mtd_tests.h"
 
 #define PRINT_PREF KERN_INFO "mtd_speedtest: "
 
@@ -57,59 +58,6 @@ static void set_random_data(unsigned char *buf, size_t len)
 		buf[i] = random32();
 }
 
-static int erase_eraseblock(int ebnum)
-{
-	int err;
-	struct erase_info ei;
-	loff_t addr = ebnum * mtd->erasesize;
-
-	memset(&ei, 0, sizeof(struct erase_info));
-	ei.mtd  = mtd;
-	ei.addr = addr;
-	ei.len  = mtd->erasesize;
-
-	err = mtd_erase(mtd, &ei);
-	if (err) {
-		printk(PRINT_PREF "error %d while erasing EB %d\n", err, ebnum);
-		return err;
-	}
-
-	if (ei.state == MTD_ERASE_FAILED) {
-		printk(PRINT_PREF "some erase error occurred at EB %d\n",
-		       ebnum);
-		return -EIO;
-	}
-
-	return 0;
-}
-
-static int multiblock_erase(int ebnum, int blocks)
-{
-	int err;
-	struct erase_info ei;
-	loff_t addr = ebnum * mtd->erasesize;
-
-	memset(&ei, 0, sizeof(struct erase_info));
-	ei.mtd  = mtd;
-	ei.addr = addr;
-	ei.len  = mtd->erasesize * blocks;
-
-	err = mtd_erase(mtd, &ei);
-	if (err) {
-		printk(PRINT_PREF "error %d while erasing EB %d, blocks %d\n",
-		       err, ebnum, blocks);
-		return err;
-	}
-
-	if (ei.state == MTD_ERASE_FAILED) {
-		printk(PRINT_PREF "some erase error occurred at EB %d,"
-		       "blocks %d\n", ebnum, blocks);
-		return -EIO;
-	}
-
-	return 0;
-}
-
 static int erase_whole_device(void)
 {
 	int err;
@@ -118,7 +66,7 @@ static int erase_whole_device(void)
 	for (i = 0; i < ebcnt; ++i) {
 		if (bbt[i])
 			continue;
-		err = erase_eraseblock(i);
+		err = erase_eraseblock(mtd, i);
 		if (err)
 			return err;
 		cond_resched();
@@ -510,7 +458,7 @@ static int __init mtd_speedtest_init(void)
 	for (i = 0; i < ebcnt; ++i) {
 		if (bbt[i])
 			continue;
-		err = erase_eraseblock(i);
+		err = erase_eraseblock(mtd, i);
 		if (err)
 			goto out;
 		cond_resched();
@@ -533,7 +481,7 @@ static int __init mtd_speedtest_init(void)
 				i++;
 				continue;
 			}
-			err = multiblock_erase(i, j);
+			err = multiblock_erase(mtd, i, j);
 			if (err)
 				goto out;
 			cond_resched();
diff --git a/drivers/mtd/tests/mtd_stresstest.c b/drivers/mtd/tests/mtd_stresstest.c
index cb268ce..87e2e05 100644
--- a/drivers/mtd/tests/mtd_stresstest.c
+++ b/drivers/mtd/tests/mtd_stresstest.c
@@ -28,6 +28,7 @@
 #include <linux/sched.h>
 #include <linux/vmalloc.h>
 #include <linux/random.h>
+#include "mtd_tests.h"
 
 #define PRINT_PREF KERN_INFO "mtd_stresstest: "
 
@@ -81,32 +82,6 @@ static int rand_len(int offs)
 	return len;
 }
 
-static int erase_eraseblock(int ebnum)
-{
-	int err;
-	struct erase_info ei;
-	loff_t addr = ebnum * mtd->erasesize;
-
-	memset(&ei, 0, sizeof(struct erase_info));
-	ei.mtd  = mtd;
-	ei.addr = addr;
-	ei.len  = mtd->erasesize;
-
-	err = mtd_erase(mtd, &ei);
-	if (unlikely(err)) {
-		printk(PRINT_PREF "error %d while erasing EB %d\n", err, ebnum);
-		return err;
-	}
-
-	if (unlikely(ei.state == MTD_ERASE_FAILED)) {
-		printk(PRINT_PREF "some erase error occurred at EB %d\n",
-		       ebnum);
-		return -EIO;
-	}
-
-	return 0;
-}
-
 static int is_block_bad(int ebnum)
 {
 	loff_t addr = ebnum * mtd->erasesize;
@@ -154,7 +129,7 @@ static int do_write(void)
 
 	offs = offsets[eb];
 	if (offs >= mtd->erasesize) {
-		err = erase_eraseblock(eb);
+		err = erase_eraseblock(mtd, eb);
 		if (err)
 			return err;
 		offs = offsets[eb] = 0;
@@ -165,7 +140,7 @@ static int do_write(void)
 		if (bbt[eb + 1])
 			len = mtd->erasesize - offs;
 		else {
-			err = erase_eraseblock(eb + 1);
+			err = erase_eraseblock(mtd, eb + 1);
 			if (err)
 				return err;
 			offsets[eb + 1] = 0;
diff --git a/drivers/mtd/tests/mtd_subpagetest.c b/drivers/mtd/tests/mtd_subpagetest.c
index 9667bf5..642f958 100644
--- a/drivers/mtd/tests/mtd_subpagetest.c
+++ b/drivers/mtd/tests/mtd_subpagetest.c
@@ -26,6 +26,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/slab.h>
 #include <linux/sched.h>
+#include "mtd_tests.h"
 
 #define PRINT_PREF KERN_INFO "mtd_subpagetest: "
 
@@ -69,32 +70,6 @@ static inline void clear_data(unsigned char *buf, size_t len)
 	memset(buf, 0, len);
 }
 
-static int erase_eraseblock(int ebnum)
-{
-	int err;
-	struct erase_info ei;
-	loff_t addr = ebnum * mtd->erasesize;
-
-	memset(&ei, 0, sizeof(struct erase_info));
-	ei.mtd  = mtd;
-	ei.addr = addr;
-	ei.len  = mtd->erasesize;
-
-	err = mtd_erase(mtd, &ei);
-	if (err) {
-		printk(PRINT_PREF "error %d while erasing EB %d\n", err, ebnum);
-		return err;
-	}
-
-	if (ei.state == MTD_ERASE_FAILED) {
-		printk(PRINT_PREF "some erase error occurred at EB %d\n",
-		       ebnum);
-		return -EIO;
-	}
-
-	return 0;
-}
-
 static int erase_whole_device(void)
 {
 	int err;
@@ -104,7 +79,7 @@ static int erase_whole_device(void)
 	for (i = 0; i < ebcnt; ++i) {
 		if (bbt[i])
 			continue;
-		err = erase_eraseblock(i);
+		err = erase_eraseblock(mtd, i);
 		if (err)
 			return err;
 		cond_resched();
diff --git a/drivers/mtd/tests/mtd_tests.h b/drivers/mtd/tests/mtd_tests.h
new file mode 100644
index 0000000..b590c69
--- /dev/null
+++ b/drivers/mtd/tests/mtd_tests.h
@@ -0,0 +1,60 @@
+/*
+ * Derived from the code which has
+ * Copyright (C) 2006-2008 Nokia Corporation
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
+ *
+ */
+
+#ifndef __MTD_TESTS_H__
+#define __MTD_TESTS_H__
+
+#include <linux/mtd/mtd.h>
+
+int multiblock_erase(struct mtd_info *mtd, int ebnum, int blocks)
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
+	err = mtd_erase(mtd, &ei);
+	if (err) {
+		pr_info("error %d while erasing EB %d, blocks %d\n",
+			       err, ebnum, blocks);
+		return err;
+	}
+
+	if (ei.state == MTD_ERASE_FAILED) {
+		pr_info("some erase error occurred at EB %d,"
+		       "blocks %d\n", ebnum, blocks);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+
+int erase_eraseblock(struct mtd_info *mtd, int ebnum)
+{
+	return multiblock_erase(mtd, ebnum, 1);
+}
+
+#endif /* __MTD_TESTS_H__ */
+
diff --git a/drivers/mtd/tests/mtd_torturetest.c b/drivers/mtd/tests/mtd_torturetest.c
index b65861b..31c2eaf 100644
--- a/drivers/mtd/tests/mtd_torturetest.c
+++ b/drivers/mtd/tests/mtd_torturetest.c
@@ -30,7 +30,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/slab.h>
 #include <linux/sched.h>
-
+#include "mtd_tests.h"
 #define PRINT_PREF KERN_INFO "mtd_torturetest: "
 #define RETRIES 3
 
@@ -92,35 +92,6 @@ static inline void stop_timing(void)
 }
 
 /*
- * Erase eraseblock number @ebnum.
- */
-static inline int erase_eraseblock(int ebnum)
-{
-	int err;
-	struct erase_info ei;
-	loff_t addr = ebnum * mtd->erasesize;
-
-	memset(&ei, 0, sizeof(struct erase_info));
-	ei.mtd  = mtd;
-	ei.addr = addr;
-	ei.len  = mtd->erasesize;
-
-	err = mtd_erase(mtd, &ei);
-	if (err) {
-		printk(PRINT_PREF "error %d while erasing EB %d\n", err, ebnum);
-		return err;
-	}
-
-	if (ei.state == MTD_ERASE_FAILED) {
-		printk(PRINT_PREF "some erase error occurred at EB %d\n",
-		       ebnum);
-		return -EIO;
-	}
-
-	return 0;
-}
-
-/*
  * Check that the contents of eraseblock number @enbum is equivalent to the
  * @buf buffer.
  */
@@ -316,7 +287,7 @@ static int __init tort_init(void)
 		for (i = eb; i < eb + ebcnt; i++) {
 			if (bad_ebs[i - eb])
 				continue;
-			err = erase_eraseblock(i);
+			err = erase_eraseblock(mtd, i);
 			if (err)
 				goto out;
 			cond_resched();
-- 
1.7.4.1
