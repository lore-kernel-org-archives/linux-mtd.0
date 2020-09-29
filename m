Return-Path: <SRS0=p2FF=DG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA74FC4727C
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 23:02:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4410620897
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 23:02:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CmL23lsV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4410620897
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6oWJ/BhfF4VdeAEzVUJ8xdXQpXh+rEKh5r1hlvIxQVU=; b=CmL23lsV+qx0FDxwXTJ57zn+p
	0aTrD96j4rIUpDYRLMGyU9afubAsum+0xwlAS4H0iWsJ8prORuS3Rvsd9iwhnEVoZObBoEpIHtJvE
	HpZJ4QIBY/CABoSim0x3zPv6Kfn9dcgyswOIelRdCArBUXi1wzFuYJs+HowandLjtaCqd49F1bWnT
	ehXyLRPGRys4sIvwoiKRH8BrzPNPGTK6invN4zACJEZMRLT6VWTyEEHyk7X30+wOffxCMrBaDZMA1
	h6sklscTFsfMCNVmwlPOZqBBxO8slytpnBWZVAuOrsx7qpxGfaG/1/9fhrDYxQfUB3PAok27W1tmM
	dro33tNdA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNOdM-0001MG-Q9; Tue, 29 Sep 2020 23:02:08 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNOcr-0001Cn-W0
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2020 23:01:40 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 290D2200010;
 Tue, 29 Sep 2020 23:01:36 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 08/20] mtd: nand: ecc-bch: Stop using raw NAND structures
Date: Wed, 30 Sep 2020 01:01:12 +0200
Message-Id: <20200929230124.31491-9-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200929230124.31491-1-miquel.raynal@bootlin.com>
References: <20200929230124.31491-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_190138_304365_D01933CF 
X-CRM114-Status: GOOD (  27.50  )
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

This code is meant to be reused by the SPI-NAND core. Now that the
driver has been cleaned and reorganized, use a generic ECC engine
object to store the driver's data instead of accessing members of the
nand_chip structure.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/ecc-sw-bch.c       | 111 ++++++++++------------------
 drivers/mtd/nand/raw/nand_base.c    |  38 ++++++++--
 include/linux/mtd/nand-ecc-sw-bch.h |  25 +++++++
 3 files changed, 97 insertions(+), 77 deletions(-)

diff --git a/drivers/mtd/nand/ecc-sw-bch.c b/drivers/mtd/nand/ecc-sw-bch.c
index b9bdfcf46c6d..16a54bd2ca31 100644
--- a/drivers/mtd/nand/ecc-sw-bch.c
+++ b/drivers/mtd/nand/ecc-sw-bch.c
@@ -11,23 +11,8 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/bitops.h>
-#include <linux/mtd/mtd.h>
-#include <linux/mtd/rawnand.h>
 #include <linux/mtd/nand.h>
 #include <linux/mtd/nand-ecc-sw-bch.h>
-#include <linux/bch.h>
-
-/**
- * struct nand_bch_control - private NAND BCH control structure
- * @bch:       BCH control structure
- * @errloc:    error location array
- * @eccmask:   XOR ecc mask, allows erased pages to be decoded as valid
- */
-struct nand_bch_control {
-	struct bch_control   *bch;
-	unsigned int         *errloc;
-	unsigned char        *eccmask;
-};
 
 /**
  * nand_ecc_sw_bch_calculate - Calculate the ECC corresponding to a data block
@@ -38,16 +23,15 @@ struct nand_bch_control {
 int nand_ecc_sw_bch_calculate(struct nand_device *nand,
 			      const unsigned char *buf, unsigned char *code)
 {
-	struct nand_chip *chip = mtd_to_nand(nanddev_to_mtd(nand));
-	struct nand_bch_control *nbc = chip->ecc.priv;
+	struct nand_ecc_sw_bch_conf *engine_conf = nand->ecc.ctx.priv;
 	unsigned int i;
 
-	memset(code, 0, chip->ecc.bytes);
-	bch_encode(nbc->bch, buf, chip->ecc.size, code);
+	memset(code, 0, engine_conf->code_size);
+	bch_encode(engine_conf->bch, buf, nand->ecc.ctx.conf.step_size, code);
 
 	/* apply mask so that an erased page is a valid codeword */
