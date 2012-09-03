Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T8WGV-0007EJ-Kh
 for linux-mtd@lists.infradead.org; Mon, 03 Sep 2012 13:00:33 +0000
Received: by mail-pb0-f49.google.com with SMTP id rq8so8483440pbb.36
 for <linux-mtd@lists.infradead.org>; Mon, 03 Sep 2012 06:00:31 -0700 (PDT)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v3 06/11] mtd: mtd_nandecctest: ensure alignment requirement
 for bitops
Date: Mon,  3 Sep 2012 22:00:01 +0900
Message-Id: <1346677206-13621-7-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <1346677206-13621-1-git-send-email-akinobu.mita@gmail.com>
References: <1346677206-13621-1-git-send-email-akinobu.mita@gmail.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 David Woodhouse <dwmw2@infradead.org>, Akinobu Mita <akinobu.mita@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Currently the data blocks which is used to test single bit error
correction is allocated statically and injecting single bit error is
implemented by using __change_bit() which must operate on the memory
aligned to the size of an "unsigned long".  But there is no such
guarantee for statically allocated array.

This fix the issue by allocating the data block dynamically by
kmalloc().  It also allocate the ecc code dynamically instead of
allocating statically on stack.

The reason to allocate the ecc code dynamically is that later change
will add tests which inject bit errors into the ecc code by bitops.

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/tests/mtd_nandecctest.c | 43 +++++++++++++++++++++++++------------
 1 file changed, 29 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/tests/mtd_nandecctest.c b/drivers/mtd/tests/mtd_nandecctest.c
index 2b2d1a9..d3e8873 100644
--- a/drivers/mtd/tests/mtd_nandecctest.c
+++ b/drivers/mtd/tests/mtd_nandecctest.c
@@ -4,6 +4,7 @@
 #include <linux/random.h>
 #include <linux/string.h>
 #include <linux/bitops.h>
+#include <linux/slab.h>
 #include <linux/mtd/nand_ecc.h>
 
 #if defined(CONFIG_MTD_NAND) || defined(CONFIG_MTD_NAND_MODULE)
@@ -31,16 +32,24 @@ static void dump_data_ecc(void *error_data, void *error_ecc, void *correct_data,
 			DUMP_PREFIX_NONE, 16, 1, correct_ecc, 3, false);
 }
 
-static unsigned char correct_data[512];
-static unsigned char error_data[512];
-
 static int nand_ecc_test(const size_t size)
 {
-	unsigned char correct_ecc[3];
-	unsigned char error_ecc[3];
+	int err = 0;
+	void *error_data;
+	void *error_ecc;
+	void *correct_data;
+	void *correct_ecc;
 	char testname[30];
 
-	BUG_ON(sizeof(correct_data) < size);
+	error_data = kmalloc(size, GFP_KERNEL);
+	error_ecc = kmalloc(3, GFP_KERNEL);
+	correct_data = kmalloc(size, GFP_KERNEL);
+	correct_ecc = kmalloc(3, GFP_KERNEL);
+
+	if (!error_data || !error_ecc || !correct_data || !correct_ecc) {
+		err = -ENOMEM;
+		goto error;
+	}
 
 	sprintf(testname, "nand-ecc-%zu", size);
 
@@ -53,15 +62,21 @@ static int nand_ecc_test(const size_t size)
 	__nand_calculate_ecc(error_data, size, error_ecc);
 	__nand_correct_data(error_data, correct_ecc, error_ecc, size);
 
-	if (!memcmp(correct_data, error_data, size)) {
-		pr_info("mtd_nandecctest: ok - %s\n", testname);
-		return 0;
+	if (memcmp(correct_data, error_data, size)) {
+		pr_err("mtd_nandecctest: not ok - %s\n", testname);
+		dump_data_ecc(error_data, error_ecc, correct_data, correct_ecc,
+				size);
+		err = -EINVAL;
+		goto error;
 	}
-
-	pr_err("mtd_nandecctest: not ok - %s\n", testname);
-	dump_data_ecc(error_data, error_ecc, correct_data, correct_ecc, size);
-
-	return -EINVAL;
+	pr_info("mtd_nandecctest: ok - %s\n", testname);
+error:
+	kfree(error_data);
+	kfree(error_ecc);
+	kfree(correct_data);
+	kfree(correct_ecc);
+
+	return err;
 }
 
 #else
-- 
1.7.11.4
