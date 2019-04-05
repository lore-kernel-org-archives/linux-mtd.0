Return-Path: <SRS0=PylK=SH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FC85C4360F
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2019 10:10:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07ABE217D4
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2019 10:10:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jaz3vM3Y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="tozUCp4J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07ABE217D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IueGCFhtGAvqRjEoDx//SG3hlmQVVkvih3kcGawHhg0=; b=jaz3vM3YjykfkS
	K7ZzuvCpdd07BUsye9i55y3SYSQnSBiXjIXSkBNjd1AXTrSskpepja6KY9tp96Yrva8dnc7ERzhWp
	AAaMSsJ9YJr7qkBNj7lziYHHRWOhzQ8XbacEFnwy5kDXinmm54TBaj5u+Bvly9xW1ebUzI5nLrHEa
	NEvVOoxBVjmSsN9vACUvY1PezLUG5X+taA9rYhcGgq6Mcfba4nO5n+Rc6tQ6Bz4tIhEFnGjG13we2
	SD7657eO31BuHI4DwNcOSqovNNGBlh3xb9QGOYsNz0zpRFMofRhVid/WobEG651M69W8ezsSVcBCC
	Mi0/DnlZlciY3bReCVcw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCLnx-0004FJ-UR; Fri, 05 Apr 2019 10:10:37 +0000
Received: from casper.infradead.org ([85.118.1.10])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCLnr-00046g-Ph
 for linux-mtd@bombadil.infradead.org; Fri, 05 Apr 2019 10:10:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=US9aLYNitKZYbRbD6JFXqqF5tQs731n6QIEuuBefjSo=; b=tozUCp4JDwPo0CZqDDqhpb6S0y
 acO3x7C3xK9WwCU/XGi0ynok4Qyl06npJs05KtG11WBaEPyQLLxTWmJnHK3EUVCaacJhp8hwkHMio
 yBZL4jB60xM0aZsgHf9zu8y8CVsd6Ox6nj6HUTePIUGCx609JFwbKQASlukCwTmnKk34zsQVgJiN3
 i1klcBpVpR+jhMwUaHh2UzcLz1qQAn9vijbMTKyhYfvdXMXXA92c0hWjOpPwWttTfidqX9lrUhLfX
 Tk6LkQxHlOTtQOj/yAVhr5yinAJXfnzojLto3xxGzAH5JS9jjjTbh1y6ir34xn+tJuHor7Cw2FAFP
 ZJt3ngrA==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCLlr-0007xB-Vd
 for linux-mtd@lists.infradead.org; Fri, 05 Apr 2019 10:10:29 +0000
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1hCLlB-0000RP-TO; Fri, 05 Apr 2019 12:07:45 +0200
Received: from sha by dude.hi.pengutronix.de with local (Exim 4.92-RC6)
 (envelope-from <sha@pengutronix.de>)
 id 1hCLlA-0008J4-KE; Fri, 05 Apr 2019 12:07:44 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 07/10] mtd: rawnand: gpmi: remove unused parameters
Date: Fri,  5 Apr 2019 12:07:37 +0200
Message-Id: <20190405100740.5074-8-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190405100740.5074-1-s.hauer@pengutronix.de>
References: <20190405100740.5074-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190405_111028_158722_C2BA8933 
X-CRM114-Status: GOOD (  14.91  )
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
Cc: Sam Lefebvre <sam.lefebvre@essensium.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de,
 Miquel Raynal <miquel.raynal@bootlin.com>, Han Xu <han.xu@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

gpmi_ecc_read_page_data uses the page parameter only for a debug printf,
so we can drop the parameter and the debug printf. Moving the oob
delivery from gpmi_ecc_read_page_data to gpmi_ecc_read_page makes the
oob_required parameter unnecessary aswell.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 34 ++++++++++++----------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 6736d76fa1fb..c1d2e6d12e61 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -1852,9 +1852,7 @@ static void block_mark_swapping(struct gpmi_nand_data *this,
 	p[1] = (p[1] & mask) | (from_oob >> (8 - bit));
 }
 
-static int gpmi_ecc_read_page_data(struct nand_chip *chip,
-				   uint8_t *buf, int oob_required,
-				   int page)
+static int gpmi_ecc_read_page_data(struct nand_chip *chip, uint8_t *buf)
 {
 	struct gpmi_nand_data *this = nand_get_controller_data(chip);
 	struct bch_geometry *nfc_geo = &this->bch_geometry;
@@ -1866,8 +1864,6 @@ static int gpmi_ecc_read_page_data(struct nand_chip *chip,
 	int           ret;
 	bool          direct = false;
 
-	dev_dbg(this->dev, "page number is : %d\n", page);
-
 	payload_phys = this->payload_phys;
 
 	if (virt_addr_valid(buf)) {
@@ -1982,6 +1978,22 @@ static int gpmi_ecc_read_page_data(struct nand_chip *chip,
 	/* handle the block mark swapping */
 	block_mark_swapping(this, buf, this->auxiliary_virt);
 
+	return max_bitflips;
+}
+
+static int gpmi_ecc_read_page(struct nand_chip *chip, uint8_t *buf,
+			      int oob_required, int page)
+{
+	struct gpmi_nand_data *this = nand_get_controller_data(chip);
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	int ret;
+
+	nand_read_page_op(chip, page, 0, NULL, 0);
+
+	ret = gpmi_ecc_read_page_data(chip, buf);
+	if (ret < 0)
+		return ret;
+
 	if (oob_required) {
 		/*
 		 * It's time to deliver the OOB bytes. See gpmi_ecc_read_oob()
@@ -1997,15 +2009,7 @@ static int gpmi_ecc_read_page_data(struct nand_chip *chip,
 		chip->oob_poi[0] = ((uint8_t *)this->auxiliary_virt)[0];
 	}
 
-	return max_bitflips;
-}
-
-static int gpmi_ecc_read_page(struct nand_chip *chip, uint8_t *buf,
-			      int oob_required, int page)
-{
-	nand_read_page_op(chip, page, 0, NULL, 0);
-
-	return gpmi_ecc_read_page_data(chip, buf, oob_required, page);
+	return ret;
 }
 
 /* Fake a virtual small page for the subpage read */
@@ -2086,7 +2090,7 @@ static int gpmi_ecc_read_subpage(struct nand_chip *chip, uint32_t offs,
 
 	/* Read the subpage now */
 	this->swap_block_mark = false;
-	max_bitflips = gpmi_ecc_read_page_data(chip, buf, 0, page);
+	max_bitflips = gpmi_ecc_read_page_data(chip, buf);
 
 	/* Restore */
 	writel(r1_old, bch_regs + HW_BCH_FLASH0LAYOUT0);
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
