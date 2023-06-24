Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 157A6C04FDF
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Jun 2023 07:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kK9yHd//yn93csotKkqbu3w1mJCIiyuNpAvG2kp14/U=; b=jMasFl9U9TA+t5
	LGQHNm8za6twwdknzRTvKwu1uDhpbXnRLuCT33A3DISrvj2d3KOSETl6ER5C0ikprGfm801hjpzx3
	Dan40zlsjxu5l7dtaAJw/XDZWDnKVPrcQ3Zb8KkItpgp+o3eXLRvamk0B8LEVJ/ATJSdra4iLk5tj
	EyVhMaOcMMhsA65enBuzrOQKjr3TFnI8hG2BjixpDJRXEuR5wOuW1cIVNXBPrAnf7+g4jbZmtmsax
	QnwERD3PQgQuiV0t330XrZwddB42wEgxPDdvnQDKrpbD57swTVOGEQvdNrFj5xf0umZRN8qVxmJLQ
	fdbaamqGDCfD8nRIIUSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCyAi-005Tkr-1c;
	Sat, 24 Jun 2023 07:59:04 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCyAf-005Tjx-34
	for linux-mtd@lists.infradead.org;
	Sat, 24 Jun 2023 07:59:03 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-51cb40f13f6so815118a12.2
        for <linux-mtd@lists.infradead.org>; Sat, 24 Jun 2023 00:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687593540; x=1690185540;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2RPXidMTrzBctnlI68UKYA3FxvKEi+gyM/+eAniSxHU=;
        b=biIFt0+5HLIeQJNObq9fw50IfGs4F5DFXzw8WQaXnv6Hdp3USYZJNL8PssYy6o2vEe
         uTNazxcXxlW9nYoOgc1ECAXqLXI0Fy6OTpXxKHrO5KBGlvJvfFS0T1Yy1tTOfdnYqT7s
         cMkaa3hPEAmXD6ANC4ih3z1UVMiivHFKHKNCNhNRtq9hQ7bMkaNVdI+n4Hlx2BE7yzQO
         jx50D2lQ67d60SVIUDBnCbxdMAAwJOdFf8iKs6wYFG3VWtA2pwPKLl5H6eldXBBdXINm
         rY7xzFgOPvVvf6qqwYEsEXTKFvEIRltIXoBmYft7pQBxV4w1cue28E4Voq0fdjydEvEn
         MpcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687593540; x=1690185540;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2RPXidMTrzBctnlI68UKYA3FxvKEi+gyM/+eAniSxHU=;
        b=egB3n7cqocIdIhbM+BmqWH4bkz1oMZorVpWDP+Zh2X0F2UL2vZAYPSJ4zKr3EwOgFm
         tP42lMdy9sSAZXhRbutk3zgQZlyp3zlhnKjTrl15RjmCDCpvZMe3K2GhRkpOKHyYz9j2
         Af2TVTS7AyDrils7eLbc/KOvG2fnWBfnmQtf2AyxeZah+k0KqMfpimhcRHfe/W0korVI
         QLPurNkOsquY9JWW/Gzh+pHFlnGMKLsHiFYvJchxEp2e8PhQJ+63SjaFgdG0T19DA6Ck
         rAIDQ9NVLiyQqX4H5PsFck+k2gToLIFuEQL9IXlxEPpMawiirQ6uABrSfVjXYJC7Q/4O
         jnxw==
X-Gm-Message-State: AC+VfDxFVuDkFViN6mlGU37kND4GUXpzW1THl4MA15t9IkZe9oJyb8qT
	qmwNcojFYrT3GG9DnUiqCihY1A==
X-Google-Smtp-Source: ACHHUZ6KTEX3PoU0t4AzSkFJrRvYcc7s1C5vvyEb440YGE+szTSoYCbadoq/cw/0a/YYcc9DpVEdLg==
X-Received: by 2002:a17:907:a06:b0:974:1e0e:9bd4 with SMTP id bb6-20020a1709070a0600b009741e0e9bd4mr20928031ejc.16.1687593539714;
        Sat, 24 Jun 2023 00:58:59 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id l24-20020a1709060e1800b009783791b1a1sm592525eji.121.2023.06.24.00.58.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 00:58:59 -0700 (PDT)
Message-ID: <28a5d2e7-d3bf-d373-10ad-73c7590924c4@linaro.org>
Date: Sat, 24 Jun 2023 09:58:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 14/45] dt-bindings: crypto: add bindings for sam9x7 in
 Atmel AES
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
 <20230623203056.689705-15-varshini.rajendran@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-15-varshini.rajendran@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230624_005901_998878_0628A992 
X-CRM114-Status: GOOD (  14.01  )
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
> Add DT bindings for atmel AES.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  .../devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml    | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml
> index 0b7383b3106b..f0736696c883 100644
> --- a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml
> +++ b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml
> @@ -12,7 +12,10 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const: atmel,at91sam9g46-aes
> +    oneOf:

This is not oneOf.

> +      - items:

And these are not items. You just broke existing users, which points to
the fact that you did not test the bindings nor the DTS. You didn't test
anything here.

This comment applies for entire patchset - please test everything. I
expect v3, after testing.


Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