-	for (i = 0; i < chip->ecc.bytes; i++)
-		code[i] ^= nbc->eccmask[i];
+	for (i = 0; i < engine_conf->code_size; i++)
+		code[i] ^= engine_conf->eccmask[i];
 
 	return 0;
 }
@@ -65,16 +49,16 @@ EXPORT_SYMBOL(nand_ecc_sw_bch_calculate);
 int nand_ecc_sw_bch_correct(struct nand_device *nand, unsigned char *buf,
 			    unsigned char *read_ecc, unsigned char *calc_ecc)
 {
-	struct nand_chip *chip = mtd_to_nand(nanddev_to_mtd(nand));
-	struct nand_bch_control *nbc = chip->ecc.priv;
-	unsigned int *errloc = nbc->errloc;
+	struct nand_ecc_sw_bch_conf *engine_conf = nand->ecc.ctx.priv;
+	unsigned int step_size = nand->ecc.ctx.conf.step_size;
+	unsigned int *errloc = engine_conf->errloc;
 	int i, count;
 
-	count = bch_decode(nbc->bch, NULL, chip->ecc.size, read_ecc, calc_ecc,
-			   NULL, errloc);
+	count = bch_decode(engine_conf->bch, NULL, step_size, read_ecc,
+			   calc_ecc, NULL, errloc);
 	if (count > 0) {
 		for (i = 0; i < count; i++) {
-			if (errloc[i] < (chip->ecc.size * 8))
+			if (errloc[i] < (step_size * 8))
 				/* The error is in the data area: correct it */
 				buf[errloc[i] >> 3] ^= (1 << (errloc[i] & 7));
 
@@ -97,31 +81,30 @@ EXPORT_SYMBOL(nand_ecc_sw_bch_correct);
  *
  * Returns: a pointer to a new NAND BCH control structure, or NULL upon failure
  *
- * Initialize NAND BCH error correction. Parameters @eccsize and @eccbytes
- * are used to compute the following BCH parameters:
+ * Initialize NAND BCH error correction. @nand.ecc parameters 'step_size' and
+ * 'bytes' are used to compute the following BCH parameters:
  *     m, the Galois field order
  *     t, the error correction capability
- * @eccbytes should be equal to the number of bytes required to store m * t
+ * 'bytes' should be equal to the number of bytes required to store m * t
  * bits, where m is such that 2^m - 1 > step_size * 8.
  *
  * Example: to configure 4 bit correction per 512 bytes, you should pass
- * @eccsize = 512 (thus, m = 13 is the smallest integer such that 2^m - 1 > 512 * 8)
- * @eccbytes = 7 (7 bytes are required to store m * t = 13 * 4 = 52 bits)
+ * step_size = 512 (thus, m = 13 is the smallest integer such that 2^m - 1 > 512 * 8)
+ * bytes = 7 (7 bytes are required to store m * t = 13 * 4 = 52 bits)
  */
 int nand_ecc_sw_bch_init(struct nand_device *nand)
 {
 	struct mtd_info *mtd = nanddev_to_mtd(nand);
-	struct nand_chip *chip = mtd_to_nand(mtd);
 	unsigned int m, t, eccsteps, i;
-	struct nand_bch_control *nbc = NULL;
+	struct nand_ecc_sw_bch_conf *engine_conf = nand->ecc.ctx.priv;
 	unsigned char *erased_page;
-	unsigned int eccsize = chip->ecc.size;
-	unsigned int eccbytes = chip->ecc.bytes;
-	unsigned int eccstrength = chip->ecc.strength;
+	unsigned int eccsize = nand->ecc.ctx.conf.step_size;
+	unsigned int eccbytes = engine_conf->code_size;
+	unsigned int eccstrength = nand->ecc.ctx.conf.strength;
 
 	if (!eccbytes && eccstrength) {
 		eccbytes = DIV_ROUND_UP(eccstrength * fls(8 * eccsize), 8);
-		chip->ecc.bytes = eccbytes;
+		engine_conf->code_size = eccbytes;
 	}
 
 	if (!eccsize || !eccbytes) {
@@ -132,20 +115,14 @@ int nand_ecc_sw_bch_init(struct nand_device *nand)
 	m = fls(1+8*eccsize);
 	t = (eccbytes*8)/m;
 
-	nbc = kzalloc(sizeof(*nbc), GFP_KERNEL);
-	if (!nbc)
-		return -ENOMEM;
-
-	chip->ecc.priv = nbc;
-
-	nbc->bch = bch_init(m, t, 0, false);
-	if (!nbc->bch)
-		goto fail;
+	engine_conf->bch = bch_init(m, t, 0, false);
+	if (!engine_conf->bch)
+		return -EINVAL;
 
 	/* verify that eccbytes has the expected value */
-	if (nbc->bch->ecc_bytes != eccbytes) {
+	if (engine_conf->bch->ecc_bytes != eccbytes) {
 		pr_warn("invalid eccbytes %u, should be %u\n",
-			eccbytes, nbc->bch->ecc_bytes);
+			eccbytes, engine_conf->bch->ecc_bytes);
 		goto fail;
 	}
 
@@ -163,24 +140,15 @@ int nand_ecc_sw_bch_init(struct nand_device *nand)
 		goto fail;
 	}
 
-	/*
-	 * ecc->steps and ecc->total might be used by mtd->ooblayout->ecc(),
-	 * which is called by mtd_ooblayout_count_eccbytes().
-	 * Make sure they are properly initialized before calling
-	 * mtd_ooblayout_count_eccbytes().
-	 * FIXME: we should probably rework the sequencing in nand_scan_tail()
-	 * to avoid setting those fields twice.
-	 */
-	chip->ecc.steps = eccsteps;
-	chip->ecc.total = eccsteps * eccbytes;
 	if (mtd_ooblayout_count_eccbytes(mtd) != (eccsteps*eccbytes)) {
 		pr_warn("invalid ecc layout\n");
 		goto fail;
 	}
 
-	nbc->eccmask = kzalloc(eccbytes, GFP_KERNEL);
-	nbc->errloc = kmalloc_array(t, sizeof(*nbc->errloc), GFP_KERNEL);
-	if (!nbc->eccmask || !nbc->errloc)
+	engine_conf->eccmask = kzalloc(eccbytes, GFP_KERNEL);
+	engine_conf->errloc = kmalloc_array(t, sizeof(*engine_conf->errloc),
+					    GFP_KERNEL);
+	if (!engine_conf->eccmask || !engine_conf->errloc)
 		goto fail;
 
 	/*
@@ -191,14 +159,15 @@ int nand_ecc_sw_bch_init(struct nand_device *nand)
 		goto fail;
 
 	memset(erased_page, 0xff, eccsize);
-	bch_encode(nbc->bch, erased_page, eccsize, nbc->eccmask);
+	bch_encode(engine_conf->bch, erased_page, eccsize,
+		   engine_conf->eccmask);
 	kfree(erased_page);
 
 	for (i = 0; i < eccbytes; i++)
-		nbc->eccmask[i] ^= 0xff;
+		engine_conf->eccmask[i] ^= 0xff;
 
 	if (!eccstrength)
-		chip->ecc.strength = (eccbytes * 8) / fls(8 * eccsize);
+		nand->ecc.ctx.conf.strength = (eccbytes * 8) / fls(8 * eccsize);
 
 	return 0;
 
@@ -215,14 +184,12 @@ EXPORT_SYMBOL(nand_ecc_sw_bch_init);
  */
 void nand_ecc_sw_bch_cleanup(struct nand_device *nand)
 {
-	struct nand_chip *chip = mtd_to_nand(nanddev_to_mtd(nand));
-	struct nand_bch_control *nbc = chip->ecc.priv;
+	struct nand_ecc_sw_bch_conf *engine_conf = nand->ecc.ctx.priv;
 
-	if (nbc) {
-		bch_free(nbc->bch);
-		kfree(nbc->errloc);
-		kfree(nbc->eccmask);
-		kfree(nbc);
+	if (engine_conf) {
+		bch_free(engine_conf->bch);
+		kfree(engine_conf->errloc);
+		kfree(engine_conf->eccmask);
 	}
 }
 EXPORT_SYMBOL(nand_ecc_sw_bch_cleanup);
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 69bdbb1c3b60..6317bb656fbf 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5147,8 +5147,33 @@ static void nand_scan_ident_cleanup(struct nand_chip *chip)
 int rawnand_sw_bch_init(struct nand_chip *chip)
 {
 	struct nand_device *base = &chip->base;
+	struct nand_ecc_sw_bch_conf *engine_conf;
+	int ret;
 
-	return nand_ecc_sw_bch_init(base);
+	base->ecc.user_conf.engine_type = NAND_ECC_ENGINE_TYPE_SOFT;
+	base->ecc.user_conf.algo = NAND_ECC_ALGO_BCH;
+	base->ecc.user_conf.step_size = chip->ecc.size;
+	base->ecc.user_conf.strength = chip->ecc.strength;
+
+	engine_conf = kzalloc(sizeof(*engine_conf), GFP_KERNEL);
+	if (!engine_conf)
+		return -ENOMEM;
+
+	engine_conf->code_size = chip->ecc.bytes;
+
+	base->ecc.ctx.priv = engine_conf;
+
+	ret = nand_ecc_sw_bch_init(base);
+	if (ret)
+		kfree(base->ecc.ctx.priv);
+
+	chip->ecc.size = base->ecc.ctx.conf.step_size;
+	chip->ecc.strength = base->ecc.ctx.conf.strength;
+	chip->ecc.total = base->ecc.ctx.total;
+	chip->ecc.steps = engine_conf->nsteps;
+	chip->ecc.bytes = engine_conf->code_size;
+
+	return ret;
 }
 EXPORT_SYMBOL(rawnand_sw_bch_init);
 
@@ -5176,7 +5201,7 @@ void rawnand_sw_bch_cleanup(struct nand_chip *chip)
 
 	nand_ecc_sw_bch_cleanup(base);
 
-	chip->ecc.priv = NULL;
+	kfree(base->ecc.ctx.priv);
 }
 EXPORT_SYMBOL(rawnand_sw_bch_cleanup);
 
@@ -5799,15 +5824,18 @@ static int nand_scan_tail(struct nand_chip *chip)
 	 * Set the number of read / write steps for one page depending on ECC
 	 * mode.
 	 */
-	ecc->steps = mtd->writesize / ecc->size;
+	if (!ecc->steps)
+		ecc->steps = mtd->writesize / ecc->size;
 	if (ecc->steps * ecc->size != mtd->writesize) {
 		WARN(1, "Invalid ECC parameters\n");
 		ret = -EINVAL;
 		goto err_nand_manuf_cleanup;
 	}
 
-	ecc->total = ecc->steps * ecc->bytes;
-	chip->base.ecc.ctx.total = ecc->total;
+	if (!ecc->total) {
+		ecc->total = ecc->steps * ecc->bytes;
+		chip->base.ecc.ctx.total = ecc->total;
+	}
 
 	if (ecc->total > mtd->oobsize) {
 		WARN(1, "Total number of ECC bytes exceeded oobsize\n");
diff --git a/include/linux/mtd/nand-ecc-sw-bch.h b/include/linux/mtd/nand-ecc-sw-bch.h
index f0caee3b03d0..ce005528e55f 100644
--- a/include/linux/mtd/nand-ecc-sw-bch.h
+++ b/include/linux/mtd/nand-ecc-sw-bch.h
@@ -9,6 +9,31 @@
 #define __MTD_NAND_ECC_SW_BCH_H__
 
 #include <linux/mtd/nand.h>
+#include <linux/bch.h>
+
+/**
+ * struct nand_ecc_sw_bch_conf - private software BCH ECC engine structure
+ * @reqooblen: Save the actual user OOB length requested before overwriting it
+ * @spare_oobbuf: Spare OOB buffer if none is provided
+ * @code_size: Number of bytes needed to store a code (one code per step)
+ * @nsteps: Number of steps
+ * @calc_buf: Buffer to use when calculating ECC bytes
+ * @code_buf: Buffer to use when reading (raw) ECC bytes from the chip
+ * @bch: BCH control structure
+ * @errloc: error location array
+ * @eccmask: XOR ecc mask, allows erased pages to be decoded as valid
+ */
+struct nand_ecc_sw_bch_conf {
+	unsigned int reqooblen;
+	void *spare_oobbuf;
+	unsigned int code_size;
+	unsigned int nsteps;
+	u8 *calc_buf;
+	u8 *code_buf;
+	struct bch_control *bch;
+	unsigned int *errloc;
+	unsigned char *eccmask;
+};
 
 #if IS_ENABLED(CONFIG_MTD_NAND_ECC_SW_BCH)
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
