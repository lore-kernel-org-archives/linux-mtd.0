Return-Path: <SRS0=9fF3=LE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43F94C47094
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 13:51:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13E22613F5
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 13:51:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13E22613F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cZoAzP1cWooLO/MDIRNhLTEOc2nBj1r4eatVAI/SCrU=; b=LfpQ1mgMnDcysC
	vW2m28tLQ8t9VeJ8HEoo1p/W0l46uD18R7ztrafxHbqyGNYEo1PdZGVqNZhJz6wqmH6ycz/+JVKKn
	uci9jCVouqAwr9cZ5TSpWQhK763upXg9+JnPJ63Xk8byx6jkPMdXL0hzeBmPPJrXlXetkXc5Fk+hr
	ptX4hlEodK3tvNwPHZ4uqyySs1mmkzQkToTb7TdHtHTcxcCGxeJ947v1nq4Oeqwe+Vwjz65SLQB2n
	fLFqhddVIbEsiV0kFgc+aW0IqUtUwPP41Mqkip0E6//ZfIoVOcskk7eQL/SW/RDBQMTA3IYxYCwCy
	PJaK3zSRnLHR2rVuji5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrL5U-000zEa-46; Thu, 10 Jun 2021 13:51:12 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrL3Y-000yUq-0g
 for linux-mtd@lists.infradead.org; Thu, 10 Jun 2021 13:49:15 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id C277A240008;
 Thu, 10 Jun 2021 13:49:09 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, ryan.barnett@collins.com,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 3/5] mtd: rawnand: omap: Check return values
Date: Thu, 10 Jun 2021 15:49:04 +0200
Message-Id: <20210610134906.3503303-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210610134906.3503303-1-miquel.raynal@bootlin.com>
References: <20210610134906.3503303-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_064912_217838_4F79DF5B 
X-CRM114-Status: GOOD (  10.64  )
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

Check the return value of many helpers which might return error codes.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/omap2.c | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index cbe2c6ba510f..4b2ad77db71d 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -1527,7 +1527,9 @@ static int omap_write_page_bch(struct nand_chip *chip, const uint8_t *buf,
 	int ret;
 	uint8_t *ecc_calc = chip->ecc.calc_buf;
 
-	nand_prog_page_begin_op(chip, page, 0, NULL, 0);
+	ret = nand_prog_page_begin_op(chip, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	/* Enable GPMC ecc engine */
 	chip->ecc.hwctl(chip, NAND_ECC_WRITE);
@@ -1536,7 +1538,9 @@ static int omap_write_page_bch(struct nand_chip *chip, const uint8_t *buf,
 	chip->legacy.write_buf(chip, buf, mtd->writesize);
 
 	/* Update ecc vector from GPMC result registers */
-	omap_calculate_ecc_bch_multi(mtd, buf, &ecc_calc[0]);
+	ret = omap_calculate_ecc_bch_multi(mtd, buf, &ecc_calc[0]);
+	if (ret)
+		return ret;
 
 	ret = mtd_ooblayout_set_eccbytes(mtd, ecc_calc, chip->oob_poi, 0,
 					 chip->ecc.total);
@@ -1579,7 +1583,9 @@ static int omap_write_subpage_bch(struct nand_chip *chip, u32 offset,
 	 * ECC is calculated for all subpages but we choose
 	 * only what we want.
 	 */
-	nand_prog_page_begin_op(chip, page, 0, NULL, 0);
+	ret = nand_prog_page_begin_op(chip, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	/* Enable GPMC ECC engine */
 	chip->ecc.hwctl(chip, NAND_ECC_WRITE);
@@ -1638,7 +1644,9 @@ static int omap_read_page_bch(struct nand_chip *chip, uint8_t *buf,
 	int stat, ret;
 	unsigned int max_bitflips = 0;
 
-	nand_read_page_op(chip, page, 0, NULL, 0);
+	ret = nand_read_page_op(chip, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	/* Enable GPMC ecc engine */
 	chip->ecc.hwctl(chip, NAND_ECC_READ);
@@ -1647,13 +1655,17 @@ static int omap_read_page_bch(struct nand_chip *chip, uint8_t *buf,
 	chip->legacy.read_buf(chip, buf, mtd->writesize);
 
 	/* Read oob bytes */
-	nand_change_read_column_op(chip,
-				   mtd->writesize + BBM_LEN,
-				   chip->oob_poi + BBM_LEN,
-				   chip->ecc.total, false);
+	ret = nand_change_read_column_op(chip,
+					 mtd->writesize + BBM_LEN,
+					 chip->oob_poi + BBM_LEN,
+					 chip->ecc.total, false);
+	if (ret)
+		return ret;
 
 	/* Calculate ecc bytes */
-	omap_calculate_ecc_bch_multi(mtd, buf, ecc_calc);
+	ret = omap_calculate_ecc_bch_multi(mtd, buf, ecc_calc);
+	if (ret)
+		return ret;
 
 	ret = mtd_ooblayout_get_eccbytes(mtd, ecc_code, chip->oob_poi, 0,
 					 chip->ecc.total);
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
