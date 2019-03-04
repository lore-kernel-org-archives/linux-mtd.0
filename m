Return-Path: <SRS0=RlT6=RH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E0A9C43381
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 22:48:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD5952070B
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 22:48:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oCVlN7eN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="l7G2nqu5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD5952070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NCNWrwOPjY6LKNU6xbdkZez+SVISNC9u67U9NBsRfwI=; b=oCVlN7eNDTzC8A
	E/+fxKBXisMZVL47knnsNZUZ+0xK8c8hY0iSxYykC+6OXeLwXsHg/cn2tSU9zYAcAb+0U/MrcMB6p
	l2wM2mqgmJXS5VXgQzRwLmYeM94lJ7L+R2qPYhMUwZMYg4ZzflD12CVt75+5Gc2Exed4VGIu4jT59
	cmgHe1fGdjXN9IsmR/8EdaeTPEJCqa3qqH2CC1dks2wqzV0f034HgRKrHKxNsZEzx45cbXubKn65N
	ywTylD2qFK0dDB6nv5DSC4Lj9AZY2vYz6pYOkbSYOIHEdQhjYVD+MaA4wfuJ/CB24ZbXz2O6ABoo7
	4g4YTzD5bcPcLPcUwvEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0wNV-0001hE-A4; Mon, 04 Mar 2019 22:48:09 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0wMd-0000N8-GK; Mon, 04 Mar 2019 22:47:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8KmkUum59517mTPgu526fE/bFax6hT2Ov9Oo+ZzpsEo=; b=l7G2nqu5kPoWe5pnLpaVZotO7T
 0+0dKwJon0wj9sWS+cs1w+K03H+qn09qsrj+FEe+8I/PWsdR2u14jV3HghvEfTuZHCVpQ299kAgtn
 5aH8cIiVkYht3WOU+AOPfnZfvb0mSEA5kF6EaBPlBKquf74RL/vFmIyJwJLNHRzYPL0GsOO5w83cB
 0BM52MpLl80J2FY6h8Dgy6t5RMWS4vou0XTBTW9QFEVzmqaU8EtRxZNgxzet3PQGpbkCkMl3SUDT9
 p2DFCr95rRAjYfvQ+ffY5GG9dr0I5Q9afTCL0qwEk6Qn/PL2H09ek5JoPDfIPCqjYdUDx1z0VUVLF
 jbODzFMw==;
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0w6x-000377-5K; Mon, 04 Mar 2019 22:31:06 +0000
X-Originating-IP: 90.5.42.199
Received: from localhost.localdomain
 (atoulouse-657-1-1088-199.w90-5.abo.wanadoo.fr [90.5.42.199])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 6A6E5240004;
 Mon,  4 Mar 2019 22:30:37 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Subject: [PATCH v2 21/36] mtd: nand: ecc: Turn the software Hamming
 implementation generic
