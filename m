Return-Path: <SRS0=LBUh=NI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED589C4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 07:57:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B940160EFF
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 07:57:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B940160EFF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fTpobhY++zIBsTdksJ+g5oyqUcTrca1QqL8djxH44fo=; b=HpzloSX+1HH3cm
	xJImgERqaz94wzHfHBiGlH7v7MVERWY+0Dp/JeOSmUEhgcjX44zAK27LcG8djrbRirFGTIP4v76U9
	MqxCX0Zg//iIVWhAkNkZ4YMDNVBk0ew5yiVDDwfDalSe+5lqOH7w4Av6DlOEhSUxc8gbDiS/FV4UV
	9sMfthN90e9U0UQBUKRBjzkLcETC7507ABXTIGgKjyFsahk9lzBljxES9XxMAle96GcXdVGWNK10Q
	Q8irhoe8JJ2gYlljK1Yy/N8Laf7wjHyJlINP3dX2imUdrwJe0Wn6sfpTlsHw0EDh3HYMsuyW5JQji
	rQABc32qLrCXXbueeqgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFtxk-001RTD-CW; Tue, 17 Aug 2021 07:56:44 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFtwN-001QwU-Mu
 for linux-mtd@lists.infradead.org; Tue, 17 Aug 2021 07:55:23 +0000
Received: by mail-pl1-x62e.google.com with SMTP id c17so18663613plz.2
 for <linux-mtd@lists.infradead.org>; Tue, 17 Aug 2021 00:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=6syxEk4ci6YIB/Nq5OYMmva/mb8yTCwuOVtI6kBv8o4=;
 b=ACQXwBJ7OYjyZRVhhS/c9nneyhB/7GFHh3dEptJSMrZINFg36aQMQ7Gt7s7mEUBpCw
 zQlnh/X4OgBYC+KUUJhyCLfP1qSGXkpJPWAGfJpM/INHjdAZ8/L1JkEYsFztN3Yjcf8Y
 CLx5rb8MRnnLnlOw941FjpRCL/gP5pp6YSMCeI+89Jy/Rd1+N1g4DWNkDQt5p2lrVfbf
 /2f4gxbIqWPYLcL72Mw6S4MUH55MP9SVIVTvv1bjke3ugxDHQALvD0J7WbGxZqFUjEZx
 7P1AM3kpvDdhJRiWVIeigZKSst/k+rzUIj9Law8crvuO6T67AGjOgt6Tme7gr0jaocjL
 3BQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6syxEk4ci6YIB/Nq5OYMmva/mb8yTCwuOVtI6kBv8o4=;
 b=apsTtN0HpBZpLVBMa5+47vMwlmntSl97lu2mLwgm2a/D1GuUqmSnI/sMYkGGgHsinm
 f0Jz4R9pFtq7RtkF8QYXlaaKYnYyJd4JZ6x+XU5sohZD0CuoOasqawbfFkivlQmb5CVq
 F8GeVw4N3Xiho7PA5vSUEScK5QxftbgYazjXua7uWrLY9QVfqYmgyzWrWErG+T48CCI1
 tRKfBmETUZYuXzUJTzLiTZebXB51HbLLhYkHJgCjXbYHaZ4vfkL7IZ6ZN8vJQqUKhpUw
 PW80W94qDavVXfLyB6KzgYTv3mVBwPh6QDrdYubhvYzH6BWm5t/steZM5chnz1OjzJdg
 dqtA==
X-Gm-Message-State: AOAM531fikGnsroHltVjp44BHMFnfkGUJZuPGO4usga+VAcdc98O6Bu8
 mC1U+J6aFJ8EzI6+Y9pSF8X+Jw==
X-Google-Smtp-Source: ABdhPJy9z80wO3ZS4ZOBoRu271xrntCgw/Td4lOHD9BJvY7rOCcDAdlvae5dCy1DGcWdIK214rqywQ==
X-Received: by 2002:a17:90b:4a09:: with SMTP id
 kk9mr2300035pjb.163.1629186918789; 
 Tue, 17 Aug 2021 00:55:18 -0700 (PDT)
Received: from localhost ([122.172.201.85])
 by smtp.gmail.com with ESMTPSA id c12sm1471425pfl.56.2021.08.17.00.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 00:55:18 -0700 (PDT)
Date: Tue, 17 Aug 2021 13:25:15 +0530
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
Message-ID: <20210817075515.vyyv7z37e6jcrhsl@vireshk-i7>
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210817012754.8710-2-digetx@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_005519_933876_A2FBDB1C 
X-CRM114-Status: GOOD (  27.42  )
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

On 17-08-21, 04:27, Dmitry Osipenko wrote:
> Add dev_pm_opp_sync() helper which syncs OPP table with hardware state
> and vice versa.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/opp/core.c     | 42 +++++++++++++++++++++++++++++++++++++++---
>  include/linux/pm_opp.h |  6 ++++++
>  2 files changed, 45 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
> index 5543c54dacc5..18016e49605f 100644
> --- a/drivers/opp/core.c
> +++ b/drivers/opp/core.c
> @@ -939,7 +939,8 @@ static int _set_required_opps(struct device *dev,
>  	return ret;
>  }
>  
> -static void _find_current_opp(struct device *dev, struct opp_table *opp_table)
> +static struct dev_pm_opp *
> +_find_current_opp(struct device *dev, struct opp_table *opp_table)
>  {
>  	struct dev_pm_opp *opp = ERR_PTR(-ENODEV);
>  	unsigned long freq;
> @@ -961,7 +962,7 @@ static void _find_current_opp(struct device *dev, struct opp_table *opp_table)
>  		mutex_unlock(&opp_table->lock);
>  	}
>  
> -	opp_table->current_opp = opp;
> +	return opp;
>  }
>  
>  static int _disable_opp_table(struct device *dev, struct opp_table *opp_table)
> @@ -1003,7 +1004,7 @@ static int _set_opp(struct device *dev, struct opp_table *opp_table,
>  
>  	/* Find the currently set OPP if we don't know already */
>  	if (unlikely(!opp_table->current_opp))
> -		_find_current_opp(dev, opp_table);
> +		opp_table->current_opp = _find_current_opp(dev, opp_table);
>  
>  	old_opp = opp_table->current_opp;
>  
> @@ -2931,3 +2932,38 @@ int dev_pm_opp_sync_regulators(struct device *dev)
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(dev_pm_opp_sync_regulators);
> +
> +/**
> + * dev_pm_opp_sync() - Sync OPP state
> + * @dev:	device for which we do this operation
> + *
> + * Initialize OPP table accordingly to current clock rate or
> + * first available OPP if clock not available for this device.
> + *
> + * Return: 0 on success or a negative error value.
> + */
> +int dev_pm_opp_sync(struct device *dev)
> +{
> +	struct opp_table *opp_table;
> +	struct dev_pm_opp *opp;
> +	int ret = 0;
> +
> +	/* Device may not have OPP table */
> +	opp_table = _find_opp_table(dev);
> +	if (IS_ERR(opp_table))
> +		return 0;
> +
> +	if (!_get_opp_count(opp_table))
> +		goto put_table;
> +
> +	opp = _find_current_opp(dev, opp_table);
> +	ret = _set_opp(dev, opp_table, opp, opp->rate);

And I am not sure how this will end up working, since new OPP will be
equal to old one. Since I see you call this from resume() at many
places.

what exactly are you trying to do here ? Those details would be good
to have in commit log as well, I haven't really followed V7 of your
series.

-- 
viresh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
