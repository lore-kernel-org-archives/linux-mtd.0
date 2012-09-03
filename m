Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T8WGY-0007F0-5f
 for linux-mtd@lists.infradead.org; Mon, 03 Sep 2012 13:00:35 +0000
Received: by mail-pb0-f49.google.com with SMTP id rq8so8483460pbb.36
 for <linux-mtd@lists.infradead.org>; Mon, 03 Sep 2012 06:00:33 -0700 (PDT)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v3 08/11] mtd: mtd_nandecctest: rewrite the test routine
Date: Mon,  3 Sep 2012 22:00:03 +0900
Message-Id: <1346677206-13621-9-git-send-email-akinobu.mita@gmail.com>
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

This rewrites the entire test routine in order to make it easy to add more
tests by later changes and minimize duplication of each tests as much as
possible.

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/tests/mtd_nandecctest.c | 83 +++++++++++++++++++++++++++----------
 1 file changed, 60 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/tests/mtd_nandecctest.c b/drivers/mtd/tests/mtd_nandecctest.c
index 0274f73..65cec2a 100644
--- a/drivers/mtd/tests/mtd_nandecctest.c
+++ b/drivers/mtd/tests/mtd_nandecctest.c
@@ -11,6 +11,12 @@
 
 #if defined(CONFIG_MTD_NAND) || defined(CONFIG_MTD_NAND_MODULE)
 
+struct nand_ecc_test {
+	const char *name;
+	void (*prepare)(void *, void *, void *, void *, const size_t);
+	int (*verify)(void *, void *, void *, const size_t);
+};
+
 #ifdef __LITTLE_ENDIAN
 #define __change_bit_le(nr, addr) __change_bit(nr, addr)
 #else
@@ -18,13 +24,44 @@
 		__change_bit((nr) ^ ((BITS_PER_LONG - 1) & ~0x7), addr)
 #endif
 
-static void inject_single_bit_error(void *data, size_t size)
+static void single_bit_error_data(void *error_data, void *correct_data,
+				size_t size)
 {
 	unsigned int offset = random32() % (size * BITS_PER_BYTE);
 
-	__change_bit_le(offset, data);
+	memcpy(error_data, correct_data, size);
+	__change_bit_le(offset, error_data);
+}
+
+static void single_bit_error_in_data(void *error_data, void *error_ecc,
+		void *correct_data, void *correct_ecc, const size_t size)
+{
+	single_bit_error_data(error_data, correct_data, size);
+	memcpy(error_ecc, correct_ecc, 3);
 }
 
+static int single_bit_error_correct(void *error_data, void *error_ecc,
+				void *correct_data, const size_t size)
+{
+	unsigned char calc_ecc[3];
+	int ret;
+
+	__nand_calculate_ecc(error_data, size, calc_ecc);
+	ret = __nand_correct_data(error_data, calc_ecc, error_ecc, size);
+	if (ret == 1 && !memcmp(correct_data, error_data, size))
+		return 0;
+
+	return -EINVAL;
+}
+
+static const struct nand_ecc_test nand_ecc_test[] = {
+	{
+		.name = "single-bit-error-in-data-correct",
+		.prepare = single_bit_error_in_data,
+		.verify = single_bit_error_correct,
+	},
+};
+
 static void dump_data_ecc(void *error_data, void *error_ecc, void *correct_data,
 			void *correct_ecc, const size_t size)
 {
@@ -41,14 +78,14 @@ static void dump_data_ecc(void *error_data, void *error_ecc, void *correct_data,
 			DUMP_PREFIX_NONE, 16, 1, correct_ecc, 3, false);
 }
 
-static int nand_ecc_test(const size_t size)
+static int nand_ecc_test_run(const size_t size)
 {
+	int i;
 	int err = 0;
 	void *error_data;
 	void *error_ecc;
 	void *correct_data;
 	void *correct_ecc;
-	char testname[30];
 
 	error_data = kmalloc(size, GFP_KERNEL);
 	error_ecc = kmalloc(3, GFP_KERNEL);
@@ -60,25 +97,25 @@ static int nand_ecc_test(const size_t size)
 		goto error;
 	}
 
-	sprintf(testname, "nand-ecc-%zu", size);
-
 	get_random_bytes(correct_data, size);
-
-	memcpy(error_data, correct_data, size);
-	inject_single_bit_error(error_data, size);
-
 	__nand_calculate_ecc(correct_data, size, correct_ecc);
-	__nand_calculate_ecc(error_data, size, error_ecc);
-	__nand_correct_data(error_data, correct_ecc, error_ecc, size);
-
-	if (memcmp(correct_data, error_data, size)) {
-		pr_err("mtd_nandecctest: not ok - %s\n", testname);
-		dump_data_ecc(error_data, error_ecc, correct_data, correct_ecc,
-				size);
-		err = -EINVAL;
-		goto error;
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
 	}
-	pr_info("mtd_nandecctest: ok - %s\n", testname);
 error:
 	kfree(error_data);
 	kfree(error_ecc);
@@ -90,7 +127,7 @@ error:
 
 #else
 
-static int nand_ecc_test(const size_t size)
+static int nand_ecc_test_run(const size_t size)
 {
 	return 0;
 }
@@ -101,11 +138,11 @@ static int __init ecc_test_init(void)
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
