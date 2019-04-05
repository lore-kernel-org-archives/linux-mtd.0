Return-Path: <SRS0=PylK=SH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A8A2C4360F
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2019 10:07:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A879217D4
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2019 10:07:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VESO916x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A879217D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dhHDIDwfOvlSvGfLQlFhVKRscxBqkvqJ7rBVVOKrEyA=; b=VESO916x/BhpVA
	R5jGFiZ3hNdVRwvtB0/Mlk1EInkUKVGQUqfT0bQDiWSutY64GXwvh6jxZ7TLPBBLH5w4nq4TOUKPQ
	mH8cuGaIcPmXRQGvagbZuXNY0yq4tnfjkDGsa0scEB0iGY+2HVDqnWYSN34kLSQ1SZYB7Hgpmz1Lm
	/pGj37SZCRCzilBctHlEnTlQc8sIONjUDbxSXuiNIA0wbjsv5ukb55zj6KX2g8AGVUWNOaPUUhFtu
	DzsGXf9nJAcRAvo6WHWTJifEZCEhqzAybV7IZnyaR50BmOMWCLMmZJ/NMqaOQdLRPZdK1xCKA9s07
	19pfV6HBFsj0fM1aAL1g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCLlG-0000qr-Uv; Fri, 05 Apr 2019 10:07:50 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCLlD-0000q9-Q6
 for linux-mtd@lists.infradead.org; Fri, 05 Apr 2019 10:07:49 +0000
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1hCLlB-0000RS-To; Fri, 05 Apr 2019 12:07:45 +0200
Received: from sha by dude.hi.pengutronix.de with local (Exim 4.92-RC6)
 (envelope-from <sha@pengutronix.de>)
 id 1hCLlA-0008J7-Kk; Fri, 05 Apr 2019 12:07:44 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 08/10] mtd: rawnand: gpmi: Drop unnecessary restoring of
 previous chipselection
Date: Fri,  5 Apr 2019 12:07:38 +0200
Message-Id: <20190405100740.5074-9-s.hauer@pengutronix.de>
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
X-CRM114-CacheID: sfid-20190405_030748_009042_4704E8B2 
X-CRM114-Status: GOOD (  13.54  )
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

The i.MX23 specific option read code is called right after nand_scan. We
can rely on the nand core having disabled the chipselect, so there's no
point in restoring the original chipselect after nand operations. Drop
it.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index c1d2e6d12e61..bbf9e6a878b8 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -2526,13 +2526,11 @@ static int mx23_check_transcription_stamp(struct gpmi_nand_data *this)
 	unsigned int stride;
 	unsigned int page;
 	uint8_t *buffer = chip->data_buf;
-	int saved_chip_number;
 	int found_an_ncb_fingerprint = false;
 
 	/* Compute the number of strides in a search area. */
 	search_area_size_in_strides = 1 << rom_geo->search_area_stride_exponent;
 
-	saved_chip_number = this->current_chip;
 	nand_select_target(chip, 0);
 
 	/*
@@ -2560,10 +2558,7 @@ static int mx23_check_transcription_stamp(struct gpmi_nand_data *this)
 
 	}
 
-	if (saved_chip_number >= 0)
-		nand_select_target(chip, saved_chip_number);
-	else
-		nand_deselect_target(chip);
+	nand_deselect_target(chip);
 
 	if (found_an_ncb_fingerprint)
 		dev_dbg(dev, "\tFound a fingerprint\n");
@@ -2587,7 +2582,6 @@ static int mx23_write_transcription_stamp(struct gpmi_nand_data *this)
 	unsigned int stride;
 	unsigned int page;
 	uint8_t      *buffer = chip->data_buf;
-	int saved_chip_number;
 	int status;
 
 	/* Compute the search area geometry. */
@@ -2604,8 +2598,6 @@ static int mx23_write_transcription_stamp(struct gpmi_nand_data *this)
 	dev_dbg(dev, "\tin Strides: %u\n", search_area_size_in_strides);
 	dev_dbg(dev, "\tin Pages  : %u\n", search_area_size_in_pages);
 
-	/* Select chip 0. */
-	saved_chip_number = this->current_chip;
 	nand_select_target(chip, 0);
 
 	/* Loop over blocks in the first search area, erasing them. */
@@ -2637,11 +2629,7 @@ static int mx23_write_transcription_stamp(struct gpmi_nand_data *this)
 			dev_err(dev, "[%s] Write failed.\n", __func__);
 	}
 
-	/* Deselect chip 0. */
-	if (saved_chip_number >= 0)
-		nand_select_target(chip, saved_chip_number);
-	else
-		nand_deselect_target(chip);
+	nand_deselect_target(chip);
 
 	return 0;
 }
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
