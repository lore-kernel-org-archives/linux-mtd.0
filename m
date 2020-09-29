Return-Path: <SRS0=p2FF=DG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4346C4727C
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 23:03:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1533920897
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 23:03:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="birBQhp8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1533920897
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pCp3OwWVNBtqgKSud9lLjuCmk7674wM9PKo5msKoVvw=; b=birBQhp8+tP8oldeP3EVCIWU/
	pk6wiUBDLpfhWVPiwIlsh8Xu3NqfdWvAqSYQYjorAAHRwbWaJr9yOSQkl+I9OBWihnpNrK83OUZsQ
	Z/DRcYNfNkkaULvBMpJlA+nOnx3d3hslT6ciR6KLYTJ8juHREFjeBKdzqeyK52vQlAfGy2F6F9TnS
	pZvwjZnwc8tV9KBD9cXqM0PVLssNejrudlIaBSEUvvfZAmsxQbK8h0AynLUnMjzX1czKlLGM2FEtq
	DDSXsvWWT2td4MXf5EAIHvWmXPfRZcmtbCLWjlSI/nPJmn9X6ERNmcBfpNyMYIDZczJG9h3zcyiKb
	aWQJEWrPg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNOeW-0001xh-A4; Tue, 29 Sep 2020 23:03:20 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNOcz-0001Fu-Nw
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2020 23:01:49 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id EF77F200007;
 Tue, 29 Sep 2020 23:01:43 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 15/20] mtd: nand: ecc-hamming: Rename the exported functions
