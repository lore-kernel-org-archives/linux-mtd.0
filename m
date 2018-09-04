Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fxCF5-00038Y-Ft
 for linux-mtd@lists.infradead.org; Tue, 04 Sep 2018 14:23:45 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] mtd: rawnand: Allow selection of ECC byte ordering at runtime
Date: Tue,  4 Sep 2018 16:23:28 +0200
Message-Id: <20180904142328.26577-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Currently, the selection of ECC byte ordering for software hamming is
done at compilation time, which doesn't make sense when ECC byte
calculation is done in hardware and byte ordering is forced by the
hardware engine.
In this case, only the correction is done and software and we want to
force the byte-ordering no matter the value of CONFIG_MTD_NAND_ECC_SMC.

This is typically the case for the FSMC (Smart Media ordering), TMIO and
TXX9NDFMC (regular byte ordering) blocks.

For all other use cases (pure software implementation, SM FTL and
nandecctest), we keep selecting the byte ordering based on the
CONFIG_MTD_NAND_ECC_SMC value. It might not be ideal for SM FTL (I'd
expect Smart Media ordering to be employed by the Smart Media FTL), but
this option doesn't seem to be enabled in the existing _defconfig, so
I can't tell setting sm_order to true is the right choice.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/fsmc_nand.c    |  1 +
 drivers/mtd/nand/raw/nand_base.c    |  4 ++
 drivers/mtd/nand/raw/nand_ecc.c     | 93 ++++++++++++++++---------------------
 drivers/mtd/nand/raw/tmio_nand.c    |  5 +-
 drivers/mtd/nand/raw/txx9ndfmc.c    |  3 +-
 drivers/mtd/sm_ftl.c                | 20 +++++---
 drivers/mtd/tests/mtd_nandecctest.c | 21 ++++++---
 include/linux/mtd/nand_ecc.h        |  4 +-
 include/linux/mtd/rawnand.h         |  6 +++
 9 files changed, 86 insertions(+), 71 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index f418236fa020..d00bafed542b 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -951,6 +951,7 @@ static int fsmc_nand_attach_chip(struct nand_chip *nand)
 		nand->ecc.correct = nand_correct_data;
 		nand->ecc.bytes = 3;
 		nand->ecc.strength = 1;
+		nand->ecc.options |= NAND_ECC_SOFT_HAMMING_SM_ORDER;
 		break;
 
 	case NAND_ECC_SOFT:
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index d527e448ce19..5a340afa3bc1 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -6070,6 +6070,10 @@ static int nand_set_ecc_soft_ops(struct mtd_info *mtd)
 			ecc->size = 256;
 		ecc->bytes = 3;
 		ecc->strength = 1;
