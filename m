Return-Path: <SRS0=9fF3=LE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 478DDC47094
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 13:51:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 120DA6109E
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 13:51:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 120DA6109E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SfQ9xEP0drK8NiE6mYT7JNrHMg/zyblfFV/5hqD/naQ=; b=jpuciedGLl5Yd/
	s1UKRvOpdvfkvtiSZgTjjfxwi8v8NrzIPvUyJlTOmgY1AL0ia07mwyd/iO1ufqMT8lB6f37opX/K8
	10xRvC7CAZDNpFmaaAidQIBLI3GDPHWv0g5c5O8OAZpscG3reabcTf8tzV2GuUQsdHB8Iz8U7cHj9
	ZWO3+/Di1BmpFkzuGDTVyLoq2lmmg8p5pfKKAsUlYfwXTBcZ4c3gtK4SSnbKXE8HyzjmBx7fJKYZB
	nDBCGUB1ZzqvH7oP/uO2KXq8Mdl8X2tyoZ4MNO1YxoLheXyg+GL7d/tS0sonDDorAVLTDKvmwA/mV
	1Bo6PCxaKCgDB5eonxiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrL4t-000z17-6J; Thu, 10 Jun 2021 13:50:35 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrL3Y-000yVQ-Pr
 for linux-mtd@lists.infradead.org; Thu, 10 Jun 2021 13:49:15 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 9F2F9240012;
 Thu, 10 Jun 2021 13:49:10 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, ryan.barnett@collins.com,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 4/5] mtd: rawnand: omap: Various style fixes
Date: Thu, 10 Jun 2021 15:49:05 +0200
Message-Id: <20210610134906.3503303-5-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210610134906.3503303-1-miquel.raynal@bootlin.com>
References: <20210610134906.3503303-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_064913_007456_F7A8BA15 
X-CRM114-Status: GOOD (  12.54  )
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

Fix the comments style, declare the variables in a reverse Christmas
tree order, add an upper case character at the beginning of a sentence.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/omap2.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index 4b2ad77db71d..71cd659cd876 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -1524,8 +1524,8 @@ static int omap_write_page_bch(struct nand_chip *chip, const uint8_t *buf,
 			       int oob_required, int page)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
-	int ret;
 	uint8_t *ecc_calc = chip->ecc.calc_buf;
+	int ret;
 
 	ret = nand_prog_page_begin_op(chip, page, 0, NULL, 0);
 	if (ret)
@@ -1594,7 +1594,7 @@ static int omap_write_subpage_bch(struct nand_chip *chip, u32 offset,
 	chip->legacy.write_buf(chip, buf, mtd->writesize);
 
 	for (step = 0; step < ecc_steps; step++) {
-		/* mask ECC of un-touched subpages by padding 0xFF */
+		/* Mask ECC of un-touched subpages with 0xFFs */
 		if (step < start_step || step > end_step)
 			memset(ecc_calc, 0xff, ecc_bytes);
 		else
@@ -1607,8 +1607,10 @@ static int omap_write_subpage_bch(struct nand_chip *chip, u32 offset,
 		ecc_calc += ecc_bytes;
 	}
 
-	/* copy calculated ECC for whole page to chip->buffer->oob */
-	/* this include masked-value(0xFF) for unwritten subpages */
+	/*
+	 * Copy the calculated ECC for the whole page including the
+	 * masked values (0xFF) corresponding to unwritten subpages.
+	 */
 	ecc_calc = chip->ecc.calc_buf;
 	ret = mtd_ooblayout_set_eccbytes(mtd, ecc_calc, chip->oob_poi, 0,
 					 chip->ecc.total);
@@ -1641,8 +1643,8 @@ static int omap_read_page_bch(struct nand_chip *chip, uint8_t *buf,
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	uint8_t *ecc_calc = chip->ecc.calc_buf;
 	uint8_t *ecc_code = chip->ecc.code_buf;
-	int stat, ret;
 	unsigned int max_bitflips = 0;
+	int stat, ret;
 
 	ret = nand_read_page_op(chip, page, 0, NULL, 0);
 	if (ret)
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
