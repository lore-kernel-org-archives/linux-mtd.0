Return-Path: <SRS0=6Wn1=P7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18A32C282C0
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 08:55:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC796217F5
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 08:55:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EZfHaKDW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ShPiD7+O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC796217F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0WaAq9J8C9djiV9t1itEiyybJshnxJYaL2K5DL1MeM4=; b=EZfHaKDWrW7TCh
	HUy4SBVVVO2+y6Y0bwjKMsXj6EAm1Wlp/fWgP0VGUlvXd53RABsNpjgINqqlNfjwV2cGTyj57zW4h
	XupdRMTbZIQJyY52qGK+5M7Jy6u1HmoqBSBHJj+fj/2DaMNSMDeLOlyak59VX8OUMbn0t5NNc9YKO
	SzyXS5o2MEVSpeP1cmLT5eJTAX28Es3GDOkjS8shwZIC1i+AmzaMj6o04RrHlQVY8e6/YeA0pSfKe
	fllL4wiex3CUbAAa0wFXgx7yYr9tLSx5U3xYm8FVdl6GBBLaGvgcNy42cs3+ku682mOFDsEgNyT7K
	cSRQ6Tgb9uX8i/nainww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmEJZ-0004NP-5c; Wed, 23 Jan 2019 08:55:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmEJV-0004N5-NJ
 for linux-mtd@lists.infradead.org; Wed, 23 Jan 2019 08:55:15 +0000
Received: from bbrezillon (unknown [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BFCC1217F5;
 Wed, 23 Jan 2019 08:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548233712;
 bh=Mg8nZ6xyqq+7q9oq4TGP51nj69QVApQKf4sETYDaWJE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ShPiD7+OVDtaHxLbAOtiUrRvBv4gOlYROArntYvL3pUfZ2+0DktDKFtbqVocr/Cba
 UFtZgEBlQkjBCjomsRF4d8QspRuNcTTUYOs9jyBZHc4QjUpzOqzsYr5nOaNbecyuCk
 wXyhasFq1oSdTZd/vGkydMprsyxB5e5s/O+1C7ZA=
Date: Wed, 23 Jan 2019 09:55:04 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Stefan Roese <sr@denx.de>
Subject: Re: [PATCH] mtd: spinand: Add support for GigaDevice GD5F1GQ4UC
Message-ID: <20190123095504.7857ca34@bbrezillon>
In-Reply-To: <870af691-e8d3-cd91-5a55-6478ef885446@denx.de>
References: <20190122145632.17547-1-sr@denx.de>
 <20190122175346.602894e4@bbrezillon>
 <263cbd32-b7d4-e440-c92d-4f24f5af27a0@denx.de>
 <20190123085202.0db528ac@bbrezillon>
 <870af691-e8d3-cd91-5a55-6478ef885446@denx.de>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190123_005513_792591_44EA78A4 
X-CRM114-Status: GOOD (  13.32  )
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
Cc: linux-mtd@lists.infradead.org, Chuanhong Guo <gch981213@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 23 Jan 2019 09:23:47 +0100
Stefan Roese <sr@denx.de> wrote:

> > This one doesn't, incremental mode (-i) should.  
> 
> Here you go:
> 
> # ./nandbiterrs /dev/mtd5 -k -i
> incremental biterrors test
> Failed to recover 1 bitflips
> Read error after 0 bit errors per page
> 
> I'm still unsure how this helps here.

It helps, it tells us the ECC doesn't work properly (fails to recover
one bitflip), or maybe it's the raw accessors that don't don't work.

> Is there anything else I should test?

Add traces to the get_ecc_status() func and print the status value.
> 
> www.gigadevice.com/datasheet/gd5f1gq4xexxg/
> 
> Looking again, its "GD5F1GQ4UExxG" on the GigaDevice webpage and
> in the datasheet, 0xd1 references "GD5F1GQ4U". So I should change
> the chip name to "GD5F1GQ4UExxG" instead.

Yes, please do that.

> 
> Sorry for the confusion here.

No problem.

> 
> I'll try to enhance the ecc_get_status() function to also read the
> status register at addr 0xf0 for the ECCSE0/1 bits to determine a
> more fine grained ECC information for this chip.

Let's first figure out why nandbiterrs fails to correct 1 bitflip.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
