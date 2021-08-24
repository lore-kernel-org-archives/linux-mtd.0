Return-Path: <SRS0=de6p=NP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA4DEC4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Aug 2021 03:05:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86F72610A4
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Aug 2021 03:05:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 86F72610A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cBY80EpZYSCSVxXIe88GGf3b5p0TrL64zcSkajqHFn0=; b=yc427wk94ztUJP
	AqNkShrv4FbWsO3CF6gUKyr/uhtAJaLUzczun6+J6PigEAOmoVIZdr/c6D5w1OQV7MFNxNJDH2bR/
	AtVXlaR+axTfMMrNnqG6rH5pAZjagLMlNHW2La61Gy1KX70C0v+zCK683QEBcVEHKiVRfG9Ma4Ufu
	pz4EKCMc4W1hpcqWBx1HDXzcItO3QPOr9Kq0q2OZbuRSq4pJbbmXEbi32c5vr7TQsYIY8/dvj28Vu
	Jd08ocxIJNDTsWhVahZrK9tX778Uz09tfd/1uTIU2rvc5AG+0OUk9LiQnAvcrcZPWqK1KqH0IMGT4
	wp8FhBjEQRGJa7GbZFcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIMjr-001KiG-6n; Tue, 24 Aug 2021 03:04:35 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIMjm-001Ken-7a
 for linux-mtd@lists.infradead.org; Tue, 24 Aug 2021 03:04:34 +0000
Received: by mail-pl1-x629.google.com with SMTP id a5so11385195plh.5
 for <linux-mtd@lists.infradead.org>; Mon, 23 Aug 2021 20:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ftVLBcz2CA6HVw5Sak06NSKiX7H+vKeynT4dia9GcmU=;
 b=k+9ugNQMNP1T757zCmBjD0HZ4Cm6T3BE+v/X7Wxf65qXhZ4Y1Om/ZwreVVsFldU5ED
 26Au5VziBd3fTRw9qajnc5Q1bzTZtCXlNbNzYEhhdrLy0j6q3RP41Bfsx2Vet4JiZwHE
 HpssKarI+iW9nKfS+aZW4kug15wwleM1PIEsfGzs+E/ENGb7NoFhvlaUVQuCR3IWspbE
 1jdc92yTGvHUY8w5qgAHpd6F4jZjsLSyz7OphX6zYHG1h8uepViMakkTUt9Apji0AqlD
 h496UE7ulnKIyaYIIz+9WlMWKL7f+UCly0DgUoeMlhVK/OeculmtFoztQ69V1z3oNjW5
 BaQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ftVLBcz2CA6HVw5Sak06NSKiX7H+vKeynT4dia9GcmU=;
 b=DKRXwVAzBUMdm1dn2st3klJvuLokMIKy1QLxiBOTCX/VFELRAeInPV7/0f2ISKUBKP
 Pvn1UCWIWT1jN2JDlD7rKXjCcynbasZy2sRk5XW8QxxllcTDxpoWEWNzRDd26jnYv4ho
 rIyEdo6wzr7lScCirMiwz1EP+zf7fW1eGgj/nCaihiDSr6SFTv0RrOKajH/MCyn1xgnK
 6bJ0KfTSAKnW5CA7wM85DdPfUP702XoIZuoBHcqb98O7+04/sbp3yriBJeMmHwG/s6Lr
 8ML3arvWrEf4fggUqnT6dbIEXfkQpjoR/N3dg9j4KZRQFdWtIVXRdyPk7sJAi1tB/FjC
 AC7Q==
X-Gm-Message-State: AOAM5321twTDO1u6tCpD+tBai31KVehvZ7+dqc2i9dFNjAPhS/dkq8MZ
 VFUHVWJ29fiyopwiCL+/92Q25A==
X-Google-Smtp-Source: ABdhPJxgNZPrPk9tzmxpkCehrPdfFes88M8DqFhHlA/X7V8qZTGRmqZiqGy9NJMzzCPLtwobPdjSGw==
X-Received: by 2002:a17:902:e547:b029:12c:563c:4a03 with SMTP id
 n7-20020a170902e547b029012c563c4a03mr30922945plf.46.1629774264209; 
 Mon, 23 Aug 2021 20:04:24 -0700 (PDT)
Received: from localhost ([122.172.201.85])
 by smtp.gmail.com with ESMTPSA id c12sm16184839pfl.56.2021.08.23.20.04.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 20:04:23 -0700 (PDT)
Date: Tue, 24 Aug 2021 08:34:21 +0530
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
Message-ID: <20210824030421.3tjfjkx3c2silbnz@vireshk-i7>
References: <20210818062723.dqamssfkf7lf7cf7@vireshk-i7>
 <CAPDyKFrZqWtZOp4MwDN6fShoLLbw5NM039bpE3-shB+fCEZOog@mail.gmail.com>
 <20210818091417.dvlnsxlgybdsn76x@vireshk-i7>
 <CAPDyKFrVxhrWGr2pKduehshpLFd_db2NTPGuD7fSqvuHeyzT4w@mail.gmail.com>
 <f1314a47-9e8b-58e1-7c3f-0afb1ec8e70a@gmail.com>
 <20210819061617.r4kuqxafjstrv3kt@vireshk-i7>
 <CAPDyKFpg8ixT4AEjzVLTwQR7Nn9CctjnLCDS5GwkOrAERquyxw@mail.gmail.com>
 <20210820051843.5mueqpnjbqt3zdzc@vireshk-i7>
 <CAPDyKFo0rzHT4AhueWjyz9k2ZqUy8N6Od5pbr8sL_m0Jf2AwUg@mail.gmail.com>
 <085d1a2e-57b0-222e-c569-12f3c6bc8161@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <085d1a2e-57b0-222e-c569-12f3c6bc8161@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_200430_307595_8AB86109 
X-CRM114-Status: GOOD (  18.10  )
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

On 23-08-21, 23:24, Dmitry Osipenko wrote:
> It's not clear to me whether it will be okay to add a generic OPP syncing by clock rate or should it be a Tegra-specific helper. Viresh, what do you think about this generic OPP helper:
> 
> /**
>  * dev_pm_opp_sync_with_clk_rate() - Sync OPP state with clock rate
>  * @dev:	device for which we do this operation
>  *
>  * Sync OPP table state with the current clock rate of device.
>  *
>  * Return: 0 on success or a negative error value.
>  */
> int dev_pm_opp_sync_with_clk_rate(struct device *dev)
> {
> 	struct opp_table *opp_table;
> 	int ret = 0;
> 
> 	/* Device may not have OPP table */
> 	opp_table = _find_opp_table(dev);
> 	if (IS_ERR(opp_table))
> 		return 0;
> 
> 	/* Device may not use clock */
> 	if (IS_ERR(opp_table->clk))
> 		goto put_table;
> 
> 	/* Device may have empty OPP table */
> 	if (!_get_opp_count(opp_table))
> 		goto put_table;
> 
> 	ret = dev_pm_opp_set_rate(dev, clk_get_rate(opp_table->clk));
> put_table:
> 	/* Drop reference taken by _find_opp_table() */
> 	dev_pm_opp_put_opp_table(opp_table);
> 
> 	return ret;
> }
> EXPORT_SYMBOL_GPL(dev_pm_opp_sync_with_clk_rate);

I am not sure why you still need this, hope we were going another way
? Anyway I will have a look at what you have posted now.

-- 
viresh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
