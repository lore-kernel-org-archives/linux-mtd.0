Return-Path: <SRS0=qXjq=NL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79F46C4338F
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Aug 2021 12:58:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42DD86101A
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Aug 2021 12:58:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 42DD86101A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/sWXQoa+vaCshAAbKuRt14mf5QxNi2kTi+H93QXGiaM=; b=gQHML06exVpW6M
	MGtG1wPPsapZZZnorqwRMjg7fy1L5hpwhbg1XletVpcstvM1R3vAfLj+JVwiHX8KKCIuXkUyy5R9f
	FY8ubhlTdK0przgfLdcfFhJf6MCE7lNviI9y9tlEJL66SzDf7tJSz/C17tl2vk0SJdKZk9t/Wv0tm
	58pn9QF2cLKxzzsVjWKmf4luvnmjt9Cu1/QMJa0uGUH8OsNFiOI+xXBWHa5KeS7cxQI9zGpJy9NAZ
	Cii2XzNilCsQXPAN4rSFXax9oqWQ8hMFvMLShrUBfeCF4X1jY87MlOBp86aoGWZk7Pi6FAPZO7EaW
	Zhq04suSCUg/ZrGZcXeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH46A-00BD5Z-F4; Fri, 20 Aug 2021 12:58:14 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH464-00BD3l-TZ
 for linux-mtd@lists.infradead.org; Fri, 20 Aug 2021 12:58:12 +0000
Received: by mail-vs1-xe35.google.com with SMTP id d16so6091167vsf.12
 for <linux-mtd@lists.infradead.org>; Fri, 20 Aug 2021 05:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VSaFeBdX4kWGJjrK0LDIdAG7HMHyEVXfRCzRhlCm2Vc=;
 b=DnhQLGM/mJBYM14dOuxq+G21zQDLVubpP7oZsUxJRpqY3uVOSAs9B5niS+x3uyTre7
 OY65Ox4XCQkPwIIGObNgixcuUbaA0/pd1FB1Qo2ODsYfIBziSCun36IE9isJ3506pXpF
 1ecf2r9wVgXbr/9QFjwW0VOiK0pGJUOmyNQXonlOuHCAOSpdd8cj85h6sjjS6N0HUfRU
 JG2biriboTkHUtYnQwws5fcglapOqHqn2aq4ItDnRLAMkRsQbfB5v6w1xfxzn4Mat3vo
 rreigmWF3PCK6SScj/XbW99E8SMa2IrssaqGiq9CflV2XUtvkisBvF3/Z2VuEfCmGOrP
 jh6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VSaFeBdX4kWGJjrK0LDIdAG7HMHyEVXfRCzRhlCm2Vc=;
 b=TC7oj0NrGAVcqBPmLdGYRqlfPBuHyci/eE4VaLp8Wny5A9lq4PuqSiP10p8JjGxDw4
 LZ8iDClwboWoVxCOpHSApKUk5RPi3BJsHIKFu2EsWsnS1RkDHEDsxQRyIbmy2M6mtmBi
 zO5eR/UIXcAT+oRjv6LIas8x6i7YdxwhToiOf3YDZqFaZTUbKPiwqMbQUaZKpytW9ys6
 /5KE6KCcbEGiBh7C3Kn2ioP2CsOzP+wkcgtAkEpz9nUvwzUIpGNZXIfuq3fbIoODqE2M
 nMgWDU6s3hQOufL/qiou9fNbFylrmyq+yk1tIYG/RAXlqMGqhVt+RoQKLJ3qcPmUNbWO
 MaEg==
X-Gm-Message-State: AOAM532BL2dJxgaTiCa5U60zRdnoI3e1IzUauNkNDAnlIJD0MLYg0YBQ
 t6mVytRS2Mn+jTntQKMbiYRdgzC+fQ2iceyd61FRAA==
X-Google-Smtp-Source: ABdhPJyCu5OoKXB/ZnU0BhDnI9FQ/nriFA8C9gxuFpc66zGzEUSQ7NZWEdQGpN5i65y/ydiL4YG1C5HABdRFQK6zhTY=
X-Received: by 2002:a67:3212:: with SMTP id y18mr16683598vsy.19.1629464287428; 
 Fri, 20 Aug 2021 05:58:07 -0700 (PDT)
