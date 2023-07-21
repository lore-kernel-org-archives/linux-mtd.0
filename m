Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 864FDC001DC
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jul 2023 14:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zQvexkv/IXVnfSc7jvU+4fvM2diKWopAHmBNS09q0kw=; b=McnOa5Qe83yKuS
	uMkEyz123qyFM0R7BTMpSdolQGxaKnUv+FCwy0W3YKCemgy8usY+cNdGsOqRmQNgn0eNiy1NJwLIw
	8xISNnO4bqBa8eXAo3exwdu78VpECoOA44YimGxT2maPACCEOIuMGEmPVU7eo1IfzF+RuLhMmJudx
	Ltys/ZmW0VL8jl3X0YCnMJrF9LEVDgnvs0F9ci2MgWACtSqZGLJ4zpKbuzMYsnHiwpvLtXp24IFBn
	v4lz71C4gajYQPbfccx0w3WF0BgjjhK+XTX8hHvL/1KPhhb8r3rmFBxtcEH9k5kZiGkwhAyF29Cca
	Z83YCqi2MPtyXcqhfTqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMqha-00EE55-02;
	Fri, 21 Jul 2023 14:01:50 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMqhW-00EE4N-0C
	for linux-mtd@lists.infradead.org;
	Fri, 21 Jul 2023 14:01:47 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3143b88faebso1684018f8f.3
        for <linux-mtd@lists.infradead.org>; Fri, 21 Jul 2023 07:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689948104; x=1690552904;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kGZ5LqU0Zryf5RXxHBpf5dofqREFTyZTeFWlFYPBfA8=;
        b=ZiVB2hHSTZRmiaMmbMREaMhbawMx/KUt3cg1qeF1gBfCQQAGIBGPHjWK50hX362tpU
         fMapfTUkHNiMW2EcbBz3SgWGkAp6pnHxDhqm4HHqfVuIIfYvxWb4ogcWbai4vpYhJADI
         nWulY7lsgECJ57xXy/eajLo129aMmkczTVRAjkIe0wiSagmvvtOEMM8dttszF+P0remm
         RGTV8zYGxv0/wyu9CCIL2fyYMd0tbEu3edlaV1yZeI84Bkx+jEwwKA/R03nUuupkA/DL
         bFjJcVPJ1Os8KPfwF5c406w0MGIwcfg3il9N5GJ9UXq+jvImjTaQ3Zov5AQGHQM9OcQ+
         H5mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689948104; x=1690552904;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kGZ5LqU0Zryf5RXxHBpf5dofqREFTyZTeFWlFYPBfA8=;
        b=cL+5UeFfESeNVzXz4HnCpwYjeXCzs9RHDyLyLh9NKu9Ew2M8iWimFqWFiZjblSLqxl
         /pnR8lHuCPj9Dk49J/w3qpg1/4zqfQZXX2BDX487dtF5EDtOCrT6I9fvRNf+tQSKnsZr
         utx5MstgoOT848KixeVcgq3bJAFrVNV5uWBFt5j643jRsrX6DkvCH1E/vo2ZaAtwYIED
         O2hsgsZEWIGg66qJDbP8KcAGtSGwgTlDYcLhy2/c3JpHTqrxmNuym75F3Py6f1RPrPtz
         fMqRZ1+ByOmP/orbmK/DrWp2n7awpAlT9MoP3IyhcM8yP1e3I4aPm21dy/fwuYClo9HI
         ioiQ==
X-Gm-Message-State: ABy/qLZAT8iiAGHgVPp+kBx+DsrFYykkOsfr0Ycywl8ixfSLGNjBX8q+
	oy6h+zMeIHCjwLD54pKZfWPA9g==
X-Google-Smtp-Source: APBJJlFl0X021T0an8cBRN2rsT+BJ+nZ0MYlRyFEpg2gd2RFuh46KGFuFZP+LfRCosw99RkgkE80Jg==
X-Received: by 2002:adf:ea50:0:b0:314:2732:e81e with SMTP id j16-20020adfea50000000b003142732e81emr1636390wrn.8.1689948103685;
        Fri, 21 Jul 2023 07:01:43 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id r5-20020adff105000000b003145521f4e5sm4278545wro.116.2023.07.21.07.01.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jul 2023 07:01:42 -0700 (PDT)
Message-ID: <66fba798-c6ef-1105-656a-5d593a056448@linaro.org>
Date: Fri, 21 Jul 2023 16:01:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 04/42] dt-bindings: pinctrl: Add Cirrus EP93xx
Content-Language: en-US
To: nikita.shubin@maquefel.me, Hartley Sweeten
 <hsweeten@visionengravers.com>, Lennert Buytenhek <kernel@wantstofly.org>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Lukasz Majewski <lukma@denx.de>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Alessandro Zummo
 <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Sebastian Reichel <sre@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Mark Brown <broonie@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Damien Le Moal <dlemoal@kernel.org>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Andy Shevchenko <andy@kernel.org>,
 Michael Peters <mpeters@embeddedTS.com>, Kris Bahnsen <kris@embeddedTS.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-ide@vger.kernel.org,
 linux-input@vger.kernel.org, alsa-devel@alsa-project.org
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
 <20230605-ep93xx-v3-4-3d63a5f1103e@maquefel.me>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230605-ep93xx-v3-4-3d63a5f1103e@maquefel.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_070146_108018_1F22C642 
X-CRM114-Status: GOOD (  18.67  )
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

On 20/07/2023 13:29, Nikita Shubin via B4 Relay wrote:
> From: Nikita Shubin <nikita.shubin@maquefel.me>
> 
> Add YAML bindings for ep93xx SoC pinctrl.
> 
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../bindings/pinctrl/cirrus,ep9301-pinctrl.yaml    | 58 ++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/cirrus,ep9301-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/cirrus,ep9301-pinctrl.yaml
> new file mode 100644
> index 000000000000..d5682531b0da
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/cirrus,ep9301-pinctrl.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/cirrus,ep9301-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cirrus ep93xx pins mux controller
> +
> +maintainers:
> +  - Nikita Shubin <nikita.shubin@maquefel.me>
> +  - Alexander Sverdlin <alexander.sverdlin@gmail.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: cirrus,ep9301-pinctrl
> +      - items:
> +          - enum:
> +              - cirrus,ep9302-pinctrl
> +              - cirrus,ep9307-pinctrl
> +              - cirrus,ep9312-pinctrl
> +              - cirrus,ep9315-pinctrl
> +          - const: cirrus,ep9301-pinctrl
> +
> +patternProperties:
> +  '^pins-':
> +    type: object
> +    description: pin node
> +    $ref: pinmux-node.yaml#

You need:
unevaluatedProperties: false



Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
