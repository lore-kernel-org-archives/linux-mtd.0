Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65836EB64DC
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Jun 2023 08:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zja54q3sD58tt7kGovzC+sOKvNtSeTHQokmSzencljo=; b=R17lGqT0LKIOPv
	xyElW7974VVP75q7xHdmvDMIgmSd6zIcXpG688L+akRycxKmJvuI88ZTEaB4qsVCNHxbstt/siuBx
	Zwm8FDlOXJpLavgqhjbBXBs4SOdqoyj0FIZohwgV8MN94wubGtIr8516bqxUWz4hK+UuaUQh0uqrx
	+S4grywfVVBjKI5bH1w2HTX8Jvz2PVYoIy7SS8y6M6k2cpyLYt/I1qh9dEcPcDl4ohL22tUpBphEq
	4ubWbFwecLCM2M03F823+mX3Rw2fC+0/Nm7hQWiRqO3u3eF4CZrQ/6DDjj3v8amMljLE9/jhCh7zF
	bzQz2vu8ptCr2vX5kwNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCyYW-005XU0-0r;
	Sat, 24 Jun 2023 08:23:40 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCyYS-005XRs-29
	for linux-mtd@lists.infradead.org;
	Sat, 24 Jun 2023 08:23:38 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-51cb40f13f6so838221a12.2
        for <linux-mtd@lists.infradead.org>; Sat, 24 Jun 2023 01:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687595015; x=1690187015;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iw/ywJG51HUTwkPghusRkjWUXteVCmP/Fv5gaFgQqkU=;
        b=IsOfPPALsc6kgiSVlUoR59ZJkgFCtFF5TGUwt1sbTFoWRMQOqCvWPTIR5S4VBZ7wwO
         U+Tfcj6D2UZWfSg6R9maL5SVaczzgRsCGFn3w3hx97Rmn0RbCb+dz8mN7fo1OhBYO1YQ
         54oNjUFMACNKqmgtbF97PqAckUG/2az/K+ImnC3CequpWgOAVohV3SkCnVPNu1hfXpIY
         qSBKOgbw6rHxDUkAQDvMik5GXkFpd4yw9FALSXz9sR/ZAgWV+QM0FhTv8QIuM4SSMc+2
         /nbK/R/EUUxlTLqExeuaZfJ7NLx2+2g0GulfxjKCtNGXlBg5sxnH4072KmidxffszrB8
         88VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687595015; x=1690187015;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iw/ywJG51HUTwkPghusRkjWUXteVCmP/Fv5gaFgQqkU=;
        b=h4hGezr0BnE1CyD8rKnKTL3IRo59hfIXVcawuliOAKq3pv5OA0BhdkQmKWDR31IyjK
         3nuQeT0fnoltxjqrD50B2G/dd74RkzZhoFFgdXT3tSbAD6E/Yd+VlSIEdwLACc7N5PGQ
         R4jjSmaYJ3liOcWaWSNAauDxIX1KaghEK4lsXqhqunGptvxfN4bxqpFICupVLSr9k65L
         iCcYQzZ3uszTI+WnUwB/OgF73Wp5Y6Gk3zdok+uozlSegqplBOKBnP/dHhVmEZaq9uBs
         TGcZ1PNu2XlJBVbWJGAX5ADq+lEbn5GtgIZepOJU0bwTi86b1mlInE0dmG1RiXPRqURz
         KoHw==
X-Gm-Message-State: AC+VfDwUM/H9CDqLmhmjpndZfva/ka5HHJWzSQsAfhabK4eEcO6xPDK9
	2Bz+M6IqWYnBva6DhVJYL2bvrg==
X-Google-Smtp-Source: ACHHUZ43qIJ7DSZr3vq3pOJ8EpVNA3z/s2kop3/I0gBWTVNNyPwlCA/pGa/4aeeS2b9dek8ZmCoz3A==
X-Received: by 2002:a05:6402:550:b0:51a:543b:2c8c with SMTP id i16-20020a056402055000b0051a543b2c8cmr11889190edx.35.1687595015160;
        Sat, 24 Jun 2023 01:23:35 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id m16-20020aa7c490000000b005187d2ba7c1sm419224edq.91.2023.06.24.01.23.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 01:23:34 -0700 (PDT)
Message-ID: <e7f7eab2-7fbc-99ae-641b-075ff0610127@linaro.org>
Date: Sat, 24 Jun 2023 10:23:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 19/45] dt-bindings: mfd: at91: Add SAM9X7 compatible
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
 <20230623203056.689705-20-varshini.rajendran@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-20-varshini.rajendran@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230624_012336_704072_8B9BD0E0 
X-CRM114-Status: GOOD (  15.26  )
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
> Document sam9x7 DT for flexcom.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  Documentation/devicetree/bindings/mfd/atmel-flexcom.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/atmel-flexcom.txt b/Documentation/devicetree/bindings/mfd/atmel-flexcom.txt
> index 9d837535637b..449e0af93a13 100644
> --- a/Documentation/devicetree/bindings/mfd/atmel-flexcom.txt
> +++ b/Documentation/devicetree/bindings/mfd/atmel-flexcom.txt
> @@ -5,7 +5,7 @@ controller and an USART. Only one function can be used at a time and is chosen
>  at boot time according to the device tree.
>  
>  Required properties:
> -- compatible:		Should be "atmel,sama5d2-flexcom"
> +- compatible:		Should be "atmel,sama5d2-flexcom" or "microchip,sam9x7-flexcom"

That's not what your DTS is saying. NAK.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
