Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ADDCC54E41
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Mar 2024 14:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NSu6ELN6gDoEh2qE/YSI9bWnCLtAK7NFBuhu/Ay1lQU=; b=hxa+ZUpOtf26+7
	vK+Q19vh05HtzWhPPq+iKn0LHhQ3wtj6jRitaf8hVHIQ4YidBCZ+uOonnDG1szmDj74CclY7M6jM+
	B/ZUKW+AfdIktTyxQsXIZFmPZJn5s/8Tl1jUMvY4hicJAo2oJL87050mQOoBhw24bK9U4Y4QN27H0
	spJO0fJUag+8bJJ+kICJOzBBfN06S3322vadm1i3u8ltnLW0tXcuSrGpVRxvIyR3Fj2OIHJipz324
	iaRRFTMroF/gaI8vt4UP0jNuQfpNrgcPWbHUVa16WubYSSTw1weRZv5l8DsN2Tu1gAs98YiJDZzrS
	bGtdf+I2lIxgLPkBDHAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhsNb-00000000bYa-0cCv;
	Wed, 06 Mar 2024 14:36:23 +0000
Received: from mail.thorsis.com ([92.198.35.195])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhsNX-00000000bTr-2QSg
	for linux-mtd@lists.infradead.org;
	Wed, 06 Mar 2024 14:36:21 +0000
Date: Wed, 6 Mar 2024 15:36:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=default;
	t=1709735767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type;
	bh=7jCdvnKrinLLfLtx8TMEpiZHox5gBJf77z1PKz+bvrY=;
	b=d6/6q03CvvzyUSka3C4XlwHu/RNS/55OXwRb9mJjGJt7/POiqIpjeTLHh88hJA3losJf3A
	xU7eAy4X/6xNLKafzNq/48HPDXxJNMt3Y/OaXDV4ecXWp3BdHyt4Z2f769DEely3mIjA2g
	dpjTGksTmm0p9GPFhyyDfZQyj/MJcr8IQalifYToxtlslCcYp56mD9FhBT8mcsnSvKXjja
	Da8+fZpN2cnu4rZAZH6q04YcYVLR1IY6ng11Ryv833Podj6ZI05N59Koz+8moL7sDIg5Se
	CJdPZ4Ig3nNw2s9DRFKUXNWL4MAjGLOSHxpOJYdFs3wQMSDAq0zUSeXSQY4n8w==
From: Alexander Dahl <ada@thorsis.com>
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
Subject: mtd: nand: raw: Possible bug in nand_onfi_detect()?
Message-ID: <20240306-shaky-bunion-d28b65ea97d7@thorsis.com>
Mail-Followup-To: linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_063619_885087_C2AE27EA 
X-CRM114-Status: GOOD (  14.76  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello everyone,

I think I found a bug in nand_onfi_detect() which was introduced with
commit c27842e7e11f ("mtd: rawnand: onfi: Adapt the parameter page
read to constraint controllers") back in 2020.

Background on how I found this: I'm currently struggling getting raw
nand flash access to fly with an at91 sam9x60 SoC and a S34ML02G1
Spansion SLC raw NAND flash on a custom board.  The setup is
comparable to the sam9x60 curiosity board and can be reproduced with
that one.

NAND flash on sam9x60 curiosity board works fine with what is in
mainline Linux kernel.  However after removing the line 'rb-gpios =
<&pioD 5 GPIO_ACTIVE_HIGH>;' from at91-sam9x60_curiosity.dts all data
read from the flash appears to be zeros only.  (I did not add that
line to the dts of my custom board first, this is how I stumbled over
this.)

I have no explanation for that behaviour, it should work without R/B#
by reading the status register, maybe we investigate that
in depth later.  However those all zeros data reads happens when
reading the ONFI param page as well es data read from OOB/spare area
later and I bet it's the same with usual data.

This read error reveals a bug in nand_onfi_detect().  After setting
up some things there's this for loop:

    for (i = 0; i < ONFI_PARAM_PAGES; i++) {

For i = 0 nand_read_param_page_op() is called and in my case all zeros
are returned and thus the CRC calculated does not match the all zeros
CRC read.  So the usual break on successful reading the first page is
skipped and for reading the second page nand_change_read_column_op()
is called.  I think that one always fails on this line:

    if (offset_in_page + len > mtd->writesize + mtd->oobsize) {

Those variables contain the following values:

    offset_in_page: 256
    len: 256
    mtd->writesize: 0
    mtd->oobsize: 0

The condition is true and nand_change_read_column_op() returns with
-EINVAL, because mtd->writesize and mtd->oobsize are not set yet in
that code path.  Those are probably initialized later, maybe with
parameters read from that ONFI param page?

Returning with error from nand_change_read_column_op() leads to
jumping out of nand_onfi_detect() early, and no ONFI param page is
evaluated at all, although the second or third page could be intact.

I guess this would also fail with any other reason for not matching
CRCs in the first page, but I have not faulty NAND flash chip to
confirm that.

Greets
Alex


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
