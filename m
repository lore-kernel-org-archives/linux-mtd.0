Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T5bcn-0007yb-PU
 for linux-mtd@lists.infradead.org; Sun, 26 Aug 2012 12:07:30 +0000
Received: by dajq27 with SMTP id q27so1923572daj.36
 for <linux-mtd@lists.infradead.org>; Sun, 26 Aug 2012 05:07:29 -0700 (PDT)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 3/6] mtd: mtd_nandecctest: rewrite the test routine
Date: Sun, 26 Aug 2012 21:06:45 +0900
Message-Id: <1345982808-11440-4-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <1345982808-11440-1-git-send-email-akinobu.mita@gmail.com>
References: <1345982808-11440-1-git-send-email-akinobu.mita@gmail.com>
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

This rewrites the entire test routine in order to make it easy to add more
tests by later changes and minimize duplication of each tests as much as
possible.

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/tests/mtd_nandecctest.c | 136 +++++++++++++++++++++++++++---------
 1 file changed, 104 insertions(+), 32 deletions(-)

diff --git a/drivers/mtd/tests/mtd_nandecctest.c b/drivers/mtd/tests/mtd_nandecctest.c
index f71ed92..466bc5c 100644
--- a/drivers/mtd/tests/mtd_nandecctest.c
+++ b/drivers/mtd/tests/mtd_nandecctest.c
@@ -5,59 +5,131 @@
 #include <linux/string.h>
 #include <linux/bitops.h>
 #include <linux/jiffies.h>
+#include <linux/slab.h>
 #include <linux/mtd/nand_ecc.h>
 
+#include <asm/byteorder.h>
+
 #if defined(CONFIG_MTD_NAND) || defined(CONFIG_MTD_NAND_MODULE)
 
-static void inject_single_bit_error(void *data, size_t size)
+struct nand_ecc_test {
+	const char *name;
+	void (*prepare)(void *, void *, void *, void *, const size_t);
+	int (*verify)(void *, void *, void *, const size_t);
+};
+
+#ifdef __LITTLE_ENDIAN
+#define __change_bit_le(nr, addr) __change_bit(nr, addr)
+#else
+#define __change_bit_le(nr, addr) \
+		__change_bit((nr) ^ ((BITS_PER_LONG - 1) & ~0x7), addr)
+#endif
+
+static void single_bit_error_data(void *error_data, void *correct_data,
+				size_t size)
 {
-	unsigned long offset = random32() % (size * BITS_PER_BYTE);
+	unsigned int offset = random32() % (size * BITS_PER_BYTE);
 
-	__change_bit(offset, data);
+	memcpy(error_data, correct_data, size);
+	__change_bit_le(offset, error_data);
 }
 
-static unsigned char data[512];
-static unsigned char error_data[512];
+static void single_bit_error_in_data(void *error_data, void *error_ecc,
+		void *correct_data, void *correct_ecc, const size_t size)
+{
+	single_bit_error_data(error_data, correct_data, size);
+	memcpy(error_ecc, correct_ecc, 3);
+}
 
-static int nand_ecc_test(const size_t size)
+static int single_bit_error_correct(void *error_data, void *error_ecc,
+				void *correct_data, const size_t size)
 {
-	unsigned char code[3];
-	unsigned char error_code[3];
-	char testname[30];
+	unsigned char calc_ecc[3];
+	int ret;
+
+	__nand_calculate_ecc(error_data, size, calc_ecc);
+	ret = __nand_correct_data(error_data, calc_ecc, error_ecc, size);
+	if (ret == 1 && !memcmp(correct_data, error_data, size))
+		return 0;
 
-	BUG_ON(sizeof(data) < size);
+	return -EINVAL;
+}
 
-	sprintf(testname, "nand-ecc-%zu", size);
+static const struct nand_ecc_test nand_ecc_test[] = {
+	{
+		.name = "single-bit-error-in-data-correct",
+		.prepare = single_bit_error_in_data,
+		.verify = single_bit_error_correct,
+	},
+};
 
