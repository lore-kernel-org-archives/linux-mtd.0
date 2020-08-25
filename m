Return-Path: <SRS0=rH0u=CD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9C97C433E1
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 02:36:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 643D4205CB
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 02:36:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZMNnzdOX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 643D4205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gyCJ3kwOnL04PVPDgPVuAOARKZRyxW5CNwUUuMhfUJs=; b=ZMNnzdOX6J8UWSiLG4PkqcGXW
	wGWK7G6UfS5ofnVrom2a2OfN4YSAaUdfFKoBWuszDzMAyhK4+FxeDdib1wh9j1yqaPESKYAVeKoKZ
	ULpnnOJ5z2MOeIZRwO5SrhjzY57NdT9ps/Nt4QBeP8l7Wxz4hnqNUv7xOWFBpCx99y78U5kDqASGR
	5Ni6dH1nM+4txTaQma8f7Pt3dLzsHnRNHaS1vfued1DpF6GylS8cMVJnOjKadhYZGI8tV3I/pOucx
	cgQJwcQkunTuKiSGCxPOkyqVCclAm1CbmF4zoiexHl4v1rFaMmt3wTf2K/JDGtBdC5H7pEElG90a7
	gc7AzatWA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAOnp-0004V6-5M; Tue, 25 Aug 2020 02:35:13 +0000
Received: from mail-il1-f196.google.com ([209.85.166.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAOnZ-0004Ne-Uk; Tue, 25 Aug 2020 02:34:58 +0000
Received: by mail-il1-f196.google.com with SMTP id t13so9122090ile.9;
 Mon, 24 Aug 2020 19:34:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tJoEimkJnnwHgVvCDUgwBHtlZ+InQ3zd0Y0pHOOD44A=;
 b=n1824paLIq2G4ZwhSciQonyGeeezBdhKERRY38UPOe7To63BUECWPwSU7eMXcYBtBL
 CO4ni/oLi76Ky0MykcOVIhXRyBzy32bXu/xzVdD88PSzNEpz9LcZhkIOUH0m1WV76T/v
 L2Jvc0dvqBmt5LC0EGLBI7LUFXBIXUKlOJdV0Xh8u4Mn9DeV8pNiOcqKbHHfK4+1X7M9
 QqDcOkhkcbEis4+QUZCxYwJhglxmxhzfw4javNcJ1byNEJVhvEd6XPfJClcHEJi2qEZA
 fbFQ0mqwL6sfoMCnwwh4mNSRehZItr3GFQkCsE9xjgM7AEAlDGP4zga0r74RT5AVVOTV
 cvKA==
X-Gm-Message-State: AOAM530LJWr1IlnEeKVbZ85Yldj1fvO4brsHF2P76yA3lL+hQisfZs8x
 oCjpmtrU7KhxCAN3dPWoHaKqnqzcS8x+
X-Google-Smtp-Source: ABdhPJxJDM8Rm0sqb3pMsMUWmt3xwf6oKOYlRQcH0/WBoIjcLgToUP0hvDtz23rTAV3yN9ZWGmPtow==
X-Received: by 2002:a92:cccb:: with SMTP id u11mr4379380ilq.54.1598322897200; 
 Mon, 24 Aug 2020 19:34:57 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id r9sm8237287iln.18.2020.08.24.19.34.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 19:34:56 -0700 (PDT)
Received: (nullmailer pid 3831534 invoked by uid 1000);
 Tue, 25 Aug 2020 02:34:54 -0000
Date: Mon, 24 Aug 2020 20:34:54 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 07/19] dt-bindings: serial: fsl-imx-uart: Add i.MX 8M
 compatibles
Message-ID: <20200825023454.GA3831482@bogus>
References: <20200824162652.21047-1-krzk@kernel.org>
 <20200824162652.21047-7-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200824162652.21047-7-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_223458_050243_69A3C0A1 
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
 devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Frank Li <frank.li@nxp.com>, Thierry Reding <thierry.reding@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Fabio Estevam <festevam@gmail.com>,
 linux-watchdog@vger.kernel.org, Will Deacon <will@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-serial@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Guenter Roeck <linux@roeck-us.net>, linux-pwm@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-pm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Han Xu <han.xu@nxp.com>,
 linux-arm-kernel@lists.infradead.org, Fugang Duan <fugang.duan@nxp.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Li Yang <leoyang.li@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-mtd@lists.infradead.org, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 24 Aug 2020 18:26:40 +0200, Krzysztof Kozlowski wrote:
> DTSes with new i.MX 8M SoCs introduce their own compatibles so add them
> to fix dtbs_check warnings like:
> 
>   arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml: pwm@30660000:
>     compatible:0: 'fsl,imx8mm-pwm' is not one of ['fsl,imx1-pwm', 'fsl,imx27-pwm']
>     From schema: Documentation/devicetree/bindings/pwm/imx-pwm.yaml
> 
>   arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml: pwm@30660000:
>     compatible: ['fsl,imx8mm-pwm', 'fsl,imx27-pwm'] is too long
> 
>   arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml: pwm@30660000:
>     compatible: Additional items are not allowed ('fsl,imx27-pwm' was unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. Fix subject prefix
> ---
>  Documentation/devicetree/bindings/serial/fsl-imx-uart.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
