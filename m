Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T8WGb-0007EJ-V1
 for linux-mtd@lists.infradead.org; Mon, 03 Sep 2012 13:00:39 +0000
Received: by mail-pb0-f49.google.com with SMTP id rq8so8483440pbb.36
 for <linux-mtd@lists.infradead.org>; Mon, 03 Sep 2012 06:00:37 -0700 (PDT)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v3 11/11] mtd: mtd_nandecctest: add double bit error detection
 tests
Date: Mon,  3 Sep 2012 22:00:06 +0900
Message-Id: <1346677206-13621-12-git-send-email-akinobu.mita@gmail.com>
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

This adds the double bit error detection test cases listed below:

* Prepare data block with double bit error and ECC data without
corruption, and verify that the uncorrectable error is detected by
__nand_correct_data().

* Prepare data block with single bit error and ECC data with single bit
error, and verify that the uncorrectable error is detected.

* Prepare data block without corruption and ECC data with double bit
error, and verify that the uncorrectable error is detected.

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
No changes from previous version

 drivers/mtd/tests/mtd_nandecctest.c | 80 +++++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/drivers/mtd/tests/mtd_nandecctest.c b/drivers/mtd/tests/mtd_nandecctest.c
index 77ba479..b2c95c7 100644
--- a/drivers/mtd/tests/mtd_nandecctest.c
+++ b/drivers/mtd/tests/mtd_nandecctest.c
@@ -33,6 +33,22 @@ static void single_bit_error_data(void *error_data, void *correct_data,
 	__change_bit_le(offset, error_data);
 }
 
+static void double_bit_error_data(void *error_data, void *correct_data,
+				size_t size)
+{
+	unsigned int offset[2];
+
+	offset[0] = random32() % (size * BITS_PER_BYTE);
+	do {
+		offset[1] = random32() % (size * BITS_PER_BYTE);
+	} while (offset[0] == offset[1]);
+
+	memcpy(error_data, correct_data, size);
+
+	__change_bit_le(offset[0], error_data);
+	__change_bit_le(offset[1], error_data);
+}
+
 static unsigned int random_ecc_bit(size_t size)
 {
 	unsigned int offset = random32() % (3 * BITS_PER_BYTE);
@@ -58,6 +74,21 @@ static void single_bit_error_ecc(void *error_ecc, void *correct_ecc,
 	__change_bit_le(offset, error_ecc);
 }
 
+static void double_bit_error_ecc(void *error_ecc, void *correct_ecc,
+				size_t size)
+{
+	unsigned int offset[2];
+
+	offset[0] = random_ecc_bit(size);
+	do {
+		offset[1] = random_ecc_bit(size);
+	} while (offset[0] == offset[1]);
+
+	memcpy(error_ecc, correct_ecc, 3);
+	__change_bit_le(offset[0], error_ecc);
+	__change_bit_le(offset[1], error_ecc);
+}
+
 static void no_bit_error(void *error_data, void *error_ecc,
 		void *correct_data, void *correct_ecc, const size_t size)
 {
@@ -107,6 +138,40 @@ static int single_bit_error_correct(void *error_data, void *error_ecc,
 	return -EINVAL;
 }
 
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
 static const struct nand_ecc_test nand_ecc_test[] = {
 	{
 		.name = "no-bit-error",
@@ -123,6 +188,21 @@ static const struct nand_ecc_test nand_ecc_test[] = {
 		.prepare = single_bit_error_in_ecc,
 		.verify = single_bit_error_correct,
 	},
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
 };
 
 static void dump_data_ecc(void *error_data, void *error_ecc, void *correct_data,
-- 
1.7.11.4
