Return-Path: <SRS0=f8pO=NJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 706F6C4338F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 01:16:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CFEB600CC
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 01:16:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2CFEB600CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=82U8uteBIIIrLc5U7M4CHFJYr3X4HSwWSP8UwF1g3lo=; b=vjUWFz9LRJmI6o
	1BdvxOOjxZAigVZUjwo868fudzGYpA2zhMGReQQB7sEeMeEP9JxOYwSiuLWrm6piZ+n/Lw07oFqLq
	3HeCCYZDpF3GzyqEHWOyEH1DMA9O7JjNefheBN7LBqbA/OCDrMKie4VJbCmTevWwfA07trvtY5prC
	Q1fIKf6EH2pOOorgAKwtC1c/pEsQZ40YkFHXpdiFPv7I98Yp6Kup7i7vKtp7GBL/ocH5C3/sYRelO
	2vX08xcYezUls0GdUg8FvUt0U07GgU7a0InRAXwJNrGlJGu34dEJwAKIOAf3ACrv9b3PznF4fi/r9
	yr0PJZitUpyGy4oZZ81g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGAAj-003qeW-Ji; Wed, 18 Aug 2021 01:15:13 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGAAg-003qdn-OA
 for linux-mtd@lists.infradead.org; Wed, 18 Aug 2021 01:15:12 +0000
Received: by mail-ot1-f51.google.com with SMTP id
 r38-20020a05683044a600b0051a2c6dd421so798181otv.3
 for <linux-mtd@lists.infradead.org>; Tue, 17 Aug 2021 18:15:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RM2dmchpI6KmQKuD+RgubJedkIA6WkX9t/jyVLdUt3Q=;
 b=iBRGoydZTyuBw6Dgckmf6uFrdy/MclvF0953mmkFxW0Ujc8OmN5XE+y2yXIUr9Catd
 GBkMVDWM+Gex/qa2jgsQA5/LFd6wcb2hwg1bJTivmFQ5pV0VlsDF9HDQIGaYRWSgNIsc
 rhHuXuIPvIAxOAVczvNOp41kMjgFLDCkGYZE2XAzS1SxP/BbE9lQwYMH9jVlGnnKcvvE
 YkO4ota2qHkF9ZM/sMJY1pwzs54V8YaOrXoB55V+v5GOg52bOmTjEm/tPPiOmsfjsxG8
 z59KFwn8nafG15M4U77VbwfRPHZsMaodRnQe02kMchaH0Kot0EsEAW05jHoZDK8eDptU
 bNjg==
X-Gm-Message-State: AOAM532CCYgSLAWI9xcNwJDYtGmi5gOt+WDtriK/DYgHq2U0kX4tcpqr
 1H7fqdSM0C9pFKJZUIgzwA==
X-Google-Smtp-Source: ABdhPJydb95sxSyCE8JTQ37Yp3+d+zCUT2I4Mgdlk82Qz5QqNFm3xA06SoTPwD6X93TSb4zbZLUInw==
X-Received: by 2002:a05:6830:1f54:: with SMTP id
 u20mr4796930oth.320.1629249309809; 
 Tue, 17 Aug 2021 18:15:09 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id o7sm662196oih.34.2021.08.17.18.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 18:15:08 -0700 (PDT)
Received: (nullmailer pid 1174643 invoked by uid 1000);
 Wed, 18 Aug 2021 01:15:06 -0000
Date: Tue, 17 Aug 2021 20:15:06 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, Peter Chen <peter.chen@kernel.org>, 
 Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>, 
 Stefan Agner <stefan@agner.ch>, Adrian Hunter <adrian.hunter@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, 
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org
Subject: Re: [PATCH v8 06/34] dt-bindings: clock: tegra-car: Document new
 tegra-clocks sub-node
Message-ID: <YRxfGtWPXeSQXuHo@robh.at.kernel.org>
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-7-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210817012754.8710-7-digetx@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_181510_840513_BCB815C8 
X-CRM114-Status: GOOD (  22.04  )
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

On Tue, Aug 17, 2021 at 04:27:26AM +0300, Dmitry Osipenko wrote:
> Document tegra-clocks sub-node which describes Tegra SoC clocks that
> require a higher voltage of the core power domain in order to operate
> properly on a higher clock rates.  Each node contains a phandle to OPP
> table and power domain.
> 
> The root PLLs and system clocks don't have any specific device dedicated
> to them, clock controller is in charge of managing power for them.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/clock/nvidia,tegra20-car.yaml    | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
> index 459d2a525393..7f5cd27e4ce0 100644
> --- a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
> +++ b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
> @@ -42,6 +42,48 @@ properties:
>    "#reset-cells":
>      const: 1
>  
> +  tegra-clocks:
> +    description: child nodes are the output clocks from the CAR
> +    type: object
> +
> +    patternProperties:
> +      "^[a-z]+[0-9]+$":
> +        type: object
> +        properties:
> +          compatible:
> +            allOf:
> +              - items:
> +                  - enum:
> +                      - nvidia,tegra20-sclk
> +                      - nvidia,tegra30-sclk
> +                      - nvidia,tegra30-pllc
> +                      - nvidia,tegra30-plle
> +                      - nvidia,tegra30-pllm
> +              - const: nvidia,tegra-clock

You are saying the first string must be both one of the enums and 
'nvidia,tegra-clock'. You don't get an error because your pattern 
doesn't match 'sclk'.

> +
> +          operating-points-v2:
> +            $ref: /schemas/types.yaml#/definitions/phandle
> +            description:
> +              Phandle to OPP table that contains frequencies, voltages and
> +              opp-supported-hw property, which is a bitfield indicating
> +              SoC process or speedo ID mask.

Just 'operating-points-v2: true' is enough.

> +
> +          clocks:
> +            items:
> +              - description: node's clock
> +
> +          power-domains:
> +            maxItems: 1
> +            description: phandle to the core SoC power domain
> +
> +        required:
> +          - compatible
> +          - operating-points-v2
> +          - clocks
> +          - power-domains
> +
> +        additionalProperties: false
> +
>  required:
>    - compatible
>    - reg
> @@ -59,6 +101,15 @@ examples:
>          reg = <0x60006000 0x1000>;
>          #clock-cells = <1>;
>          #reset-cells = <1>;
> +
> +        tegra-clocks {
> +            sclk {
> +                compatible = "nvidia,tegra20-sclk", "nvidia,tegra-clock";
> +                operating-points-v2 = <&opp_table>;
> +                clocks = <&tegra_car TEGRA20_CLK_SCLK>;
> +                power-domains = <&domain>;
> +            };
> +        };
>      };
>  
>      usb-controller@c5004000 {
> -- 
> 2.32.0
> 
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
