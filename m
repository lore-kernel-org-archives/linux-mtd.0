Return-Path: <SRS0=rH0u=CD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12C24C433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 02:32:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6247205CB
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 02:32:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cfKlnPEC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6247205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=et4KmZ4Z+Pj55W/ePbHjf/69Ykokm1OaVlR8wlt8FGk=; b=cfKlnPECpalWH4RzyV2kxC6Yc
	K1C116EvL8fgp/AUt8Q1KQaRfLPEH09sWvw6NfhncmfIVH7SLcZuJVAxbec2g/vKNLWzOXnYMbs5w
	HNZTLKvVZuPgJVo+QIjQrAk6937N0xG9Tj+yfzPX1KKSAUDfUFvuctzbgAoF8Etyms9f6XtmMqP4y
	WcXlWd9G1VCOx2JkMEu1Uti0Fz6O0HgzOLdnt0cwoJ5lXVqQF1s5X99UT4MepTlnWV3bGTkTw40Cr
	engRkn0rlA9K1aTRc6HoSEX5S1FU/qJEuRv5s8XtcRSYefluaRBhjBbb9UoT5x91mmL62KOkR9W4D
	JTULk7irw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAOjw-0003C4-BB; Tue, 25 Aug 2020 02:31:12 +0000
Received: from mail-il1-f194.google.com ([209.85.166.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAOjr-0003Aw-O2; Tue, 25 Aug 2020 02:31:08 +0000
Received: by mail-il1-f194.google.com with SMTP id f12so9139450ils.6;
 Mon, 24 Aug 2020 19:31:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PXYDf+qDwAgwtB6BXfF4E9zdnola8K+rSCAg7rcKWX8=;
 b=GVvL1mp2ZY5IfCX+ULdJut5y+jLGNzlh7JCu+q8czubiUn+8EzYvbj4subLcXBglFt
 9xkizAjrAu6tBlna5XSLYugQ/BbSJ5q5KuUgHC1wX0SXFh5T58WmDPDf8pfLDnsgis4b
 gmlQmcfRWKaYYvRpj5PpE6eCiAtTIc1UhZiFv+a3sDL1mpTbmuO/Qn9XZBoC8YKRPyti
 utG8lsVcr4UfCAUDv1569xHqzkmt8KbYJHqL4gqB/IoGl1NzZqW1Zph3NRQxs+kQ/fRo
 QQRJmwtDbUehAr8JLCPwKCIqY4hD2E85NaoUi4rm3HlMA17St/t0leow73JDMTyWpP3e
 wAKA==
X-Gm-Message-State: AOAM530Cv3/aEzS8GGi3/HDrHL8Lv0cflfndVwzznl/qQqV0D55qbkIY
 kRP1igklQzdv8YjWQfvyHw==
X-Google-Smtp-Source: ABdhPJyGDaoxihkaEsUnsTnN1juKRfLn0VDzxtnao8PSrNSlwaaCfOoXA1iVGDNuEkEW0fSsETPJ5g==
X-Received: by 2002:a92:ba02:: with SMTP id o2mr7216574ili.3.1598322665441;
 Mon, 24 Aug 2020 19:31:05 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id q23sm7699137ior.47.2020.08.24.19.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 19:31:04 -0700 (PDT)
Received: (nullmailer pid 3824789 invoked by uid 1000);
 Tue, 25 Aug 2020 02:31:00 -0000
Date: Mon, 24 Aug 2020 20:31:00 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 01/19] dt-bindings: gpio: fsl-imx-gpio: Add i.MX 8
 compatibles
Message-ID: <20200825023100.GA3824736@bogus>
References: <20200824162652.21047-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200824162652.21047-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_223107_821096_B18A64E6 
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
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Will Deacon <will@kernel.org>,
 linux-watchdog@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-serial@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-pm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Han Xu <han.xu@nxp.com>,
 linux-arm-kernel@lists.infradead.org, Fugang Duan <fugang.duan@nxp.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Li Yang <leoyang.li@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-mtd@lists.infradead.org, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 24 Aug 2020 18:26:34 +0200, Krzysztof Kozlowski wrote:
> DTSes with new i.MX 8 SoCs introduce their own compatibles so add them
> to fix dtbs_check warnings like:
> 
>   arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml: gpio@30200000:
>     compatible:0: 'fsl,imx8mm-gpio' is not one of ['fsl,imx1-gpio', 'fsl,imx21-gpio', 'fsl,imx31-gpio', 'fsl,imx35-gpio', 'fsl,imx7d-gpio']
>     From schema: Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
> 
>   arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml: gpio@30200000:
>     compatible: ['fsl,imx8mm-gpio', 'fsl,imx35-gpio'] is too long
> 
>   arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml: gpio@30200000:
>     compatible: Additional items are not allowed ('fsl,imx35-gpio' was unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../bindings/gpio/fsl-imx-gpio.yaml           | 21 +++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