Date: Wed, 30 Sep 2020 01:01:19 +0200
Message-Id: <20200929230124.31491-16-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200929230124.31491-1-miquel.raynal@bootlin.com>
References: <20200929230124.31491-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_190146_657060_95C85263 
X-CRM114-Status: GOOD (  20.92  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Julien Su <juliensu@mxic.com.tw>, ycllin@mxic.com.tw,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Prefix by ecc_sw_hamming_ the functions which should be internal only
but are exported for "raw" operations.

Prefix by nand_ecc_sw_hamming_ the other functions which will be used
in the context of the declaration of an Hamming proper ECC engine
object.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/ecc-sw-hamming.c       | 53 +++++++++++++------------
 drivers/mtd/nand/raw/cs553x_nand.c      |  3 +-
 drivers/mtd/nand/raw/fsmc_nand.c        |  2 +-
 drivers/mtd/nand/raw/lpc32xx_slc.c      |  2 +-
 drivers/mtd/nand/raw/nand_base.c        | 25 +++++++++++-
 drivers/mtd/nand/raw/ndfc.c             |  3 +-
 drivers/mtd/nand/raw/sharpsl.c          |  2 +-
 drivers/mtd/nand/raw/tmio_nand.c        |  6 +--
 drivers/mtd/nand/raw/txx9ndfmc.c        |  4 +-
 drivers/mtd/sm_ftl.c                    | 28 ++++++-------
 drivers/mtd/tests/mtd_nandecctest.c     | 29 +++++++-------
 include/linux/mtd/nand-ecc-sw-hamming.h | 38 ++++++------------
 include/linux/mtd/rawnand.h             |  7 ++++
 13 files changed, 109 insertions(+), 93 deletions(-)

diff --git a/drivers/mtd/nand/ecc-sw-hamming.c b/drivers/mtd/nand/ecc-sw-hamming.c
index 771e27ed8883..7ee0387ecb29 100644
--- a/drivers/mtd/nand/ecc-sw-hamming.c
+++ b/drivers/mtd/nand/ecc-sw-hamming.c
@@ -75,7 +75,7 @@ static const char bitsperbyte[256] = {
  * addressbits is a lookup table to filter out the bits from the xor-ed
  * ECC data that identify the faulty location.
  * this is only used for repairing parity
- * see the comments in nand_correct_data for more details
+ * see the comments in nand_ecc_sw_hamming_correct for more details
  */
 static const char addressbits[256] = {
 	0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01,
@@ -112,11 +112,11 @@ static const char addressbits[256] = {
 	0x0e, 0x0e, 0x0f, 0x0f, 0x0e, 0x0e, 0x0f, 0x0f
 };
 
-void __nand_calculate_ecc(const unsigned char *buf, unsigned int eccsize,
-			  unsigned char *code, bool sm_order)
+int ecc_sw_hamming_calculate(const unsigned char *buf, unsigned int step_size,
+			     unsigned char *code, bool sm_order)
 {
 	const u32 *bp = (uint32_t *)buf;
-	const u32 eccsize_mult = eccsize >> 8;
+	const u32 eccsize_mult = step_size >> 8;
 	/* current value in buffer */
 	u32 cur;
 	/* rp0..rp17 are the various accumulated parities (per byte) */
@@ -347,31 +347,32 @@ void __nand_calculate_ecc(const unsigned char *buf, unsigned int eccsize,
 		    (invparity[par & 0x55] << 2) |
 		    (invparity[rp17] << 1) |
 		    (invparity[rp16] << 0);
+
+	return 0;
 }
-EXPORT_SYMBOL(__nand_calculate_ecc);
+EXPORT_SYMBOL(ecc_sw_hamming_calculate);
 
 /**
- * nand_calculate_ecc - Calculate 3-byte ECC for 256/512-byte block
- * @chip: NAND chip object
+ * nand_ecc_sw_hamming_calculate - Calculate 3-byte ECC for 256/512-byte block
+ * @nand: NAND device
  * @buf: Input buffer with raw data
  * @code: Output buffer with ECC
  */
-int nand_calculate_ecc(struct nand_chip *chip, const unsigned char *buf,
-		       unsigned char *code)
+int nand_ecc_sw_hamming_calculate(struct nand_device *nand,
+				  const unsigned char *buf, unsigned char *code)
 {
+	struct nand_chip *chip = mtd_to_nand(nanddev_to_mtd(nand));
 	bool sm_order = chip->ecc.options & NAND_ECC_SOFT_HAMMING_SM_ORDER;
 
-	__nand_calculate_ecc(buf, chip->ecc.size, code, sm_order);
-
-	return 0;
+	return ecc_sw_hamming_calculate(buf, chip->ecc.size, code, sm_order);
 }
-EXPORT_SYMBOL(nand_calculate_ecc);
+EXPORT_SYMBOL(nand_ecc_sw_hamming_calculate);
 
-int __nand_correct_data(unsigned char *buf,
-			unsigned char *read_ecc, unsigned char *calc_ecc,
-			unsigned int eccsize, bool sm_order)
+int ecc_sw_hamming_correct(unsigned char *buf, unsigned char *read_ecc,
+			   unsigned char *calc_ecc, unsigned int step_size,
+			   bool sm_order)
 {
-	const u32 eccsize_mult = eccsize >> 8;
+	const u32 eccsize_mult = step_size >> 8;
 	unsigned char b0, b1, b2, bit_addr;
 	unsigned int byte_addr;
 
@@ -437,26 +438,28 @@ int __nand_correct_data(unsigned char *buf,
 	pr_err("%s: uncorrectable ECC error\n", __func__);
 	return -EBADMSG;
 }
-EXPORT_SYMBOL(__nand_correct_data);
+EXPORT_SYMBOL(ecc_sw_hamming_correct);
 
 /**
- * nand_correct_data - Detect and correct bit error(s)
- * @chip: NAND chip object
+ * nand_ecc_sw_hamming_correct - Detect and correct bit error(s)
+ * @nand: NAND device
  * @buf: Raw data read from the chip
  * @read_ecc: ECC bytes read from the chip
  * @calc_ecc: ECC calculated from the raw data
  *
  * Detect and correct up to 1 bit error per 256/512-byte block.
  */
-int nand_correct_data(struct nand_chip *chip, unsigned char *buf,
-		      unsigned char *read_ecc, unsigned char *calc_ecc)
+int nand_ecc_sw_hamming_correct(struct nand_device *nand, unsigned char *buf,
+				unsigned char *read_ecc,
+				unsigned char *calc_ecc)
 {
+	struct nand_chip *chip = mtd_to_nand(nanddev_to_mtd(nand));
 	bool sm_order = chip->ecc.options & NAND_ECC_SOFT_HAMMING_SM_ORDER;
 
-	return __nand_correct_data(buf, read_ecc, calc_ecc, chip->ecc.size,
-				   sm_order);
+	return ecc_sw_hamming_correct(buf, read_ecc, calc_ecc, chip->ecc.size,
+				      sm_order);
 }
-EXPORT_SYMBOL(nand_correct_data);
+EXPORT_SYMBOL(nand_ecc_sw_hamming_correct);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Frans Meulenbroeks <fransmeulenbroeks@gmail.com>");
diff --git a/drivers/mtd/nand/raw/cs553x_nand.c b/drivers/mtd/nand/raw/cs553x_nand.c
index 7c492096426b..b066dcae31ab 100644
--- a/drivers/mtd/nand/raw/cs553x_nand.c
+++ b/drivers/mtd/nand/raw/cs553x_nand.c
@@ -19,7 +19,6 @@
 #include <linux/delay.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 #include <linux/iopoll.h>
 
@@ -291,7 +290,7 @@ static int __init cs553x_init_one(int cs, int mmio, unsigned long adr)
 	this->ecc.bytes = 3;
 	this->ecc.hwctl  = cs_enable_hwecc;
 	this->ecc.calculate = cs_calculate_ecc;
-	this->ecc.correct  = nand_correct_data;
+	this->ecc.correct  = rawnand_sw_hamming_correct;
 	this->ecc.strength = 1;
 
 	/* Enable the following for a flash based bad block table */
diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index cb41d527bee0..efd422201e54 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -904,7 +904,7 @@ static int fsmc_nand_attach_chip(struct nand_chip *nand)
 	case NAND_ECC_ENGINE_TYPE_ON_HOST:
 		dev_info(host->dev, "Using 1-bit HW ECC scheme\n");
 		nand->ecc.calculate = fsmc_read_hwecc_ecc1;
-		nand->ecc.correct = nand_correct_data;
+		nand->ecc.correct = rawnand_sw_hamming_correct;
 		nand->ecc.bytes = 3;
 		nand->ecc.strength = 1;
 		nand->ecc.options |= NAND_ECC_SOFT_HAMMING_SM_ORDER;
diff --git a/drivers/mtd/nand/raw/lpc32xx_slc.c b/drivers/mtd/nand/raw/lpc32xx_slc.c
index 0f395cc7f101..2bf8e85578a3 100644
--- a/drivers/mtd/nand/raw/lpc32xx_slc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_slc.c
@@ -893,7 +893,7 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	chip->ecc.write_oob = lpc32xx_nand_write_oob_syndrome;
 	chip->ecc.read_oob = lpc32xx_nand_read_oob_syndrome;
 	chip->ecc.calculate = lpc32xx_nand_ecc_calculate;
-	chip->ecc.correct = nand_correct_data;
+	chip->ecc.correct = rawnand_sw_hamming_correct;
 	chip->ecc.strength = 1;
 	chip->ecc.hwctl = lpc32xx_nand_ecc_enable;
 
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index a8aaedd940cd..07a5ceb8bf39 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5144,6 +5144,27 @@ static void nand_scan_ident_cleanup(struct nand_chip *chip)
 	kfree(chip->parameters.onfi);
 }
 
+int rawnand_sw_hamming_calculate(struct nand_chip *chip,
+				 const unsigned char *buf,
+				 unsigned char *code)
+{
+	struct nand_device *base = &chip->base;
+
+	return nand_ecc_sw_hamming_calculate(base, buf, code);
+}
+EXPORT_SYMBOL(rawnand_sw_hamming_calculate);
+
+int rawnand_sw_hamming_correct(struct nand_chip *chip,
+			       unsigned char *buf,
+			       unsigned char *read_ecc,
+			       unsigned char *calc_ecc)
+{
+	struct nand_device *base = &chip->base;
+
+	return nand_ecc_sw_hamming_correct(base, buf, read_ecc, calc_ecc);
+}
+EXPORT_SYMBOL(rawnand_sw_hamming_correct);
+
 int rawnand_sw_bch_init(struct nand_chip *chip)
 {
 	struct nand_device *base = &chip->base;
@@ -5268,8 +5289,8 @@ static int nand_set_ecc_soft_ops(struct nand_chip *chip)
 
 	switch (ecc->algo) {
 	case NAND_ECC_ALGO_HAMMING:
-		ecc->calculate = nand_calculate_ecc;
-		ecc->correct = nand_correct_data;
+		ecc->calculate = rawnand_sw_hamming_calculate;
+		ecc->correct = rawnand_sw_hamming_correct;
 		ecc->read_page = nand_read_page_swecc;
 		ecc->read_subpage = nand_read_subpage;
 		ecc->write_page = nand_write_page_swecc;
diff --git a/drivers/mtd/nand/raw/ndfc.c b/drivers/mtd/nand/raw/ndfc.c
index 8cda6633280b..338d6b1a189e 100644
--- a/drivers/mtd/nand/raw/ndfc.c
+++ b/drivers/mtd/nand/raw/ndfc.c
@@ -18,7 +18,6 @@
  */
 #include <linux/module.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/ndfc.h>
 #include <linux/slab.h>
@@ -146,7 +145,7 @@ static int ndfc_chip_init(struct ndfc_controller *ndfc,
 	chip->controller = &ndfc->ndfc_control;
 	chip->legacy.read_buf = ndfc_read_buf;
 	chip->legacy.write_buf = ndfc_write_buf;
-	chip->ecc.correct = nand_correct_data;
+	chip->ecc.correct = rawnand_sw_hamming_correct;
 	chip->ecc.hwctl = ndfc_enable_hwecc;
 	chip->ecc.calculate = ndfc_calculate_ecc;
 	chip->ecc.engine_type = NAND_ECC_ENGINE_TYPE_ON_HOST;
diff --git a/drivers/mtd/nand/raw/sharpsl.c b/drivers/mtd/nand/raw/sharpsl.c
index 553ffb61b7e1..da0621c44e86 100644
--- a/drivers/mtd/nand/raw/sharpsl.c
+++ b/drivers/mtd/nand/raw/sharpsl.c
@@ -164,7 +164,7 @@ static int sharpsl_nand_probe(struct platform_device *pdev)
 	this->badblock_pattern = data->badblock_pattern;
 	this->ecc.hwctl = sharpsl_nand_enable_hwecc;
 	this->ecc.calculate = sharpsl_nand_calculate_ecc;
-	this->ecc.correct = nand_correct_data;
+	this->ecc.correct = rawnand_sw_hamming_correct;
 
 	/* Scan to find existence of the device */
 	err = nand_scan(this, 1);
diff --git a/drivers/mtd/nand/raw/tmio_nand.c b/drivers/mtd/nand/raw/tmio_nand.c
index cd3733c3ae04..fc331e734898 100644
--- a/drivers/mtd/nand/raw/tmio_nand.c
+++ b/drivers/mtd/nand/raw/tmio_nand.c
@@ -292,11 +292,11 @@ static int tmio_nand_correct_data(struct nand_chip *chip, unsigned char *buf,
 	int r0, r1;
 
 	/* assume ecc.size = 512 and ecc.bytes = 6 */
-	r0 = __nand_correct_data(buf, read_ecc, calc_ecc, 256, false);
+	r0 = rawnand_sw_hamming_correct(chip, buf, read_ecc, calc_ecc);
 	if (r0 < 0)
 		return r0;
-	r1 = __nand_correct_data(buf + 256, read_ecc + 3, calc_ecc + 3, 256,
-				 false);
+	r1 = rawnand_sw_hamming_correct(chip, buf + 256, read_ecc + 3,
+					calc_ecc + 3);
 	if (r1 < 0)
 		return r1;
 	return r0 + r1;
diff --git a/drivers/mtd/nand/raw/txx9ndfmc.c b/drivers/mtd/nand/raw/txx9ndfmc.c
index ade0bfd2648d..5919d2bb222a 100644
--- a/drivers/mtd/nand/raw/txx9ndfmc.c
+++ b/drivers/mtd/nand/raw/txx9ndfmc.c
@@ -194,8 +194,8 @@ static int txx9ndfmc_correct_data(struct nand_chip *chip, unsigned char *buf,
 	int stat;
 
 	for (eccsize = chip->ecc.size; eccsize > 0; eccsize -= 256) {
-		stat = __nand_correct_data(buf, read_ecc, calc_ecc, 256,
-					   false);
+		stat = rawnand_sw_hamming_correct(chip, buf, read_ecc,
+						  calc_ecc);
 		if (stat < 0)
 			return stat;
 		corrected += stat;
diff --git a/drivers/mtd/sm_ftl.c b/drivers/mtd/sm_ftl.c
index db430ae6a1a2..4d1ae25507ab 100644
--- a/drivers/mtd/sm_ftl.c
+++ b/drivers/mtd/sm_ftl.c
@@ -216,20 +216,19 @@ static void sm_break_offset(struct sm_ftl *ftl, loff_t loffset,
 
 static int sm_correct_sector(uint8_t *buffer, struct sm_oob *oob)
 {
+	bool sm_order = IS_ENABLED(CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC);
 	uint8_t ecc[3];
 
-	__nand_calculate_ecc(buffer, SM_SMALL_PAGE, ecc,
-			     IS_ENABLED(CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC));
-	if (__nand_correct_data(buffer, ecc, oob->ecc1, SM_SMALL_PAGE,
-				IS_ENABLED(CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC)) < 0)
+	ecc_sw_hamming_calculate(buffer, SM_SMALL_PAGE, ecc, sm_order);
+	if (ecc_sw_hamming_correct(buffer, ecc, oob->ecc1, SM_SMALL_PAGE,
+				   sm_order) < 0)
 		return -EIO;
 
 	buffer += SM_SMALL_PAGE;
 
-	__nand_calculate_ecc(buffer, SM_SMALL_PAGE, ecc,
-			     IS_ENABLED(CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC));
-	if (__nand_correct_data(buffer, ecc, oob->ecc2, SM_SMALL_PAGE,
-				IS_ENABLED(CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC)) < 0)
+	ecc_sw_hamming_calculate(buffer, SM_SMALL_PAGE, ecc, sm_order);
+	if (ecc_sw_hamming_correct(buffer, ecc, oob->ecc2, SM_SMALL_PAGE,
+				   sm_order) < 0)
 		return -EIO;
 	return 0;
 }
@@ -369,6 +368,7 @@ static int sm_write_block(struct sm_ftl *ftl, uint8_t *buf,
 			  int zone, int block, int lba,
 			  unsigned long invalid_bitmap)
 {
+	bool sm_order = IS_ENABLED(CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC);
 	struct sm_oob oob;
 	int boffset;
 	int retry = 0;
@@ -395,13 +395,13 @@ static int sm_write_block(struct sm_ftl *ftl, uint8_t *buf,
 		}
 
 		if (ftl->smallpagenand) {
-			__nand_calculate_ecc(buf + boffset, SM_SMALL_PAGE,
-					oob.ecc1,
-					IS_ENABLED(CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC));
+			ecc_sw_hamming_calculate(buf + boffset,
+						 SM_SMALL_PAGE, oob.ecc1,
+						 sm_order);
 
-			__nand_calculate_ecc(buf + boffset + SM_SMALL_PAGE,
-					SM_SMALL_PAGE, oob.ecc2,
-					IS_ENABLED(CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC));
+			ecc_sw_hamming_calculate(buf + boffset + SM_SMALL_PAGE,
+						 SM_SMALL_PAGE, oob.ecc2,
+						 sm_order);
 		}
 		if (!sm_write_sector(ftl, zone, block, boffset,
 							buf + boffset, &oob))
diff --git a/drivers/mtd/tests/mtd_nandecctest.c b/drivers/mtd/tests/mtd_nandecctest.c
index e92e3fb287b6..c4f271314f52 100644
--- a/drivers/mtd/tests/mtd_nandecctest.c
+++ b/drivers/mtd/tests/mtd_nandecctest.c
@@ -119,13 +119,13 @@ static void no_bit_error(void *error_data, void *error_ecc,
 static int no_bit_error_verify(void *error_data, void *error_ecc,
 				void *correct_data, const size_t size)
 {
+	bool sm_order = IS_ENABLED(CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC);
 	unsigned char calc_ecc[3];
 	int ret;
 
-	__nand_calculate_ecc(error_data, size, calc_ecc,
-			     IS_ENABLED(CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC));
-	ret = __nand_correct_data(error_data, error_ecc, calc_ecc, size,
-				  IS_ENABLED(CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC));
+	ecc_sw_hamming_calculate(error_data, size, calc_ecc, sm_order);
+	ret = ecc_sw_hamming_correct(error_data, error_ecc, calc_ecc, size,
+				     sm_order);
 	if (ret == 0 && !memcmp(correct_data, error_data, size))
 		return 0;
 
@@ -149,13 +149,13 @@ static void single_bit_error_in_ecc(void *error_data, void *error_ecc,
 static int single_bit_error_correct(void *error_data, void *error_ecc,
 				void *correct_data, const size_t size)
 {
+	bool sm_order = IS_ENABLED(CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC);
 	unsigned char calc_ecc[3];
 	int ret;
 
-	__nand_calculate_ecc(error_data, size, calc_ecc,
-			     IS_ENABLED(CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC));
-	ret = __nand_correct_data(error_data, error_ecc, calc_ecc, size,
-				  IS_ENABLED(CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC));
+	ecc_sw_hamming_calculate(error_data, size, calc_ecc, sm_order);
+	ret = ecc_sw_hamming_correct(error_data, error_ecc, calc_ecc, size,
+				     sm_order);
 	if (ret == 1 && !memcmp(correct_data, error_data, size))
 		return 0;
 
@@ -186,13 +186,13 @@ static void double_bit_error_in_ecc(void *error_data, void *error_ecc,
 static int double_bit_error_detect(void *error_data, void *error_ecc,
 				void *correct_data, const size_t size)
 {
+	bool sm_order = IS_ENABLED(CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC);
 	unsigned char calc_ecc[3];
 	int ret;
 
-	__nand_calculate_ecc(error_data, size, calc_ecc,
-			     IS_ENABLED(CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC));
-	ret = __nand_correct_data(error_data, error_ecc, calc_ecc, size,
-				  IS_ENABLED(CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC));
+	ecc_sw_hamming_calculate(error_data, size, calc_ecc, sm_order);
+	ret = ecc_sw_hamming_correct(error_data, error_ecc, calc_ecc, size,
+				     sm_order);
 
 	return (ret == -EBADMSG) ? 0 : -EINVAL;
 }
@@ -248,6 +248,7 @@ static void dump_data_ecc(void *error_data, void *error_ecc, void *correct_data,
 
 static int nand_ecc_test_run(const size_t size)
 {
+	bool sm_order = IS_ENABLED(CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC);
 	int i;
 	int err = 0;
 	void *error_data;
@@ -266,9 +267,7 @@ static int nand_ecc_test_run(const size_t size)
 	}
 
 	prandom_bytes(correct_data, size);
-	__nand_calculate_ecc(correct_data, size, correct_ecc,
-			     IS_ENABLED(CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC));
-
+	ecc_sw_hamming_calculate(correct_data, size, correct_ecc, sm_order);
 	for (i = 0; i < ARRAY_SIZE(nand_ecc_test); i++) {
 		nand_ecc_test[i].prepare(error_data, error_ecc,
 				correct_data, correct_ecc, size);
diff --git a/include/linux/mtd/nand-ecc-sw-hamming.h b/include/linux/mtd/nand-ecc-sw-hamming.h
index 85e9a929b5f9..84a123bf45f3 100644
--- a/include/linux/mtd/nand-ecc-sw-hamming.h
+++ b/include/linux/mtd/nand-ecc-sw-hamming.h
@@ -10,30 +10,18 @@
 #ifndef __MTD_NAND_ECC_SW_HAMMING_H__
 #define __MTD_NAND_ECC_SW_HAMMING_H__
 
-struct nand_chip;
-
-/*
- * Calculate 3 byte ECC code for eccsize byte block
- */
-void __nand_calculate_ecc(const u_char *dat, unsigned int eccsize,
-			  u_char *ecc_code, bool sm_order);
-
-/*
- * Calculate 3 byte ECC code for 256/512 byte block
- */
-int nand_calculate_ecc(struct nand_chip *chip, const u_char *dat,
-		       u_char *ecc_code);
-
-/*
- * Detect and correct a 1 bit error for eccsize byte block
- */
-int __nand_correct_data(u_char *dat, u_char *read_ecc, u_char *calc_ecc,
-			unsigned int eccsize, bool sm_order);
-
-/*
- * Detect and correct a 1 bit error for 256/512 byte block
- */
-int nand_correct_data(struct nand_chip *chip, u_char *dat, u_char *read_ecc,
-		      u_char *calc_ecc);
+#include <linux/mtd/nand.h>
+
+int ecc_sw_hamming_calculate(const unsigned char *buf, unsigned int step_size,
+			     unsigned char *code, bool sm_order);
+int nand_ecc_sw_hamming_calculate(struct nand_device *nand,
+				  const unsigned char *buf,
+				  unsigned char *code);
+int ecc_sw_hamming_correct(unsigned char *buf, unsigned char *read_ecc,
+			   unsigned char *calc_ecc, unsigned int step_size,
+			   bool sm_order);
+int nand_ecc_sw_hamming_correct(struct nand_device *nand, unsigned char *buf,
+				unsigned char *read_ecc,
+				unsigned char *calc_ecc);
 
 #endif /* __MTD_NAND_ECC_SW_HAMMING_H__ */
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 15743c2c2cab..685d24557e95 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1301,6 +1301,13 @@ static inline int nand_opcode_8bits(unsigned int command)
 	return 0;
 }
 
+int rawnand_sw_hamming_calculate(struct nand_chip *chip,
+				 const unsigned char *buf,
+				 unsigned char *code);
+int rawnand_sw_hamming_correct(struct nand_chip *chip,
+			       unsigned char *buf,
+			       unsigned char *read_ecc,
+			       unsigned char *calc_ecc);
 int rawnand_sw_bch_init(struct nand_chip *chip);
 int rawnand_sw_bch_correct(struct nand_chip *chip, unsigned char *buf,
 			   unsigned char *read_ecc, unsigned char *calc_ecc);
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
