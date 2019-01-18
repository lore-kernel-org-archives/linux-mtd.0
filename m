Return-Path: <SRS0=FXe4=P2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8600AC43387
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 06:36:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5472920855
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 06:36:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ggY9Hpdq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZVbK8p1A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5472920855
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ccGVReCI9iG62maEfhML6D9pxMu8xL7t4yibed3nC5U=; b=ggY9HpdqnKrlD/
	bAS8xIPwyRiQ5V+9PDCxcVwr1+lz/9gvy0B6wUd249zzY3c21I3u90eUr539YJdwRiKLmZuBmu00u
	wzb3Oqy2GZHJEVJPWjuf8ztB8QCe81n6H+8XRicRAuYBlFfz+33hnwt9LoQQRdnCufmj0B4yEoInr
	dud8Poxaw2Bb5td+mvWE80mX6KSEtivOiR+AFhf0EIsLQ8+5O8w+CNmEKlEcVbUpwS05XCjV3xyvp
	XMb1clDA/S5uaqpUUICp23hDMd2FE91b+KmB6jM92YwVFwiFboAzwm01UN/++MjFyPC/1Wt6IJU8X
	SkYLpTvzPYPS5SLeX45w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkNld-0005ZD-AK; Fri, 18 Jan 2019 06:36:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkNlZ-0005Yq-OB
 for linux-mtd@lists.infradead.org; Fri, 18 Jan 2019 06:36:35 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A580420855;
 Fri, 18 Jan 2019 06:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1547793392;
 bh=K6u4PpAlQsqUDHO/cE3DunqslA4DGa4agwLKZJW9MTo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZVbK8p1AhLSenL/w+pAgJWzZFnJAYA3FmP1jktgHsXHu5a2OhrGwtk71ZBA4A+uY/
 Hb98nciKCl0fuEQVgZyC0yNDGafjfMGWmP1ctCpqW0CS2HbM7XW1jX90La7ieS54wl
 uyCzDIsSDnWhVVWsPH2d9qaKldm5TglNjYzbMjcU=
Date: Fri, 18 Jan 2019 07:36:23 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] mtd: rawnand: fsmc: Keep bank enable bit set
Message-ID: <20190118073623.05ec4cc5@bbrezillon>
In-Reply-To: <CACRpkdY22HjSFZxCHpSz6S6C0jx9g-AwBF6+CKZjKt5zy0O3uQ@mail.gmail.com>
References: <20190109215144.15749-1-linus.walleij@linaro.org>
 <20190114095105.4e2b5c5a@bbrezillon>
 <CACRpkdY22HjSFZxCHpSz6S6C0jx9g-AwBF6+CKZjKt5zy0O3uQ@mail.gmail.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_223633_813531_CB142B6C 
X-CRM114-Status: GOOD (  17.82  )
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
Cc: Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 17 Jan 2019 22:33:01 +0100
Linus Walleij <linus.walleij@linaro.org> wrote:

> On Mon, Jan 14, 2019 at 9:51 AM Boris Brezillon <bbrezillon@kernel.org> wrote:
> 
> > Not related to this patch, but I think we're missing a nand_reset()
> > call in the ->resume() path. Without it FSMC timings might be wrong
> > after a suspend if they're not defined in the DT. Would you mind sending
> > another patch to fix that,  
> 
> I looked into it, It looks like this:
> 
> static int fsmc_nand_resume(struct device *dev)
> {
>     struct fsmc_nand_data *host = dev_get_drvdata(dev);
> 
>     if (host) {
>         clk_prepare_enable(host->clk);
>         if (host->dev_timings)
>             fsmc_nand_setup(host, host->dev_timings);

->dev_timings is only allocated if timings are defined in the DT, but
the driver can also let the framework configure the timings through the
->setup_data_interface() method (approach that should be preferred for
all new boards). In this case ->dev_timings is NULL and we need to
reset the chip to re-apply the timings.

BTW, resetting the NAND chip at resume time is a sane thing to do if
you want to start in known state, so I'd recommend adding

	nand_reset(&host->nand);

here.

>     }
> 
>     return 0;
> }
> 

Regards,

Boris

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
