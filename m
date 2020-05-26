Return-Path: <SRS0=PBLV=7I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 603AFC433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 19:57:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D9A3207CB
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 19:57:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Em0IzMfM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D9A3207CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b2ZvCQ/oDNR1dMlesh7UedghHOnHaBTgooFOfH3TD60=; b=Em0IzMfMu8+p6J
	gn8vCUYdsTICNE7r1SGAqX5wlPj1fc2lEcCOZZ2uF9WJ04Hstah0vs2xOuybxWBEzDDEk598u8Kdq
	rU9HM+EVj1J1KbRwOZEEa1EKZjPJOW4f+4caatRBCgfHYQF9mjtX1CrN2b4jYnGz6AaZVbsbQzEVu
	7C/uzee0zMp8/RyAAFc4xiOrF+7eGYkcDfk5MQbpEVrMknJqhHnfckKWyW24+w46N2FZwdLNvUIFG
	3EiasoBzW/5kf171wJRoNwzBh2SQh+fG3ORR4f1r6iJlq9GwCm2eCYV4rwELgozURPD/9Db80vsjm
	jMJC8wj+bJC97jHoQa2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdfhk-0008JF-4b; Tue, 26 May 2020 19:57:40 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdfgn-0007PP-1W
 for linux-mtd@lists.infradead.org; Tue, 26 May 2020 19:56:43 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 9D27CC0005;
 Tue, 26 May 2020 19:56:38 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [RESEND v5 03/21] mtd: rawnand: Drop OOB_FIRST placement scheme
