Return-Path: <SRS0=rH0u=CD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A35D7C433E3
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 02:33:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 726B1205CB
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 02:33:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3MChGwuZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 726B1205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FQ4iBaCPOX5EUIu5cEC9Q7bXRcAdp6CbNLePqY5+guM=; b=3MChGwuZB4ZluuQEdmR49L/1S
	RKB41JDsRB3qhX7MDaqgP5qQOPC5WuXeHSahCX5OhVF44IhsClZ4HwJhnaFLqsxxShfNF4OcFdth0
	5jM0/CNraZVtJ9UifVv/KoE2H6IF0e2e1NjLT1LoVGtn6UPRzvd0ro2PLIFyUgX56Y6Ley1/SN7YF
	WYUHFVeq5GxhFvZ7DUxCHtotj06NAH50h7FstBXcH7C71pj+c1JnvBDfXUyvF9ZGis7kIupGvFGDe
	cj2lFR5mk0iAOrwHzfa8AtcsFdQabNHc9aLkobnypZem8Ft8Uh002AEGPwNyKrqVjVVJl1h5tJ00a
	tP2tRRrxQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAOlw-0003dh-4k; Tue, 25 Aug 2020 02:33:16 +0000
Received: from mail-io1-f65.google.com ([209.85.166.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAOlq-0003bc-MG; Tue, 25 Aug 2020 02:33:11 +0000
Received: by mail-io1-f65.google.com with SMTP id u126so10908337iod.12;
 Mon, 24 Aug 2020 19:33:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=H43msI5JRj2LcMenKGEQmRG6E4wQR/7Y4OelHrbihrY=;
 b=sZFO09tnC6dAKnXFDxPaA/bmcwIeOu14VE/2WduXmga+3a/i55SytoArRtpkoYGywi
 4kb+NEG+V+vaZSyBBIC8xCuZTGZfotesM98t+C+F2Xf/7OSBwycoPKsAUSK9uhAehK2P
 B7gJOcEGWpLzg6YE2DP84t0eAjVpYw2nTA876VkEOQ4demECjV3PeIawsaqEU4oMR6/p
 Ah/ZAc3BQORFTq7ioXKOKY4960rvfjRu39SHSqfAbTm4SLIYMi9sWCth34Jm83pX3n7t
 t0jC/aOxm7LfFq3XEw9CWJNMIABNto8JU5E/G5PMhUWTqxC3iaNETnfNDyh5y3SzsXS/
 g5SQ==
X-Gm-Message-State: AOAM530HKtbKVa1Jn9eUGUKaJ90g2ylMSEDecGlKbyE/ie8/WL1WPtZZ
 h1gacgGeUvkZm4pxnAIw3Q==
X-Google-Smtp-Source: ABdhPJwjKm9OGBSvE9aaROVwZBpZ1qegEuRkx0HYDWuDxHGrCBG6Ojcc63Xg2qHI6mLFPrK8gEU30w==
X-Received: by 2002:a5d:9344:: with SMTP id i4mr7316042ioo.106.1598322789714; 
 Mon, 24 Aug 2020 19:33:09 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id z9sm8181875ilm.78.2020.08.24.19.33.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 19:33:09 -0700 (PDT)
Received: (nullmailer pid 3828275 invoked by uid 1000);
 Tue, 25 Aug 2020 02:33:06 -0000
Date: Mon, 24 Aug 2020 20:33:06 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 03/19] dt-bindings: gpio: fsl-imx-gpio: Add parsing of
 hogs
Message-ID: <20200825023306.GA3827348@bogus>
References: <20200824162652.21047-1-krzk@kernel.org>
 <20200824162652.21047-3-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200824162652.21047-3-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_223310_759582_6A5CB9C9 
X-CRM114-Status: GOOD (  17.98  )
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
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-pm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org,
 Han Xu <han.xu@nxp.com>, linux-arm-kernel@lists.infradead.org,
 Fugang Duan <fugang.duan@nxp.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-mtd@lists.infradead.org,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Aug 24, 2020 at 06:26:36PM +0200, Krzysztof Kozlowski wrote:
> Allow parsing GPIO controller children nodes with GPIO hogs to fix
> warning:
> 
>   arch/arm64/boot/dts/freescale/imx8mq-evk.dt.yaml: gpio@30240000: 'wl-reg-on' does not match any of the regexes: 'pinctrl-[0-9]+'
>     From schema: Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml

The below change isn't going to fix 'wl-reg-on'?

> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../devicetree/bindings/gpio/fsl-imx-gpio.yaml  | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
> index dffd9171ea66..620a52f944e8 100644
> --- a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
> @@ -53,6 +53,23 @@ properties:
>  
>    gpio-ranges: true
>  
> +patternProperties:
> +  "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
> +    type: object
> +    properties:
> +      gpio-hog: true
> +      gpios: true
> +      input: true
> +      output-high: true
> +      output-low: true
> +      line-name: true
> +
> +    required:
> +      - gpio-hog
> +      - gpios
> +
> +    additionalProperties: false
> +
>  required:
>    - compatible
>    - reg
> -- 
> 2.17.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
