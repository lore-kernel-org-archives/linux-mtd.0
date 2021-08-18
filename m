Return-Path: <SRS0=f8pO=NJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A415BC4338F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 08:36:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A46260C3E
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 08:36:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6A46260C3E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9u0aIE7OGTzIR4hqEF7SCleFNCPtjOenQGiOywokQsc=; b=gEn/YNarAb1TDb
	G4sXJEvtYpMLNOrekKJQ/Ubc47NLuV5CWWddgnded39eqr7lwEw7qULeMSNjqY7oLMR53X6Xnjlbi
	bY3nd7RXOggerlJKgwhlw7XF3PmEqd458xXm1DtKJjVMe5G1sV1Mvopd8k7DxHcByutW8X5DNPiMS
	oX3oaHEZRiGKuY6atG6mKvEq2KVWZChfUKbkvHv50veShIsFN0p49lkyCSpu8EEl3nhjGFW4dhRRl
	hOgwxSHq5aK0sb63zBwP+JQ/bqdATCHCMGMmWEOJH7T/jzfvzA3P66eiG9YTlPLV5I2AdSuBC89Z1
	3QEKRanjW6y6Ajus1Amg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGH3D-004fQR-Je; Wed, 18 Aug 2021 08:35:55 +0000
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGH36-004fOU-Gl
 for linux-mtd@lists.infradead.org; Wed, 18 Aug 2021 08:35:54 +0000
Received: by mail-vs1-xe31.google.com with SMTP id i1so1273045vsk.8
 for <linux-mtd@lists.infradead.org>; Wed, 18 Aug 2021 01:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xSrv+O3TCSW7cnAdJHoCzYxKAHMXFEbzmyCWpuUlKoA=;
 b=RvY/jkXxbAxhbejbhMhOx5m5pFICa1DjcAOGeLJ7Wj4+NnrlQTP43TzpsRFep1JuC0
 jjsEdR5Sfv4a46pjC5HeyNwlkFXs5ZoGbAdEHP8nbsLbwgDfxMA0VLsZ4sAxMJRV4mLW
 dSespNFG/uvXR/ZW39JUOK9BLxf8mk1WID8zgZpuFGqAaQDzTQz38k7uJeJxmgAVAmpm
 Z+x9YgOHPVn/vTMzWLFUUkw+FlGiQOiB5nzyvSzqnlo/nOvWO5fH93uQPcSphn3gJxjO
 Ww6B2AEhe5tNZTMbYBxAuxTYbw1ul/ILTwXNwMEmv6K/9UW9Wx7QIc3Fi/3JmvUSGIAc
 FWog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xSrv+O3TCSW7cnAdJHoCzYxKAHMXFEbzmyCWpuUlKoA=;
 b=RbdtpLtA5LXCbVEqjXDXWPxvAtmmE0OEGNUw/rSP5Nv2PcXoIp9OdKvYBWDVBNwvZ4
 IIAipjzBPSa/3u9hiv1OsvgI+txfPdnsv6362zavX6GiOZDuuj7/i9GPN+1/EfoaQpz1
 QmF1cT0KXP1Vuv2tRV4hlwzLbrZDgWBpWEsJFFO0YRu6Xq1UwSGNDxHpvwO2omxgXVv9
 8e0SLUHZ1SKG+lOOwTdqZktagtyWheuXvfF29L0fEPkkb9WQtZVnnS65C7aMaqizlqIo
 yDwJqqFHN3UTxE/GWu97W3OkcWM7omma5EPnBsKhWTrcmBYbV/7VBWSM10O6a/5BEHjh
 PVVA==
X-Gm-Message-State: AOAM531gEx0XcZE/ctDZpx6RxHFxWhbnlgAJ89aIeLmB8zviqCcB7jdc
 w48tTKOwpJazyrygY6bSGqYv9XRFyKuyf4axgBBv3w==
X-Google-Smtp-Source: ABdhPJxfVbNmo+y9lVXwMUpwV89/qvFiwVR66AUipk2ir89qZuIeawGetBYzPol3o/SxK7XiQzvipAWUl+UAJR794SQ=
X-Received: by 2002:a67:f6d8:: with SMTP id v24mr6490718vso.48.1629275747436; 
 Wed, 18 Aug 2021 01:35:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-12-digetx@gmail.com>
 <CAPDyKFrax-EYtO03W5QWM2tcWLWeMM8hHZCRYFcsenuiP2zObQ@mail.gmail.com>
 <YRvBkyfFCqthBIBV@orome.fritz.box>
In-Reply-To: <YRvBkyfFCqthBIBV@orome.fritz.box>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 18 Aug 2021 10:35:11 +0200
Message-ID: <CAPDyKFp+9Bv3EVSnV683ixNXzukJtmG_QrS5C1ZQqLxv9QJ-bQ@mail.gmail.com>
Subject: Re: [PATCH v8 11/34] gpu: host1x: Add runtime PM and OPP support
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Dmitry Osipenko <digetx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
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
X-CRM114-CacheID: sfid-20210818_013548_640716_86623727 
X-CRM114-Status: GOOD (  42.09  )
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

