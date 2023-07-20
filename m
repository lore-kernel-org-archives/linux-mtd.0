Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC718EB64DC
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jul 2023 13:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EpeauamGHDz+3KSD0J/PvgOg1O2ElRupMEhI2cnmeNQ=; b=S2B2BThZ5kTmLO
	50xypYYbuis03pHMIBJNl7aHjcePLE2Oafp4P7Q/9o+k/QU/XWu+cJzaehRjUBtlnDkvDGC/HnMLp
	Z/LM+FA67aOx8RKiXyMGEH+fk8SZXWRl9SWILeETQ23yu3PXuJ4oCD76zyIZC15bTdH/4Zc0h+Yl5
	vZmJEN2lnLh1LbyFF1cKYYb/NmIG9sMytaIiHIxSqhW01jPzycwv2jj2kegjQbUF7jot2STki7EYv
	ynKoOwyGOFpmubefHAGi+4oo4m55nB+hcZhBVI4b3dW7YgxPsHK2En4zUU3W23BZlQ3eF/CnJIjej
	hMSejGJ4/V7MguDuaCaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMThx-00BFkL-22;
	Thu, 20 Jul 2023 13:28:41 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMTht-00BFjd-21;
	Thu, 20 Jul 2023 13:28:39 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1b8a8154f9cso5905835ad.1;
        Thu, 20 Jul 2023 06:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689859715; x=1690464515;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=3o5zfhOrGvbkMhIZNHbLcgV0VOFO8KOUPcq8qPlAWh4=;
        b=II3kNkpXwPdcCl5YHO4c2SdZlaof4sRkgoc/bpxKmFONK+AnVHwT1l7cn4fep4l2pZ
         RKQPLK4YtMeQSGR5iqY/qohmxFaLzZ1ClUnoBaAnXkyj8ZtgLGPZrxlSRrbXTRR6JuFE
         1/XRgM2FIIeAEdO8c6Bnsmo11XN81iFNABpU1uWMfxl2AT70aV2t6lD+Lvsz3z0sVruD
         Uow4lWraZWjlX9pw2usWm2WakkdaoKw1c6bRllOiAPjWueKo+tDHsJogOPb38guW70UF
         VU2sVcwD6/G14KhffAcn6pAqokkebSFot2kkwvOG6VTqnh2LdN7nEmxQT8ylWbgSo4Lq
         gfBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689859715; x=1690464515;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3o5zfhOrGvbkMhIZNHbLcgV0VOFO8KOUPcq8qPlAWh4=;
        b=UtmmOdi+W2grX/wNn6bbvtBVucO0BGPKmbe5RrxiREACyL1VUWeCX4hiLOrYKPwHrz
         VN5hfz5O43fPw7vmq48KOIzwrMcMxSCOkJZJJwz6mS/chacewWTTm3MoUumGgJJEMLG5
         LeYC+s5bnAYSNXG9rvCgrIOXVkYaQtGJq2aO54aHHwZWw0EOibh4ag1IZeVRV2aL/IGJ
         WdAoy3fWZG3AkMP3mnSVRSNQB0Ks6TKuBrNxMLQ+2UaEETPL3wyZBYnHvAL1AEnOIWiK
         bTFY+x/d9DW3vaz6dwUIgtBdGsKBAK8L/R+5ZCaKUwYl8Nh98fmRR3NTKgQeZqFI3j/Y
         hGdg==
X-Gm-Message-State: ABy/qLY7ITj83O43K6XZvK64AKBIs1YOd5fvaw2D5b1POnKnjTErsAOp
	mENyx+b5d3ZfCZUOyGJs7b8=
X-Google-Smtp-Source: APBJJlHUPUivfHOgoXJP79qDNd5D4J3nF3SUABKNXv3IzHnbDE0pcAqJjXDoFhMrl2kqZtr0UmSiBg==
X-Received: by 2002:a17:902:c94c:b0:1b7:ca9c:4f5c with SMTP id i12-20020a170902c94c00b001b7ca9c4f5cmr6694496pla.28.1689859715396;
        Thu, 20 Jul 2023 06:28:35 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id jc15-20020a17090325cf00b001b5247cac3dsm1346340plb.110.2023.07.20.06.28.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 06:28:34 -0700 (PDT)
Message-ID: <def5b29c-3318-2db1-a7fa-612ed1e81be6@roeck-us.net>
Date: Thu, 20 Jul 2023 06:28:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 12/42] dt-bindings: watchdog: Add Cirrus EP93x
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
 Wim Van Sebroeck <wim@linux-watchdog.org>, Sebastian Reichel
 <sre@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
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
 <20230605-ep93xx-v3-12-3d63a5f1103e@maquefel.me>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230605-ep93xx-v3-12-3d63a5f1103e@maquefel.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_062837_668667_8CA67B63 
X-CRM114-Status: GOOD (  19.09  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 7/20/23 04:29, Nikita Shubin via B4 Relay wrote:
> From: Nikita Shubin <nikita.shubin@maquefel.me>
> 
> This adds device tree bindings for the Cirrus Logic EP93xx
> watchdog block used in these SoCs.
> 
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
> ---
>   .../bindings/watchdog/cirrus,ep9301-wdt.yaml       | 46 ++++++++++++++++++++++
>   1 file changed, 46 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/cirrus,ep9301-wdt.yaml b/Documentation/devicetree/bindings/watchdog/cirrus,ep9301-wdt.yaml
> new file mode 100644
> index 000000000000..d54595174a12
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/cirrus,ep9301-wdt.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/cirrus,ep9301-wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cirrus Logic EP93xx Watchdog Timer
> +
> +maintainers:
> +  - Nikita Shubin <nikita.shubin@maquefel.me>
> +  - Alexander Sverdlin <alexander.sverdlin@gmail.com>
> +
> +description:
> +  Cirrus Logic EP93xx SoC family has it's own watchdog implementation
> +

Odd description. Isn't that true for pretty much every devicetree
bindings file, and pretty much every hardware driver ?

> +allOf:
> +  - $ref: watchdog.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: cirrus,ep9301-wdt
> +      - items:
> +          - enum:
> +              - cirrus,ep9302-wdt
> +              - cirrus,ep9307-wdt
> +              - cirrus,ep9312-wdt
> +              - cirrus,ep9315-wdt
> +          - const: cirrus,ep9301-wdt
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    watchdog@80940000 {
> +        compatible = "cirrus,ep9301-wdt";
> +        reg = <0x80940000 0x08>;
> +    };
> +
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
