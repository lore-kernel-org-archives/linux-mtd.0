Return-Path: <SRS0=f8pO=NJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25774C4338F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 09:44:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF5D6608FE
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 09:44:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DF5D6608FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O/yY+3OR+SwetVQmIOHUi327+wj25wFnIoG+B1J4n/w=; b=Kvb5jRIznsJsK6
	hBEgh8hhrG/v2w8I5qnAybzKRILN6J2vLSILWPqL3xODRgD0L4bZXReyYMdlGr53+9cJKDy2XivmC
	tba06NFzgk4VHKZnBxugWQKoj8tz6aT3sLvNFKIcn0uIFyK5QT0n59YuU8AabvxHNvea3Ih11Q5o8
	EO8RI/PnQVumC6GGtONakRLMIuScCYes2dyxrg9P9acvKXn/KFy85lxjGPFQsTmGmmWDIudlZKkTz
	836VXVZ95Btt9d56pSHFS8J62m82r0GgRJVKd+zMXeyOpsKJWns+YqaQs7fP8zaamajtFFNnd5OAx
	dgf6rknhcrm1fugyNLbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGI6R-004z8R-Il; Wed, 18 Aug 2021 09:43:19 +0000
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGI6L-004z5b-DG
 for linux-mtd@lists.infradead.org; Wed, 18 Aug 2021 09:43:17 +0000
Received: by mail-vs1-xe2e.google.com with SMTP id b5so1391447vsq.2
 for <linux-mtd@lists.infradead.org>; Wed, 18 Aug 2021 02:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FWBxn1z3ekg3JNnkDjY46sh+PpWR/RlGELWeBu4tA3E=;
 b=FFftuENs27XO7ikAVlt9sNRrRCsBTJZ805lZ/o142pXQXR8nF52pmq8IvezPLEiFO+
 Gjq2WoPiQzk8jZ4uYInc1khmBed8qd46T4LWYngy8i354Jfy5RYYZeNPcPQwV7Hi+puI
 QZhCeWMwHzHrHaXIuivtbzApdiybJQ4pVhpGU7feoyKgCWA/npF/0W2iJeG8VztzaEt+
 ZJsxwI7r8+xAuOc7l8/VyUsTvFlBfoIdxOUMdDlAHZYFe7MoAJNwUSTgdHCwo6ucQZJA
 BERjK6oUxjMO7UroxyK/oZD8pD+R5orBQwvbmOc6wkXjZrFZ4z5k2EAhTN/3qtONaHMN
 ycCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FWBxn1z3ekg3JNnkDjY46sh+PpWR/RlGELWeBu4tA3E=;
 b=m7+l3rgjGEg2xcMx1eVe+bzEAvwmo0XfT99ej7ZnalWUGoXW5ev07617lduSFh0TUR
 Uy5FFJis1wpl+kgV5NW1dzpommgFRMVfBsTix5UPhZkx3jTx9QMsJ0kZEw9XZdD7G8N9
 0vnWviVhQ0ql76ees5mo42qWfcIG0d85rh5/j2VM7qQuh7R4BEn1rm2/W7UpdxVYig6h
 kQRqyr5BNh3zKTIbHLy8XR9ZELMo2J+QCh/U11mBT11uxXrLGqr4q5UiR/mbe7RcK4KP
 aSCGUyce7/zcYJTUTZfe9PWMTBbKminsMbGD08BI/i7ov/vpEBMAfLyzwo6STbIZ+l6r
 yoeg==
X-Gm-Message-State: AOAM531HEY4IzoafM3FJbVEQK60RjgphYevrS9sH4kvlPUmBYeDBItiG
 4ZN+S1BYIunLU5UlT5CeKJ4833q0pLxJbU/+K5juqQ==
X-Google-Smtp-Source: ABdhPJy9niDJz5mgkUvErbKV42Yn+Ms0EJBjGcIKiTYQBlrHgHjEZyzYRmP0dMsZPekoMsC63913LnT1iekm3nfsXZM=
X-Received: by 2002:a67:7949:: with SMTP id u70mr6382807vsc.55.1629279791962; 
 Wed, 18 Aug 2021 02:43:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210818035533.ieqkexltfvvf2p4n@vireshk-i7>
 <5b2a80c1-9743-e633-6257-ede94c8a274c@gmail.com>
 <20210818043131.7klajx6drvvkftoc@vireshk-i7>
 <a2a3c41f-c5e4-ee7e-7d48-03af8bac8863@gmail.com>
 <20210818045307.4brb6cafkh3adjth@vireshk-i7>
 <080469b3-612b-3a34-86e5-7037a64de2fe@gmail.com>
 <20210818055849.ybfajzu75ecpdrbn@vireshk-i7>
 <f1c76f23-086d-ef36-54ea-0511b0ebe0e1@gmail.com>
 <20210818062723.dqamssfkf7lf7cf7@vireshk-i7>
 <CAPDyKFrZqWtZOp4MwDN6fShoLLbw5NM039bpE3-shB+fCEZOog@mail.gmail.com>
 <20210818091417.dvlnsxlgybdsn76x@vireshk-i7>
 <CAPDyKFrVxhrWGr2pKduehshpLFd_db2NTPGuD7fSqvuHeyzT4w@mail.gmail.com>
In-Reply-To: <CAPDyKFrVxhrWGr2pKduehshpLFd_db2NTPGuD7fSqvuHeyzT4w@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 18 Aug 2021 11:42:35 +0200
Message-ID: <CAPDyKFrgGEOEFsqah3sQfPbjeRySPfFxokpO-BcMcPmEMrv-kg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210818_024313_496786_4A64526A 
X-CRM114-Status: GOOD (  31.38  )
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

On Wed, 18 Aug 2021 at 11:41, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Wed, 18 Aug 2021 at 11:14, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > On 18-08-21, 10:29, Ulf Hansson wrote:
> > > Me and Dmitry discussed adding a new genpd callback for this. I agreed
> > > that it seems like a reasonable thing to add, if he insists.
> > >
> > > The intent was to invoke the new callback from __genpd_dev_pm_attach()
> > > when the device has been attached to its genpd. This allows the
> > > callback, to invoke clk_get_rate() and then dev_pm_opp_set_rate(), to
> > > update the vote according to the current state of the HW.
> >
> > I wouldn't call dev_pm_opp_set_rate() from there, since it means
> > configure and enable (both) for different resources, clk, regulator,
> > genpd, etc..
>
> Right, good point!
>
> dev_pm_opp_set_rate() is best called from consumer drivers, as they
> need to be in control.
>
> >
> > What we need here is just configure. So something like this then:
> >
> > - genpd->get_performance_state()
> >   -> dev_pm_opp_get_current_opp() //New API
> >   -> dev_pm_genpd_set_performance_state(dev, current_opp->pstate);
> >
> > This can be done just once from probe() then.
>
> How would dev_pm_opp_get_current_opp() work? Do you have a suggestion?
>
> >
> > > I am not sure if/why that approach seemed insufficient?
> > >
> > > Another option to solve the problem, I think, is simply to patch
> > > drivers to let them call dev_pm_opp_set_rate() during ->probe(), this
> > > should synchronize the HW state too.
> >
> > Dmitry already mentioned that this will make the device start
> > consuming power, and he doesn't want that, else we need an explicit
> > disble call as well.
>
> I am sure I understand the problem. When a device is getting probed,

/s/I am sure/I am not sure

> it needs to consume power, how else can the corresponding driver
> successfully probe it?
>
> >
> > --
> > viresh
>
> Kind regards
> Uffe

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