-	get_random_bytes(data, size);
+static void dump_data_ecc(void *error_data, void *error_ecc, void *correct_data,
+			void *correct_ecc, const size_t size)
+{
+	pr_info("hexdump of error data:\n");
+	print_hex_dump(KERN_INFO, "", DUMP_PREFIX_OFFSET, 16, 4,
+			error_data, size, false);
+	print_hex_dump(KERN_INFO, "hexdump of error ecc: ",
+			DUMP_PREFIX_NONE, 16, 1, error_ecc, 3, false);
 
-	memcpy(error_data, data, size);
-	inject_single_bit_error(error_data, size);
+	pr_info("hexdump of correct data:\n");
+	print_hex_dump(KERN_INFO, "", DUMP_PREFIX_OFFSET, 16, 4,
+			correct_data, size, false);
+	print_hex_dump(KERN_INFO, "hexdump of correct ecc: ",
+			DUMP_PREFIX_NONE, 16, 1, correct_ecc, 3, false);
 
-	__nand_calculate_ecc(data, size, code);
-	__nand_calculate_ecc(error_data, size, error_code);
-	__nand_correct_data(error_data, code, error_code, size);
+}
 
-	if (!memcmp(data, error_data, size)) {
-		printk(KERN_INFO "mtd_nandecctest: ok - %s\n", testname);
-		return 0;
+static int nand_ecc_test_run(const size_t size)
+{
+	int i;
+	int err = 0;
+	void *error_data;
+	void *error_ecc;
+	void *correct_data;
+	void *correct_ecc;
+
+	error_data = kmalloc(size, GFP_KERNEL);
+	error_ecc = kmalloc(3, GFP_KERNEL);
+	correct_data = kmalloc(size, GFP_KERNEL);
+	correct_ecc = kmalloc(3, GFP_KERNEL);
+
+	if (!error_data || !error_ecc || !correct_data || !correct_ecc) {
+		err = -ENOMEM;
+		goto error;
 	}
 
-	printk(KERN_ERR "mtd_nandecctest: not ok - %s\n", testname);
-
-	printk(KERN_DEBUG "hexdump of data:\n");
-	print_hex_dump(KERN_DEBUG, "", DUMP_PREFIX_OFFSET, 16, 4,
-			data, size, false);
-	printk(KERN_DEBUG "hexdump of error data:\n");
-	print_hex_dump(KERN_DEBUG, "", DUMP_PREFIX_OFFSET, 16, 4,
-			error_data, size, false);
+	get_random_bytes(correct_data, size);
+	__nand_calculate_ecc(correct_data, size, correct_ecc);
+
+	for (i = 0; i < ARRAY_SIZE(nand_ecc_test); i++) {
+		nand_ecc_test[i].prepare(error_data, error_ecc,
+				correct_data, correct_ecc, size);
+		err = nand_ecc_test[i].verify(error_data, error_ecc,
+						correct_data, size);
+
+		if (err) {
+			pr_err("mtd_nandecctest: not ok - %s-%zd\n",
+				nand_ecc_test[i].name, size);
+			dump_data_ecc(error_data, error_ecc,
+				correct_data, correct_ecc, size);
+			break;
+		}
+		pr_info("mtd_nandecctest: ok - %s-%zd\n",
+			nand_ecc_test[i].name, size);
+	}
+error:
+	kfree(error_data);
+	kfree(error_ecc);
+	kfree(correct_data);
+	kfree(correct_ecc);
 
-	return -1;
+	return err;
 }
 
 #else
 
-static int nand_ecc_test(const size_t size)
+static int nand_ecc_test_run(const size_t size)
 {
 	return 0;
 }
@@ -68,11 +140,11 @@ static int __init ecc_test_init(void)
 {
 	int err;
 
-	err = nand_ecc_test(256);
+	err = nand_ecc_test_run(256);
 	if (err)
 		return err;
 
-	return nand_ecc_test(512);
+	return nand_ecc_test_run(512);
 }
 
 static void __exit ecc_test_exit(void)
-- 
1.7.11.4
