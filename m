Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F73C001DC
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Jun 2023 07:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PKpWw84AZA36kHiopxRvcxro0aJ+AGBEkLQy+1xUdCk=; b=XBej3JtO7087EF
	I0AXogR1jcFA7j8RUFWi/jqtV/9DjeqbbC+34DDGKQ0cXMii6/PKGKEsfn/eF17aUv1nZCr5J+QCX
	wX8KKW8YSTTWc5Yi9+etAvFitHFY3212iEF0Cm6Mp5mid6B+5k+MGHkqTjl44wZSzECza1984Ww7x
	QPxDViNRzy4Q6IWul/pxXik38JEXZEdfPzOvf9/CELfafL1jqV3kF6b5Ju2WzO/KtpPhyaMPvL7ml
	LB3SF3KTRXzJrigQYtiWMfOpCAcfmv5Mz/q3ATVaNocHqJrsSfjo19BtuAs4fXpgIepOwhGJ2o5st
	/4SQvcus7mIBTkjIfP+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCy5S-005SjS-2P;
	Sat, 24 Jun 2023 07:53:38 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCy5P-005SiB-34
	for linux-mtd@lists.infradead.org;
	Sat, 24 Jun 2023 07:53:37 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-988b204ce5fso163649466b.3
        for <linux-mtd@lists.infradead.org>; Sat, 24 Jun 2023 00:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687593213; x=1690185213;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d0dU3KHDoF8oZzutBDKpvFK9O6jXuVzZS7UeXmnvOCk=;
        b=qL+14ZF0SFDS92k57he/MqJcbZWj42LI8iTDe5f6UYIF6jj69Jgr0nJO9ZKFef0TUo
         97WraEyayeMo+lJuOUrJK7R4eJVDqCzjfRmhLG3P8cyutMpOzOWG/lQIHosPAX4ha2E9
         zMU/72ZWCKk3PZdPbJDC10ZHfV68fkWiuDOPnvDrzAWl4ttHZ/GP3O4Ox1Q1s9xdYpYS
         2KSNZFsLSyFMd/9XzPC8BdcOaV+EvQg7dZxPuDxO7s3T8cuSuKYXpGtE7vaH7AQxM9f4
         bJAsKHAKvYjav2XjXHTrmIboFnd594b8tp61wr6olfTnGaBDiPapYgy5Df8wNpjx/XnY
         9F1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687593213; x=1690185213;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d0dU3KHDoF8oZzutBDKpvFK9O6jXuVzZS7UeXmnvOCk=;
        b=ULUZTrh6K2Bxm2+oGO2k4VsZ2ACOKSXnY8avqHfpVm8T/S8/AZokh6pYfaVN459SOK
         Ltn30eiy90k/5LTXcdFeIrJSApmteq4fqh6HU5kpSr5vZoZqGTAUTsL7K8bDU/LMxwCi
         0Ldr6910oz+4owxQJ0l/yROC5JqeTMhWoHmYfBzXobLYeYlf7sPAI7WkCsr6YF0zZ8VZ
         KY/saz/imQVmFOuwkKsFfa3Rh1gb8v4P3Eqm3HjWyytNIeubFijwtWgP9vtJgUbQG2uj
         Iu+FO/oyV8Wx57JJaeIRq5luF4ZVAlkTIf3Mde1PeqVyjV4Ur+xcVmbqwqv9h38fILWS
         HpeA==
X-Gm-Message-State: AC+VfDyq+gIH18f8rgqfyuzg3xiXMtk8Zcj4jJ7um/Me7g3vDyz6Yfk+
	xHMZ/6XRhIhnVtZBTl3f907bVQ==
X-Google-Smtp-Source: ACHHUZ6rxF9D2gin1FtwSBjnqHQU40ChmXYOoZkfDSe/Nou9AC2VX7R26o19SB77+MsKurZ8l61ESw==
X-Received: by 2002:a17:906:7a19:b0:98d:b73b:b5f2 with SMTP id d25-20020a1709067a1900b0098db73bb5f2mr1706603ejo.71.1687593213726;
        Sat, 24 Jun 2023 00:53:33 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id g25-20020a1709064e5900b00987e76827b2sm602028ejw.53.2023.06.24.00.53.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 00:53:33 -0700 (PDT)
Message-ID: <8574bbcc-2dfd-3fed-ff4c-cab1f6e79f7b@linaro.org>
Date: Sat, 24 Jun 2023 09:53:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 02/45] dt-bindings: usb: ehci: Add atmel
 at91sam9g45-ehci compatible
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
 <20230623203056.689705-3-varshini.rajendran@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-3-varshini.rajendran@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230624_005335_989172_A2A1243B 
X-CRM114-Status: GOOD (  10.99  )
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
> Document at91sam9g45-ehci compatible for usb-ehci.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  Documentation/devicetree/bindings/usb/generic-ehci.yaml | 1 +

This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions. However, there's no need to repost patches *only* to add the
tags. The upstream maintainer will do that for acks received on the
version they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540

If a tag was not added on purpose, please state why and what changed.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
