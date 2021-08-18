Return-Path: <SRS0=f8pO=NJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75891C4338F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 01:18:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E93760C3E
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 01:18:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3E93760C3E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3nP/n4B/iXqdoJGQzTjYr1slbodnwqV5maHs44ZfYhk=; b=I69y8OPlt5h8Zj
	Lr0QxuHDF4RIvUWes9UMS6OCjMR5q5b+fQTPTJULbipyTg4c4CHMTZrX3LseV0w/rpR0s8kBK7Smc
	wdLam+wUBEDIg9cVEKdR3p9nQba/YElslv4u/eMEmTvp58mK5GdY+ZdgnRlA1PpIKmy1ZMxHOvH/3
	aVZ7CmM8DaJelYD78TqC5Fz9l2MdzU6bRE2zzsyKusr3LAPgjhv7adISJ2fgGOOMFOHLp4y8ys9eO
	QlJNSLdYo1zQi0NtFbDhrFnz2PLPQsDMQjODKS2kaw39mnONbciD3SmTf9b6HMNK2KFFE6uK/kkBy
	SOYmpjD+02oWXVjvwmSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGAD6-003r6P-N2; Wed, 18 Aug 2021 01:17:40 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGAD3-003r4d-Bf
 for linux-mtd@lists.infradead.org; Wed, 18 Aug 2021 01:17:38 +0000
Received: by mail-ot1-f51.google.com with SMTP id
 n1-20020a9d1e810000b0290514da4485e4so798659otn.4
 for <linux-mtd@lists.infradead.org>; Tue, 17 Aug 2021 18:17:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eKtNQFzlTBGPaxfs2EmRb1riSIc24m2XgELeYM91Y4A=;
 b=Wrbc/LF/6d2UxyN8x/wF3Ay/0IKtYQ2rDonK7CCXzTBq9PLpYImpnFsZ9C86UXhg/9
 tQIJIzTfEl4LOJ5r+FOyv5/gztsp1Qjkf5IB/dBCxak+xw4jA5ruam2dGPV+YnPdCdPL
 L1Jui4rLm9M+uUVik74XzDZ75s5sdw04Wewt9KWLMqxyciGNDQayU8QtSl/3aNHJ7hIv
 pGLoUCQU3o3I24c7l4i48JkhLoGOh2K+vX6DOQ1+PL0YrvB64oIMpbf14oE8ztVlemdZ
 CIEt1ohp+sQ9g2Wu1hVDPx6V1M8PY4zmYp4lMqvTheLifwFHDwbKDtbbmls7aQ1/YtSF
 oQIg==
X-Gm-Message-State: AOAM530fmCoMSABU6LtrNuBcwwtR+mtEBDtRcWsoClSfd7UDvxXW/3ld
 diIkR/yJR+Br7OF52txiZQ==
X-Google-Smtp-Source: ABdhPJwU/r4DfRsxBODbwZOAT7Fuj3KBuNK588MGjUDZF59lolTrMg3kNGSScZqTWBSlXRqF+y+4aw==
X-Received: by 2002:a9d:a12:: with SMTP id 18mr4963065otg.252.1629249456779;
 Tue, 17 Aug 2021 18:17:36 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id p26sm752775ota.71.2021.08.17.18.17.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 18:17:36 -0700 (PDT)
Received: (nullmailer pid 1178148 invoked by uid 1000);
 Wed, 18 Aug 2021 01:17:34 -0000
Date: Tue, 17 Aug 2021 20:17:34 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 Vignesh Raghavendra <vigneshr@ti.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-spi@vger.kernel.org, 
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org, 
 Stefan Agner <stefan@agner.ch>, Nishanth Menon <nm@ti.com>,
 linux-staging@lists.linux.dev, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 linux-usb@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, 
 linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, 
 linux-media@vger.kernel.org, Peter Chen <peter.chen@kernel.org>, 
 Lucas Stach <dev@lynxeye.de>, Stephen Boyd <sboyd@kernel.org>,
 linux-clk@vger.kernel.org, 
 linux-pwm@vger.kernel.org, Richard Weinberger <richard@nod.at>, 
 Peter De Schrijver <pdeschrijver@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Viresh Kumar <vireshk@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-pm@vger.kernel.org, 
 Adrian Hunter <adrian.hunter@intel.com>, Rob Herring <robh+dt@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v8 24/34] media: dt: bindings: tegra-vde: Document OPP
 and power domain
Message-ID: <YRxfrvd2sR5ALeuX@robh.at.kernel.org>
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-25-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210817012754.8710-25-digetx@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_181737_479278_B5A73918 
X-CRM114-Status: GOOD (  11.48  )
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

On Tue, 17 Aug 2021 04:27:44 +0300, Dmitry Osipenko wrote:
> Document new OPP table and power domain properties of the video decoder
> hardware.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../devicetree/bindings/media/nvidia,tegra-vde.yaml  | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
