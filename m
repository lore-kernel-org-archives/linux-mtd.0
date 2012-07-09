Received: from mail-gh0-f177.google.com ([209.85.160.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SoDVb-0000S6-CP
 for linux-mtd@lists.infradead.org; Mon, 09 Jul 2012 12:56:13 +0000
Received: by ghbf11 with SMTP id f11so10809003ghb.36
 for <linux-mtd@lists.infradead.org>; Mon, 09 Jul 2012 05:56:07 -0700 (PDT)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: mtd_nandecctest: add more tests
Date: Mon,  9 Jul 2012 21:55:45 +0900
Message-Id: <1341838545-25328-1-git-send-email-akinobu.mita@gmail.com>
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

Current mtd nand ecc test module tests only single error correcting.

This adds tests with possible corruption pattern as listed below and
overall rewrite for minimizing duplication of each test as much as
possible.

* Prepare data block and ECC data with no corruption, and verify that
the data block is preserved by __nand_correct_data()

* Prepare data block with single bit error and ECC data with no
corruption, and verify that the data block is corrected.
(This test is equivalent to the current test)

* Prepare data block with no corruption and ECC data with single bit
error, and verify that the data block is preserved.

* Prepare data block with double bit error and ECC data with no
corruption, and verify that the uncorrectable error is detected.

* Prepare data block with single bit error and ECC data with single
bit error, and verify that the uncorrectable error is detected.

* Prepare data block with no data corruption and ECC data with double
bit error, and verify that the uncorrectable error is detected.

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/tests/mtd_nandecctest.c |  277 ++++++++++++++++++++++++++++++-----
 1 file changed, 242 insertions(+), 35 deletions(-)

diff --git a/drivers/mtd/tests/mtd_nandecctest.c b/drivers/mtd/tests/mtd_nandecctest.c
index 70d6d7d..55c476a 100644
--- a/drivers/mtd/tests/mtd_nandecctest.c
+++ b/drivers/mtd/tests/mtd_nandecctest.c
@@ -5,75 +5,282 @@
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
+{
+	unsigned int offset = random32() % (size * BITS_PER_BYTE);
+
+	memcpy(error_data, correct_data, size);
+	__change_bit_le(offset, error_data);
+}
+
+static void double_bit_error_data(void *error_data, void *correct_data,
+				size_t size)
 {
-	unsigned long offset = random32() % (size * BITS_PER_BYTE);
+	unsigned int offset[2];
 
-	__change_bit(offset, data);
+	offset[0] = random32() % (size * BITS_PER_BYTE);
+	do {
+		offset[1] = random32() % (size * BITS_PER_BYTE);
+	} while (offset[0] == offset[1]);
+
+	memcpy(error_data, correct_data, size);
+
+	__change_bit_le(offset[0], error_data);
+	__change_bit_le(offset[1], error_data);
 }
 
-static unsigned char data[512];
-static unsigned char error_data[512];
+static unsigned int random_ecc_bit(size_t size)
+{
+	unsigned int offset = random32() % (3 * BITS_PER_BYTE);
+
+	if (size == 256) {
+		while (offset == 16 || offset == 17)
+			offset = random32() % (3 * BITS_PER_BYTE);
+	}
 
-static int nand_ecc_test(const size_t size)
+	return offset;
+}
+
+static void single_bit_error_ecc(void *error_ecc, void *correct_ecc,
+				size_t size)
 {
-	unsigned char code[3];
-	unsigned char error_code[3];
-	char testname[30];
+	unsigned int offset = random_ecc_bit(size);
+
+	memcpy(error_ecc, correct_ecc, 3);
+	__change_bit_le(offset, error_ecc);
+}
 
-	BUG_ON(sizeof(data) < size);
+static void double_bit_error_ecc(void *error_ecc, void *correct_ecc,
+				size_t size)
+{
+	unsigned int offset[2];
 
-	sprintf(testname, "nand-ecc-%zu", size);
+	offset[0] = random_ecc_bit(size);
+	do {
+		offset[1] = random_ecc_bit(size);
+	} while (offset[0] == offset[1]);
 
-	get_random_bytes(data, size);
+	memcpy(error_ecc, correct_ecc, 3);
+	__change_bit_le(offset[0], error_ecc);
+	__change_bit_le(offset[1], error_ecc);
+}
 
-	memcpy(error_data, data, size);
-	inject_single_bit_error(error_data, size);
+static void no_bit_error(void *error_data, void *error_ecc,
+		void *correct_data, void *correct_ecc, const size_t size)
+{
+	memcpy(error_data, correct_data, size);
+	memcpy(error_ecc, correct_ecc, 3);
+}
 
-	__nand_calculate_ecc(data, size, code);
-	__nand_calculate_ecc(error_data, size, error_code);
-	__nand_correct_data(error_data, code, error_code, size);
+static int no_bit_error_verify(void *error_data, void *error_ecc,
+				void *correct_data, const size_t size)
+{
+	unsigned char calc_ecc[3];
+	int ret;
 
-	if (!memcmp(data, error_data, size)) {
-		printk(KERN_INFO "mtd_nandecctest: ok - %s\n", testname);
+	__nand_calculate_ecc(error_data, size, calc_ecc);
+	ret = __nand_correct_data(error_data, calc_ecc, error_ecc, size);
+	if (ret == 0 && !memcmp(correct_data, error_data, size))
 		return 0;
-	}
 
-	printk(KERN_ERR "mtd_nandecctest: not ok - %s\n", testname);
+	return -EINVAL;
+}
 
-	printk(KERN_DEBUG "hexdump of data:\n");
-	print_hex_dump(KERN_DEBUG, "", DUMP_PREFIX_OFFSET, 16, 4,
-			data, size, false);
-	printk(KERN_DEBUG "hexdump of error data:\n");
-	print_hex_dump(KERN_DEBUG, "", DUMP_PREFIX_OFFSET, 16, 4,
-			error_data, size, false);
+static void single_bit_error_in_data(void *error_data, void *error_ecc,
+		void *correct_data, void *correct_ecc, const size_t size)
+{
+	single_bit_error_data(error_data, correct_data, size);
+	memcpy(error_ecc, correct_ecc, 3);
+}
 
-	return -1;
+static void single_bit_error_in_ecc(void *error_data, void *error_ecc,
+		void *correct_data, void *correct_ecc, const size_t size)
+{
+	memcpy(error_data, correct_data, size);
+	single_bit_error_ecc(error_ecc, correct_ecc, size);
 }
 
-#else
+static int single_bit_error_correct(void *error_data, void *error_ecc,
+				void *correct_data, const size_t size)
 
-static int nand_ecc_test(const size_t size)
 {
-	return 0;
+	unsigned char calc_ecc[3];
+	int ret;
+
+	__nand_calculate_ecc(error_data, size, calc_ecc);
+	ret = __nand_correct_data(error_data, calc_ecc, error_ecc, size);
+	if (ret == 1 && !memcmp(correct_data, error_data, size))
+		return 0;
+
+	return -EINVAL;
 }
 
-#endif
+static void double_bit_error_in_data(void *error_data, void *error_ecc,
+		void *correct_data, void *correct_ecc, const size_t size)
+{
+	double_bit_error_data(error_data, correct_data, size);
+	memcpy(error_ecc, correct_ecc, 3);
+}
+
+static void single_bit_error_in_data_and_ecc(void *error_data, void *error_ecc,
+		void *correct_data, void *correct_ecc, const size_t size)
+{
+	single_bit_error_data(error_data, correct_data, size);
+	single_bit_error_ecc(error_ecc, correct_ecc, size);
+}
+
+static void double_bit_error_in_ecc(void *error_data, void *error_ecc,
+		void *correct_data, void *correct_ecc, const size_t size)
+{
+	memcpy(error_data, correct_data, size);
+	double_bit_error_ecc(error_ecc, correct_ecc, size);
+}
+
+static int double_bit_error_detect(void *error_data, void *error_ecc,
+				void *correct_data, const size_t size)
+
+{
+	unsigned char calc_ecc[3];
+	int ret;
+
+	__nand_calculate_ecc(error_data, size, calc_ecc);
+	ret = __nand_correct_data(error_data, calc_ecc, error_ecc, size);
+
+	return (ret == -1) ? 0 : -EINVAL;
+}
+
+static const struct nand_ecc_test nand_ecc_test[] = {
+	{
+		.name = "no-bit-error",
+		.prepare = no_bit_error,
+		.verify = no_bit_error_verify,
+	},
+	{
+		.name = "single-bit-error-in-data-correct",
+		.prepare = single_bit_error_in_data,
+		.verify = single_bit_error_correct,
+	},
+	{
+		.name = "single-bit-error-in-ecc-correct",
+		.prepare = single_bit_error_in_ecc,
+		.verify = single_bit_error_correct,
+	},
+	{
+		.name = "double-bit-error-in-data-detect",
+		.prepare = double_bit_error_in_data,
+		.verify = double_bit_error_detect,
+	},
+	{
+		.name = "single-bit-error-in-data-and-ecc-detect",
+		.prepare = single_bit_error_in_data_and_ecc,
+		.verify = double_bit_error_detect,
+	},
+	{
+		.name = "double-bit-error-in-ecc-detect",
+		.prepare = double_bit_error_in_ecc,
+		.verify = double_bit_error_detect,
+	},
+};
+
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
+
+}
 
 static int __init ecc_test_init(void)
 {
-	srandom32(jiffies);
+	int i, j;
+	void *error_data;
+	void *error_ecc;
+	void *correct_data;
+	void *correct_ecc;
+	const size_t block_size[] = { 256, 512 };
+	int err = 0;
+
+	error_data = kmalloc(512, GFP_KERNEL);
+	error_ecc = kmalloc(3, GFP_KERNEL);
+	correct_data = kmalloc(512, GFP_KERNEL);
+	correct_ecc = kmalloc(3, GFP_KERNEL);
+
+	if (!error_data || !error_ecc || !correct_data || !correct_ecc) {
+		err = -ENOMEM;
+		goto error;
+	}
 
-	nand_ecc_test(256);
-	nand_ecc_test(512);
+	for (i = 0; i < ARRAY_SIZE(block_size); i++) {
+		size_t size = block_size[i];
+
+		get_random_bytes(correct_data, size);
+		__nand_calculate_ecc(correct_data, size, correct_ecc);
+
+		for (j = 0; j < ARRAY_SIZE(nand_ecc_test); j++) {
+			nand_ecc_test[j].prepare(error_data, error_ecc,
+					correct_data, correct_ecc, size);
+			err = nand_ecc_test[j].verify(error_data, error_ecc,
+							correct_data, size);
+
+			if (err) {
+				pr_err("mtd_nandecctest: not ok - %s-%zd\n",
+					nand_ecc_test[j].name, size);
+				dump_data_ecc(error_data, error_ecc,
+					correct_data, correct_ecc, size);
+				goto error;
+			}
+			pr_info("mtd_nandecctest: ok - %s-%zd\n",
+				nand_ecc_test[j].name, size);
+		}
+	}
+error:
+	kfree(error_data);
+	kfree(error_ecc);
+	kfree(correct_data);
+	kfree(correct_ecc);
 
+	return err;
+}
+
+#else
+
+static int __init ecc_test_init(void)
+{
 	return 0;
 }
 
+#endif
+
 static void __exit ecc_test_exit(void)
 {
 }
-- 
1.7.10.4