Date: Tue, 26 May 2020 21:56:15 +0200
Message-Id: <20200526195633.11543-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200526195633.11543-1-miquel.raynal@bootlin.com>
References: <20200526195633.11543-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200526_125641_375099_FB7409D1 
X-CRM114-Status: GOOD (  23.68  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This scheme has been introduced for the Davinci controller and means
that the OOB area must be read *before* the rest of the data. This has
nothing to do with the ECC in OOB placement as it could be understood
and most importantly, there is no point in having this function out of
the Davinci NAND controller driver. A DT property for this scheme has
been added but never used, even by the Davinci driver which only uses
this scheme to change the default nand_read_page().

Move the main read_page() helper into the Davinci driver and remove
the remaining boilerplate.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/davinci_nand.c | 126 +++++++++++++++++++++-------
 drivers/mtd/nand/raw/nand_base.c    |  81 ------------------
 include/linux/mtd/rawnand.h         |   1 -
 3 files changed, 98 insertions(+), 110 deletions(-)

diff --git a/drivers/mtd/nand/raw/davinci_nand.c b/drivers/mtd/nand/raw/davinci_nand.c
index 52b87304954b..d975a62caaa5 100644
--- a/drivers/mtd/nand/raw/davinci_nand.c
+++ b/drivers/mtd/nand/raw/davinci_nand.c
@@ -371,6 +371,77 @@ static int nand_davinci_correct_4bit(struct nand_chip *chip, u_char *data,
 	return corrected;
 }
 
+/**
+ * nand_read_page_hwecc_oob_first - hw ecc, read oob first
+ * @chip: nand chip info structure
+ * @buf: buffer to store read data
+ * @oob_required: caller requires OOB data read to chip->oob_poi
+ * @page: page number to read
+ *
+ * Hardware ECC for large page chips, require OOB to be read first. For this
+ * ECC mode, the write_page method is re-used from ECC_HW. These methods
+ * read/write ECC from the OOB area, unlike the ECC_HW_SYNDROME support with
+ * multiple ECC steps, follows the "infix ECC" scheme and reads/writes ECC from
+ * the data area, by overwriting the NAND manufacturer bad block markings.
+ */
+static int nand_davinci_read_page_hwecc_oob_first(struct nand_chip *chip,
+						  uint8_t *buf,
+						  int oob_required, int page)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	int i, eccsize = chip->ecc.size, ret;
+	int eccbytes = chip->ecc.bytes;
+	int eccsteps = chip->ecc.steps;
+	uint8_t *p = buf;
+	uint8_t *ecc_code = chip->ecc.code_buf;
+	uint8_t *ecc_calc = chip->ecc.calc_buf;
+	unsigned int max_bitflips = 0;
+
+	/* Read the OOB area first */
+	ret = nand_read_oob_op(chip, page, 0, chip->oob_poi, mtd->oobsize);
+	if (ret)
+		return ret;
+
+	ret = nand_read_page_op(chip, page, 0, NULL, 0);
+	if (ret)
+		return ret;
+
+	ret = mtd_ooblayout_get_eccbytes(mtd, ecc_code, chip->oob_poi, 0,
+					 chip->ecc.total);
+	if (ret)
+		return ret;
+
+	for (i = 0; eccsteps; eccsteps--, i += eccbytes, p += eccsize) {
+		int stat;
+
+		chip->ecc.hwctl(chip, NAND_ECC_READ);
+
+		ret = nand_read_data_op(chip, p, eccsize, false, false);
+		if (ret)
+			return ret;
+
+		chip->ecc.calculate(chip, p, &ecc_calc[i]);
+
+		stat = chip->ecc.correct(chip, p, &ecc_code[i], NULL);
+		if (stat == -EBADMSG &&
+		    (chip->ecc.options & NAND_ECC_GENERIC_ERASED_CHECK)) {
+			/* check for empty pages with bitflips */
+			stat = nand_check_erased_ecc_chunk(p, eccsize,
+							   &ecc_code[i],
+							   eccbytes, NULL, 0,
+							   chip->ecc.strength);
+		}
+
+		if (stat < 0) {
+			mtd->ecc_stats.failed++;
+		} else {
+			mtd->ecc_stats.corrected += stat;
+			max_bitflips = max_t(unsigned int, max_bitflips, stat);
+		}
+	}
+	return max_bitflips;
+}
+
 /*----------------------------------------------------------------------*/
 
 /* An ECC layout for using 4-bit ECC with small-page flash, storing
@@ -530,6 +601,13 @@ static int davinci_nand_attach_chip(struct nand_chip *chip)
 		break;
 	case NAND_ECC_HW:
 		if (pdata->ecc_bits == 4) {
+			int chunks = mtd->writesize / 512;
+
+			if (!chunks || mtd->oobsize < 16) {
+				dev_dbg(&info->pdev->dev, "too small\n");
+				return -EINVAL;
+			}
+
 			/*
 			 * No sanity checks:  CPUs must support this,
 			 * and the chips may not use NAND_BUSWIDTH_16.
@@ -552,6 +630,26 @@ static int davinci_nand_attach_chip(struct nand_chip *chip)
 			info->chip.ecc.bytes = 10;
 			info->chip.ecc.options = NAND_ECC_GENERIC_ERASED_CHECK;
 			info->chip.ecc.algo = NAND_ECC_BCH;
+
+			/*
+			 * Update ECC layout if needed ... for 1-bit HW ECC, the
+			 * default is OK, but it allocates 6 bytes when only 3
+			 * are needed (for each 512 bytes). For 4-bit HW ECC,
+			 * the default is not usable: 10 bytes needed, not 6.
+			 *
+			 * For small page chips, preserve the manufacturer's
+			 * badblock marking data ... and make sure a flash BBT
+			 * table marker fits in the free bytes.
+			 */
+			if (chunks == 1) {
+				mtd_set_ooblayout(mtd,
+						  &hwecc4_small_ooblayout_ops);
+			} else if (chunks == 4 || chunks == 8) {
+				mtd_set_ooblayout(mtd, &nand_ooblayout_lp_ops);
+				info->chip.ecc.read_page = nand_davinci_read_page_hwecc_oob_first;
+			} else {
+				return -EIO;
+			}
 		} else {
 			/* 1bit ecc hamming */
 			info->chip.ecc.calculate = nand_davinci_calculate_1bit;
@@ -567,34 +665,6 @@ static int davinci_nand_attach_chip(struct nand_chip *chip)
 		return -EINVAL;
 	}
 
-	/*
-	 * Update ECC layout if needed ... for 1-bit HW ECC, the default
-	 * is OK, but it allocates 6 bytes when only 3 are needed (for
-	 * each 512 bytes).  For the 4-bit HW ECC, that default is not
-	 * usable:  10 bytes are needed, not 6.
-	 */
-	if (pdata->ecc_bits == 4) {
-		int chunks = mtd->writesize / 512;
-
-		if (!chunks || mtd->oobsize < 16) {
-			dev_dbg(&info->pdev->dev, "too small\n");
-			return -EINVAL;
-		}
-
-		/* For small page chips, preserve the manufacturer's
-		 * badblock marking data ... and make sure a flash BBT
-		 * table marker fits in the free bytes.
-		 */
-		if (chunks == 1) {
-			mtd_set_ooblayout(mtd, &hwecc4_small_ooblayout_ops);
-		} else if (chunks == 4 || chunks == 8) {
-			mtd_set_ooblayout(mtd, &nand_ooblayout_lp_ops);
-			info->chip.ecc.mode = NAND_ECC_HW_OOB_FIRST;
-		} else {
-			return -EIO;
-		}
-	}
-
 	return ret;
 }
 
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index e2cdfbb45923..7176e513a0bb 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -3075,76 +3075,6 @@ static int nand_read_page_hwecc(struct nand_chip *chip, uint8_t *buf,
 	return max_bitflips;
 }
 
