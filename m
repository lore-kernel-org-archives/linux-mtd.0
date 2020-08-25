Return-Path: <SRS0=rH0u=CD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8244EC433E5
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 02:36:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B13E20866
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 02:36:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bbgh/RA/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B13E20866
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=10RM3K1IwTxA8BK+hFYxnlLQXnTdSYUmJgfA+1DJH0U=; b=bbgh/RA//NYD5U4JR8ki57oT8
	UfNFCI4hbb6smgUizRsss5nwG/+noXyNREet+H6he4BylC5RtgK5ZTDxe32uoQa8MwtrDcYxRBPdf
	vLE2Q8NlbNaUdpfRcF+NUAgLEj8NFKKRWl4emHS2J+pNoHfN3u3d9jeANM7rYcqTi7JqiSxRDqm8k
	GkL38wkO6B3WkKaDrcmGTuI5DFCNQrIZ2xhnevn5l8h/umrwe3vvpBmOTxiehI1EYyj1cIxYttQs+
	Y8qI4Agn6S/jbZ1m5pyAbMx0i+QMPmlQQJYwQ2UFOY7bmWRpMmcQUfLnkTpX7WucrwwQwI8a3gZIT
	H4jhWtC/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAOoA-0004ho-L1; Tue, 25 Aug 2020 02:35:34 +0000
Received: from mail-il1-f195.google.com ([209.85.166.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAOo6-0004f9-Dg; Tue, 25 Aug 2020 02:35:31 +0000
Received: by mail-il1-f195.google.com with SMTP id r13so9160920iln.0;
 Mon, 24 Aug 2020 19:35:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nwawe6M2knG0oRqB4aAeMIgRNRbECD+1OsbG/izAEU4=;
 b=jOoUnZ9c5zmH6ti6ZNA54DU+CmPklp1GpcaqllQghfYJbzvgWmKUW8i6WbpUNJ+8GG
 0R6EpdMjj4XWxC1r5d+5+A3AIutsjaGclwLIYNQLedSPT4CNY2ppHM99LtYRuHKAe3mB
 Z2n7uJFRgM/RHpVB8GfMIDgY8WwxVZP7bM4MNpUqXG2hYGJByPvDimeQSW7M+v5wY9Ms
 gVWdWdxB/64P99hdsVDf6L9s6mlFwqvibWgJ4WOCpSdtZVlfUSZLLXqRyPWby0uNQRDU
 zryaTzIo8mGw0E91d2Fbp0WohSpUBXUs9cAfH+T6A9fbhQGePmZJ0FK+dBhtd75HT3h9
 Pa1Q==
X-Gm-Message-State: AOAM531rNRl/jSsWOB1D+qEXmYDs3C55GRS59umljEQWdu0UHMBl+npA
 ewwHJ/ExFCl6p/BkWrl4fg==
X-Google-Smtp-Source: ABdhPJwAj/iRt3ci1c1YwSz9E8RvpsvwdZ0N7LJ6yp0fW2ifq2U014hkO6qUMIKaIjZtLMXFYY7aWQ==
X-Received: by 2002:a92:a1c5:: with SMTP id b66mr3912145ill.71.1598322929606; 
 Mon, 24 Aug 2020 19:35:29 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id r2sm8312783ila.22.2020.08.24.19.35.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 19:35:29 -0700 (PDT)
Received: (nullmailer pid 3832494 invoked by uid 1000);
 Tue, 25 Aug 2020 02:35:26 -0000
Date: Mon, 24 Aug 2020 20:35:26 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 08/19] dt-bindings: watchdog: fsl-imx-wdt: Add i.MX 8M
 compatibles
Message-ID: <20200825023526.GA3832442@bogus>
References: <20200824162652.21047-1-krzk@kernel.org>
 <20200824162652.21047-8-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200824162652.21047-8-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_223530_534036_C9B554F1 
X-CRM114-Status: GOOD (  13.81  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Frank Li <frank.li@nxp.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Will Deacon <will@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-serial@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Guenter Roeck <linux@roeck-us.net>,
 linux-pwm@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-pm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Han Xu <han.xu@nxp.com>, linux-arm-kernel@lists.infradead.org,
 Fugang Duan <fugang.duan@nxp.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 24 Aug 2020 18:26:41 +0200, Krzysztof Kozlowski wrote:
> DTSes with new i.MX 8M SoCs introduce their own compatibles so add them
> to fix dtbs_check warnings like:
> 
>   arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dt.yaml: watchdog@30280000:
>     compatible:0: 'fsl,imx8mm-wdt' is not one of ['fsl,imx21-wdt']
>     From schema: Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
> 
>   arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dt.yaml: watchdog@30280000:
>     compatible: ['fsl,imx8mm-wdt', 'fsl,imx21-wdt'] is too long
> 
>   arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dt.yaml: watchdog@30280000:
>     compatible: Additional items are not allowed ('fsl,imx21-wdt' was unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../devicetree/bindings/watchdog/fsl-imx-wdt.yaml     | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