MIME-Version: 1.0
References: <080469b3-612b-3a34-86e5-7037a64de2fe@gmail.com>
 <20210818055849.ybfajzu75ecpdrbn@vireshk-i7>
 <f1c76f23-086d-ef36-54ea-0511b0ebe0e1@gmail.com>
 <20210818062723.dqamssfkf7lf7cf7@vireshk-i7>
 <CAPDyKFrZqWtZOp4MwDN6fShoLLbw5NM039bpE3-shB+fCEZOog@mail.gmail.com>
 <20210818091417.dvlnsxlgybdsn76x@vireshk-i7>
 <CAPDyKFrVxhrWGr2pKduehshpLFd_db2NTPGuD7fSqvuHeyzT4w@mail.gmail.com>
 <f1314a47-9e8b-58e1-7c3f-0afb1ec8e70a@gmail.com>
 <20210819061617.r4kuqxafjstrv3kt@vireshk-i7>
 <CAPDyKFpg8ixT4AEjzVLTwQR7Nn9CctjnLCDS5GwkOrAERquyxw@mail.gmail.com>
 <20210820051843.5mueqpnjbqt3zdzc@vireshk-i7>
In-Reply-To: <20210820051843.5mueqpnjbqt3zdzc@vireshk-i7>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 20 Aug 2021 14:57:31 +0200
Message-ID: <CAPDyKFo0rzHT4AhueWjyz9k2ZqUy8N6Od5pbr8sL_m0Jf2AwUg@mail.gmail.com>
Subject: Re: [PATCH v8 01/34] opp: Add dev_pm_opp_sync() helper
To: Viresh Kumar <viresh.kumar@linaro.org>, Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee.jones@linaro.org>,
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
X-CRM114-CacheID: sfid-20210820_055808_983722_0554396E 
X-CRM114-Status: GOOD (  39.89  )
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

On Fri, 20 Aug 2021 at 07:18, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 19-08-21, 16:55, Ulf Hansson wrote:
> > Right, that sounds reasonable.
> >
> > We already have pm_genpd_opp_to_performance_state() which translates
> > an OPP to a performance state. This function invokes the
> > ->opp_to_performance_state() for a genpd. Maybe we need to allow a
> > genpd to not have ->opp_to_performance_state() callback assigned
> > though, but continue up in the hierarchy to see if the parent has the
> > callback assigned, to make this work for Tegra?
> >
> > Perhaps we should add an API dev_pm_genpd_opp_to_performance_state(),
> > allowing us to pass the device instead of the genpd. But that's a
> > minor thing.
>
> I am not concerned a lot about how it gets implemented, and am not
> sure as well, as I haven't looked into these details since sometime.
> Any reasonable thing will be accepted, as simple as that.
>
> > Finally, the precondition to use the above, is to first get a handle
> > to an OPP table. This is where I am struggling to find a generic
> > solution, because I guess that would be platform or even consumer
> > driver specific for how to do this. And at what point should we do
> > this?
>
> Hmm, I am not very clear with the whole picture at this point of time.
>
> Dmitry, can you try to frame a sequence of events/calls/etc that will
> define what kind of devices we are looking at here, and how this can
> be made to work ?
>
> > > > Viresh, please take a look at what I did in [1]. Maybe it could be done
> > > > in another way.
> > >
> > > I looked into this and looked like too much trouble. The
> > > implementation needs to be simple. I am not sure I understand all the
> > > problems you faced while doing that, would be better to start with a
> > > simpler implementation of get_performance_state() kind of API for
> > > genpd, after the domain is attached and its OPP table is initialized.
> > >
> > > Note, that the OPP table isn't required to be fully initialized for
> > > the device at this point, we can parse the DT as well if needed be.
> >
> > Sure, but as I indicated above, you need some kind of input data to
> > figure out what OPP table to pick, before you can translate that into
> > a performance state. Is that always the clock rate, for example?
>
> Eventually it can be clock, bandwidth, or pstate of anther genpd, not
> sure what all we are looking for now. It should be just clock right
> now as far as I can imagine :)
>
> > Perhaps, we should start with adding a dev_pm_opp_get_from_rate() or
> > what do you think? Do you have other suggestions?
>
> We already have similar APIs, so that won't be a problem. We also have
> a mechanism inside the OPP core, frequency based, which is used to
> guess the current OPP. Maybe we can enhance and use that directly
> here.

After reading the last reply from Dmitry, I am starting to think that
the problem he is facing can be described and solved in a much easier
way.

If I am correct, it looks like we don't need to add APIs to get OPPs
for a clock rate or set initial performance state values according to
the HW in genpd.

See my other response to Dmitry, let's see where that leads us.

Kind regards
Uffe

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
