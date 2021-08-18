Return-Path: <SRS0=f8pO=NJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46527C4338F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 05:59:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1407061076
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 05:59:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1407061076
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=akKkdlB7GxrWBlW92f7jLWTj1VxrY/OJi45DEw+lnuw=; b=kBICpKps+E7Y/0
	6NivJKmCAekR/Z5Qze71oqfUp3Mntu31c6CIHn4Ekp0jLKYC2G+RJFgugupp7IryD4O14JHuXc4Dg
	fZL/1T4ArttXDQJcFIKBOHowLOGWjlD9VtGX2mny8V/Sw7L0LUKoqPZ/JEkiTMj0hjoloe8e5VS6K
	nrGoJPEu00QlV8de/BTzOdixW3Z8H7bQGWTF0I65BBxkUkWf4UpkVdJo52tKvHtr3LPPcmkAem6N4
	fGDMpSr/zefvcCvkyl5D6t43cZHFqRd7nR3cbVn01/hYdjqmLUc7zCeIeRmvSPrssZ4mSQ81UNB9B
	+jFSw16NRE+VBfPUW3cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGEbK-004HdC-16; Wed, 18 Aug 2021 05:58:58 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGEbE-004HbH-P1
 for linux-mtd@lists.infradead.org; Wed, 18 Aug 2021 05:58:56 +0000
Received: by mail-pj1-x1036.google.com with SMTP id
 qe12-20020a17090b4f8c00b00179321cbae7so1626494pjb.2
 for <linux-mtd@lists.infradead.org>; Tue, 17 Aug 2021 22:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/oqvyX1+fZTz+wtMw2AZVqGvrykbTQj8oIvIXJk4fnQ=;
 b=BiNyX/6IYojCpnpyPGFzrgnh8ilV1S48JvAdE+mM4BuP7CRu2FKtWLmHb+6pMAnjSh
 /wfP9QCG/Q2Ukj1ZByvNzYSCb76F2+QCOquffMB7/VgJzMfI6biDam1D93oJFOcKLxY5
 r0ui6XTLNwvZZ2QgeJ+nHG0xrCIvTYYP76CrkUOXqGHCkZrCx8j9IwfpGrJOMhMeq8y0
 k2mkEWBfMzJhbTlNZAz6IL2S8V/0dB0U3qYFm8ylkevVbHpEgfdJ2weIyvMA0dAHIkMr
 BJ+3m2Wz3q/+kbkLCXBH7Ci4zKCVmfsRmjz+f2zh3gygpbMTckDnXDsC8v0GIrUYRu/5
 PVGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/oqvyX1+fZTz+wtMw2AZVqGvrykbTQj8oIvIXJk4fnQ=;
 b=cxZrosWShw4toWYTXhDVjj/UWsCBj1boCRrj5ra9cWSpME/CgJ3HHW0+gucgiqm2WB
 eNdU+6CVwFN3YUvMzxgFqkRt3FpPRqceNkG731n4PMSsNTg15LCjg+4wfZ2odXpUvO4+
 0+DKvGnWE9wbbv0nMhJBL8b1VtWjGOEx9YF5qU8LiBwPP6f24XYLTiFXsa+ug24sSGCU
 fGZF4W3QhjoHOYCjwpBx3lTKkOlQ0/A2pta4EZkMy3Owbc8nDldhCWhWjyhwfF8sXEq+
 njLWm+BLi1osEnhWAehvN5jTyUrU5hRqAeq8MLXJm/SyZcTLst+6lK8FizLzc9hg0r7C
 oBlA==
X-Gm-Message-State: AOAM533L9SSP3O3J+M2Y6FOd6VolRnaf44J0F5TEaT2piuovmruk7Ou0
 nY9LRi5hFkcTn7599T49AA5ZkA==
X-Google-Smtp-Source: ABdhPJxmfawJmjScyveR+qRjue44WOBbTuswMGRMZAcW5NbsgTVLKIK8N3zHMPdQxwr8K+gezRoAzQ==
X-Received: by 2002:a17:90a:db89:: with SMTP id
 h9mr7820049pjv.214.1629266331439; 
 Tue, 17 Aug 2021 22:58:51 -0700 (PDT)
Received: from localhost ([122.172.201.85])
 by smtp.gmail.com with ESMTPSA id g14sm4668532pfr.31.2021.08.17.22.58.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 22:58:51 -0700 (PDT)
Date: Wed, 18 Aug 2021 11:28:49 +0530
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
Message-ID: <20210818055849.ybfajzu75ecpdrbn@vireshk-i7>
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-2-digetx@gmail.com>
 <20210817075515.vyyv7z37e6jcrhsl@vireshk-i7>
 <710261d9-7ae3-5155-c0a2-f8aed2408d0b@gmail.com>
 <20210818035533.ieqkexltfvvf2p4n@vireshk-i7>
 <5b2a80c1-9743-e633-6257-ede94c8a274c@gmail.com>
 <20210818043131.7klajx6drvvkftoc@vireshk-i7>
 <a2a3c41f-c5e4-ee7e-7d48-03af8bac8863@gmail.com>
 <20210818045307.4brb6cafkh3adjth@vireshk-i7>
 <080469b3-612b-3a34-86e5-7037a64de2fe@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <080469b3-612b-3a34-86e5-7037a64de2fe@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_225852_847598_7BE2CC94 
X-CRM114-Status: GOOD (  25.45  )
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

On 18-08-21, 08:21, Dmitry Osipenko wrote:
> Yes, GENPD will cache the perf state across suspend/resume and initially
> cached value is out of sync with h/w.
> 
> Nothing else. But let me clarify it all again.

Thanks for your explanation.

> Initially the performance state of all GENPDs is 0 for all devices.
> 
> The clock rate is preinitialized for all devices to a some default rate
> by clk driver, or by bootloader or by assigned-clocks in DT.
> 
> When device is rpm-resumed, the resume callback of a device driver
> enables the clock.
> 
> Before clock is enabled, the voltage needs to be configured in
> accordance to the clk rate.
> 
> So now we have a GENPD with pstate=0 on a first rpm-resume, which
> doesn't match the h/w configuration. Calling dev_pm_opp_sync() sets the
> pstate in accordance to the h/w config.

What about calling dev_pm_opp_set_rate(dev, clk_get_rate(dev)) here
instead ? That will work, right ? The advantage is it works without
any special routine to do so.

I also wonder looking at your gr3d.c changes, you set a set-opp
helper, but the driver doesn't call set_opp_rate at all. Who calls it
?

And if it is all about just syncing the genpd core, then can the genpd
core do something like what clk framework does? i.e. allow a new
optional genpd callback, get_performance_state() (just like
set_performance_state()), which can be called initially by the core to
get the performance to something other than zero. opp-set-rate is
there to set the performance state and enable the stuff as well.
That's why it looks incorrect in your case, where the function was
only required to be called once, and you are ending up calling it on
each resume. Limiting that with another local variable is bad as well.

> In a previous v7 I proposed to preset the rpm_pstate of GENPD (perf
> level that is restored before device is rpm-resumed) from PD's
> attach_dev callback, but Ulf didn't like that because it requires to use
> and modify GENPD 'private' variables from a PD driver. We decided that
> will be better to make device drivers to explicitly sync the perf state,
> which I implemented in this v8.

-- 
viresh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
