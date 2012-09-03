Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T8WGU-0007Dw-C0
 for linux-mtd@lists.infradead.org; Mon, 03 Sep 2012 13:00:32 +0000
Received: by mail-pz0-f49.google.com with SMTP id q27so3778279daj.36
 for <linux-mtd@lists.infradead.org>; Mon, 03 Sep 2012 06:00:30 -0700 (PDT)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v3 05/11] mtd: mtd_nandecctest: improve message output
Date: Mon,  3 Sep 2012 22:00:00 +0900
Message-Id: <1346677206-13621-6-git-send-email-akinobu.mita@gmail.com>
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

This includes the message related changes:

- Use pr_* instead of printk
- Print hexdump of ECC code if test fails
- Change log level for hexdump of data from KERN_DEBUG to KERN_INFO
- Factor out the hexdump code into a separate function

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/tests/mtd_nandecctest.c | 48 ++++++++++++++++++++++---------------
 1 file changed, 29 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/tests/mtd_nandecctest.c b/drivers/mtd/tests/mtd_nandecctest.c
index 128547c..2b2d1a9 100644
--- a/drivers/mtd/tests/mtd_nandecctest.c
+++ b/drivers/mtd/tests/mtd_nandecctest.c
@@ -15,41 +15,51 @@ static void inject_single_bit_error(void *data, size_t size)
 	__change_bit(offset, data);
 }
 
-static unsigned char data[512];
+static void dump_data_ecc(void *error_data, void *error_ecc, void *correct_data,
+			void *correct_ecc, const size_t size)
+{
+	pr_info("hexdump of error data:\n");
+	print_hex_dump(KERN_INFO, "", DUMP_PREFIX_OFFSET, 16, 4,
+			error_data, size, false);
+	print_hex_dump(KERN_INFO, "hexdump of error ecc: ",
+			DUMP_PREFIX_NONE, 16, 1, error_ecc, 3, false);
+
+	pr_info("hexdump of correct data:\n");
+	print_hex_dump(KERN_INFO, "", DUMP_PREFIX_OFFSET, 16, 4,
+			correct_data, size, false);
+	print_hex_dump(KERN_INFO, "hexdump of correct ecc: ",
+			DUMP_PREFIX_NONE, 16, 1, correct_ecc, 3, false);
+}
+
+static unsigned char correct_data[512];
 static unsigned char error_data[512];
 
 static int nand_ecc_test(const size_t size)
 {
-	unsigned char code[3];
-	unsigned char error_code[3];
+	unsigned char correct_ecc[3];
+	unsigned char error_ecc[3];
 	char testname[30];
 
-	BUG_ON(sizeof(data) < size);
+	BUG_ON(sizeof(correct_data) < size);
 
 	sprintf(testname, "nand-ecc-%zu", size);
 
-	get_random_bytes(data, size);
+	get_random_bytes(correct_data, size);
 
-	memcpy(error_data, data, size);
+	memcpy(error_data, correct_data, size);
 	inject_single_bit_error(error_data, size);
 
-	__nand_calculate_ecc(data, size, code);
-	__nand_calculate_ecc(error_data, size, error_code);
-	__nand_correct_data(error_data, code, error_code, size);
+	__nand_calculate_ecc(correct_data, size, correct_ecc);
+	__nand_calculate_ecc(error_data, size, error_ecc);
+	__nand_correct_data(error_data, correct_ecc, error_ecc, size);
 
-	if (!memcmp(data, error_data, size)) {
-		printk(KERN_INFO "mtd_nandecctest: ok - %s\n", testname);
+	if (!memcmp(correct_data, error_data, size)) {
+		pr_info("mtd_nandecctest: ok - %s\n", testname);
 		return 0;
 	}
 
-	printk(KERN_ERR "mtd_nandecctest: not ok - %s\n", testname);
-
-	printk(KERN_DEBUG "hexdump of data:\n");
-	print_hex_dump(KERN_DEBUG, "", DUMP_PREFIX_OFFSET, 16, 4,
-			data, size, false);
-	printk(KERN_DEBUG "hexdump of error data:\n");
-	print_hex_dump(KERN_DEBUG, "", DUMP_PREFIX_OFFSET, 16, 4,
-			error_data, size, false);
+	pr_err("mtd_nandecctest: not ok - %s\n", testname);
+	dump_data_ecc(error_data, error_ecc, correct_data, correct_ecc, size);
 
 	return -EINVAL;
 }
-- 
1.7.11.4
