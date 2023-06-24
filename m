Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51FC1C001DE
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Jun 2023 07:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kmtqosMtfQkwIRbM8iL0ZXv99WY1iiYIUUnc3AFIP38=; b=4bNeJODJNpVArQ
	k1H61NZe3sWsIz2HEcCqpejISDrikQkX8NwJIXwqGAX4ond4Xoy3MIaWqFLfq3r5DY22zomi85a4K
	FK4McPhofQZtyiKf7b37Y8zZGrUJK9kwqnwleg6fUBkvnwmJtnPtr/itJKQBqym0ghQtwL8BnE8n1
	yVHeUq1NElNM6Y0x1l9uPL9lXA+XRCZi3by2P6SDd1ZsLjgrxthlyEDBVF4Mmh3x39fV39zmeBinn
	clyMvis7KGsVs4qWdxPs+NuVRAxyRuN/sQPzdL7S+mPCV8uzP0W9Lf/u/v4KA0+bh4wGly46iU+VU
	UJhC27AfA0yB0FGbWGdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCyBQ-005TvW-0k;
	Sat, 24 Jun 2023 07:59:48 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCyBM-005TtQ-2J
	for linux-mtd@lists.infradead.org;
	Sat, 24 Jun 2023 07:59:46 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-98df6bc0048so24297466b.1
        for <linux-mtd@lists.infradead.org>; Sat, 24 Jun 2023 00:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687593583; x=1690185583;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FTjB3MUThuy0fH56tPu8r2SapKpsQyQgWZ4G2iu3Iz8=;
        b=HEwevcjVQu+8yO3NUrkkTGxP0CcIpGsLiEQXCTRo3UkbkAEAAtNC0UlY9ftejwavbS
         WPfQTRQVl1GcrgXT/jwnimlNGGTxk1BasUFrZ0+zaXN90t4zsCJHF8eP/rzPh9y7q75O
         DrmxzN2V5bro/a7Yjn2JaR+shcHxeMnMBPEOsxKHS90sJWabsHm/pELi2kj5UnO7u9RD
         LnX93Xk9EYFZE7c3mDCbNFjt6xfev1h30nRmSxtXhBhzhBmUqIahBD/KcUlZwriKT34w
         oFkzPzPGaxAQxWKiI+DomOOYGd+hKHvLudnuiUccthDx082FzhV3uj+CPG6toFmF8/Bz
         rhrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687593583; x=1690185583;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FTjB3MUThuy0fH56tPu8r2SapKpsQyQgWZ4G2iu3Iz8=;
        b=BONEgcR+IetMPNoVJvbAaV8dE+FSy94lrPnIhprwSIO1xrGmg3IIe0ny7A3hKmE/ej
         o9knzDMQxX001ybY58EaDeRLtvwAJ8T6mu8hfGXS/4kDIv9nnCEFXaJNHHe5eC4G0eeu
         UZV7au/1LvX/x07KnARa86Jy2FvJYEgJLzDx+a9ypD3pfOK7+/zolPqa7ZwH8OUeHuyu
         3j4cdLLmHnjwcVA57Zo2SbLeCF8VIf7sVhXVzSMinc/L0uCyFoISXwL/MwC2fqYmjgil
         hkTeWPs9ajfZOyaHInWWnwALTo0V34QkzMfks1qAiIsG9VmTVpDu8SNvkPcM9GGzOc++
         Mfpw==
X-Gm-Message-State: AC+VfDzpJpY3zr+LijXHQpcCEaawHuf4UJWcO3sDQPrSUyvXS3lI43bb
	1N+1umnf9WqS65dJsw6fQjCU1w==
X-Google-Smtp-Source: ACHHUZ5pRd8UNSYc52Q0vkUp3nRCIrlMv+cEYLJxjAGxSYuFwmJusDkYkiVv0idqnJteffrCHMZ8Sg==
X-Received: by 2002:a17:907:783:b0:988:dced:f339 with SMTP id xd3-20020a170907078300b00988dcedf339mr12750156ejb.31.1687593583035;
        Sat, 24 Jun 2023 00:59:43 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id t23-20020a170906179700b00987f64b84afsm597458eje.39.2023.06.24.00.59.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 00:59:42 -0700 (PDT)
Message-ID: <7c0025cc-ed36-f4e1-d48d-d09326756d89@linaro.org>
Date: Sat, 24 Jun 2023 09:59:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 16/45] dt-bindings: crypto: add bindings for sam9x7 in
 Atmel TDES
Content-Language: en-US
To: Varshini Rajendran <varshini.rajendran@microchip.com>,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org,
 tglx@linutronix.de, maz@kernel.org, lee@kernel.org, ulf.hansson@linaro.org,
 tudor.ambarus@linaro.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linus.walleij@linaro.org, p.zabel@pengutronix.de, olivia@selenic.com,
 a.zummo@towertech.it, radu_nicolae.pirea@upb.ro, richard.genoud@gmail.com,
 gregkh@linuxfoundation.org, lgirdwood@gmail.com, broonie@kernel.org,
 wim@linux-watchdog.org, linux@roeck-us.net, arnd@arndb.de, olof@lixom.net,
 soc@kernel.org, linux@armlinux.org.uk, sre@kernel.org,
 jerry.ray@microchip.com, horatiu.vultur@microchip.com,
 durai.manickamkr@microchip.com, andrew@lunn.ch, alain.volmat@foss.st.com,
 neil.armstrong@linaro.org, mihai.sain@microchip.com,
 eugen.hristev@collabora.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-pm@vger.kernel.org
Cc: Hari.PrasathGE@microchip.com, cristian.birsan@microchip.com,
 balamanikandan.gunasundar@microchip.com, manikandan.m@microchip.com,
 dharma.b@microchip.com, nayabbasha.sayed@microchip.com,
 balakrishnan.s@microchip.com
References: <20230623203056.689705-1-varshini.rajendran@microchip.com>
 <20230623203056.689705-17-varshini.rajendran@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-17-varshini.rajendran@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230624_005944_760778_517DA590 
X-CRM114-Status: GOOD (  13.87  )
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

On 23/06/2023 22:30, Varshini Rajendran wrote:
> Add DT bindings for atmel TDES.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  .../devicetree/bindings/crypto/atmel,at91sam9g46-tdes.yaml   | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-tdes.yaml b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-tdes.yaml
> index 3d6ed24b1b00..0e71bfd32a1c 100644
> --- a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-tdes.yaml
> +++ b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-tdes.yaml
> @@ -12,7 +12,10 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const: atmel,at91sam9g46-tdes
> +    oneOf:
> +      - items:
> +          - const: atmel,at91sam9g46-tdes
> +          - const: microchip,sam9x7-tdes

Same as in other cases, so just to avoid applying by submaintainer: not
tested, broken.


Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
