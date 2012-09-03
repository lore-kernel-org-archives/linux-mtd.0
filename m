Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T8WGa-0007Dw-LP
 for linux-mtd@lists.infradead.org; Mon, 03 Sep 2012 13:00:37 +0000
Received: by mail-pz0-f49.google.com with SMTP id q27so3778279daj.36
 for <linux-mtd@lists.infradead.org>; Mon, 03 Sep 2012 06:00:36 -0700 (PDT)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v3 10/11] mtd: mtd_nandecctest: add single bit error
 correction test
Date: Mon,  3 Sep 2012 22:00:05 +0900
Message-Id: <1346677206-13621-11-git-send-email-akinobu.mita@gmail.com>
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

This adds the single bit error correction test case listed below:

Prepare data block without corruption and ECC data with single bit error,
and verify that the data block is preserved by __nand_correct_data().

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
No changes from previous version

 drivers/mtd/tests/mtd_nandecctest.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/mtd/tests/mtd_nandecctest.c b/drivers/mtd/tests/mtd_nandecctest.c
index 1d1af09..77ba479 100644
--- a/drivers/mtd/tests/mtd_nandecctest.c
+++ b/drivers/mtd/tests/mtd_nandecctest.c
@@ -33,6 +33,31 @@ static void single_bit_error_data(void *error_data, void *correct_data,
 	__change_bit_le(offset, error_data);
 }
 
+static unsigned int random_ecc_bit(size_t size)
+{
+	unsigned int offset = random32() % (3 * BITS_PER_BYTE);
+
+	if (size == 256) {
+		/*
+		 * Don't inject a bit error into the insignificant bits (16th
+		 * and 17th bit) in ECC code for 256 byte data block
+		 */
+		while (offset == 16 || offset == 17)
+			offset = random32() % (3 * BITS_PER_BYTE);
+	}
+
+	return offset;
+}
+
+static void single_bit_error_ecc(void *error_ecc, void *correct_ecc,
+				size_t size)
+{
+	unsigned int offset = random_ecc_bit(size);
+
+	memcpy(error_ecc, correct_ecc, 3);
+	__change_bit_le(offset, error_ecc);
+}
+
 static void no_bit_error(void *error_data, void *error_ecc,
 		void *correct_data, void *correct_ecc, const size_t size)
 {
@@ -61,6 +86,13 @@ static void single_bit_error_in_data(void *error_data, void *error_ecc,
 	memcpy(error_ecc, correct_ecc, 3);
 }
 
+static void single_bit_error_in_ecc(void *error_data, void *error_ecc,
+		void *correct_data, void *correct_ecc, const size_t size)
+{
+	memcpy(error_data, correct_data, size);
+	single_bit_error_ecc(error_ecc, correct_ecc, size);
+}
+
 static int single_bit_error_correct(void *error_data, void *error_ecc,
 				void *correct_data, const size_t size)
 {
@@ -86,6 +118,11 @@ static const struct nand_ecc_test nand_ecc_test[] = {
 		.prepare = single_bit_error_in_data,
 		.verify = single_bit_error_correct,
 	},
+	{
+		.name = "single-bit-error-in-ecc-correct",
+		.prepare = single_bit_error_in_ecc,
+		.verify = single_bit_error_correct,
+	},
 };
 
 static void dump_data_ecc(void *error_data, void *error_ecc, void *correct_data,
-- 
1.7.11.4
