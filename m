Received: from mail-pd0-x231.google.com ([2607:f8b0:400e:c02::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V5YWs-0006YB-8t
 for linux-mtd@lists.infradead.org; Sat, 03 Aug 2013 09:54:01 +0000
Received: by mail-pd0-f177.google.com with SMTP id u10so1508542pdi.22
 for <linux-mtd@lists.infradead.org>; Sat, 03 Aug 2013 02:53:21 -0700 (PDT)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH -next v2 09/10] mtd: mtd_torturetest: use mtd_test helpers
Date: Sat,  3 Aug 2013 18:52:15 +0900
Message-Id: <1375523536-32671-10-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <1375523536-32671-1-git-send-email-akinobu.mita@gmail.com>
References: <1375523536-32671-1-git-send-email-akinobu.mita@gmail.com>
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

Use mtdtest_scan_for_bad_eraseblocks() and mtdtest_erase_good_eraseblocks()
in mtd_test helpers.

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Vikram Narayanan <vikram186@gmail.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
---
* Newly added patch from v2

 drivers/mtd/tests/torturetest.c | 66 +++++------------------------------------
 1 file changed, 7 insertions(+), 59 deletions(-)

diff --git a/drivers/mtd/tests/torturetest.c b/drivers/mtd/tests/torturetest.c
index 3a9f6a6..eeab969 100644
--- a/drivers/mtd/tests/torturetest.c
+++ b/drivers/mtd/tests/torturetest.c
@@ -32,6 +32,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/slab.h>
 #include <linux/sched.h>
+#include "mtd_test.h"
 
 #define RETRIES 3
 
@@ -93,35 +94,6 @@ static inline void stop_timing(void)
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
-		pr_err("error %d while erasing EB %d\n", err, ebnum);
-		return err;
-	}
-
-	if (ei.state == MTD_ERASE_FAILED) {
-		pr_err("some erase error occurred at EB %d\n",
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
@@ -208,7 +180,7 @@ static inline int write_pattern(int ebnum, void *buf)
 static int __init tort_init(void)
 {
 	int err = 0, i, infinite = !cycles_count;
-	int *bad_ebs;
+	unsigned char *bad_ebs;
 
 	printk(KERN_INFO "\n");
 	printk(KERN_INFO "=================================================\n");
@@ -265,7 +237,7 @@ static int __init tort_init(void)
 	if (!check_buf)
 		goto out_patt_FF;
 
-	bad_ebs = kcalloc(ebcnt, sizeof(*bad_ebs), GFP_KERNEL);
+	bad_ebs = kzalloc(ebcnt, GFP_KERNEL);
 	if (!bad_ebs)
 		goto out_check_buf;
 
@@ -283,40 +255,16 @@ static int __init tort_init(void)
 		}
 	}
 
-	/*
-	 * Check if there is a bad eraseblock among those we are going to test.
-	 */
-	if (mtd_can_have_bb(mtd)) {
-		for (i = eb; i < eb + ebcnt; i++) {
-			err = mtd_block_isbad(mtd, (loff_t)i * mtd->erasesize);
-
-			if (err < 0) {
-				pr_info("block_isbad() returned %d "
-				       "for EB %d\n", err, i);
-				goto out;
-			}
-
-			if (err) {
-				pr_err("EB %d is bad. Skip it.\n", i);
-				bad_ebs[i - eb] = 1;
-			}
-		}
-	}
+	err = mtdtest_scan_for_bad_eraseblocks(mtd, bad_ebs, eb, ebcnt);
+	if (err)
+		goto out;
 
 	start_timing();
 	while (1) {
 		int i;
 		void *patt;
 
-		/* Erase all eraseblocks */
-		for (i = eb; i < eb + ebcnt; i++) {
-			if (bad_ebs[i - eb])
-				continue;
-			err = erase_eraseblock(i);
-			if (err)
-				goto out;
-			cond_resched();
-		}
+		mtdtest_erase_good_eraseblocks(mtd, bad_ebs, eb, ebcnt);
 
 		/* Check if the eraseblocks contain only 0xFF bytes */
 		if (check) {
-- 
1.8.3.1
