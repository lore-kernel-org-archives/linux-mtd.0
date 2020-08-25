Return-Path: <SRS0=rH0u=CD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E006CC433E1
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 02:35:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9219205CB
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 02:35:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oeBt2B/1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9219205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=F04cptygI/NOvV/3BxJk9x3g+OhPVYbQ6YJo++My6pQ=; b=oeBt2B/1Yc6EEBZ7dBZE+OIba
	0qZW97IFT3gsCJ8lxp9vTseHXmnHQoZHnQv/VugB6cztRHN1NnfF/Y5xBZ/DILkaVoG7nDEeHhDBz
	wadSPMVUE5QA7Sq0E7yQ7XR0KNvlViP7niBMtVOiizqGcZ4T1uk0+bQNWaLCjVleAxtXcOCaiWbMp
	1/DQsnJV85bKuf0FIgpTx8bs+oeTyOjQW+rM9o4GOyEdysSd4ZZH6La8YYiUcl+IFMSpiBggnugrN
	0SyK3KikGi8EHd1b3pPnBPnPT+CchDHsHwZ+DG8mhjwhFh0Y1TxG6sNASZE5++aPJQmyv3Pwiqkmd
	xwKZ3ecfQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAOnH-0004DS-7k; Tue, 25 Aug 2020 02:34:39 +0000
Received: from mail-io1-f65.google.com ([209.85.166.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAOn8-00049W-Qa; Tue, 25 Aug 2020 02:34:31 +0000
Received: by mail-io1-f65.google.com with SMTP id g14so10954740iom.0;
 Mon, 24 Aug 2020 19:34:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=x+blyISBX8O+J87PmHV8yJOc3lzp4xRnM8u5p0pFFIg=;
 b=ICevuk5WLVMXihE7VJqEWcEoQDJLLAq7FFT7/zymb4KDvRnKNyKOdlesVbYzGGXUM0
 ShttBVU6IRo79FyASRU/dOK8wrN0rylBxvkkTV0KxV2Jw0GEaFFr9CD2OACcEKP8MEEc
 OSM7IYzUQp6wo2zcPYky9a/2/JcZioEGtn0jn2zDbT7du522L51JaKaNNnWEm0+0KxtB
 x/T7LCX0ntNa6PFrciRPOD/VvITKY3za7D4L1OQ//0flh/ZFJikZGCBJn//73oIppxQX
 NwmwvO7oLS5oiYl0YDIGlSK8MHf8asOtb1JG3TJDiwbCWTb0HGMuAZFw6efxjeuo1l+e
 QGsw==
X-Gm-Message-State: AOAM532WXmyKQxdF4IvqQnMFZu/WEcPMiPX+MDZdPc1AR4liu+1E02yp
 +4SC9R7FOxzzst9OMu4I5g==
X-Google-Smtp-Source: ABdhPJyaOC5zeFjmqOlCITvDcH+xyOJiMMlCTxiAPZs0Jp5TJvT2SOBvfY371hTr4bWxDJkDMg8Z7A==
X-Received: by 2002:a6b:dc07:: with SMTP id s7mr7154074ioc.162.1598322870182; 
 Mon, 24 Aug 2020 19:34:30 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id l2sm8443510ilt.2.2020.08.24.19.34.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 19:34:29 -0700 (PDT)
Received: (nullmailer pid 3830713 invoked by uid 1000);
 Tue, 25 Aug 2020 02:34:26 -0000
Date: Mon, 24 Aug 2020 20:34:26 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 06/19] dt-bindings: pwm: imx-pwm: Add i.MX 8M
 compatibles
Message-ID: <20200825023426.GA3830470@bogus>
References: <20200824162652.21047-1-krzk@kernel.org>
 <20200824162652.21047-6-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200824162652.21047-6-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_223430_944228_D381DC3E 
X-CRM114-Status: GOOD (  13.82  )
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
 Miquel Raynal <miquel.raynal@bootlin.com>, Will Deacon <will@kernel.org>,
 Fabio Estevam <festevam@gmail.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-serial@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Guenter Roeck <linux@roeck-us.net>, linux-pwm@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Han Xu <han.xu@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Fugang Duan <fugang.duan@nxp.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Li Yang <leoyang.li@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-mtd@lists.infradead.org, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 24 Aug 2020 18:26:39 +0200, Krzysztof Kozlowski wrote:
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
> ---
>  Documentation/devicetree/bindings/pwm/imx-pwm.yaml | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