Date: Mon,  4 Mar 2019 23:28:26 +0100
Message-Id: <20190304222841.13899-22-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190304222841.13899-1-miquel.raynal@bootlin.com>
References: <20190304222841.13899-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_223103_259268_4E9957A1 
X-CRM114-Status: GOOD (  30.64  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh R <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Julien Su <juliensu@mxic.com.tw>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Paul Cercueil <paul@crapouillou.net>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add helpers in the raw NAND core to call the generic functions that
will be re-used by the SPI-NAND layer.

While at it, do some cleanup in the file and its header.

There are two drivers (not even raw NAND controller drivers) using the
bare helpers ecc_sw_hamming_calculate/correct():
mtd_nandecctest.c and sm_ftl.c. It would be nice to find another way
to call these functions and finish to clean the driver.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/ecc/sw-hamming.c       | 121 +++++++++++-------------
 drivers/mtd/nand/raw/cs553x_nand.c      |   3 +-
 drivers/mtd/nand/raw/fsmc_nand.c        |   2 +-
 drivers/mtd/nand/raw/lpc32xx_slc.c      |   2 +-
 drivers/mtd/nand/raw/nand_base.c        |  88 ++++++++++++++++-
 drivers/mtd/nand/raw/ndfc.c             |   3 +-
 drivers/mtd/nand/raw/sharpsl.c          |   2 +-
 drivers/mtd/nand/raw/tmio_nand.c        |   6 +-
 drivers/mtd/nand/raw/txx9ndfmc.c        |   4 +-
 drivers/mtd/sm_ftl.c                    |  28 +++---
 drivers/mtd/tests/mtd_nandecctest.c     |  29 +++---
 include/linux/mtd/nand-ecc-sw-hamming.h |  50 +++++-----
 include/linux/mtd/rawnand.h             |   9 ++
 13 files changed, 211 insertions(+), 136 deletions(-)

diff --git a/drivers/mtd/nand/ecc/sw-hamming.c b/drivers/mtd/nand/ecc/sw-hamming.c
index ba84f5ebbc37..816e5ea816c2 100644
--- a/drivers/mtd/nand/ecc/sw-hamming.c
+++ b/drivers/mtd/nand/ecc/sw-hamming.c
@@ -17,8 +17,6 @@
 #include <linux/types.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/mtd/mtd.h>
-#include <linux/mtd/rawnand.h>
 #include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <asm/byteorder.h>
 
@@ -75,7 +73,7 @@ static const char bitsperbyte[256] = {
  * addressbits is a lookup table to filter out the bits from the xor-ed
  * ECC data that identify the faulty location.
  * this is only used for repairing parity
- * see the comments in nand_correct_data for more details
+ * see the comments in nand_ecc_sw_hamming_correct for more details
  */
 static const char addressbits[256] = {
 	0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01,
@@ -112,30 +110,23 @@ static const char addressbits[256] = {
 	0x0e, 0x0e, 0x0f, 0x0f, 0x0e, 0x0e, 0x0f, 0x0f
 };
 
-/**
- * __nand_calculate_ecc - [NAND Interface] Calculate 3-byte ECC for 256/512-byte
- *			 block
- * @buf:	input buffer with raw data
- * @eccsize:	data bytes per ECC step (256 or 512)
- * @code:	output buffer with ECC
- * @sm_order:	Smart Media byte ordering
- */
-void __nand_calculate_ecc(const unsigned char *buf, unsigned int eccsize,
-			  unsigned char *code, bool sm_order)
+int ecc_sw_hamming_calculate(const unsigned char *buf, unsigned int step_size,
+			     unsigned char *code, bool sm_order)
 {
-	int i;
-	const uint32_t *bp = (uint32_t *)buf;
-	/* 256 or 512 bytes/ecc  */
-	const uint32_t eccsize_mult = eccsize >> 8;
-	uint32_t cur;		/* current value in buffer */
+	const u32 *bp = (uint32_t *)buf;
+	const u32 eccsize_mult = step_size >> 8;
+	/* current value in buffer */
+	u32 cur;
 	/* rp0..rp15..rp17 are the various accumulated parities (per byte) */
-	uint32_t rp0, rp1, rp2, rp3, rp4, rp5, rp6, rp7;
-	uint32_t rp8, rp9, rp10, rp11, rp12, rp13, rp14, rp15, rp16;
-	uint32_t uninitialized_var(rp17);	/* to make compiler happy */
-	uint32_t par;		/* the cumulative parity for all data */
-	uint32_t tmppar;	/* the cumulative parity for this iteration;
-				   for rp12, rp14 and rp16 at the end of the
-				   loop */
+	u32 rp0, rp1, rp2, rp3, rp4, rp5, rp6, rp7;
+	u32 rp8, rp9, rp10, rp11, rp12, rp13, rp14, rp15, rp16;
+	/* Make the compiler happy */
+	u32 uninitialized_var(rp17);
+	/* Cumulative parity for all data */
+	u32 par;
+	/* Cumulative parity at the end of the loop (rp12, rp14, rp16) */
+	u32 tmppar;
+	int i;
 
 	par = 0;
 	rp4 = 0;
@@ -356,45 +347,36 @@ void __nand_calculate_ecc(const unsigned char *buf, unsigned int eccsize,
 		    (invparity[par & 0x55] << 2) |
 		    (invparity[rp17] << 1) |
 		    (invparity[rp16] << 0);
-}
-EXPORT_SYMBOL(__nand_calculate_ecc);
-
-/**
- * nand_calculate_ecc - [NAND Interface] Calculate 3-byte ECC for 256/512-byte
- *			 block
- * @chip:	NAND chip object
- * @buf:	input buffer with raw data
- * @code:	output buffer with ECC
- */
-int nand_calculate_ecc(struct nand_chip *chip, const unsigned char *buf,
-		       unsigned char *code)
-{
-	bool sm_order = chip->ecc.options & NAND_ECC_SOFT_HAMMING_SM_ORDER;
-
-	__nand_calculate_ecc(buf, chip->ecc.size, code, sm_order);
 
 	return 0;
 }
-EXPORT_SYMBOL(nand_calculate_ecc);
+EXPORT_SYMBOL(ecc_sw_hamming_calculate);
 
 /**
- * __nand_correct_data - [NAND Interface] Detect and correct bit error(s)
- * @buf:	raw data read from the chip
- * @read_ecc:	ECC from the chip
- * @calc_ecc:	the ECC calculated from raw data
- * @eccsize:	data bytes per ECC step (256 or 512)
- * @sm_order:	Smart Media byte order
+ * nand_ecc_sw_hamming_calculate - Calculate 3-byte ECC for 256/512-byte block
  *
- * Detect and correct a 1 bit error for eccsize byte block
+ * @nand: NAND device
+ * @buf: Input buffer with raw data
+ * @code: Output buffer with ECC
  */
-int __nand_correct_data(unsigned char *buf,
-			unsigned char *read_ecc, unsigned char *calc_ecc,
-			unsigned int eccsize, bool sm_order)
+int nand_ecc_sw_hamming_calculate(struct nand_device *nand,
+				  const unsigned char *buf, unsigned char *code)
 {
+	struct nand_ecc_sw_hamming_conf *engine_conf = nand->ecc.ctx.priv;
+	unsigned int step_size = nand->ecc.ctx.conf.step_size;
+
+	return ecc_sw_hamming_calculate(buf, step_size, code,
+					engine_conf->sm_order);
+}
+EXPORT_SYMBOL(nand_ecc_sw_hamming_calculate);
+
+int ecc_sw_hamming_correct(unsigned char *buf, unsigned char *read_ecc,
+			   unsigned char *calc_ecc, unsigned int step_size,
+			   bool sm_order)
+{
+	const u32 eccsize_mult = step_size >> 8;
 	unsigned char b0, b1, b2, bit_addr;
 	unsigned int byte_addr;
-	/* 256 or 512 bytes/ecc  */
-	const uint32_t eccsize_mult = eccsize >> 8;
 
 	/*
 	 * b0 to b2 indicate which bit is faulty (if any)
@@ -458,27 +440,30 @@ int __nand_correct_data(unsigned char *buf,
 	pr_err("%s: uncorrectable ECC error\n", __func__);
 	return -EBADMSG;
 }
-EXPORT_SYMBOL(__nand_correct_data);
+EXPORT_SYMBOL(ecc_sw_hamming_correct);
 
 /**
- * nand_correct_data - [NAND Interface] Detect and correct bit error(s)
- * @chip:	NAND chip object
- * @buf:	raw data read from the chip
- * @read_ecc:	ECC from the chip
- * @calc_ecc:	the ECC calculated from raw data
+ * nand_ecc_sw_hamming_correct - Detect and correct bit error(s)
  *
- * Detect and correct a 1 bit error for 256/512 byte block
+ * @nand: NAND device
+ * @buf: Raw data read from the chip
+ * @read_ecc: ECC bytes read from the chip
+ * @calc_ecc: ECC calculated from the raw data
+ *
+ * Detect and correct up to 1 bit error per 256/512-byte block.
  */
-int nand_correct_data(struct nand_chip *chip, unsigned char *buf,
-		      unsigned char *read_ecc, unsigned char *calc_ecc)
+int nand_ecc_sw_hamming_correct(struct nand_device *nand, unsigned char *buf,
+				unsigned char *read_ecc,
+				unsigned char *calc_ecc)
 {
-	bool sm_order = chip->ecc.options & NAND_ECC_SOFT_HAMMING_SM_ORDER;
+	struct nand_ecc_sw_hamming_conf *engine_conf = nand->ecc.ctx.priv;
+	unsigned int step_size = nand->ecc.ctx.conf.step_size;
 
-	return __nand_correct_data(buf, read_ecc, calc_ecc, chip->ecc.size,
-				   sm_order);
+	return ecc_sw_hamming_correct(buf, read_ecc, calc_ecc, step_size,
+				      engine_conf->sm_order);
 }
-EXPORT_SYMBOL(nand_correct_data);
+EXPORT_SYMBOL(nand_ecc_sw_hamming_correct);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Frans Meulenbroeks <fransmeulenbroeks@gmail.com>");
-MODULE_DESCRIPTION("Generic NAND ECC support");
+MODULE_DESCRIPTION("NAND software Hamming ECC support");
diff --git a/drivers/mtd/nand/raw/cs553x_nand.c b/drivers/mtd/nand/raw/cs553x_nand.c
index 98cc55df27b1..3fbff2a5dab1 100644
--- a/drivers/mtd/nand/raw/cs553x_nand.c
+++ b/drivers/mtd/nand/raw/cs553x_nand.c
@@ -23,7 +23,6 @@
 #include <linux/delay.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 
 #include <asm/msr.h>
@@ -219,7 +218,7 @@ static int __init cs553x_init_one(int cs, int mmio, unsigned long adr)
 	this->ecc.bytes = 3;
 	this->ecc.hwctl  = cs_enable_hwecc;
 	this->ecc.calculate = cs_calculate_ecc;
-	this->ecc.correct  = nand_correct_data;
+	this->ecc.correct  = rawnand_sw_hamming_correct;
 	this->ecc.strength = 1;
 
 	/* Enable the following for a flash based bad block table */
diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index e1bd8b7a0bf5..0e0585bec837 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -936,7 +936,7 @@ static int fsmc_nand_attach_chip(struct nand_chip *nand)
 	case NAND_ECC_HW:
 		dev_info(host->dev, "Using 1-bit HW ECC scheme\n");
 		nand->ecc.calculate = fsmc_read_hwecc_ecc1;
-		nand->ecc.correct = nand_correct_data;
+		nand->ecc.correct = rawnand_sw_hamming_correct;
 		nand->ecc.bytes = 3;
 		nand->ecc.strength = 1;
 		nand->ecc.options |= NAND_ECC_SOFT_HAMMING_SM_ORDER;
diff --git a/drivers/mtd/nand/raw/lpc32xx_slc.c b/drivers/mtd/nand/raw/lpc32xx_slc.c
index eabd1fd9d2de..8b000c783ba6 100644
--- a/drivers/mtd/nand/raw/lpc32xx_slc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_slc.c
@@ -901,7 +901,7 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	chip->ecc.write_oob = lpc32xx_nand_write_oob_syndrome;
 	chip->ecc.read_oob = lpc32xx_nand_read_oob_syndrome;
 	chip->ecc.calculate = lpc32xx_nand_ecc_calculate;
-	chip->ecc.correct = nand_correct_data;
+	chip->ecc.correct = rawnand_sw_hamming_correct;
 	chip->ecc.strength = 1;
 	chip->ecc.hwctl = lpc32xx_nand_ecc_enable;
 
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 4d7877408b82..6b0050b907ba 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -4847,6 +4847,75 @@ static void nand_scan_ident_cleanup(struct nand_chip *chip)
 	kfree(chip->parameters.onfi);
 }
 
+int rawnand_sw_hamming_init(struct nand_chip *chip)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct nand_ecc_sw_hamming_conf *engine_conf;
+	struct nand_device *base = &chip->base;
+
+	base->ecc.user_conf.provider = NAND_ECC_SOFT;
+	base->ecc.user_conf.algo = NAND_ECC_HAMMING;
+	base->ecc.user_conf.strength = chip->ecc.strength;
+	base->ecc.user_conf.step_size = chip->ecc.size;
+
+	if (base->ecc.user_conf.strength != 1 ||
+	    (base->ecc.user_conf.step_size != 256 &&
+	     base->ecc.user_conf.step_size != 512)) {
+		pr_err("%s: unsupported strength or step size\n", __func__);
+		return -EINVAL;
+	}
+
+	engine_conf = kzalloc(sizeof(*engine_conf), GFP_KERNEL);
+	if (!engine_conf)
+		return -ENOMEM;
+
+	engine_conf->code_size = 3;
+	engine_conf->nsteps = mtd->writesize / base->ecc.user_conf.step_size;
+
+	if (chip->ecc.options & NAND_ECC_SOFT_HAMMING_SM_ORDER)
+		engine_conf->sm_order = true;
+
+	base->ecc.ctx.priv = engine_conf;
+
+	chip->ecc.size = base->ecc.ctx.conf.step_size;
+	chip->ecc.strength = base->ecc.ctx.conf.strength;
+	chip->ecc.total = base->ecc.ctx.total;
+	chip->ecc.steps = engine_conf->nsteps;
+	chip->ecc.bytes = engine_conf->code_size;
+
+	return 0;
+}
+EXPORT_SYMBOL(rawnand_sw_hamming_init);
+
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
+void rawnand_sw_hamming_cleanup(struct nand_chip *chip)
+{
+	struct nand_device *base = &chip->base;
+
+	kfree(base->ecc.ctx.priv);
+}
+EXPORT_SYMBOL(rawnand_sw_hamming_cleanup);
+
 int rawnand_sw_bch_init(struct nand_chip *chip)
 {
 	struct nand_device *base = &chip->base;
@@ -4920,8 +4989,8 @@ static int nand_set_ecc_soft_ops(struct nand_chip *chip)
 
 	switch (ecc->algo) {
 	case NAND_ECC_HAMMING:
-		ecc->calculate = nand_calculate_ecc;
-		ecc->correct = nand_correct_data;
+		ecc->calculate = rawnand_sw_hamming_calculate;
+		ecc->correct = rawnand_sw_hamming_correct;
 		ecc->read_page = nand_read_page_swecc;
 		ecc->read_subpage = nand_read_subpage;
 		ecc->write_page = nand_write_page_swecc;
@@ -4937,6 +5006,12 @@ static int nand_set_ecc_soft_ops(struct nand_chip *chip)
 		if (IS_ENABLED(CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC))
 			ecc->options |= NAND_ECC_SOFT_HAMMING_SM_ORDER;
 
+		ret = rawnand_sw_hamming_init(chip);
+		if (ret) {
+			WARN(1, "Hamming ECC initialization failed!\n");
+			return ret;
+		}
+
 		return 0;
 	case NAND_ECC_BCH:
 		if (!IS_ENABLED(CONFIG_MTD_NAND_ECC_SW_BCH)) {
@@ -5707,9 +5782,12 @@ EXPORT_SYMBOL(nand_scan_with_ids);
  */
 void nand_cleanup(struct nand_chip *chip)
 {
-	if (chip->ecc.mode == NAND_ECC_SOFT &&
-	    chip->ecc.algo == NAND_ECC_BCH)
-		rawnand_sw_bch_cleanup(chip);
+	if (chip->ecc.mode == NAND_ECC_SOFT) {
+		if (chip->ecc.algo == NAND_ECC_HAMMING)
+			rawnand_sw_hamming_cleanup(chip);
+		else if (chip->ecc.algo == NAND_ECC_BCH)
+			rawnand_sw_bch_cleanup(chip);
+	}
 
 	/* Free bad block table memory */
 	kfree(chip->bbt);
diff --git a/drivers/mtd/nand/raw/ndfc.c b/drivers/mtd/nand/raw/ndfc.c
index 0d79bbe89a4f..e92079dc1a47 100644
--- a/drivers/mtd/nand/raw/ndfc.c
+++ b/drivers/mtd/nand/raw/ndfc.c
@@ -23,7 +23,6 @@
  */
 #include <linux/module.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/ndfc.h>
 #include <linux/slab.h>
@@ -151,7 +150,7 @@ static int ndfc_chip_init(struct ndfc_controller *ndfc,
 	chip->controller = &ndfc->ndfc_control;
 	chip->legacy.read_buf = ndfc_read_buf;
 	chip->legacy.write_buf = ndfc_write_buf;
-	chip->ecc.correct = nand_correct_data;
+	chip->ecc.correct = ecc_sw_hamming_correct;
 	chip->ecc.hwctl = ndfc_enable_hwecc;
 	chip->ecc.calculate = ndfc_calculate_ecc;
 	chip->ecc.mode = NAND_ECC_HW;
diff --git a/drivers/mtd/nand/raw/sharpsl.c b/drivers/mtd/nand/raw/sharpsl.c
index c352fd040ead..31786044ba3c 100644
--- a/drivers/mtd/nand/raw/sharpsl.c
+++ b/drivers/mtd/nand/raw/sharpsl.c
@@ -168,7 +168,7 @@ static int sharpsl_nand_probe(struct platform_device *pdev)
 	this->badblock_pattern = data->badblock_pattern;
 	this->ecc.hwctl = sharpsl_nand_enable_hwecc;
 	this->ecc.calculate = sharpsl_nand_calculate_ecc;
-	this->ecc.correct = nand_correct_data;
+	this->ecc.correct = rawnand_sw_hamming_correct;
 
 	/* Scan to find existence of the device */
 	err = nand_scan(this, 1);
diff --git a/drivers/mtd/nand/raw/tmio_nand.c b/drivers/mtd/nand/raw/tmio_nand.c
index 7422fea7777c..efee3c3acd12 100644
--- a/drivers/mtd/nand/raw/tmio_nand.c
+++ b/drivers/mtd/nand/raw/tmio_nand.c
@@ -295,11 +295,11 @@ static int tmio_nand_correct_data(struct nand_chip *chip, unsigned char *buf,
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
index d264b3588ac4..4174d0012f0f 100644
--- a/drivers/mtd/nand/raw/txx9ndfmc.c
+++ b/drivers/mtd/nand/raw/txx9ndfmc.c
@@ -198,8 +198,8 @@ static int txx9ndfmc_correct_data(struct nand_chip *chip, unsigned char *buf,
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
index e48114739668..1fbe4823071b 100644
--- a/drivers/mtd/sm_ftl.c
+++ b/drivers/mtd/sm_ftl.c
@@ -219,20 +219,19 @@ static void sm_break_offset(struct sm_ftl *ftl, loff_t loffset,
 
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
@@ -371,6 +370,7 @@ static int sm_write_block(struct sm_ftl *ftl, uint8_t *buf,
 			  int zone, int block, int lba,
 			  unsigned long invalid_bitmap)
 {
+	bool sm_order = IS_ENABLED(CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC);
 	struct sm_oob oob;
 	int boffset;
 	int retry = 0;
@@ -397,13 +397,13 @@ static int sm_write_block(struct sm_ftl *ftl, uint8_t *buf,
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
index 49824d2ae11a..755a5f2bdb11 100644
--- a/drivers/mtd/tests/mtd_nandecctest.c
+++ b/drivers/mtd/tests/mtd_nandecctest.c
@@ -118,13 +118,13 @@ static void no_bit_error(void *error_data, void *error_ecc,
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
 
@@ -148,13 +148,13 @@ static void single_bit_error_in_ecc(void *error_data, void *error_ecc,
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
 
@@ -185,13 +185,13 @@ static void double_bit_error_in_ecc(void *error_data, void *error_ecc,
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
@@ -247,6 +247,7 @@ static void dump_data_ecc(void *error_data, void *error_ecc, void *correct_data,
 
 static int nand_ecc_test_run(const size_t size)
 {
+	bool sm_order = IS_ENABLED(CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC);
 	int i;
 	int err = 0;
 	void *error_data;
@@ -265,9 +266,7 @@ static int nand_ecc_test_run(const size_t size)
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
index 4ce99fa574e3..f2d28e5d1888 100644
--- a/include/linux/mtd/nand-ecc-sw-hamming.h
+++ b/include/linux/mtd/nand-ecc-sw-hamming.h
@@ -10,30 +10,36 @@
 #ifndef __MTD_NAND_ECC_SW_HAMMING_H__
 #define __MTD_NAND_ECC_SW_HAMMING_H__
 
-struct nand_chip;
+#include <linux/mtd/nand.h>
 
-/*
- * Calculate 3 byte ECC code for eccsize byte block
+/**
+ * struct nand_ecc_sw_hamming_conf - private software Hamming ECC engine structure
+ * @reqooblen: Save the actual user OOB length requested before overwriting it
+ * @code_size: Number of bytes needed to store a code (one code per step)
+ * @nsteps: Number of steps
+ * @calc_buf: Buffer to use when calculating ECC bytes
+ * @code_buf: Buffer to use when reading (raw) ECC bytes from the chip
+ * @sm_order: Smart Media special ordering
  */
-void __nand_calculate_ecc(const u_char *dat, unsigned int eccsize,
-			  u_char *ecc_code, bool sm_order);
+struct nand_ecc_sw_hamming_conf {
+	unsigned int reqooblen;
+	unsigned int code_size;
+	unsigned int nsteps;
+	u8 *calc_buf;
+	u8 *code_buf;
+	unsigned int sm_order;
+};
 
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
index b0c6e1ac3989..1999f8ffb24f 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1230,6 +1230,15 @@ static inline int nand_opcode_8bits(unsigned int command)
 	return 0;
 }
 
+int rawnand_sw_hamming_init(struct nand_chip *chip);
+int rawnand_sw_hamming_calculate(struct nand_chip *chip,
+				 const unsigned char *buf,
+				 unsigned char *code);
+int rawnand_sw_hamming_correct(struct nand_chip *chip,
+			       unsigned char *buf,
+			       unsigned char *read_ecc,
+			       unsigned char *calc_ecc);
+void rawnand_sw_hamming_cleanup(struct nand_chip *chip);
 int rawnand_sw_bch_init(struct nand_chip *chip);
 int rawnand_sw_bch_correct(struct nand_chip *chip, unsigned char *buf,
 			   unsigned char *read_ecc, unsigned char *calc_ecc);
-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
