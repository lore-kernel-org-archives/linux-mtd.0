Return-Path: <SRS0=f8pO=NJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0859DC4338F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 10:10:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C45A660524
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 10:10:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C45A660524
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AeGZ/rn8Lm+FyRQZXLx5/sFJAS1grwhatzvtPj9AHBA=; b=rdr3nnS6rXtPKY
	qcHHOyCPc52AByIpTpOBfXrV4aPCpKdKJqsNPZP/ZcHYD7sFPv/4e8cs+dfyUEP9HULu+hCoBK+sJ
	zacc7bYnsPQC8V/QtwZvQp2YJeLg+FwIFX9xoTwjkaDafs4k0KgoS8tw2dnGnhzlQ7G89zS8JSPy6
	hrBIpSDzo7FrP9vYykGRRaw6OfdfTeXBrGVgcesoK7TuFx7OdVqDiPjrXxZ+YX82sDatvP4/6ZgNk
	QyM9WFV4J38s6ddQ/Rsbr+ixqF5qKE4jRM3tBRtwhI+wqhbnpE4daBgqUeOGf9i15Q4C9oeBbYOq9
	F6SaZP6mSn9IhWb5CYqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGIW0-0052wj-TL; Wed, 18 Aug 2021 10:09:44 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGIVi-0052r7-Lh
 for linux-mtd@lists.infradead.org; Wed, 18 Aug 2021 10:09:30 +0000
Received: by mail-vs1-xe36.google.com with SMTP id s19so1391980vsl.11
 for <linux-mtd@lists.infradead.org>; Wed, 18 Aug 2021 03:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oSMbBaxj5kYnNMOz3HCW8c2GlUKNZpl4G8kt8vaDvcU=;
 b=NUh5EB/TshJuP06sY5queTXRGXqZEcl6UMqE3f6o4C7Yia1aQ7YYVwjSqato7REGKR
 ytMlzGxdm1dXPtaK5whOZ0H7rSbvF5peR2wviaOGrorE6BcPYImZyUzulxDwUsFPuWLL
 5meVhpkcaBkJDevWoxCSWZsvC5nJ7ZnpAY2bGN7+nkDxVClk3HURgKAukKwevldHPSBd
 uKsOCzfFz4fP/YbEiE46NuL+3ooaMnSQgmklXAz6fLHlvgEGNgwEPm1JpSu0mHG8iX+S
 G1rewHtqg4EDw2hrAD1fMBl1z5/lSpUx+/rIUDOZ+tcCTRi6DZjOeA44wsHIAFoqgBbV
 KNmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oSMbBaxj5kYnNMOz3HCW8c2GlUKNZpl4G8kt8vaDvcU=;
 b=AK5/sw0eZHGejMfrAWxRPPoPwMcCX+HZ2/x39Jist7rf21I61TMoRdhnubtNNxOuT1
 qR/GaS6SeXjU7vB6/t+UUWDJjLkdlyvoafg2gZJCCDOEjw+Us4l//S/3RNkMECPpzVyA
 IAQyEvJ6TIXlBbyWFlpbGUsOw3o+tIzbfVFCtkOrIrooBir7Nv9643bnRUtqAfFpFkHA
 1SKkxHjE6/smM8yQFOYe/AwNB2jWtYGKme5PbRwBJ71P10epXzmSA3S1s247C+iai8TE
 QsDTKXleA0M1i9TfXk3+8CDaZNYucPvSDEPIkfFpeCOwXs4rxXsuolqAq7apLvTniLHX
 JSPQ==
X-Gm-Message-State: AOAM531kGBTFw3FRS3YmdMR6X7PxJPfe6zq92hhax4kf+m2RMFL/1JO7
 IbGNeCUUpPtxiX+2CtrHsXw/CVkBkpMlppk4u8pkWg==
