Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8333C001DD
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Jun 2023 07:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t++qTLPf5uDH6b7R/0w3NIdmveE7uz0pEamL/XSZJbU=; b=TdbXS2y8sfgn8z
	Gv9iMDRISIc7FSI0L8YTtYcXC/12WsD9yMSkm7lNWcIzBcb/Gd5AqKfDAdvWIlu4UZKr7ef4cNlDK
	cf4SVL8dlv5IbO0HTEOjc5O6nKawmVyZXkyzOFoYhkJOxX/Fu37QI7Ai+jaGsbC3kmo/Pytgnpfdh
	nsrE6TkJlttVzua94VeKQjw2hnwfjLGCnNV/cZ1F/yJ1Z/pNQmzr5KGXLc+rSxaBFA48oSBkHQU0x
	/TdadMpsVIPB62XrRiPBRLnym7C6YzCCGQBhL4A76zxRkq7eCtf0hUqIFJpAMKWfqdeyR66GYskNN
	uXXP4W4Oz7vPY32v5X6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCyBM-005Tta-1w;
	Sat, 24 Jun 2023 07:59:44 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCyBJ-005TsR-1G
	for linux-mtd@lists.infradead.org;
	Sat, 24 Jun 2023 07:59:42 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-98bcc5338d8so158268966b.1
        for <linux-mtd@lists.infradead.org>; Sat, 24 Jun 2023 00:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687593579; x=1690185579;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0JmZczCbpOdE83RS1Jg0IHZhGZBw+0h6TxJ0xSKGXpQ=;
        b=R3QjgEeu0SyVI2lDD0gF/mGGjC5l0xnsrF0U9MS0AWWSj8UlJYzroCkC1cYsnjqZdl
         BzpLsrAuOKn29IaswtTcZdkJNSfWnQleG3C6ZdH9XWhRbB/SKyi8sCQGlFDwD6xsXGuP
         kmXmMzlN1dUYqxzKx8uwQEcphW3mVPAWM6Ex6Zk41Y1+4AHsy17OsciQHWMC5iqsCIQp
         xgEjDKsBw0XHepXwvs0wO7a1D5N7PoR7VcNjyQ3ZY2nJoTGH/Q/E8I2tlEh4XuPggliv
         39av2i6EtrySSSH4jPALRV1rB4Pltm1L//Y2Dkb6C7rR0iojQsrFOeIKnevRsMXfqE8t
         p0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687593579; x=1690185579;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0JmZczCbpOdE83RS1Jg0IHZhGZBw+0h6TxJ0xSKGXpQ=;
        b=NVjHqd/B7NlcrIti1q2+kDS5Tdx62+DyUI/8U7iouOja4Rf/8g2dMWJq+0QkNNg7LR
         tJONrYPO/x/QeNQv51WL8LAUnkNKpctqv6uaLt9URZJysrxJTlEDU3uM8p0D/j+XUvG2
         TaItcfMG9GUbG8NZ4qCunfnBrXT9XIFlMXAuSiVVtxXKmahcZcN3Pwqr0LRB9RKPa1rU
         w5etA3hJ5pVON16/KqkqxXH2cxIA257ys9EGE431XKnN1ewG5qo9uDIJeKcQuZBFSAyS
         LhATwqRU6Hn1Jyj08NTygVQJRD6D6n/j0zYk3aHEV5LhhNq9QA0z5HSDmPI+OGMYg4Dk
         Zhrg==
X-Gm-Message-State: AC+VfDysYQt50m7FI5JwCDJ/Bfwsn0oRuj/Y6FwTHYx0vrsGE80ARaRq
	m2e9mPj4h0F6PgVKxXlhdcdmtw==
X-Google-Smtp-Source: ACHHUZ7suzN5/2BEJw/pDsP2JF0ZtjamK/L1/904JX+bl8LiLRiewrvSQqyW/+nam/ghVhSAGJ3L/A==
X-Received: by 2002:a17:907:84c:b0:987:783f:449a with SMTP id ww12-20020a170907084c00b00987783f449amr14721000ejb.11.1687593579095;
        Sat, 24 Jun 2023 00:59:39 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id pg10-20020a170907204a00b0096f67b55b0csm598213ejb.115.2023.06.24.00.59.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 00:59:38 -0700 (PDT)
Message-ID: <efec9572-f717-ec26-0f26-a79fcfee27cf@linaro.org>
Date: Sat, 24 Jun 2023 09:59:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 15/45] dt-bindings: crypto: add bindings for sam9x7 in
 Atmel SHA
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
 <20230623203056.689705-16-varshini.rajendran@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-16-varshini.rajendran@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230624_005941_426826_A7B60618 
X-CRM114-Status: GOOD (  13.37  )
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
> Add DT bindings for atmel SHA.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  .../devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml    | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml
> index ee2ffb034325..6a54cb79b6e2 100644
> --- a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml
> +++ b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml
> @@ -12,7 +12,10 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const: atmel,at91sam9g46-sha
> +    oneOf:
> +      - items:
> +          - const: atmel,at91sam9g46-sha
> +          - const: microchip,sam9x7-sha

Same as in other cases, so just to avoid applying by submaintainer: not
tested, broken.


Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
