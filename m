Return-Path: <SRS0=o/Ze=DH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 973E0C2D0A8
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 07:53:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22C842075F
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 07:53:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q/7LniW8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22C842075F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sJWrHPDxiLHj9Upd7SgAePxPb87wXdNoXjGgaYqKsuE=; b=Q/7LniW80We8dHEOGUIwcGuLy
	PGPsOPUO+PJjRtw69VBQlfJeOlGG73QVLPjYIxFHs1pyFFc9RqTcPzHFI8pjdoYImx9LL2kSfpCjG
	ATOXeHfF4R3Z6qxDzfvvCZPtrHZguIN4uAhD708dsNlgOVKRENyKwNQjqxuutVEKFmJcoy5gx8WOv
	vOxQ5JqZ1acpv10MQuSXNIr2BZLnnhVOlBXmvBvj7QeIfQs0dT+dycOipFDhl8UBwv55gUWtzA8Og
	//ktoiX9qKsuxNNazFu/0o7/pCH49i+nAWUqGdt02qwOsMHC0rLmRBz04L35SOiLv9TU5679EXTsA
	N6vO/olmw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNWvN-0006SH-DP; Wed, 30 Sep 2020 07:53:17 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNWvK-0006Qy-He
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2020 07:53:15 +0000
Received: from windsurf.home (lfbn-tou-1-420-199.w86-206.abo.wanadoo.fr
 [86.206.245.199])
 (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 8A2E5240011;
 Wed, 30 Sep 2020 07:53:09 +0000 (UTC)
Date: Wed, 30 Sep 2020 09:53:08 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 01/20] mtd: nand: ecc: Add an I/O request tweaking
 mechanism
Message-ID: <20200930095308.57acb670@windsurf.home>
In-Reply-To: <20200929230124.31491-2-miquel.raynal@bootlin.com>
References: <20200929230124.31491-1-miquel.raynal@bootlin.com>
 <20200929230124.31491-2-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_035314_738479_03FDC020 
X-CRM114-Status: GOOD (  11.79  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Julien Su <juliensu@mxic.com.tw>,
 Richard Weinberger <richard@nod.at>, ycllin@mxic.com.tw,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

On Wed, 30 Sep 2020 01:01:05 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> +	/* Ensure the request covers the entire page */
> +	if (true) {//todo (orig->datalen < nanddev_page_size(nand)) {

This TODO and "if (true)" looks odd.

> +		ctx->bounce_data = true;
> +		tweak->dataoffs = 0;
> +		tweak->datalen = nanddev_page_size(nand);
> +		tweak->databuf.in = ctx->spare_databuf;
> +		memset(tweak->databuf.in, 0xFF, ctx->page_buffer_size);
> +	}
> +
> +	if (true) {//todo (orig->ooblen < nanddev_per_page_oobsize(nand)) {

Ditto.

Also, I find the wording "tweak" a bit vague, "tweak" really means
nothing specific. What about prepare/unprepare instead of tweak/restore ?

Also, shouldn't nand_ecc_init_req_tweaking() also allocate the struct
nand_ecc_req_tweak_ctx so that this structure remains internal ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
