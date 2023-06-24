Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A330EB64DD
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Jun 2023 08:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zR0CmMvj9ftaqSGJub5fi73/JLUY94S75deTJ1TE9c0=; b=x1HSClVpYZV53+
	MCYWVNOw77f8nhRcnDsAMGDHGvG5S0kJDJqE5j30SpUzIpMaa9uZqqdMvBt86M3h8So6JilWdJbdP
	cuLIK/q1JbIJylmjb2GYWg1x1vJFw8dpDQF5617b2L16126cPVeodOx40MpVRFeS+a53+VhdZFsnj
	Nv7qE1/7M0+pDczEuX4qHzULBp9DvA6K6hYSq9qc2Y/KwxEoEZ8O6bPizKT1WtYHCHXxPGiBbGCPj
	BKuws9Hp+fb850p+D0j18Chb+BBAk74W5TbZr/AGHdQ2UXmvj1MjdRzCajJjiTzHsYWiImxe+cncM
	KLPMq+87sRNq+FO4ZPlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCyCT-005UGF-0f;
	Sat, 24 Jun 2023 08:00:53 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCyCO-005UDV-0K
	for linux-mtd@lists.infradead.org;
	Sat, 24 Jun 2023 08:00:51 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-519c0ad1223so1569621a12.0
        for <linux-mtd@lists.infradead.org>; Sat, 24 Jun 2023 01:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687593647; x=1690185647;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VmzapWDzimsSs6oDauhmY7EwCGGpNbBGYW0zDq7Y0g0=;
        b=f5y83YDj2ZiTfv4GVL6XxhbaBiZOx8b2Dlce2BicSyjaKrg3kDy5bYdkvq4WYHDMz1
         Ux3eFKLU2XtW4NjNZu+3nofzPI6tApMEkrFij9agnP/0hLWMMo+HXTmVe4fIFHF7hTae
         SrSbgYuAOfTU+0JPddM5gmK/zaeXnm72JG7Uipl4neBtSGAQLTKpx5MCjVYgls6+G4NE
         H1Ec0eBTsmzlMz3qMbR91RzwyYZWUEUywL/5K07LC2PXw/FMwvaX6+z0Y8njTfC252LU
         Mec49oeKqIlgUkZU2Gfp86uWtTbkzHTzl1xyRp6Iv4f0UPBejvrofeBtdZUrrjTWxCdp
         0zgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687593647; x=1690185647;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VmzapWDzimsSs6oDauhmY7EwCGGpNbBGYW0zDq7Y0g0=;
        b=WxnDbh/unwiqSL/L6e+0fV4tp5cABScbOEpjDlWdjpxHdmMmBbLy2uDVm0mtdlFZzD
         wtM2G7LYbBdQb+XdzjKsd5UWicX+jd2O38NKCBsN2gR/El8Qis4Lp9gDe4e0T4sHWgY9
         HPH2Ps6tpGJx8EyOKPKcdDoiIu2LfmAMotxRK9sVaRt9WzAtKOQXegcp1gPuZ8K9w/C4
         lxWqMqGFMWrLZ8Yfx2n8BpNkwz9Fp6gpB9x4YdPOTjGwwoclbPf2NOGYuwcdsrkeBy03
         sQ23OMm7Y54aRnurx4PHys745EuC/tgb1nqRcyH4daq5ttAtF83HrIjjEyRioEvirST+
         CifQ==
X-Gm-Message-State: AC+VfDy3oxYUDhlIsZhgiR84wc5fdokRhn1Sc+OKniP4ZHL56MexTuqS
	7j0CLwbZrawX9/ZcXRilOCvpGw==
X-Google-Smtp-Source: ACHHUZ7m+A1bOO2g0Q0gWubK6hkpG4u9CftsH8A5UeM6HKS2e7gJgZ9D0w88xvVVqU6mCdiqpCRT2Q==
X-Received: by 2002:aa7:d892:0:b0:51b:fc05:a6aa with SMTP id u18-20020aa7d892000000b0051bfc05a6aamr1674326edq.42.1687593646698;
        Sat, 24 Jun 2023 01:00:46 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id b10-20020a05640202ca00b0051a4ab66d92sm410131edx.11.2023.06.24.01.00.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 01:00:46 -0700 (PDT)
Message-ID: <f2ba9ca6-ce6e-b012-d43c-f192a6043a42@linaro.org>
Date: Sat, 24 Jun 2023 10:00:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 18/45] dt-bindings: i2c: at91: Add SAM9X7 compatible
 string
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
 <20230623203056.689705-19-varshini.rajendran@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-19-varshini.rajendran@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230624_010048_142285_D233A1F0 
X-CRM114-Status: GOOD (  12.10  )
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
> Add compatible string for sam9x7.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
> index 6adedd3ec399..440f890e209f 100644
> --- a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
> @@ -24,9 +24,11 @@ properties:
>                - atmel,sama5d4-i2c
>                - atmel,sama5d2-i2c
>                - microchip,sam9x60-i2c
> +              - microchip,sam9x7-i2c

Same as in other cases, so just to avoid applying by submaintainer:
looks not tested and not working.


Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