X-Google-Smtp-Source: ABdhPJxX5vUHiF4S9rKI8AwIyB37h/2agUjbKLWH1bKK7BdK0tRX0vp1siQiAlDeJWpHDBxGhS/HHDjvQsTJxQC3MTQ=
X-Received: by 2002:a05:6102:5f4:: with SMTP id
 w20mr6416911vsf.34.1629281364036; 
 Wed, 18 Aug 2021 03:09:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210818043131.7klajx6drvvkftoc@vireshk-i7>
 <a2a3c41f-c5e4-ee7e-7d48-03af8bac8863@gmail.com>
 <20210818045307.4brb6cafkh3adjth@vireshk-i7>
 <080469b3-612b-3a34-86e5-7037a64de2fe@gmail.com>
 <20210818055849.ybfajzu75ecpdrbn@vireshk-i7>
 <f1c76f23-086d-ef36-54ea-0511b0ebe0e1@gmail.com>
 <20210818062723.dqamssfkf7lf7cf7@vireshk-i7>
 <CAPDyKFrZqWtZOp4MwDN6fShoLLbw5NM039bpE3-shB+fCEZOog@mail.gmail.com>
 <20210818091417.dvlnsxlgybdsn76x@vireshk-i7>
 <CAPDyKFrVxhrWGr2pKduehshpLFd_db2NTPGuD7fSqvuHeyzT4w@mail.gmail.com>
 <20210818095044.e2ntsm45h5cddk7s@vireshk-i7>
In-Reply-To: <20210818095044.e2ntsm45h5cddk7s@vireshk-i7>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 18 Aug 2021 12:08:47 +0200
Message-ID: <CAPDyKFrFF00xGDWPCQnPwF0_QkG4TB2UqggpuBpp8LY_CMKP-A@mail.gmail.com>
Subject: Re: [PATCH v8 01/34] opp: Add dev_pm_opp_sync() helper
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Viresh Kumar <vireshk@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, Peter Chen <peter.chen@kernel.org>, 
 Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>, 
 Stefan Agner <stefan@agner.ch>, Adrian Hunter <adrian.hunter@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>, 
 Linux PM <linux-pm@vger.kernel.org>, Linux USB List <linux-usb@vger.kernel.org>,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-mmc <linux-mmc@vger.kernel.org>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 DTML <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_030926_756984_4765AC41 
X-CRM114-Status: GOOD (  25.03  )
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

On Wed, 18 Aug 2021 at 11:50, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 18-08-21, 11:41, Ulf Hansson wrote:
> > On Wed, 18 Aug 2021 at 11:14, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > > What we need here is just configure. So something like this then:
> > >
> > > - genpd->get_performance_state()
> > >   -> dev_pm_opp_get_current_opp() //New API
> > >   -> dev_pm_genpd_set_performance_state(dev, current_opp->pstate);
> > >
> > > This can be done just once from probe() then.
> >
> > How would dev_pm_opp_get_current_opp() work? Do you have a suggestion?
>
> The opp core already has a way of finding current OPP, that's what
> Dmitry is trying to use here. It finds it using clk_get_rate(), if
> that is zero, it picks the lowest freq possible.
>
> > I am sure I understand the problem. When a device is getting probed,
> > it needs to consume power, how else can the corresponding driver
> > successfully probe it?
>
> Dmitry can answer that better, but a device doesn't necessarily need
> to consume energy in probe. It can consume bus clock, like APB we
> have, but the more energy consuming stuff can be left disabled until
> the time a user comes up. Probe will just end up registering the
> driver and initializing it.

That's perfectly fine, as then it's likely that it won't vote for an
OPP, but can postpone that as well.

Perhaps the problem is rather that the HW may already carry a non-zero
vote made from a bootloader. If the consumer driver tries to clear
that vote (calling dev_pm_opp_set_rate(dev, 0), for example), it would
still not lead to any updates of the performance state in genpd,
because genpd internally has initialized the performance-state to
zero.

Dmitry?

>
> --
> viresh

Kind regards
Uffe

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
