Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E22C001DC
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jul 2023 14:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=phbjfTu+so1e9Q1LRMRXk/6OPmaqc5JLhRpGnweJ7Kc=; b=VOVD8GhNHxtNQR
	5pQj6miGY6dcTM/Ig+LyVHPd3Ze+MUulgKRVwckEnc8kfQkDVvor7ufkiZACIvFU1v2SLYS6GabKc
	4oBI3xt7YJfKCSNcIAlwXusmeDLul4XIfMRLKsPqxmVG+pqhzqS1YEZ0YUCZfupdbSoSo9zQB7HeY
	qCZBGmgzpNCYc0jmmBU8vLu7P1tEOyezo7WDA02t2pOsCwCZE2xxpj2HaosMvOFPD+4GUbU3bJCbk
	yvflYBzulxaU+HQzsPZ8kjoB7JPErYci+e+r0KvxXdyNW9yCNPAG0RqOzA/6egJq07LOWIKA8sFAk
	em+41/Wcti5oIreAZNbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMqnX-00EEpE-1n;
	Fri, 21 Jul 2023 14:07:59 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMqnT-00EEoA-23
	for linux-mtd@lists.infradead.org;
	Fri, 21 Jul 2023 14:07:57 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3fb4146e8fcso12644755e9.0
        for <linux-mtd@lists.infradead.org>; Fri, 21 Jul 2023 07:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689948473; x=1690553273;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y2qkUshKHVzVp+c/Y0demp7gaQXxbXWhnsTKXjZPyo0=;
        b=UywUc+C0GWGsJmsnwwyJfmenKpLuppCyVgn7fiVYk6w8oSQSyUPADu9CVzT0lItaIY
         JormQX7Bee7HUdM1Us0r3vshqvTW9dDS77pz9B/D2/ZA9svRp6qlgOzmPqZwXZh6JV1/
         jFAXc0VCSjO1FhzSB/42DbWYEZLCPHvRoJtnZSW/6xd3CWsvpKl50jxs8bWH4bIonPhx
         mfuI8ES1EO+wJ7wjJ7D30ET7A/S3K9wdVKebziw7EOvtZk48W3EgUDtaXZXX93H2sArO
         cOiSlGVXpphHHUVrTWcN6efAAohsXSYhMb2r+xKhHw3ppirNHnquGubX9HEPBDh6NwUV
         LT/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689948473; x=1690553273;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y2qkUshKHVzVp+c/Y0demp7gaQXxbXWhnsTKXjZPyo0=;
        b=T/Q3WG62Ns9K/baN4Ls++V0eZ6YslLgWSpRuPG28D9b98rNcIYEUG4kyGdRS5LQViL
         GVOWXgJGUpmeK0+4lvVR1NZ/sWqep/UpEothf5ljBky8oe2GYegtuUr3FbQ6Jjg4R49H
         tnki0wgLAJxv8XrUhPNo3F/msm3cgkk/MbJb+0YZPp9lk84EUhCk1sDoirUA+2rBel/9
         7SnDOp5tJHcNgIJMcsXcKY/whE0eQC8sXIAYjac0ndB/WBChIgiYoRbVzM9wMn9ORNn0
         gsfGfc5ych0BpBHP2eINl5ZByPYsQxPAA3vSLkIto9HceiUBxmDFXFUCgBmcgLccmLIw
         O64g==
X-Gm-Message-State: ABy/qLZHSWnoTepra5bdBMbavMfrSaY5jEm59qIfHtvHh2JgnHqcTL3m
	SvimxJEUqBNx9/8UKqqzkgjsWQ==
X-Google-Smtp-Source: APBJJlHD6QFq7rMNB+KGBdqcP5NQHt4EfBmeBFQNK2CYYyWBzSCftYAyfr7ps7sa61qFYb64TkY4Cg==
X-Received: by 2002:a05:600c:1d1b:b0:3f9:68f:9c1a with SMTP id l27-20020a05600c1d1b00b003f9068f9c1amr7732579wms.15.1689948473091;
        Fri, 21 Jul 2023 07:07:53 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id g9-20020a7bc4c9000000b003fbca05faa9sm3387097wmk.24.2023.07.21.07.07.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jul 2023 07:07:52 -0700 (PDT)
Message-ID: <3267b625-4597-7658-9faf-800862ca07a5@linaro.org>
Date: Fri, 21 Jul 2023 16:07:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 10/42] dt-bindings: rtc: Add Cirrus EP93xx
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
 <20230605-ep93xx-v3-10-3d63a5f1103e@maquefel.me>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230605-ep93xx-v3-10-3d63a5f1103e@maquefel.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_070755_670859_A736E065 
X-CRM114-Status: GOOD (  21.42  )
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
> This adds device tree bindings for the Cirrus Logic EP93xx
> RTC block used in these SoCs.
> 
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
> ---
>  .../devicetree/bindings/rtc/cirrus,ep9301-rtc.yaml | 40 ++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/cirrus,ep9301-rtc.yaml b/Documentation/devicetree/bindings/rtc/cirrus,ep9301-rtc.yaml
> new file mode 100644
> index 000000000000..63572c197e92
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/cirrus,ep9301-rtc.yaml
> @@ -0,0 +1,40 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/cirrus,ep9301-rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cirrus EP93xx Real Time Clock controller
> +
> +maintainers:
> +  - Hartley Sweeten <hsweeten@visionengravers.com>
> +  - Alexander Sverdlin <alexander.sverdlin@gmail.com>
> +

allOf: with $ref to rtc.yaml

> +properties:
> +  compatible:
> +    oneOf:
> +      - const: cirrus,ep9301-rtc
> +      - items:
> +          - enum:
> +              - cirrus,ep9302-rtc
> +              - cirrus,ep9307-rtc
> +              - cirrus,ep9312-rtc
> +              - cirrus,ep9315-rtc
> +          - const: cirrus,ep9301-rtc
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false

and then unevaluatedProperties instead.

> +
> +examples:
> +  - |
> +    rtc@80920000 {
> +      compatible = "cirrus,ep9301-rtc";
> +      reg = <0x80920000 0x100>;
> +    };
> +


Each of your file has a trailing blank line.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
