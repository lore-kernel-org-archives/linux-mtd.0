Return-Path: <SRS0=NG3o=T4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4820C04AB6
	for <linux-mtd@archiver.kernel.org>; Tue, 28 May 2019 10:41:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 856252081C
	for <linux-mtd@archiver.kernel.org>; Tue, 28 May 2019 10:41:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UGfjoIHk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 856252081C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mYJiCg/vfeSsxJvV1+EN9qh0+rz/Br8oAHUINqa5LAw=; b=UGfjoIHkv/Jbq1
	HdCUObUUJ31wKY1o9rg9u34AlK7SgxJGjgGxOEN0/SRg97TKzuMYqkAgKX3WvMp3tCun3r+EY3c9g
	00iuef9Ed2K/28OyQXdYiV768SbteeuugqD1CR6Z947lYeq9Jst08pgM0Mm/8B48J43LhBoAXwlWA
	3Hx31XuhAAzQlpDNDfE5UkeW4I75aqo+QaXnOZqxbLtC9Au2eHc1S+ZnxY8vFzBNHzLwvguJewLM9
	DxIYwKnbJZiePkic+eUBvLqAuS7u3rvEI4JOF3Q0iJfII+2AgXzXJ/PKit51X/+coR7Z+Jrd/s/TA
	SRM4vyzL/4OxWJDViMPg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVZXR-0000yT-PT; Tue, 28 May 2019 10:41:01 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVZXO-0000xy-Gx
 for linux-mtd@lists.infradead.org; Tue, 28 May 2019 10:41:00 +0000
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1hVZXM-0004z1-HO; Tue, 28 May 2019 12:40:56 +0200
Received: from sha by dude.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1hVZXL-0006P3-Sj; Tue, 28 May 2019 12:40:55 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: rawnand: gpmi: check nand_read_page_op() return value
Date: Tue, 28 May 2019 12:40:54 +0200
Message-Id: <20190528104054.21018-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190528_034058_718245_F1D24B76 
X-CRM114-Status: GOOD (  16.40  )
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
Cc: Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 kernel@pengutronix.de, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

nand_read_page_op() can fail, so check its return value and bail out
with an error when necessary.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 38 ++++++++++++++++++----
 1 file changed, 31 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index e0080dcd4fc0..5db84178edff 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -1451,11 +1451,14 @@ static int gpmi_ecc_read_page(struct nand_chip *chip, uint8_t *buf,
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct bch_geometry *geo = &this->bch_geometry;
 	unsigned int max_bitflips;
+	int ret;
 
 	gpmi_bch_layout_std(this);
 	this->bch = true;
 
-	nand_read_page_op(chip, page, 0, buf, geo->page_size);
+	ret = nand_read_page_op(chip, page, 0, buf, geo->page_size);
+	if (ret)
+		return ret;
 
 	max_bitflips = gpmi_count_bitflips(chip, buf, 0,
 					   geo->ecc_chunk_count,
@@ -1495,6 +1498,7 @@ static int gpmi_ecc_read_subpage(struct nand_chip *chip, uint32_t offs,
 	int first, last, marker_pos;
 	int ecc_parity_size;
 	int col = 0;
+	int ret;
 
 	/* The size of ECC parity */
 	ecc_parity_size = geo->gf_len * geo->ecc_strength / 8;
@@ -1546,7 +1550,9 @@ static int gpmi_ecc_read_subpage(struct nand_chip *chip, uint32_t offs,
 
 	this->bch = true;
 
-	nand_read_page_op(chip, page, col, buf, page_size);
+	ret = nand_read_page_op(chip, page, col, buf, page_size);
+	if (ret)
+		return ret;
 
 	dev_dbg(this->dev, "page:%d(%d:%d)%d, chunk:(%d:%d), BCH PG size:%d\n",
 		page, offs, len, col, first, n, page_size);
@@ -1651,12 +1657,16 @@ static int gpmi_ecc_read_oob(struct nand_chip *chip, int page)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct gpmi_nand_data *this = nand_get_controller_data(chip);
+	int ret;
 
 	/* clear the OOB buffer */
 	memset(chip->oob_poi, ~0, mtd->oobsize);
 
 	/* Read out the conventional OOB. */
-	nand_read_page_op(chip, page, mtd->writesize, chip->oob_poi, mtd->oobsize);
+	ret = nand_read_page_op(chip, page, mtd->writesize, chip->oob_poi,
+				mtd->oobsize);
+	if (ret)
+		return ret;
 
 	/*
 	 * Now, we want to make sure the block mark is correct. In the
@@ -1665,7 +1675,9 @@ static int gpmi_ecc_read_oob(struct nand_chip *chip, int page)
 	 */
 	if (GPMI_IS_MX23(this)) {
 		/* Read the block mark into the first byte of the OOB buffer. */
-		nand_read_page_op(chip, page, 0, chip->oob_poi, 1);
+		ret = nand_read_page_op(chip, page, 0, chip->oob_poi, 1);
+		if (ret)
+			return ret;
 	}
 
 	return 0;
@@ -1714,8 +1726,12 @@ static int gpmi_ecc_read_page_raw(struct nand_chip *chip, uint8_t *buf,
 	size_t oob_byte_off;
 	uint8_t *oob = chip->oob_poi;
 	int step;
+	int ret;
 
-	nand_read_page_op(chip, page, 0, tmp_buf, mtd->writesize + mtd->oobsize);
+	ret = nand_read_page_op(chip, page, 0, tmp_buf,
+				mtd->writesize + mtd->oobsize);
+	if (ret)
+		return ret;
 
 	/*
 	 * If required, swap the bad block marker and the data stored in the
@@ -1928,6 +1944,7 @@ static int mx23_check_transcription_stamp(struct gpmi_nand_data *this)
 	unsigned int page;
 	u8 *buffer = nand_get_data_buf(chip);
 	int found_an_ncb_fingerprint = false;
+	int ret;
 
 	/* Compute the number of strides in a search area. */
 	search_area_size_in_strides = 1 << rom_geo->search_area_stride_exponent;
@@ -1949,7 +1966,10 @@ static int mx23_check_transcription_stamp(struct gpmi_nand_data *this)
 		 * Read the NCB fingerprint. The fingerprint is four bytes long
 		 * and starts in the 12th byte of the page.
 		 */
-		nand_read_page_op(chip, page, 12, buffer, strlen(fingerprint));
+		ret = nand_read_page_op(chip, page, 12, buffer,
+					strlen(fingerprint));
+		if (ret)
+			continue;
 
 		/* Look for the fingerprint. */
 		if (!memcmp(buffer, fingerprint, strlen(fingerprint))) {
@@ -2081,9 +2101,13 @@ static int mx23_boot_init(struct gpmi_nand_data  *this)
 
 		/* Send the command to read the conventional block mark. */
 		nand_select_target(chip, chipnr);
-		nand_read_page_op(chip, page, mtd->writesize, &block_mark, 1);
+		ret = nand_read_page_op(chip, page, mtd->writesize, &block_mark,
+					1);
 		nand_deselect_target(chip);
 
+		if (ret)
+			continue;
+
 		/*
 		 * Check if the block is marked bad. If so, we need to mark it
 		 * again, but this time the result will be a mark in the
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
