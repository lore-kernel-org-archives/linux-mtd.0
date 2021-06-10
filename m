Return-Path: <SRS0=9fF3=LE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFB42C47094
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 13:52:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A6CD613F8
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 13:52:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A6CD613F8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uou7p2Qycp2cYhhvGAZBHAG6WZPGLUURj83G9E10M+I=; b=uBFryYOJG+L1v/
	eYEoKv/6j9lIu++2KJM9Ca83qfKpdQYgE084BSdk7GQMankZ0xGNLOMBIY+6ZiLaasYZeJ4fYqd+D
	GjEmNot3IZ5/uRXx6KzHHa4qi69V50B+8xwPCXVlPwHe/r33/DNs10F5jR+cBQm0HofiIzjn814Aw
	vbuHMGThnkvKIrtmWyPkdYguABlR85BhA21KtnDwPeUc1/sl+2IbWl1EdD1Brq3XdhL+gGV9d6iKJ
	GGhaV/bl6WfS5QRKMNxrIOiNuadV8vmgMwsZ7LOhyoexUgEyOez7Axs2b8bHKH5M7t15VBgW+SxNx
	jITNhCh9bBIIvxid20sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrL6U-000zZ7-At; Thu, 10 Jun 2021 13:52:14 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrL3Z-000yWU-Sl
 for linux-mtd@lists.infradead.org; Thu, 10 Jun 2021 13:49:17 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 7B922240014;
 Thu, 10 Jun 2021 13:49:11 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, ryan.barnett@collins.com,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 5/5] mtd: rawnand: omap: Add larger page NAND chips support