+
+		if (IS_ENABLED(CONFIG_MTD_NAND_ECC_SMC))
+			ecc->options |= NAND_ECC_SOFT_HAMMING_SM_ORDER;
+
 		return 0;
 	case NAND_ECC_BCH:
 		if (!mtd_nand_has_bch()) {
diff --git a/drivers/mtd/nand/raw/nand_ecc.c b/drivers/mtd/nand/raw/nand_ecc.c
index 8e132edbc5ce..63d9b289dbf0 100644
--- a/drivers/mtd/nand/raw/nand_ecc.c
+++ b/drivers/mtd/nand/raw/nand_ecc.c
@@ -132,9 +132,10 @@ static const char addressbits[256] = {
  * @buf:	input buffer with raw data
  * @eccsize:	data bytes per ECC step (256 or 512)
  * @code:	output buffer with ECC
+ * @sm_order:	Smart Media byte ordering
  */
 void __nand_calculate_ecc(const unsigned char *buf, unsigned int eccsize,
-		       unsigned char *code)
+			  unsigned char *code, bool sm_order)
 {
 	int i;
 	const uint32_t *bp = (uint32_t *)buf;
@@ -330,45 +331,26 @@ void __nand_calculate_ecc(const unsigned char *buf, unsigned int eccsize,
 	 * possible, but benchmarks showed that on the system this is developed
 	 * the code below is the fastest
 	 */
-#ifdef CONFIG_MTD_NAND_ECC_SMC
-	code[0] =
-	    (invparity[rp7] << 7) |
-	    (invparity[rp6] << 6) |
-	    (invparity[rp5] << 5) |
-	    (invparity[rp4] << 4) |
-	    (invparity[rp3] << 3) |
-	    (invparity[rp2] << 2) |
-	    (invparity[rp1] << 1) |
-	    (invparity[rp0]);
-	code[1] =
-	    (invparity[rp15] << 7) |
-	    (invparity[rp14] << 6) |
-	    (invparity[rp13] << 5) |
-	    (invparity[rp12] << 4) |
-	    (invparity[rp11] << 3) |
-	    (invparity[rp10] << 2) |
-	    (invparity[rp9] << 1)  |
-	    (invparity[rp8]);
-#else
-	code[1] =
-	    (invparity[rp7] << 7) |
-	    (invparity[rp6] << 6) |
-	    (invparity[rp5] << 5) |
-	    (invparity[rp4] << 4) |
-	    (invparity[rp3] << 3) |
-	    (invparity[rp2] << 2) |
-	    (invparity[rp1] << 1) |
-	    (invparity[rp0]);
-	code[0] =
-	    (invparity[rp15] << 7) |
-	    (invparity[rp14] << 6) |
-	    (invparity[rp13] << 5) |
-	    (invparity[rp12] << 4) |
-	    (invparity[rp11] << 3) |
-	    (invparity[rp10] << 2) |
-	    (invparity[rp9] << 1)  |
-	    (invparity[rp8]);
-#endif
+	if (sm_order) {
+		code[0] = (invparity[rp7] << 7) | (invparity[rp6] << 6) |
+			  (invparity[rp5] << 5) | (invparity[rp4] << 4) |
+			  (invparity[rp3] << 3) | (invparity[rp2] << 2) |
+			  (invparity[rp1] << 1) | (invparity[rp0]);
+		code[1] = (invparity[rp15] << 7) | (invparity[rp14] << 6) |
+			  (invparity[rp13] << 5) | (invparity[rp12] << 4) |
+			  (invparity[rp11] << 3) | (invparity[rp10] << 2) |
+			  (invparity[rp9] << 1) | (invparity[rp8]);
+	} else {
+		code[1] = (invparity[rp7] << 7) | (invparity[rp6] << 6) |
+			  (invparity[rp5] << 5) | (invparity[rp4] << 4) |
+			  (invparity[rp3] << 3) | (invparity[rp2] << 2) |
+			  (invparity[rp1] << 1) | (invparity[rp0]);
+		code[0] = (invparity[rp15] << 7) | (invparity[rp14] << 6) |
+			  (invparity[rp13] << 5) | (invparity[rp12] << 4) |
+			  (invparity[rp11] << 3) | (invparity[rp10] << 2) |
+			  (invparity[rp9] << 1) | (invparity[rp8]);
+	}
+
 	if (eccsize_mult == 1)
 		code[2] =
 		    (invparity[par & 0xf0] << 7) |
@@ -401,8 +383,10 @@ EXPORT_SYMBOL(__nand_calculate_ecc);
 int nand_calculate_ecc(struct mtd_info *mtd, const unsigned char *buf,
 		       unsigned char *code)
 {
-	__nand_calculate_ecc(buf,
-			mtd_to_nand(mtd)->ecc.size, code);
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	bool sm_order = chip->ecc.options & NAND_ECC_SOFT_HAMMING_SM_ORDER;
+
+	__nand_calculate_ecc(buf, chip->ecc.size, code, sm_order);
 
 	return 0;
 }
@@ -414,12 +398,13 @@ EXPORT_SYMBOL(nand_calculate_ecc);
  * @read_ecc:	ECC from the chip
  * @calc_ecc:	the ECC calculated from raw data
  * @eccsize:	data bytes per ECC step (256 or 512)
+ * @sm_order:	Smart Media byte order
  *
  * Detect and correct a 1 bit error for eccsize byte block
  */
 int __nand_correct_data(unsigned char *buf,
 			unsigned char *read_ecc, unsigned char *calc_ecc,
-			unsigned int eccsize)
+			unsigned int eccsize, bool sm_order)
 {
 	unsigned char b0, b1, b2, bit_addr;
 	unsigned int byte_addr;
@@ -431,13 +416,14 @@ int __nand_correct_data(unsigned char *buf,
 	 * we might need the xor result  more than once,
 	 * so keep them in a local var
 	*/
-#ifdef CONFIG_MTD_NAND_ECC_SMC
-	b0 = read_ecc[0] ^ calc_ecc[0];
-	b1 = read_ecc[1] ^ calc_ecc[1];
-#else
-	b0 = read_ecc[1] ^ calc_ecc[1];
-	b1 = read_ecc[0] ^ calc_ecc[0];
-#endif
+	if (sm_order) {
+		b0 = read_ecc[0] ^ calc_ecc[0];
+		b1 = read_ecc[1] ^ calc_ecc[1];
+	} else {
+		b0 = read_ecc[1] ^ calc_ecc[1];
+		b1 = read_ecc[0] ^ calc_ecc[0];
+	}
+
 	b2 = read_ecc[2] ^ calc_ecc[2];
 
 	/* check if there are any bitfaults */
@@ -501,8 +487,11 @@ EXPORT_SYMBOL(__nand_correct_data);
 int nand_correct_data(struct mtd_info *mtd, unsigned char *buf,
 		      unsigned char *read_ecc, unsigned char *calc_ecc)
 {
-	return __nand_correct_data(buf, read_ecc, calc_ecc,
-				   mtd_to_nand(mtd)->ecc.size);
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	bool sm_order = chip->ecc.options & NAND_ECC_SOFT_HAMMING_SM_ORDER;
+
+	return __nand_correct_data(buf, read_ecc, calc_ecc, chip->ecc.size,
+				   sm_order);
 }
 EXPORT_SYMBOL(nand_correct_data);
 
diff --git a/drivers/mtd/nand/raw/tmio_nand.c b/drivers/mtd/nand/raw/tmio_nand.c
index dcaa924502de..85355985e202 100644
--- a/drivers/mtd/nand/raw/tmio_nand.c
+++ b/drivers/mtd/nand/raw/tmio_nand.c
@@ -296,10 +296,11 @@ static int tmio_nand_correct_data(struct mtd_info *mtd, unsigned char *buf,
 	int r0, r1;
 
 	/* assume ecc.size = 512 and ecc.bytes = 6 */
-	r0 = __nand_correct_data(buf, read_ecc, calc_ecc, 256);
+	r0 = __nand_correct_data(buf, read_ecc, calc_ecc, 256, false);
 	if (r0 < 0)
 		return r0;
-	r1 = __nand_correct_data(buf + 256, read_ecc + 3, calc_ecc + 3, 256);
+	r1 = __nand_correct_data(buf + 256, read_ecc + 3, calc_ecc + 3, 256,
+				 false);
 	if (r1 < 0)
 		return r1;
 	return r0 + r1;
diff --git a/drivers/mtd/nand/raw/txx9ndfmc.c b/drivers/mtd/nand/raw/txx9ndfmc.c
index 4d61a14fcb65..ba97d4489ada 100644
--- a/drivers/mtd/nand/raw/txx9ndfmc.c
+++ b/drivers/mtd/nand/raw/txx9ndfmc.c
@@ -200,7 +200,8 @@ static int txx9ndfmc_correct_data(struct mtd_info *mtd, unsigned char *buf,
 	int stat;
 
 	for (eccsize = chip->ecc.size; eccsize > 0; eccsize -= 256) {
-		stat = __nand_correct_data(buf, read_ecc, calc_ecc, 256);
+		stat = __nand_correct_data(buf, read_ecc, calc_ecc, 256,
+					   false);
 		if (stat < 0)
 			return stat;
 		corrected += stat;
diff --git a/drivers/mtd/sm_ftl.c b/drivers/mtd/sm_ftl.c
index f3bd86e13603..89227b1d036a 100644
--- a/drivers/mtd/sm_ftl.c
+++ b/drivers/mtd/sm_ftl.c
@@ -221,14 +221,18 @@ static int sm_correct_sector(uint8_t *buffer, struct sm_oob *oob)
 {
 	uint8_t ecc[3];
 
-	__nand_calculate_ecc(buffer, SM_SMALL_PAGE, ecc);
-	if (__nand_correct_data(buffer, ecc, oob->ecc1, SM_SMALL_PAGE) < 0)
+	__nand_calculate_ecc(buffer, SM_SMALL_PAGE, ecc,
+			     IS_ENABLED(CONFIG_MTD_NAND_ECC_SMC));
+	if (__nand_correct_data(buffer, ecc, oob->ecc1, SM_SMALL_PAGE,
+				IS_ENABLED(CONFIG_MTD_NAND_ECC_SMC)) < 0)
 		return -EIO;
 
 	buffer += SM_SMALL_PAGE;
 
-	__nand_calculate_ecc(buffer, SM_SMALL_PAGE, ecc);
-	if (__nand_correct_data(buffer, ecc, oob->ecc2, SM_SMALL_PAGE) < 0)
+	__nand_calculate_ecc(buffer, SM_SMALL_PAGE, ecc,
+			     IS_ENABLED(CONFIG_MTD_NAND_ECC_SMC));
+	if (__nand_correct_data(buffer, ecc, oob->ecc2, SM_SMALL_PAGE,
+				IS_ENABLED(CONFIG_MTD_NAND_ECC_SMC)) < 0)
 		return -EIO;
 	return 0;
 }
@@ -393,11 +397,13 @@ static int sm_write_block(struct sm_ftl *ftl, uint8_t *buf,
 		}
 
 		if (ftl->smallpagenand) {
-			__nand_calculate_ecc(buf + boffset,
-						SM_SMALL_PAGE, oob.ecc1);
+			__nand_calculate_ecc(buf + boffset, SM_SMALL_PAGE,
+					oob.ecc1,
+					IS_ENABLED(CONFIG_MTD_NAND_ECC_SMC));
 
 			__nand_calculate_ecc(buf + boffset + SM_SMALL_PAGE,
-						SM_SMALL_PAGE, oob.ecc2);
+					SM_SMALL_PAGE, oob.ecc2,
+					IS_ENABLED(CONFIG_MTD_NAND_ECC_SMC));
 		}
 		if (!sm_write_sector(ftl, zone, block, boffset,
 							buf + boffset, &oob))
diff --git a/drivers/mtd/tests/mtd_nandecctest.c b/drivers/mtd/tests/mtd_nandecctest.c
index 88b6c81cebbe..c71523e94580 100644
--- a/drivers/mtd/tests/mtd_nandecctest.c
+++ b/drivers/mtd/tests/mtd_nandecctest.c
@@ -121,8 +121,10 @@ static int no_bit_error_verify(void *error_data, void *error_ecc,
 	unsigned char calc_ecc[3];
 	int ret;
 
-	__nand_calculate_ecc(error_data, size, calc_ecc);
-	ret = __nand_correct_data(error_data, error_ecc, calc_ecc, size);
+	__nand_calculate_ecc(error_data, size, calc_ecc,
+			     IS_ENABLED(CONFIG_MTD_NAND_ECC_SMC));
+	ret = __nand_correct_data(error_data, error_ecc, calc_ecc, size,
+				  IS_ENABLED(CONFIG_MTD_NAND_ECC_SMC));
 	if (ret == 0 && !memcmp(correct_data, error_data, size))
 		return 0;
 
@@ -149,8 +151,10 @@ static int single_bit_error_correct(void *error_data, void *error_ecc,
 	unsigned char calc_ecc[3];
 	int ret;
 
-	__nand_calculate_ecc(error_data, size, calc_ecc);
-	ret = __nand_correct_data(error_data, error_ecc, calc_ecc, size);
+	__nand_calculate_ecc(error_data, size, calc_ecc,
+			     IS_ENABLED(CONFIG_MTD_NAND_ECC_SMC));
+	ret = __nand_correct_data(error_data, error_ecc, calc_ecc, size,
+				  IS_ENABLED(CONFIG_MTD_NAND_ECC_SMC));
 	if (ret == 1 && !memcmp(correct_data, error_data, size))
 		return 0;
 
@@ -184,8 +188,10 @@ static int double_bit_error_detect(void *error_data, void *error_ecc,
 	unsigned char calc_ecc[3];
 	int ret;
 
-	__nand_calculate_ecc(error_data, size, calc_ecc);
-	ret = __nand_correct_data(error_data, error_ecc, calc_ecc, size);
+	__nand_calculate_ecc(error_data, size, calc_ecc,
+			     IS_ENABLED(CONFIG_MTD_NAND_ECC_SMC));
+	ret = __nand_correct_data(error_data, error_ecc, calc_ecc, size,
+				  IS_ENABLED(CONFIG_MTD_NAND_ECC_SMC));
 
 	return (ret == -EBADMSG) ? 0 : -EINVAL;
 }
@@ -259,7 +265,8 @@ static int nand_ecc_test_run(const size_t size)
 	}
 
 	prandom_bytes(correct_data, size);
-	__nand_calculate_ecc(correct_data, size, correct_ecc);
+	__nand_calculate_ecc(correct_data, size, correct_ecc,
+			     IS_ENABLED(CONFIG_MTD_NAND_ECC_SMC));
 
 	for (i = 0; i < ARRAY_SIZE(nand_ecc_test); i++) {
 		nand_ecc_test[i].prepare(error_data, error_ecc,
diff --git a/include/linux/mtd/nand_ecc.h b/include/linux/mtd/nand_ecc.h
index 8a2decf7462c..95614fe02d29 100644
--- a/include/linux/mtd/nand_ecc.h
+++ b/include/linux/mtd/nand_ecc.h
@@ -19,7 +19,7 @@ struct mtd_info;
  * Calculate 3 byte ECC code for eccsize byte block
  */
 void __nand_calculate_ecc(const u_char *dat, unsigned int eccsize,
-				u_char *ecc_code);
+			  u_char *ecc_code, bool sm_order);
 
 /*
  * Calculate 3 byte ECC code for 256/512 byte block
@@ -30,7 +30,7 @@ int nand_calculate_ecc(struct mtd_info *mtd, const u_char *dat, u_char *ecc_code
  * Detect and correct a 1 bit error for eccsize byte block
  */
 int __nand_correct_data(u_char *dat, u_char *read_ecc, u_char *calc_ecc,
-			unsigned int eccsize);
+			unsigned int eccsize, bool sm_order);
 
 /*
  * Detect and correct a 1 bit error for 256/512 byte block
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index efb2345359bb..824f2c222290 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -131,6 +131,12 @@ enum nand_ecc_algo {
 #define NAND_ECC_GENERIC_ERASED_CHECK	BIT(0)
 #define NAND_ECC_MAXIMIZE		BIT(1)
 
+/*
+ * When using software implementation of Hamming, we can specify which byte
+ * ordering should be used.
+ */
+#define NAND_ECC_SOFT_HAMMING_SM_ORDER	BIT(2)
+
 /* Bit mask for flags passed to do_nand_read_ecc */
 #define NAND_GET_DEVICE		0x80
 
-- 
2.14.1
