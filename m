Return-Path: <SRS0=f8pO=NJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7289C4338F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 06:01:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 992B661076
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 06:01:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 992B661076
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xlkHel8tIF2KuKM5EWh/uOElWQQZjRPO9vf6dWg1Fx0=; b=hBNMuFnXno/L85
	8/H/CylWEpzKMlSYTeglsrMo97q2FwaJl9pBLN1/pjaWG2QNujlu03suzDrEjZ/9zJF14yVw6Mvgt
	ho9kO7iWaz/A/bT7rs3JBxhS9woE9C5jMkk8iB6CLMyNrRh2Q6iyO7GH1wg/WnkXI91ePyTfVqwS1
	EQf8wB0KXXaOThCspEMLYLjdQr/vWaX1eSt70VzzcMsFjsYSSM0qi80RjjGDhr57jfKFZHgMmS/Rw
	Evzm5mXD2bLyakKm4pEhdxpQvQ04qQlpvO2DfgBnoaYw0cFWwsx3uPOGHG+jDuoshO9WiH6psxgdU
	iuGIISTf/6wiDDK3+4fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGEd1-004Hzs-E4; Wed, 18 Aug 2021 06:00:43 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGEcv-004HxU-TJ
 for linux-mtd@lists.infradead.org; Wed, 18 Aug 2021 06:00:41 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 u21-20020a17090a8915b02901782c36f543so8165720pjn.4
 for <linux-mtd@lists.infradead.org>; Tue, 17 Aug 2021 23:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=jSLfXbs59mtRstzo4Hk2BNosvMcxHU6QjHDYVbvhF94=;
 b=IZiDZuRS1dgbax2OIM0qBL1zjf9wYlmKLTEfzJy5RuUwQu4eQ6Cqmnd2ZfQ9EnnS5E
 Jr1fAcgL/JdFgkFZ89xjBuBPSORKqFiw+3e1WhRfjnkRI6XhhARyc2h+l5KPSXucToC1
 5NtBgghBSCisOGicrsb9AX3gqpRGgB9wryJPh6wD220SUglcmvJcuJFjUggtI/Et9Qhq
 yJL8iRXbbCgl4lZdUfxZejEJadW6CurxesAMbeYQ33LbfTu1KA1dNxOq6HMfw0FLGwDr
 OcBg18AVZFD7ZTL3PphKIXIDGtjeF3qBwk12Pxl3ByoW3VLzL+hvaHjyLcAcizZ3cE8S
 xzgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jSLfXbs59mtRstzo4Hk2BNosvMcxHU6QjHDYVbvhF94=;
 b=qLLY6v4moSRfTEh9sPGuYLZOyyyFwu1sb6qgZKPDuLICQypupzGFz2JJJ0nhrzoGES
 PgozwXrNkf2EL3ltcbJjZjRUeoZDMH1XP0bL1U8a2wwO2kgqtjM4laClEkKOlT7UTEew
 WQ7pTf4nj2+oZ68tNtaWHsdqAQQKryoEcM1HlxZdNyv3SXcyKGYyZfnOX1fkBKBf1nCF
 gjs9uDfwiE9xqYoGRBqmxTCPnPppb52WlmeoOtMZdr1kVGByF2FVSomlU9gEA2VTgO1r
 RbJG1ykW7LDvTJFAR3zGVwIr0WxWS4QuAZtrX8WkukM8k0SCe2U2Kh+qFL2NH/w4Ee6i
 VutA==
X-Gm-Message-State: AOAM530QFXU0TOhWk+bladLr06W1lzRwLhKUmYJsboUFKVb9BJCmxwvi
 I+Jl8UPWxwVJCIn393arNU6Kvg==
X-Google-Smtp-Source: ABdhPJz6nHvt8tLhRUxNLQv5z93Dx/TL1iQrf7p3Xot0rNlhIhtJA6nFhb5bwd/3tPACvE5mJ3aZJA==
X-Received: by 2002:a17:902:edc8:b029:12d:4a06:1c25 with SMTP id
 q8-20020a170902edc8b029012d4a061c25mr5874222plk.61.1629266436958; 
 Tue, 17 Aug 2021 23:00:36 -0700 (PDT)
Received: from localhost ([122.172.201.85])
 by smtp.gmail.com with ESMTPSA id 136sm6020660pge.77.2021.08.17.23.00.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 23:00:36 -0700 (PDT)
Date: Wed, 18 Aug 2021 11:30:34 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
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
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH v8 01/34] opp: Add dev_pm_opp_sync() helper
Message-ID: <20210818060034.tdu3ocbqlnao336u@vireshk-i7>
References: <20210817012754.8710-2-digetx@gmail.com>
 <20210817075515.vyyv7z37e6jcrhsl@vireshk-i7>
 <710261d9-7ae3-5155-c0a2-f8aed2408d0b@gmail.com>
 <20210818035533.ieqkexltfvvf2p4n@vireshk-i7>
 <5b2a80c1-9743-e633-6257-ede94c8a274c@gmail.com>
 <20210818043131.7klajx6drvvkftoc@vireshk-i7>
 <a2a3c41f-c5e4-ee7e-7d48-03af8bac8863@gmail.com>
 <20210818045307.4brb6cafkh3adjth@vireshk-i7>
 <080469b3-612b-3a34-86e5-7037a64de2fe@gmail.com>
 <20210818055849.ybfajzu75ecpdrbn@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210818055849.ybfajzu75ecpdrbn@vireshk-i7>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_230038_012587_81543612 
X-CRM114-Status: GOOD (  29.58  )
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

On 18-08-21, 11:28, Viresh Kumar wrote:
> On 18-08-21, 08:21, Dmitry Osipenko wrote:
> > Yes, GENPD will cache the perf state across suspend/resume and initially
> > cached value is out of sync with h/w.
> > 
> > Nothing else. But let me clarify it all again.
> 
> Thanks for your explanation.
> 
> > Initially the performance state of all GENPDs is 0 for all devices.
> > 
> > The clock rate is preinitialized for all devices to a some default rate
> > by clk driver, or by bootloader or by assigned-clocks in DT.
> > 
> > When device is rpm-resumed, the resume callback of a device driver
> > enables the clock.
> > 
> > Before clock is enabled, the voltage needs to be configured in
> > accordance to the clk rate.
> > 
> > So now we have a GENPD with pstate=0 on a first rpm-resume, which
> > doesn't match the h/w configuration. Calling dev_pm_opp_sync() sets the
> > pstate in accordance to the h/w config.
> 
> What about calling dev_pm_opp_set_rate(dev, clk_get_rate(dev)) here
> instead ? That will work, right ? The advantage is it works without
> any special routine to do so.
> 
> I also wonder looking at your gr3d.c changes, you set a set-opp
> helper, but the driver doesn't call set_opp_rate at all. Who calls it
> ?
> 
> And if it is all about just syncing the genpd core, then can the genpd
> core do something like what clk framework does? i.e. allow a new
> optional genpd callback, get_performance_state() (just like
> set_performance_state()), which can be called initially by the core to
> get the performance to something other than zero. opp-set-rate is
> there to set the performance state and enable the stuff as well.
> That's why it looks incorrect in your case, where the function was
> only required to be called once, and you are ending up calling it on
> each resume. Limiting that with another local variable is bad as well.

Ulf, this last part is for you :)

-- 
viresh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