Date: Thu, 10 Jun 2021 15:49:06 +0200
Message-Id: <20210610134906.3503303-6-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210610134906.3503303-1-miquel.raynal@bootlin.com>
References: <20210610134906.3503303-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_064914_269240_9FFB860E 
X-CRM114-Status: GOOD (  22.69  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

There is no reason to be limited to 4kiB page NAND chips just because
this is the maximum length the ELM is able to handle in one go. Just
call the ELM several times and it will process as many data as needed.

Here we introduce the concept of ECC page (which is at most 4kiB). The
ELM will be sought as many times as there are ECC pages.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/omap2.c    | 179 ++++++++++++++++++++------------
 drivers/mtd/nand/raw/omap_elm.c |   2 +-
 2 files changed, 114 insertions(+), 67 deletions(-)

diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index 71cd659cd876..7497bc1d30eb 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -171,6 +171,10 @@ struct omap_nand_info {
 	struct device			*elm_dev;
 	/* NAND ready gpio */
 	struct gpio_desc		*ready_gpiod;
+	unsigned int			neccpg;
+	unsigned int			nsteps_per_eccpg;
+	unsigned int			eccpg_size;
+	unsigned int			eccpg_bytes;
 };
 
 static inline struct omap_nand_info *mtd_to_omap(struct mtd_info *mtd)
@@ -1354,7 +1358,7 @@ static int omap_elm_correct_data(struct nand_chip *chip, u_char *data,
 {
 	struct omap_nand_info *info = mtd_to_omap(nand_to_mtd(chip));
 	struct nand_ecc_ctrl *ecc = &info->nand.ecc;
-	int eccsteps = info->nand.ecc.steps;
+	int eccsteps = info->nsteps_per_eccpg;
 	int i , j, stat = 0;
 	int eccflag, actual_eccbytes;
 	struct elm_errorvec err_vec[ERROR_VECTOR_MAX];
@@ -1524,28 +1528,37 @@ static int omap_write_page_bch(struct nand_chip *chip, const uint8_t *buf,
 			       int oob_required, int page)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct omap_nand_info *info = mtd_to_omap(mtd);
 	uint8_t *ecc_calc = chip->ecc.calc_buf;
+	unsigned int eccpg;
 	int ret;
 
 	ret = nand_prog_page_begin_op(chip, page, 0, NULL, 0);
 	if (ret)
 		return ret;
 
-	/* Enable GPMC ecc engine */
-	chip->ecc.hwctl(chip, NAND_ECC_WRITE);
+	for (eccpg = 0; eccpg < info->neccpg; eccpg++) {
+		/* Enable GPMC ecc engine */
+		chip->ecc.hwctl(chip, NAND_ECC_WRITE);
 
-	/* Write data */
-	chip->legacy.write_buf(chip, buf, mtd->writesize);
+		/* Write data */
+		chip->legacy.write_buf(chip, buf + (eccpg * info->eccpg_size),
+				       info->eccpg_size);
 
-	/* Update ecc vector from GPMC result registers */
-	ret = omap_calculate_ecc_bch_multi(mtd, buf, &ecc_calc[0]);
-	if (ret)
-		return ret;
+		/* Update ecc vector from GPMC result registers */
+		ret = omap_calculate_ecc_bch_multi(mtd,
+						   buf + (eccpg * info->eccpg_size),
+						   ecc_calc);
+		if (ret)
+			return ret;
 
-	ret = mtd_ooblayout_set_eccbytes(mtd, ecc_calc, chip->oob_poi, 0,
-					 chip->ecc.total);
-	if (ret)
-		return ret;
+		ret = mtd_ooblayout_set_eccbytes(mtd, ecc_calc,
+						 chip->oob_poi,
+						 eccpg * info->eccpg_bytes,
+						 info->eccpg_bytes);
+		if (ret)
+			return ret;
+	}
 
 	/* Write ecc vector to OOB area */
 	chip->legacy.write_buf(chip, chip->oob_poi, mtd->oobsize);
@@ -1569,12 +1582,13 @@ static int omap_write_subpage_bch(struct nand_chip *chip, u32 offset,
 				  int oob_required, int page)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct omap_nand_info *info = mtd_to_omap(mtd);
 	u8 *ecc_calc = chip->ecc.calc_buf;
 	int ecc_size      = chip->ecc.size;
 	int ecc_bytes     = chip->ecc.bytes;
-	int ecc_steps     = chip->ecc.steps;
 	u32 start_step = offset / ecc_size;
 	u32 end_step   = (offset + data_len - 1) / ecc_size;
+	unsigned int eccpg;
 	int step, ret = 0;
 
 	/*
@@ -1587,36 +1601,44 @@ static int omap_write_subpage_bch(struct nand_chip *chip, u32 offset,
 	if (ret)
 		return ret;
 
-	/* Enable GPMC ECC engine */
-	chip->ecc.hwctl(chip, NAND_ECC_WRITE);
+	for (eccpg = 0; eccpg < info->neccpg; eccpg++) {
+		/* Enable GPMC ECC engine */
+		chip->ecc.hwctl(chip, NAND_ECC_WRITE);
 
-	/* Write data */
-	chip->legacy.write_buf(chip, buf, mtd->writesize);
+		/* Write data */
+		chip->legacy.write_buf(chip, buf + (eccpg * info->eccpg_size),
+				       info->eccpg_size);
 
-	for (step = 0; step < ecc_steps; step++) {
-		/* Mask ECC of un-touched subpages with 0xFFs */
-		if (step < start_step || step > end_step)
-			memset(ecc_calc, 0xff, ecc_bytes);
-		else
-			ret = _omap_calculate_ecc_bch(mtd, buf, ecc_calc, step);
+		for (step = 0; step < info->nsteps_per_eccpg; step++) {
+			unsigned int base_step = eccpg * info->nsteps_per_eccpg;
+			const u8 *bufoffs = buf + (eccpg * info->eccpg_size);
 
+			/* Mask ECC of un-touched subpages with 0xFFs */
+			if ((step + base_step) < start_step ||
+			    (step + base_step) > end_step)
+				memset(ecc_calc + (step * ecc_bytes), 0xff,
+				       ecc_bytes);
+			else
+				ret = _omap_calculate_ecc_bch(mtd,
+							      bufoffs + (step * ecc_size),
+							      ecc_calc + (step * ecc_bytes),
+							      step);
+
+			if (ret)
+				return ret;
+		}
+
+		/*
+		 * Copy the calculated ECC for the whole page including the
+		 * masked values (0xFF) corresponding to unwritten subpages.
+		 */
+		ret = mtd_ooblayout_set_eccbytes(mtd, ecc_calc, chip->oob_poi,
+						 eccpg * info->eccpg_bytes,
+						 info->eccpg_bytes);
 		if (ret)
 			return ret;
-
-		buf += ecc_size;
-		ecc_calc += ecc_bytes;
 	}
 
-	/*
-	 * Copy the calculated ECC for the whole page including the
-	 * masked values (0xFF) corresponding to unwritten subpages.
-	 */
-	ecc_calc = chip->ecc.calc_buf;
-	ret = mtd_ooblayout_set_eccbytes(mtd, ecc_calc, chip->oob_poi, 0,
-					 chip->ecc.total);
-	if (ret)
-		return ret;
-
 	/* write OOB buffer to NAND device */
 	chip->legacy.write_buf(chip, chip->oob_poi, mtd->oobsize);
 
@@ -1641,46 +1663,60 @@ static int omap_read_page_bch(struct nand_chip *chip, uint8_t *buf,
 			      int oob_required, int page)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct omap_nand_info *info = mtd_to_omap(mtd);
 	uint8_t *ecc_calc = chip->ecc.calc_buf;
 	uint8_t *ecc_code = chip->ecc.code_buf;
-	unsigned int max_bitflips = 0;
+	unsigned int max_bitflips = 0, eccpg;
 	int stat, ret;
 
 	ret = nand_read_page_op(chip, page, 0, NULL, 0);
 	if (ret)
 		return ret;
 
-	/* Enable GPMC ecc engine */
-	chip->ecc.hwctl(chip, NAND_ECC_READ);
+	for (eccpg = 0; eccpg < info->neccpg; eccpg++) {
+		/* Enable GPMC ecc engine */
+		chip->ecc.hwctl(chip, NAND_ECC_READ);
 
-	/* Read data */
-	chip->legacy.read_buf(chip, buf, mtd->writesize);
+		/* Read data */
+		ret = nand_change_read_column_op(chip, eccpg * info->eccpg_size,
+						 buf + (eccpg * info->eccpg_size),
+						 info->eccpg_size, false);
+		if (ret)
+			return ret;
 
-	/* Read oob bytes */
-	ret = nand_change_read_column_op(chip,
-					 mtd->writesize + BBM_LEN,
-					 chip->oob_poi + BBM_LEN,
-					 chip->ecc.total, false);
-	if (ret)
-		return ret;
+		/* Read oob bytes */
+		ret = nand_change_read_column_op(chip,
+						 mtd->writesize + BBM_LEN +
+						 (eccpg * info->eccpg_bytes),
+						 chip->oob_poi + BBM_LEN +
+						 (eccpg * info->eccpg_bytes),
+						 info->eccpg_bytes, false);
+		if (ret)
+			return ret;
 
-	/* Calculate ecc bytes */
-	ret = omap_calculate_ecc_bch_multi(mtd, buf, ecc_calc);
-	if (ret)
-		return ret;
+		/* Calculate ecc bytes */
+		ret = omap_calculate_ecc_bch_multi(mtd,
+						   buf + (eccpg * info->eccpg_size),
+						   ecc_calc);
+		if (ret)
+			return ret;
 
-	ret = mtd_ooblayout_get_eccbytes(mtd, ecc_code, chip->oob_poi, 0,
-					 chip->ecc.total);
-	if (ret)
-		return ret;
+		ret = mtd_ooblayout_get_eccbytes(mtd, ecc_code,
+						 chip->oob_poi,
+						 eccpg * info->eccpg_bytes,
+						 info->eccpg_bytes);
+		if (ret)
+			return ret;
 
-	stat = chip->ecc.correct(chip, buf, ecc_code, ecc_calc);
-
-	if (stat < 0) {
-		mtd->ecc_stats.failed++;
-	} else {
-		mtd->ecc_stats.corrected += stat;
-		max_bitflips = max_t(unsigned int, max_bitflips, stat);
+		stat = chip->ecc.correct(chip,
+					 buf + (eccpg * info->eccpg_size),
+					 ecc_code, ecc_calc);
+		if (stat < 0) {
+			mtd->ecc_stats.failed++;
+		} else {
+			mtd->ecc_stats.corrected += stat;
+			max_bitflips = max_t(unsigned int, max_bitflips, stat);
+		}
 	}
 
 	return max_bitflips;
@@ -2144,9 +2180,20 @@ static int omap_nand_attach_chip(struct nand_chip *chip)
 	}
 
 	if (elm_bch_strength >= 0) {
+		chip->ecc.steps = mtd->writesize / chip->ecc.size;
+		info->neccpg = chip->ecc.steps / ERROR_VECTOR_MAX;
+		if (info->neccpg) {
+			info->nsteps_per_eccpg = ERROR_VECTOR_MAX;
+		} else {
+			info->neccpg = 1;
+			info->nsteps_per_eccpg = chip->ecc.steps;
+		}
+		info->eccpg_size = info->nsteps_per_eccpg * chip->ecc.size;
+		info->eccpg_bytes = info->nsteps_per_eccpg * chip->ecc.bytes;
+
 		err = elm_config(info->elm_dev, elm_bch_strength,
-				 mtd->writesize / chip->ecc.size,
-				 chip->ecc.size, chip->ecc.bytes);
+				 info->nsteps_per_eccpg, chip->ecc.size,
+				 chip->ecc.bytes);
 		if (err < 0)
 			return err;
 	}
diff --git a/drivers/mtd/nand/raw/omap_elm.c b/drivers/mtd/nand/raw/omap_elm.c
index 4b799521a427..29a7d62c8367 100644
--- a/drivers/mtd/nand/raw/omap_elm.c
+++ b/drivers/mtd/nand/raw/omap_elm.c
@@ -113,7 +113,7 @@ int elm_config(struct device *dev, enum bch_ecc bch_type,
 		return -EINVAL;
 	}
 	/* ELM support 8 error syndrome process */
-	if (ecc_steps > ERROR_VECTOR_MAX) {
+	if (ecc_steps > ERROR_VECTOR_MAX && ecc_steps % ERROR_VECTOR_MAX) {
 		dev_err(dev, "unsupported config ecc-step=%d\n", ecc_steps);
 		return -EINVAL;
 	}
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