-/**
- * nand_read_page_hwecc_oob_first - [REPLACEABLE] hw ecc, read oob first
- * @chip: nand chip info structure
- * @buf: buffer to store read data
- * @oob_required: caller requires OOB data read to chip->oob_poi
- * @page: page number to read
- *
- * Hardware ECC for large page chips, require OOB to be read first. For this
- * ECC mode, the write_page method is re-used from ECC_HW. These methods
- * read/write ECC from the OOB area, unlike the ECC_HW_SYNDROME support with
- * multiple ECC steps, follows the "infix ECC" scheme and reads/writes ECC from
- * the data area, by overwriting the NAND manufacturer bad block markings.
- */
-static int nand_read_page_hwecc_oob_first(struct nand_chip *chip, uint8_t *buf,
-					  int oob_required, int page)
-{
-	struct mtd_info *mtd = nand_to_mtd(chip);
-	int i, eccsize = chip->ecc.size, ret;
-	int eccbytes = chip->ecc.bytes;
-	int eccsteps = chip->ecc.steps;
-	uint8_t *p = buf;
-	uint8_t *ecc_code = chip->ecc.code_buf;
-	uint8_t *ecc_calc = chip->ecc.calc_buf;
-	unsigned int max_bitflips = 0;
-
-	/* Read the OOB area first */
-	ret = nand_read_oob_op(chip, page, 0, chip->oob_poi, mtd->oobsize);
-	if (ret)
-		return ret;
-
-	ret = nand_read_page_op(chip, page, 0, NULL, 0);
-	if (ret)
-		return ret;
-
-	ret = mtd_ooblayout_get_eccbytes(mtd, ecc_code, chip->oob_poi, 0,
-					 chip->ecc.total);
-	if (ret)
-		return ret;
-
-	for (i = 0; eccsteps; eccsteps--, i += eccbytes, p += eccsize) {
-		int stat;
-
-		chip->ecc.hwctl(chip, NAND_ECC_READ);
-
-		ret = nand_read_data_op(chip, p, eccsize, false, false);
-		if (ret)
-			return ret;
-
-		chip->ecc.calculate(chip, p, &ecc_calc[i]);
-
-		stat = chip->ecc.correct(chip, p, &ecc_code[i], NULL);
-		if (stat == -EBADMSG &&
-		    (chip->ecc.options & NAND_ECC_GENERIC_ERASED_CHECK)) {
-			/* check for empty pages with bitflips */
-			stat = nand_check_erased_ecc_chunk(p, eccsize,
-						&ecc_code[i], eccbytes,
-						NULL, 0,
-						chip->ecc.strength);
-		}
-
-		if (stat < 0) {
-			mtd->ecc_stats.failed++;
-		} else {
-			mtd->ecc_stats.corrected += stat;
-			max_bitflips = max_t(unsigned int, max_bitflips, stat);
-		}
-	}
-	return max_bitflips;
-}
-
 /**
  * nand_read_page_syndrome - [REPLACEABLE] hardware ECC syndrome based page read
  * @chip: nand chip info structure
@@ -5085,7 +5015,6 @@ static const char * const nand_ecc_modes[] = {
 	[NAND_ECC_SOFT]		= "soft",
 	[NAND_ECC_HW]		= "hw",
 	[NAND_ECC_HW_SYNDROME]	= "hw_syndrome",
-	[NAND_ECC_HW_OOB_FIRST]	= "hw_oob_first",
 	[NAND_ECC_ON_DIE]	= "on-die",
 };
 
@@ -5834,16 +5763,6 @@ static int nand_scan_tail(struct nand_chip *chip)
 	 */
 
 	switch (ecc->mode) {
-	case NAND_ECC_HW_OOB_FIRST:
-		/* Similar to NAND_ECC_HW, but a separate read_page handle */
-		if (!ecc->calculate || !ecc->correct || !ecc->hwctl) {
-			WARN(1, "No ECC functions supplied; hardware ECC not possible\n");
-			ret = -EINVAL;
-			goto err_nand_manuf_cleanup;
-		}
-		if (!ecc->read_page)
-			ecc->read_page = nand_read_page_hwecc_oob_first;
-		fallthrough;
 	case NAND_ECC_HW:
 		/* Use standard hwecc read page function? */
 		if (!ecc->read_page)
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 0911e845cced..7b87c5dc89bd 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -88,7 +88,6 @@ enum nand_ecc_mode {
 	NAND_ECC_SOFT,
 	NAND_ECC_HW,
 	NAND_ECC_HW_SYNDROME,
-	NAND_ECC_HW_OOB_FIRST,
 	NAND_ECC_ON_DIE,
 };
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
