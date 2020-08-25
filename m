Return-Path: <SRS0=rH0u=CD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8110BC433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 02:34:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E06F205CB
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 02:34:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3dAgEfmY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E06F205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yfxJWaJ2PHt6xdSyT6J38kOklX7VJUWAa3EX17S86zI=; b=3dAgEfmYeTXwTpt3WKTFsPml2
	/z5ktgSbLag16oZA9FUWRrmZPxqxFaY10z+guW+342rbVgviAAeWnByWepaPXmRibEdrgxRwuh0Oa
	heJtTWysb+2kgRC924ov3cBpoq0nuUSKyaCITq/9lL7e8Av8E36BBd5ZG86kWpzX1+n1LrEyCBcjd
	7DLqnPLwwTsK8DmwENyUyr6QCqYbW0AzReUoG+59h9jNhUV5lDBx5+VrnYqvQVpUL9/bP6zL5W0iC
	Pq6FdbueafWLIXqSBquAJB+cyOTg7VmVV5W5HHfkQ9MVj1HwmRgm14cVYRWq9kaMb7uFie2XbHLdy
	FLB1dmxyg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAOmj-0003w8-Id; Tue, 25 Aug 2020 02:34:05 +0000
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAOmb-0003sr-Ey; Tue, 25 Aug 2020 02:33:58 +0000
Received: by mail-io1-f68.google.com with SMTP id i10so5345178iow.3;
 Mon, 24 Aug 2020 19:33:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/Oeflr950v3vzi5vgtx6gn5KhGz/f3JvqtlRnQZ3nOI=;
 b=hNGUJ3PsMP78MT5xHaeJFF54qZCmv2Hlhb/h9qCXHwY1gXXeS1mZQ7Yz/kXXs0fQ/H
 f12vJ4E0Be6WLkEAW6sShK2qyUk5Y6UNaJ1kmlBZ3cHV1Fwu4LlaeBLoSC53hAkGANur
 FISYZG+/fMejgDSmKJjEsMiDZICNdJOS1iWcipScrK72Umhae4bT/UKHe58IlWpsPsaA
 etvMXRyLbfrPQ+dZkKE6WOArrPgHcOcIBSYq0i8YZ2auJ2XfkIvGJxQsFoUiUNUJI5iV
 z8OCv/9EPNIP4ZEApEjVDgev4eR7kQaXzz5MiE9kzVYrUWa4lxFdbRMvNETI/L/YM6Eu
 cLyg==
X-Gm-Message-State: AOAM533tSTKGwRICubqQMPJyDq7c/kHdVmy9D5N/1QrO4gd9hRwlaxFF
 TCq4b/05D6Cnxp1i+41ujw==
X-Google-Smtp-Source: ABdhPJxcLnIE5DG8OXE3nWKElArXouriTFLBAy0h+AmmjKjL5G26cEcxX6Jf8o8sMG44HpmpURSJUA==
X-Received: by 2002:a02:8791:: with SMTP id t17mr8167190jai.68.1598322836741; 
 Mon, 24 Aug 2020 19:33:56 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id e22sm180808ioc.43.2020.08.24.19.33.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 19:33:56 -0700 (PDT)
Received: (nullmailer pid 3829700 invoked by uid 1000);
 Tue, 25 Aug 2020 02:33:52 -0000
Date: Mon, 24 Aug 2020 20:33:52 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 05/19] dt-bindings: perf: fsl-imx-ddr: Add i.MX 8M
 compatibles
Message-ID: <20200825023352.GA3829646@bogus>
References: <20200824162652.21047-1-krzk@kernel.org>
 <20200824162652.21047-5-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200824162652.21047-5-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_223357_546084_95899DA9 
X-CRM114-Status: GOOD (  13.61  )
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
 linux-pwm@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Frank Li <frank.li@nxp.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Will Deacon <will@kernel.org>, linux-watchdog@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-serial@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-pm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Han Xu <han.xu@nxp.com>,
 linux-arm-kernel@lists.infradead.org, Fugang Duan <fugang.duan@nxp.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Li Yang <leoyang.li@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 24 Aug 2020 18:26:38 +0200, Krzysztof Kozlowski wrote:
> DTSes with new i.MX 8M SoCs introduce their own compatibles so add them
> to fix dtbs_check warnings like:
> 
>   arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml: ddr-pmu@3d800000:
>     compatible:0: 'fsl,imx8mm-ddr-pmu' is not one of ['fsl,imx8-ddr-pmu', 'fsl,imx8m-ddr-pmu', 'fsl,imx8mp-ddr-pmu']
>     From schema: Documentation/devicetree/bindings/perf/fsl-imx-ddr.yaml
> 
>   arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml: ddr-pmu@3d800000:
>     compatible: ['fsl,imx8mm-ddr-pmu', 'fsl,imx8m-ddr-pmu'] is too long
> 
>   arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml: ddr-pmu@3d800000:
>     compatible: Additional items are not allowed ('fsl,imx8m-ddr-pmu' was unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. Handle also fsl,imx8mp-ddr-pmu
> ---
>  .../devicetree/bindings/perf/fsl-imx-ddr.yaml    | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
