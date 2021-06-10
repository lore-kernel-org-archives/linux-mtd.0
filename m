Return-Path: <SRS0=9fF3=LE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8DD6C47094
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 13:50:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A85036109E
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 13:50:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A85036109E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=un1CCnak+7TfniJn8LtQaCle3Cgu0byIIQw2N+o5cp8=; b=Mz5pFZMGoN3i34
	ubKnNgaurFhljNq1EFISATyRRfwhEC8aJA8r7Fqvz8xNnhu5YMU5hd62AjI42bfpZv62PHGa2NXlw
	AMYDZth8gymvmWOgrTodFjXFiXy8UQgJWyS0Y1f9hiqa9ePr5/Hds/Ep9/3la4+PepME4UQ7NeOxW
	Yh5TnA7tRibsxT44lX2COy4bX3r4SPeXREj95M5v19vhLR2QUqxpCPhH5M3hpJmZabsxzayxAjAvj
	h2MPAYtPDk+vyabIABiIbSISVk5Kff7dnc/oMR4LJkI5zrz9CIIgejUxxT6L6chSBk/aPqDMMzV7A
	qq9MphCKL5NCHVO20/5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrL4T-000ys4-A4; Thu, 10 Jun 2021 13:50:09 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrL3X-000yUe-B5
 for linux-mtd@lists.infradead.org; Thu, 10 Jun 2021 13:49:15 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 072B2240013;
 Thu, 10 Jun 2021 13:49:08 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, ryan.barnett@collins.com,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 2/5] mtd: rawnand: omap: Rename a macro
Date: Thu, 10 Jun 2021 15:49:03 +0200
Message-Id: <20210610134906.3503303-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210610134906.3503303-1-miquel.raynal@bootlin.com>
References: <20210610134906.3503303-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_064911_605586_70B9CD33 
X-CRM114-Status: GOOD (  12.71  )
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

The macro BADBLOCK_MARKER_LENGTH is pretty long and could be reduced to
BBM_LEN which is more handy to use in the code.

This is a purely cosmetic change and is only done to avoid further
change to contain 100+ char lines just because of this definition.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/omap2.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index eb8b5e10ab6e..cbe2c6ba510f 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -131,7 +131,7 @@
 #define BCH_ECC_SIZE0		0x0	/* ecc_size0 = 0, no oob protection */
 #define BCH_ECC_SIZE1		0x20	/* ecc_size1 = 32 */
 
-#define BADBLOCK_MARKER_LENGTH		2
+#define BBM_LEN			2
 
 static u_char bch16_vector[] = {0xf5, 0x24, 0x1c, 0xd0, 0x61, 0xb3, 0xf1, 0x55,
 				0x2e, 0x2c, 0x86, 0xa3, 0xed, 0x36, 0x1b, 0x78,
@@ -1648,8 +1648,8 @@ static int omap_read_page_bch(struct nand_chip *chip, uint8_t *buf,
 
 	/* Read oob bytes */
 	nand_change_read_column_op(chip,
-				   mtd->writesize + BADBLOCK_MARKER_LENGTH,
-				   chip->oob_poi + BADBLOCK_MARKER_LENGTH,
+				   mtd->writesize + BBM_LEN,
+				   chip->oob_poi + BBM_LEN,
 				   chip->ecc.total, false);
 
 	/* Calculate ecc bytes */
@@ -1818,7 +1818,7 @@ static int omap_ooblayout_ecc(struct mtd_info *mtd, int section,
 {
 	struct omap_nand_info *info = mtd_to_omap(mtd);
 	struct nand_chip *chip = &info->nand;
-	int off = BADBLOCK_MARKER_LENGTH;
+	int off = BBM_LEN;
 
 	if (info->ecc_opt == OMAP_ECC_HAM1_CODE_HW &&
 	    !(chip->options & NAND_BUSWIDTH_16))
@@ -1838,7 +1838,7 @@ static int omap_ooblayout_free(struct mtd_info *mtd, int section,
 {
 	struct omap_nand_info *info = mtd_to_omap(mtd);
 	struct nand_chip *chip = &info->nand;
-	int off = BADBLOCK_MARKER_LENGTH;
+	int off = BBM_LEN;
 
 	if (info->ecc_opt == OMAP_ECC_HAM1_CODE_HW &&
 	    !(chip->options & NAND_BUSWIDTH_16))
@@ -1866,7 +1866,7 @@ static int omap_sw_ooblayout_ecc(struct mtd_info *mtd, int section,
 				 struct mtd_oob_region *oobregion)
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
-	int off = BADBLOCK_MARKER_LENGTH;
+	int off = BBM_LEN;
 
 	if (section >= chip->ecc.steps)
 		return -ERANGE;
@@ -1885,7 +1885,7 @@ static int omap_sw_ooblayout_free(struct mtd_info *mtd, int section,
 				  struct mtd_oob_region *oobregion)
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
-	int off = BADBLOCK_MARKER_LENGTH;
+	int off = BBM_LEN;
 
 	if (section)
 		return -ERANGE;
@@ -1914,7 +1914,7 @@ static int omap_nand_attach_chip(struct nand_chip *chip)
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct omap_nand_info *info = mtd_to_omap(mtd);
 	struct device *dev = &info->pdev->dev;
-	int min_oobbytes = BADBLOCK_MARKER_LENGTH;
+	int min_oobbytes = BBM_LEN;
 	int elm_bch_strength = -1;
 	int oobbytes_per_step;
 	dma_cap_mask_t mask;
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
