Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T5bco-0007yC-Hr
 for linux-mtd@lists.infradead.org; Sun, 26 Aug 2012 12:07:30 +0000
Received: by mail-pb0-f49.google.com with SMTP id rq8so6170345pbb.36
 for <linux-mtd@lists.infradead.org>; Sun, 26 Aug 2012 05:07:30 -0700 (PDT)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 4/6] mtd: mtd_nandecctest: add no corruption test
Date: Sun, 26 Aug 2012 21:06:46 +0900
Message-Id: <1345982808-11440-5-git-send-email-akinobu.mita@gmail.com>
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

This adds no corruptin test case listed below:

Prepare data block and ECC data with no corruption, and verify that
the data block is preserved by __nand_correct_data()

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/tests/mtd_nandecctest.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/mtd/tests/mtd_nandecctest.c b/drivers/mtd/tests/mtd_nandecctest.c
index 466bc5c..49d6673 100644
--- a/drivers/mtd/tests/mtd_nandecctest.c
+++ b/drivers/mtd/tests/mtd_nandecctest.c
@@ -34,6 +34,27 @@ static void single_bit_error_data(void *error_data, void *correct_data,
 	__change_bit_le(offset, error_data);
 }
 
+static void no_bit_error(void *error_data, void *error_ecc,
+		void *correct_data, void *correct_ecc, const size_t size)
+{
+	memcpy(error_data, correct_data, size);
+	memcpy(error_ecc, correct_ecc, 3);
+}
+
+static int no_bit_error_verify(void *error_data, void *error_ecc,
+				void *correct_data, const size_t size)
+{
+	unsigned char calc_ecc[3];
+	int ret;
+
+	__nand_calculate_ecc(error_data, size, calc_ecc);
+	ret = __nand_correct_data(error_data, calc_ecc, error_ecc, size);
+	if (ret == 0 && !memcmp(correct_data, error_data, size))
+		return 0;
+
+	return -EINVAL;
+}
+
 static void single_bit_error_in_data(void *error_data, void *error_ecc,
 		void *correct_data, void *correct_ecc, const size_t size)
 {
@@ -57,6 +78,11 @@ static int single_bit_error_correct(void *error_data, void *error_ecc,
 
 static const struct nand_ecc_test nand_ecc_test[] = {
 	{
+		.name = "no-bit-error",
+		.prepare = no_bit_error,
+		.verify = no_bit_error_verify,
+	},
+	{
 		.name = "single-bit-error-in-data-correct",
 		.prepare = single_bit_error_in_data,
 		.verify = single_bit_error_correct,
-- 
1.7.11.4
