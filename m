Return-Path: <SRS0=Zu/5=NR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3BB5C432BE
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Aug 2021 02:56:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AFF7610A3
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Aug 2021 02:56:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7AFF7610A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fOhxq+3u2OKd8Dq5wrjypqYwy9zhMJDwM1lTzjvsjvM=; b=BNmwPsK/hwBpkt
	ECN8QkbQ6VxWhMmp38k1S1XDZyVLNJWM32YOqw9+EGg/CsRkgFo87Lw1xTKnnq2vtsxNfTNE/Aelc
	kFnMw/rSVkauyo5JQNTMmB1CbyNIkW9L2zikm5VgN6fQ9LNsw2+KqObaWg/0wfLHYbrPeSdsgKYfr
	2l7jhPwOD81gbyY3gKXyMLxCzNSr4wnBq9UO25pXLLgKRekIG1rFX6xU8Lz4zboTbB+yGXCPBoOpu
	2TVFb0TRRZQmM2kzN+gHWSHzOmo6LuMrwBkjaXJNZVS6Fu+xGXDY1g6wMqUfzX2VQrbMqMcCzLbuC
	RWqX1xl9MdcHlwrV8YHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJ5Yf-008yyT-Cq; Thu, 26 Aug 2021 02:56:01 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJ5Ya-008ywA-6T
 for linux-mtd@lists.infradead.org; Thu, 26 Aug 2021 02:56:00 +0000
Received: by mail-pl1-x635.google.com with SMTP id u15so850156plg.13
 for <linux-mtd@lists.infradead.org>; Wed, 25 Aug 2021 19:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=XZJy3B7m2q1WQYxMFNJqVt+qoddOU66BMzkNgwutOWg=;
 b=BqMyQF/pRrF5xvz5gMLvg1PjbQE0frktW1h8fThSOxAyiiCfj3dL0xTey26htEbkAU
 qVk4YC/4pxXxGHnr1GTo9bAoMJ4eX1tti5O7V1wnRrIafIwyVqmUZ2m6I0wxB2W1enrU
 HYOhVAex2Ke6zlvt61UNmgKkPh0dFb29lz983ZdH0aQ73RTHtAt7M1/VCP+x5TO9AjAI
 IJ3QFiGrCxXaLSKuBsbiYJZ42RDh74ChanCbedOwOUd6kuh7jO/uAx7AqCUeER3jlnSQ
 JtlHN1LIH4ywCIyB5pTCzFG5gUqpfLooaOTxS3rQYlWnLCOQf96ZEpwgb/6YUmVVCCWa
 uEzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XZJy3B7m2q1WQYxMFNJqVt+qoddOU66BMzkNgwutOWg=;
 b=CNM8anjhEWKs2RQNLn4OBlBDVIwEYyVRXJQsvV5hp/1RCXT7sfYojgFRWDj+jEti/G
 sT8qhgocbdmnjHjpOfYA44pwmvyDnifAUE8PtzZFMTLM3muY4vlyLjJp6anmJm/61gp1
 bEVh2qDYReAG9azwoDtGv0T8ggge+Z8qoEfMehObmffo5FfWIsoRNQAuu8yKke9p78v0
 mXwjclMZNaf9Bd4zg+GtITlRHyMDNcHRkPwgmm1Z1uSz1JHD7Psj8dAbHxiABAxH85fj
 SkztEw4fgDqbU/osoQEOyAkKIQCMpr+J+imMyiBronhMa1acWGApPL8X4GaXXRkhhc/i
 Zw9Q==
X-Gm-Message-State: AOAM530THMsgfYGnwExEVq4JiKS9zMySpLvs7YSeQQKMXtE0ew5aUo1J
 VK18QrIsuITzrbc3tzTrSX6mQw==
X-Google-Smtp-Source: ABdhPJxp/UrPyXCwFMVDb4P8xsIyAd9gtXZ72kFLG9qw2YDutl/4rgLBxJGBT6WkpyrCaGfD2F0KiA==
X-Received: by 2002:a17:90b:3144:: with SMTP id
 ip4mr14265346pjb.22.1629946555282; 
 Wed, 25 Aug 2021 19:55:55 -0700 (PDT)
Received: from localhost ([122.172.201.85])
 by smtp.gmail.com with ESMTPSA id 22sm1308517pgn.88.2021.08.25.19.55.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 19:55:54 -0700 (PDT)
Date: Thu, 26 Aug 2021 08:25:50 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
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
Message-ID: <20210826025550.sshd7xl3gsuendoi@vireshk-i7>
References: <CAPDyKFrZqWtZOp4MwDN6fShoLLbw5NM039bpE3-shB+fCEZOog@mail.gmail.com>
 <20210818091417.dvlnsxlgybdsn76x@vireshk-i7>
 <CAPDyKFrVxhrWGr2pKduehshpLFd_db2NTPGuD7fSqvuHeyzT4w@mail.gmail.com>
 <f1314a47-9e8b-58e1-7c3f-0afb1ec8e70a@gmail.com>
 <20210819061617.r4kuqxafjstrv3kt@vireshk-i7>
 <CAPDyKFpg8ixT4AEjzVLTwQR7Nn9CctjnLCDS5GwkOrAERquyxw@mail.gmail.com>
 <20210820051843.5mueqpnjbqt3zdzc@vireshk-i7>
 <b887de8c-a40b-a62e-8abf-698e67cdb70c@gmail.com>
 <ed70e422-e0e9-8c2a-7ce6-e39cb6fd8108@gmail.com>
 <20210826025427.exdinwkuavyfcp3f@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210826025427.exdinwkuavyfcp3f@vireshk-i7>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_195556_320524_3FC11B20 
X-CRM114-Status: GOOD (  19.51  )
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

On 26-08-21, 08:24, Viresh Kumar wrote:
> On 25-08-21, 18:41, Dmitry Osipenko wrote:
> > Thinking a bit more about this, I got a nicer variant which actually works in all cases for Tegra.
> > 
> > Viresh / Ulf, what do you think about this:
> 
> This is what I have been suggesting from day 1 :)
> 
> https://lore.kernel.org/linux-staging/20210818055849.ybfajzu75ecpdrbn@vireshk-i7/
> 
>  "
>   And if it is all about just syncing the genpd core, then can the
>   genpd core do something like what clk framework does? i.e. allow a
>   new optional genpd callback, get_performance_state() (just like
>   set_performance_state()), which can be called initially by the core
>   to get the performance to something other than zero.
>  "
> 
> Looks good to me :)

When you refresh this stuff, please send only 3-4 patches to update
the core stuff and show an example. Once we finalize with the
interface, you can update all the users. Else this is just noise for
everyone else.

-- 
viresh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
