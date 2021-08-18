Return-Path: <SRS0=f8pO=NJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B89CC4338F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 09:51:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDB3B60C3E
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 09:51:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DDB3B60C3E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/HklpSYWyrvnIOi4wOvVcFFRg2+lYwfZnOgYmSve99g=; b=vyr2hPTWPf50ei
	ZF2iANYrd863ubS8VKmU0ivw4aw9GsYCSGJBPTwXDRcOQ2bgh4HgUfPdsKvl0xiJvj5sDgrq0BGen
	17W+hp5udA9pJ1dcFC9PL+Q/Q/EREpUhRGKiM0cF3/k2v1hpccZfyMoVfriA7saTK61e9h+peeW0p
	RG2sqshPvpQtf0fgoe4LXgybFkKl376sf5pHECHC+QKaaEzkucS/1qJd1DNllilCNalF1eqpkoiiU
	WktfJTgJTASA40Py0B5p+CmMM5lJ/LDbFO8EjehMmidvYpinBgAgMb4eACDF0TuCxx0WhiruRnaEe
	88MJbyv+7UOVZRnJ+8RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGIDm-0050Id-At; Wed, 18 Aug 2021 09:50:54 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGIDg-0050GT-VG
 for linux-mtd@lists.infradead.org; Wed, 18 Aug 2021 09:50:52 +0000
Received: by mail-pg1-x534.google.com with SMTP id y23so1685111pgi.7
 for <linux-mtd@lists.infradead.org>; Wed, 18 Aug 2021 02:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=HyhZskvnkMHQUsBUgjlwBTJK659CA+CwU8djwVBZ2sM=;
 b=WeXABN/OK1Wr8lx7yIzjEQc22keli5/mPbqOsII32BzwbNTl5ULMEk37J2dJ8WBIc8
 ZnFr2sJXSoQcvyE/NTKrdgFlaJaQ5o8OxVWXD6PUNqbIuMj7u3RPYczNpQRUfi51aU4K
 IMg9JXqfomBw0MGOEn5iaKId1Us1CN3Pm6n193v6mGKDxjCswxDgh1VAt9J14Z2xnhK9
 TjVyhjtcpvAwdRJrWEVMHqX2US4YAz29pKFNe9gxQYZqLn/NPPMrB0GL1Cn9pdhRH215
 rF0aZ83JvYygnG0uw5U83BQhbi3YsDjTjk/h7pS55RDpk7eJ2g4J4R4IDq7w+OQTfMd1
 Zzzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HyhZskvnkMHQUsBUgjlwBTJK659CA+CwU8djwVBZ2sM=;
 b=tIEKf8+NI9aAs10YFqmLaCW2gx0cR3MLNEr68Cez2HLA1DJRo3O7YZAkiugijHi8YT
 z127VOs8Quhy9Q8qkDcv9JRleA3S2rONyR0QcFRmFLxDGdM5i1apEeVQrs78tcy/2Qgq
 PfJ7HaBpfLJFWt5uRud+0HHIonXaZNLc+i/a05vHz+5vMk8W3kHbtPwV6fGcQPGiZYze
 Vzo1ybXGOO+56zAoMD6sigjVvvr5ehbd8nMT7omWtHDs0p4mf1uJF/VpQyemaNwvxM2b
 E+H8krJOvyBAxFtdj1iDA61D3avya6TwpWmGcjuUhZbcrs+NOFMMN2p8qPbyE2we4+yg
 6NPQ==
X-Gm-Message-State: AOAM530Qq2sVofkRv9VAgryd7MIK2dlEXdV4BFnXttTweBkH51UNXIH7
 X/+DJPVY29VO2PvIi8w7Gjt1cA==
X-Google-Smtp-Source: ABdhPJzNgodhRJ4P04IWzIYvulf9/hQQBrDCKLc4ZA4G1N3jYvdGFtkpsn+640r5oaGBQ5g20Y+t7Q==
X-Received: by 2002:a63:3c5d:: with SMTP id i29mr8049824pgn.147.1629280247471; 
 Wed, 18 Aug 2021 02:50:47 -0700 (PDT)
Received: from localhost ([122.172.201.85])
 by smtp.gmail.com with ESMTPSA id i11sm6720260pgo.25.2021.08.18.02.50.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 02:50:47 -0700 (PDT)
Date: Wed, 18 Aug 2021 15:20:44 +0530
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
Message-ID: <20210818095044.e2ntsm45h5cddk7s@vireshk-i7>
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
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPDyKFrVxhrWGr2pKduehshpLFd_db2NTPGuD7fSqvuHeyzT4w@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_025049_045378_3F272FFD 
X-CRM114-Status: GOOD (  18.52  )
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

On 18-08-21, 11:41, Ulf Hansson wrote:
> On Wed, 18 Aug 2021 at 11:14, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > What we need here is just configure. So something like this then:
> >
> > - genpd->get_performance_state()
> >   -> dev_pm_opp_get_current_opp() //New API
> >   -> dev_pm_genpd_set_performance_state(dev, current_opp->pstate);
> >
> > This can be done just once from probe() then.
> 
> How would dev_pm_opp_get_current_opp() work? Do you have a suggestion?

The opp core already has a way of finding current OPP, that's what
Dmitry is trying to use here. It finds it using clk_get_rate(), if
that is zero, it picks the lowest freq possible.

> I am sure I understand the problem. When a device is getting probed,
> it needs to consume power, how else can the corresponding driver
> successfully probe it?

Dmitry can answer that better, but a device doesn't necessarily need
to consume energy in probe. It can consume bus clock, like APB we
have, but the more energy consuming stuff can be left disabled until
the time a user comes up. Probe will just end up registering the
driver and initializing it.

-- 
viresh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
