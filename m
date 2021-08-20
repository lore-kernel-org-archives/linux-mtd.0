Return-Path: <SRS0=qXjq=NL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49DF3C4338F
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Aug 2021 05:19:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E93C361037
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Aug 2021 05:19:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E93C361037
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=typFxW9Q8TF/wVthhdHkfIWSL3CZG4VxrP0YWSG1Fes=; b=cSYLsy2q/Xn03r
	5nwqOHwacIEmeVgSj+psCh8qKijSwXZkSPnXqSmnHq2+N5MYwGnLez6GXiuOBb0rAd5NaLo8dLgNu
	pLsdQ31jXrtJWXJ6RdzWYlXa+chsP35Mh13jfwmk5hbSujCH3fHy/g4wLWVLzodrzBnVhgnQ0HIA3
	zqaVgGgiS0YkmkUcVVLkl/p03eUkA7I7VgCKznomVrUt3jsInrO7g+xoJNteHyULnXq0ZXMWx9nZ1
	1xm9XE7O7xDweFkB3ucShdinyLLFlX7/jyg4mt7QElDBV9SbZwIbJtphg+a5u0qJRgif/i/8mC6l/
	acWSC8vBL6t+dOPoyCUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGwvd-00A7bk-3V; Fri, 20 Aug 2021 05:18:53 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGwvX-00A7Zu-VH
 for linux-mtd@lists.infradead.org; Fri, 20 Aug 2021 05:18:51 +0000
Received: by mail-pg1-x52f.google.com with SMTP id k14so8042408pga.13
 for <linux-mtd@lists.infradead.org>; Thu, 19 Aug 2021 22:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=chAct3ipnxxeeUzw3hiYvmSC99rC9KHQnQdo3Qo5wI0=;
 b=PAK0FwHpNruccQOMJcEETGgiuehcBfGqSXwbOalixpfWmC8iUPHKv0ZRFhT4USGW3L
 s3ikZix1CXYk8w3jX5LaxfyZfb40GBiPWSjG9bWn3gJp9a9Md0FR48UGizRgXzY9ODgl
 10gDNc8YxX4abwwur3/2Ib4tR0HK4fxAVz95jdn0g5Bjm1f+zlmZUdf0J4uOmNCA+73o
 QmFwB0uLKerpVDInoO9o15o02ie64XpCaCSsIImcFb/KjT6Us0KvUWI0KV441DGxP1Gb
 Qjx6eoerfkbM7U/RrGe2d3xgWfRJJ6PVyX/2MvEkhvBiHXfKbkbdOk6b4KB2LrxPQeQV
 fLzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=chAct3ipnxxeeUzw3hiYvmSC99rC9KHQnQdo3Qo5wI0=;
 b=eEd41NsqCME+vvcD2xZJn3GH2oz6EkSEL11UiZeiJE7PxyMe6dRvxgRHrzo8IvUvL1
 dhzxzdAAgemy2VhyUBpD5rzRKfSN4M2xwQLeVPG43wICsIwEx2DYpAWu7OQ71V+4tSZz
 9aI+fMNbmgJZ3a4m5gGv3jvnwYgntmAdlfY17uOU/19oWjJP8ENSexEhSfVZP5OiZMm9
 qejx/vKxO0urviP1KDPvvNJIgWTWCsfoEtZg185QbKuRG7VV43CehMNnyG7ElAIXO9XU
 3++EMDYso9Ocp356Vslzi2jgdx5YF1kmIeA82RcUjjf06d17aq8MsUs3DKIlPRVz1hRM
 NqUw==
X-Gm-Message-State: AOAM532v+t3+5bBqvklwl6iXi3Fiz4mJFs1RUnhiA2qXWVi0AT06ZViL
 yRQ17olwuE/yghOAelCbWYGERw==
X-Google-Smtp-Source: ABdhPJwH30rFrNGt2fTNK9Na7wrgKwgjGw7543RwntMIs+dfy9PTWNVMu53RFGAQHLSof48YBaglZA==
X-Received: by 2002:a62:8283:0:b0:3e0:f3f3:839d with SMTP id
 w125-20020a628283000000b003e0f3f3839dmr17811980pfd.37.1629436725848; 
 Thu, 19 Aug 2021 22:18:45 -0700 (PDT)
Received: from localhost ([122.172.201.85])
 by smtp.gmail.com with ESMTPSA id i26sm5582209pfu.6.2021.08.19.22.18.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 22:18:45 -0700 (PDT)
Date: Fri, 20 Aug 2021 10:48:43 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Lucas Stach <dev@lynxeye.de>, Stefan Agner <stefan@agner.ch>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>,
 Linux USB List <linux-usb@vger.kernel.org>,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc <linux-mmc@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 DTML <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v8 01/34] opp: Add dev_pm_opp_sync() helper
Message-ID: <20210820051843.5mueqpnjbqt3zdzc@vireshk-i7>
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
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPDyKFpg8ixT4AEjzVLTwQR7Nn9CctjnLCDS5GwkOrAERquyxw@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_221848_039693_549BA880 
X-CRM114-Status: GOOD (  34.47  )
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

On 19-08-21, 16:55, Ulf Hansson wrote:
> Right, that sounds reasonable.
> 
> We already have pm_genpd_opp_to_performance_state() which translates
> an OPP to a performance state. This function invokes the
> ->opp_to_performance_state() for a genpd. Maybe we need to allow a
> genpd to not have ->opp_to_performance_state() callback assigned
> though, but continue up in the hierarchy to see if the parent has the
> callback assigned, to make this work for Tegra?
> 
> Perhaps we should add an API dev_pm_genpd_opp_to_performance_state(),
> allowing us to pass the device instead of the genpd. But that's a
> minor thing.

I am not concerned a lot about how it gets implemented, and am not
sure as well, as I haven't looked into these details since sometime.
Any reasonable thing will be accepted, as simple as that.

> Finally, the precondition to use the above, is to first get a handle
> to an OPP table. This is where I am struggling to find a generic
> solution, because I guess that would be platform or even consumer
> driver specific for how to do this. And at what point should we do
> this?

Hmm, I am not very clear with the whole picture at this point of time.

Dmitry, can you try to frame a sequence of events/calls/etc that will
define what kind of devices we are looking at here, and how this can
be made to work ?

> > > Viresh, please take a look at what I did in [1]. Maybe it could be done
> > > in another way.
> >
> > I looked into this and looked like too much trouble. The
> > implementation needs to be simple. I am not sure I understand all the
> > problems you faced while doing that, would be better to start with a
> > simpler implementation of get_performance_state() kind of API for
> > genpd, after the domain is attached and its OPP table is initialized.
> >
> > Note, that the OPP table isn't required to be fully initialized for
> > the device at this point, we can parse the DT as well if needed be.
> 
> Sure, but as I indicated above, you need some kind of input data to
> figure out what OPP table to pick, before you can translate that into
> a performance state. Is that always the clock rate, for example?

Eventually it can be clock, bandwidth, or pstate of anther genpd, not
sure what all we are looking for now. It should be just clock right
now as far as I can imagine :)

> Perhaps, we should start with adding a dev_pm_opp_get_from_rate() or
> what do you think? Do you have other suggestions?

We already have similar APIs, so that won't be a problem. We also have
a mechanism inside the OPP core, frequency based, which is used to
guess the current OPP. Maybe we can enhance and use that directly
here.

-- 
viresh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
