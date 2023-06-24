Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D4EC04A6A
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Jun 2023 08:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BwLaTi6FT8iQxX7nyeELBPUdZxpsoqdakfhf0a5wuNQ=; b=trigLdtwpXAmkX
	yJuMTQPwFzO9s7wbauYuW+mtHLf5UXFfWBCTXNum4FIiukvSTkoRGVtM2yw/qgKZ8YHq1g1tkVXzK
	19Z6D7i8NlWMoCClBqcoPvl0hvPxzEGfKYqfUUPCySvUL6A14NjaYBHJIdpDejmEV84NJnl1K0AD7
	kMe8GBGbRfndXNE5E114jzTFMCjSJjhOCqecSkKEv/wyp/0K5srhKiKj1sZpSkV0vok14+l92Hy41
	Hd3zkc8smu626bomlIT5+jUuyzHhgzsnIDqE6UzSpYXfolE30F5ILxajGgaPgm3k7Mmpc5xV0dxkK
	uAl8+SgArkXpMffi29tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCyEV-005Uxa-2r;
	Sat, 24 Jun 2023 08:02:59 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCyES-005UvF-2r
	for linux-mtd@lists.infradead.org;
	Sat, 24 Jun 2023 08:02:59 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-51d894b9b6cso14934a12.3
        for <linux-mtd@lists.infradead.org>; Sat, 24 Jun 2023 01:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687593775; x=1690185775;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Iag/fpvBDJ2RXwvleWT0ikdFf9vbvKuSWx8X7Un5jE=;
        b=bL65eKa13a0Hm/MQeDCju8xFmloMMrsquSTzxhwgWCUXUcWun2nHn0vSc6x7bTfuI8
         T3cr6eRZjgEb4z7lgrSWZ8+sV5BU/fmg9oE5SWx1qgy7BXrGcVNwNMAx8oyZ5G/1mX6y
         biBFZSvfqAOar3HTF8F8YOyBuHrvQtKXCOcwx2eEHbNMsBQWw2SV5EftCW2E8UTvuSgh
         PhApvRgechvpb2xu8BDjP/67MnHUUJnByOEfixy+DqNfzf+xFAmpqQuElR9rsyyZ5Yi9
         //dtU/MCN75LteZeqX6d6Oaw3ZJXBYj0Au3b8dTa2vfcFOPx/eq1YiC5UTVn3SyRtskC
         lAFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687593775; x=1690185775;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Iag/fpvBDJ2RXwvleWT0ikdFf9vbvKuSWx8X7Un5jE=;
        b=l6Cu6gq6lB7RG4369oCvx9bz4gkHSpiZmtYLHA1fE4vk+Iv025IiO+jkm/KiTnkUF1
         Kyq+IVE7sYPnJv6DMkVZS/4p4SSOLqvDHdCjRMRbGWSriCg+an0KJegVY4Tpd6LDzGAQ
         jhRQEsqgG5g+LI28urxuI9PfUdmOVQhhU1qr6UflEKV6FfSBCDN9JJdKzIPLd8G+a02w
         a30XYWvVCX4twwlTnmuY90E2WAh+G7+RqdFAZeZh0iVcJLMnVD6KufyxsvtnvPyl1rZT
         4dVLSVXfzVuyUMpZL5P2VfU2EHcPsHUrmssZPhR3FAiSF6jWmt4ypQkPkypptVGRuWmM
         7dtw==
X-Gm-Message-State: AC+VfDz0xVGHMZVEGZAsI08sJ5NXbWE5lI8pMjXt7Me3LfLDr8z+V9jN
	Tm+h9YY6KWB0I+HubUE819ZsBA==
X-Google-Smtp-Source: ACHHUZ7CKo9kdIl+tQ6Se/8eLHNmDYA9AGuCXJ789LFfXORFWgCt90zprUQSuv47ZiAbLMJtW4DImw==
X-Received: by 2002:a05:6402:4c9:b0:51a:327d:f065 with SMTP id n9-20020a05640204c900b0051a327df065mr16466115edw.13.1687593775059;
        Sat, 24 Jun 2023 01:02:55 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id o8-20020a056402038800b005183673f2fcsm402109edv.69.2023.06.24.01.02.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 01:02:54 -0700 (PDT)
Message-ID: <0492a8a3-6272-9ef8-07b2-d7d05b2f62e4@linaro.org>
Date: Sat, 24 Jun 2023 10:02:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 32/45] spi: dt-bindings: atmel,at91rm9200-spi: add
 sam9x7 compatible
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
 <20230623203056.689705-33-varshini.rajendran@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-33-varshini.rajendran@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230624_010256_929028_BA4C9F6C 
X-CRM114-Status: GOOD (  12.15  )
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
> Add sam9x7 compatible to DT bindings documentation.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml b/Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml
> index 6c57dd6c3a36..bdc42eeacba4 100644
> --- a/Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml
> +++ b/Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml
> @@ -19,6 +19,7 @@ properties:
>        - const: atmel,at91rm9200-spi
>        - items:
>            - const: microchip,sam9x60-spi
> +          - const: microchip,sam9x7-spi
>            - const: atmel,at91rm9200-spi
>  

Same as in other cases, so just to avoid applying by maintainer: not
tested, broken.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