On Tue, 17 Aug 2021 at 16:03, Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Tue, Aug 17, 2021 at 02:04:38PM +0200, Ulf Hansson wrote:
> > On Tue, 17 Aug 2021 at 03:30, Dmitry Osipenko <digetx@gmail.com> wrote:
> > >
> > > Add runtime PM and OPP support to the Host1x driver. It's required for
> > > enabling system-wide DVFS and supporting dynamic power management using
> > > a generic power domain. For the starter we will keep host1x always-on
> > > because dynamic power management require a major refactoring of the driver
> > > code since lot's of code paths will need the RPM handling and we're going
> > > to remove some of these paths in the future. Host1x doesn't consume much
> > > power so it is good enough, we at least need to resume Host1x in order
> > > to initialize the power state.
> > >
> > > Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
> > > Tested-by: Paul Fertser <fercerpav@gmail.com> # PAZ00 T20
> > > Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20 and TK1 T124
> > > Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
> > > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > > ---
> >
> > [...]
> >
> > > +
> > >  static int host1x_probe(struct platform_device *pdev)
> > >  {
> > >         struct host1x *host;
> > > @@ -394,6 +423,10 @@ static int host1x_probe(struct platform_device *pdev)
> > >         /* set common host1x device data */
> > >         platform_set_drvdata(pdev, host);
> > >
> > > +       err = devm_tegra_core_dev_init_opp_table_simple(&pdev->dev);
> > > +       if (err)
> > > +               return err;
> > > +
> > >         host->regs = devm_ioremap_resource(&pdev->dev, regs);
> > >         if (IS_ERR(host->regs))
> > >                 return PTR_ERR(host->regs);
> > > @@ -423,12 +456,9 @@ static int host1x_probe(struct platform_device *pdev)
> > >                 return err;
> > >         }
> > >
> > > -       host->rst = devm_reset_control_get(&pdev->dev, "host1x");
> > > -       if (IS_ERR(host->rst)) {
> > > -               err = PTR_ERR(host->rst);
> > > -               dev_err(&pdev->dev, "failed to get reset: %d\n", err);
> > > +       err = host1x_get_resets(host);
> > > +       if (err)
> > >                 return err;
> > > -       }
> > >
> > >         err = host1x_iommu_init(host);
> > >         if (err < 0) {
> > > @@ -443,22 +473,10 @@ static int host1x_probe(struct platform_device *pdev)
> > >                 goto iommu_exit;
> > >         }
> > >
> > > -       err = clk_prepare_enable(host->clk);
> > > -       if (err < 0) {
> > > -               dev_err(&pdev->dev, "failed to enable clock\n");
> > > -               goto free_channels;
> > > -       }
> > > -
> > > -       err = reset_control_deassert(host->rst);
> > > -       if (err < 0) {
> > > -               dev_err(&pdev->dev, "failed to deassert reset: %d\n", err);
> > > -               goto unprepare_disable;
> > > -       }
> > > -
> >
> > Removing the clk_prepare_enable() and reset_control_deassert() from
> > host1x_probe(), might not be a good idea. See more about why, below.
> >
> > >         err = host1x_syncpt_init(host);
> > >         if (err) {
> > >                 dev_err(&pdev->dev, "failed to initialize syncpts\n");
> > > -               goto reset_assert;
> > > +               goto free_channels;
> > >         }
> > >
> > >         err = host1x_intr_init(host, syncpt_irq);
> > > @@ -467,10 +485,14 @@ static int host1x_probe(struct platform_device *pdev)
> > >                 goto deinit_syncpt;
> > >         }
> > >
> > > -       host1x_debug_init(host);
> > > +       pm_runtime_enable(&pdev->dev);
> > >
> > > -       if (host->info->has_hypervisor)
> > > -               host1x_setup_sid_table(host);
> > > +       /* the driver's code isn't ready yet for the dynamic RPM */
> > > +       err = pm_runtime_resume_and_get(&pdev->dev);
> >
> > If the driver is being built with the CONFIG_PM Kconfig option being
> > unset, pm_runtime_resume_and_get() will return 0 to indicate success -
> > and without calling the ->runtime_resume() callback.
> > In other words, the clock will remain gated and the reset will not be
> > deasserted, likely causing the driver to be malfunctioning.
> >
> > If the driver isn't ever being built with CONFIG_PM unset, feel free
> > to ignore my above comments.
> >
> > Otherwise, if it needs to work both with and without CONFIG_PM being
> > set, you may use the following pattern in host1x_probe() to deploy
> > runtime PM support:
> >
> > "Enable the needed resources to probe the device"
> > pm_runtime_get_noresume()
> > pm_runtime_set_active()
> > pm_runtime_enable()
> >
> > "Before successfully completing probe"
> > pm_runtime_put()
>
> We made a conscious decision a few years ago to have ARCH_TEGRA select
> PM on both 32-bit and 64-bit ARM, specifically to avoid the need to do
> this dance (though there are still a few drivers left that do this, I
> think).
>
> So I think this should be unnecessary. Unless perhaps if the sysfs PM
> controls have any influence on this. As far as I know, as long as the
> PM kconfig option is enabled, the sysfs control only influence the
> runtime behaviour (i.e. setting the sysfs PM control to "on" is going
> to force runtime PM to be resumed) but there's no way to disable
> runtime PM altogether via sysfs that would make the above necessary.

Thanks for clarifying! As I said, feel free to ignore my comments then.

For this and the other patches in the series, I assume you only need
to care about whether the driver is a cross SoC driver and used on
other platforms than Tegra then.

>
> Thierry

Kind regards
Uffe

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
